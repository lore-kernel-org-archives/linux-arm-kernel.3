Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170C6CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuO/QtV2/BcLw3o60J5CvBIJ5snkKkmAc3QBLnfz8M4=; b=0B5jsTGkYq/AIPDk6ki5kdXG6+
	qhLjYqSWOOb3TTKifj8Bmaw3+kfkTRAEBVQpp3tfdOyh+SPsoI3qKitGr0F21Zh7ELFF3M1Vrykjz
	3YH8rhX0fXxEDgnlSLeylDnNK3euydOVZ2k0fMSxUVB7u73Q90DYHbzOR+xz+ZfRN8PSurunsRjlA
	La9wGj1ArTIsZeLPVuIPHwviUj8a14H98lp/NTxnujhYIXUpvFgROytckLRrS/ruyfK7u9Tfzi9I8
	n+BGc93Wi+l71IuL4ofevND6mXp0y1BASi9PLp0LLqSSWIbdU3nZJR7Qfg9q98GjSUxsyxF4PeXCH
	a+iFkxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6jzt-00000005GS5-1vLy;
	Thu, 09 Oct 2025 06:19:29 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6jzq-00000005GQ1-1pIG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 06:19:28 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4cj07j4Z5hz1prKc;
	Thu,  9 Oct 2025 14:18:57 +0800 (CST)
Received: from kwepemr500004.china.huawei.com (unknown [7.202.195.141])
	by mail.maildlp.com (Postfix) with ESMTPS id 7059F1402C1;
	Thu,  9 Oct 2025 14:19:14 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemr500004.china.huawei.com
 (7.202.195.141) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 9 Oct
 2025 14:19:13 +0800
Message-ID: <477505bc-ce6d-409a-820d-55a46c72ab7d@hisilicon.com>
Date: Thu, 9 Oct 2025 14:19:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] cpufreq: CPPC: Rework FIE warning prints and
 cppc_scale_freq_tick()
To: <viresh.kumar@linaro.org>, <rafael@kernel.org>, <ionela.voinescu@arm.com>,
	<beata.michalska@arm.com>, <zhenglifeng1@huawei.com>, Prashant Malani
	<pmalani@google.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>
References: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
 <60f9cafb-2199-4c7b-ba97-7529d0ef5bf8@hisilicon.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <60f9cafb-2199-4c7b-ba97-7529d0ef5bf8@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500004.china.huawei.com (7.202.195.141)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_231926_658245_1E9C59FC 
X-CRM114-Status: GOOD (  16.50  )
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

I'm still looking forward to some feedback or tests on this series.

Cheers,
Jie

On 9/16/2025 10:58 AM, Jie Zhan wrote:
> A kindly ping on this.
> Some feedback would be nice if anyone is not on holiday ;)
> 
> Jie
> 
> On 8/28/2025 7:02 PM, Jie Zhan wrote:
>> Reading performance feedback counters on offline or low-power idle CPUs may
>> return 0, which is interpreted as -EFAULT.
>>
>> This leads to two issues related to the CPPC FIE:
>>
>> 1. When booting a subset of CPUs in policy->related_cpus (some CPUs under
>> the cpufreq policy is offline), there are warnings of "failed to read perf
>> counters for cpu" during the CPPC FIE initialization.
>>
>> 2. On our platform with the CPC regs in System Memory and a power-down idle
>> state enabled, if the CPPC FIE is registered successfully, there are
>> repeated warnings of "failed to read perf counters" because
>> cppc_scale_freq_workfn() is trying to access the counters of remote CPUs
>> that enters the idle state.
>>
>> To solve the above issues:
>>
>> Patch 1 removes the warning when the CPPC FIE initialization fails to read
>> counters on offline CPUs and changes the log leve to debug.  This can be
>> applied separately.
>>
>> Patch 2 moves the update of FIE arch_freq_scale into ticks for non-PCC regs
>> and maintains the existing mechanism for PCC regs, such that reading
>> counters would be triggered on the local CPU only.  This inherently solves
>> the issue in [1].  We have tested this on Kunpeng SoCs with the CPC regs
>> both in System Memory and FFH.  More tests on other platforms are welcome
>> though.
>> [1] https://lore.kernel.org/linux-pm/20250730032312.167062-3-yubowen8@huawei.com/
>>
>> Changelog:
>>
>> v2:
>> - Update the cover letter and the commit log based on v1 discussion
>> - Update FIE arch_freq_scale in ticks for non-PCC regs
>>
>> v1:
>> https://lore.kernel.org/linux-pm/20250730032312.167062-1-yubowen8@huawei.com/
>>
>> Jie Zhan (2):
>>   cpufreq: CPPC: Don't warn if FIE init fails to read counters
>>   cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs
>>
>>  drivers/cpufreq/cppc_cpufreq.c | 64 +++++++++++++++++++++-------------
>>  1 file changed, 39 insertions(+), 25 deletions(-)
>>

