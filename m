Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82956C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 02:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kJmZtDMVM2kmWjpuJDxEb12TKbOlUG6EvAx0wU6LKY=; b=G0cCjLll1jepWIwqHFzQvi7yqm
	anKPP09KXSXJmAPoymdEUxZ/AEWtU31ouVrF4ieM+6njiB/hsaBdj6VQyepBF+HrK4moZPmhUagnr
	r5QO7703GqpauuvnkZJrbingg71CYLyOZTmnESHE6j9+06lGJ43FTcibf4mwSe7DiCKg5kW27Er0C
	34DRr9BGdV/nPhcSOrNLdq31lG63nZRg7uL7cAuJxp4hQfbOnx8WV6YlPEeCT28Wj0zgPvrHkHVRQ
	ihHRn5aTpUhcT5g/ZrnCBansnHDDYOHq7UywwS7NlD+MbcxEZR3sbjYD8dBhFSvh2bHfTd3kbtaVK
	tNjb7OCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woX85-00000004Dzr-2ma4;
	Tue, 28 Jul 2026 02:01:13 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woX81-00000004DzE-3wp6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 02:01:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6kJmZtDMVM2kmWjpuJDxEb12TKbOlUG6EvAx0wU6LKY=;
	b=NiWLqVnDtCkpepVQtkxJOC9yQTNQ6D7lHusC8Gz/cuIzMdS8XPvpBs4JGUdBwMRSPcu9DhORe
	qTO5sFJcz55UNrcGUdLM9YcvOHbcZw4Zn0wG7I1zc51qYOGWmdiyNe6SpqOXLylYAjwmbIPZoPp
	BOMUIzLZjtrXVIo96pP+mhQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4h8JNK4qKCz1K9D1;
	Tue, 28 Jul 2026 09:51:29 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A31C54057A;
	Tue, 28 Jul 2026 10:00:54 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 10:00:54 +0800
Message-ID: <bb41c50e-346a-499b-8663-50d5127cdb0a@huawei.com>
Date: Tue, 28 Jul 2026 10:00:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 07/45] arm64: entry: mask DAIF before returning
 from C EL1 handlers
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-8-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-8-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_190110_293567_480146F4 
X-CRM114-Status: GOOD (  13.35  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> Most EL1 exceptions already call local_daif_mask() before returning,
> with the exception of debug exception handlers which do not change
> DAIF, and the IRQ/FIQ/Error handlers.
> 
> However, DAIF get masked in kernel_exit() in all cases when returning
> from EL1 C handlers anyway.
> 
> Move this masking from assembly to C by calling local_daif_mask()
> before irqentry_nmi_exit(). Unlike the raw DAIF masking helper,
> local_daif_mask() invokes trace_hardirqs_off(), so it must execute
> while RCU is still watching.
> 
> Remove the disable_daif assembly macro, as this was its only use.

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/assembler.h | 4 ----
>  arch/arm64/kernel/entry-common.c   | 2 ++
>  arch/arm64/kernel/entry.S          | 4 ----
>  3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index effae53e9739..0b58b550e8dc 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -34,10 +34,6 @@
>  	wx\n	.req	w\n
>  	.endr
>  
> -	.macro disable_daif
> -	msr	daifset, #0xf
> -	.endm
> -
>  /*
>   * Save/restore interrupts.
>   */
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index ceb4eb11232a..2be42d7f4eaa 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -495,6 +495,7 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
>  
>  	state = irqentry_nmi_enter(regs);
>  	do_interrupt_handler(regs, handler);
> +	local_daif_mask();
>  	irqentry_nmi_exit(regs, state);
>  }
>  
> @@ -540,6 +541,7 @@ asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
>  	local_daif_restore(DAIF_ERRCTX);
>  	state = irqentry_nmi_enter(regs);
>  	do_serror(regs, esr);
> +	local_daif_mask();
>  	irqentry_nmi_exit(regs, state);
>  }
>  
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index e0db14e9c843..f63049ac32dc 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -333,10 +333,6 @@ alternative_else_nop_endif
>  	.endm
>  
>  	.macro	kernel_exit, el
> -	.if	\el != 0
> -	disable_daif
> -	.endif
> -
>  #ifdef CONFIG_ARM64_PSEUDO_NMI
>  alternative_if_not ARM64_HAS_GIC_PRIO_MASKING
>  	b	.Lskip_pmr_restore\@


