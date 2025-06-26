Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E387C8302A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=579Q1QhHC2sKl8ad1uJdu4XVU+r2uSj185NnGxhlUu0=; b=1DAr1JTgCo+yRuRBhYlsRTIeck
	UzWj3yZ16UJUn/CdSyiZaOW3vg5VZdNfXpENJbshOrPIC57nFB2cAKeYqqcFTZff3M0Lc9R+tetYO
	fh/dEZjDSmKuG9mPfRIQSKO1BUAmGteVo5ATcmXoEGq2mzpDcnsiSR1QDgdISe8/bQ99YwZlHPeHG
	GfaAjAdQfFAdHOOdw3PizEp8igkqSHP3tFYfvEVzJy+AvcFp9fAV6tFbvZLPVXDZZhjJwOgJBYpag
	0vl05ZYC7tsF2rOJcVJbHZITkoghSO8RhgxWLHgVn3xEw/TNr8+E7015T+rjn75qo3OTCwFB/fn9i
	CoU4wmCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkh3-0000000BO2K-3fbD;
	Thu, 26 Jun 2025 11:23:01 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjOE-0000000BDva-1vW8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:59:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso379053666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931969; x=1751536769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=579Q1QhHC2sKl8ad1uJdu4XVU+r2uSj185NnGxhlUu0=;
        b=QcidZDpLZh0zEjiOHwyjdhU5xpfaiApS9ZeIsnXgfHqJwgHRGviim56/5Lf2reDq5l
         LEtAonblk7btWhNr2Jm56rFpvmEU4nyHaQZnZIqBkhT83bqWBG3J1rE4X0wtTIuWjX16
         dk7j9dkSRCQJre+Up4oCFANB+qCB9rKkyg5QXJqcboFsUta30k1DbuawBIW5IeLxItee
         ipdDuHk+ckgiuELucptTq4/qCAMEZsw5qu77mD9g7Fi/Es0q7zrHmDKUMmxz/ffI7DUf
         OAwvRdgNQWskx2AltTlh2P8aMt2tG4+HyFHWzy5oIsKF+gET6j9vlal8uYGV1BzIJEts
         KJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931969; x=1751536769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=579Q1QhHC2sKl8ad1uJdu4XVU+r2uSj185NnGxhlUu0=;
        b=OGb02PcADo3myWt45OtGGYV1R+om1RHmqbXG916FLZzIaEoegk6KJa8E/4jnXTzCxw
         nVF+LWfKcftfBp6zUmBElE8IlnPyQPNTkGVqrnn7+/EobNLpUu6jgpMRnJOPSOpWg2Is
         ZjPpyzqASEHRdkskuR6q9cnnkOzhR+lWGVRNFTCycaZJJMFwyPCZ75IaFKV866Xkdnrl
         9gndrxYGAyzX1gZ1gBWv2MMoif03A9pJNV80tJXY1MkdLDjJ8Atjjpbd8NgZIiu+n3rp
         saU8bW7BCesthLDkezG5GWGijQYS53CZMWXo/KbMv+p1hGpwSQum955uLj54OsnjH+/I
         JJjw==
X-Forwarded-Encrypted: i=1; AJvYcCXFH/vil5c6IQbgensjXJuHDlMm3kDev93vDcQEIUQ2uTpo/XiTJav5o6jMW76HiCJ4A26sC/s41zkjy9YZAe1b@lists.infradead.org
X-Gm-Message-State: AOJu0YyFP7pIZN0APe0zHxbhZ6/7aF3JE/qOQjDZljTyhugJuuX+51TW
	ObKEa14JtrHKYz0Tk0nEIcGs+RL8OlOA6ecs/sCgFgtheiSJ7GAI29Vo
X-Gm-Gg: ASbGncs93nAYyd7HRlO3q0RdXm2fWE7Hd6QonxsBywRt68hgHJPznpoJAChpW/cnJxU
	fUSIFyMzneOStbyApa1ys56B4D/3vKU5hKLfGf00DRs45FZi9XneLQEPkuOwyXIu/QqZMRIK8L/
	QDdTbwsr2jwyaxo74JteZy0Vk1S4KiUEfkuLFHP7NzuFaMrLtdGsqNPajS/EBvR5Wm3uVl0Zdeo
	MpiCTmD9ecch9lxZBr9jK0yxUgEZcEE2GPDrobbnOvvFK3WuCO9iYNJREMF/3ELBP7dYyW7E38X
	x7GIZC7FAuEkW1fxIwlwqm+OBpLgOh3wRC+Y2MZ50g3N+xa7higzOUA19VRHt5Ox8P02avuXAC6
	diKHJ56oGRj8P4w==
X-Google-Smtp-Source: AGHT+IGVv+Hw7jSjoixa1/E7zQmSwh1p6WVQXmOD2Loe5VSlhlnuizOR3ugGTm+11YiJ3z+bTMozvg==
X-Received: by 2002:a17:906:d553:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae0d26f80f4mr322465866b.28.1750931968753;
        Thu, 26 Jun 2025 02:59:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:28 -0700 (PDT)
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
Subject: [PATCH v2 09/10] crypto: sun8i-ce - add a new function for dumping task descriptors
Date: Thu, 26 Jun 2025 12:58:12 +0300
Message-ID: <20250626095813.83963-10-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025930_518443_43B33B6C 
X-CRM114-Status: GOOD (  11.85  )
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


