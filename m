Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A13CC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 04:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHZmdRFzTl+eWGNSymg/i0mRh+qaGDd59ai74OQ/f7g=; b=ovHud9iHR25vxvorcfRlCbkUZd
	hJ22+wu9xCFiuHA6xtngkvoj/vbERcgaJcJU88fBPFYjTI6iKzFc+QOfQb0KlpM/sXhaCnziT14po
	++rdfZbNCvAShCmvCPXMOKnIDllIBs8HeQE82tlo2zTh73fTwFEazupVWU/zg0zYDzyB859anxa70
	o4T+meGe+SBAos2mMn33e5dW1jP2PxKETPMS0Q/jMe36VPmjEFgZYUPkq60usTuQQf9oFaJ61Tl0t
	uL9+1jUIbO318zLObjXUNdoSVkJs4xhErNxI/9ZgF05P5DbiXFosdKw36sI64f+J8fZyG7sB5+JoI
	Sndb9+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3n5s-000000080Tt-0wzK;
	Tue, 08 Sep 2026 04:06:00 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3n5p-000000080TY-3FHu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 04:05:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RHZmdRFzTl+eWGNSymg/i0mRh+qaGDd59ai74OQ/f7g=;
	b=hNLv1gqR4ySbxtZFK2kHkYHbQ7MA9wC8uh+FwXQJb5Ho94gzc60Z7MlSETqQaB59+gEKzjhG6
	DxzZLFMU43TTIZTyltzBCHjtIJuMNcziXRo2v2tPwKC6exJf51siZ0K0Bfqfc8NBUsgGGRN8QBY
	zlkWKhKlBd0sS2C0syP+oB4=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hf97P0cn8z1K9BV;
	Tue,  8 Sep 2026 11:54:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CB43F4048B;
	Tue,  8 Sep 2026 12:05:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 12:05:50 +0800
Message-ID: <fa7f041f-5e30-4591-93bd-d8df3942e0ac@huawei.com>
Date: Tue, 8 Sep 2026 12:05:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] cpu/hotplug: Propagate bring-up status to
 arch_cpuhp_cleanup_kick_cpu()
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-5-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-5-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_210558_135410_7F7401E9 
X-CRM114-Status: GOOD (  15.19  )
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
> In preparation for enabling the generic CPU hotplug machinery on arm64,
> which has architecture-specific handling of early bringup failures,
> extend arch_cpuhp_cleanup_kick_cpu() to take an additional argument
> indicating whether or not the target AP reached the alive state.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/x86/kernel/smpboot.c  | 4 ++--
>  include/linux/cpuhotplug.h | 2 +-
>  kernel/cpu.c               | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 362f85cbdbaf..ce4e8fba5fed 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1074,7 +1074,7 @@ static int do_boot_cpu(u32 apicid, unsigned int cpu, struct task_struct *idle)
>  
>  	/* If the wakeup mechanism failed, cleanup the warm reset vector */
>  	if (ret)
> -		arch_cpuhp_cleanup_kick_cpu(cpu);
> +		arch_cpuhp_cleanup_kick_cpu(cpu, false);
>  	return ret;
>  }
>  
> @@ -1122,7 +1122,7 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
>  	return smp_ops.kick_ap_alive(cpu, tidle);
>  }
>  
> -void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu)
> +void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
>  {
>  	/* Cleanup possible dangling ends... */
>  	if (smp_ops.kick_ap_alive == native_kick_ap && x86_platform.legacy.warm_reset)
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index bbcee650155f..83ef0c4d8bbe 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -510,7 +510,7 @@ struct task_struct;
>  
>  void cpuhp_ap_sync_alive(void);
>  void arch_cpuhp_sync_state_poll(atomic_t *st, int old);
> -void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
> +void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive);
>  int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
>  bool arch_cpuhp_init_parallel_bringup(void);
>  
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index d9fe204f02cb..595258e2b6cc 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -432,7 +432,7 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
>  	return true;
>  }
>  
> -void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu) { }
> +void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive) { }
>  
>  /*
>   * Early CPU bringup synchronization point. Cannot use cpuhp_state::done_up
> @@ -451,7 +451,7 @@ static int cpuhp_bp_sync_alive(unsigned int cpu)
>  	}
>  
>  	/* Let the architecture cleanup the kick alive mechanics. */
> -	arch_cpuhp_cleanup_kick_cpu(cpu);
> +	arch_cpuhp_cleanup_kick_cpu(cpu, !ret);

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	return ret;
>  }
>  #else /* CONFIG_HOTPLUG_CORE_SYNC_FULL */


