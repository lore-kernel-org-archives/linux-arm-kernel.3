Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392F1E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZBfNBSGDJ0HG4dwJs91dFczJyiFsgvS33RZvYaZjO0=; b=qm42DJmpv4yYcRvTCSJsKR1XT6
	syU5uiyX3mM82FbAK2YeJEPtez5H8miQtDepjA4C7l6Bo0KdANt1auCqKHRIAy+b2BizCO52ykMVw
	2IQCjkSEuoc6UxUX6JacFCMsPmBTFKtUnfG4nr/U7k9HnJLPkeKG8Iuxm3rywQtrGD/seYM81wISK
	EUe0kISh1j2KIZC8nTl8M7U+sKy06zb6t4zLvpUkkuiz7uFA2GcNhw8vC464zqxooatjo1hKjlZ9F
	R2I89nDXumVMTf8mkixsMtuOT8KNQHiNhP4x48T2GVbMe5u9TuLSsAjh0j7mwKNLmXgGCk3Z4s6P6
	Jryu1Nww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyvj-0000000HSjj-0SSg;
	Wed, 18 Dec 2024 18:37:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNynR-0000000HRLY-3zEs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:29:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21654fdd5daso5555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 10:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546561; x=1735151361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZBfNBSGDJ0HG4dwJs91dFczJyiFsgvS33RZvYaZjO0=;
        b=eYeI3nHIT/TOMhTaXW48DciPb0AxZpLA85jQrKOqb122ll0+oUyokHt1XVDldHpmZ5
         yk+MEn5OXdyepmAtOtQFsAJ2dUP0VMlmf56cPrtPyWcyvEbSbeRRG6GKKHa+EGOIQU+F
         beojOIJrz3OOqg89pL5dmqRDVzkwdz0Ex3TIOTYhLXfUTN/UatCTqbm6TjqNAcrB5XdM
         wwi+kWKMumYuVFDsJL0n5v4VCYegef4ncogu3eCkn5FS+B2jQZ6oVCCCOUoGjpoXV/2G
         1LChJsZ78AJB2DFYHz8dxhjRSFwXXVTVjZROBJeGL2TRprOF16xpgZkk9l2rXdJ4obQp
         L4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546561; x=1735151361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZBfNBSGDJ0HG4dwJs91dFczJyiFsgvS33RZvYaZjO0=;
        b=O3gmIaCG5A7cHIBuxbCZk9sH+a/G02Ezd0dkIWD8rXHs9rS7UNeRy4uiNODOQkNxky
         k8FxGdTPsz/6L8VoD7XzvJeBojxYXH6xYTe8Q+ERLjhTn+t9l2bpY5zr6DV+Mr27caFh
         1Jrnwf4dCHYYg3AJiV/9h7QrjGnzSb4PyC1TpvkrpnP3N2Cu/2tmI2eRT6h0iWks4c8C
         u5niM93UrDFjjDYpdu23PjcuEIjeeywZRx/AcjSUSurTcKMYu/Zrgl8tD6/+Jsi6bmxa
         6JOVkxKD/P+mLlvrPTTpl0Rtm1F0zPV588AIM0mc5t7R+bXcTOdEGMIWwSS74EppuEPf
         FL3g==
X-Forwarded-Encrypted: i=1; AJvYcCXwaMhGk7m3sZDOqX6bqekUXeITubvqbIB/33aB8lHkk02UOteNfSU8o+DTVFTRzyBKojXPipS9/wPEVYBYJAbr@lists.infradead.org
X-Gm-Message-State: AOJu0YyBK6nPWx72bQwmdr0hzXQc84zo420gwdaoJ6WLXs6D2ILezCsO
	1DBmvOL+Z2G2RAguP2PG1MXSNNZ8s6tR/hist6jKvLPTHJk8+VJR
X-Gm-Gg: ASbGnctdaF0pjfRKf1uJSODGL3BdKuoYLQtXw89Xr5j6k5OadeLY6Ske6NqrnWJzU55
	k6XyP9lca8JzkdI63nLg/MU5weMkad26EE4vRydJAuqY2wfWOiu2si+xFhvZ8qp/dXJnvqjEGGJ
	rkS0scEysaQlsq1br4WdhsppuLHYykiu6DDZNcgWVJbLFAmzmandBWAmEWH6OhwyzoEUwlnBydd
	9C4yhZYwOZxSzn13W5x6L5zN1KHOVXHgBsiD1wDCJRG88mepYWZkfNKPQ==
