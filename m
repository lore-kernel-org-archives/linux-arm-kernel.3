Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0683C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKpUIRGzj140ZjkVA+sWiFLK3J3NDP6ex8nF9xTgX2o=; b=TxFwHbbryS8OP9
	vPjMW1tq83byIz88L9ubeOh8PBU7g0MKJg8YzBjqY3CoklOV9VIcyhiLLzCFNsuI9Cp7/R/o6ybme
	Dq0xAOtrQ8mr72e5mxI8s5PbGJ+oaPUh2QZuJ+kqj7zAW/9UrVteRpLLoYxw+QZEhZLrZpOh3z89D
	20z1LD8YZY/VTb8fTvS31OanAZgcig2Kev+uiVrJ6eU2JStyMLAOMxPlhPzBeTZDUb4oYAnPQJjhc
	cyK0v7hrLdFRdys07EdD6ypMf0qmZGamHY8xUybSi7RyEI6kn4JgC/Xt0FbRjEq2DEx3T7V8pEnK4
	3kTLxMHomM2mPIqCSMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcMN-0000000BxlC-3uME;
	Tue, 14 Jul 2026 12:35:40 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcMJ-0000000BxjW-2WG8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:35:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YKpUIRGzj140ZjkVA+sWiFLK3J3NDP6ex8nF9xTgX2o=;
	b=IaTWLKVUgaj3/C7KsDcSZVGnDhbK/uu3kC4t36K2YwVLBtHPBCCdtTCl0/TmbHEpR1UvZjuxc
	4Pn4LQ1rQPg9fayk5gQoE1O7e7iExcZ2Yz/BXyaQRAxBA/6UEwaLhexMhpLGXyLRZ0f1Ocwf5WY
	J9ZXtaX4ERGTzsrY+jvgyjU=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gzz730V3LzLlXC;
	Tue, 14 Jul 2026 20:26:07 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DBADE40578;
	Tue, 14 Jul 2026 20:35:24 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 20:35:24 +0800
Message-ID: <9a2cb267-717c-428e-b6f3-4f01a00df89b@huawei.com>
Date: Tue, 14 Jul 2026 20:35:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/36] arm64: hibernate: mask DAIF before restoring
 hibernated kernel
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-4-vladimir.murzin@arm.com>
 <a88a1ce6-f2e0-44ff-9713-57a94c78c24e@huawei.com>
 <8157087e-74e9-47bc-ad57-c2641a58acc8@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <8157087e-74e9-47bc-ad57-c2641a58acc8@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_053536_342019_5867699A 
