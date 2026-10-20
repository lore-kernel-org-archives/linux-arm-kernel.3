Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BA360A263E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S5mKLTOJ;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XJvPpY/z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E1wQ0lQppwgJy+LQuVEEB2dNmxOpABDONeSzv3dOwiw=; b=S5mKLTOJxr3w/xfPMSoWaC1AUQ
	awkHJzcsPG9yj7nHuzHowQtKGyFH+6msglLhsL8SfO4XPQ7fp/3qfliQfuXu9XfK4dXOrBI6yCZ19
	2vo/i5E92HPf9yvI5eVd5AXJl1KRwYfMf3Rfa0lM9i9QAV2RG7Xuio3uDWqt6t3qQiL5IkT2l8Brl
	iqrLkkvmtbZ9Ah6SVZe/zBDOKx81D2IeagmUdnirzaXtILI1BuD/7+dZ90n29C2c6L20bGGI6m58U
	BHvZ2sXfQ+QLgpEsRK+9xqI8c/TQ+O10sTRwMboVuuTdG8lfOcVU9yrIxEWg6+6B2q6fMjOHlBYMb
	QLjHdYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvS-00000008jOk-2wpN;
	Tue, 20 Oct 2026 02:50:06 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzvF-00000008jEh-2Gqg;
	Tue, 20 Oct 2026 02:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=E1
	wQ0lQppwgJy+LQuVEEB2dNmxOpABDONeSzv3dOwiw=; b=XJvPpY/zGajeEENbR6
	Ve3sdXt5s3zTIuWSmMoSmtoinqZxXAHsIyOt4IBYg7EpHopHxdiY+r3iYsH6Yg8s
	qNjt1keD5GVJZ5FFhF0W1EPqCLRRo0qIVjdb6Rijn8z/l9h1Jy0qwgREtNKwYJbx
	MyrkDKGonIenygWh4lGuFpASM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnr8C+1tZqMLhIBA--.5123S2;
	Tue, 20 Oct 2026 10:49:36 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Money Wang <Money.Wang@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Elwin Huang <s09289728096@gmail.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/7] wifi: mt76: validate mt7996 MCU responses
Date: Tue, 20 Oct 2026 10:49:26 +0800
Message-Id: <20261020024933.3205681-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnr8C+1tZqMLhIBA--.5123S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry7ZrWUZF45uryUJFy3CFg_yoWftrg_Zw
	4vyr98Xr18KFWDta47K3srAryxArWIyry7C34rtF15Jwn7trWjkFs7Jr4rZFn29F17tr4Y
	yrnruay8ZwnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8S1v3UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AA2cGrW1sA0ewAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194953_933835_76757D86 
X-CRM114-Status: UNSURE (   4.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several mt7996 MCU paths trust firmware response sizes before reading
receive descriptors, fixed events, or variable data. The asynchronous
IE countdown handler also walks firmware TLVs without bounding their
lengths. Malformed responses can therefore cause out-of-bounds reads.

Validate fixed response fields and payloads, and constrain the IE
countdown TLV walk to the skb.

Jiale Yao (7):
  wifi: mt76: mt7996: validate MCU response lengths
  wifi: mt76: mt7996: bound IE countdown event parsing
  wifi: mt76: mt7996: validate EEPROM response lengths
  wifi: mt76: mt7996: validate free-block response length
  wifi: mt76: mt7996: validate channel MIB response length
  wifi: mt76: mt7996: validate temperature response length
  wifi: mt76: mt7996: validate RF register response length

 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 97 ++++++++++++++++---
 1 file changed, 85 insertions(+), 12 deletions(-)

-- 
2.34.1


