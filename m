Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C40C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 06:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jvlWzim6YndqWu3ZQu0rSQefXK13/0JaECZ5f7JnfO4=; b=lIm8iBwxhkEoKy4OWRkyGYlKsR
	f9tkuZ4wx9k0b7Rik/vHCmLVG12hgjuyimqXAbHHPabIoxWqWyTCvXpzhv2k/tKixGDZiGuY2U12E
	iHRpzMJSC2PyfzX8ctBXd94dTDBUXS+oLWH8sk3sJKYVQdbwWKkr6edgbnfaWyhyhw7smmU7lv4wR
	h3xklULc42Kz4zGNuzgfOYUeVcKFaewCVQG1MdcRt1ATHzLYsZHTL8jm7ioqWInc3Gn+CWSLy8Fj/
	GyG2AXdU+esJPhameo/oQscqjtCab9hamnaFmOd7q3hgrcdSEq+xPxBCCHFIpSt85JvThDh7JsOz7
	yQdv2kVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0wuR-0000000DZ8C-3g7m;
	Sat, 05 Apr 2025 06:21:39 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0wsh-0000000DYzf-01mF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 06:19:52 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7376dd56f60so2044482b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 23:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743833990; x=1744438790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvlWzim6YndqWu3ZQu0rSQefXK13/0JaECZ5f7JnfO4=;
        b=dDYz3tm5eshPAmqvDcugI4Z9gUGKhC4ma79Iw/g40Pyj0ifsGlEjGX/ISltVNyNqi9
         YiInuHOdU2mx5lwPOoCXV2yd4JEM8kyr76rrGwvMTa2YSU2Svj9DF4/dj6dB534Fe9c9
         zbBC9pt3bD4PZsyX7C3WPLguTeqF5JopoXz7qrxJne2PEoiQr8TWbBuA4T0ZPpoWF5C3
         V3ZXCjRJkkiZx29LhWPmRE+NxGyOgJ1pChREyADfxzNDwXSH0tn+bz/8z7c8ZT8nPna2
         rc55Esc9e7DLsWOSrxXAJJuoh/dGmRcSHnRSTliVgsSOA7wenWEIqRUMKpWzmlIC/HIl
         /4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743833990; x=1744438790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvlWzim6YndqWu3ZQu0rSQefXK13/0JaECZ5f7JnfO4=;
        b=JGS/p5Y7UP5q1HRlJT40berW6+NzqOzl0woOaX7WYVRiou6S67AiSlh243j6QPNFJN
         wvrsJKY00teJqYHRG23qHWJNOzIFcGKGaSEy5pG9nT34EKF6TFqm4Le1CdUwtslowNdC
         1BEXGUkW4xN3OGlf39X0BLe/xvm/pnGsCMolSak4jMkhi7mO1wNv/zTB2bfnBe207ylh
         tel2OsbjinSGtdIy6ivzn5VMMmemd3NkUhgDB2Bl5pgndv4u7Pgac5RQtDcEVzc4MT4p
         XwHIHrSzGp9TX4T1/EAe7xyExRoN7DQydp4yHsjPqcTgsVSCp3WILSujUfbyMtttw2Qd
         xvlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBVvI9H9w8ZoWmnWZmnEpuKhX5ceSv5O1Am/QIvqLDcHnFWDdR3Y2a/Pf6ZzRuH4rzfqIhH7DBsQF58ZlYH93M@lists.infradead.org
X-Gm-Message-State: AOJu0YxXMn9JGPT/gdpSt+VjyHt7iCT3Ok9IAWl+iNZ0RU2DG63w6BNw
	rOdJxL/e99XdG5OAskWhEq4hkBe9r2kpgPxTyWRzeo9g0O4LI0R8
X-Gm-Gg: ASbGncuRwC98aYd11TfbL59qNvsmKwTDRl55HR5uojYGuXRbQ62d91xUGXeOSfOirPr
	/OnnKC80j0XXHGveho/y0qcn4rYHvQRnkGWYr58RGTUOLfdpog2KxwTJmKKNPjMKl66VqMnx66Z
	MGXU6Qmerz04D/gSsOniR+q9nXZ0js4Jh4qusNsRkXl4JO+0b8bXkVVrmd2/8nUOvYoq6ORx9V/
	huGdmD0voOhVNiFzhXLT7XVsRD+6iUERwgOcuXTLu+itguW4Tg7hL3/js49r/vFK8kfuDeKz96R
	KoSnUPSH/NKYGnWhQzvwcaQtKKvLcurMJsrGpw3CNY0p4y9ANVwDIKBhuoSgSH/k7M+hpqp5VBf
	fOTTB
X-Google-Smtp-Source: AGHT+IFAtgmoL2nMv36spwTBvOI1Zop6q8ft1LpTEtdlGsfFq6JVDVDdNNkOWYXi+baTWF6/wwaPdQ==
X-Received: by 2002:a05:6a21:900f:b0:1f5:75a9:526c with SMTP id adf61e73a8af0-20107efef3emr7651006637.13.1743833990025;
        Fri, 04 Apr 2025 23:19:50 -0700 (PDT)
Received: from henry.localdomain ([223.72.104.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41a65asm3830209a12.69.2025.04.04.23.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 23:19:49 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: sven@svenpeter.dev,
	j@jannau.net,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: alyssa@rosenzweig.io,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] cpufreq: apple-soc: Fix null-ptr-deref in apple_soc_cpufreq_get_rate()
Date: Sat,  5 Apr 2025 14:19:27 +0800
Message-Id: <20250405061927.75485-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_231951_042081_16BF4B8A 
X-CRM114-Status: GOOD (  13.16  )
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

cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
in the policy->cpus mask. apple_soc_cpufreq_get_rate() does not check
for this case, which results in a NULL pointer dereference.

Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 4994c86feb57..9156becfa367 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -134,11 +134,17 @@ static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
 
 static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct apple_cpu_priv *priv = policy->driver_data;
+	struct cpufreq_policy *policy;
+	struct apple_cpu_priv *priv;
 	struct cpufreq_frequency_table *p;
 	unsigned int pstate;
 
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (!policy)
+		return 0;
+
+	priv = policy->driver_data;
+
 	if (priv->info->cur_pstate_mask) {
 		u32 reg = readl_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
 
-- 
2.34.1


