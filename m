Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0052C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qIuaiWu92N8eE1crxLwwrfpR3F709l/M456tewhywjA=; b=3BLrQObMMUsw5XIfIpLXC7+qVf
	cenGMB6r2F9PHIv2lT/HQv0phiVYobBkvbZ9kVOIfNog9fx1aFuPofgZ7ijCVmWDoGR7QY91ypUiS
	Bz9/p/0xHWrsRXy5ShwRzurIhMQTBA0Db/2G2h32V9d9iEn4mPeUIW/+wq5aT11PY+OiJWnc7SIFc
	5kYogpyne6yK8c7HroQIjToa7Tkofrjs2D8W+KiA0BbXRHP4W5FuuJmNnqA1oIfHpCbGmhqB+aExz
	B2UmiushtZKMClYIp3YIFr0uHqiUBzP8svAzwyc9hpv3st8m7WYWXH354T8N5/11JrGhE1PRbwrmf
	Kakvhscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtqX-0000000AyM5-1gqA;
	Fri, 31 Jan 2025 16:26:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtpD-0000000Ay17-0vOa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:25:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5E42497;
	Fri, 31 Jan 2025 08:25:23 -0800 (PST)
Received: from e125905.cambridge.arm.com (e125905.cambridge.arm.com [10.1.194.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 43BBB3F694;
	Fri, 31 Jan 2025 08:24:55 -0800 (PST)
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
	ptsm@linux.microsoft.com,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Phil Auld <pauld@redhat.com>,
	x86@kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v10 0/4] Add support for AArch64 AMUv1-based average freq
Date: Fri, 31 Jan 2025 16:24:35 +0000
Message-Id: <20250131162439.3843071-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_082459_352778_3DE3F3EC 
X-CRM114-Status: GOOD (  19.26  )
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

Hi All,

This series adds support for obtaining an average CPU frequency based on
a hardware provided feedback. The average frequency is being exposed via
dedicated yet optional cpufreq sysfs attribute - cpuinfo_avg_freq.
The architecture specific bits are being provided for AArch64, caching on
existing implementation for FIE and AMUv1 support: the frequency scale
factor, updated on each sched tick, serving as a base for retrieving
the frequency for a given CPU, representing an average frequency
reported between the ticks.

The changes have been rather lightly (due to some limitations) tested on
an FVP model.

Note that, this series depends on [6] and [7] !

Relevant discussions:
[1] https://lore.kernel.org/all/20240229162520.970986-1-vanshikonda@os.amperecomputing.com/
[2] https://lore.kernel.org/all/7eozim2xnepacnnkzxlbx34hib4otycnbn4dqymfziqou5lw5u@5xzpv3t7sxo3/
[3] https://lore.kernel.org/all/20231212072617.14756-1-lihuisong@huawei.com/
[4] https://lore.kernel.org/lkml/ZIHpd6unkOtYVEqP@e120325.cambridge.arm.com/T/#m4e74cb5a0aaa353c60fedc6cfb95ab7a6e381e3c
[5] https://lore.kernel.org/all/20240603081331.3829278-1-beata.michalska@arm.com/

[6] https://lore.kernel.org/all/20240827154818.1195849-1-ionela.voinescu@arm.com/
[7] https://lore.kernel.org/all/20250131155842.3839098-1-beata.michalska@arm.com/

v10:
- Assume '0' is still somewhat a valid frequency value (as per discussion)
  and that gets applied for show_cpuinfo for x86
- Excluded patch:
	"arm64: amu: Delay allocating cpumask for AMU FIE support"
  which has been sent out as a separate change at [7]
- Added info on EAGAIN error within the docs
- Switched to while loop instead of goto statement for arch_freq_get_on_cpu
  implementation

v9:
- Moved changes to arch_freq_get_on_cpu to a separate patch

v8:
- Drop introducing new function and reuse arch_freq_get_on_cpu, guarding its use
  in scaling_cur_freq sysfs handler with dedicated config for x86

v7:
- Dropping 'arch_topology: init capacity_freq_ref to 0' patch from the series
  as this one has been sent separately as an independent change
  [https://lore.kernel.org/all/20240827154818.1195849-1-ionela.voinescu@arm.com/]
- Including in the series change that introduces new sysfs entry [PATCH 1/4]
- Consequently modifying previously arch_freq_get_on_cpu to match reqs for new
  sysfs attribute
- Dropping an idea of considering a CPU that has been idle for a while as a
  valid source of information for obtaining an AMU-counter based frequency
- Some minor cosmetic changes

v6:
 - delay allocating cpumask for AMU FIE support instead of invalidating the mask
   upon failure to register cpufreq policy notifications
 - drop the change to cpufreq core (for cpuinfo_cur_freq) as this one will be
   sent as a separate change

v5:
 - Fix invalid access to cpumask
 - Reworked finding reference cpu when getting the freq

v4:
- dropping seqcount
- fixing identifying active cpu within given policy
- skipping full dynticks cpus when retrieving the freq
- bringing back plugging in arch_freq_get_on_cpu into cpuinfo_cur_freq

v3:
- dropping changes to cpufreq_verify_current_freq
- pulling in changes from Ionela initializing capacity_freq_ref to 0
  (thanks for that!)  and applying suggestions made by her during last review:
	- switching to arch_scale_freq_capacity and arch_scale_freq_ref when
	  reversing freq scale factor computation
	- swapping shift with multiplication
- adding time limit for considering last scale update as valid
- updating frequency scale factor upon entering idle

v2:
- Splitting the patches
- Adding comment for full dyntick mode
- Plugging arch_freq_get_on_cpu into cpufreq_verify_current_freq instead
  of in show_cpuinfo_cur_freq to allow the framework to stay more in sync
  with potential freq changes

CC: Jonathan Corbet <corbet@lwn.net>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: H. Peter Anvin <hpa@zytor.com>
CC: Phil Auld <pauld@redhat.com>
CC: x86@kernel.org
CC: linux-doc@vger.kernel.org

Beata Michalska (4):
  cpufreq: Allow arch_freq_get_on_cpu to return an error
  cpufreq: Introduce an optional cpuinfo_avg_freq sysfs entry
  arm64: Provide an AMU-based version of arch_freq_get_on_cpu
  arm64: Update AMU-based freq scale factor on entering idle

 Documentation/admin-guide/pm/cpufreq.rst |  17 ++-
 arch/arm64/kernel/topology.c             | 125 +++++++++++++++++++++--
 arch/x86/kernel/cpu/aperfmperf.c         |   2 +-
 arch/x86/kernel/cpu/proc.c               |   7 +-
 drivers/cpufreq/Kconfig.x86              |  12 +++
 drivers/cpufreq/cpufreq.c                |  38 ++++++-
 include/linux/cpufreq.h                  |   2 +-
 7 files changed, 183 insertions(+), 20 deletions(-)

-- 
2.25.1


