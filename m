Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85328E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 07:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6P537stxvMQqeF6f3roncNxbUVv366ZADaeaxeRSNY=; b=5CTpQCGwk7OLzCkYSImRSHja3S
	2igrRkSsnVObcgzEw1iPXLUjkRt0aKeZBPwcRRRPaLd51DlVisaIEPX6oAnb0M//00r07Cztd1eEB
	WU2wnddsxRFBd3MNHXlh6iILUlE60XLwnXGh+6SOFdPs5jeQX1Vus8rsuGIBQvUPO/rT6IH4SWYco
	ajTF6mdeVkN+nXB9CwMFKqoybImb8aJ3Au9FSfBR6IOrMEcbioOV9oueicffN+nqKvp/uu+l3jy+C
	KLD9EeOraA1E/YXYX86Fqk7Y/ZHiBv7toVmUkeutmQ5QPzCIHUdwfyK4EGAdfngVs8eKyBURFbqIi
	TRzda7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdNq-0000000H81u-21mF;
	Thu, 12 Dec 2024 07:13:14 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdFv-0000000H6Xv-1D8S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 07:05:04 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-728ec840a8aso327305b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 23:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987103; x=1734591903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6P537stxvMQqeF6f3roncNxbUVv366ZADaeaxeRSNY=;
        b=Memi8faq1Ia305Bybw4XVl85VLJnC7yrH3ctmOj66mm8hUwEpFGuPDZppQE/s9O70l
         3bPDDzIP1PGq6wLx84VAGqgQAlRYV2UZDC+oengl7jcgMnJ+s7RhtxnY7nbppFMbF3N8
         nckXpjsFuoDWu5eq+gLKjc9fFxES5ju2paBAvlFYUSO2y8ZoDe2BfyFldnG/h5mnCijO
         WGYBSKsZ6aTsCii9AWzluLZ+pVwSk+y5cuUZN6tlXobP7x6td42whSBJoqf4B7RK6/S2
         aU5pTFgTSKtWGfcCo7x+1/LgnmITsxHK0AvZgv0tnodPf/pmN8XOsAJSmvq8dmx4VSzK
         AUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987103; x=1734591903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6P537stxvMQqeF6f3roncNxbUVv366ZADaeaxeRSNY=;
        b=ijL1OsNoIr0EKlCk9xG89bObeT3eVJQXpAPJH4DQaFPjkwBVwGH/8tJXMZwhNDie+9
         sQAL4I7FaM6XHZ5XqwFTMIZBo6DX10T8b23iWyLh1pdBplg0Ga958g5nHfJM4ZP2tZfo
         gk4doU5L908d1zjyre6ZP2SH8QE4zGcydyl9gQHq0BmiFEf/2iqUPzWPUeTYJgy3K2ky
         W+OxEvjUXKC66uCFPkpYwRxRukSBgSEd2KNRW4p8j72//Q9xzK9GkKA2xBCGytjbujWN
         E8hhwc1jRxORMFByd0bqnm6KU7F5wL3dwLwSm7WsDPPB1wZvS8N1+ERuHgC8U8/A7Um+
         4Bwg==
X-Forwarded-Encrypted: i=1; AJvYcCW/smtQKoy3UC8V/nLtmRfpPCnv8vSXfniPxF6897fpZc7BsOe8/i3nXhaJAbJ/iKXjGNejsxQKbyUpWFJt5hkj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdm1QzpCcvLno3C6Fq7F1RE5jH0pZBrvvdyiUdQJ1lfhN7smtm
	JXxWLPH+aDMMWIee/U6nd97CM4lKkGjdvi0gnWaynA5JBhGXhZ/N
X-Gm-Gg: ASbGncuYLhDrPp+9pdrN5o3w1SLxCmJezgLaLIIKPJSqwlxu0fXOhD1TweH5rcUjkWV
	1JMJ86v57mmPcPoCMLftcAPGkzFrWpz4tCs3upjnD6WD9QqCHUEqg/avJ39cKnn566OZ+e3rFqg
	LjTntnjvJPbk7QvRA3sGINvgunNSnTvJuv4sqraOnQm9x5pU6ej5HbKJs6vHaH5tA5MK46TNeIp
	qy8QVvOP6wZv3jz3F5SYWPOdk6Yi+FcESyB1FUnrqYfgjgpNz9MZsZ0o8dBMCy8MTAbRuXL
X-Google-Smtp-Source: AGHT+IGrdOYxBGn8CzjzAjnMQjSdYYWqQKbTysuxC6esT4QB5BXv4xEumBLxne4E9WmA5a4aAN8WoA==
X-Received: by 2002:a05:6a00:1803:b0:725:eb85:f7ef with SMTP id d2e1a72fcca58-728faa62ae1mr3631124b3a.14.1733987102674;
        Wed, 11 Dec 2024 23:05:02 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:05:02 -0800 (PST)
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
Subject: [PATCH v2 7/7] cpufreq: apple-soc: Add Apple A7-A8X SoC cpufreq support
Date: Thu, 12 Dec 2024 15:03:06 +0800
Message-ID: <20241212070344.3858-8-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_230503_325766_BA2B3479 
X-CRM114-Status: GOOD (  14.59  )
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
index c9f31a3653e2..c3a6dd8ae22a 100644
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


