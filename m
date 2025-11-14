Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51394CE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=usqzkbXAktOV+QTZEhZmGU1PKdliPqoVmQQvPTmUm64=; b=nz19PGiHfQzJuR27LWCukjN/kH
	nkxoPxTsAMn83kazLTnyK+DPQCYCc4DrxO57Msesthd7DaXPDp0h5vHLdWwClG0BQ1lEd3Jbs6igp
	TjJCjth/d1k/0xbGpTVD8sQBo24uTnNy1J22+DodOGaT5S96c4HK/SCY91uBFY3FOVc6R5V+ybhlc
	NXPtXWY6VzgQR3DBvzA2jQm2dWHSyfGE3pizbpYobFGVGjSIHKd+hQtqWybO6vQHB1Uj2X+gqYkHi
	YGHlOQuW0XykQx/As+5MZsnl3JhQxGnlZgivbFa/luqxUZNlMfrOhouGS5yKvaDw1IRem7xMF5f7e
	SKevxazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuu7-0000000COMc-1xgm;
	Fri, 14 Nov 2025 14:35:59 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuu4-0000000COM7-43qG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:35:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6419e6dab7fso3091604a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763130955; x=1763735755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=usqzkbXAktOV+QTZEhZmGU1PKdliPqoVmQQvPTmUm64=;
        b=bBGay4UroRQr0Ggxf+h5tJkSp9GmP9vUIssE7AAYeX6qqY9e9g/6MqrHJMM8hG5E6f
         hig6Eq29KP5esPdilIkeOApYTuG1spCNs0VX3XqsB+wB83y/O5oSQXyZ0wPsYgcu1Zab
         8LZFhECRyQO5UHwy5DFCwe9P1xU7SmyH5DAKrpStfqdKMvIf+S8lobGEBd9ybjrTMvqh
         c+HKPmRBBjcZpaevnbtYakMts72l5VwimKCMrn8FmkTjpocHFN8BXobiJSSyi0ckFoJF
         ps7zxsP1ehTsxPNieFzwcDQAM8/h3g6XG+Csvux42r1DONRqq5qbnk/0ecSPol8gthkU
         SiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130955; x=1763735755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usqzkbXAktOV+QTZEhZmGU1PKdliPqoVmQQvPTmUm64=;
        b=eZVW+8ob1ktLXM00g065lcn55cYvt8r7mfVV6cyGs1Eg73edexsQMILBylokmFtc2o
         Msx9fwVrYxsRFzeKvyzuRl4gqvMhQmHAW8TYto7Gmp8TUsuBnUIbRolDGfhKkXA9UdbF
         8f/xbcaCamKMubHVuEMrwwXP/xcHcSAyBhbSZGAff6BtB4/mWTKZH2EWDpXlVyUcmyLL
         OyGG8lARy9v9AmbUKfvgEOrhktDBalgyKeuElI0b55ROGgvHIzjk8725IT0GJWz08CP7
         Ggi0ncBM1QxIiGbxUhh4wVaJlbK9Av/7xQRzmusK3uooTfTYzCiJnRzLl6J7IOuRu7q6
         G9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVuK8n4qHsqaSJ88ZyMP1FB6dV5pzkY22pqpAui3LUrrkpBKW6Hw1nKXiM+izKVbi0oWsgPJScfLDg5kc3FOS4u@lists.infradead.org
X-Gm-Message-State: AOJu0YyIOmaTp5t8RDQ2kXfw3BZ3iK31pjz4Z5Ebk6TCnuqccwhRHGVu
	w3X/MoqdNVqx86mXrtrt2bCvIN3t10K+fjoPMa26jubKWgCa2RlhJZNW
X-Gm-Gg: ASbGnctNlD3t9TBRKVg8V2pgQKVEzrlcGcohXSL9C8MiE+69yqgQ3SWcCTor/BSQKlG
	1l4wuZi7YtazEb/Oewzi0fCOGqXf/nPEb/HARhI4YS5H5H17DoN7s8eT4SQCssCyinsj4ZOd+8/
	19rZGQwJnvWPB++Zum6V2cDtMjiDlgWS1SLFaGnlxCMz7Vheg/ycLaAR3ryriImecC7MSNnYPwU
	qhHiqSD0X9ISM6M4s0OABr/bpogbNlNnXiW4sesvD1NfKzNxlrxZkYQf1tpYb/3OxIIaEG7JXvg
	03pZgfUMdv1ejZNlMp/wNYcxkROyIC0Yw8+eUS5h8FOcJXtgn4F2SV5zfF+v9i+TQuizUmRJqWv
	mAZw80l9im2wMdMIQeqECFo4jV7OP6XNzeKqoceBf7pBBTCcQmkdD2Hg2Q6qs8DzmqoifEcJtbH
	QzRnmf9eyRcOuUG1TvEeqiWaNgDCtWAGXCZMBC3Q==
