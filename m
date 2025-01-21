Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DBCC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAQ5O6UFweQeKcrM188RPCoYA+8A+ltGLL2UVw10B6s=; b=DLMbXeoQL+W/nDGlvQQred/yT0
	R8+huwYCpZI4kMKT53tnN0gQoMiPQZNwtVtP37uqU0wLM/pPS55azJ5dajZcmIFVuHAYGRrhdnBdH
	J9YpgJzOG35Hv3lhZ1gwKuZLjhUit1m3JirZ6BAvbXM/NzRtcB8v87y4jS0ELaGl0FOqIGZmb9JpI
	FATgD9l2rXAbyaalWwApoiT3TUzMaAoBqwpI+3QvbdP2K1e1i+RuKJEHauAy46KClaEFRHjV8JULx
	q0UvoeASp1SiyJkRXZFLQS5JcvE7iwnkyPW+pqKhHQ8RoNCcSJev9goTJOWaxkztMe/8hMwmphShI
	OPm7KsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9wQ-00000007J5V-0Omg;
	Tue, 21 Jan 2025 08:48:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9so-00000007IQI-0Z1v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:45:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A37591575;
	Tue, 21 Jan 2025 00:45:40 -0800 (PST)
Received: from e125905.cambridge.arm.com (e125905.cambridge.arm.com [10.1.194.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8987C3F66E;
	Tue, 21 Jan 2025 00:45:08 -0800 (PST)
From: Beata Michalska <beata.michalska@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	ionela.voinescu@arm.com,
	sudeep.holla@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: sumitg@nvidia.com,
	yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com,
	zhanjie9@hisilicon.com,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Phil Auld <pauld@redhat.com>,
	x86@kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v9 2/5] cpufreq: Introduce an optional cpuinfo_avg_freq sysfs entry
Date: Tue, 21 Jan 2025 08:44:32 +0000
Message-Id: <20250121084435.2839280-3-beata.michalska@arm.com>
In-Reply-To: <20250121084435.2839280-1-beata.michalska@arm.com>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_004514_264511_1F492ED2 
X-CRM114-Status: GOOD (  22.34  )
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

Currently the CPUFreq core exposes two sysfs attributes that can be used
to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
and scaling_cur_freq. Both provide slightly different view on the
subject and they do come with their own drawbacks.

cpuinfo_cur_freq provides higher precision though at a cost of being
rather expensive. Moreover, the information retrieved via this attribute
is somewhat short lived as frequency can change at any point of time
making it difficult to reason from.

scaling_cur_freq, on the other hand, tends to be less accurate but then
the actual level of precision (and source of information) varies between
architectures making it a bit ambiguous.

The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
distinct interface, exposing an average frequency of a given CPU(s), as
reported by the hardware, over a time frame spanning no more than a few
milliseconds. As it requires appropriate hardware support, this
interface is optional.

Note that under the hood, the new attribute relies on the information
provided by arch_freq_get_on_cpu, which, up to this point, has been
feeding data for scaling_cur_freq attribute, being the source of
ambiguity when it comes to interpretation. This has been amended by
restoring the intended behavior for scaling_cur_freq, with a new
dedicated config option to maintain status quo for those, who may need
it.

CC: Jonathan Corbet <corbet@lwn.net>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: H. Peter Anvin <hpa@zytor.com>
CC: Phil Auld <pauld@redhat.com>
CC: x86@kernel.org
CC: linux-doc@vger.kernel.org

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 Documentation/admin-guide/pm/cpufreq.rst | 16 ++++++++++++-
 drivers/cpufreq/Kconfig.x86              | 12 ++++++++++
 drivers/cpufreq/cpufreq.c                | 30 +++++++++++++++++++++++-
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
index a21369eba034..e9969174026c 100644
--- a/Documentation/admin-guide/pm/cpufreq.rst
+++ b/Documentation/admin-guide/pm/cpufreq.rst
@@ -248,6 +248,19 @@ are the following:
 	If that frequency cannot be determined, this attribute should not
 	be present.
 
+``cpuinfo_avg_freq``
+        An average frequency (in KHz) of all CPUs belonging to a given policy,
+        derived from a hardware provided feedback and reported on a time frame
+        spanning at most few milliseconds.
+
+        This is expected to be based on the frequency the hardware actually runs
+        at and, as such, might require specialised hardware support (such as AMU
+        extension on ARM). If one cannot be determined, this attribute should
+        not be present.
+
+        Note, that failed attempt to retrieve current frequency for a given
+        CPU(s) will result in an appropriate error.
+
 ``cpuinfo_max_freq``
 	Maximum possible operating frequency the CPUs belonging to this policy
 	can run at (in kHz).
@@ -293,7 +306,8 @@ are the following:
 	Some architectures (e.g. ``x86``) may attempt to provide information
 	more precisely reflecting the current CPU frequency through this
 	attribute, but that still may not be the exact current CPU frequency as
-	seen by the hardware at the moment.
+	seen by the hardware at the moment. This behavior though, is only
+	available via c:macro:``CPUFREQ_ARCH_CUR_FREQ`` option.
 
 ``scaling_driver``
 	The scaling driver currently in use.
diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
index 97c2d4f15d76..212e1b9afe21 100644
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@ -340,3 +340,15 @@ config X86_SPEEDSTEP_RELAXED_CAP_CHECK
 	  option lets the probing code bypass some of those checks if the
 	  parameter "relaxed_check=1" is passed to the module.
 
+config CPUFREQ_ARCH_CUR_FREQ
+	default y
+	bool "Current frequency derived from HW provided feedback"
+	help
+	  This determines whether the scaling_cur_freq sysfs attribute returns
+	  the last requested frequency or a more precise value based on hardware
+	  provided feedback (as architected counters).
+	  Given that a more precise frequency can now be provided via the
+	  cpuinfo_avg_cur_freq attribute, by enabling this option,
+	  scaling_cur_freq maintains the provision of a counter based frequency,
+	  for compatibility reasons.
+
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 6f45684483c4..b2a8efa83c98 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -733,12 +733,20 @@ __weak int arch_freq_get_on_cpu(int cpu)
 	return -EOPNOTSUPP;
 }
 
