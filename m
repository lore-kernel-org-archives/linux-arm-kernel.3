Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEA6C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 18:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSKGQI/MSmTLxk8ufImtrmLH+e451ft7wRN6LR0LAss=; b=0lybFkOK2EZoWrOkWWZSHrkpN+
	Lm4gNIDwNMfSkOJwULkreXIVvqxvkzEmE7cCL7I/FvzlvJzLas4nxnHhmOR+86S7pti0n1vzLWDI3
	gc+qyyNd27tykWF38eL8lbS3kI50+Fi/00dezaW5aUjVxJByxbz1DNhhjfAHmAZXNTp7iFwxJ08xP
	9jPsm/I4PRZ7vKAkEyt9YMLlKySU4sm7+sqjDCMvuySl0we+epEqPiKk+Ce2Dz+8fylaBrEElcU0D
	VDPGUXj1Wg6T2fycNefjPYmzR1esginEmAFD2OB1prheLeIcU1QbsdoVvf+ksXLfX7+oAExkvLVN+
	iedQ0UWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxCc-0000000B1vs-3SDB;
	Wed, 18 Jun 2025 18:08:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvFc-0000000AgMC-3RNG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 16:03:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 417CD1424;
	Wed, 18 Jun 2025 09:02:39 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE26A3F66E;
	Wed, 18 Jun 2025 09:02:58 -0700 (PDT)
Date: Wed, 18 Jun 2025 17:02:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v3 09/13] arm64: debug: split single stepping exception
 entry
Message-ID: <aFLjLYIF8U1wFq7U@J2N7QTR9R3.cambridge.arm.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-10-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609173413.132168-10-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_090300_922230_40820705 
X-CRM114-Status: GOOD (  14.79  )
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

This looks good; one comment below.

On Mon, Jun 09, 2025 at 06:34:09PM +0100, Ada Couprie Diaz wrote:
> +void do_softstep(unsigned long esr, struct pt_regs *regs)
>  {
> -	/*
> -	 * If we are stepping a pending breakpoint, call the hw_breakpoint
> -	 * handler first.
> -	 */
> -	if (try_step_suspended_breakpoints(regs))
> -		return 0;
> -
>  	if (call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
> -		return 0;
> +		return;
>  
>  	if (user_mode(regs)) {
>  		send_user_sigtrap(TRAP_TRACE);
> @@ -219,10 +212,8 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
>  		 */
>  		set_regs_spsr_ss(regs);
>  	}
> -
> -	return 0;
>  }
> -NOKPROBE_SYMBOL(single_step_handler);
> +NOKPROBE_SYMBOL(do_softstep);

With the EL0/EL1 entry paths split up, it would be nice to split this
into separate do_el{0,1}_softstep() handlers, like we do for
do_el{0,1}_undef(). With the relevant portions of call_step_hook()
folded in, that'd leave us with:

| void do_el0_softstep(struct pt_regs *regs, unsigned long esr)
| {
| 	if (uprobe_singlestep_handler(regs, esr) == DBG_HOOK_HANDLED)
| 		return;
| 	
| 	send_user_sigtrap(TRAP_TRACE);
| 	/*
| 	 * ptrace will disable single step unless explicitly asked to
| 	 * re-enable it. For other clients, it makes sense to leave it
| 	 * enabled (i.e. rewind the controls to the active-not-pending
| 	 * state).
| 	 */
| 	 user_rewind_single_step(current);
| }
| 
| void do_el1_softstep(struct pt_regs *regs, unsigned long esr)
| {
| 	if (kgdb_singlestep_handler(regs, esr) == DBG_HOOK_HANDLED)
| 		return;
| 	
| 	pr_warn("Unexpected kernel single-step exception at EL1\n");
| 	/*
| 	 * Re-enable stepping since we know that we will be
| 	 * returning to regs.
| 	 */
| 	set_regs_spsr_ss(regs);
| }
| NOKPROBE_SYMBOL(do_el1_softstep):

Doing that would remove some indirection, and make this a bit easier to
follow. That would also permit the EL0 handler to be kprobed (which is
safe since there's no risk of recursion in the EL0 handler).

Mark.

