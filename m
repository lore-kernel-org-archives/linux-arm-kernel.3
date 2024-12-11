Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CE2E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlxPth3W7wbrCgZl9TutY0yGCH/wT/pCGymBpz4R5/s=; b=KjRzG2qS7jZnyxFrhDbbN2rlMX
	sox78Ex+oenTY4kFyOpDk9wl36nI26OKdIDDZYlfaqJSULUM2Qqt5diD80cSU2qSjXJeFsIo2ttaL
	y8Z0WNAwjxhTZcGCWsk1VfcCGYZHn8t2MhGnAbgiXQWMVwmGfhwYuKtZlkF4K8kHxaTjkGZkhTGXu
	Uu7Wla/RPMsldA0HRN+9l5Fxxej+lPNcaJNlSTsydRdWCQsQu6g1aGlp9k/PQ8sqhA1k+swA9lGn9
	PQs3mg9A2IJNMAj9pIqEe8oBXYnQ31kaMwRS71Z2tzq02/EyXmjgXXoBAoe8mm7P3Hx7DelSTN0z3
	6GRWff3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKwM-0000000Ei2I-3Wc6;
	Wed, 11 Dec 2024 11:31:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKoQ-0000000EgKN-3Odw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:23:28 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2162c0f6a39so5295855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916206; x=1734521006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlxPth3W7wbrCgZl9TutY0yGCH/wT/pCGymBpz4R5/s=;
        b=JEjPXf0wfS70Y4t3fIPWgfeBYn8d8GimcGAAzDG6FZGc5ncpZQDVTAgl/p3z+3zcoh
         MQdq+6miRIO9yaOM7QvznBU9cXwVJbzCaIL9cufEVN/TnpFrrPxfLdeHtqyTMCFFQnSr
         mOH74hq+K5FMAU3zTuuFORJeQEZFTm7JYdUyB7kqRqEdCs3OIQfQkcIeLzSTg4ke+GH0
         Y26OxFotZcDOM180ZifuCr4y+Q/Rz136z7vnLhfvWYbzEh2GCL9tngzTIbcIDOPRDE6Y
         4JLOre3PokyZBaBevx58Z16kZ1cC4IZzN8aPQQToBfYf28YhEf+14cubtWJ7Oi+glDyG
         Z5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916206; x=1734521006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlxPth3W7wbrCgZl9TutY0yGCH/wT/pCGymBpz4R5/s=;
        b=Dkg6NSHwKtxM8b2Kn4IPzHFOC+YHmzOynm4QQQXoLHNrmYdtQFaLUWh325kZWEIDiR
         GG9aOctqn5e5uRXfhZc2uJSCKzdxVm0/qEsygSV4oCr8xJ4z4iHeVCgXUMP99/dA08QC
         a08nhZ1oXy75Ul63O+2VZxF1VNHvgD+CXz7bPXapUyckq/nFmQ7B0uefjgWFqKi+F18T
         5Msw2D1DXrxeMx2OXnsZLvPdbg57F1fMyiuspAUfA7c60Yk3hlINEbltlZIWrNywAUFv
         WSmGCVZih3QGiHFbY9ucl4G1U1LJcZpnHT38dj98gwwQ4rRv9QTZJVGa2/osvcRYFN12
         4aSA==
X-Forwarded-Encrypted: i=1; AJvYcCUnC4FJR79zjjhldwclHZivNaiyeHdkFL3sf/64HByOslnSJv+J/bN6lBabukOH3sfejW6OxEip9efrPfw0Fq98@lists.infradead.org
X-Gm-Message-State: AOJu0YwgYiqT+cZvady9Jpn+LYXQMQQVoR1+XclNVeN0cfyB2JdRomno
	dcCNbDggfw53+tvxfzfFpYs4ifEISF17dMNXrnS3ZJeSSsyH7gB2
X-Gm-Gg: ASbGncv+n7WugODTY6cMWzynEzrCogf3pAzNbec3pWr3YA6kOnKYIZlkXz9xN8vg5Ow
	gzQkHLEnEluOYFlY1DP+LdbmpxbOd9LLBxxB3+UGlHI2SNesP8Ruy3Tk0YrZ5igfNho3m1/IHBv
	QNOhFFM7ufSkkpKIbLZVRv4gA/uXkoocrJ6aaHxqk8mUZJBUlBqL/CJnMqdOHB0kmHchHYLXSAF
	XmvqxI286ckVQyNbIkWC+koEMX/la4ZrZ4HLm4t2qkwlkXJ6mmLZP4uzq0sdgLyrhvH/w==
X-Google-Smtp-Source: AGHT+IFMuiaI6I3IF80U3p4jkCdMcH2pHwrnp13N4Jra+xHLG9sBJnqMa1fKJOB7LKNxTMS5auBS3g==
X-Received: by 2002:a17:903:186:b0:215:742e:5cff with SMTP id d9443c01a7336-21779e6245amr31917835ad.16.1733916205923;
        Wed, 11 Dec 2024 03:23:25 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:25 -0800 (PST)
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
Subject: [PATCH 7/7] cpufreq: apple-soc: Add Apple A7-A8X SoC cpufreq support
Date: Wed, 11 Dec 2024 19:19:34 +0800
Message-ID: <20241211112244.18393-8-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_032326_848441_8B109815 
X-CRM114-Status: GOOD (  14.12  )
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
index 0af36f911bea..12ee9123a1c2 100644
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


