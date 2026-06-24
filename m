Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFFDCDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 02:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=JqPyZ0aaQVBBC6joV6zD0RbPShi6Y/+SNaCXbd0DQHo=; b=s43htJDgus/ak9Lm+5gJcTXVtb
	lWUlfZ8zUb+PcNGnMUKcgOPPKZL9ZtVuosLj+NEHPrU7zY9+Gyyp3S900nSFWbOOCbm2rIe7Vylc2
	yo7GeOdtVez6XldwDU2NFJ4fmysC/mkpuhaPAzr4d6cRjlBP/8v0hTYoATJhSCY9gqtWJNVGEO3u8
	wXfpwO+z8EeuG0hMSbjdqYxZ8aAqpmNtXAGPK3xv/z/HAdgpP/jHTo1fAxbL6WvJrCfMSykmHZGmM
	RrQPiAxGPG2rpyI/6w3DxwaPAqKY9o0e6pfN+U0r9G1OhAC1XBE+M6bY1V6nR7X4zHZzV5HWp+K+Y
	lZrcEidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcDDk-000000073BY-3PBm;
	Wed, 24 Jun 2026 02:20:08 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcDDh-000000073AI-1YEu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 02:20:08 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260624021956epoutp023497d49ff23ea1486a79ca7793e92772~74u-FubNT1064810648epoutp02R
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 02:19:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260624021956epoutp023497d49ff23ea1486a79ca7793e92772~74u-FubNT1064810648epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782267597;
	bh=JqPyZ0aaQVBBC6joV6zD0RbPShi6Y/+SNaCXbd0DQHo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=pW7LR+mEt9uxjtqQhQhCIqCiZDGMgDljh09xK735xGJ/r1/ipAoOYmCgYIWVOO7ar
	 PEVRtYbCmokc7nncENNeUZSrUDcvSo2+V/8AvTdFO3LHZuOrLjiVWc2xA33Oco9/zS
	 /YfL32lVoqXy1DtESSA5ll54PFja2PrDKhGrK+mY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPS id
	20260624021956epcas1p1620b680e9321a3aba8069cada28ee742~74u_kGyTe1547115471epcas1p1J;
	Wed, 24 Jun 2026 02:19:56 +0000 (GMT)
Received: from epcas1p3.samsung.com (unknown [182.195.38.118]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4glQcr1Sxvz6B9mB; Wed, 24 Jun
	2026 02:19:56 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be~74u9oMuYh0842908429epcas1p2p;
	Wed, 24 Jun 2026 02:19:55 +0000 (GMT)
Received: from cw9316lee.. (unknown [10.253.101.98]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260624021955epsmtip1ed35129491f5eb1c90636349381c9e79~74u9g6r832095320953epsmtip12;
	Wed, 24 Jun 2026 02:19:55 +0000 (GMT)
From: Chanwoo Lee <cw9316.lee@samsung.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Asutosh Das
	<quic_asutoshd@quicinc.com>, Ritesh Harjani <ritesh.list@gmail.com>, Ulf
	Hansson <ulfh@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kamal Dasu
	<kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Broadcom
	internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian
	Fainelli <florian.fainelli@broadcom.com>, Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Michal Simek <michal.simek@amd.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	linux-mmc@vger.kernel.org (open list:EMMC CMDQ HOST CONTROLLER INTERFACE
	(CQHCI) DRIVER), linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
	support), linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek
	SoC support), linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING
	LIST), linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Cc: Chanwoo Lee <cw9316.lee@samsung.com>
Subject: [PATCH] mmc: cqhci: Remove unused intmask parameter from
 cqhci_irq()
Date: Wed, 24 Jun 2026 11:19:03 +0900
Message-ID: <20260624021912.632627-1-cw9316.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be
References: <CGME20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be@epcas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_192006_072050_4571F8FD 
X-CRM114-Status: GOOD (  14.72  )
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

