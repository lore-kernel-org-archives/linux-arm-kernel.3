Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35868C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 06:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0W20+yxBOW7S58mPqEOjxHOWXZCgIN0XLLUDfARBjDU=; b=4UNx9IYxm1kgoJqItEw8bKvQMW
	FvFAVQxx5tRNGNUSBYwchUTqVK5tmjWsxEh0K96E7FabZmReJaNC9CbNb6ZMp3EOD0aUGWcdQYLJE
	VbcmzaEEgnuUjMSGjZo7dpL+L3imCl3y9SLUehba64kl/TYgRlUSpDDAyMfD4Tbj8z0ePxK/PWfGq
	Gbd8bMJdWYnnxYBh6BEc2U4nyZpGm1zR2ePEfWTvAAOIKeOY2uueMUrOp9Ui0iLv0dkypzuJyWf6W
	/FLewn2PKR9rKihy31+2AwXOio9mZ7PzsSQ3ttcxvCQOqnIN1hMPAjF21Zb/bYzGnVo9FbK0MGKp5
	nPOYepRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taTtw-00000009SRK-3yLg;
	Wed, 22 Jan 2025 06:07:44 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taTsd-00000009SKl-461g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 06:06:25 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2f78a4ca5deso6223955a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 22:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737525983; x=1738130783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0W20+yxBOW7S58mPqEOjxHOWXZCgIN0XLLUDfARBjDU=;
        b=CyqwISpV3NKiT6A0qWbdr8PkEpFKmmfUbq0mpDG7SgEyhZPt4Lw6Wf3VtrEaQQs3G5
         Du66QmtXa6fUcDHQMyIImc03LJb1fc6FtPnYYzrqrWjgoxIVJqf6Qfbdo65LovfkHuBn
         pBU9JUSNBU01dYMoKIwzG1CVIUFeEExFA/QNbHq0daY4QpMUJxijzE7v8z28yaw3JgVQ
         r1kT3VhAaOIuAr2NpV40hYFK4UgquQ5k4w9VYI0nKoaddjrhhX3uSyViKaP+G1tm0+6/
         EixMrlwC2GEaF3ZQI61PwGp0K6AOMMv/7PTbZDJ9CI6u7NhWWamJhSas4J7Gp4SeO4Jc
         LSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737525983; x=1738130783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0W20+yxBOW7S58mPqEOjxHOWXZCgIN0XLLUDfARBjDU=;
        b=tiSYPaucC1Z3ZahXYqUI8A9r4tUFyfPp6Jr6eZ5rdFZ7eLVWjcUZ/6t/pekkO66+us
         nlk8jB64v7A+XAI0Lt0CT71ihrQiLG+KN7j2FV4nanAIAlCMc1pNxLDiQvk5JwDOL7bj
         AEijn+IaxvNZkL1he0q+aEKV2QB1H2YxpxecMmfb61e5UvVqxsvnFBD7iEUi4mGu9dbX
         b9+v2Fi+ISnXNN1e9Ysv6RLMRSFdVJWEs/BXwCakn5khSFkKAjwGDSsD/auHBzZs+JGx
         WFzo/3a45+A7g0uayD7ikQEuBWelBl6ToWGrQsQiXfjNnYD9kQJR4ogDzffqzE/6xWlp
         4hkw==
X-Forwarded-Encrypted: i=1; AJvYcCUjz8jLuBZ4Su7MmUSXpFRR9CNhl86m7a6d9kw+rtMf3I/uqEGm5wsEpKF8P+sFNaU1Z4gns6Sz1c0Ck/GZRoA9@lists.infradead.org
X-Gm-Message-State: AOJu0YzfRwz3O45JzXlkpwTB7aKTDb72OwYn6nSW2TAr3jv7+h3d2Mlj
	WEDJbzzl7AYCDvhQEFVef+A3Bhuoqi5vSDJsOCV3SwHVSt8mJAZ05B3uIgfJdwU=
