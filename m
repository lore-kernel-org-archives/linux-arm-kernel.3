Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E58CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqxngZcLnCJJZO73UwatY/BWjqxabtUBHMYn/4CIPgc=; b=sgBhCfjG4t+esDre2N2kdKnv8E
	K9+RRJ3ilWMkEKUce0TlcHRj6Z1lT/k+lSkWWKCmaFoZGf9YjvAVzZbL4s3asFHIdv6kLg3lSRTyA
	VIcyPGMI+QK/hqPxF/LHfUgE6B2dHlsdoPZvuXC7ITN2WgiDnRQokgyM8D/eEzSWXq+UWguvVMgec
	nMSOo2StSfOPAYhg9Lyc7qQPH+cETSTwEzHhD0egGtw+OzrkfcaWqTrXfk4D09dLXpvP+EGA+SFPV
	DxKF/hpl2bZUjBlwnSOCvbTL9Vh6dX0kSoV6y/6aTcq/aBAVB0MmXPLwendMYYv1/uAyWEaLo3n+5
	HfDT73Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYBV-0000000GHIY-0emW;
	Thu, 27 Nov 2025 09:21:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYBS-0000000GHI8-3fWZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:21:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EB2E1570;
	Thu, 27 Nov 2025 01:20:54 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A25B3F66E;
	Thu, 27 Nov 2025 01:21:00 -0800 (PST)
Date: Thu, 27 Nov 2025 09:20:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: Re: [PATCH] arm64: Remove unreachable break after die
Message-ID: <aSgX-br67x5Y-kBZ@J2N7QTR9R3>
References: <20251126222620.215245-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126222620.215245-1-osama.abdelkader@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012102_985635_EBEFB18A 
X-CRM114-Status: GOOD (  15.39  )
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
Cc: smostafa@google.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Nov 27, 2025 at 12:26:20AM +0200, Osama Abdelkader wrote:
> die() never returns, the break is unreachable in arch/arm64/kernel/traps.c

Is the break causing some problem, e.g. a compiler warning?

If not, then I don't see a reason to remove the break.

There are many other instances of "die(...); break" throughout the
kernel, and this doesn't seem to be speecial.

Mark.

> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  arch/arm64/kernel/traps.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 681939ef5d16..81dd2d7759eb 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -1003,7 +1003,6 @@ int bug_brk_handler(struct pt_regs *regs, unsigned long esr)
>  	switch (report_bug(regs->pc, regs)) {
>  	case BUG_TRAP_TYPE_BUG:
>  		die("Oops - BUG", regs, esr);
> -		break;
>  
>  	case BUG_TRAP_TYPE_WARN:
>  		break;
> -- 
> 2.43.0
> 

