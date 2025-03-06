Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C817CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz2I7BU9rLfHfSph96G/PmbWf/qxl7KFg2teZ6A/Rts=; b=vEDj2uSE47Uacu021yGlLA65Ab
	K8ZkaJcoQgo/bvBASPrE98l1AA5RWXPS8FN8h7EglK7JVfMr1Kvly3X6x3cAasOSJgs0c1kTc8BAB
	HIyrnzkVNcq1roVEwQgvmf3CKdstfvu2WhcKAq/6W7V2s8GZGk3ecSltP8CVeCUkfNAgIvCEKrU/v
	PqDWbpRe9sRVhVc7U3ufu9x0yGVetPAnVXuHfA/9VQyEuh3vD5t9eAailSnmy/nT6KzEFmF35BxNj
	Ox14He5VQsJmnzFyVg6DcPHi7UaEDy/4+sbIQ2sD94eMPqoMJBe6YBt9h87F6Z8y+t9zUyZ6BrFcI
	ykTHs7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq73n-0000000APhu-0VkP;
	Thu, 06 Mar 2025 08:58:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6wI-0000000AOKb-33dq;
	Thu, 06 Mar 2025 08:50:47 +0000
X-UUID: 14e9ca56fa6811ef83f2a1c9db70dae0-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Zz2I7BU9rLfHfSph96G/PmbWf/qxl7KFg2teZ6A/Rts=;
	b=llXdhcrmzmOgBHto4nFwlf4lbe7vPxUfWdJd3S31z/Ipa65CSQ4q+XPUIAFDlc2ovfO3qn8fWCEYhW68HQ0wuNQtJaHXVwzbBMS09OnXIUlwa9sY4bBliDnly13/He1FwdCIOKnxpXBSS0CNQWxix+8PQsqtoORvIowGZQE3VOY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6ec14c51-527a-448c-b15d-d87434bdeaa3,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:998cfec5-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 14e9ca56fa6811ef83f2a1c9db70dae0-20250306
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1510840505; Thu, 06 Mar 2025 01:50:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Mar 2025 16:50:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Mar 2025 16:50:37 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Wenbin Mei
	<wenbin.mei@mediatek.com>
CC: <yong.mao@mediatek.com>, <qingliang.li@mediatek.com>,
	<andy-ld.lu@mediatek.com>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Axe Yang <axe.yang@mediatek.com>
Subject: [PATCH 2/2] mmc: mtk-sd: add support to disable single burst
Date: Thu, 6 Mar 2025 16:48:06 +0800
Message-ID: <20250306085028.5024-3-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250306085028.5024-1-axe.yang@mediatek.com>
References: <20250306085028.5024-1-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_005046_770734_C3B2DB8B 
X-CRM114-Status: GOOD (  13.69  )
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

Add support to disable 'single' burst type if the bus type is AXI.
Since the AMBA within some of the legacy and new designed MSDC IP
is AXI, this switch is necessary.

The burst type is not IC-specific, but host-specific. So we use a
devicetree property 'mediatek,disable-single-burst' to switch burst
type for specific MSDC host.

Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 345ea91629e0..ed46c69def1e 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -249,6 +249,7 @@
 #define MSDC_PATCH_BIT1_CMDTA     GENMASK(5, 3)    /* RW */
 #define MSDC_PB1_BUSY_CHECK_SEL   BIT(7)    /* RW */
 #define MSDC_PATCH_BIT1_STOP_DLY  GENMASK(11, 8)    /* RW */
+#define MSDC_PB1_SINGLE_BURST     BIT(16)   /* RW */
 
 #define MSDC_PATCH_BIT2_CFGRESP   BIT(15)   /* RW */
 #define MSDC_PATCH_BIT2_CFGCRCSTS BIT(28)   /* RW */
@@ -485,6 +486,7 @@ struct msdc_host {
 	u32 src_clk_freq;	/* source clock frequency */
 	unsigned char timing;
 	bool vqmmc_enabled;
+	bool disable_single_burst;
 	u32 latch_ck;
 	u32 hs400_ds_delay;
 	u32 hs400_ds_dly3;
@@ -1874,6 +1876,10 @@ static void msdc_init_hw(struct msdc_host *host)
 	writel(0xffff4089, host->base + MSDC_PATCH_BIT1);
 	sdr_set_bits(host->base + EMMC50_CFG0, EMMC50_CFG_CFCSTS_SEL);
 
+	if (host->disable_single_burst)
+		sdr_clr_bits(host->base + MSDC_PATCH_BIT1,
+			     MSDC_PB1_SINGLE_BURST);
+
 	if (host->dev_comp->stop_clk_fix) {
 		if (host->dev_comp->stop_dly_sel)
 			sdr_set_field(host->base + MSDC_PATCH_BIT1,
@@ -2820,6 +2826,10 @@ static void msdc_of_property_parse(struct platform_device *pdev,
 		host->cqhci = true;
 	else
 		host->cqhci = false;
+
+	host->disable_single_burst =
+		of_property_read_bool(pdev->dev.of_node,
+				      "mediatek,disable-single-burst");
 }
 
 static int msdc_of_clock_parse(struct platform_device *pdev,
-- 
2.46.0