X-Google-Smtp-Source: AGHT+IEkXh8aOaEa9VYbV+mSh0EevYMCtp8lTPm/U4emLvWPOqyGjxIaHiTsSpt8P+ehxwrwdlpbfQ==
X-Received: by 2002:a17:907:6d1b:b0:b72:ad95:c1c2 with SMTP id a640c23a62f3a-b7367828c43mr340632166b.11.1763130954832;
        Fri, 14 Nov 2025 06:35:54 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa80afbsm391264766b.11.2025.11.14.06.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:35:54 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: SOF: imx9: use SCMI API for LM management
Date: Fri, 14 Nov 2025 06:35:03 -0800
Message-ID: <20251114143503.2139-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_063557_253968_E500B39E 
X-CRM114-Status: GOOD (  14.99  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Linux supports NXP's LMM SCMI protocol so switch to using the appropriate
API. The SIPs were intended to act as placeholders until the support for
said protocol was upstreamed.

The underlying CPU protocol command from IMX_SIP_SRC_M_RESET_ADDR_SET is
replaced by a LMM protocol command with the same effect (i.e. setting the
boot address) since using the CPU protocol would require additional
permissions (which TF-A already had). Apart from this, the SIPs are
replaced by their equivalent Linux LMM commands.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
Changes in v2:

* add dependency on CONFIG_IMX_SCMI_LMM_DRV.
* link to v1: https://lore.kernel.org/lkml/20251112144124.680-1-laurentiumihalcea111@gmail.com/

 sound/soc/sof/imx/Kconfig |  1 +
 sound/soc/sof/imx/imx9.c  | 36 ++++++++----------------------------
 2 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 327e2df94a58..09d88ce5b9e6 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -35,6 +35,7 @@ config SND_SOC_SOF_IMX8
 config SND_SOC_SOF_IMX9
 	tristate "SOF support for i.MX9"
 	depends on IMX_DSP
+	depends on IMX_SCMI_LMM_DRV
 	select SND_SOC_SOF_IMX_COMMON
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX9 platforms.
diff --git a/sound/soc/sof/imx/imx9.c b/sound/soc/sof/imx/imx9.c
index 853155d5990a..e56e8a1c8022 100644
--- a/sound/soc/sof/imx/imx9.c
+++ b/sound/soc/sof/imx/imx9.c
@@ -3,19 +3,11 @@
  * Copyright 2025 NXP
  */
 
-#include <linux/arm-smccc.h>
+#include <linux/firmware/imx/sm.h>
 
 #include "imx-common.h"
 
-#define IMX_SIP_SRC 0xC2000005
-#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
-
-#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
-
-#define IMX_SIP_LMM 0xC200000F
-#define IMX_SIP_LMM_BOOT 0x0
-#define IMX_SIP_LMM_SHUTDOWN 0x1
-
+#define IMX95_M7_CPU_ID 0x1
 #define IMX95_M7_LM_ID 0x1
 
 static struct snd_soc_dai_driver imx95_dai[] = {
@@ -38,7 +30,6 @@ static int imx95_ops_init(struct snd_sof_dev *sdev)
 
 static int imx95_chip_probe(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
 	struct platform_device *pdev;
 	struct resource *res;
 
@@ -49,31 +40,20 @@ static int imx95_chip_probe(struct snd_sof_dev *sdev)
 		return dev_err_probe(sdev->dev, -ENODEV,
 				     "failed to fetch SRAM region\n");
 
-	/* set core boot reset address */
-	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, res->start,
-		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_reset_vector_set(IMX95_M7_LM_ID, IMX95_M7_CPU_ID,
+					     0, res->start);
 }
 
 static int imx95_core_kick(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
-
-	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT,
-		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_operation(IMX95_M7_LM_ID, SCMI_IMX_LMM_BOOT, 0);
 }
 
 static int imx95_core_shutdown(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
-
-	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN,
-		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_operation(IMX95_M7_LM_ID,
+				      SCMI_IMX_LMM_SHUTDOWN,
+				      SCMI_IMX_LMM_OP_FORCEFUL);
 }
 
 static const struct imx_chip_ops imx95_chip_ops = {
-- 
2.43.0


