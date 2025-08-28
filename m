Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A74CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eKEAxvggqUppRsGoF1av1ZFnVt/kLiWP5KIQ1sxI23o=; b=qwpzL5cVqSu3a8BPzkSxX6odmP
	Y/WCoEJ74H9n8CZ4sPw+J6R8GUnEP+SAgrXO7Xz0J+mvsKJpTZrMBP89JltJEnv+1t2FYuDkce0mr
	MdzafOiwbJxo+GizqI+isdYrZNYxTO7qrHiUp3WTQORQlnfhJmsZ1mEIJPAktHFKWkZgJpiWsQgJB
	VB0EUL40zzxg8MNlfx80usUT3tz+85N/O3A1ll5ZLHC+/pMAYFELWGfVZykYlxlFvvg32UDncF1Bz
	5pwEVsqnBsyRqN45kJZO+Er1V6eoSboMMlD44i0VnKK2Uy8zohVCpliRRdMooGZCtBsrNDi5CNO2o
	XnxRd5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLQ-00000002Phb-0X3s;
	Thu, 28 Aug 2025 17:23:28 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraVq-00000001IDy-0Z7u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 11:09:51 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cCJYT4l2RztT9q;
	Thu, 28 Aug 2025 19:08:45 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B8E8140123;
	Thu, 28 Aug 2025 19:09:43 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemo100006.china.huawei.com (7.202.195.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 28 Aug 2025 19:09:42 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <viresh.kumar@linaro.org>, <rafael@kernel.org>, <ionela.voinescu@arm.com>,
	<beata.michalska@arm.com>, <zhenglifeng1@huawei.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<zhanjie9@hisilicon.com>, <jonathan.cameron@huawei.com>
Subject: [PATCH v2 0/2] cpufreq: CPPC: Rework FIE warning prints and cppc_scale_freq_tick()
Date: Thu, 28 Aug 2025 19:02:10 +0800
Message-ID: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_040950_344320_8C89C7B5 
X-CRM114-Status: GOOD (  11.94  )
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

Reading performance feedback counters on offline or low-power idle CPUs may
return 0, which is interpreted as -EFAULT.

This leads to two issues related to the CPPC FIE:

1. When booting a subset of CPUs in policy->related_cpus (some CPUs under
the cpufreq policy is offline), there are warnings of "failed to read perf
counters for cpu" during the CPPC FIE initialization.

2. On our platform with the CPC regs in System Memory and a power-down idle
state enabled, if the CPPC FIE is registered successfully, there are
repeated warnings of "failed to read perf counters" because
cppc_scale_freq_workfn() is trying to access the counters of remote CPUs
that enters the idle state.

To solve the above issues:

Patch 1 removes the warning when the CPPC FIE initialization fails to read
counters on offline CPUs and changes the log leve to debug.  This can be
applied separately.

Patch 2 moves the update of FIE arch_freq_scale into ticks for non-PCC regs
and maintains the existing mechanism for PCC regs, such that reading
counters would be triggered on the local CPU only.  This inherently solves
the issue in [1].  We have tested this on Kunpeng SoCs with the CPC regs
both in System Memory and FFH.  More tests on other platforms are welcome
though.
[1] https://lore.kernel.org/linux-pm/20250730032312.167062-3-yubowen8@huawei.com/

Changelog:

v2:
- Update the cover letter and the commit log based on v1 discussion
- Update FIE arch_freq_scale in ticks for non-PCC regs

v1:
https://lore.kernel.org/linux-pm/20250730032312.167062-1-yubowen8@huawei.com/

Jie Zhan (2):
  cpufreq: CPPC: Don't warn if FIE init fails to read counters
  cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs

 drivers/cpufreq/cppc_cpufreq.c | 64 +++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 25 deletions(-)

-- 
2.33.0


