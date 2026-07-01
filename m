Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C07C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0xQROUgY3USVrZRoxRpR+tcCXdEqbd2n35d9Jl/Ms0=; b=kex4GvPnGt1rKLlp2v7PkUnwAI
	xRkvHwukSF5KbN7MHe/0fggwAFVsRv8aVyg3/9ELpPocMPJTeHjKk65BmmkXM5YrNePo0ZZkwOOLZ
	MYRVcl4O+P70sxba2YfTgHftMmIoNGTmd1UssdvL1jbWQaFqZZLlohRO3wLJ5bshBHT5Xq3vXJyz2
	262yDsUTQ6W2nXQ0sa+yiT5kNxL/Jg419Qx0p0tKRGoTLuxFrvcZ8NIDEbjpwCgVty1UY9nfHPId6
	G7a/OeSc/miJQWZ1MeRrckPAvuHDfTC7vXZ1DmqsFuEmZgDDDy+hjzdLxPy4pMYZXSL2UXWlBcgix
	9ae06ppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wescY-00000001NnB-1Ki4;
	Wed, 01 Jul 2026 10:56:46 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wescU-00000001NlL-3Y75
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:56:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=R0xQROUgY3USVrZRoxRpR+tcCXdEqbd2n35d9Jl/Ms0=;
	b=jVAQhVdn0fHFYNTsr5P+ASorHGa/BtzV9+gxe/BkYOLGPco0c9rweTFqgy/qXPpempwPWyWHr
	F3PkbOSoRe8/QPVVUV6xRowpdATn8In4hR/uQhdDoBiQ0HK75ZYsS/s6mG2wExYbdcIh+slIjk2
	1hFBzayGRAtpXyQKBWbaE9k=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gqxXz5shGzLmBl;
	Wed,  1 Jul 2026 18:47:15 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 896B340565;
	Wed,  1 Jul 2026 18:56:25 +0800 (CST)
Received: from [10.67.121.62] (10.67.121.62) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 1 Jul
 2026 18:56:24 +0800
Message-ID: <737355ec-7e0c-434b-b41d-201d08d1d020@huawei.com>
Date: Wed, 1 Jul 2026 18:56:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: topology: read CPPC FFH feedback counters in
 one operation
To: Sumit Gupta <sumitg@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <rafael@kernel.org>, <lenb@kernel.org>,
	<robert.moore@intel.com>, <beata.michalska@arm.com>,
	<zhenglifeng1@huawei.com>, <zhanjie9@hisilicon.com>,
	<cuiyunhui@bytedance.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <wanghuiqiang@huawei.com>, <xuwei5@huawei.com>,
	<lihuisong@huawei.com>, <yubowen8@huawei.com>, <wangzhi12@huawei.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260410094145.4132082-1-zhangpengjie2@huawei.com>
 <20260410094145.4132082-3-zhangpengjie2@huawei.com>
 <56a1e8bf-41b1-40cf-a943-79cce84a774e@nvidia.com>
From: Pengjie Zhang <zhangpengjie2@huawei.com>
In-Reply-To: <56a1e8bf-41b1-40cf-a943-79cce84a774e@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.62]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_035643_510497_3E5C7665 
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


On 6/29/2026 11:27 PM, Sumit Gupta wrote:
>
> On 10/04/26 15:11, Pengjie Zhang wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> arm64 implements CPPC FFH feedback-counter reads using AMU counters.
>> Because those counters must be sampled on the target CPU, reading the
>> delivered and reference counters separately widens the observation 
>> window
>> between them.
>>
>> Implement the paired FFH feedback-counter read hook on arm64 and sample
>> both AMU counters together before decoding the requested CPC register
>> values.
>>
>> Also factor the FFH bitfield extraction logic into a helper and reuse
>> it from the existing single-counter FFH read path.
>>
>> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
>> ---
>>   arch/arm64/kernel/topology.c | 75 ++++++++++++++++++++++++++++++++----
>>   1 file changed, 67 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index b32f13358fbb..b90a767b2a1f 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -50,6 +50,16 @@ struct amu_cntr_sample {
>>          unsigned long   last_scale_update;
>>   };
>>
>> +struct amu_ffh_ctrs {
>> +       u64 corecnt;
>> +       u64 constcnt;
>> +};
>> +
>> +enum cpc_ffh_ctr_id {
>> +       CPC_FFH_CTR_CORE  = 0x0,
>> +       CPC_FFH_CTR_CONST = 0x1,
>> +};
>> +
>>   static DEFINE_PER_CPU_SHARED_ALIGNED(struct amu_cntr_sample, 
>> cpu_amu_samples);
>>
>>   void update_freq_counters_refs(void)
>> @@ -397,7 +407,7 @@ static void cpu_read_constcnt(void *val)
>>   }
>>
>>   static inline
>> -int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
>> +int counters_read_on_cpu(int cpu, smp_call_func_t func, void *val)
>>   {
>>          /*
>>           * Abort call on counterless CPU.
>> @@ -447,24 +457,73 @@ bool cpc_ffh_supported(void)
>>          return true;
>>   }
>>
>> +static void amu_read_core_const_ctrs(void *val)
>> +{
>> +       struct amu_ffh_ctrs *ctrs = val;
>> +
>> +       cpu_read_constcnt(&ctrs->constcnt);
>> +       cpu_read_corecnt(&ctrs->corecnt);
>> +}
>
> Any reason to flip the order?
> Harmless as they are read back to back, but better to add a comment
> if it's intentional.
>
> Thanks,
> Sumit
> ....
>
Hi Sumit，

Thanks for taking the time to review and test.
The cpu_read_constcnt() function includes the conditional check
this_cpu_has_cap(ARM64_WORKAROUND_2457168), which incurs a latency of
6–12 nanoseconds on the our platform.
If cpu_read_corecnt() is called prior to cpu_read_constcnt(), it will
widen the sampling interval between the corecnt and constcnt counter
readings. To address this, we have adjusted the call order:
cpu_read_constcnt() is executed first, followed by cpu_read_corecnt().
I will add comments later.

Thanks,
   Pengjie


>
>

