Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9B2C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMlqr/+/x/eRJJM9d3zjLn1HVC6jDi6vYxdaFPI1JRA=; b=pmhZdlapmniBOyllw/rx/lFmsI
	ifwR42dNAz1LZVK0N+yFxHcfrAW6O5xAhurny0+eQcPWZbqMqIVk+tjHT6TtA7vQMQer/zLRHu4HS
	taQZPIGWyB7kzpaj8n7Cv8RurX6u5WYkA5LfezekrZzwIspSgRCbsJYaODmMTejULSobhOYsW5wsj
	JEozokHmJeWoAz4LN0/eJuWHKHsyBhOGJekxSdw/S4NOj/GyBENS4RPm6z6fMbStzjDuu1saePm3M
	6xPr1/md2hiu5pLeqso5hJk9hLMtZf8zuakzRcOiMSr/6BMMFeQu7tENCztkC7WHf6dil8n1oUIuD
	4LnjSSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFdN-0000000EK6t-3vMa;
	Fri, 24 Jan 2025 09:05:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFWl-0000000EIo6-04yw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:59:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-218c8aca5f1so42894905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 00:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709138; x=1738313938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMlqr/+/x/eRJJM9d3zjLn1HVC6jDi6vYxdaFPI1JRA=;
        b=kH/alWyjl4ybqLFXdE+DYFo71ukZsR2jEHf4RsAOZg2lbY2rZA6OPOOl1B1j96KrKt
         AFhBIZx/6R96pu4n7ZOk7DUs1V4xtrxpaRgUQknzjfnIR4RpfwQrvqVf+EHaDzFqZcdH
         HlM0VZcTohTjpkx0Ud0XvFu0+HNyoRy9dX5BU3OQgyqNRy/N/Qy4XHep+EVTHybNVGlM
         F0/FxV42m0/PCKG/gOdhC3rknVhk04+SVODypYGiqMnMmA29LZACTbfymYte/IQ4bScj
         TDxxY18sgQ09qc3G2ft0XGAaDR/Ks4H5KCUgAa+fdm3J26l+qsQxxhusSPlFVbCgsAAM
         PTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709138; x=1738313938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMlqr/+/x/eRJJM9d3zjLn1HVC6jDi6vYxdaFPI1JRA=;
        b=eGsgIX6cJ3ZZW59ypyPiBko9AkO4dW/bx0tI5L63Ro+2AARLdmgaBe9s74kn3IADe3
         hldDR9N5z0uoR/rgMp1XJA2VwaYjjvz7OEq4GKjjgKuCkNKUj0vBfHtk0Fqoa86Fri4x
         9Jszh/3+cWbOK0fivOUhyM/alH31shvCgLh0jY0f1KvQ5k9RvAYRmXBXG/1U38Oye52R
         byoy5Zv3RVRVznG0o4iltgCI5CEDZja05jgLNgJvr39r8lFmeVTodeyGJwlm4ffFa11q
         Vz0fjrlwXovh7/xALOKKVdWv0cY2I5oQJhZ1xjPPknF/Txt031tgBsWxPbPR6pzBOXzZ
         oZOw==
X-Forwarded-Encrypted: i=1; AJvYcCVwKrcErqtsY9VABJ/7DgwIJzu9qJ19Og3JZ57hiKmpH+3lWjVzRmHLHAdF2O4amcNhSBg8LELa1y/hBcG2C++M@lists.infradead.org
X-Gm-Message-State: AOJu0YyvnWYS8VzBZOLq9iXCs63tE9x/M8VqM46FeYLw8FaDV5uMVDiO
	t8XmjMD5pRRyFm/bbMCMcsOj/P+4IGcfFNWCY3Zl+/bHC19UE+CDZ6WeyXp66eCnvhAQ2r+iTRs
	9
X-Gm-Gg: ASbGncuD6vX7Xm3W71MDjaKa7kEiXqoMi4aXuwF68WUFgOieG1V+CRUUQMDELDzlhz0
	dN8xWErqAv+G2Lvd2Rkebftc9DkObuxGZOq83Z0DwC/3M5am3dGjvowtXBDq1jFsMtKMkqASco/
	peD7tvGhJ6p+IIgfgAv7M0Rb3aMg2ct7jsMNV3q/I0iiXxv01/QGk8QcQQWLlJxnpKl2RfrrTkt
	/NtTMCafnZpfo1t5A8fmZpSmthebGyLFeCrH6OEhS5ZW2GZhpB68rTxztM8cN9/mzo5eJFJZum7
	Q7PQFLg=
X-Google-Smtp-Source: AGHT+IFw8pe4tFyZIYNOF9s8Ywp9EEDR1mTMV9kBrefpwpJLLbKS7BB6GQPOd2o0T5Xa7ofgRk6iIw==
X-Received: by 2002:a05:6a00:ad8a:b0:72a:bc54:84f7 with SMTP id d2e1a72fcca58-72dafa03117mr40695468b3a.12.1737709138233;
        Fri, 24 Jan 2025 00:58:58 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6d234fsm1337263b3a.77.2025.01.24.00.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:58:57 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/15] cpufreq: apple: Set .set_boost directly
Date: Fri, 24 Jan 2025 14:28:12 +0530
Message-Id: <417fcceae52d5173cc2606dcaafe9886fd4cfeb3.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737707712.git.viresh.kumar@linaro.org>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_005859_056220_08BAB2EA 
X-CRM114-Status: GOOD (  13.67  )
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
 drivers/cpufreq/apple-soc-cpufreq.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 6ff604a0fe79..4994c86feb57 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -310,15 +310,6 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	policy->fast_switch_possible = true;
 	policy->suspend_freq = freq_table[0].frequency;
 
-	if (policy_has_boost_freq(policy)) {
-		ret = cpufreq_enable_boost_support();
-		if (ret) {
-			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
-		} else {
-			apple_soc_cpufreq_driver.boost_enabled = true;
-		}
-	}
-
 	return 0;
 
 out_free_cpufreq_table:
@@ -353,6 +344,7 @@ static struct cpufreq_driver apple_soc_cpufreq_driver = {
 	.target_index	= apple_soc_cpufreq_set_target,
 	.fast_switch	= apple_soc_cpufreq_fast_switch,
 	.register_em	= cpufreq_register_em_with_opp,
+	.set_boost	= cpufreq_boost_set_sw,
 	.suspend	= cpufreq_generic_suspend,
 };
 
-- 
2.31.1.272.g89b43f80a514


