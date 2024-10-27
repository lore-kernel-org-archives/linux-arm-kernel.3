Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F9D13572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTysvoGGww4FFDGqdhTsl9jaJavpExims6FE5y5z2jg=; b=Hu8C0nue4jrXaJriqZdot9+wvo
	lwGJcaVSKVZa5LbZicjoOmHlNUA3KdAs/vF6xSoCsGHbOI9CsVsEhhlAqGyHWWOlvB3KJ9A0ltDYE
	UKaw8tPqQkYcUA7Pzfv5hcdEEMy6sUnn2q0OexztZM3++nlQyxwDDTtz1UcYEbm/Q7ihPCe/zDSxG
	jQVtQD2i1jUJkGi4ElGRA5oXOxFcmKItdw4U/S/56G1fLiwR5H4uPcdMvR1HglLtvOOjtgnGsjFdO
	qvjWQrRKqnwhS+/cEZ3PSnr8A+Tsw16N/tOl6L4guIm8fYd1d7zAM5IvHdA3zsR54e3i2jpQOut2t
	65hX+Y7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t57dm-00000008dob-4B2W;
	Sun, 27 Oct 2024 18:05:27 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t57cB-00000008dfN-1oOS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 18:03:49 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a9a628b68a7so553832966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 11:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730052224; x=1730657024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cTysvoGGww4FFDGqdhTsl9jaJavpExims6FE5y5z2jg=;
        b=etKoWWMwhWeKmqMdABuEvlrUP1b+OjWsMWSGO+YKQd5cWTsJhGCHTj9aAK1EHEBP7D
         Q6zjYxXHFvDNJ+gga/fa7pDD3tSE4EEoGaRIKmY/dL48Z1jklY23V15v9NqwrCynMj5b
         eAZ8GMqBv+kWZD0Qr5x4pw3eNdbi9AjavzGnWQPa9CgQeqov47rEtwZKY1ahwlvc4cyI
         1JIqkxuS7cg/wMdy9ZkGnpHss+UsRQt3jdHBVqYJGHpILyjvedZSt0ISKJdVDYC4E32a
         VeZI1ht3wkcrYclFjAddHkCtGlnz8BBPoP49HRMBt634BG1P+kQvebxmyztFnzMimMrk
         CoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730052224; x=1730657024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTysvoGGww4FFDGqdhTsl9jaJavpExims6FE5y5z2jg=;
        b=cAQjv5TCCqqDdv+Ezy3uRwD0Cr21xz9O0eMjIgutrGM5QFR3Pm3yXL+TSbTN+vMdPI
         uTauRsFE2h+jDHJkAyJnu2TVeN2qmzfTMB5c7udA8ZKLDKaqkXmOMxfPz+TI23GhSzeB
         IHL84zlcvUBPC8Ovp4I2fwHloBZdRq2wXrA4QG2xTSfh2t5GnDmPacuxnP7CD7FljACh
         iV+iKygObLOjlreESiwu07IGcNz5mSQph+fTpyLrKyJ+eeTXYOc4yQ5vouhgbK1xcXGg
         tsYws65xMOBWRACHo9bYonb5/n+0rKp39zlurj/v/4waOt2onpBtLGHhXFLP33ZGZx7a
         IUEg==
X-Gm-Message-State: AOJu0YwXli9xnPGZ/u+VF7nap+9qd5gnYHL8eSkpYqqg2S4UwH5BHQ8j
	wUij5VbCq0rGrTTYl4oRRD/ASjGlMTtGBFJDZKCoTwgBL5jIDI/2fLbdTzqS8TU=
X-Google-Smtp-Source: AGHT+IFXu9m7t3z+UwOT2XWWOi9PSpLEdQaqYs3GqX99vjYhssOxNhqJ/Wt0X/fDARZjO8Gq+SLHuA==
X-Received: by 2002:a17:906:6a24:b0:a9a:7f84:93e3 with SMTP id a640c23a62f3a-a9de5d942d4mr533484166b.14.1730052224266;
        Sun, 27 Oct 2024 11:03:44 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:9495:39c0:6bdb:a8a4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f298de6sm303889566b.141.2024.10.27.11.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 11:03:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] perf: Switch back to struct platform_driver::remove()
