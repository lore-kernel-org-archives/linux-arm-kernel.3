Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C37D1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoNj/LLIwhw9nuV5TFzzwrV+/p2aGFUFYEq088oFcyg=; b=DfArlSPBXtK0oy1BPUXbLHTs62
	Ac74OElaG8DUvsUvs1rPt/1J1/bV+c87KTEvyhOGZtBB/Fj6FnEbOphDzQ3DhgnTP1yrjThgRQM79
	KKW22BuwmzWVERnIUjfl8sluYQjNUaa0hDqpFFCvPQSRTZTFyIFwvtyEjsKbWRBAnkdNiwWB4rxu9
	j4XXmjZIgYtef+86mIZ6ZdZN6fEQ5SYM/hb3VUVtwuN1DMMhbgOt1+oxALL1iN//AxmrW+A3jgMfH
	rggSRwEf7VH8v/iklKXrxRArYOYMDumCa39xIruPc0KW4z1XtYCsJugyj11yrB65iwmEsskz7bp18
	O/NCHaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhiM-00000006H5H-1Mcv;
	Wed, 03 Dec 2025 07:55:54 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhiJ-00000006H4n-0J0J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 07:55:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PoNj/LLIwhw9nuV5TFzzwrV+/p2aGFUFYEq088oFcyg=;
	b=nkEpiCkEbQIhoIMJV6fAblP92FwHhgzsnXgsHrLTTEO/rawD6EZygaQJiKr+BhdSy+mgv1Rp0
	qH1u8oISG4+UvDwSnP0cbFCaDnbaL2dq1+looLkSioRCVEquJmBjfkJtL90pJeTLEQz9VsMXzcQ
	F2EKMlw0bjqfI19mzR7VSRQ=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dLqd80p4XzpSy3;
	Wed,  3 Dec 2025 15:53:16 +0800 (CST)
Received: from kwepemf200001.china.huawei.com (unknown [7.202.181.227])
	by mail.maildlp.com (Postfix) with ESMTPS id 60312140864;
	Wed,  3 Dec 2025 15:55:35 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemf200001.china.huawei.com
 (7.202.181.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 3 Dec
 2025 15:55:34 +0800
Message-ID: <51dc71f8-8208-40c6-8ecd-50abd79a036a@huawei.com>
Date: Wed, 3 Dec 2025 15:55:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] cpufreq: CPPC: Update FIE arch_freq_scale in ticks
 for non-PCC regs
To: Jie Zhan <zhanjie9@hisilicon.com>, <viresh.kumar@linaro.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <beata.michalska@arm.com>,
	<pierre.gondois@arm.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<yubowen8@huawei.com>, <lihuisong@huawei.com>, <zhangpengjie2@huawei.com>,
	<wangzhi12@huawei.com>
References: <20251203032422.3232957-1-zhanjie9@hisilicon.com>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <20251203032422.3232957-1-zhanjie9@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf200001.china.huawei.com (7.202.181.227)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_235551_789585_88B4D36A 
X-CRM114-Status: GOOD (  17.71  )
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

Reviewed-by: Lifeng Zheng <zhenglifeng1@huawei.com>

On 2025/12/3 11:24, Jie Zhan wrote:
> Currently, the CPPC Frequency Invariance Engine (FIE) is invoked from the
> scheduler tick but defers the update of arch_freq_scale to a separate
> thread because cppc_get_perf_ctrs() would sleep if the CPC regs are in PCC.
> 
> However, this deferred update mechanism is unnecessary and introduces extra
> overhead for non-PCC register spaces (e.g. System Memory or FFH), where
> accessing the regs won't sleep and can be safely performed from the tick
> context.
> 
> Furthermore, with the CPPC FIE registered, it throws repeated warnings of
> "cppc_scale_freq_workfn: failed to read perf counters" on our platform with
> the CPC regs in System Memory and a power-down idle state enabled.  That's
> because the remote CPU can be in a power-down idle state, and reading its
> perf counters returns 0.  Moving the FIE handling back to the scheduler
> tick process makes the CPU handle its own perf counters, so it won't be
> idle and the issue would be inherently solved.
> 
> To address the above issues, update arch_freq_scale directly in ticks for
> non-PCC regs and keep the deferred update mechanism for PCC regs.
> 
> We have tested this on Kunpeng SoCs with the CPC regs both in System Memory
> and FFH.  More tests on other platforms are welcome (typically with the
> regs in PCC).
> 
> Changelog:
> v4:
> - Allow either non-PCC or PCC scale_freq_tick callbacks to be registered
>   for each cpufreq policy.
> - Factor out cppc_perf_ctrs_in_pcc_cpu() and cppc_fie_kworker_init() for
>   the above change.
> 
> v3:
> https://lore.kernel.org/linux-pm/20251104065039.1675549-1-zhanjie9@hisilicon.com/
> - Stash the state of 'cppc_perf_ctrs_in_pcc' so it won't have to check the
>   CPC regs of all CPUs everywhere (Thanks to the suggestion from Beata
>   Michalska).
> - Update the commit log, explaining more on the warning issue caused by
>   accessing perf counters on remote CPUs.
> - Drop Patch 1 that has been accepted, and rebase Patch 2 on that.
> 
> v2:
> https://lore.kernel.org/linux-pm/20250828110212.2108653-1-zhanjie9@hisilicon.com/
> - Update the cover letter and the commit log based on v1 discussion
> - Update FIE arch_freq_scale in ticks for non-PCC regs
> 
> v1:
> https://lore.kernel.org/linux-pm/20250730032312.167062-1-yubowen8@huawei.com/
> 
> Jie Zhan (3):
>   ACPI: CPPC: Factor out and export per-cpu cppc_perf_ctrs_in_pcc_cpu()
>   cpufreq: CPPC: Factor out cppc_fie_kworker_init()
>   cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs
> 
>  drivers/acpi/cppc_acpi.c       | 45 ++++++++--------
>  drivers/cpufreq/cppc_cpufreq.c | 96 ++++++++++++++++++++++------------
>  include/acpi/cppc_acpi.h       |  5 ++
>  3 files changed, 93 insertions(+), 53 deletions(-)
> 


