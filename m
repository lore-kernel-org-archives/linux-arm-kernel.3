Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE3FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=; b=xu7NAx981YO6f/o8lj8Y5rn7QA
	rZj5/sI1kU1fr8QFi7SBnqYVUep2hIU0HQ5tkiItC3CADy1ZdHWK1ftCzGna8cAPpUE8cuveswMWK
	B251+FKjx1pVP8s4VP3DhyvxU/IyylxuNrdXTr/2PUYHLYghlvC+A6v9/5ahCxdsevpWFMo84m7f9
	/4GsergxMdSJbccfYl11T+wWFI1xAY2AWO+tW0YQpdvr0cJDKJOO0EBKZu0X5ZD9yYHDr/s/8X5OU
	f0YHms0DjLLlqU+jp3ItPF8QvTGMi9Yr7afO9igfCoHB9lDSOLZv6MKZJl+FxcVJFF5SgcSWydIZC
	8jaw9GWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKsF-0000000EhDW-0xwu;
	Wed, 11 Dec 2024 11:27:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKoE-0000000EgFz-0AgZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:23:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-215770613dbso44172795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916193; x=1734520993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=WnIl75JeXo9wTAu2Erl24+s+goeOBXxAF9Y6EqITS6fc/uXwp/cqp7ofCY8+H/2f52
         4HoNLiKZqT52FBcsHLdZI7Z0+8/AxVaJaXBrlbFBGWLKdnGYp641TSbk5BwqNtpa70/C
         Itc+0LKyJXvheFKM9U/BAVbsONR3SVwSwRtEXLozt+RokPjUWY2fP1zHST64Mn/sV8tQ
         i5nUzcMp9FZTjAtkkjBFxH1Osr25zdyorWscZIBTLwkzC57KWTJEc8pubFTTLr18bEGn
         nT8Ctc7ByhY/ir/2U3Mcnu3KwxKdrr3AUSysTT8CalkAAjAwBv6In6EvdEM/O1sgiPYn
         56uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916193; x=1734520993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=efubHn0IurWRHfcDC9E4NaVdZusVNUr4m6eKnSR4wYYidr3GuBiLVj0/4lz67Wwht1
         Hspv/rAkCShZZ2DiOXW6WfGpEf9GyGLJHk8QEd11d8gghuyk0bDpWIRZa8mY8alnqs3a
         eKILowKJ9hB9wglTmkv4KxIngKulzCGIHSKMxV/lIC6TIcItKCkZuZgARD81bxe+l+lP
         Wt99iTZwr1A0iUpq4CJ1qzVSSOFW1+UwTEEj8K0rdet5SyGsV786VMWDR6DHUmg0Q7vL
         xeWEjb9FLMy0tRhmDuCXovpJJgSkrAhDgksanC8XZ8UASQHQTJ17gV03b6Dvyk2n/NwP
         iDCA==
X-Forwarded-Encrypted: i=1; AJvYcCV48eqa+3sMj3yfV3bUdVuoagOPz/jMhFrtjciCu9luui3V22IxFPVrpnIbPF2rnw6yODEUo5cr+qnUHFv8efv5@lists.infradead.org
X-Gm-Message-State: AOJu0YzIilT2GB240sDWu0ZukhgMsqPkq+E8BIOclp3AuSbwsPdkB+TS
	UilLv0jO+7EXB/b5dnbNAWiACBdAhm9pwMqX3mjwqkWLMPhCzHgN
X-Gm-Gg: ASbGnctGWzK7MVLuVwjB540VRi+oOtwFAPuJ1SVlxYkY9C5eDC2COhaj//BC4g8mUYK
	27m05lnTlMGxcV0COlWAcqVqfCTiynsvNDdV4ulSpgYZsrBbAziKZEdEbiFYE9Fi4FwU28p2DsM
	QL79daHmiCTSBIQ3P3uPlSvO8LzE+X8VSPfYSJH8b/6yS0cypSOpsHqjWBO2XWBl3yNht2zzQwV
	qC+Njm0Kjwa/P3NcWOebhRSSXgd/CfNXcabN+iXk57+tI2+w/Fec5HpKHx6RTLe48bxSg==
X-Google-Smtp-Source: AGHT+IH3ONBmas7xlrBFZwEBLUlf/D/cSYjNZZPpeQFWgFHm/3eyRH4IxETbO7fyTNvbq/gjEuALFg==
X-Received: by 2002:a17:902:ebc4:b0:216:2a36:5b2e with SMTP id d9443c01a7336-21778536b37mr48738815ad.32.1733916193070;
        Wed, 11 Dec 2024 03:23:13 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:12 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 3/7] cpufreq: apple-soc: Allow per-SoC configuration of APPLE_DVFS_CMD_PS1
Date: Wed, 11 Dec 2024 19:19:30 +0800
Message-ID: <20241211112244.18393-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_032314_075563_442E2F70 
X-CRM114-Status: GOOD (  15.37  )
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


