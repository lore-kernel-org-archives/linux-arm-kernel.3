Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32B5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 07:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=; b=S7j7I8jL2tiD768vPaNr8IXksf
	nQitCGenwprxdqeq5p77qvUaB7zQ86/nJOlPCs9//3spwmTvOPddesdmuFo7rXO3ONWiT7Hmq2XIh
	vBJZsp935yQs+l0CZz8URBKJlH0DTxUjaYchzAaeZ8lFpCqYMBfzE4kqXfKW2T2Co/2+uSyXzT+fp
	auZxqpyrleCrSwHip2LdAXsnHl36mz6+R08oAg6lD3JYdqM+Zp+jtX8vVo/ulJrcMeqjlQ01IpdBq
	OamrmqWePBN3GUqwq4PpUfP1NAhkrjzNLZE0XhSqWL7M6VmsU/YQgxjekN1RK3HA/4FAykIMG0LZU
	4K2gc3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdJj-0000000H7QS-0Cx2;
	Thu, 12 Dec 2024 07:08:59 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdFi-0000000H6TK-4BGv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 07:04:52 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7fc93152edcso227030a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 23:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987090; x=1734591890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=T1IrnPeQzuu1FF+S3cTZdmE0z9w5cBJTyLMARW3I1kiSO+k3LkWmdrYffkHl5DZ/Q8
         QmbQqC2JpUOniy3Co3XhiJPruAFPo9UJbR7cj83VdWeVru2jFK2El82qkwBxVzmCNPRk
         SySXo4GAcyl0kh63mIrMNLBbwezlbfCdR1iit2jGAGVOV5GAsiU5IAH1tiTKfpXtU+d8
         CZfCnbZSiXhElGE3OVMDQcJnR4a9tGc+52Z2gF5Lar1Y6kHu57vrJWk2c3tfg7/hmaeB
         hnU3ekcoz/lJ4RwSUPRG5i63YTxbdRlnyYs0xvS4rBoPILKhxEHL9GsHaEGbHM1Ge7C2
         FYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987090; x=1734591890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=kMvdSYJVAoee4nahBT5P8rPxVZilb2AvJm4qZx8IkWiZddHcChlmzQanuQotQHwT0z
         49DAku5cId50RMvNAG+ApkR5dBibtpECP4iGAc0OZk1mBtIOoN/I27ziZRXdlnpNg0xp
         l+qih+qXiWoFWzCpFirYcTxPcmUlDc5A2w/QpPZfEup9ZF3CymlL1wrP5vU53oERUej4
         hQ410ua+mJH6651ujXoG9MguBbPTJBSxCIxKQ75ms9H2/U1CShrvaieL1gvQdysio9PG
         rADT+PhOn9sxNvyWLcfGx76gG1F7FzEnEop/a7jCiISi6wMJ/3SxbtQWQQru8hFsONM3
         az6w==
X-Forwarded-Encrypted: i=1; AJvYcCU8T43iZEuiSPZAhHVivOHCdPj4htPpkgGmjFer/e+qiWqLo20CX6OEdaioTRpgD8gQ2X1bN/edoWj+rmcY/sLL@lists.infradead.org
X-Gm-Message-State: AOJu0YwbEe0IccOPcsbgxNeuuMMNVgxvqyrctFbAQYoZ85OIEGmCggro
	dUkE+Yws7ZPLJa2ynNNRtbUqO1NiRhug67uNWHwbezS1YTLiMIJe
X-Gm-Gg: ASbGncsmJeGfW898/XtksTBj/e1ljeMyRfFdaY7JMAFWOZuvjTSvPHKgJmpOn2QztEK
	kudKqsToXkzazK5eAf5Hk7qHimi1GWyHG1KMILFIpPpZGv00izXqYEb9tDiGGdFAybLlemY4RCl
	WkGxs2P7hCUFchcgUz7KM652UE9niXtsWXL0dE3cMDbXLQlzcgwZfOjVOh7zEXwX8+IZZPHKkGd
	M7qCH06Cr+/bQDDEMz0Irp4kwwfElXV+8v1olITIS9LsnCZW0Mv1R4x6Z9vly6ckZXs2yzi
