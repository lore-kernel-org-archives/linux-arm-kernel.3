Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064F7C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdX1SYlxV+BuSD5MpIWAGjJb4j3+Z4eC30JBUmG9pbw=; b=OqMdA6dWb2vnj1ukeMskPq7gwE
	8cPJViBQf8OgZCWvjP3yjYkkHy2fORpkoKILYjKqkJQzdFwvFC8iqe2R1fG3MuhM1auuinI7JVMIe
	I4DICKqE3jvsPjrFk0KSDZoWFVQDsT3hrz/4yjS4y2Xvn+aAuK44Oz2b2fP0iL6yrGUUSK+AlYQib
	shN2B4qHkU6rh5JhdJSVtgosiRKLT278z978Fu53NFKwJMS2VhKABTWVfGLHKuUjUKtmyQElJY7g4
	76eNdZsmEDlfvMUD4swlps4LLIfrlxTPoO0/ltgTp+lo+CMbPkhVJE87w4f3pUk2+XBMrC3z98UtV
	uNZ7hELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavel-0000000CNbC-1RFR;
	Thu, 23 Jan 2025 11:45:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavYR-0000000CM1v-1W8r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:39:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-215770613dbso8693255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632362; x=1738237162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdX1SYlxV+BuSD5MpIWAGjJb4j3+Z4eC30JBUmG9pbw=;
        b=Gb7zBvNzolj8LlZUmzydLCdOllSyVTkQdwRyDv9BINp+cT6JerVrE9pVFAvBxAFzYY
         P7T5c7AEkSXfmYR0A2y7r14jZXuFwmWrH1T/GW2SFO1xRFymDQAyzDSEmgPPDUEdT0hI
         b8EdZB9aHtGL+/jDlf0dUs2P1FsOEg5rKw52HVZ5pZnGKIfL721yj13bj7yZm2Izu9hy
         3//gzr0k3+yHA1elKtJk9jKPLMnAIT2VKbDtW9PoBU/lwENrT6yBzfIt0b2QUuD1ViP/
         mseXM+5Piks74wUy2oV+JkGevZajYq7dGtKuwStrEo7Q/wNop9TyQwRwPAmlT+g99AvI
         aB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632362; x=1738237162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdX1SYlxV+BuSD5MpIWAGjJb4j3+Z4eC30JBUmG9pbw=;
        b=drCwhQE+eiJUjwfBtGddJu8fpGzRRuYJdHRP4/kBo+AhJdE1DcMz2HMy4vaiat1+j0
         CkjDYY9EgYhCANbOS9qg6Br9CpgMNrAFFUuHMxlFVrlG56B+JecW9cinhJ87UjwmA6pL
         uuZH/fNBnOP3xWclrYyZmZCFa73u4V/4231pG1b3VyNQYpy6C38KY9/8BLwEcqr9J4oP
         ZZqOP9GpEhcMAw4WjREIxoCbpP8Qn1P+DMh55JCXR35H68ew4P/oBeMu4XwCDfSUmIVm
         krxPYqmEXp8Z+wGPyVkiSFyLlh/fL7lUoaSjTy3UqwQtvhADfS5AoPQFcCWF5CpPouAu
         Nptw==
X-Forwarded-Encrypted: i=1; AJvYcCWykw6tRk9HjhrUq5WWbeQHQBmrPUJzIjPmAInzQYzt+Lfu3Lsqe5CWtljuat6GzDzKgdeXnMoLUi+YZW9vyvTc@lists.infradead.org
X-Gm-Message-State: AOJu0YxZZy9PTT+2DesYGvt9/PtzFUISbsr+RKWTioln61zlMsDiEWAy
	milOsXABPVsmNB4gcrtd/A81cMhuLWEc9zpBpux3fJx+eZ4z5Wcgo9ThKacZuy0=
X-Gm-Gg: ASbGncs631MXqAdzfOmmYnDdPI9aMQiNxeC3okrzOZ6Ddxf966KM8WLLPc7upXuZe1u
	AZZXZp+XpHemZVlqifPHUnGGDB68oaIWWib4QLtQoqgIJk0IfZxZHd9EhdU1mImmpGCLWy4afNi
	6/RgrtIXDWL5uktd4RFgt0YkoSt6hxaTTEyoUnrV741Ox0vShoiDaBV4fZceAiahe+k2YvqY03C
	1pD9jPvMhhKJ2IB8lds/v7DM7AJEr3fbXdhXHFSScnTbiGl1A6bv0HbLxuQeeruv3lwS5aoqOO4
	Hlyoy2+bQXcNvpn0vQ==
X-Google-Smtp-Source: AGHT+IGErAbE+NwTrY1AINeQ3Si6MPxs7fVewd1+h1jBQl/h9wJNR/mCHaoI/Y7H43GtjmK7onqLBg==
X-Received: by 2002:a05:6a20:2589:b0:1e0:d0c8:7100 with SMTP id adf61e73a8af0-1eb214701c4mr46281215637.7.1737632362526;
        Thu, 23 Jan 2025 03:39:22 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f2a38sm12882604b3a.21.2025.01.23.03.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:39:22 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/33] cpufreq: scmi: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:06:00 +0530
Message-Id: <d4893396c4bacdd995d03a296b9d3ff44e71d072.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033923_410454_EA220C1C 
X-CRM114-Status: GOOD (  10.34  )
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

The cpufreq core handles this for basic attributes now, the driver can skip
setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/scmi-cpufreq.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index b8fe758aeb01..4a3ee59cb771 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -171,12 +171,6 @@ scmi_get_rate_limit(u32 domain, bool has_fast_switch)
 	return rate_limit;
 }
 
-static struct freq_attr *scmi_cpufreq_hw_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
-	NULL,
-	NULL,
-};
-
 static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct scmi_data *priv = container_of(nb, struct scmi_data, limit_notify_nb);
@@ -309,7 +303,6 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
 			goto out_free_table;
 		} else {
-			scmi_cpufreq_hw_attr[1] = &cpufreq_freq_attr_scaling_boost_freqs;
 			scmi_cpufreq_driver.boost_enabled = true;
 		}
 	}
@@ -395,7 +388,6 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
 		  CPUFREQ_NEED_INITIAL_FREQ_CHECK |
 		  CPUFREQ_IS_COOLING_DEV,
 	.verify	= cpufreq_generic_frequency_table_verify,
-	.attr	= scmi_cpufreq_hw_attr,
 	.target_index	= scmi_cpufreq_set_target,
 	.fast_switch	= scmi_cpufreq_fast_switch,
 	.get	= scmi_cpufreq_get_rate,
-- 
2.31.1.272.g89b43f80a514


