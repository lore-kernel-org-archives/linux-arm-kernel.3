Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E85E6F062
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4BmTHKmZpTChT11r6wfk/Yiw6V1Zblv8Sg0c8rckRkU=; b=FrFPCLPi/hpoE04OgRXaPd0Bm2
	thXjIZHQkP951i0I+qm1ZQKWzYhL+SqK3dnO9xcGotN4lHYKMCBi8CwZXwF+X4RWS5WScffhd1RrC
	TKT5mtriEkV5Frp5wu2Xkj4CKcpHrk0EiUOOxomgruhdCpmpmIasLMjYS5dOWscGI2JvDE1ZZQxx8
	UFRMfvLTMoqF6KNeDFgYHSNMldV4wio6KgHb3eEyizuA60NUbDMb1pMxzzThXSfUfQBGzYHvU8IwK
	/94r08LJ8zlHynOdRM7YKn/DDHrUsYVxUlAmRQu3D4n+VVZJP+zKYyLdUznkj3oiBEMizlthvHPUV
	bCfN39zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwkT-0000000Edvn-3nOf;
	Tue, 23 Dec 2025 07:24:01 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwkJ-0000000EdsG-1Ky6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 07:23:55 +0000
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4db5y82R4YzRhRM;
	Tue, 23 Dec 2025 15:20:32 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id EF12740567;
	Tue, 23 Dec 2025 15:23:38 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 23 Dec 2025 15:23:38 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <viresh.kumar@linaro.org>, <rafael@kernel.org>, <ionela.voinescu@arm.com>,
	<beata.michalska@arm.com>, <pierre.gondois@arm.com>,
	<zhenglifeng1@huawei.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<zhanjie9@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <yubowen8@huawei.com>, <lihuisong@huawei.com>,
	<zhangpengjie2@huawei.com>, <wangzhi12@huawei.com>
Subject: [PATCH v5 0/3] cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs
Date: Tue, 23 Dec 2025 15:21:16 +0800
Message-ID: <20251223072119.3372582-1-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_232351_701379_927FEA18 
X-CRM114-Status: GOOD (  12.17  )
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

Currently, the CPPC Frequency Invariance Engine (FIE) is invoked from the
scheduler tick but defers the update of arch_freq_scale to a separate
thread because cppc_get_perf_ctrs() would sleep if the CPC regs are in PCC.

However, this deferred update mechanism is unnecessary and introduces extra
overhead for non-PCC register spaces (e.g. System Memory or FFH), where
accessing the regs won't sleep and can be safely performed from the tick
context.

Furthermore, with the CPPC FIE registered, it throws repeated warnings of
"cppc_scale_freq_workfn: failed to read perf counters" on our platform with
the CPC regs in System Memory and a power-down idle state enabled.  That's
because the remote CPU can be in a power-down idle state, and reading its
perf counters returns 0.  Moving the FIE handling back to the scheduler
tick process makes the CPU handle its own perf counters, so it won't be
idle and the issue would be inherently solved.

To address the above issues, update arch_freq_scale directly in ticks for
non-PCC regs and keep the deferred update mechanism for PCC regs.

We have tested this on Kunpeng SoCs with the CPC regs both in System Memory
and FFH.  More tests on other platforms are welcome (typically with the
regs in PCC).

Changelog:
v5:
- Minor cleanup of cppc_perf_ctrs_in_pcc_cpu() (Thanks to Rafael).
- Add a function description for cppc_perf_ctrs_in_pcc_cpu().
- Pick up tags from Lifeng and Pierre, Thanks!

v4:
https://lore.kernel.org/all/20251203032422.3232957-1-zhanjie9@hisilicon.com/
- Allow either non-PCC or PCC scale_freq_tick callbacks to be registered
  for each cpufreq policy.
- Factor out cppc_perf_ctrs_in_pcc_cpu() and cppc_fie_kworker_init() for
  the above change.

v3:
https://lore.kernel.org/linux-pm/20251104065039.1675549-1-zhanjie9@hisilicon.com/
- Stash the state of 'cppc_perf_ctrs_in_pcc' so it won't have to check the
  CPC regs of all CPUs everywhere (Thanks to the suggestion from Beata
  Michalska).
- Update the commit log, explaining more on the warning issue caused by
  accessing perf counters on remote CPUs.
- Drop Patch 1 that has been accepted, and rebase Patch 2 on that.

v2:
https://lore.kernel.org/linux-pm/20250828110212.2108653-1-zhanjie9@hisilicon.com/
- Update the cover letter and the commit log based on v1 discussion
- Update FIE arch_freq_scale in ticks for non-PCC regs

v1:
https://lore.kernel.org/linux-pm/20250730032312.167062-1-yubowen8@huawei.com/

Jie Zhan (3):
  ACPI: CPPC: Factor out and export per-cpu cppc_perf_ctrs_in_pcc_cpu()
  cpufreq: CPPC: Factor out cppc_fie_kworker_init()
  cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs

 drivers/acpi/cppc_acpi.c       | 48 +++++++++--------
 drivers/cpufreq/cppc_cpufreq.c | 96 ++++++++++++++++++++++------------
 include/acpi/cppc_acpi.h       |  5 ++
 3 files changed, 96 insertions(+), 53 deletions(-)

-- 
2.33.0


