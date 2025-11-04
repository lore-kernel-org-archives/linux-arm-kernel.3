Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF14CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYXcLzRaG8iNicTNR/jlMvoxSdUH1yGmuASCkq475x8=; b=qQohgQx3FDdnkYPZ/i92rNxpeM
	W2il7MrkWPCJqE2tE3GSQQjeTcYznrb98JY9hzzLXlyzXNfxVGb8DdE2B2bdO5uXLC5uFGVT0P/vu
	dDG9HJ5NV5FtffS0EUVcBg+5HI/3V6JV3hGRhhjt0zezaj1l2VsJw5QHTD0bykcDDgGmeElZ7g9B+
	5JEwsDgqjP1rQrYnHecLKEZMsu3as3UOxYC7PwfsVeewG1+Cau8LzL8821CmNwPfHHK+BX3UZfhAU
	grNGXrDhB8XTm8x2p3Iku3vK49RUieAl3Yx3ervSy2pqcazUtjL/Y3uxkfkd1jqZRPGh/MAPE4lFE
	1dyu7enQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHYD-0000000BwBV-1vWZ;
	Tue, 04 Nov 2025 13:58:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHYB-0000000BwAA-1ly9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:58:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1B10401A3;
	Tue,  4 Nov 2025 13:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1C9C4CEF7;
	Tue,  4 Nov 2025 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762264698;
	bh=4K46elwz2t41thzEDIlkodjmZEybmO5RrzNgtf0xipA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTuYizHQP/YaIbgF3vqNbGgvB8bHF6TItco2OMyJ9evUpo+GBr20DxE5Jer8+p4K1
	 Q+hFVJhn3gpVicQ2H0Ofyp6uCJN9ymtHFPPLDjxYfofm6lejPtS8XJgwAO5RL0xfrh
	 9nW/y6m3o1sA+lBbGYZwON+Afz1yEkvdQnsCyZWZFCuBjMh861BJOgw4ddIegP8vWw
	 CDy27YlcgnSzhLSu0KN0TojEMMqpNqXy0n7zprfWIzmZl2LTtr0cVzEatQl7Bl8m/u
	 lzMahpVNdy0kWug9HG1JgJqN1YX431c9LR57rP8r6A6CK5d+uRJpVZCbr+WC/wtS7y
	 aFF7c7dek1JVQ==
Date: Tue, 4 Nov 2025 13:58:13 +0000
From: Will Deacon <will@kernel.org>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: catalin.marinas@arm.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
	rostedt@goodmis.org, leitao@debian.org, mark.rutland@arm.com,
	ardb@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] arm64: use SOFTIRQ_ON_OWN_STACK for enabling softirq
 stack
Message-ID: <aQoGdVYOddu9bxLg@willie-the-truck>
References: <20251013013508.74677-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013013508.74677-1-ryotkkr98@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_055819_477721_E5230C2F 
X-CRM114-Status: GOOD (  16.94  )
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

On Mon, Oct 13, 2025 at 01:35:08AM +0000, Ryo Takakura wrote:
> For those architectures with HAVE_SOFTIRQ_ON_OWN_STACK use
> their dedicated softirq stack when !PREEMPT_RT. This condition
> is ensured by SOFTIRQ_ON_OWN_STACK.
> 
> Let arm64 use SOFTIRQ_ON_OWN_STACK as well to select its
> usage of the stack.
> 
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
> ---
>  arch/arm64/kernel/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
> index c0065a1d77cf..15dedb385b9e 100644
> --- a/arch/arm64/kernel/irq.c
> +++ b/arch/arm64/kernel/irq.c
> @@ -62,7 +62,7 @@ static void __init init_irq_stacks(void)
>  	}
>  }
>  
> -#ifndef CONFIG_PREEMPT_RT
> +#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
>  static void ____do_softirq(struct pt_regs *regs)
>  {
>  	__do_softirq();

Acked-by: Will Deacon <will@kernel.org>

Will