X-CRM114-Status: GOOD (  17.58  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/14/2026 5:37 PM, Vladimir Murzin wrote:
> On 7/10/26 04:28, Jinjie Ruan wrote:
>>> @@ -465,9 +466,21 @@ int __nocfi swsusp_arch_resume(void)
>>>  	if (el2_reset_needed())
>>>  		__hyp_set_vectors(el2_vectors);
>>>  
>>> +	/*
>>> +	 * It is necessary to mask all DAIF exceptions here as:
>>> +	 *
>>> +	 * - The copy of swsusp_arch_suspend_exit() in the hibernation
>>> +	 *   text cannot handle taking any exceptions.
>>> +	 *
>>> +	 * - The suspended kernel masked all DAIF exceptions in
>>> +	 *   swsusp_arch_resume(), and expects to be re-entered in the
>>> +	 *   same state : with all DAIF exceptions masked.
>>> +	 */
>>> +	flags = local_daif_save();
>>>  	hibernate_exit(virt_to_phys(tmp_pg_dir), resume_hdr.ttbr1_el1,
>>>  		       resume_hdr.reenter_kernel, restore_pblist,
>>>  		       resume_hdr.__hyp_stub_vectors, virt_to_phys(zero_page));
>>> +	local_daif_restore(flags);
>> I believe that the local_daif_save() here is also unnecessary because
>> hibernate_exit() returns from the "return 0 branch" of
>> __cpu_suspend_enter() in swsusp_arch_suspend(), and before that,
>> local_daif_save() has already been called to mask all exceptions.
>>
>> swsusp_arch_suspend(void)
>>     -> flags = local_daif_save();
>>     -> if (__cpu_suspend_enter(&state)) {
>>            ...
>>         } else {                // _cpu_resume <- hibernate_exit()
>>
>>            ...
>>            in_suspend = 0;
>>            ...
>>         }
>>      -> local_daif_restore(flags);

I mean that the return point of hibernate_exit() has already restored
the interrupt mask with local_daif_restore().

> 
> I'm not sure I follow, we are protecting path
> 
> ...
> load_image_and_restore()
>   -> hibernation_restore()
>      -> resume_target_kernel()
>         -> local_irq_disable()
>         -> swsusp_arch_resume()
> 	  -> swsusp_arch_suspend_exit (aka hibernate_exit())
> 	     -> ...
> 
> 
> issue can be easily observed with debug diff bellow applied on top of the
> series
> 
> diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
> index 4dd40593f736..709f5f4c420a 100644
> --- a/arch/arm64/kernel/hibernate.c
> +++ b/arch/arm64/kernel/hibernate.c
> @@ -476,6 +476,7 @@ int __nocfi swsusp_arch_resume(void)
>          *   swsusp_arch_resume(), and expects to be re-entered in the
>          *   same state : with all DAIF exceptions masked.
>          */
> +       arm64_debug_exc_context(CRITICAL_CONTEXT);
>         flags = local_all_irqs_save_mask(CRITICAL_CONTEXT);
>         hibernate_exit(virt_to_phys(tmp_pg_dir), resume_hdr.ttbr1_el1,
>                        resume_hdr.reenter_kernel, restore_pblist,
> 
> That would generate warning when run on qemu
> 
>  ------------[ cut here ]------------
>  Unexpected DAIF+ALLINT: 0xc0 + 0x0 (expected 0x3c0 + 0x2000)
>  WARNING: ./arch/arm64/include/asm/interrupts/common_flags.h:175 at swsusp_arch_resume+0x2d0/0x32c, CPU#0: sh/100
>  Modules linked in:
>  CPU: 0 UID: 0 PID: 100 Comm: sh Not tainted 7.2.0-rc2-00041-gc07d2a0843b2-dirty #288 PREEMPTLAZY 
>  Hardware name: linux,dummy-virt (DT)
>  pstate: 614000c5 (nZCv daIF -ALLINT +PAN -UAO -TCO +DIT -SSBS BTYPE=--)

I encountered some problems when trying to enter the
swsusp_arch_resume() process on QEMU.

Considering that this is the key code, it is necessary to mask the debug
and serror exception , and also to mask ALLINT.

Therefore, LGTM except for the noreturn issue.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  pc : swsusp_arch_resume+0x2d0/0x32c
>  lr : swsusp_arch_resume+0x2d0/0x32c
>  sp : ffff800081adba80
>  x29: ffff800081adbad0 x28: fff00000024ff000 x27: 0000000000000000
>  x26: 0000000000000000 x25: 0000000000000000 x24: ffff8000815cd000
>  x23: ffff8000815b4000 x22: ffff8000815c28d8 x21: ffff8000815c2000
>  x20: fff000000a839000 x19: 0000000000000000 x18: 0000000000000006
>  x17: 0000000000000000 x16: 0000000000000000 x15: ffff800081adb64f
>  x14: ffff800081adb470 x13: ffff800101adb647 x12: 000000648200003c
>  x11: ffff8000815cd8e8 x10: 0000000000000161 x9 : ffff8000815cd8e8
>  x8 : 0000000000000162 x7 : ffff8000816258e8 x6 : ffff8000816258e8
>  x5 : 3fffffffffffefff x4 : bffffffffffff000 x3 : 0000000000000000
>  x2 : 0000000000000000 x1 : 0000000000000000 x0 : fff00000024ff000
>  Call trace:
>   swsusp_arch_resume+0x2d0/0x32c (P)
>   hibernation_restore+0xe0/0x1a4
>   load_image_and_restore+0x60/0xb0
>   hibernate+0x228/0x374
>   state_store+0xe8/0xf4
>   kobj_attr_store+0x18/0x34
>   sysfs_kf_write+0x5c/0x78
>   kernfs_fop_write_iter+0x130/0x200
>   vfs_write+0x20c/0x380
>   ksys_write+0x70/0x110
>   __arm64_sys_write+0x1c/0x28
>   invoke_syscall.constprop.0+0x58/0x100
>   do_el0_svc+0x40/0xc0
>   el0_svc+0x200/0xa0c
>   el0t_64_sync_handler+0x110/0x20c
>   el0t_64_sync+0x1ac/0x1b0
>  ---[ end trace 0000000000000000 ]---
> 
> Cheers
> Vladimir
> 


