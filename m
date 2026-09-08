Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203D6C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qzwfi/vRXJ/sbPtrb6nPo1rLb6V5zc5XUhtnjBMfvxU=; b=rchjOgUkiKe/Xf1pBdbb1zumlX
	5CUmCnAdntP1/98da8TZZtXv68TjUm5I5BP2QmFLf/EgupcmMUGCO1PWUFLVePAbfcyIrg+frRcH2
	1x+gq5S3fnukAIIKEiiaLxWoxYFvJkkHOG0UAquoyiQYSJqcEgkfHW9hoQYc2e3YEHLdoofrzjha4
	P/jvq2vrbiFyc/ECVmwUj4kyyGsgg2b5mKek3+V7p9+mBwJ1nOCaL2b03P8P2mtJ8V1h2gux5WRls
	xuhA22LOGdIOlc+OlIL3h71MYC5IbKN3qCiH6HrVqsPzwCwsmAZUjjpt0SvW9AvdzENMaOoYS9RNx
	/KlFOCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ty0-00000008sgx-2NDK;
	Tue, 08 Sep 2026 11:26:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3txy-00000008sgf-3K0A
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 11:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qzwfi/vRXJ/sbPtrb6nPo1rLb6V5zc5XUhtnjBMfvxU=; b=UEQwg6Sz5CXh4OIkK+6hbRaP9Y
	aFw6wLVVwsdEReof8+JkBV4ybXCkv8qjV+gLECChSGYY/vTs0np8vTufWW8t0rCngIATZZBl8qiKV
	1qPr8kop/A80IdouD96CkFSFVQefZ4uRRJn2XgeoJQR+HY6tDJHf8qM3iDqKONWnxJdODP9dQNpsQ
	ABCsHmzgMbaYHuB1n756qYsX4jGpBuihoQisH0yWIizrQDNrvL0DLkPANFffP4Ckt17JLTqziQWxr
	shnERvoSmVY3NwL8gcJCygQFyne0VyWabGJtoLxBoUV8TLE7oLku02pzUM+BKWiIlbkX/oy7+XZec
	Ci0P64JA==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3txv-0000000HL95-2bti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:26:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Qzwfi/vRXJ/sbPtrb6nPo1rLb6V5zc5XUhtnjBMfvxU=;
	b=X+s2RjUp4CGWb/lCsCXZNGeXilRRifMw5jErICf8jsLDnoOzU6DPP2oDiiU7LSTT4GDAT2Gmm
	QUF3wLqybVpgcX5nbou+DpyW2p9fGThRSz4s3VMtomwz7ftaypqfn41O6xWC1V6UOv1+15UqXFR
	Mb7UvSXiHwA4VTQ53C2iw9c=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hfLtT2rtfz1T4Fq;
	Tue,  8 Sep 2026 19:14:25 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9903F4056E;
	Tue,  8 Sep 2026 19:25:55 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 19:25:55 +0800
Message-ID: <f01fc59e-5254-484d-adf9-8dd1c2e58d91@huawei.com>
Date: Tue, 8 Sep 2026 19:25:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] arm64: smp: Defer RCU registration during secondary
 CPU bringup
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-10-will@kernel.org>
 <45c37592-f05d-4b1c-812b-0cb38d1c3e24@huawei.com>
 <ap_hR1mntzm-TZOP@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ap_hR1mntzm-TZOP@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_122616_258287_FCD7AC30 
X-CRM114-Status: GOOD (  22.73  )
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



