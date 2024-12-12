Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9FDE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 07:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=; b=KgN904jVAQEOrw1ns/kyFEsE6/
	6/5iia7M8ncdOMb2erynt4yjzKzBz+cHQUVt3GMdU709zgoRViLNR0HbmkareqVT9xYdkaUYlmbNE
	HB0RfncBnG/X1WdVj7EbIOCa3TuxOFBUOaKnmyzlUZrksuuLWawToq5QOCHpJqzyG4KCsSNUM0l7T
	68E4TmO3DALtZG+AA4xJ75kcgj+taGqS1aBU+QOHtlUa63dXzCtAa1oBCdFp3Gb92Kb/5hAPTcmIG
	o4fgDKp7eEnTOBTUdDw7FC0b0SVX9uC0m/OnB7ATMoRRnypvKIlc3i4knrqEVVbNEP9IF8hZYI8Qm
	mqojXioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdIg-0000000H7DS-1Nvb;
	Thu, 12 Dec 2024 07:07:54 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdFg-0000000H6Se-0MRi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 07:04:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-725ecc42d43so244234b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 23:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987087; x=1734591887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=XpjPwALJxAdjCJIgihrLMOPYD4yu2q0tFhuM6DHQMT8/z8E4K8wslqvxvhOnAxvswp
         jU1Aloi6qLFwXgqyUjKt1djIJR7wWefBZAJwl4iZR2fur6Xg0PXhKYTw4jsgGKONr4V6
         Loof0ZURj1a7OKcUu+Z3PxApK4tsjVCKxFV1V8LKjxfcKSwp1TAim2DhCE/UAr9ThmDn
         tXPKmtOIx2oJAVM3aAI45tSZ6pzvieSTISFbdjeFiKsPE8BUySfQZ/uDxbNofhezo935
         XHg2u71Lcu47ASAeKMZGRaOBS2aNfiv+eUgO7e/J6JfjKs5y4s2Vo3pFU8PIRDC4WCkA
         fCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987087; x=1734591887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=mmRrcztCsdMmHPDz0Quuw018cAPIhfVvQvY6dFtDzX+gGqC35effC6tjffN/KApk3W
         mo4ePZESDoy7PPOZ2HNHexkJEyPOMG8FMCRlME2JxO3XRAwoG6KG8LttE7YYIbFLxxzo
         jjFjFokly85kn4AeNVP0ZCK7p2Z9OvNuevMRYTvHxjXOSVTWSAJF0umFTHzn6Eec2+6R
         od8dOyI5EXIbot73LEwCXkJ7SIABF4EMZC8RIR0h7ZYqF66fW82RpsAvWbxYqH//N+04
         X/FQEQuoH7iQ5uemvOifUIgGvy7qgHYLZldsTDi9uTXZrVoVd2cexVG04pYRUws1pPHg
         kTZw==
X-Forwarded-Encrypted: i=1; AJvYcCXmuxF4Ek6xVFCOTCNIoAdJeqpSgGwpzRqwQaMVz5uoXJdUGAlzCymbHjgJWOeuduTeUiV57KyZ1xP/pySDUtz2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxai0Sy5AqmgyuvhOpzh2iMLM4JQRlGIKCjmNFpFXwGtyDabfha
	Zr5KulR70ZeYI5no3AxKd0SXQIMbk1ZYGmPPW/lapftpolb2Wkz+jWlvkxrU
X-Gm-Gg: ASbGncsR02vQF3RCeKN8tcdSTc3IXCJbezXv2tCS4ytHzeDT/J+4adx/6B6XXrIlAGe
	TNGtkQP00B9tqYVSdc2chRelWuZKNgeC4JTlwqYbXtdP1EadmCofQvaIHjJstRmRxD0LFiplWXo
	jAhxR5NRX93wqUL8LwwNNZBjFm4eplqj/CUpS/X5lTuvaqO0sx/noIp3JVu0ndbDCAtVTL9v0x3
	H2yFdozaB9TGmJvAAibn0cThU+Hzxnc9TE64xJKte9YB8dj6Y0UXHUYhlFgJiqKLSSI80Bq
X-Google-Smtp-Source: AGHT+IGvBAQXtMRTleyDW6x3HzSYF2eqnBC5Rmkc6964KlaHxGxL1kuAEnMzaZToFmlebupGFAzwyQ==
X-Received: by 2002:a05:6a00:999:b0:727:3cd0:112b with SMTP id d2e1a72fcca58-728fa9e5e39mr3210909b3a.9.1733987087085;
        Wed, 11 Dec 2024 23:04:47 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 2/7] cpufreq: apple-soc: Drop setting the PS2 field on M2+
Date: Thu, 12 Dec 2024 15:03:01 +0800
Message-ID: <20241212070344.3858-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_230448_115343_46F86722 
X-CRM114-Status: GOOD (  15.46  )
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

From: Hector Martin <marcan@marcan.st>

Newer device do not use this. It is not known what this field does,
but change the behavior to be same as macOS to be safe.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 4dcacab9b4bf..ad6c7b8f290c 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -25,7 +25,7 @@
 #define APPLE_DVFS_CMD			0x20
 #define APPLE_DVFS_CMD_BUSY		BIT(31)
 #define APPLE_DVFS_CMD_SET		BIT(25)
-#define APPLE_DVFS_CMD_PS2		GENMASK(16, 12)
+#define APPLE_DVFS_CMD_PS2		GENMASK(15, 12)
 #define APPLE_DVFS_CMD_PS1		GENMASK(4, 0)
 
 /* Same timebase as CPU counter (24MHz) */
@@ -55,6 +55,7 @@
 #define APPLE_DVFS_TRANSITION_TIMEOUT 100
 
 struct apple_soc_cpufreq_info {
+	bool has_ps2;
 	u64 max_pstate;
 	u64 cur_pstate_mask;
 	u64 cur_pstate_shift;
@@ -69,18 +70,21 @@ struct apple_cpu_priv {
 static struct cpufreq_driver apple_soc_cpufreq_driver;
 
 static const struct apple_soc_cpufreq_info soc_t8103_info = {
+	.has_ps2 = true,
 	.max_pstate = 15,
 	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_T8103,
 	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8103,
 };
 
 static const struct apple_soc_cpufreq_info soc_t8112_info = {
+	.has_ps2 = false,
 	.max_pstate = 31,
 	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_T8112,
 	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8112,
 };
 
 static const struct apple_soc_cpufreq_info soc_default_info = {
+	.has_ps2 = false,
 	.max_pstate = 15,
 	.cur_pstate_mask = 0, /* fallback */
 };
@@ -148,9 +152,12 @@ static int apple_soc_cpufreq_set_target(struct cpufreq_policy *policy,
 		return -EIO;
 	}
 
-	reg &= ~(APPLE_DVFS_CMD_PS1 | APPLE_DVFS_CMD_PS2);
+	reg &= ~APPLE_DVFS_CMD_PS1;
 	reg |= FIELD_PREP(APPLE_DVFS_CMD_PS1, pstate);
-	reg |= FIELD_PREP(APPLE_DVFS_CMD_PS2, pstate);
+	if (priv->info->has_ps2) {
+		reg &= ~APPLE_DVFS_CMD_PS2;
+		reg |= FIELD_PREP(APPLE_DVFS_CMD_PS2, pstate);
+	}
 	reg |= APPLE_DVFS_CMD_SET;
 
 	writeq_relaxed(reg, priv->reg_base + APPLE_DVFS_CMD);
-- 
2.47.1