X-Google-Smtp-Source: AGHT+IGD5L0XY10ir8ZWn31kZESh8+9pkRmRaTucZ22hPfqRxTf/NOnmFpSI0fmwVeu1XXmMvpKLow==
X-Received: by 2002:a05:6a20:d98:b0:1e1:b0e8:11dc with SMTP id adf61e73a8af0-1e1cefbb8b9mr3506448637.21.1733987090125;
        Wed, 11 Dec 2024 23:04:50 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:49 -0800 (PST)
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
Subject: [PATCH v2 3/7] cpufreq: apple-soc: Allow per-SoC configuration of APPLE_DVFS_CMD_PS1
Date: Thu, 12 Dec 2024 15:03:02 +0800
Message-ID: <20241212070344.3858-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_230451_026198_83194024 
X-CRM114-Status: GOOD (  15.92  )
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

Support for SoC that has a different APPLE_DVFS_CMD_PS1 will be added soon,
so modify the driver first to allow it to be configured per-SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index ad6c7b8f290c..90e34105b50b 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -27,6 +27,7 @@
 #define APPLE_DVFS_CMD_SET		BIT(25)
 #define APPLE_DVFS_CMD_PS2		GENMASK(15, 12)
 #define APPLE_DVFS_CMD_PS1		GENMASK(4, 0)
+#define APPLE_DVFS_CMD_PS1_SHIFT	0
 
 /* Same timebase as CPU counter (24MHz) */
 #define APPLE_DVFS_LAST_CHG_TIME	0x38
@@ -59,6 +60,8 @@ struct apple_soc_cpufreq_info {
 	u64 max_pstate;
 	u64 cur_pstate_mask;
 	u64 cur_pstate_shift;
+	u64 ps1_mask;
+	u64 ps1_shift;
 };
 
 struct apple_cpu_priv {
@@ -74,6 +77,8 @@ static const struct apple_soc_cpufreq_info soc_t8103_info = {
 	.max_pstate = 15,
 	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_T8103,
 	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8103,
+	.ps1_mask = APPLE_DVFS_CMD_PS1,
+	.ps1_shift = APPLE_DVFS_CMD_PS1_SHIFT,
 };
 
 static const struct apple_soc_cpufreq_info soc_t8112_info = {
@@ -81,12 +86,16 @@ static const struct apple_soc_cpufreq_info soc_t8112_info = {
 	.max_pstate = 31,
 	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_T8112,
 	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8112,
+	.ps1_mask = APPLE_DVFS_CMD_PS1,
+	.ps1_shift = APPLE_DVFS_CMD_PS1_SHIFT,
 };
 
 static const struct apple_soc_cpufreq_info soc_default_info = {
 	.has_ps2 = false,
 	.max_pstate = 15,
 	.cur_pstate_mask = 0, /* fallback */
+	.ps1_mask = APPLE_DVFS_CMD_PS1,
+	.ps1_shift = APPLE_DVFS_CMD_PS1_SHIFT,
 };
 
 static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
@@ -152,8 +161,8 @@ static int apple_soc_cpufreq_set_target(struct cpufreq_policy *policy,
 		return -EIO;
 	}
 
-	reg &= ~APPLE_DVFS_CMD_PS1;
-	reg |= FIELD_PREP(APPLE_DVFS_CMD_PS1, pstate);
+	reg &= ~priv->info->ps1_mask;
+	reg |= pstate << priv->info->ps1_shift;
 	if (priv->info->has_ps2) {
 		reg &= ~APPLE_DVFS_CMD_PS2;
 		reg |= FIELD_PREP(APPLE_DVFS_CMD_PS2, pstate);
-- 
2.47.1


