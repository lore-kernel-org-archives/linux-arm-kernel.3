Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE67D172DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3hAteUT6RLPGsGMhXx+FAjpX6rpL+Ly37R/wHlshp0=; b=xW8Xcer3jxcOq9nV16GJgdyDHU
	SElysqJENcCgPmOsXbE6BiCiXILvI88u36oBF+MahRQLZ6bjVeL0YImdPuA2pTkaOXDokstycQSfz
	flPMn89WmuXxTDJve1JwhSzeTCE1Ia6E3GyPmAytmHl9wAZzSKbwd29rUG6013t4kRJ+G+NijKmuS
	eK5wSc/iYwG45n7aX0Y1vpfE0zkYyJ2R5kDgbKFF+LxYJBIGVLhIuL44mczeB3HnV50B5LhEyNDx9
	YtxP1xM5QAsSDDwH/Mw9PlAbT1uo32u7ziG3jdZTN1oD7YvINuOg3U6SORydph8QF1TdwS0zsCOMH
	K2hNCTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnje-00000004YZd-2Hx8;
	Mon, 02 Feb 2026 06:48:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnjb-00000004YXh-0MMJ;
	Mon, 02 Feb 2026 06:48:32 +0000
X-UUID: 2c0c7980000311f1ad39f32c34db0b1c-20260201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Z3hAteUT6RLPGsGMhXx+FAjpX6rpL+Ly37R/wHlshp0=;
	b=oawsEb8ZByPXZ1jx8DCCvgXhO69GGzc5AkAi1Rh/qWKEFr3h2OwWjPSdM/04pwTfBb5wyaDciJ4uMqdgUBmYs6gYz6mvX4K3x9DKJRw91J6BkvwCzDaHhRnYSlBWxPOZU0kQhyKwdQ8D4MV5mT/qGnfQVef5tMSwLkQhgHzLHMo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:48e72034-c304-403d-b50b-0120911873ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:0a767b7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2c0c7980000311f1ad39f32c34db0b1c-20260201
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irving-ch.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1920862800; Sun, 01 Feb 2026 23:48:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 14:48:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 14:48:22 +0800
From: irving.ch.lin <irving-ch.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <mbrugger@suse.com>, <devicetree@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Qiqi Wang
	<qiqi.wang@mediatek.com>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>,
	<irving-ch.lin@mediatek.com>
Subject: [PATCH 2/3] pmdomain: mediatek: Add bus protect control flow for MT8189
Date: Mon, 2 Feb 2026 14:48:14 +0800
Message-ID: <20260202064820.347550-3-irving-ch.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
References: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_224831_140603_57772A15 
X-CRM114-Status: GOOD (  15.72  )
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

From: Irving-CH Lin <irving-ch.lin@mediatek.com>

In MT8189 mminfra power domain, the bus protect policy separates
into two parts, one is set before subsys clocks enabled, and another
need to enable after subsys clocks enable.

Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 31 ++++++++++++++++++----
 drivers/pmdomain/mediatek/mtk-pm-domains.h |  5 ++++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 0f0662676c07..3eeb0dabf7d7 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -250,7 +250,7 @@ static int scpsys_bus_protect_set(struct scpsys_domain *pd,
 					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 }
 
-static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
+static int scpsys_bus_protect_enable(struct scpsys_domain *pd, u8 flags)
 {
 	for (int i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
 		const struct scpsys_bus_prot_data *bpd = &pd->data->bp_cfg[i];
@@ -259,6 +259,10 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
 		if (!bpd->bus_prot_set_clr_mask)
 			break;
 
+		if ((bpd->flags & BUS_PROT_IGNORE_SUBCLK) !=
+		    (flags & BUS_PROT_IGNORE_SUBCLK))
+			continue;
+
 		if (bpd->flags & BUS_PROT_INVERTED)
 			ret = scpsys_bus_protect_clear(pd, bpd);
 		else
@@ -270,7 +274,7 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
 	return 0;
 }
 
-static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
+static int scpsys_bus_protect_disable(struct scpsys_domain *pd, u8 flags)
 {
 	for (int i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
 		const struct scpsys_bus_prot_data *bpd = &pd->data->bp_cfg[i];
@@ -279,6 +283,10 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
 		if (!bpd->bus_prot_set_clr_mask)
 			continue;
 
+		if ((bpd->flags & BUS_PROT_IGNORE_SUBCLK) !=
+		    (flags & BUS_PROT_IGNORE_SUBCLK))
+			continue;
+
 		if (bpd->flags & BUS_PROT_INVERTED)
 			ret = scpsys_bus_protect_set(pd, bpd);
 		else
@@ -632,6 +640,15 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret)
 		goto err_pwr_ack;
 
+	/*
+	 * In MT8189 mminfra power domain, the bus protect policy separates
+	 * into two parts, one is set before subsys clocks enabled, and another
+	 * need to enable after subsys clocks enable.
+	 */
+	ret = scpsys_bus_protect_disable(pd, BUS_PROT_IGNORE_SUBCLK);
+	if (ret < 0)
+		goto err_pwr_ack;
+
 	/*
 	 * In few Mediatek platforms(e.g. MT6779), the bus protect policy is
 	 * stricter, which leads to bus protect release must be prior to bus
@@ -648,7 +665,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		goto err_disable_subsys_clks;
 
-	ret = scpsys_bus_protect_disable(pd);
+	ret = scpsys_bus_protect_disable(pd, 0);
 	if (ret < 0)
 		goto err_disable_sram;
 
@@ -662,7 +679,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	return 0;
 
 err_enable_bus_protect:
-	scpsys_bus_protect_enable(pd);
+	scpsys_bus_protect_enable(pd, 0);
 err_disable_sram:
 	scpsys_sram_disable(pd);
 err_disable_subsys_clks:
@@ -683,7 +700,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	bool tmp;
 	int ret;
 
-	ret = scpsys_bus_protect_enable(pd);
+	ret = scpsys_bus_protect_enable(pd, 0);
 	if (ret < 0)
 		return ret;
 
@@ -697,6 +714,10 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 
 	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 
+	ret = scpsys_bus_protect_enable(pd, BUS_PROT_IGNORE_SUBCLK);
+	if (ret < 0)
+		return ret;
+
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
 		scpsys_modem_pwrseq_off(pd);
 	else
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index f608e6ec4744..a5dca24cbc2f 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -56,6 +56,7 @@ enum scpsys_bus_prot_flags {
 	BUS_PROT_REG_UPDATE = BIT(1),
 	BUS_PROT_IGNORE_CLR_ACK = BIT(2),
 	BUS_PROT_INVERTED = BIT(3),
+	BUS_PROT_IGNORE_SUBCLK = BIT(4),
 };
 
 enum scpsys_bus_prot_block {
@@ -95,6 +96,10 @@ enum scpsys_bus_prot_block {
 		_BUS_PROT(_hwip, _mask, _set, _clr, _mask, _sta,	\
 			  BUS_PROT_REG_UPDATE)
 
+#define BUS_PROT_WR_IGN_SUBCLK(_hwip, _mask, _set, _clr, _sta)		\
+		_BUS_PROT(_hwip, _mask, _set, _clr, _mask, _sta,	\
+			  BUS_PROT_IGNORE_CLR_ACK | BUS_PROT_IGNORE_SUBCLK)
+
 #define BUS_PROT_INFRA_UPDATE_TOPAXI(_mask)			\
 		BUS_PROT_UPDATE(INFRA, _mask,			\
 				INFRA_TOPAXI_PROTECTEN,		\
-- 
2.45.2


