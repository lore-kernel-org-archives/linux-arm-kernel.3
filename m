Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A46C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ua0/OUq9Ab1YuJJ4aBfE7X5j/QVRZy8pBPyH+VWRd/A=; b=dHdNQEKViSHIomwg5dUYcAkcpV
	6ue/A0zagQ7asWmARUQ2ALxH6Gt5cS8xjtzZVa6RN+dk/KUGo9ZHo4MPcSh2Z4sN/v2c+nWjG8QaT
	P1S7kwk0YBwnIuasX3C4iMya5eljFxuu2uLGI1iODTA43v7o7X0MkFQRV1CD3IZrSGtCgvmfZWAIF
	3FJv7HurbNMAcZ5sWk37q9JDPBEn9/rS3zDdrhjRp9LkRsMf/bwxyDR0sWPPnUqPjQPcmjqE9eFLZ
	IIBQgcxrIgLLEwa7Sdb7fjMhMbsotO37Rca0sOZJP/TmdP9IPscJYrpbihIlgd+uWu1CdTXhn+uG0
	Yh2zUCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYyB-00000004qn9-0tYU;
	Tue, 01 Jul 2025 11:16:11 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYl8-00000004p40-0OwQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:02:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bWg665g2jz1R8fJ;
	Tue,  1 Jul 2025 18:59:58 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 66D901A0188;
	Tue,  1 Jul 2025 19:02:29 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 19:02:29 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 19:02:28 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<dianders@chromium.org>, <kernelfans@gmail.com>, <tglx@linutronix.de>,
	<song@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v3 0/2] Update the watchdog period according to real CPU frequency
Date: Tue, 1 Jul 2025 19:02:12 +0800
Message-ID: <20250701110214.27242-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_040242_500963_BD1B02AC 
X-CRM114-Status: GOOD (  18.88  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

watchdog perf needs architecture to provide method for converting the watchdog
thresh to counter period. For arm64 we're using the max CPU frequency for
doing the conversion which is from cpufreq driver. But some cpufreq driver
are registered lately, for example cppc_cpufreq will be registered at late
initcall which is after the initialization of watchdog perf (initialized in
armv8_pmuv3 of device initcall). In such case the period of watchdog will not
be accurate enough. Fix this by registering a cpufreq notifier and update the
watchdog period once the cpufreq driver is initialized.

Attach some Q&A raised by Andrew last time:
[1] https://lore.kernel.org/linux-arm-kernel/20250512160612.c10464075df3c7842b13da11@linux-foundation.org/

Q: What is the impact of this change?  Is the current code causing problems?  If so,
   what are they?  How is the end-user experience improved by this change? Important info!
A: This will make NMI watchdog (hardlockup detector) work more accurately. HARDLOCKUP_DETECTOR_PERF
   is driven by the PMU sample interrupts of cpu cycle event with period related to the watchdog
   threshold.  User will set the watchdog threshold in seconds (e.g. 10s by default) and for
   HARDLOCKUP_DETECTOR_PERF we need to convert the seconds to cycles to setup the PMU counter.
   The coversion method is provided by the arhitecture by implementing hw_nmi_get_sample_period().
   For arm64 it's using max_cpufreq to do the conversion:

       cycle_event_period = threshold(s) * max_cpufreq(hz)

   Since arm64 doesn't have an arthictectural way to get the max_cpufreq, we use cpufreq_driver
   to get it. If cpufreq_driver is not available, currently we use a safe max_cpufreq as 5GHz.
   Without this patchset, if the cpufreq_driver is initialized after the hardlockup detector we'll
   use 5GHz for calculating the event period. It's my case here as described in the coverletter.
   That means in the default case (10s threshold) if the real max_cpufreq is 2.5GHz, the NMI watchdog
   is actually working in a 20s period. With this patchset the period can be calibrated after
   the cpufreq driver is initialized, much more accurate.

Q: As far as I can tell, this patchset impacts arm64 only.  Do you think that other architectures
   should implement this?
A: It's highly depends on the architecure's implementation of their HARDLOCKUP_DETECTOR_PERF (the
   implementation of hw_nmi_get_sample_period()). If other architectures can gain the max_cpufreq
   without cpufreq driver they don't have this problems (seems x86 implement in another way
   and can gain the cpufreq by some arhitectural way).

Q: As far as I can tell, this patchset affects all cpufreq drivers which use late_initcall()
   (on arm64, of course).  Is this correct?
A: cpufreq drivers are not touched. we registered a notifier block to the cpufreq framework
   so the changes to the cpufreq will notify us to see whether it's needed to modify the
   event period.

Q: It is asserted that we should use the *maximum* possible CPU frequency for this calculation.
   Why?  I assume this is because we care about the minimum watchdog period?
A: Because it's impossbile to use the current frequency for calculating the counter period as
   it may change at any time. Using maximum frequency will make the real period as close as
   possible to the expected watchdog thresh in a simplest way.

Change since v2:
- Address the comments from Will and collect tags for Doug and Jie, thanks
Link: https://lore.kernel.org/linux-arm-kernel/20250619114805.16968-1-yangyicong@huawei.com/#t

Change since v1:
- Handle the theoretical race condition and other comments from Doug, thanks
Link: https://lore.kernel.org/all/20250307021811.46981-1-yangyicong@huawei.com/

Yicong Yang (2):
  watchdog/perf: Provide function for adjusting the event period
  arm64/watchdog_hld: Add a cpufreq notifier for update watchdog thresh

 arch/arm64/kernel/watchdog_hld.c | 58 ++++++++++++++++++++++++++++++++
 include/linux/nmi.h              |  2 ++
 kernel/watchdog_perf.c           | 22 ++++++++++++
 3 files changed, 82 insertions(+)

-- 
2.24.0


