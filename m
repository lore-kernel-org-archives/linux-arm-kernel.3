Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8B6C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwrcSDLJYLbl5Jh4n+1ghimpKR9oik1IkwH1M42HE/k=; b=w1kUct5N/w6mm3Y8NJyxCe6Ms5
	U2DXXmSHs3gbHZuTN9zi4x0OH+pdeEUUXWKQT78u/EIop46EFGW/FS6673qXehVPOQ22GzZ2O0PMe
	XUlo1xHrmhijy6A3QVuWfw/AA9GWltgj+gEz0W6QeXI0zf1JKfx4jWxLD52px44Za1guk0Wutoakw
	q1dlIHEcVhiS/9gUrBmwKwHDksw0UFQhpw5f33i7H3FJ8RJlYNShacerj0wzs/G3c54vlRXpxlNC8
	92sva4HSDcGzO9PASGCzxQW3Hqs1fVvG17jMVZOk4y6fc44GyCcyox1mfyUZVMNZZBtinLYsUFYGY
	gedhqnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lL-00000008Erm-1PxT;
	Tue, 10 Jun 2025 22:48:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2kN-00000007cm9-0JFD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 17:26:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1563E14BF;
	Tue, 10 Jun 2025 10:26:31 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93DD33F66E;
	Tue, 10 Jun 2025 10:26:49 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:26:47 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v3 01/13] arm64: debug: clean up single_step_handler logic
Message-ID: <aEhq16R76KVTJPd2@J2N7QTR9R3>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-2-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609173413.132168-2-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_102651_153590_B9137A93 
X-CRM114-Status: GOOD (  19.57  )
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

On Mon, Jun 09, 2025 at 06:34:01PM +0100, Ada Couprie Diaz wrote:
> Remove the unnecessary boolean which always checks if the handler was found
> and return early instead.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Nice cleanup!

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/kernel/debug-monitors.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 58f047de3e1c..676fa0231935 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -241,8 +241,6 @@ static void send_user_sigtrap(int si_code)
>  static int single_step_handler(unsigned long unused, unsigned long esr,
>  			       struct pt_regs *regs)
>  {
> -	bool handler_found = false;
> -
>  	/*
>  	 * If we are stepping a pending breakpoint, call the hw_breakpoint
>  	 * handler first.
> @@ -250,10 +248,10 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
>  	if (!reinstall_suspended_bps(regs))
>  		return 0;
>  
> -	if (!handler_found && call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
> -		handler_found = true;
> +	if (call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
> +		return 0;
>  
> -	if (!handler_found && user_mode(regs)) {
> +	if (user_mode(regs)) {
>  		send_user_sigtrap(TRAP_TRACE);
>  
>  		/*
> @@ -263,7 +261,7 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
>  		 * to the active-not-pending state).
>  		 */
>  		user_rewind_single_step(current);
> -	} else if (!handler_found) {
> +	} else {
>  		pr_warn("Unexpected kernel single-step exception at EL1\n");
>  		/*
>  		 * Re-enable stepping since we know that we will be
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.43.0
> 

