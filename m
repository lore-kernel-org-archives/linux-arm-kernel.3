Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3D1C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PksWHiD4N3FpH1+vZw7y8oi2NSzQ5jtgVCRXU5GEAuY=; b=pIKSeLLnHpWmtomMuoQBGDPLo0
	q3Wa7Iil8PiCPmIIuq3nNN64h1rk4UBlcREL/w9l2Fd30Hir5dEHtjxpkfindOwoMFvtaURjwrUyT
	vi50hbD7t70PYtaZnSHxpyUD+n+cUvjifbUYcQSykIMw3z9qFhE5vskzXCKH8MDXLeORURivIC/OX
	1YQVScw2hlEP/SeKlKEEKswEgLTMK7LJRv3a0uK+vwnO2GF1l155hxaH/3I/J/aUj8qp1XC4otuXg
	kyATo56ZSdZlE4YiOG8EdMTcSYAmMCAHuaY3MOoEM+CdqMYVY7SQud/wcrFOiefXPrgnv4nf8LMvW
	9D3Tz1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLvy-0000000CpTE-28ib;
	Tue, 06 May 2025 17:18:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOb-0000000C8Cb-46In
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so31966645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538301; x=1747143101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PksWHiD4N3FpH1+vZw7y8oi2NSzQ5jtgVCRXU5GEAuY=;
        b=lwc+ESErwC6CO+tKHCpgSLxcpF+KvYXG75SQT1Qi/OJrpBd0bCvx0ForGj2VLPEj5t
         J7syad7kQ3WkuafOhNZbOo4l5IiLVLdKxPcTURaiUHxtIpvlVgRub5hXQmESoyULGqSO
         Aq4FnAn2m5azhLnHeIcdGERJCVvZR3O6FKIlmIYHkQVwFQPwL05c7Y4puVdYmQWcRTo5
         PXLqvZifUTtnVfl0j6d7+ZRHvBBgMUHoj+K2wDcqQtLPDlGzmbcOqmR0XVnuYTmEsA85
         N5NI2I/9Lkiojm51c21U3233x0Xy19tLSOj4Noh4q8k8g2h8M6S2s/B+1aPvGUe70ndd
         UrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538301; x=1747143101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PksWHiD4N3FpH1+vZw7y8oi2NSzQ5jtgVCRXU5GEAuY=;
        b=ohEQZOdZuRXjfUnDYIxjDYfpirjKizYml2flNbZ8gS6/U0aZjj+F2nN1dlcRDcdWsW
         r3fso2Bxe1n07uLdXB6h4psBwa34D9hhx9+tiPl0VJU4jGkeluwB9JsqxZCuNwGGAhoL
         AY2KBu4QqAJfJUqsCMGu+SZF2v7WK0dAkKhL/SU7U+e7zT5T79UUA9AH1OFBGiEf27in
         /Alfjipr5cJ3F2ZcRvxWFUe/t5DrOGW4klxmiHny6Db7bdnYC8xe1SAmWWO3+suKziQR
         +/DHbDttzScYWwfREvNnyATbKXoThPa7OoSXuVKwSt3CyuTgMSqHab0x4KqoHLzBNt2T
         QzNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSqcEYufa4Jq2R6tP0uhQIZz3w+JEoD/Ybx+OCFZD67K/XZKEvkTu9KKg5ClorBUjq6AUQ1L5LHJOXgwlPa/Iw@lists.infradead.org
X-Gm-Message-State: AOJu0YyYOk+lrwsXAZAa4jEnqGlTf6cxwIeQNCaaHyLcKdqY2PxYfTNh
	teaM7eMRuLidZr3DVNz+YdAKyse2IOKzZ4O5EFsj+BJFD9L7Kgzgg7e/bw==