The intmask parameter of cqhci_irq() is never used within the function
body. The function reads the CQHCI interrupt status directly via
cqhci_readl() and processes interrupts independently of the SDHCI
intmask value passed by callers.

Signed-off-by: Chanwoo Lee <cw9316.lee@samsung.com>
---
 drivers/mmc/host/cqhci-core.c       | 3 +--
 drivers/mmc/host/cqhci.h            | 3 +--
 drivers/mmc/host/mtk-sd.c           | 2 +-
 drivers/mmc/host/sdhci-brcmstb.c    | 2 +-
 drivers/mmc/host/sdhci-esdhc-imx.c  | 2 +-
 drivers/mmc/host/sdhci-msm.c        | 2 +-
 drivers/mmc/host/sdhci-of-arasan.c  | 2 +-
 drivers/mmc/host/sdhci-of-dwcmshc.c | 2 +-
 drivers/mmc/host/sdhci-pci-core.c   | 2 +-
 drivers/mmc/host/sdhci-pci-gli.c    | 2 +-
 drivers/mmc/host/sdhci-tegra.c      | 2 +-
 drivers/mmc/host/sdhci_am654.c      | 2 +-
 12 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
index 178277d90c31..98ceb0b9a6d1 100644
--- a/drivers/mmc/host/cqhci-core.c
+++ b/drivers/mmc/host/cqhci-core.c
@@ -819,8 +819,7 @@ static void cqhci_finish_mrq(struct mmc_host *mmc, unsigned int tag)
 	mmc_cqe_request_done(mmc, mrq);
 }
 
-irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
-		      int data_error)
+irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_error)
 {
 	u32 status;
 	unsigned long tag = 0, comp_status;
diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index 3668856531c1..8fbbc48c3f85 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -315,8 +315,7 @@ static inline u32 cqhci_readl(struct cqhci_host *host, int reg)
 
 struct platform_device;
 
-irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
-		      int data_error);
+irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_error);
 int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64);
 struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
 int cqhci_deactivate(struct mmc_host *mmc);
diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index b2680cc054bd..01ea3adbdf3b 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1805,7 +1805,7 @@ static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
 			cmd_err, dat_err, intsts);
 	}
 
-	return cqhci_irq(mmc, 0, cmd_err, dat_err);
+	return cqhci_irq(mmc, cmd_err, dat_err);
 }
 
 static irqreturn_t msdc_irq(int irq, void *dev_id)
diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index 57e45951644e..1de2f05fd958 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -430,7 +430,7 @@ static u32 sdhci_brcmstb_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 18ecddd6df6f..d0fa83f67a80 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1503,7 +1503,7 @@ static u32 esdhc_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 0882ce74e0c9..ceed47ccfda8 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2165,7 +2165,7 @@ static u32 sdhci_msm_cqe_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 	return 0;
 }
 
diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index 785d3acb18c5..4ca73e7d799e 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -555,7 +555,7 @@ static u32 sdhci_arasan_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index eef53455b8ee..4c5fa6a6931d 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -624,7 +624,7 @@ static u32 dwcmshc_cqe_irq_handler(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
index c347fac24515..b121d896a804 100644
--- a/drivers/mmc/host/sdhci-pci-core.c
+++ b/drivers/mmc/host/sdhci-pci-core.c
@@ -215,7 +215,7 @@ static u32 sdhci_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pci-gli.c
index 6e4084407662..b55618566d65 100644
--- a/drivers/mmc/host/sdhci-pci-gli.c
+++ b/drivers/mmc/host/sdhci-pci-gli.c
@@ -1760,7 +1760,7 @@ static u32 sdhci_gl9763e_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 820ce4dae58b..221e48b59f48 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -1280,7 +1280,7 @@ static u32 sdhci_tegra_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
index d235b0aecfdb..2a27db2f558b 100644
--- a/drivers/mmc/host/sdhci_am654.c
+++ b/drivers/mmc/host/sdhci_am654.c
@@ -462,7 +462,7 @@ static u32 sdhci_am654_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
-- 
2.43.0