Date: Sun, 27 Oct 2024 19:03:14 +0100
Message-ID: <20241027180313.410964-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=13779; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=SGFYYCQuUKWIgyF6pm7Sju7Xd7yJWKnouys0hihiFLA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnHoBhPqtdpYlXc7OdGJe6X993I0I703vjXRn+5 kQBAg7vmVGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZx6AYQAKCRCPgPtYfRL+ Tn5hB/4pCjTgxuZgHIq4ahKpNFw3VfBRLvzw+DZy9Y1k7F/whTOo4YUO0+SydOSY7sEQZfoDB/O vx42I1GQbkZo8gYPxBfl83dVVTglyP9zRMLwv6WZi7wWwa7KortoP3QxIyo9QJtko9678X0aFwA x58MOft3PXgDbu45TTqCZ0nWajbwAFaLvqeUBywrBctzesrhjMKfLZzpwf0bioB80kCs9Nf9Eg/ NhX92EwKuqYzjCqbma39Lu/VsxGQWemwgM6NiM5GuMH9B7IzS94jdB8mBKES8aUqQtEcODSA9CP UAgs402RgmP/c7Ummc4nQhPS0bZIbKH/cATYgI33AKrzR/ZE
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_110347_770586_E3893257 
X-CRM114-Status: GOOD (  18.67  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/perf to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello

I did a single patch for all of drivers/perf. While I usually prefer to
do one logical change per patch, this seems to be overengineering here
as the individual changes are really trivial and shouldn't be much in
the way for stable backports. But I'll happily split the patch if you
prefer it split.

Note I didn't Cc: the maintainers of each driver as this would hit
sending limits.

This is based on Friday's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend.

Best regards
Uwe

 drivers/perf/alibaba_uncore_drw_pmu.c         | 2 +-
 drivers/perf/amlogic/meson_g12_ddr_pmu.c      | 2 +-
 drivers/perf/arm-cci.c                        | 2 +-
 drivers/perf/arm-ccn.c                        | 2 +-
 drivers/perf/arm-cmn.c                        | 2 +-
 drivers/perf/arm_cspmu/arm_cspmu.c            | 2 +-
 drivers/perf/arm_dmc620_pmu.c                 | 2 +-
 drivers/perf/arm_dsu_pmu.c                    | 2 +-
 drivers/perf/arm_smmuv3_pmu.c                 | 2 +-
 drivers/perf/arm_spe_pmu.c                    | 2 +-
 drivers/perf/fsl_imx8_ddr_perf.c              | 2 +-
 drivers/perf/fsl_imx9_ddr_perf.c              | 2 +-
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  | 2 +-
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 2 +-
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  | 2 +-
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  | 2 +-
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   | 2 +-
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 2 +-
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 2 +-
 drivers/perf/marvell_cn10k_tad_pmu.c          | 2 +-
 drivers/perf/qcom_l2_pmu.c                    | 2 +-
 drivers/perf/thunderx2_pmu.c                  | 2 +-
 drivers/perf/xgene_pmu.c                      | 2 +-
 23 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/perf/alibaba_uncore_drw_pmu.c b/drivers/perf/alibaba_uncore_drw_pmu.c
index c6ff1bc7d336..99a0ef9817e0 100644
--- a/drivers/perf/alibaba_uncore_drw_pmu.c
+++ b/drivers/perf/alibaba_uncore_drw_pmu.c
@@ -782,7 +782,7 @@ static struct platform_driver ali_drw_pmu_driver = {
 		   .acpi_match_table = ali_drw_acpi_match,
 		   },
 	.probe = ali_drw_pmu_probe,
-	.remove_new = ali_drw_pmu_remove,
+	.remove = ali_drw_pmu_remove,
 };
 
 static int __init ali_drw_pmu_init(void)