X-Gm-Gg: ASbGncvBfCuhcSiwLzM/DW1YzL2mgSYC6RgBOjd9k4RIzjjkSiz8dlXU/n/PoyZev9V
	A/8N1k7KYFem+aBOTkcqoPWWsv+Xj6g/FHM1vWe+LXtqDiSFUepfyyRhGO/YwqCYbo179RVWDDr
	ogjbO2pmG95b1X0Q4mRFVAMllU13Qnm1bnvwP2H6HV3KTM5hFFVNFaz7fBFEQWahMa8jbrdH6g4
	qCS6388QXXA5i2nkbBqc590u6hqrjaNNRBxlRRWWcGbh7WXMUHClhDv3/xab28aVFnA9TlZZlDa
	Mdp9yt+pETDPFRXjJUMUlQdJoGcByk9GL5cpWe2/8jCVm53R/tiLvkSNgJ8lFHt8qq+YCC37l0d
	75HVtxrcbdxxi9NdBNcRFw49qRSSbw6XJmHwWDgYUa9E=
X-Google-Smtp-Source: AGHT+IHLE1Eq0lTL9Cfyf1Kt69ib0NQg9CFhnHdihWtkKbmGh1CmoMvEF3tmeNPfc7JNVKMnaIukNQ==
X-Received: by 2002:a05:600c:1d0a:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-441d053b038mr29764635e9.30.1746538300252;
        Tue, 06 May 2025 06:31:40 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2ad7688sm217221655e9.3.2025.05.06.06.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:38 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/11] soc/tegra: pmc: Add Tegra264 support
Date: Tue,  6 May 2025 15:31:14 +0200
Message-ID: <20250506133118.1011777-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063142_028943_0034C5D2 
X-CRM114-Status: GOOD (  16.19  )
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

From: Thierry Reding <treding@nvidia.com>

The PMC block on Tegra264 has undergone a few small changes since it's
Tegra234 predecessor. Match on the new compatible string to select the
updated SoC-specific data.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 132 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 51b9d852bb6a..6f1ea5b6b9db 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2892,9 +2892,14 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		if (IS_ERR(pmc->wake))
 			return PTR_ERR(pmc->wake);
 
-		pmc->aotag = devm_platform_ioremap_resource_byname(pdev, "aotag");
-		if (IS_ERR(pmc->aotag))
-			return PTR_ERR(pmc->aotag);
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aotag");
+		if (res) {
+			pmc->aotag = devm_ioremap_resource(&pdev->dev, res);
+			if (IS_ERR(pmc->aotag))
+				return PTR_ERR(pmc->aotag);
+		} else {
+			pmc->aotag = NULL;
+		}
 
 		/* "scratch" is an optional aperture */
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
@@ -4247,7 +4252,128 @@ static const struct tegra_pmc_soc tegra234_pmc_soc = {
 	.has_single_mmio_aperture = false,
 };
 
