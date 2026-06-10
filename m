Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FEDCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 02:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4xaWuyj8rwMkkpgsjywwm4AjlD9p1v8Dm0nUsOx1uU=; b=U0FRxrT5D6puVk8CqNffDdRopr
	SJMk7tSo/6LkJbbSEPq0KQyRO8Icm0e6jFF9LpGkan6RFrgJFmFWB0TiAfDuzgZTtLZKP2uk775In
	d+fReEvd3ZA73+a1T7v0iZ9fHszmSofymrn/2Pm3EKLLNvC7G11WQApIbQ8DMf/ggQl31oAdG38q5
	cabW/lnFOPTSy7GmbYaElWdlXCmDkZ2Sl5qv1cAwrpMG1poG+KPb3epK1h5YmcfSVC1cJfe9VAaAo
	nNxVuCAcemXi4vdku85/gwqjD//Ouxqpyyw+fyeUqVnvdV0uSi6s1CagzOoEyn9KX+GhgyckY1GS6
	dV9jx/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8w1-00000006hfR-3H63;
	Wed, 10 Jun 2026 02:44:53 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX8vy-00000006hej-1DNz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 02:44:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=f4xaWuyj8rwMkkpgsjywwm4AjlD9p1v8Dm0nUsOx1uU=;
	b=cxhWVZTisQUftj1zBxXOhInTOhsHTYJetk87grgs+N7RGHHaN6URfouuZOB6X5xpj8ULrfJks
	1gI91k6aRis1amtVzrRKfUsvVKryCc+lqxAWJMZ6ArUiAJqmU2eRHHkS+5Ir2ftle3XwMbAvz58
	hCSe5vU09TIIc4RflHp4Jxk=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gZqf6470sz1T4HP;
	Wed, 10 Jun 2026 10:36:14 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D53F40576;
	Wed, 10 Jun 2026 10:44:35 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 10 Jun 2026 10:44:33 +0800
Message-ID: <6a3aee41-7efe-4a0f-93ba-3d96d6d149a7@huawei.com>
Date: Wed, 10 Jun 2026 10:44:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Will Deacon <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <punit.agrawal@oss.qualcomm.com>,
	<jic23@kernel.org>, <osama.abdelkader@gmail.com>, <chenl311@chinatelecom.cn>,
	<fengchengwen@huawei.com>, <suzuki.poulose@arm.com>, <maz@kernel.org>,
	<lpieralisi@kernel.org>, <timothy.hayes@arm.com>, <sascha.bischoff@arm.com>,
	<arnd@arndb.de>, <mrigendra.chaubey@gmail.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <yangyicong@hisilicon.com>,
	<sudeep.holla@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260520022023.126670-1-ruanjinjie@huawei.com>
 <ah65zXlOH6a9geD9@willie-the-truck>
 <02932ef7-5819-4cf5-8e78-8fd3fd40274f@huawei.com> <aihUPsuEytsM6Dly@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aihUPsuEytsM6Dly@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_194450_650635_BC3FFBE5 
X-CRM114-Status: GOOD (  31.28  )
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