diff --git a/drivers/perf/amlogic/meson_g12_ddr_pmu.c b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
index 99cc791892bc..f33e9a456e85 100644
--- a/drivers/perf/amlogic/meson_g12_ddr_pmu.c
+++ b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
@@ -379,7 +379,7 @@ MODULE_DEVICE_TABLE(of, meson_ddr_pmu_dt_match);
 
 static struct platform_driver g12_ddr_pmu_driver = {
 	.probe = g12_ddr_pmu_probe,
-	.remove_new = g12_ddr_pmu_remove,
+	.remove = g12_ddr_pmu_remove,
 
 	.driver = {
 		.name = "meson-g12-ddr-pmu",
diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index c76bac668dea..1cc3214d6b6d 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -1705,7 +1705,7 @@ static struct platform_driver cci_pmu_driver = {
 		   .suppress_bind_attrs = true,
 		  },
 	.probe = cci_pmu_probe,
-	.remove_new = cci_pmu_remove,
+	.remove = cci_pmu_remove,
 };
 
 module_platform_driver(cci_pmu_driver);
diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
index 5c66b9278862..d5fcea3d4328 100644
--- a/drivers/perf/arm-ccn.c
+++ b/drivers/perf/arm-ccn.c
@@ -1529,7 +1529,7 @@ static struct platform_driver arm_ccn_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = arm_ccn_probe,
-	.remove_new = arm_ccn_remove,
+	.remove = arm_ccn_remove,
 };
 
 static int __init arm_ccn_init(void)
diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 397a46410f7c..49bd811c6fd6 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2662,7 +2662,7 @@ static struct platform_driver arm_cmn_driver = {
 		.acpi_match_table = ACPI_PTR(arm_cmn_acpi_match),
 	},
 	.probe = arm_cmn_probe,
-	.remove_new = arm_cmn_remove,
+	.remove = arm_cmn_remove,
 };
 
 static int __init arm_cmn_init(void)
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 2158a5975c90..81e8b97e9353 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -1282,7 +1282,7 @@ static struct platform_driver arm_cspmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = arm_cspmu_device_probe,
-	.remove_new = arm_cspmu_device_remove,
+	.remove = arm_cspmu_device_remove,
 	.id_table = arm_cspmu_id,
 };
 
diff --git a/drivers/perf/arm_dmc620_pmu.c b/drivers/perf/arm_dmc620_pmu.c
index 7e5f1d4fca0f..619cf937602f 100644
--- a/drivers/perf/arm_dmc620_pmu.c
+++ b/drivers/perf/arm_dmc620_pmu.c
@@ -750,7 +750,7 @@ static struct platform_driver dmc620_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe	= dmc620_pmu_device_probe,
-	.remove_new = dmc620_pmu_device_remove,
+	.remove	= dmc620_pmu_device_remove,
 };
 
 static int __init dmc620_pmu_init(void)
diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index f2bd25a3470a..cb4fb59fe04b 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -787,7 +787,7 @@ static struct platform_driver dsu_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = dsu_pmu_device_probe,
-	.remove_new = dsu_pmu_device_remove,
+	.remove = dsu_pmu_device_remove,
 };
 
 static int dsu_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index d5fa92ba8373..b1510f660c7a 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -996,7 +996,7 @@ static struct platform_driver smmu_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = smmu_pmu_probe,
-	.remove_new = smmu_pmu_remove,
+	.remove = smmu_pmu_remove,
 	.shutdown = smmu_pmu_shutdown,
 };
 
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3569050f9cf3..fd5b78732603 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1280,7 +1280,7 @@ static struct platform_driver arm_spe_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe	= arm_spe_pmu_device_probe,
-	.remove_new = arm_spe_pmu_device_remove,
+	.remove = arm_spe_pmu_device_remove,
 };
 
 static int __init arm_spe_pmu_init(void)
diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
index 746b92330ca7..b989ffa95d69 100644
--- a/drivers/perf/fsl_imx8_ddr_perf.c
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -846,7 +846,7 @@ static struct platform_driver imx_ddr_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe          = ddr_perf_probe,
-	.remove_new     = ddr_perf_remove,
+	.remove         = ddr_perf_remove,
 };
 
 module_platform_driver(imx_ddr_pmu_driver);
diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index fe1a51f64751..3c856d9a4e97 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -853,7 +853,7 @@ static struct platform_driver imx_ddr_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe          = ddr_perf_probe,
-	.remove_new     = ddr_perf_remove,
+	.remove         = ddr_perf_remove,
 };
 module_platform_driver(imx_ddr_pmu_driver);
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
index 0e923f94fa5b..3f3fb1de11f5 100644
--- a/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c
@@ -358,7 +358,7 @@ static struct platform_driver hisi_cpa_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = hisi_cpa_pmu_probe,
-	.remove_new = hisi_cpa_pmu_remove,
+	.remove = hisi_cpa_pmu_remove,
 };
 
 static int __init hisi_cpa_pmu_module_init(void)
diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index b804e3738113..a6ebf2ec99d3 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -547,7 +547,7 @@ static struct platform_driver hisi_ddrc_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = hisi_ddrc_pmu_probe,
-	.remove_new = hisi_ddrc_pmu_remove,
+	.remove = hisi_ddrc_pmu_remove,
 };
 
 static int __init hisi_ddrc_pmu_module_init(void)
diff --git a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
index 21e69b1cdd4d..32624872596f 100644
--- a/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_hha_pmu.c
@@ -550,7 +550,7 @@ static struct platform_driver hisi_hha_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = hisi_hha_pmu_probe,
-	.remove_new = hisi_hha_pmu_remove,
+	.remove = hisi_hha_pmu_remove,
 };
 
 static int __init hisi_hha_pmu_module_init(void)
diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index 51ba76871097..c235b46ce873 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -584,7 +584,7 @@ static struct platform_driver hisi_l3c_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = hisi_l3c_pmu_probe,
-	.remove_new = hisi_l3c_pmu_remove,
+	.remove = hisi_l3c_pmu_remove,
 };
 
 static int __init hisi_l3c_pmu_module_init(void)
diff --git a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
index 3cdb35c741f9..c0f5d7c73e06 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pa_pmu.c
@@ -538,7 +538,7 @@ static struct platform_driver hisi_pa_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = hisi_pa_pmu_probe,
-	.remove_new = hisi_pa_pmu_remove,
+	.remove = hisi_pa_pmu_remove,
 };
 
 static int __init hisi_pa_pmu_module_init(void)
diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
index 765bbd61db26..c5f4764ee888 100644
--- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
@@ -476,7 +476,7 @@ static struct platform_driver hisi_sllc_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = hisi_sllc_pmu_probe,
-	.remove_new = hisi_sllc_pmu_remove,
+	.remove = hisi_sllc_pmu_remove,
 };
 
 static int __init hisi_sllc_pmu_module_init(void)
diff --git a/drivers/perf/marvell_cn10k_ddr_pmu.c b/drivers/perf/marvell_cn10k_ddr_pmu.c
index 94f1ebcd2a27..8860d9f687ae 100644
--- a/drivers/perf/marvell_cn10k_ddr_pmu.c
+++ b/drivers/perf/marvell_cn10k_ddr_pmu.c
@@ -732,7 +732,7 @@ static struct platform_driver cn10k_ddr_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe		= cn10k_ddr_perf_probe,
-	.remove_new	= cn10k_ddr_perf_remove,
+	.remove		= cn10k_ddr_perf_remove,
 };
 
 static int __init cn10k_ddr_pmu_init(void)
diff --git a/drivers/perf/marvell_cn10k_tad_pmu.c b/drivers/perf/marvell_cn10k_tad_pmu.c
index 9e635f355470..cda55ee35eee 100644
--- a/drivers/perf/marvell_cn10k_tad_pmu.c
+++ b/drivers/perf/marvell_cn10k_tad_pmu.c
@@ -383,7 +383,7 @@ static struct platform_driver tad_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe          = tad_pmu_probe,
-	.remove_new     = tad_pmu_remove,
+	.remove         = tad_pmu_remove,
 };
 
 static int tad_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
index 980e3051edd7..ea8c85729937 100644
--- a/drivers/perf/qcom_l2_pmu.c
+++ b/drivers/perf/qcom_l2_pmu.c
@@ -981,7 +981,7 @@ static struct platform_driver l2_cache_pmu_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = l2_cache_pmu_probe,
-	.remove_new = l2_cache_pmu_remove,
+	.remove = l2_cache_pmu_remove,
 };
 
 static int __init register_l2_cache_pmu_driver(void)
diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index faf763d2c95c..cadd60221b8f 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -1010,7 +1010,7 @@ static struct platform_driver tx2_uncore_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = tx2_uncore_probe,
-	.remove_new = tx2_uncore_remove,
+	.remove = tx2_uncore_remove,
 };
 
 static int __init tx2_uncore_driver_init(void)
diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index c01466ae1e3d..33b5497bdc06 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -1943,7 +1943,7 @@ static void xgene_pmu_remove(struct platform_device *pdev)
 
 static struct platform_driver xgene_pmu_driver = {
 	.probe = xgene_pmu_probe,
-	.remove_new = xgene_pmu_remove,
+	.remove = xgene_pmu_remove,
 	.driver = {
 		.name		= "xgene-pmu",
 		.of_match_table = xgene_pmu_of_match,

base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
-- 
2.45.2


