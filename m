Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6227C606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lsETQHFq;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mpm4fxb4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jhv8/rTp4UvkjzdJMvn38hW1Gb1uR8cATnvLgA89dE=; b=lsETQHFqryyjJ38x76y3IACb6u
	06rM2IC4fBR4x8LdpdSh0lWIl04Hi7GP/2ruPfza8ksjs3eRUAUaxHf0Iuc2mCFlXjBjTRFS5K0qq
	8dn/epJTM4CamQ6aJlJ7bXimoXXP6otv8vNfkwVFylLWwQH4vR9FMnCx+KO+21ux903OUoJMXi18U
	3U430VSSYtvePS5XcTN0aSlvjeI3Iasb8fuNOdW21wbROUffLqyb/wrrpQxR2M985iN8uv7C5uA5S
	xH9Hhc81B1fbjX8f591r+Nd/1Ino+C1XY3jIzgzCDE9I4rIbtaVMNFrEbfXxe/YBeNxj7n3IAtr1C
	WYjCs6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzs0-00000008hyi-1Ohh;
	Tue, 20 Oct 2026 02:46:32 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrb-00000008hfv-2EpC;
	Tue, 20 Oct 2026 02:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+j
	hv8/rTp4UvkjzdJMvn38hW1Gb1uR8cATnvLgA89dE=; b=mpm4fxb4Tk5sW8/z80
	jz/pj3mbDrnxQQeJd261MHATcgw0XoQp2eq+PA/xvqCUHEvrYH2OtkL/IPjMnBSD
	NAt/jwoeDO5uhmpq5h1HTYWzDOiLJzu3H6orkfzlINitUR8ECunN4kRcgzYPMleK
	D1Ix0uRHN9cSYn7TEoDl3UuOA=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S9;
	Tue, 20 Oct 2026 10:45:56 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 07/11] wifi: mt76: mt7925: validate EEPROM response length
Date: Tue, 20 Oct 2026 10:45:39 +0800
Message-Id: <20261020024544.3101738-8-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024544.3101738-1-yaojiale02@163.com>
References: <20261020024544.3101738-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S9
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1rAr15ZryDKFy8Jr4Dtwb_yoWkXFg_ur
	1v9rn7Jr18Gw1UKr42yF1furZFy3ykZ3WkCrWrtrWSg3y7JrW7urZavrs5GrZF9ws2vFW5
	Cr9xJa45ZasxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbW8BUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQT+OWrW1eSC4QAA3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194607_946220_4CCBCFE8 
X-CRM114-Status: UNSURE (   9.28  )
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The EEPROM reader indexes the response data array without checking that
the complete firmware event is present. A truncated response can cause
an out-of-bounds read.

Require the complete EEPROM event before indexing its data.

Fixes: f2027ef3f733 ("wifi: mt76: mt7925: load the appropriate CLC data based on hardware type")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index ce860e63a108..e5cacb12d367 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -887,6 +887,10 @@ static int mt7925_mcu_read_eeprom(struct mt792x_dev *dev, u32 offset, u8 *val)
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < sizeof(*res)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	res = (struct evt *)skb->data;
 	*val = res->data[offset % MT7925_EEPROM_BLOCK_SIZE];
-- 
2.34.1