X-Google-Smtp-Source: AGHT+IHKE8BBaNkfFDIiYK2d/X+ou/ScQY3k5kP8jILytQsn9xsdpJIG3SmkQVJ4kyDLKQIjDOdCPA==
X-Received: by 2002:a17:902:ec81:b0:216:5568:38c9 with SMTP id d9443c01a7336-218d72349edmr57596245ad.31.1734546560737;
        Wed, 18 Dec 2024 10:29:20 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:20 -0800 (PST)
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
Subject: [PATCH v3 7/7] cpufreq: apple-soc: Add Apple A7-A8X SoC cpufreq support
Date: Thu, 19 Dec 2024 02:25:09 +0800
Message-ID: <20241218182834.22334-8-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102921_992938_77BF264D 
X-CRM114-Status: GOOD (  14.27  )
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

These SoCs only use 3 bits for p-states, and have a different
APPLE_DVFS_CMD_PS1 mask value.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 30 +++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 879ddec9e557..269b18c62d04 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -22,12 +22,14 @@
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 
-#define APPLE_DVFS_CMD			0x20
-#define APPLE_DVFS_CMD_BUSY		BIT(31)
-#define APPLE_DVFS_CMD_SET		BIT(25)
-#define APPLE_DVFS_CMD_PS2		GENMASK(15, 12)
-#define APPLE_DVFS_CMD_PS1		GENMASK(4, 0)
-#define APPLE_DVFS_CMD_PS1_SHIFT	0
+#define APPLE_DVFS_CMD				0x20
+#define APPLE_DVFS_CMD_BUSY			BIT(31)
+#define APPLE_DVFS_CMD_SET			BIT(25)
+#define APPLE_DVFS_CMD_PS1_S5L8960X		GENMASK(24, 22)
+#define APPLE_DVFS_CMD_PS1_S5L8960X_SHIFT	22
+#define APPLE_DVFS_CMD_PS2			GENMASK(15, 12)
+#define APPLE_DVFS_CMD_PS1			GENMASK(4, 0)
+#define APPLE_DVFS_CMD_PS1_SHIFT		0
 
 /* Same timebase as CPU counter (24MHz) */
 #define APPLE_DVFS_LAST_CHG_TIME	0x38
@@ -36,6 +38,9 @@
  * Apple ran out of bits and had to shift this in T8112...
  */
 #define APPLE_DVFS_STATUS			0x50
+#define APPLE_DVFS_STATUS_CUR_PS_S5L8960X	GENMASK(5, 3)
+#define APPLE_DVFS_STATUS_CUR_PS_SHIFT_S5L8960X	3
+#define APPLE_DVFS_STATUS_TGT_PS_S5L8960X	GENMASK(2, 0)
 #define APPLE_DVFS_STATUS_CUR_PS_T8103		GENMASK(7, 4)
 #define APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8103	4
 #define APPLE_DVFS_STATUS_TGT_PS_T8103		GENMASK(3, 0)
@@ -72,6 +77,15 @@ struct apple_cpu_priv {
 
 static struct cpufreq_driver apple_soc_cpufreq_driver;
 
+static const struct apple_soc_cpufreq_info soc_s5l8960x_info = {
+	.has_ps2 = false,
+	.max_pstate = 7,
+	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_S5L8960X,
+	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_S5L8960X,
+	.ps1_mask = APPLE_DVFS_CMD_PS1_S5L8960X,
+	.ps1_shift = APPLE_DVFS_CMD_PS1_S5L8960X_SHIFT,
+};
+
 static const struct apple_soc_cpufreq_info soc_t8103_info = {
 	.has_ps2 = true,
 	.max_pstate = 15,
@@ -99,6 +113,10 @@ static const struct apple_soc_cpufreq_info soc_default_info = {
 };
 
 static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
+	{
+		.compatible = "apple,s5l8960x-cluster-cpufreq",
+		.data = &soc_s5l8960x_info,
+	},
 	{
 		.compatible = "apple,t8103-cluster-cpufreq",
 		.data = &soc_t8103_info,
-- 
2.47.1


