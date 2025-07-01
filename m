Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44019C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ou37oVNU8EcrZ39XggNFqJJBkEWIeWX5cH4SBBxr5bU=; b=ymvTakKsikWT6SwHlcfpv6Wate
	UN1RJInfGOn6DD9YYruYrYg3mN/T3hFC+6aN65TvISIVcVs2oRT+RbYKrqv79QCRJoMnXp1gzhxNk
	zIsH+hp7CeO3huOkKCP5abfuNjbpiHCWyvpblu/WVNMzXP/ksw/Sj4oltZhOpV8k6GCCTO571EO4O
	1DlzgAs5uvjodZTrl9iFk53jKzmNIE2zOEfuTBhKj9wVyovuBbobODNT71WcywzExh+YspKHk6twe
	wl1g6VKJn4STLB51LGbDYGrMxgo1OVAbBCXRnHFv87LaHFUyL1JK5xtTXfLG5QOch5PWdqcbZIhWX
	q+3rT6HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa9D-00000005K2c-0Zmy;
	Tue, 01 Jul 2025 12:31:39 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZT3-00000004uld-004w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:06 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553cf020383so6211681e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370483; x=1751975283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou37oVNU8EcrZ39XggNFqJJBkEWIeWX5cH4SBBxr5bU=;
        b=jNrBIoyV0fLbqaduK0UPsberCo2HWYFn2hWIEPMdVw5REOkYje5YWOZtgAY8lvYew/
         Jw+yhGHWNhzc7WvK91XlRrQL4CFXXY1AfBrzE3YWRcqVGsehYHhbq9AXY3FiAp4mt4lQ
         kHd254QrWkp70qwjPOKV1+bA4ElFJtymFYHkuwH1TYxZsrBnJlckvC0jXYHHuAnl/u6Y
         RrsJvatgfJhcJTyh0J8Qe3fGv+5SBrw43qgJjPPan/Ds/dPZ7MbiPP93VZRDIPuWPVvI
         aiOj1qobdNZ13+nQUqKfDaD74WjYD+Hlw4h+PPHSORmPmrrMAiOtngmmz6HHcWcPvfpJ
         9OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370483; x=1751975283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ou37oVNU8EcrZ39XggNFqJJBkEWIeWX5cH4SBBxr5bU=;
        b=Fi0YlD57yxAUldifDluneiY1bdxnd+66LLW0hwbGwj6x4P8o/N/JpURHY/twlVa693
         WDsWgZ56mPbK3IYr88GUnBCcOpWm3IS0qk+avd5EE2yDfhOkcW+nDyF1b5XCGX+SMUo5
         RyTzrbYWebMQshebHbIjZDISa77Vgha9qQaNj1IK9nGEOe3WwLYeLoITLzo6+Wdqmez2
         y/IgYoPd+rDcX7O4Li1SzP6APrYHNhqebaCTDYoUTlBH78ztgUCQflwH8YbGUmgENlMB
         4bJpDVDGD1j2XX8G9rl/XrccfndIkaiRh4LcY1LQaYEjTvJaiCqs6EO+Tl/b4cVsaDgd
         IiqA==
X-Forwarded-Encrypted: i=1; AJvYcCXS7fAqe0LtToKXFX/QNoTUv7hHwXPFnYfK/sSkWRH9W6tML4az9bEBA27nbrw8/VE7Z/octmY85rN7rGsoZ3a5@lists.infradead.org
X-Gm-Message-State: AOJu0YyIXUXZA1PToe0q4Mh8qHADuUThk2zmw4KaBxnuc3zMA4gxpZNJ
	pcdmFYpI3sSVszW5bJUJN8HMl+Ypye6kedJIdTbjTThOwPHp1t5hke/PRqC9B/8Ah/w=
X-Gm-Gg: ASbGncuTmWTtNHsYfGNOTsBzRlTahnG61E581PaxzVfuAmtxlJ2suEPGrbJIe/ZGprc
	Vb3SZQzTu9aLHFVN45gE7Ic4IwSpSN/T5O/57v9AxAU8zTYORfldukOiPMEInpaWiE8StqkKhmM
	O41m48RmzvEq4wvi+KVxs5pw7synLdwkeuu5YqfPTAFpsd9vzgN4sjYstIxBgRigB2kAn2D6GWO
	NWeH7tG/USydYJKvYqoeZ+fruS59LvHyvxMZa+C5gZZeLsFCQJ0pcVsFLFobPbt7uKPpvRzwdDx
	5FmgBdmvloMoy8KSZ7TDsbdFn+iH0meUIlCS8NQ+3CTgD23uL16tKzXnWrePppvT2ORNhg9Ttjv
	MXVrQw3jVb9rWtBaYDAVc3o3iDy4MX/XPueUb
