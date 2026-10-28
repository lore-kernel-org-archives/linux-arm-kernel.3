Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAEB606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gjXmCpYC;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=D0zYKSbl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MEd5yoolpftLGplkK7bcv5qF6vsCs9gM+M90KSk629c=; b=gjXmCpYCroqVirX1MnsOtMsaGI
	/8Ynilg/DqojBjq/++lM6B3HiKZidjN3xDo08I8D58PQzVvT5GueAz89roTDxDl8dltH/pReHcHIU
	cBM0h1PxGIXy2nYML8arovNJmoUi3F210WEcR0Qmc2o55Q9mh5cowFdE6k4yjSDyhlo+ZDTtdm8ID
	n+cHr4yzQX7C05b9nNu2DSmDepbnkzRaEwak9mGV0vM+WRVDX0aHNlVNiibKzemp4t0v6m6Mri4yh
	DwkzvhbZO+9u5Bu+aEpI/60gKHVDmtj7N45ssnvMUbYFAxS6MUaeNJmm6UruhIJsA77h5RziaJn7I
	n9GtE94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvsy-00000006LEb-2H9s;
	Wed, 28 Oct 2026 05:07:40 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvsv-00000006LDu-0czB;
	Wed, 28 Oct 2026 05:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ME
	d5yoolpftLGplkK7bcv5qF6vsCs9gM+M90KSk629c=; b=D0zYKSbl6lJIdDjoPi
	WX2V+iILXVyAhyf2nw2o54mhE2BbIC0pW5ZJ3j88y45R4S0TEH3Y+F0vTiC+j1UI
	qMlo6/gbCvF9W3qPoQ5rQ6+QX/9ISVcCxwJOnMfKWBVYp27WnPAZscbhnP21/iZI
	UlJcJZkE2aO0cRcxvolz9fqZs=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDn31cMg+FqswGRDQ--.35366S2;
	Wed, 28 Oct 2026 13:07:25 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Nelson Yu <nelson.yu@mediatek.com>,
	Mingyen Hsieh <mingyen.hsieh@mediatek.com>,
	Rong Yan <rong.yan@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] wifi: mt76: validate mt792x firmware TLV payloads
Date: Wed, 28 Oct 2026 13:07:19 +0800
Message-Id: <20261028050722.135598-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn31cMg+FqswGRDQ--.35366S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr43Ary5Wr17Zw1rGryDWrg_yoWfAwc_Zr
	yvyryqqw48GFyUtay2kr12krW8t3y8ZF1kZFyrtry5AryUAr1UuFn7Xrs8CFn2kF4Iyry5
	KrnrWrW8JwnagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbIPfJUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzg32MWrhgw33qQAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220737_997476_68132785 
X-CRM114-Status: UNSURE (   5.86  )
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

The mt7921 and mt7925 firmware event parsers validate some outer skb
lengths, but several paths still trust type-specific lengths before
reading fixed fields. Malformed responses can make the drivers read past
a TLV payload, and a zero-length mt7925 capability TLV can stop progress
through the response.

Validate the fixed and type-specific payload extents before consuming
NIC capability and debug message data. Each patch covers one independent
parser and can be applied separately.

Jiale Yao (3):
  wifi: mt76: mt7921: validate NIC capability payload lengths
  wifi: mt76: mt7925: validate debug message lengths
  wifi: mt76: mt7925: validate NIC capability payload lengths

 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 41 +++++++++---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 67 ++++++++++++++++---
 2 files changed, 90 insertions(+), 18 deletions(-)

-- 
2.34.1