X-Gm-Gg: ASbGncuN8pE0sI9Cy3asGiwadBHWP6ssHwnYAcJYgNZaJbQ6DyPl+cKEcQ3UcQnSbjv
	xoz6u+C3J3pH8W3r0OD9f7BxWWGmNt+5BdDPPV9yUdbk9b4j4Dxu5DChSqDDpdX3xUZoRkX+9XC
	IG7fua8Sp/q7McN15mLOa92IT5GzIYWc5NOS3pjP2SN5mHZek7EO2KCetqB8BRIhx9Xd0y2jrxb
	7gOxk4GruuEme+mKcE168g2obS9/rg2U8zfU8D04nPBTOv3xHA0iA97kyxFC1xPEx8WTWNf
X-Google-Smtp-Source: AGHT+IE4ag6j6hEEpyPWZk0VRFVk6mkVLAwHWJ2F4Qn9kdzng8UiejuaFtPP8B6RnjwiXV6/Vg4wEg==
X-Received: by 2002:a17:90b:2748:b0:2ea:59e3:2d2e with SMTP id 98e67ed59e1d1-2f782c73b7fmr31718132a91.10.1737525982910;
        Tue, 21 Jan 2025 22:06:22 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6a65966sm648044a91.1.2025.01.21.22.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 22:06:22 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] cpufreq: s3c64xx: Fix compilation warning
Date: Wed, 22 Jan 2025 11:36:16 +0530
Message-Id: <236b227e929e5adc04d1e9e7af6845a46c8e9432.1737525916.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_220624_031522_4AC50687 
X-CRM114-Status: GOOD (  13.42  )
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

The driver generates following warning when regulator support isn't
enabled in the kernel. Fix it.

   drivers/cpufreq/s3c64xx-cpufreq.c: In function 's3c64xx_cpufreq_set_target':
>> drivers/cpufreq/s3c64xx-cpufreq.c:55:22: warning: variable 'old_freq' set but not used [-Wunused-but-set-variable]
      55 |         unsigned int old_freq, new_freq;
         |                      ^~~~~~~~
>> drivers/cpufreq/s3c64xx-cpufreq.c:54:30: warning: variable 'dvfs' set but not used [-Wunused-but-set-variable]
      54 |         struct s3c64xx_dvfs *dvfs;
         |                              ^~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501191803.CtfT7b2o-lkp@intel.com/
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2: Move s3c64xx_dvfs_table too inside ifdef.

 drivers/cpufreq/s3c64xx-cpufreq.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index c6bdfc308e99..9cef71528076 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -24,6 +24,7 @@ struct s3c64xx_dvfs {
 	unsigned int vddarm_max;
 };
 
+#ifdef CONFIG_REGULATOR
 static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
 	[0] = { 1000000, 1150000 },
 	[1] = { 1050000, 1150000 },
@@ -31,6 +32,7 @@ static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
 	[3] = { 1200000, 1350000 },
 	[4] = { 1300000, 1350000 },
 };
+#endif
 
 static struct cpufreq_frequency_table s3c64xx_freq_table[] = {
 	{ 0, 0,  66000 },
@@ -51,15 +53,16 @@ static struct cpufreq_frequency_table s3c64xx_freq_table[] = {
 static int s3c64xx_cpufreq_set_target(struct cpufreq_policy *policy,
 				      unsigned int index)
 {
-	struct s3c64xx_dvfs *dvfs;
-	unsigned int old_freq, new_freq;
+	unsigned int new_freq = s3c64xx_freq_table[index].frequency;
 	int ret;
 
+#ifdef CONFIG_REGULATOR
+	struct s3c64xx_dvfs *dvfs;
+	unsigned int old_freq;
+
 	old_freq = clk_get_rate(policy->clk) / 1000;
-	new_freq = s3c64xx_freq_table[index].frequency;
 	dvfs = &s3c64xx_dvfs_table[s3c64xx_freq_table[index].driver_data];
 
-#ifdef CONFIG_REGULATOR
 	if (vddarm && new_freq > old_freq) {
 		ret = regulator_set_voltage(vddarm,
 					    dvfs->vddarm_min,
-- 
2.31.1.272.g89b43f80a514


