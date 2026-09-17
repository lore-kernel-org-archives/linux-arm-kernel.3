Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D64C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuwmjuHNbGK5+6CI3MWKqt2Q2NhbCap9Z5LDmt81Ho8=; b=GKLO50dJYyt/f/rKTP0FkkvKaC
	qxQTa2KuEaNzpCPCl7Cmy4mIsQS7H9nU7Z56d/nvNGuNcU9IzqjbwnfEHrIRO//fScvNioIUPj1Eg
	cAVL9aLG0Xp0TyYnirO39XUCu2K0mFd2XYqmPaTKXJFHpsd/iA7G+6ubh9lilOMi+7pQQUkZQ68eW
	Y4mI5TR1cbmGqfXmNHwLwEk6EhIym4xJ4MuBtjoPG20x69neCq45wLLK0u3iCZDjbnl5wnGdF8ruH
	GOKnUl7UL+oLKq4Oo4awfeRJsgC4AvkMIcqpVJQ7VshCh9MiT+VTJKLeEmnnLFJwuMfMGGYXAmR45
	W+wy5y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BiQ-0000000BM11-3S3A;
	Thu, 17 Sep 2026 12:59:50 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BiO-0000000BM0T-0YA3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:59:49 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so6056701fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789649986; x=1790254786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SuwmjuHNbGK5+6CI3MWKqt2Q2NhbCap9Z5LDmt81Ho8=;
        b=KyfK4FRGm6dUbQYx1uYVvw4/pXLzIaE2PXrLvY3FyC8LivevEbtWzmeIJvnFVrgRp0
         rBTCsKAGA7jFOmNQ178l6v9mhfNe2UZJJMsRAWAArvFtaA8L7AE+2oFO2WCuvqMoB+I7
         Xu58uPwSJADGjuLbm2CT3f6xNLLI+BMES0f/YO9eAuJF6WTtCAeuCH4Gs/YapTcOtr4T
         lfye/kUvbRDd7uxlmzo4mD2OwC1GRdUeL2wqOV9/YJP8iIikO2bY5ShVI5ZfF0OmIUkz
         PU88XcdqsLPsx7qi8V/iv6/RVoY955aGPD887qzEZRFj7JyzgdVc3YqL6sphJHhMKr+k
         P9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649986; x=1790254786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SuwmjuHNbGK5+6CI3MWKqt2Q2NhbCap9Z5LDmt81Ho8=;
        b=r5PZk0mEPZmg+otbxc18zS9xCwfT7oh7GKdErd+uJO+1etFsXcA0GQ2uIdzANwkoGO
         RK0AGHTWyXttuCUFVpRKCUTFiZNO4S19G8dFBhq0z4l5Gldi+ZRzGpeeC0X/hSArM3vE
         5I28LZXYCOIRWoN5JOVypDJ5KAzClF4eZCpbLar+MTVeIBpUsnwDyYP9CZu6MRZi7+h2
         v269lzm9199TfnrxTbykZfEZz8Y8f+WbfBhykWk6brEbffhzHGA/ctHSmx1sjSvwiwcP
         icmSmMmAMtxD0pI2p+lAevXVakGwOg/0SsXaCBee3PX5plPs3/YlpwMMd6VmbZhVRvft
         DrBg==
X-Gm-Message-State: AFuF++nCsTfl0dK5qrMDxLtvTGHTIRW0gw8zekAq0WVR9CcQcbGKzAcV
	tnuZE+d6FuBTpOcG/PW4O/ftm0EDwNYEgK/URkPLozYAgDiIBkjVdNubCSYf9OZIHpM=
