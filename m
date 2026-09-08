Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21799C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1CwHS2/nsrDKd3k/9JfKDk6PS1YMuwHbvvQdCk2wV4=; b=oN3bSQSQZHucRDLTfZ53nRauhu
	VivU5TcGyr1LaY0Od0LNDTk0cdey0v2q4vOxkNKhRHps7LhjKznJGe1BtruKiY24zVBILWLd4IOj2
	kIJcU52q0FCj0aEokOGxouUKEw9c8mmrCp2dNA5YZ3+ypUP2HsQRIdAmdOpwzbgPRcFZcdLVGseO4
	1Hq93kZdv90Ny88Jy1RCrBqta05GVdthGHPbPHx+9j8RSZl+7uWkWVjgqDxCuzvK4fbAL1k4CeZxy
	92OwHoapcbUnB0SZDaP6e8PLzEo/3sWDjauYKmr9xI4QdMGu+ch5Wd94a96/nk8ngnNf9UXoSom32
	/gMUq3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rcP-00000008TnP-2vwv;
	Tue, 08 Sep 2026 08:55:55 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rcL-00000008TmD-3D1f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:55:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U1CwHS2/nsrDKd3k/9JfKDk6PS1YMuwHbvvQdCk2wV4=;
	b=Und2DNUI6zsh7OPNZihKUrvzzBl+OPB7CP3Un5deGSwVqZVZEd97jWEcYpaCo+I+36tOjTZAK
	7Ye7f2Lo6/YoSoqI8F7LMPsN3hBMfhJQ9qGjygsS7HlpHzLnIzBA1q1pX+Qo/XCSd5M/pAkL5U8
	twPXCaF4w+UVbTy+E/0fIzI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hfHYh6gZXzcb49;
	Tue,  8 Sep 2026 16:44:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9381940537;
	Tue,  8 Sep 2026 16:55:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 16:55:36 +0800
Message-ID: <45c37592-f05d-4b1c-812b-0cb38d1c3e24@huawei.com>
Date: Tue, 8 Sep 2026 16:55:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] arm64: smp: Defer RCU registration during secondary
 CPU bringup
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-10-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-10-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_015550_482924_3E95DE5D 
X-CRM114-Status: GOOD (  19.20  )
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



在 2026/9/8 0:40, Will Deacon 写道:
> Calling rcutree_report_cpu_starting() early during boot can lead to
> livelocks with the generic CPU hotplug mechanism if the boot CPU blocks
> on an RCU grace period while the CPU being onlined is spinning in
> cpuhp_ap_sync_alive().
> 
> In preparation for enabling the generic CPU hotplug code on arm64, split
> up the trace_hardirqs_off() call during secondary CPU bringup so that we
> update lockdep early but defer the tracing updates until after
> notify_cpu_starting() has registered the new CPU with RCU, allowing us
> to drop the explicit call to rcutree_report_cpu_starting() entirely.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/smp.c | 5 ++---
>  include/linux/rcutree.h | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index f4cabf9e19e6..ff68640d0c0b 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -217,8 +217,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	if (system_uses_irq_prio_masking())
>  		init_gic_priority_masking();
>  
> -	rcutree_report_cpu_starting(cpu);
> -	trace_hardirqs_off();

Hi Will,

I think we need to handle the printk problem before this patch as we
discussed earlier.

Otherwise defer the rcutree_report_cpu_starting() will trigger a
false-positive lockdep"suspicious RCU usage" splat during early lock
acquisitions as commit ce3d31ad3cac ("arm64/smp: Move
rcu_cpu_starting() earlier") pointed out.

Link:
https://lore.kernel.org/all/483e471d-d51b-4991-98d8-c0b4a2cdf8d8@huawei.com/

Best regards,
Jinjie

> +	lockdep_hardirqs_off(CALLER_ADDR0);
>  
>  	/*
>  	 * If the system has established the capabilities, make sure
> @@ -242,6 +241,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	 * Enable GIC and timers.
>  	 */
>  	notify_cpu_starting(cpu);
> +	trace_hardirqs_off_finish();
>  
>  	ipi_setup(cpu);
>  
> @@ -411,7 +411,6 @@ void __noreturn cpu_die_early(void)
>  
>  	/* Mark this CPU absent */
>  	set_cpu_present(cpu, 0);
> -	rcutree_report_cpu_dead();
>  
>  	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
>  		update_cpu_boot_status(CPU_KILL_ME);
> diff --git a/include/linux/rcutree.h b/include/linux/rcutree.h
> index 16a04202888b..e6ad4f2a475c 100644
> --- a/include/linux/rcutree.h
> +++ b/include/linux/rcutree.h
> @@ -116,7 +116,7 @@ int rcutree_offline_cpu(unsigned int cpu);
>  
>  void rcutree_migrate_callbacks(int cpu);
>  
> -/* Called from hotplug and also arm64 early secondary boot failure */
> +/* Called from hotplug */
>  void rcutree_report_cpu_dead(void);
>  
>  #endif /* __LINUX_RCUTREE_H */


