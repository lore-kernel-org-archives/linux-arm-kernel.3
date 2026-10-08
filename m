Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D324ACA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QYn9TXvnmJ4ZihqcEGo9v58p4Zetixq26bjUvNxJos=; b=mEuBcAtgxbSWta
	gUp5+PiN94hqTknA8mBgLfAoRK6Sw6rodNFgn9EoB24OQerbGfSrbDnRGhuc5wRn+aAaBqPJv5ZYC
	2IhxW6LXQJggQIS/eZu2F1w1//zIn/TR91MACOEle4mWj2AcwMIL9fA6usftoaY5uH39vciuw2mNV
	8iT9iGtJBx0tk9wJCWT4CCBbRVhG9c8YnBVeJzheOoRH1vYuaIyZO4/XcBWVLJiyeTHib0R0SepSF
	4VIpbzPvJAYWFHnkiF4l4WjAZ/823mIqffjkzDpOua+qBsjI0sBEE7SdA3lxwLxnqrfw3ofohk5Sg
	b6kRBx4ObJH67htxybMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmbk-00000004HXp-0Xin;
	Thu, 08 Oct 2026 11:48:20 +0000
Received: from [113.46.200.217] (helo=canpmsgout02.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmbg-00000004HVK-3j4H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:48:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0QYn9TXvnmJ4ZihqcEGo9v58p4Zetixq26bjUvNxJos=;
	b=epsrYwIqbsZtAf2q67DL1OD8YbBNT0T4RjAKv2Adjwz6rLW7tIc6PXsn99Q9IaW/8iu+v4U6D
	Ie69N6BsAU6M+/UJn/b6BPeDu5ErqLWKQgP39ZKB10lluoi0C4B5znT6oeNDDxvoyDcWVDniiYK
	ciSKLlVuTOR8n0x4EG5ILck=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j0nxZ074qzcb3w;
	Thu,  8 Oct 2026 19:36:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D0B0C4058C;
	Thu,  8 Oct 2026 19:47:53 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 19:47:52 +0800
Message-ID: <e0c85b38-7d5c-48e6-a7d2-9843ef08f53d@huawei.com>
Date: Thu, 8 Oct 2026 19:47:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] arm64: entry: Implement EL1t exception handlers
 for overflow stack
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-17-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-17-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_044817_584956_2F3B5C20 
X-CRM114-Status: GOOD (  15.64  )
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



在 2026/9/19 0:14, Will Deacon 写道:
> In preparation for using EL1t to handle exceptions taken whilst running
> on the overflow stack, implement some simple wrappers around the EL1h
> handlers which perform a best-effort stack overflow check before
> proceeding.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry-common.c | 43 +++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 72c03ccea59f..9738142780df 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -327,10 +327,45 @@ static void debug_exception_exit(struct pt_regs *regs)
>  }
>  NOKPROBE_SYMBOL(debug_exception_exit);
>  
> -UNHANDLED(el1t, 64, sync)
> -UNHANDLED(el1t, 64, irq)
> -UNHANDLED(el1t, 64, fiq)
> -UNHANDLED(el1t, 64, error)
> +static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
> +{
> +	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
> +	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
> +
> +	/*
> +	 * We're in big trouble if we've overflowed the overflow stack
> +	 * so perform a best-effort check before we proceed. If our SP
> +	 * is outside of the overflow stack for this CPU then presumably
> +	 * we're already corrupting memory, so park ourselves here in an
> +	 * attempt to contain the damage.
> +	 */
> +	if (sp < ovf_stack || sp > ovf_stack + OVERFLOW_STACK_SIZE)
> +		cpu_park_loop();

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +}
> +
> +asmlinkage void noinstr el1t_64_sync_handler(struct pt_regs *regs)
> +{
> +	el1t_64_check_overflow_stack(regs);
> +	el1h_64_sync_handler(regs);
> +}
> +
> +asmlinkage void noinstr el1t_64_irq_handler(struct pt_regs *regs)
> +{
> +	el1t_64_check_overflow_stack(regs);
> +	el1h_64_irq_handler(regs);
> +}
> +
> +asmlinkage void noinstr el1t_64_fiq_handler(struct pt_regs *regs)
> +{
> +	el1t_64_check_overflow_stack(regs);
> +	el1h_64_fiq_handler(regs);
> +}
> +
> +asmlinkage void noinstr el1t_64_error_handler(struct pt_regs *regs)
> +{
> +	el1t_64_check_overflow_stack(regs);
> +	el1h_64_error_handler(regs);
> +}
>  
>  static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>  {

-- 
Best regards,
Jinjie