X-Gm-Gg: AYBFou21UbVunMzgijjtFkbhi6eJQH0F2YOFcPX05KVFiD6e3qCY4bthL597Qj50pfq
	Tg6ig+sh0Pe8XQrketO0brPkMPKh0Bn4gd6c78of0BUszrFB+3wjxu0VcaNQ9khefaHtBsn2khG
	06HdhIN2cTADp2uFPPKa/TPXYwAeZefopIV6K3APBy8iMAtgU9RYVGH45jQg/ynlCUae7k7+u2o
	XBBtyJmnRf/6fJCZv9pT/CYmCD3jyvjY0nC2bgSfL3okjTFM6HYhHGBS7ddOurzO7lkavVucfD+
	OghDTNZsmNpxWPAyKiVc9EEr9iCeUpnHXgOSxBbKVa/ZL2fKnxg6uYzHMERV4YCR5j8UTMS0R9H
	/u8yMt6SVMoWhNAjVa0skrsFPPaUUnmIGwy12XIZJ8z3bkFgiFVO26z/JMhgOgdEvF48ty+MeVW
	jwTNCOX3nZx0fA6Y4MWaI6vpYCtuF7KZHMd/oKZhgS5+tFRiA06jxxTXzOg8cOIug3iwJ8N832X
	hdm6i7B
X-Received: by 2002:a05:600d:4442:10b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49fbd1e4f0amr32449375e9.13.1789649484234;
        Thu, 17 Sep 2026 05:51:24 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm86555015e9.3.2026.09.17.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:51:23 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 2/2] arch_topology: use the boost frequencies for capacity_freq_ref
Date: Thu, 17 Sep 2026 14:51:12 +0200
Message-ID: <20260917125112.2283-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917125112.2283-1-okerixx@gmail.com>
References: <20260917125112.2283-1-okerixx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_055948_181770_1054E302 
X-CRM114-Status: GOOD (  17.15  )
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

capacity_freq_ref is latched from policy->cpuinfo.max_freq by
init_cpu_capacity_callback() on CPUFREQ_CREATE_POLICY.
cpufreq_frequency_table_cpuinfo() excludes CPUFREQ_BOOST_FREQ entries
while boost is disabled, so on a system that boots with boost off the
reference is the non-boost maximum and stays there.

Once boost is enabled the CPU runs above its reference.  On arm64, where
the AMU drives frequency invariance, amu_scale_freq_tick() caps the scale
at SCHED_CAPACITY_SCALE, so the scheduler cannot tell a boosted CPU from
one at the sustained maximum, and arch_freq_get_on_cpu() cannot report
above the reference, so cpuinfo_avg_freq is pinned to it.

CPPC based systems do not have the problem: their reference comes from
highest_perf, and a disabled boost shows up as cpufreq pressure.  Do the
same for frequency table drivers and take the highest valid table entry,
boost entries included, as the reference.  With boost off
cpufreq_update_pressure() then reports the difference as pressure.

On a Snapdragon X2 Elite (Glymur) laptop with a 4032000 kHz sustained
and a 4723200 kHz boost OPP this moves the reference of the big cores
from 4032000 to 4723200 kHz.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/base/arch_topology.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..300f64ffea2f 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -386,6 +386,20 @@ static cpumask_var_t cpus_to_visit;
 static void parsing_done_workfn(struct work_struct *work);
 static DECLARE_WORK(parsing_done_work, parsing_done_workfn);
 
+static unsigned int topology_policy_max_freq(struct cpufreq_policy *policy)
+{
+	unsigned int max_freq = policy->cpuinfo.max_freq;
+	struct cpufreq_frequency_table *pos;
+
+	if (!policy->freq_table)
+		return max_freq;
+
+	cpufreq_for_each_valid_entry(pos, policy->freq_table)
+		max_freq = max(max_freq, pos->frequency);
+
+	return max_freq;
+}
+
 static int
 init_cpu_capacity_callback(struct notifier_block *nb,
 			   unsigned long val,
@@ -404,7 +418,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
 	for_each_cpu(cpu, policy->related_cpus) {
-		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
+		per_cpu(capacity_freq_ref, cpu) = topology_policy_max_freq(policy);
 		freq_inv_set_max_ratio(cpu,
 				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
 	}
-- 
2.55.0