+static const struct tegra_pmc_regs tegra264_pmc_regs = {
+	.scratch0 = 0x684,
+	.rst_status = 0x4,
+	.rst_source_shift = 0x2,
+	.rst_source_mask = 0x1fc,
+	.rst_level_shift = 0x0,
+	.rst_level_mask = 0x3,
+};
+
+static const char * const tegra264_reset_sources[] = {
+	"SYS_RESET_N",		/* 0x0 */
+	"CSDC_RTC_XTAL",
+	"VREFRO_POWER_BAD",
+	"SCPM_SOC_XTAL",
+	"SCPM_RTC_XTAL",
+	"FMON_32K",
+	"FMON_OSC",
+	"POD_RTC",
+	"POD_IO",		/* 0x8 */
+	"POD_PLUS_IO_SPLL",
+	"POD_PLUS_SOC",
+	"VMON_PLUS_UV",
+	"VMON_PLUS_OV",
+	"FUSECRC_FAULT",
+	"OSC_FAULT",
+	"BPMP_BOOT_FAULT",
+	"SCPM_BPMP_CORE_CLK",	/* 0x10 */
+	"SCPM_PSC_SE_CLK",
+	"VMON_SOC_MIN",
+	"VMON_SOC_MAX",
+	"VMON_MSS_MIN",
+	"VMON_MSS_MAX",
+	"POD_PLUS_IO_VMON",
+	"NVJTAG_SEL_MONITOR",
+	"NV_THERM_FAULT",	/* 0x18 */
+	"FSI_THERM_FAULT",
+	"PSC_SW",
+	"SCPM_OESP_SE_CLK",
+	"SCPM_SB_SE_CLK",
+	"POD_CPU",
+	"POD_GPU",
+	"DCLS_GPU",
+	"POD_MSS",		/* 0x20 */
+	"FMON_FSI",
+	"POD_FSI",
+	"VMON_FSI_MIN",
+	"VMON_FSI_MAX",
+	"VMON_CPU0_MIN",
+	"VMON_CPU0_MAX",
+	"BPMP_FMON",
+	"AO_WDT_POR",		/* 0x28 */
+	"BPMP_WDT_POR",
+	"AO_TKE_WDT_POR",
+	"RCE0_WDT_POR",
+	"RCE1_WDT_POR",
+	"DCE_WDT_POR",
+	"FSI_R5_WDT_POR",
+	"FSI_R52_0_WDT_POR",
+	"FSI_R52_1_WDT_POR",	/* 0x30 */
+	"FSI_R52_2_WDT_POR",
+	"FSI_R52_3_WDT_POR",
+	"TOP_0_WDT_POR",
+	"TOP_1_WDT_POR",
+	"TOP_2_WDT_POR",
+	"APE_C0_WDT_POR",
+	"APE_C1_WDT_POR",
+	"GPU_TKE_WDT_POR",	/* 0x38 */
+	"PSC_WDT_POR",
+	"OESP_WDT_POR",
+	"SB_WDT_POR",
+	"SW_MAIN",
+	"L0L1_RST_OUT_N",
+	"FSI_HSM",
+	"CSITE_SW",
+	"AO_WDT_DBG",		/* 0x40 */
+	"BPMP_WDT_DBG",
+	"AO_TKE_WDT_DBG",
+	"RCE0_WDT_DBG",
+	"RCE1_WDT_DBG",
+	"DCE_WDT_DBG",
+	"FSI_R5_WDT_DBG",
+	"FSI_R52_0_WDT_DBG",
+	"FSI_R52_1_WDT_DBG",	/* 0x48 */
+	"FSI_R52_2_WDT_DBG",
+	"FSI_R52_3_WDT_DBG",
+	"TOP_0_WDT_DBG",
+	"TOP_1_WDT_DBG",
+	"TOP_2_WDT_DBG",
+	"APE_C0_WDT_DBG",
+	"APE_C1_WDT_DBG",
+	"PSC_WDT_DBG",		/* 0x50 */
+	"OESP_WDT_DBG",
+	"SB_WDT_DBG",
+	"TSC_0_WDT_DBG",
+	"TSC_1_WDT_DBG",
+	"L2_RST_OUT_N",
+	"SC7"
+};
+
+static const struct tegra_wake_event tegra264_wake_events[] = {
+};
+
+static const struct tegra_pmc_soc tegra264_pmc_soc = {
+	.has_impl_33v_pwr = true,
+	.regs = &tegra264_pmc_regs,
+	.init = tegra186_pmc_init,
+	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.set_wake_filters = tegra186_pmc_set_wake_filters,
+	.irq_set_wake = tegra186_pmc_irq_set_wake,
+	.irq_set_type = tegra186_pmc_irq_set_type,
+	.reset_sources = tegra264_reset_sources,
+	.num_reset_sources = ARRAY_SIZE(tegra264_reset_sources),
+	.reset_levels = tegra186_reset_levels,
+	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
+	.wake_events = tegra264_wake_events,
+	.num_wake_events = ARRAY_SIZE(tegra264_wake_events),
+	.max_wake_events = 128,
+	.max_wake_vectors = 4,
+};
+
 static const struct of_device_id tegra_pmc_match[] = {
+	{ .compatible = "nvidia,tegra264-pmc", .data = &tegra264_pmc_soc },
 	{ .compatible = "nvidia,tegra234-pmc", .data = &tegra234_pmc_soc },
 	{ .compatible = "nvidia,tegra194-pmc", .data = &tegra194_pmc_soc },
 	{ .compatible = "nvidia,tegra186-pmc", .data = &tegra186_pmc_soc },
-- 
2.49.0