X-Google-Smtp-Source: AGHT+IH0vCvElE8qdxxXL5THgRVp/JjfgP3AQLH5VtPUuqSALJU6t/Q2a/vaudzsxqj21OUKqYtVNg==
X-Received: by 2002:a05:6512:31d0:b0:553:abcd:cf51 with SMTP id 2adb3069b0e04-5550ba16ad6mr4341553e87.40.1751370483312;
        Tue, 01 Jul 2025 04:48:03 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:02 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v3 14/24] firmware/pmdomain: xilinx: Move ->sync_state() support to firmware driver
Date: Tue,  1 Jul 2025 13:47:16 +0200
Message-ID: <20250701114733.636510-15-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044805_050790_1312BA15 
X-CRM114-Status: GOOD (  19.31  )
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

Rather than having the genpd provider to add device_links for each device
that gets attached, to implement the ->sync_state() support, let's rely on
fw_devlink to do this for us.

In this way, we can simplify the code by moving the ->sync_state() callback
into the firmware driver, so let's do that.

Cc: Michael Tretter <m.tretter@pengutronix.de>
Cc: Michal Simek <michal.simek@amd.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/firmware/xilinx/zynqmp.c            | 10 ++++++++++
 drivers/pmdomain/xilinx/zynqmp-pm-domains.c | 16 ----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 7356e860e65c..a91a0191c689 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2100,6 +2100,15 @@ static void zynqmp_firmware_remove(struct platform_device *pdev)
 	platform_device_unregister(em_dev);
 }
 
+static void zynqmp_firmware_sync_state(struct device *dev)
+{
+	if (!of_device_is_compatible(dev->of_node, "xlnx,zynqmp-firmware"))
+		return;
+
+	if (zynqmp_pm_init_finalize())
+		dev_warn(dev, "failed to release power management to firmware\n");
+}
+
 static const struct of_device_id zynqmp_firmware_of_match[] = {
 	{.compatible = "xlnx,zynqmp-firmware"},
 	{.compatible = "xlnx,versal-firmware"},
@@ -2112,6 +2121,7 @@ static struct platform_driver zynqmp_firmware_driver = {
 		.name = "zynqmp_firmware",
 		.of_match_table = zynqmp_firmware_of_match,
 		.dev_groups = zynqmp_firmware_groups,
+		.sync_state = zynqmp_firmware_sync_state,
 	},
 	.probe = zynqmp_firmware_probe,
 	.remove = zynqmp_firmware_remove,
diff --git a/drivers/pmdomain/xilinx/zynqmp-pm-domains.c b/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
index d579220a4500..b5aedd6e33ad 100644
--- a/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
+++ b/drivers/pmdomain/xilinx/zynqmp-pm-domains.c
@@ -153,14 +153,8 @@ static int zynqmp_gpd_attach_dev(struct generic_pm_domain *domain,
 				 struct device *dev)
 {
 	struct zynqmp_pm_domain *pd = to_zynqmp_pm_domain(domain);
-	struct device_link *link;
 	int ret;
 
-	link = device_link_add(dev, &domain->dev, DL_FLAG_SYNC_STATE_ONLY);
-	if (!link)
-		dev_dbg(&domain->dev, "failed to create device link for %s\n",
-			dev_name(dev));
-
 	/* If this is not the first device to attach there is nothing to do */
 	if (domain->device_count)
 		return 0;
@@ -298,19 +292,9 @@ static void zynqmp_gpd_remove(struct platform_device *pdev)
 	of_genpd_del_provider(pdev->dev.parent->of_node);
 }
 
-static void zynqmp_gpd_sync_state(struct device *dev)
-{
-	int ret;
-
-	ret = zynqmp_pm_init_finalize();
-	if (ret)
-		dev_warn(dev, "failed to release power management to firmware\n");
-}
-
 static struct platform_driver zynqmp_power_domain_driver = {
 	.driver	= {
 		.name = "zynqmp_power_controller",
-		.sync_state = zynqmp_gpd_sync_state,
 	},
 	.probe = zynqmp_gpd_probe,
 	.remove = zynqmp_gpd_remove,
-- 
2.43.0


