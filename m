Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972D9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hoy7brc6HSL3uxJpVyWa6/3oljEESpvuQCGa96SefOQ=; b=TANy5e4AV/v+DsbzY2dlihiR29
	4ACCNAD76bx3IQx7R6bxEIHftFEg/irfb8o5JSUgtfJoCg++xR2E0Tl2l3sDduTs7ZunzXAVOHave
	X0NGOXZPzxFdvqMOkT/72Z2ES0Q9dnUdKh+clDtEP3j4Qi6yV5/w+cHbJgMFMMoQblHxGrZ+AlQbZ
	UnDtZqlkhkSG/G//Tth5uVqEV/z321At4PZByYZu6IDGKiMXr5iyu97Kl5ZsAIHh/iDCnQqAQgT3z
	qWV/yqnNebKUo+UTL77kI+KTgmMhkeWeAWxwrZecZsg4cj0KKoqAaSHggWdfbtcxGTPXijc0AcR3l
	L5MAV31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOy0U-00000006lAT-0agl;
	Tue, 10 Jun 2025 12:23:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxOY-00000006gKv-1Z11
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:44:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DE7914BF;
	Tue, 10 Jun 2025 04:43:38 -0700 (PDT)
Received: from [10.163.32.103] (unknown [10.163.32.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E87A3F59E;
	Tue, 10 Jun 2025 04:43:54 -0700 (PDT)
Message-ID: <47adbf80-d8b9-403c-a382-65c5795d6fa9@arm.com>
Date: Tue, 10 Jun 2025 17:13:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] arm64: debug: clean up single_step_handler logic
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-2-ada.coupriediaz@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609173413.132168-2-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_044358_461446_75DE48E2 
X-CRM114-Status: GOOD (  17.80  )
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

On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
> Remove the unnecessary boolean which always checks if the handler was found
> and return early instead.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
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

Existing semantics here is preserved.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

