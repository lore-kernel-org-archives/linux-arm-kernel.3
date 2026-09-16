Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053D9C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 01:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcINrIiKjfT87EVSmsf+LXjiB4qB+V1qRG5mJ9yWdIQ=; b=JZAuiUT8IWappzrQNMsfEAf7Lh
	Sv8nqCR0icT+d3fHUa0GcJJeHDEYP3t7ZTf5H3ZDM5ZOuDZCKe42Yw7jX01UNvmJe02MWmSdtdHEx
	mH/k9De5+Br3McQGIjDWmEG6AJrqXnAySUB2M2C7EgXlzq7ei9vy8gKcEa5bYJp4nnjLYLdghbL2M
	Nzzp66JbORN/wbC4WYZTPo0taz/WCAoyym5M6Ppgtwopp5aZ846j75y/MMIu0VYa9uXldV6QPN6za
	a52OqW3l92SGlC9aX2p8eA5wFHLv1zTGXqL44pD7NQRvPVBx3v/BkMdnh6RKSOUkVzPeoQiNSzwvD
	oqhkjVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6eCh-0000000898U-1ggi;
	Wed, 16 Sep 2026 01:12:51 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6eCd-00000008984-3KQJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 01:12:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gcINrIiKjfT87EVSmsf+LXjiB4qB+V1qRG5mJ9yWdIQ=;
	b=YZvHJBfU1zhvPg6AJ6KTqvoCZ5aaz686uvtpBiON6Rj/D27fEu2DDGdV56gjK+BlxN3GutQVc
	d2VePqmIjy24sf/kDvr3aPhZHCpLBF+sU6ppVTaC/tAWoogp0Yy3uXNfH+oVENCCd9sLwtL6zEU
	y67fBEjSHIYfkoXBSt57dnA=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hl0vn104xz1cyPY;
	Wed, 16 Sep 2026 09:01:41 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E43C340572;
	Wed, 16 Sep 2026 09:12:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 09:12:38 +0800
Message-ID: <5384bd16-f3da-4449-bbdb-6c73101e5103@huawei.com>
Date: Wed, 16 Sep 2026 09:12:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] arm64: cpu_ops: Make 'cpu_operations' pointer
 global instead of per-cpu
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-13-will@kernel.org>
 <ed47c328-6906-4bad-9a0e-a01f067dc812@huawei.com>
 <aqP6XQbNBCzLrFnw@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aqP6XQbNBCzLrFnw@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_181248_498326_70DDA62D 
X-CRM114-Status: GOOD (  15.59  )
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



在 2026/9/11 20:55, Will Deacon 写道:
> On Tue, Sep 08, 2026 at 07:32:06PM +0800, Jinjie Ruan wrote:
>> 在 2026/9/8 0:40, Will Deacon 写道:
>>> diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
>>> index e133011f64b5..eacfb88a0c0c 100644
>>> --- a/arch/arm64/kernel/cpu_ops.c
>>> +++ b/arch/arm64/kernel/cpu_ops.c
>>> @@ -20,7 +20,8 @@ extern const struct cpu_operations acpi_parking_protocol_ops;
>>>  #endif
>>>  extern const struct cpu_operations cpu_psci_ops;
>>>  
>>> -static const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
>>> +static const struct cpu_operations *cpu_ops __ro_after_init;
>>> +static bool boot_cpu_has_enable_method __ro_after_init;
>>>  
>>>  static const struct cpu_operations *const dt_supported_cpu_ops[] __initconst = {
>>>  	&smp_spin_table_ops,
>>> @@ -40,6 +41,9 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
>>>  {
>>>  	const struct cpu_operations *const *ops;
>>>  
>>> +	if (!name)
>>> +		return NULL;
>>> +
>>>  	ops = acpi_disabled ? dt_supported_cpu_ops : acpi_supported_cpu_ops;
>>>  
>>>  	while (*ops) {
>>> @@ -49,6 +53,7 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
>>>  		ops++;
>>>  	}
>>>  
>>> +	pr_warn("Unsupported enable-method: %s\n", name);
>>>  	return NULL;
>>>  }
>>>  
>>> @@ -94,25 +99,31 @@ static const char *__init cpu_read_enable_method(int cpu)
>>>  	return enable_method;
>>>  }
>>>  /*
>>> - * Read a cpu's enable method and record it in cpu_ops.
>>> + * Read a cpu's enable method and update/check cpu_ops.
>>>   */
>>>  int __init init_cpu_ops(int cpu)
>>>  {
>>>  	const char *enable_method = cpu_read_enable_method(cpu);
>>> +	const struct cpu_operations *ops = cpu_get_ops(enable_method);
>>>  
>>> -	if (!enable_method)
>>> +	if (!ops)
>>>  		return -ENODEV;
>>>  
>>> -	cpu_ops[cpu] = cpu_get_ops(enable_method);
>>> -	if (!cpu_ops[cpu]) {
>>> -		pr_warn("Unsupported enable-method: %s\n", enable_method);
>>> -		return -EOPNOTSUPP;
>>> -	}
>>> +	if (!cpu_ops)
>>> +		cpu_ops = ops;
>>> +	else if (cpu_ops != ops)
>>> +		return -EBUSY;
>>
>> Should we return the original error code of init_cpu_ops() in
>> smp_cpu_setup()?
> 
> I don't think it matters (the only caller of smp_cpu_setup() just cares
> about 0 vs !0) and I don't see a reason to change it as part of this
> series.

That's indeed the case — currently there's only one caller, and it
doesn't care what the return value is.

> 
>> Otherwise LGTM
>> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> Thanks,
> 
> Will