+static inline bool cpufreq_avg_freq_supported(struct cpufreq_policy *policy)
+{
+	return arch_freq_get_on_cpu(policy->cpu) != -EOPNOTSUPP;
+}
+
 static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
 {
 	ssize_t ret;
 	int freq;
 
-	freq = arch_freq_get_on_cpu(policy->cpu);
+	freq = IS_ENABLED(CONFIG_CPUFREQ_ARCH_CUR_FREQ)
+		? arch_freq_get_on_cpu(policy->cpu)
+		: 0;
+
 	if (freq > 0)
 		ret = sysfs_emit(buf, "%u\n", freq);
 	else if (cpufreq_driver->setpolicy && cpufreq_driver->get)
@@ -783,6 +791,19 @@ static ssize_t show_cpuinfo_cur_freq(struct cpufreq_policy *policy,
 	return sysfs_emit(buf, "<unknown>\n");
 }
 
+/*
+ * show_cpuinfo_avg_freq - average CPU frequency as detected by hardware
+ */
+static ssize_t show_cpuinfo_avg_freq(struct cpufreq_policy *policy,
+				     char *buf)
+{
+	int avg_freq = arch_freq_get_on_cpu(policy->cpu);
+
+	if (avg_freq > 0)
+		return sysfs_emit(buf, "%u\n", avg_freq);
+	return avg_freq != 0 ? avg_freq : -EINVAL;
+}
+
 /*
  * show_scaling_governor - show the current policy for the specified CPU
  */
@@ -945,6 +966,7 @@ static ssize_t show_bios_limit(struct cpufreq_policy *policy, char *buf)
 }
 
 cpufreq_freq_attr_ro_perm(cpuinfo_cur_freq, 0400);
+cpufreq_freq_attr_ro(cpuinfo_avg_freq);
 cpufreq_freq_attr_ro(cpuinfo_min_freq);
 cpufreq_freq_attr_ro(cpuinfo_max_freq);
 cpufreq_freq_attr_ro(cpuinfo_transition_latency);
@@ -1072,6 +1094,12 @@ static int cpufreq_add_dev_interface(struct cpufreq_policy *policy)
 			return ret;
 	}
 
+	if (cpufreq_avg_freq_supported(policy)) {
+		ret = sysfs_create_file(&policy->kobj, &cpuinfo_avg_freq.attr);
+		if (ret)
+			return ret;
+	}
+
 	ret = sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
 	if (ret)
 		return ret;
-- 
2.25.1


