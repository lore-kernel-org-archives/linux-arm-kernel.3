Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7715E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=; b=Ac25XPfQLky6E1lrrlJxK0MePc
	mcmno0kgV7IS0gqllBr7pPGhPv6llN6f3HiwtEzO2Ry0iN/vNJ6iriBCnZCTT2mC91yxAeIMKx38q
	ol5BZhKi56jifRqk1lmU7Lmfr9BP4f4vGg6J0XCZV3gvXTYq6LQVJD3UQDKHf0aAqqPPnOBuppl80
	t5YlaSGH+zZgYUbxRzKjl9wbw9s8JQ1tKhqd7qaXg6mVkKLD1imc3UKIY3lN5LF7IbplN00yO0gHa
	SSOO3RQuMaaPATL50UXXO529qVmaOoMOS4ibxJv2swf4uahrYQLK3OoDOGMPmV30011xVznbwHbqF
	GOmcQhow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyrR-0000000HRzw-1ugd;
	Wed, 18 Dec 2024 18:33:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNynG-0000000HRJ4-0nRi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:29:11 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21619108a6bso52836085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 10:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546549; x=1735151349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=O4s1vatkF6m/7LlqkYY1OCEtO3yNSBW0awzkfxvoGHejd/Jd9Q394UKcIhdGEPif5l
         nfDD0b/2Fklc5CNIO1XqHHddDsGUC0QtURTVnP3IOmzV5BA9b+qPLs8dOYwxJ9Qr3srk
         9saniMDl/Yfja2perf0537ZtY0w+mm+WK22Wls1Fh1OU42L9oL6Zg8uUwK80izEYiHge
         RGSyUbfw/DBDsNMI0b3q1af7bj8HYFLrd3BipHTlXr51H2upyMPzoGVO+LnmXJB66KC9
         zZfoXWOe69Rp/1y8Qaq5RoIU+GUWQ3IYiIe28K5lcW/N5fg0vlQO3laVaOBmGkVYj0NK
         fquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546549; x=1735151349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=h8NtdrYfXJt+Vjwn+oPc9fgB0XM/cXs8+J3celd6HHaLrc2D76mgUiffzyM1flGhQJ
         5Cy8YgpiKTfJhgB545n4jXgxBO+Ntwrybe/fNimqfpcScf8EtamqTCM38LQAM+kAeZFp
         /9VNquuVKyjS/CHAcWd+JJM0Lp2Rwflw+E2d/HDbiy8SZN9fgVfazhBcJ0DaFqZB2PCW
         hO6kAZRb6mh9F6Z5cp2pQbGzp2bMBBSv4hHYqZGIRDI3FTYg9fWR8l9zRzStM0fNr3kB
         hb2/7xtHJhnntjl4mFf5iH9Eo8g4ffizv63J72GANV8sqHdjVh27VfVZ/UhlEQ/KITDw
         DOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqXy7aOcUefezut1QeZpVv/tjkWdqE6oqwfSz+uGsdOWrbdAfNuc1N+hZtnmacD1PoArk2b/kmtCdzXyB5ladv@lists.infradead.org
X-Gm-Message-State: AOJu0YxRxwISEA8L0kximsrLnBxJkVfocz1S55tBGxaam4fatp7pMLLA
	d2zGF524PNepaXnVoan8Q+mgEXMCrRIN1qOkxnZsoC5YuTkGxzwF
X-Gm-Gg: ASbGncveYv4DwIdMPUhG/G5klKAV7F4dWnAIM6wz1fvuXLNzp2Nrs1PSE1N51zmcBx9
	xKq8R1xZagIvH2OekfglslJFLwoxtNBZZgvW8UQ0TwdNlNoVwCYodyh+0Ms3m6/ZSOvyFXeIj2J
	XFfsiqqhfeJa88bq+J3hMDBFyHdHkdmTtJmgIGHtbbzhxlp3b1adRBhHe2cOhpVMbjUmXkmRJ25
	Rgh7o88N0cLx6BihhyFdevpUx0dnwZ2ew7JDubS6FrJGMkCzcR4woiZng==
X-Google-Smtp-Source: AGHT+IG1dFfYMmtespCdHUdswr0tOQu/Hh+8bBbhGRfGdZaUlxpJm21y4ELjB1GOE2T3IEgQCtqhaw==
X-Received: by 2002:a17:902:ef08:b0:215:6489:cfb8 with SMTP id d9443c01a7336-219d961571bmr9961945ad.10.1734546549047;
        Wed, 18 Dec 2024 10:29:09 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:08 -0800 (PST)
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
Subject: [PATCH v3 3/7] cpufreq: apple-soc: Allow per-SoC configuration of APPLE_DVFS_CMD_PS1
Date: Thu, 19 Dec 2024 02:25:05 +0800
Message-ID: <20241218182834.22334-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102910_247730_02D02D9A 
X-CRM114-Status: GOOD (  15.53  )
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


