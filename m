Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49289C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NKU33ZkmEFKo3sZZa+C7qSz17AQZ0Td5EFQDl507VFM=; b=qGVN09VvZmuFzaqdqJGknc1fve
	xg5WpeNLsrUHAb7Jh/I1Vah08Xg1h9RGuu1JKFFea4wNCYYvr0tuM1S0U3B95Zp14fM1nrgi3aw7T
	VP7jzr+Pi+sCjOW+tZF57lsXIJ24PJn2Wd+0Pd4M3DGMuFIUigITO18P3tjdlcLEnxkbZEdJ+t8OT
	JGtEFxiUTZCn1fos4lFIxi0GKBQQ097YS7+VJmPBTXMhw4XnwYCWSS/SEEwXFcE+9fbXdzm9/hbdH
	3MYEG7xNYfT8ePo/LDfFQ5QU8fqhNlKi8Pg7tbw23Jhg0jV9E5EjNwNVFjEdpsbSOMe4Ki5lkx8Ct
	Oqoy6U0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sco-0000000An7X-02wZ;
	Thu, 10 Apr 2025 14:11:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sb0-0000000AmqD-3tgT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 14:09:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 622225C584A;
	Thu, 10 Apr 2025 14:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20CC0C4CEDD;
	Thu, 10 Apr 2025 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294173;
	bh=DpSjE5BAz8kF66zp70q0y2bFTSB7iHjZZeJN5OuVsKY=;
	h=From:To:Cc:Subject:Date:From;
	b=VqaubKMc5kARpMjjWo1wDPI9VjxMOBQUAhNCaQP+CR8mp9GLF2PS4yclHoikGneRT
	 2G4WdRdQ1Gm9r5L5GMrphcctR0FMWJJ0OPdRFnfNdlkd9UNArITduEj0Db7IMGUtCF
	 DZn7AqK0DOL+swc54mWskPcRsL0qPJGBmrgju98dE8605WTShXo7SojVtKLY5GIeSj
	 7diWgGieg53v7f1t+HNZ5WyeNLNfNmZ0EMp4Af64BF0YaHlOSEsEfKGGYNrnvwPfOn
	 98s0BlPQZ22AtNtKwh6tCcA/YBVESjWjFkrgJ3QZN5pmeCoaADhuRe+tQ1qc9arZJ2
	 J713FGcAf4llg==
From: Arnd Bergmann <arnd@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Luke Wang <ziniu.wang_1@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: esdhc-imx: convert to modern PM_OPS
Date: Thu, 10 Apr 2025 16:09:07 +0200
Message-Id: <20250410140921.849213-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_070935_023815_968B52E1 
X-CRM114-Status: GOOD (  12.24  )
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

From: Arnd Bergmann <arnd@arndb.de>

Two newly added functions are unused in configurations without
power management support:

drivers/mmc/host/sdhci-esdhc-imx.c:1586:13: error: unused function 'sdhc_esdhc_tuning_save' [-Werror,-Wunused-function]
 1586 | static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
      |             ^~~~~~~~~~~~~~~~~~~~~~
drivers/mmc/host/sdhci-esdhc-imx.c:1608:13: error: unused function 'sdhc_esdhc_tuning_restore' [-Werror,-Wunused-function]
 1608 | static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~

Remove the #ifdef checks and instead use the better macros that
silently drop the unused functions when PM is disabled.

Fixes: 3d1eea493894 ("mmc: sdhci-esdhc-imx: Save tuning value when card stays powered in suspend")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 7e8addaed697..8742622da55a 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1942,7 +1942,6 @@ static void sdhci_esdhc_imx_remove(struct platform_device *pdev)
 	sdhci_pltfm_free(pdev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sdhci_esdhc_suspend(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
@@ -2021,9 +2020,7 @@ static int sdhci_esdhc_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-#ifdef CONFIG_PM
 static int sdhci_esdhc_runtime_suspend(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
@@ -2103,11 +2100,10 @@ static int sdhci_esdhc_runtime_resume(struct device *dev)
 		cpu_latency_qos_remove_request(&imx_data->pm_qos_req);
 	return err;
 }
-#endif
 
 static const struct dev_pm_ops sdhci_esdhc_pmops = {
-	SET_SYSTEM_SLEEP_PM_OPS(sdhci_esdhc_suspend, sdhci_esdhc_resume)
-	SET_RUNTIME_PM_OPS(sdhci_esdhc_runtime_suspend,
+	SYSTEM_SLEEP_PM_OPS(sdhci_esdhc_suspend, sdhci_esdhc_resume)
+	RUNTIME_PM_OPS(sdhci_esdhc_runtime_suspend,
 				sdhci_esdhc_runtime_resume, NULL)
 };
 
-- 
2.39.5


