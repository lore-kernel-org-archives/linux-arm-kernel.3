Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4158AC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lzQ5jAgJPMOysDkyB7FBY4kIjh3CZ6BVNPDK8eFRq4=; b=DDQqxhtnf7kTJ+isH0NYUdc5ap
	yfmUEjjpvfNu7L+CoxEWsCbK7MPrIYZz0M8wIIRHCWyODjhNeLPc3u79e64RlivxBUIS3XiSjeXCt
	xMOaFd3nJFkBYoiEZn52bgSWh+A9oVuarzAfgTj5r8m5Fv2Zyk/tgZ9HWE0aytp9B6Lryr/Qb+Q57
	xm0iT6b6UfmgwP+BPe5jjm15TGf1wW2ZfbEHl9ve8G8zciOukRxrApjb8zZeac9z4b6e3CB3p5w94
	pfJ8URpLfX+mXBBpmhu/GgS3v+cmn5c7Mkd3khQRepzZQr/Q3orvQjdGLXfXSSY+pa+Fprraf5XRU
	EvBuXpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFeh-0000000EKLl-2pXs;
	Fri, 24 Jan 2025 09:07:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFWu-0000000EIqe-2AG7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:59:09 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2163dc5155fso33178035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 00:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709148; x=1738313948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lzQ5jAgJPMOysDkyB7FBY4kIjh3CZ6BVNPDK8eFRq4=;
        b=oB68bxpJnBGVCh4vdUE8AwOeRYe6jhB4vuUpVYaX+tsc6RV805zk9ad1dF1VqBZrku
         ZV9DULfUsvKMEeo5calv2iVM2Ac6ILcl0MPzGTNXcA5fV8lp0yEE1osOg96wQChYu32w
         fe7c1DvduAO/yjnpPZHL9EBBd2fTn3X60pK+1kCQgSpaV9bhUVK4LFeiBy08KkQmskjh
         W2oPnlSOW0qkRvkhrNzs7QQKImXrLXuw8mYnBlj2ttH+wWRv8+n67oGVQnBrRxKSyzYx
         m3blkUiR6qju8zvQBGLYWBR2sjtdU3wSSx9aaIxb0G8ulEoScz1GKKG1Qhm48Q7GssCF
         8DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709148; x=1738313948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lzQ5jAgJPMOysDkyB7FBY4kIjh3CZ6BVNPDK8eFRq4=;
        b=d6yOAxXIVhqpm1lBpPYjESwYg7PNPY12TD7Kb0HnktYJGH8z1u6QixiYJ3sXwA7jf6
         JZqY5IDOXKuJOf+XDYRDSltxhApJHvE/OR7JblJmNm8H7kbKi3jFXf9a0ATQBMP+IWdT
         pe/QPT/s8xlwaQavLlmRmTQMCYw5f0FtGFLrO3jOwgcq6c3d3CQLIi303Qlj1jPP1nTE
         sUYCyIoaDfJLF2fOhn6zDP6Zb+Zu02DvCssWPA59HHrpVmGp75ip6wZ6S2O4nQvCvCWJ
         26NNIRIn5/yhUWxoYyMkKAHZbfH97WzTndP2Ad3iClTyswEl0H1MaCU/iYaCpundTC6i
         VA3w==
X-Forwarded-Encrypted: i=1; AJvYcCUngmyid2hiyyJTNJepOoBBlTOSkTZc6mQqG1GafezEjurQ66SVWCcgaKHgP4ENV5bNzTVszdMBQTIkk681t3b8@lists.infradead.org
X-Gm-Message-State: AOJu0YyhZYURtzP4EhYDOtMEHXEnRJJh32hk2CJXXHi+1stG/jQ7S3ok
	w403uUEHzVaZ94vkqAPoC+b+TW/JjFuvNePoUfq6TGWqLAJ+ZYfZDiqX/4s/BIw=
X-Gm-Gg: ASbGncv+y6gaYkQNUi3lTiZaC0Gqm9ipDvSUysMUJ0xiJsSPTqmRTvrfV1q5EFSq200
	nWxOLqlBO/hBi4LIY2nCKtaVlzjQrMFu6/vXIzrk7otUYUig6XH5h/U7syRHh91wo52I3nKhSR9
	OJ/gY0/g+eHv6LGdOtqyiyaN0DFPcPxrV2S/GWwyVobQuS89j4z8w0mmM+BaCVncIg/K85WAApG
	yda4s52lORu1FN3nlqApLxv0ukX9Ls6wPpfk6aZN4dtNXfxDEpWk0BXK3WtANd9ZxraTZE9EtBA
	jqzMKsI=
X-Google-Smtp-Source: AGHT+IFW/BLYxcm27YoFLdxNsrAZiy/t9OXPfZRg22Xfepty1UtE6fjh27SK8kn9i9L/O6GYWvG4GQ==
X-Received: by 2002:a17:902:cf0b:b0:216:2af7:a2a3 with SMTP id d9443c01a7336-21c3560726cmr494020895ad.53.1737709147994;
        Fri, 24 Jan 2025 00:59:07 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9c55dsm11824845ad.10.2025.01.24.00.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:59:07 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/15] cpufreq: scmi: Set .set_boost directly
Date: Fri, 24 Jan 2025 14:28:15 +0530
Message-Id: <ec27aef491c1b71ef5f1240480c52d051cdd821d.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737707712.git.viresh.kumar@linaro.org>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_005908_562198_057576B4 
X-CRM114-Status: GOOD (  13.69  )
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

The boost feature can be controlled at two levels currently, driver
level (applies to all policies) and per-policy.

Currently the driver enables driver level boost support from the
per-policy ->init() callback, which isn't really efficient as that gets
called for each policy and then there is online/offline path too where
this gets done unnecessarily.

Instead set the .set_boost field directly and always enable the boost
support. If a policy doesn't support boost feature, the core will not
enable it for that policy.

Keep the initial state of driver level boost to disabled and let the
user enable it if required as ideally the boost frequencies must be used
only when really required.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/scmi-cpufreq.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 4a3ee59cb771..ff2897789797 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -297,16 +297,6 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 	policy->transition_delay_us =
 		scmi_get_rate_limit(domain, policy->fast_switch_possible);
 
-	if (policy_has_boost_freq(policy)) {
-		ret = cpufreq_enable_boost_support();
-		if (ret) {
-			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
-			goto out_free_table;
-		} else {
-			scmi_cpufreq_driver.boost_enabled = true;
-		}
-	}
-
 	ret = freq_qos_add_request(&policy->constraints, &priv->limits_freq_req, FREQ_QOS_MAX,
 				   FREQ_QOS_MAX_DEFAULT_VALUE);
 	if (ret < 0) {
@@ -394,6 +384,7 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
 	.init	= scmi_cpufreq_init,
 	.exit	= scmi_cpufreq_exit,
 	.register_em	= scmi_cpufreq_register_em,
+	.set_boost	= cpufreq_boost_set_sw,
 };
 
 static int scmi_cpufreq_probe(struct scmi_device *sdev)
-- 
2.31.1.272.g89b43f80a514


