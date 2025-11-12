Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157EBCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E6N2LkhR7aeG78fCFoaE5f7J6Vqh6iLlOX4wNPsAzjs=; b=k1HlCCMDvEqkEgMSChzwspHyVf
	g7myx1m+0VaaFie8/34SamDXV9geVpuLxlRzWFlHjAMejweSARpvU7vureaiq1Ok2aJzvaqe4vl8B
	SzoMoenbHcwJpByrR1RoU2YfdvT3RGvo72L0c6t6qe9Nb6BL1iBCWfExHYTK4GfQsu9TNzWd3oRsT
	zdKypfhNtVNWr6CZusMiZRIlQkdiI+EMIpCc3ldU87WLe2UJlRpCgKC1jO1Wsnm13hzKsN53kGbB6
	H8a/kGy4M2VQSjcUU9Vs33C/XCR68ZIHfdxPPpm8D/6vNYZKsKNElaO/gr+5lZpI+OxAQVvHT+Mrr
	RiOIDbDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC31-00000008yc3-3Y4m;
	Wed, 12 Nov 2025 14:42:11 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJC2y-00000008yXw-0Clf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:42:10 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so1223561a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 06:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762958525; x=1763563325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6N2LkhR7aeG78fCFoaE5f7J6Vqh6iLlOX4wNPsAzjs=;
        b=K+ylO7NoA/vvDYAK3GHldVupmcGfO+Zi1oa5rJz80SGxOHtz4pxJhZahlkYkIVxSG/
         3Rpt3OwVP5QRWtTMiY5z3qE/9A6sbv2LhWw6xMErmRV2k4SakXCW/Hm8nt+Ao+ORMxZv
         LmeEphISvcjeTwkSJTK8HjNCE72ucedDtYRE2+bQnGDB8R9G7MEifhbA+jLGOkueaNvW
         ZLFMzBYR5sldxQmFx5r+VR8lEyhS9FomSyMylyYdtA69JMdS7I4eIbXxrudLQei4xGe8
         cT4IeFr+VHfn7/26g5Sc/f7VnEPAAlvswQLKN95V1CpGQNqxlcpY/fzJ3gaPIPgeuPhC
         8IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762958525; x=1763563325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6N2LkhR7aeG78fCFoaE5f7J6Vqh6iLlOX4wNPsAzjs=;
        b=KXF8W/tKoSIBgDiL2Na8itH6alY6Sa80no8lR1ULT459xG6m/XKJP/HvsJ19BSwMvQ
         xpgqMUg4mOT5aBqSOU0Nb/RyEWjRqv9J9gTUo4F23HPYLn0Igkwp34RA+w3vIFkvyDcU
         FhJ+e5wkGeK+d7vUcVt30Yu4MF/GYb2iLhDcjYAos8Eje/rvFeeURj0qDDGJ1255hSDq
         rVhGnT3nQq1rREE8CTromfcYUnI0CHeQsDXRlK/+UK5YV6SUgL2eShpl6J4A60zJfY4q
         Q2paFxHfa4T2thBX+hbjAYqbeune5BgWQdDp14hlej74jQ+vLFBhBieLp4DBeM6YYz+c
         EMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1BdDOeYwtfMra6qktCne0OhOfiIzL4G8BtfS3kjXvgM0/nkmbZWlYVNY34tC110BefmDLZegUdHszBUARRBkP@lists.infradead.org
X-Gm-Message-State: AOJu0YxW2jDqSOYJWKrtonVug90ao/Tq2khK965jdXWi8YVgxdgl/tbf
	Ft4ZXpjqNtwkd4ILQKAa7JqS7ngo1X1sj5dV61dsS2Scp8ln3aKm/KaJ
X-Gm-Gg: ASbGnctWF5IKzCY6FpW8QVHmNffXGLR+KK+8Bm/DHNny676UC516rrjq+UVTjkImWaf
	+6Z/75d3GyL9f/FrrrVlCnKDxXf4QC3tcpVctTuqG4w1QRVeDpZGojquF/vpRavX0ukH9y67trP
	IPgEgIlX6a9KYG026jbMVl+pHAPNOMpuUzCk1FlfCcVO0ygFctI3BAhGccPDOTj1HY4X1u/z0aG
	CD95Y92Cbj2WGy3QC+RnEmC/g/EUd8lCILshoK1NVkNQM64sgEnVgnQFivUNMNdS58sMICv8Zhs
	Iz2EXfmT2FN9Orw3VUik0Q11e9kiFTr8xXnMIU7gstWyVgVOn77WlieS1qXQS9XmVi2UNsdInNb
	NPQSXT/bf4GuT5OJYIxeTOFWlVqkJg9M0gJDB4NahIihgGcMVbKbIFSD+lgNXfXdPNDEShgxV0n
	3BqLWjuK4OSwG90cuirJogtAFqdsM=
X-Google-Smtp-Source: AGHT+IFTNGoT4aTk5EceAUoALwAHvKb+bdrKgtaYUbE8eWmnwtKSrKlBlBHMiZPM5J2J25G44v5DFQ==
X-Received: by 2002:a05:6402:13c1:b0:640:528c:7d49 with SMTP id 4fb4d7f45d1cf-6431a57e4d4mr3033556a12.38.1762958524375;
        Wed, 12 Nov 2025 06:42:04 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64183bc4533sm8411180a12.4.2025.11.12.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:42:04 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: imx9: use SCMI API for LM management
Date: Wed, 12 Nov 2025 06:41:24 -0800
Message-ID: <20251112144124.680-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_064208_147436_278D990C 
X-CRM114-Status: GOOD (  13.30  )
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
 sound/soc/sof/imx/imx9.c | 36 ++++++++----------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

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