On 6/10/2026 1:58 AM, Catalin Marinas wrote:
> Hi Jinjie,
> 
> On Wed, Jun 03, 2026 at 02:38:11PM +0800, Jinjie Ruan wrote:
>> On 6/2/2026 7:09 PM, Will Deacon wrote:
>>> On Wed, May 20, 2026 at 10:20:23AM +0800, Jinjie Ruan wrote:
>>>> When booting with ACPI, arm64 smp_prepare_cpus() currently sets all
>>>> enumerated CPUs as "present" regardless of their status in the MADT. This
>>>> causes issues with SMT hotplug control. For instance, with QEMU's
>>>> "-smp 4,maxcpus=8" configuration, the MADT GICC entries are populated as
>>>> follows: the first four CPUs are marked Enabled while the remaining four
>>>> are marked Online Capable to support potential hot-plugging.
>>>>
>>>> Fix this by:
>>>>
>>>> 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
>>>>    entry before calling set_cpu_present() during SMP initialization.
>>>>
>>>> 2. Properly managing the present mask in acpi_map_cpu() and
>>>>    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
>>>>    other architectures like x86 and LoongArch.
>>>>
>>>> 3. Update the arm64 CPU hotplug documentation to no longer state that all
>>>>    online-capable vCPUs are marked as present by the kernel at boot time.
>>>>
>>>> This ensures that only physically available or explicitly enabled CPUs
>>>> are in the present mask, keeping the SMT control logic consistent with
>>>> the actual hardware state.
>>>
>>> Please can you check the Sashiko review comment?
>>>
>>> https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
>>
>> I think commit eba4675008a6 ("arm64: arch_register_cpu() variant to
>> check if an ACPI handle is now available.") introduced this bug.
>>
>> It introduced an architectural safety block inside
>> arch_unregister_cpu(). If a hot-unplug operation is determined to be a
>> physical hardware removal (where _STA evaluates to
>> !ACPI_STA_DEVICE_PRESENT), it aborts the unregistration transaction
>> early to protect unreadied arm64 infrastructure, thereby skipping
>> unregister_cpu().
>>
>> However, the generic ACPI processor driver path in
>> acpi_processor_post_eject() currently treats arch_unregister_cpu() as
>> an unconditional void operation. When arch_unregister_cpu() bails out
>> early, the subsequent cleanup flow blindly proceeds to call
>> acpi_unmap_cpu(), clears global per-cpu processor arrays, and
>> unconditionally free the 'struct acpi_processor' object.
>>
>> I think we can fix this by:
>>
>>     1. Refactoring arch_unregister_cpu() to return an integer
>> transaction status. It returns -EOPNOTSUPP when aborting due to physical
>> hot-remove blocking, -EINVAL/-EIO on firmware failures, and 0 only upon
>> successful unregistration.
>>
>>     2. Guarding the downstream execution flow in
>> acpi_processor_post_eject(). If arch_unregister_cpu() returns a error
>> code, the hot-unplug transaction is considered aborted.
> 
> I wonder whether we need all this guarding. In the worst case, we could
> rewrite the function, something like below, to always unregister and
> only warn:
> 
> void arch_unregister_cpu(int cpu)
> {
> 	acpi_handle acpi_handle = acpi_get_processor_handle(cpu);
> 	struct cpu *c = &per_cpu(cpu_devices, cpu);
> 	acpi_status status;
> 	unsigned long long sta;
> 
> 	if (!acpi_handle) {
> 		pr_err_once("Removing a CPU without associated ACPI handle\n");
> 	} else {
> 		status = acpi_evaluate_integer(acpi_handle, "_STA", NULL, &sta);
> 		if (!ACPI_FAILURE(status) &&
> 		    cpu_present(cpu) && !(sta & ACPI_STA_DEVICE_PRESENT))
> 			pr_err_once("Changing CPU present bit is not supported\n");
> 	}
> 
> 	unregister_cpu(c);
> }
> 
> However, on the first condition, can we actually trigger !acpi_handle?
> If not, we could just drop it. I tried to look up the paths and I don't
> think we'd ever end up in this function with !acpi_handle. So this
> leaves us with the next checks.

You are absolutely right：

Source Binding: During the CPU hot-add phase, acpi_add_single_object()
directly binds a valid firmware handle to device->handle, which is then
stored into per_cpu(processors, cpu) via acpi_processor_add().

Identical Lifecycle: When the hot-unplug path later invokes
acpi_get_processor_handle(), it retrieves the exact same active
pr->handle managed by the ACPI device framework, guaranteeing that the
returned handle is never NULL as long as the device exists.

648 static struct acpi_scan_handler processor_handler = {
 649 >-------.ids = processor_device_ids,
 650 >-------.attach = acpi_processor_add,
 651 #ifdef CONFIG_ACPI_HOTPLUG_CPU
 652 >-------.post_eject = acpi_processor_post_eject,
 653 #endif
 654 >-------.hotplug = {
 655 >------->-------.enabled = true,
 656 >-------},
 657 };

acpi_bus_scan()
  -> acpi_bus_check_add()
     -> acpi_add_single_object(&device, handle, type, !first_pass)
       -> acpi_init_device_object()
          -> device->handle = handle

acpi_processor_hotadd_init()
  -> acpi_processor_set_per_cpu(pr, device)
     -> per_cpu(processors, pr->id) = pr

acpi_processor_add()
  -> pr->handle = device->handle

acpi_get_processor_handle()
  -> pr = per_cpu(processors, cpu)
  -> return pr->handle

> 
> On the second/third conditions, it's more about preventing physical CPU
> hotplug as we haven't properly defined it for arm yet but we could just
> add a WARN_ONCE() to make it more visible and still proceed with the
> unregistering. I think with your proposal, we don't fully unroll the

Agreed. Unregistering the CPU is absolutely necessary at this stage
since we cannot fully roll back the state anyway, and adding a
WARN_ONCE() is more than sufficient to flag unsupported physical CPU
hot-unplug on ARM64 for now.

> state anyway just by returning an error in arch_unregister_cpu(), so I'd
> rather continue here.

Exactly. Achieving a perfect rollback at this stage is extremely
difficult and clean-up is rarely complete. It is much simpler and more
robust to just force the unregistration and carry on, which is also
consistent with how other architectures handle this by basically blindly
unregistering the CPU anyway.

> 
> What does firmware do for virtual CPU hotplug w.r.t. _STA? I noticed a
> slight change in wording in the cpu-hotplug.rst doc with your patch from
> 
>   On virtual systems the _STA method must always report the CPU as
>   ``present``
> 
> to
> 
>   On virtual systems the _STA method must report the CPU as ``present``
>   when it is activated by the firmware
> 
> Was your intention that _STA.PRESENT can become 0 when hot-unplugging
> virtual CPUs?

Sorry, that was not the intention but a mistake. On ARM64 virtual
systems, _STA.PRESENT will always remain 1 even when a vCPU is
hot-unplugged.Due to ARM64 architectural constraints (such as the GICv3
Redistributor and KVM vGIC configuration which must be statically sized
at boot), virtual CPU hotplug is emulated by keeping all possible vCPUs
present in the system, while toggling their availability via the
_STA.ENABLED bit.

Expose below ACPI Status to Guest kernel:
       a. Always _STA.Present=1 (all possible vCPUs)
       b. _STA.Enabled=1 (plugged vCPUs)
       c. _STA.Enabled=0 (unplugged vCPUs)

Link: https://lists.gnu.org/archive/html/qemu-devel/2025-05/msg05076.html

> 


