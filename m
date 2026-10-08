Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B48CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWzImz3cqI9tgDnTW/KJeshwK980DTvrUuQf1fLz0B8=; b=Z6mUaLKLxKi/Xw
	kTOQoe3Jt3r875tC0pek6V8ZeZX/QhCm01FaT/mKDojK63L5l6GiUdkNMhtjRZnjJvXE+wVr+bEKf
	mcOJnn8ZqiYB2Ea98UxPW3SxsBYowpKvjgm1fUx3fJYKaA0Gb4cx2/Rt8c/K/qd6RU65cNJUvUXTT
	KUHJRKE8nPxH7MQubFydjmDpOWjVL2uTujok1THehRXLmoIDxTG4SnWL9ATpeFQHXQGgx1/1buYOp
	cFL0IwaMtVllpw0r7ojah9x1mPLxcFE4TDKHPDHFWhiJBX6BGqHayqmNQx/UpI55PRfqO9OreIJpk
	v+1lRVC9WBbon9qoUwEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmCe-00000004EEW-2nJi;
	Thu, 08 Oct 2026 11:22:24 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmCb-00000004EE4-1Ins
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:22:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JWzImz3cqI9tgDnTW/KJeshwK980DTvrUuQf1fLz0B8=;
	b=1guiT3+soDEy4fmsY9M99q//qZRaIRuHJyzq5fEef8Qj3/w3AObA6dzEdSHb1IH0K3gEyW1ki
	7b/18QDVL2913rqtbHY4tnf+G7FmqnLzt7s+l+k+TFkEb8TkP51OSDKncSIwZJlIVdomWQbEy95
	k3S0KHgMiyPny9mFdpg/qmo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j0nMq2f15z12LHj;
	Thu,  8 Oct 2026 19:10:15 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CA15340561;
	Thu,  8 Oct 2026 19:22:12 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 19:22:11 +0800
Message-ID: <169e4e90-2802-4034-a45a-dc7fcc6cdea7@huawei.com>
Date: Thu, 8 Oct 2026 19:22:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] arm64: entry: Point SP_EL0 at the overflow stack
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-16-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-16-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042221_980926_8A9DA1AC 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/19 0:13, Will Deacon 写道:
> With SP_EL0 now available for use in the kernel, point it at the
> overflow stack so that exception entry from EL1h will later be able to
> switch to the overflow stack by writing to SPSel.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry.S |  2 ++
>  arch/arm64/kernel/head.S  |  3 +++
>  arch/arm64/kernel/smp.c   | 12 ++++++++++--
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index a45be0a837c8..6958ee238649 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -227,6 +227,8 @@ alternative_cb_end
>  	mrs	x21, sp_el0
>  	ldr_this_cpu	tsk, __entry_task, x20
>  	msr	tpidrro_el0, tsk
> +	adr_this_cpu	x19, overflow_stack + OVERFLOW_STACK_SIZE, x20
> +	msr	sp_el0, x19
>  
>  	/*
>  	 * Ensure MDSCR_EL1.SS is clear, since we can unmask debug exceptions
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index c33551ee6572..27a19e1a0ee6 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -210,6 +210,9 @@ SYM_CODE_END(preserve_boot_args)
>  	ldr	w\tmp2, [\tsk, #TSK_TI_CPU]
>  	ldr	\tmp1, [\tmp1, \tmp2, lsl #3]
>  	set_this_cpu_offset \tmp1
> +
> +	adr_this_cpu	\tmp1, overflow_stack + OVERFLOW_STACK_SIZE, \tmp2
> +	msr	sp_el0, \tmp1
>  	.endm
>  
>  /*
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 702dee8d0db5..4c122d6598de 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -51,6 +51,7 @@
>  #include <asm/processor.h>
>  #include <asm/smp_plat.h>
>  #include <asm/sections.h>
> +#include <asm/stacktrace.h>
>  #include <asm/tlbflush.h>
>  #include <asm/ptrace.h>
>  #include <asm/virt.h>
> @@ -448,8 +449,15 @@ void __init smp_cpus_done(unsigned int max_cpus)
>  
>  static void __init set_boot_cpu_offset(void)
>  {
> -	asm volatile("msr tpidr_el1, %0"
> -			:: "r" (per_cpu_offset(0)) : "memory");
> +	u64 ovf_sp = (u64)raw_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE;
> +
> +	asm volatile(
> +	"	msr	tpidr_el1, %1\n"
> +	"	add	%0, %0, %1\n"
> +	"	msr	sp_el0, %0" /* Update the overflow stack pointer */
> +	: "+r" (ovf_sp)
> +	: "r" (per_cpu_offset(0))
> +	: "memory");

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  void __init smp_prepare_boot_cpu(void)

-- 
Best regards,
Jinjie


