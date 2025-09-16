Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16CBCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 02:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Mt5MlhdP/I9FwFh3JlLHEPaZ3C1UVBURZozmblaZLs=; b=iJ4lSPmPspQB+SF7arQKoKzBuV
	X662C5u+yCADiTZSmN+7eoFzQW+lSRvYCA0thpFhYG3QyapmCOcgQ0CFdSMU+EnRRMDS7aRBifg3i
	XDu5D8OAWW1M2MKN9WNeV23VKzfqblSM80+fHoyixj+G75DCdnnHvCHYykGLqgO8z7vnhbD2qEog5
	e041Oc+Ht/SLLK6aL0BPHniP6pDmjHghgGgTHh6ZlI82qy1dq0bF4OeXwz7dVneHNl6S/vN/b1OjB
	fJLh/0JyXvBVVABt43h/jxz6LA4Zo+kGkB64Y7Ku8Jw7JFXvXHLnf7noyZ5F+9LE179C88GmfCeug
	DAb+VvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyLu7-00000006Y6m-3Ueo;
	Tue, 16 Sep 2025 02:58:51 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyLu4-00000006Y3y-31Mf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 02:58:50 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cQmgw23fpzddML;
	Tue, 16 Sep 2025 10:54:04 +0800 (CST)
Received: from kwepemr500004.china.huawei.com (unknown [7.202.195.141])
	by mail.maildlp.com (Postfix) with ESMTPS id 503551401F4;
	Tue, 16 Sep 2025 10:58:39 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemr500004.china.huawei.com
 (7.202.195.141) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 16 Sep
 2025 10:58:38 +0800
Message-ID: <60f9cafb-2199-4c7b-ba97-7529d0ef5bf8@hisilicon.com>
Date: Tue, 16 Sep 2025 10:58:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] cpufreq: CPPC: Rework FIE warning prints and
 cppc_scale_freq_tick()
To: <viresh.kumar@linaro.org>, <rafael@kernel.org>, <ionela.voinescu@arm.com>,
	<beata.michalska@arm.com>, <zhenglifeng1@huawei.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, Jie Zhan <zhanjie9@hisilicon.com>
References: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500004.china.huawei.com (7.202.195.141)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_195848_914203_2FAEBF5C 
X-CRM114-Status: GOOD (  17.74  )
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

A kindly ping on this.
Some feedback would be nice if anyone is not on holiday ;)

Jie

On 8/28/2025 7:02 PM, Jie Zhan wrote:
> Reading performance feedback counters on offline or low-power idle CPUs may
> return 0, which is interpreted as -EFAULT.
> 
> This leads to two issues related to the CPPC FIE:
> 
> 1. When booting a subset of CPUs in policy->related_cpus (some CPUs under
> the cpufreq policy is offline), there are warnings of "failed to read perf
> counters for cpu" during the CPPC FIE initialization.
> 
> 2. On our platform with the CPC regs in System Memory and a power-down idle
> state enabled, if the CPPC FIE is registered successfully, there are
> repeated warnings of "failed to read perf counters" because
> cppc_scale_freq_workfn() is trying to access the counters of remote CPUs
> that enters the idle state.
> 
> To solve the above issues:
> 
> Patch 1 removes the warning when the CPPC FIE initialization fails to read
> counters on offline CPUs and changes the log leve to debug.  This can be
> applied separately.
> 
> Patch 2 moves the update of FIE arch_freq_scale into ticks for non-PCC regs
> and maintains the existing mechanism for PCC regs, such that reading
> counters would be triggered on the local CPU only.  This inherently solves
> the issue in [1].  We have tested this on Kunpeng SoCs with the CPC regs
> both in System Memory and FFH.  More tests on other platforms are welcome
> though.
> [1] https://lore.kernel.org/linux-pm/20250730032312.167062-3-yubowen8@huawei.com/
> 
> Changelog:
> 
> v2:
> - Update the cover letter and the commit log based on v1 discussion
> - Update FIE arch_freq_scale in ticks for non-PCC regs
> 
> v1:
> https://lore.kernel.org/linux-pm/20250730032312.167062-1-yubowen8@huawei.com/
> 
> Jie Zhan (2):
>   cpufreq: CPPC: Don't warn if FIE init fails to read counters
>   cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs
> 
>  drivers/cpufreq/cppc_cpufreq.c | 64 +++++++++++++++++++++-------------
>  1 file changed, 39 insertions(+), 25 deletions(-)
> 

