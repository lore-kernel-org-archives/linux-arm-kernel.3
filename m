Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AB8C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=579Q1QhHC2sKl8ad1uJdu4XVU+r2uSj185NnGxhlUu0=; b=QOGexXknhLZ6h63ZNd0G5SKpkp
	zLPR/WPO4XbLOeeybpUmjIs8gVhtMfhyLMl8kw1S3hhpKyaodde4S6bG422VyyBKP1V5ScPOAxDsp
	jprr+tAHScxKuww98YHHx1fMZk/UzcidFGanWx5+E9yyFiTTSsLODpKIXu2CaCt3BC9b4fGYt89L9
	9vB6AqBH2lT3goRl17Zr42cRaFF09LA8iNjMIwyqCxRMLFcEvWDH7qoQgbNMP14NiAfxobsL13hbq
	P+u+ufGU4T/X5BiHLKMBdXcFJ7O4rHF9eR6o/FR2IV44StFV7DdGJVGT6HNs2WeUNz8evo7Vz6nqO
	Kse8CDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUJ-0000000DVus-35EW;
	Thu, 19 Jun 2025 15:47:39 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEJa-0000000D2aX-2cYv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:24:23 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-addda47ebeaso145465666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 05:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335861; x=1750940661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=579Q1QhHC2sKl8ad1uJdu4XVU+r2uSj185NnGxhlUu0=;
        b=iWmwAOao2FY3LqrtmlLVaFCMVBLTncUMbGld+lBWuG60algSwBkHVliVrfdPzYOTvv
         GbhF75YkfGd6T6KakvlMawQH3KW8EWbcpcpo9TOYW8WtsKbLdePLdhlou6rzcbPNR9w4
         eoItLYZmX5H/Df1Wt5RizYg591R9LHkKfyV1VGpYc4LTpVIoi1vWi+b1BuT6CUq0iQ/o
         XE5/mp1OdF0lvGuioFJUT0ps5i5LckeawILbHYbUsMSvFFnOE0tEg7S30hSuMEjP4b03
         4EEbsCz7WETX3QI81Iptml07AhOsepQn4FSIR66pk1cRdRG+XnN7/+/Ms8Wfttyo/TTE
         gmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335861; x=1750940661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=579Q1QhHC2sKl8ad1uJdu4XVU+r2uSj185NnGxhlUu0=;
        b=H+YlHfgShWvQpk88/EgqJMhLJSrsjh4LSdNIrHMGOqz3fpIEiWkjjFFmnFGFw0jg6+
         ASI9kpE7JRPV3kWoHp7nhIwAbPlVAQd9bM31PXT3B/ONIydAd0AiLUHqfDSjpHWgU5mE
         rlPd00M6a13itZ25VvksAlprWKJ1r9BeWrOYFEcZSQDiX7WIa2xtxD8NYQJBKHwfiX5P
         I7lsIwRigAf0tVLhMlJ/8TW5kYE1sb0SQeRhstEkvSGJm/2wsspvTc0E0umTNgcYF+mE
         M1XoZ3qBGXHgVfJY2puU3MiCOz9D9iX4/go4kO6UrjOG1k7vOz3e8cPvk+Aq1Bytgbzw
         lVsA==
X-Forwarded-Encrypted: i=1; AJvYcCW+aw3UVEeXwbbvd/eRfCNfxf80ACB2mJTrJCDMBo2JqKujfGSbHEY08lYIED7xO/o30YIsy/i7SebO3Bu1x0dA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/nVVDiPkLmjMmPlMGN51VoJysi/v4NFmXy2Fn7rMF5LqdL/FY
	OuOz3jEIGu62m0ptCLMrj9zOU8nU0A5xSGXu67D6/KdbtCOlDS1C2yKj
X-Gm-Gg: ASbGncthcoK9M+RfviCxlqDtFoxtGr1abPjYNtIbu+Q/0JJuXA100sQaC0NRzGHtWC4
	HZ4JhgmvEYeW7pUZa/ssp6Eu8kqBdvABdITAzclw5XoViduY8PvXdCzaaIdlK0pf6+7fLx3x4Co
	mnVhj5LLaAjhbmcakQQ48mqaIu03dTQvXSy5lE+mamCGdPulMh7gRoD543W2F5YQTaxX1UZwV/P
	fW2AfZlxPe/ATOVuzXPse1Y+o1CisPIcHXB8im/5tu/myw2T9Rl+mNbfRSQerQ7FvUIJUjutdW/
	yZxYAahIS08n9fcOM0eE6aE/ZnzmBG+01zjtFXsj5eKUvroqZ+LO2a83nTtVxBU8uvDeqDqP3Um
	tmVwj7MeYprPMnA==
X-Google-Smtp-Source: AGHT+IHH6DFXlW3XSv30gN9W1MaxFbV4Xi7gLnQBbzesKqNPz0MrTZ8hdE2KCDgVxH4xeRlqT8acsw==
X-Received: by 2002:a17:907:9694:b0:ad5:4a43:5ae8 with SMTP id a640c23a62f3a-adfad31cd15mr2245682266b.12.1750335860965;
        Thu, 19 Jun 2025 05:24:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:20 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 09/10] crypto: sun8i-ce - add a new function for dumping task descriptors
Date: Thu, 19 Jun 2025 15:23:15 +0300
Message-ID: <20250619122316.2587236-10-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052422_663251_C84D6B13 
X-CRM114-Status: GOOD (  12.22  )
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

In order to remove code duplication, factor out task descriptor dumping to
a new function sun8i_ce_dump_task_descriptors().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 930a6579d853..b6cfc6758a5a 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -169,6 +169,12 @@ static const struct ce_variant ce_r40_variant = {
 	.trng = CE_ID_NOTSUPP,
 };
 
+static void sun8i_ce_dump_task_descriptors(struct sun8i_ce_flow *chan)
+{
+	print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
+		       chan->tl, sizeof(struct ce_task), false);
+}
+
 /*
  * sun8i_ce_get_engine_number() get the next channel slot
  * This is a simple round-robin way of getting the next channel
@@ -183,7 +189,6 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 {
 	u32 v;
 	int err = 0;
-	struct ce_task *cet = ce->chanlist[flow].tl;
 
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	ce->chanlist[flow].stat_req++;
@@ -225,9 +230,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		/* Sadly, the error bit is not per flow */
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
@@ -244,9 +248,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		v &= 0xF;
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
@@ -260,9 +263,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		v &= 0xFF;
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
-- 
2.49.0


