Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FCEE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=; b=EJVxhP5mIwcOKYEHS3WpQlR1GM
	QRxfg+MwAyUcAijnl6PUqfyRObAxcxHxXkl0n5JUYUoDpqKNgGipGJZuoEQjzQbGetgi1oYvzKyd3
	KrVFzgguN97d1N387QMvFE4yytI2G/UwU9/rqokjNOWr/FMmVT1PDtoEGzEeNXE+lxv4kD4yO1YyG
	ODZMwduzzexA88WPDKqQwO/LUqbbZTKTkKw8Q6x4eBSc2CO2kyOkumt7impHsKAbv6/dFwkVRF3he
	nBrx7cneFSBCCfr+yW9bk3lek0e5i3o7RSla8VJBsVU6vhFB4440WzPwCH/hs/VuHMWS3so0yHdgp
	81dGETjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyqM-0000000HRq5-3DQf;
	Wed, 18 Dec 2024 18:32:22 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNynD-0000000HRIh-1WA5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:29:08 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2156e078563so51912285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 10:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546546; x=1735151346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=WB9WeK+d44FDbDhBEaJmR01vXSVaY6iliYdoikQnoSI2f3SItVUuKF14KrWZNX2pz8
         7nYN8SSOhJPJsxaFUNeMMU8gr44mKsvpDy/qUD+3WTBoImQuRAg7OZmr37JTxvFEGJvp
         S5M3vfMv2AF5HE3TujddNqvmqaHYFDlLGalB920j86M0zAVamZRUle8O4AHlguutp7pB
         ww3e2fgtZVPeEYG1iohVZ+gnGZliBjnGTOWxCL4YjOoxrDpRbXHM6KM7nc81w+qdvt5D
         GijFncTj7DxEZpe3GXON9kw7APIvsyp1iYyea9nnaYi4Smi/CSxBQfkRrKZKovEx1Nnv
         3zJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546546; x=1735151346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=lXVzRC6vmAo9rMGcCfYDN8rbvMVJTmJ068weBbwqckFjwowFpQc6st3kXVRKl8deL1
         Y8eD9tlkFN+qVgu395BvgVyWrBecP7MXCUcMOM2Bhhu9TIsKiWc61n2HtIBmeS+XZMLs
         4go7tx9Nsr/wCitkzHh+tlYsla1Rx0LXuZMIDok9it6iUzvVg+wvIlPo3NRSzvhiZGVC
         /JDNLleMF/UTvf4B20Tubq9ZOIerjIAM1IzCJdiMCPfnxIR2lV8uvbVVCJF94foaOp0Q
         4M/iEioe+0HLugn50LuSnb90BuAqSlUSabDMijBVaKMY/EnXvUTPzmSKGtYvC7NXg6Qu
         pivw==
X-Forwarded-Encrypted: i=1; AJvYcCXcFi8v6rtOJqTChxx2wxkrjKEPrR/6G8j/iLB1PG9Fe9hy5T1oIMDCZczg/+R6uihaOQukSkL+LfL/U1uT5+aI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg0an1GMiQjtpdE1H/iFKJ2ILY6Lncyir+AxgpaEf3K1CIoIW3
	VN096ZBPy7JYvtnab/MOOm+UZgmeaEAn1fht2fmlcorduyu9mkOI
X-Gm-Gg: ASbGncvjFY2/OhiQR3+F+U/rIIFOE6QYDywqbnLXKF5q6UCI/1nzgV3S4Wx5feeq+YF
	eiKJ1Wmkmsu7LkwJZEWksr9YN+EAxHppHvOU3X+QdtkRj8kDsLYYE1n1je9rg76Y6SPbl6OEIK1
	7mDciSykE4fXlwwgk4Irvu047/ntGkZbhG9UpICreRgZKYoiUvP+FQbhLwSTZyURY3oFDv+ob84
	RoXPh443I6LqBsmR3536DGX21IlKO2ADOuUMqX06hRtE8zYm1sxFboaBg==
X-Google-Smtp-Source: AGHT+IE5H942ad1OAia3lBBhcksY1y+20uAlvIpOi6ha/V3bCOYFzx6F6Fufey/f4PXmeYsSviXIPg==
X-Received: by 2002:a17:902:da89:b0:215:e98c:c5c1 with SMTP id d9443c01a7336-218d722cf3amr59411945ad.30.1734546546134;
        Wed, 18 Dec 2024 10:29:06 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:05 -0800 (PST)
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
Subject: [PATCH v3 2/7] cpufreq: apple-soc: Drop setting the PS2 field on M2+
Date: Thu, 19 Dec 2024 02:25:04 +0800
Message-ID: <20241218182834.22334-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102907_409372_ADCB0133 
X-CRM114-Status: GOOD (  15.08  )
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


