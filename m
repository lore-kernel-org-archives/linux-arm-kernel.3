Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F80CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL1uuOPpI7eBL7XVs4zv2zhkmWbyM2pjpkA6d6PjBZ4=; b=T3RRoOFgpGOCzqRk/9fmsRWq/0
	JsS5A1y535FHw1vJOS51fKlNL0OvZ89LA1YxnKl6OYGlAxN/n0VaU3f5MO4NEI3wi62zZk1ZSW6ur
	OtotYCPQtr2fx0f6t7QwSC+eHmwaq8yhroRD8FzviCrUw7zG+oek2d/5JyssGo3XbqJz5Nnp2cSd6
	P4PgvB6l3FHgSvWssYYRl4VF49Pl0CUy5CyIPsv0XIjqcBf33lyYQZvRrTj5RO186RECHH6lLNqwW
	In7cvB+/UvWY1NidgOIO21eZ7ejlh3FCsDd3zXZQn99gaMgEeV47JWkIyDeFxg7p7KAzN2P1Qz57g
	EnlxKkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIry-0000000C4A6-3mfg;
	Tue, 04 Nov 2025 15:22:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIrv-0000000C44y-3EAc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:22:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED911404E3;
	Tue,  4 Nov 2025 15:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CE4C19421;
	Tue,  4 Nov 2025 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762269766;
	bh=d0RcTZtusjmZh8x9Y9sQsCJSTNql9FIVu95tdoEGIQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbfprc8Ed+l+CBca2OYr3J9kLAZmLf3ThMnJEhyggNtjFxUlZlwKJp7/LSOCREMmQ
	 hI+SrNb7pNal1Xaz3aa3caeH0pqft31YnAb5f7bi+NlH9ViVpr3/m0NdaT0HcDgpL1
	 p+rC7ZUyYb/18R32IZnfDmEPkLDsvQxWxqZpzk6K+lKn8LN5/NlhtlaSiKCDyWe0ko
	 f0Vf/EdH7dF3ad/iiYFupDogWIOTkQQzf6alA7jMIfSIEA7mUyE3E8N5gcZ+qhcuCl
	 FCtR6mI7/qc3FdSbrrnMSrhD/njs+GcP9Ifetwu07DmzuEuIZXc6fM2n+7kcBVH/x1
	 NCnk0iTfiKcgg==
Date: Tue, 4 Nov 2025 15:22:42 +0000
From: Will Deacon <will@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: entry: Clean out some indirection
Message-ID: <aQoaQlR-AAuCEAO5@willie-the-truck>
References: <20251014-arm64-skip-indirection-v1-1-f8ccfd9dbcb7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-arm64-skip-indirection-v1-1-f8ccfd9dbcb7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072247_839361_17E6A8A3 
X-CRM114-Status: GOOD (  21.74  )
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

On Tue, Oct 14, 2025 at 09:08:30PM +0200, Linus Walleij wrote:
> The conversion to generic IRQ entry left some functions
> in the EL1 (kernel) IRQ entry path very shallow, so drop
> the __inner_functions() where appropriate, saving some
> time and stack.
> 
> This is not a fix but an optimization.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm64/kernel/entry-common.c | 22 +++-------------------
>  1 file changed, 3 insertions(+), 19 deletions(-)

I think the code was originally structured to follow the same flow as
the generic code so that the two could be easily compared. Now that
we're moving over to the generic code, I agree that it makes sense to
clean things up.

> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index f546a914f04174e37bf3578490545edebb66afd1..e34dfd93c522ae58a5f1c914fe4a5bfc6522cdae 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -38,16 +38,11 @@
>   * This is intended to match the logic in irqentry_enter(), handling the kernel
>   * mode transitions only.

nit: this comment ^^^ (the reference to irqentry_enter()) also seems to
be out of date now.

>   */
> -static __always_inline irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
> -{
> -	return irqentry_enter(regs);
> -}
> -
>  static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>  {
>  	irqentry_state_t state;
>  
> -	state = __enter_from_kernel_mode(regs);
> +	state = irqentry_enter(regs);
>  	mte_check_tfsr_entry();
>  	mte_disable_tco_entry(current);
>  
> @@ -62,17 +57,11 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>   * This is intended to match the logic in irqentry_exit(), handling the kernel
>   * mode transitions only, and with preemption handled elsewhere.
>   */

Similarly for this one ^^^.

Will