在 2026/9/8 18:19, Will Deacon 写道:
> Hi Jinjie,
> 
> On Tue, Sep 08, 2026 at 04:55:36PM +0800, Jinjie Ruan wrote:
>> 在 2026/9/8 0:40, Will Deacon 写道:
>>> Calling rcutree_report_cpu_starting() early during boot can lead to
>>> livelocks with the generic CPU hotplug mechanism if the boot CPU blocks
>>> on an RCU grace period while the CPU being onlined is spinning in
>>> cpuhp_ap_sync_alive().
>>>
>>> In preparation for enabling the generic CPU hotplug code on arm64, split
>>> up the trace_hardirqs_off() call during secondary CPU bringup so that we
>>> update lockdep early but defer the tracing updates until after
>>> notify_cpu_starting() has registered the new CPU with RCU, allowing us
>>> to drop the explicit call to rcutree_report_cpu_starting() entirely.
>>>
>>> Signed-off-by: Will Deacon <will@kernel.org>
>>> ---
>>>  arch/arm64/kernel/smp.c | 5 ++---
>>>  include/linux/rcutree.h | 2 +-
>>>  2 files changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
>>> index f4cabf9e19e6..ff68640d0c0b 100644
>>> --- a/arch/arm64/kernel/smp.c
>>> +++ b/arch/arm64/kernel/smp.c
>>> @@ -217,8 +217,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>>>  	if (system_uses_irq_prio_masking())
>>>  		init_gic_priority_masking();
>>>  
>>> -	rcutree_report_cpu_starting(cpu);
>>> -	trace_hardirqs_off();
>>
>> I think we need to handle the printk problem before this patch as we
>> discussed earlier.
>>
>> Otherwise defer the rcutree_report_cpu_starting() will trigger a
>> false-positive lockdep"suspicious RCU usage" splat during early lock
>> acquisitions as commit ce3d31ad3cac ("arm64/smp: Move
>> rcu_cpu_starting() earlier") pointed out.
> 
> Sorry, I meant to mention this in the cover letter but forgot about it.
> I'm not sure that ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting()
> earlier") is still relevant with the latest printk/console/lockdep code.
> I tried quite hard to trigger lockdep splats manually, but the only way
> I could do it was by using the "%pS" specifier to print the name of a
> symbol in a module, which would cause an RCU walk of the module symbols
> in the kallsyms code! Manually calling WARN() or even rcu_read_lock() /
> spin_lock() did _not_ trigger a splat.

Hi Will,

Add "dyndbg="+p"" in cmdline, CONFIG_DEBUG_LOCK_ALLOC=y,
CONFIG_PROVE_RCU_LIST=y, we can reproduce the warning as below:

I believe there is also a problem in the RISC-V code itself here as
store_cpu_topology() is common for RISC-V.

[    0.335162] smp: Bringing up secondary CPUs ...
[    0.345495]
[    0.345513] =============================
[    0.345523] WARNING: suspicious RCU usage
[    0.345621] 7.3.0-rc2-00010-g2311ba2cd56f #500 Tainted: G        W
[    0.345637] -----------------------------
[    0.345646] kernel/locking/lockdep.c:3845 RCU-list traversed in
non-reader section!!
[    0.345659]
[    0.345659] other info that might help us debug this:
[    0.345659]
[    0.345680]
[    0.345680] RCU used illegally from offline CPU!
[    0.345680] rcu_scheduler_active = 1, debug_locks = 1
[    0.345725] locks held by swapper/1/0: 0, last CPU#1
[    0.345743]
[    0.345743] stack backtrace:
[    0.345834] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G        W
         7.3.0-rc2-00010-g2311ba2cd56f #500 PREEMPT(full)
[    0.345885] Tainted: [W]=WARN
[    0.346077] Call trace:
[    0.346102]  show_stack+0x20/0x38 (C)
[    0.346153]  dump_stack_lvl+0xc4/0x150
[    0.346176]  dump_stack+0x18/0x28
[    0.346194]  lockdep_rcu_suspicious+0x170/0x238
[    0.346217]  __lock_acquire+0xf08/0x1818
[    0.346237]  lock_acquire+0x1e0/0x450
[    0.346256]  _raw_spin_lock_irqsave+0x70/0xc0
[    0.346277]  down_trylock+0x20/0x60
[    0.346293]  __down_trylock_console_sem+0x4c/0x118
[    0.346316]  vprintk_emit+0x2d8/0x3f8
[    0.346333]  vprintk_default+0x40/0x58
[    0.346350]  vprintk+0x3c/0x80
[    0.346366]  _printk+0x64/0x98
[    0.346386]  __dynamic_pr_debug+0x90/0xd8
[    0.346406]  acpi_get_cache_info+0x140/0x1a0
[    0.346430]  init_cache_level+0xec/0x110
[    0.346450]  detect_cache_attributes+0x74/0x7c0
[    0.346473]  update_siblings_masks+0x30/0x300
[    0.346495]  store_cpu_topology+0x70/0xf0
[    0.346515]  secondary_start_kernel+0xe0/0x178
[    0.346535]  __secondary_switched+0xc0/0xc8


> 
> Since that's not something I think we should be doing this early, I
> decided to leave the code as-is unless I have a way to trigger a lockdep
> splat with the relatively simple prints we have on the early error paths.
> 
> Will


