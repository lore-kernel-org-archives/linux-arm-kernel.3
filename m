Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FB3CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuRa0FZNAF+LQNxICcjqIHA3nmFpUGKF/G5tHKqkWpw=; b=fPVbCsYFvhckKCc/hVOrqPhJ0N
	81R9zxmxWhgV1oYmuEQLJD7ojslBPB6EKt2Sth9Zdd7ky2O0ctSJKxLUxmyGeJ8PpMN7slEx4KWNh
	7/8pboENKCE+OjFYZ+NhrI20hZpTujmbs0WOFX/hB6LdSFQROLrg1G0xHKY/KqBIONgbOiRcwfoUz
	/xML8tpmUteVeTck3J8sm0COIp67cTKEKAqscUhSwj6itSMqol9fdNH1QzAXyX6KmdOdT+FR+dir/
	lkZxguR2ewcFwbpL4kbjHWLc0VB0tjAF4fKglvyY7Sy9a1OHTPOmofQag7mHwRBXVqTtIfakcbBW6
	9JP8rM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFV0-0000000AV7X-3b5W;
	Mon, 12 Oct 2026 12:51:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFUy-0000000AV75-3dEc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 12:51:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78BD6152B;
	Mon, 12 Oct 2026 05:51:20 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA74B3F66F;
	Mon, 12 Oct 2026 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791809483; bh=sdQiRsgwCGg73aGmtuJiJQm0mp8UEzwCHU64FdmNsrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHlJTX9SpAwdkqXF7VFujHNgmZa8ZpElZK6aRKRQuqI5njdz7fJhjvYE1AuYRROfh
	 NLaD8lw9Ss9rlPPKn0g2dCUP4nh6kylIPzmoKZ1mk0o6GNC79TvdVXc0OU7yLVQhG6
	 +PASkHPm1Mc1zZ0VI5xavRv76VvgwjCcdeNylC8M=
Date: Mon, 12 Oct 2026 13:51:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64/mm: Route faults taken by EFI runtime firmware to
 no_context
Message-ID: <aszXyPjGB8zIWKQT@arm.com>
References: <20261009143438.330265-2-ardb+git@google.com>
 <cad3ed39-407e-49db-91f5-cd36f052ced0@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cad3ed39-407e-49db-91f5-cd36f052ced0@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_055124_950981_29F5EE8C 
X-CRM114-Status: GOOD (  17.13  )
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

On Mon, Oct 12, 2026 at 10:36:41AM +0200, Ard Biesheuvel wrote:
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index 0b52557652be..db308fe01c4f 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -40,6 +40,7 @@
> >  #include <asm/kprobes.h>
> >  #include <asm/mte.h>
> >  #include <asm/processor.h>
> > +#include <asm/stacktrace.h>
> >  #include <asm/sysreg.h>
> >  #include <asm/system_misc.h>
> >  #include <asm/tlbflush.h>
> > @@ -621,6 +622,17 @@ static int __kprobes do_page_fault(unsigned long 
> > far, unsigned long esr,
> >  	if (faulthandler_disabled() || !mm)
> >  		goto no_context;
> > 
> > +	/*
> > +	 * Faults taken by EFI runtime services firmware are never resolved by
> > +	 * the mm (efi_mm has no VMAs), and must reach __do_kernel_fault() so
> > +	 * that efi_runtime_fixup_exception() can recover from them. When EFI
> > +	 * runtime services are invoked from a preemptible kthread, neither of
> > +	 * the conditions above applies, so check for this explicitly.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_EFI) && !user_mode(regs) &&
> > +	    is_ttbr0_addr(regs->pc) && current_in_efi())
> > +		goto no_context;
> > +
> 
> Looking at this again, I wonder if we should just add a comparison with
> &efi_mm to the preceding if() condition.

I think mm_is_efi() check in the previous block is simpler. I couldn't
find any case where this wouldn't cover the more extensive check above
(or the other way around).

-- 
Catalin

