Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF9EC3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CBp3gVMZ4Xj6VTie2AOZTRZv6GCiRK4KbGKItk9J0Z8=; b=zykn07sRHuVfYdbXLeqH8AxoN4
	/7AgBPktA5jOH5T5jsToFn5qfJaY62nZ/HrtOW5UYJtXYlu6pSFrGqvU+K8EEfFVNVXlKXGx3JYH5
	3rfdJhJW2NCf7cwI9q2JV/atIi7KUupa1B+Q5sF6ecl4F61oN6Nxv+zQMFb6MLC1SMu64IcIEXKCc
	CiH16K6oYS9KExCK/yoAfWMsR5Lsltvpasf1agoENsVlUryPovsjMeX5K+BRiwByYcI/+F55F3ayO
	0p3YR9om8GJBMaYuJXXawXEju7L8NlDaTQXb0zWGFqEhXyNbUVDw3YVChmSyf9cv5p1l9uP9RtKRU
	QojqafOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i0a-00000009GlK-0hT0;
	Tue, 29 Apr 2025 10:16:12 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gqq-0000000937T-1nna;
	Tue, 29 Apr 2025 09:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745917324; x=1777453324;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CBp3gVMZ4Xj6VTie2AOZTRZv6GCiRK4KbGKItk9J0Z8=;
  b=adXAIzx3btjUHbbJPBoiIkTtpOw+RCfpUzezX9qZFfDZAv9OvEgMCysa
   LwYkL/DshEcXv0A3/P1KACuyrK1Zs/PH3sMckqgCUO1k2qa2yhOeM8d1v
   j/7MVPQysg33wrNP37b6j1Q1xFSp9LXXBRq+bN6hMngPMeO1izPxjtHjQ
   ky9h4M/Vu1+TQOS9Z+JxKMIiHyIkoPPindwmpxvdpPAmpN2x3/FtmUJ2n
   sROiY+RodEnkNx7BZMP32f+QBnOupvMVneg2DL17FlWyH3OFZs+UlFgk+
   lHGlb69ZSiLk9j3Oohupdng+hjsFIRLPL1PHOYnk05DHzk2X2Nx8FobaD
   w==;
X-CSE-ConnectionGUID: ZLcJNe8HTUCCTWKIMfa8IA==
X-CSE-MsgGUID: g9xvr/rwSxKr+0AA76UsgA==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; 
   d="scan'208";a="43777057"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Apr 2025 11:01:59 +0200
X-CheckPoint: {68109587-28-7141A0B0-E6EDEC14}
X-MAIL-CPID: C8E3A0A56DD49BCC6676081E6626B4CF_3
X-Control-Analysis: str=0001.0A006396.68109586.007C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBE26160E21;
	Tue, 29 Apr 2025 11:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745917315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CBp3gVMZ4Xj6VTie2AOZTRZv6GCiRK4KbGKItk9J0Z8=;
	b=QVG5KA7GT2JDq9rzTqFcSeoi5lLbmx0CMc8+weH7zqGrzO50CqIJDaJPA8RDdlqMDmELy/
	iO/ayZbZ6X+nzEl7k5urOsDN58yAYvBMT0nE5sg+cIU+2V5sgSQ1qGQLg/VOC6o46tbFD6
	vgaEhmJHOpwZjCb0+9Grk0qUYtiAfmajw3QPrzERMURMMAHoDJ1Ovb/KT2Z6It/vMgFQ+Y
	ZscvQUrZpAItjhSb/mXdV7zcGDBtJ3ZBLHlyfqs8fVcXisaONqB2KLiHlMI77hxL915riE
	VI9/4PJHKozuLBGj+RF1QaTP7ZklxKaxq7xRDTjyawtsfotJE70groQwdcvDfA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] phy: freescale: imx8m-pcie: Simplify with dev_err_probe()
Date: Tue, 29 Apr 2025 11:01:52 +0200
Message-ID: <20250429090152.1094243-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_020204_984297_D193A685 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

Error handling in probe() can be a bit simpler with dev_err_probe().


Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index 7355d9921b646..68fcc8114d750 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -238,24 +238,21 @@ static int imx8_pcie_phy_probe(struct platform_device *pdev)
 		imx8_phy->clkreq_unused = false;
 
 	imx8_phy->clk = devm_clk_get(dev, "ref");
-	if (IS_ERR(imx8_phy->clk)) {
-		dev_err(dev, "failed to get imx pcie phy clock\n");
-		return PTR_ERR(imx8_phy->clk);
-	}
+	if (IS_ERR(imx8_phy->clk))
+		return dev_err_probe(dev, PTR_ERR(imx8_phy->clk),
+				     "failed to get imx pcie phy clock\n");
 
 	/* Grab GPR config register range */
 	imx8_phy->iomuxc_gpr =
 		 syscon_regmap_lookup_by_compatible(imx8_phy->drvdata->gpr);
-	if (IS_ERR(imx8_phy->iomuxc_gpr)) {
-		dev_err(dev, "unable to find iomuxc registers\n");
-		return PTR_ERR(imx8_phy->iomuxc_gpr);
-	}
+	if (IS_ERR(imx8_phy->iomuxc_gpr))
+		return dev_err_probe(dev, PTR_ERR(imx8_phy->iomuxc_gpr),
+				     "unable to find iomuxc registers\n");
 
 	imx8_phy->reset = devm_reset_control_get_exclusive(dev, "pciephy");
-	if (IS_ERR(imx8_phy->reset)) {
-		dev_err(dev, "Failed to get PCIEPHY reset control\n");
-		return PTR_ERR(imx8_phy->reset);
-	}
+	if (IS_ERR(imx8_phy->reset))
+		return dev_err_probe(dev, PTR_ERR(imx8_phy->reset),
+				     "Failed to get PCIEPHY reset control\n");
 
 	if (imx8_phy->drvdata->variant == IMX8MP) {
 		imx8_phy->perst =
-- 
2.43.0


