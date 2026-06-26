Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED31ECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 04:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGDjXzO/Kgw4tCnEcKT4FON97bshhQUd6E32yM3Cz2E=; b=xGxWJDzzfG952xxvYQsAatUwP3
	oZDo4Z8MJ/QWLB8ctnC3zx+eOQPE+0vS2y5lrcd1fI1BP3P5DglmTTQ0I3eBhNRzAoNCkwM8Y4U7k
	jjNlO5ROi0lPwgOHQ8Gsmat0tC4UeWi3poKduYqJ9pSIlcQWlr5tjY8dt3sJu881uegU4fHQOELkf
	zidcfr3tugY+y5qzyta5eIqNIzVwNnQ4TwzPh/Ccgr+7v8ifCd01GczxgjK5uhNXXShwydEc8FQQq
	dKM0xCgF1B1W4wr7/pK+oS7ZzVZi3WokfQT/a2NntcwqmfuHuEPz+Yin+97GcDXSYuYvO7j1lO5Tn
	/4Y+11KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxlP-0000000AQoU-2WjP;
	Fri, 26 Jun 2026 04:01:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxkw-0000000APHs-24Bw;
	Fri, 26 Jun 2026 04:01:32 +0000
X-UUID: b10b4f2c711311f1acbe4559397dec65-20260625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KGDjXzO/Kgw4tCnEcKT4FON97bshhQUd6E32yM3Cz2E=;
	b=PGTyIabeTXtW9vE0ZOYWw7hx8nKysd3ESYli9BNXJGAGWqaXOf405Lp5mqhVWrQMeOmsGbaMyXn1DLp44njltvYRMlSmU/wMQV+B+ASDPDcYTd7fG0CYtOOafPjsx55K9eACzESgtlC7QUQFE+9Oi1bu9kckHqiLzIqJcSytvxE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:c36db59b-fd91-46e1-83fa-a3f11c42983d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:b0c2013e-d78a-4ead-a7dd-d931571248ad,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b10b4f2c711311f1acbe4559397dec65-20260625
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1746622652; Thu, 25 Jun 2026 21:01:21 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 12:01:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 12:01:18 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v4 26/32] pinctrl: mediatek: rt2880: Enable module build support
Date: Fri, 26 Jun 2026 12:00:55 +0800
Message-ID: <20260626040112.2436185-27-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626040112.2436185-1-justin.yeh@mediatek.com>
References: <20260626040112.2436185-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_210130_549135_A12FBACE 
X-CRM114-Status: GOOD (  11.40  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add MODULE_LICENSE("GPL v2") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: dc6ae2057c9c ("pinctrl: ralink: move to mediatek as mtmips")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-rt2880.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 19593279109d..d596d7c742dc 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -69,7 +69,7 @@ config PINCTRL_MT76X8
 	select PINCTRL_MTK_MTMIPS
 
 config PINCTRL_RT2880
-	bool "Ralink RT2880 pin control"
+	tristate "Ralink RT2880 pin control"
 	depends on SOC_RT288X || COMPILE_TEST
 	depends on RALINK
 	default SOC_RT288X
diff --git a/drivers/pinctrl/mediatek/pinctrl-rt2880.c b/drivers/pinctrl/mediatek/pinctrl-rt2880.c
index e0366721a515..587d782a9b67 100644
--- a/drivers/pinctrl/mediatek/pinctrl-rt2880.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt2880.c
@@ -59,3 +59,6 @@ static int __init rt2880_pinctrl_init(void)
 	return platform_driver_register(&rt2880_pinctrl_driver);
 }
 core_initcall_sync(rt2880_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek RT2880 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


