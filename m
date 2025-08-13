Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A8AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45M5OAWmMv3cWr9Cy8BjqGgy8yitsIlrEUM+L8HwhI0=; b=Ypr5chQ6jtwU1FRpFloXRJ2QhP
	VJUq5U20TtsEVcgNeatEbU9vG37OmIPg3jcmyM2E3k4WZuiY653Is442T68GCWi3pnSdYe0KxW9ye
	ReZC7G5FUKeLrWWoTfU5OrxgEcm9IK+IItr952ldrRoIohvFRu+Ovu6JroKUIxuIa4JkFPSGS5jVh
	+hceKKw0ChXZzFQ0Pb/aSk4JEOXIe46J1ml8Y2dA1Ui3DLx5M2Gk7x+6z5FH0PKPNM3GjpB8HqAX0
	QrG7n0x94qLdF//yBcbZ3q52zvu5sEeF3e62A6TFHDejG1tWHBk6ALcz3s0T+SkdG71fiL9AcSDQf
	iyuRbbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6jf-0000000D5DH-0jEi;
	Wed, 13 Aug 2025 08:21:27 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6g2-0000000D45V-27LA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 08:17:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4c21Mt0hzBzdcHH;
	Wed, 13 Aug 2025 16:13:14 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id E5D96180B51;
	Wed, 13 Aug 2025 16:17:33 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 Aug 2025 16:17:33 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 Aug 2025 16:17:33 +0800
CC: <yangyicong@hisilicon.com>, James Clark <james.clark@linaro.org>,
	<will@kernel.org>, <linux-arm-kernel@lists.infradead.org>, <robh@kernel.org>,
	<anshuman.khandual@arm.com>, <jonathan.cameron@huawei.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
To: Mark Rutland <mark.rutland@arm.com>
References: <20250812080830.20796-1-yangyicong@huawei.com>
 <20250812080830.20796-3-yangyicong@huawei.com>
 <3d37844a-63c5-49c2-9d6d-7c3665a95466@linaro.org>
 <931e26ef-bdc6-5f9e-8976-d5a4b8e6e81f@huawei.com>
 <aJsV7nzlILHd_ZMa@J2N7QTR9R3>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <500cd725-ccb2-83f4-35a1-def9551a3719@huawei.com>
Date: Wed, 13 Aug 2025 16:17:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aJsV7nzlILHd_ZMa@J2N7QTR9R3>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_011742_870662_6B4063AE 
X-CRM114-Status: GOOD (  22.52  )
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

On 2025/8/12 18:22, Mark Rutland wrote:
> On Tue, Aug 12, 2025 at 06:14:33PM +0800, Yicong Yang wrote:
>> On 2025/8/12 18:00, James Clark wrote:
>>> On 12/08/2025 9:08 am, Yicong Yang wrote:
>>>> @@ -1002,6 +1002,15 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>>>>       if (has_branch_stack(event))
>>>>           return false;
>>>>   +    /*
>>>> +     * The PMCCNTR_EL0 increments from the processor clock rather than
>>>> +     * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
>>>> +     * counting on a WFI PE if one of its SMT silbing is not idle on a
>>>> +     * multi-threaded implementation. So don't use it on SMT cores.
>>>> +     */
>>>> +    if (cpumask_weight(topology_sibling_cpumask(smp_processor_id())) > 1)
>>>> +        return false;
>>>> +
>>>
>>> Isn't this something that's static to the PMU? If all CPUs in each PMU are always the same then this doesn't need to be probed every time and can be set once.
>>>
>> we can make use of PMCCNTR_EL0 if the SMT is runtime disabled, e.g. by /sys/devices/system/cpu/smt/control
>> if set this at probe time then we permanently lose the chance to use PMCCNTR_EL0.
> 
> Can it be runtime enabled too?
> 

yes.

> If so, then we can't use PMCCNTR_EL0 in case we later dynamically go
> from disabled to enabled.
> 

ok, this will be a problem.

> I do not think this should be handled dynamically.
> 
>>> Also you can't call smp_processor_id() from here because this is
>>> also called in armpmu_event_init() -> __hw_perf_event_init() ->
>>> validate_group() before the event is actually scheduled on a CPU.
>>> With CONFIG_DEBUG_PREEMPT you'd see the error.
>>
>> ok, will use raw_smp_processor_id() instead. it won't affect the validation checking in pmu::event_init().
>> in pmu::add() the cpu id is always stable so it'll also be fine.
> 
> NAK to this.
> 
> It *will* affect validation since it affects the number of events that
> can be placed into a single group (by virtue of allowing or forbidding
> an additional cycles events). That would be non-deterministic, which is
> horrible to debug.
> 

ok.

if we want to do it at probed time, we have no general way for knowing the CPU
is in a multi-threaded implementation - the ACPI and OF detect this in different
ways. the topology_sibling_cpumask() only contains the online CPUs so also have the
problem mentioned above. can we simply rely on the mpidr_el1.mt (maybe not, spec
mentions it doesn't indicate the multi-threaded implementations) or any suggestion?

thanks.



