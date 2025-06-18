Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB46C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bT1BHoG6/ZADALAEapEO6Cuu7My89lCpBj+IAyzF6MA=; b=e272oZVhCoFGO10XOGqXHChFjs
	/O6WLIzqlkPouMKBbcxzCOyGAp588HkpFcMTcdu+D/BhDne4l9bag1nhV+S2+aqyfqPdlIXTySL4/
	YN5uKwLGeDNIazACV6yPt0JOQ1mXVG4qyn9dBn8GRq/0LvjdEnj6rkPtWKZazrAQlXUSB+KvrzTvP
	5knabFJNHGdrPr55MGKYX8WgLyQeIXScYslFbIRmBSt1skk4f5sTBkycnHfqPCELpwkCqPhlUnDYz
	QmQjw5HuaK+Je/K9aLGp8jtIjuNRxjjlcbV6NboBsdJbeTpZATsJycmfi7pM4Mb0nXGR3rAseNSGW
	/cKvLyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRx3T-0000000AyTf-07uA;
	Wed, 18 Jun 2025 17:58:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRw9I-0000000AnOF-3Lmu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 17:00:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9AC31424;
	Wed, 18 Jun 2025 10:00:11 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56C563F58B;
	Wed, 18 Jun 2025 10:00:31 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:00:28 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v3 11/13] arm64: debug: split brk64 exception entry
Message-ID: <aFLwrDY5Vn1SzLRJ@J2N7QTR9R3.cambridge.arm.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-12-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609173413.132168-12-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_100032_880096_08F8C844 
X-CRM114-Status: GOOD (  10.89  )
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

This generally looks good; 

On Mon, Jun 09, 2025 at 06:34:11PM +0100, Ada Couprie Diaz wrote:
> +static int brk_handler(unsigned long esr, struct pt_regs *regs)
>  {
>  	if (call_break_hook(regs, esr) == DBG_HOOK_HANDLED)
>  		return 0;
> @@ -279,6 +278,14 @@ static int brk_handler(unsigned long unused, unsigned long esr,
>  }
>  NOKPROBE_SYMBOL(brk_handler);
>  
> +void do_brk64(unsigned long esr, struct pt_regs *regs)
> +{
> +	if (brk_handler(esr, regs))
> +		arm64_notify_die("BRK handler", regs, SIGTRAP, TRAP_BRKPT, regs->pc,
> +			esr);
> +}
> +NOKPROBE_SYMBOL(do_brk64);

Could we please split this into separate do_el{0,1}_brk64() helpers?

e.g. rename call_break_hook() to call_el1_break_hook(), remove
brk_handler(), and have:

| void do_el0_brk64(struct pt_regs *regs, unsigned long esr)
| {
|         if (IS_ENABLED(CONFIG_UPROBES) &&
|             esr_brk_comment(esr) == UPROBES_BRK_IMM &&
|             uprobe_brk_handler(regs, esr) == DBG_HOOK_HANDLED)
|                 return;
| 
|         send_user_sigtrap(TRAP_BRKPT);
| }
|
| void do_el1_brk64(unsigned long esr, struct pt_regs *regs)
| {
|         if (call_el1_break_hook(regs, esr) == DBG_HOOK_HANDLED)
|                 return;
| 
|         pr_warn("Unexpected kernel BRK exception at EL1\n");
|         arm64_notify_die("BRK handler", regs, SIGTRAP, TRAP_BRKPT, regs->pc,
|                          esr);
| }
| NOKPROBE_SYMBOL(do_brk64);

... and we could probably simplify the latter to:

| void do_el1_brk64(unsigned long esr, struct pt_regs *regs)
| {
|         if (call_el1_break_hook(regs, esr) == DBG_HOOK_HANDLED)
|                 return;
| 
|	  die("Oops - BRK", regs, esr);
| }
| NOKPROBE_SYMBOL(do_brk64);

... matching do_el1_undef() and do_el1_bti().

Mark.

