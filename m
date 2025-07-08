Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCEFC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zGiOAyEW9aTtfF4W8cqmQT/yUPY4VU0SFyOElo0IZw=; b=atXEhTnM4x0a8w/svZhgHMilfu
	VG8UaYzoKRJfxPU2RneIcbgnXHz8L8lbEGUuT2ir9azfUq/VNsTH0Xi1xntJ5C5r4B2wqp4A1Uoyj
	mbRIvok2bMsnwoChosRIi3OQSKBf7Is+TkmTROWn7LyitKNjPjsm3jEy6UzpwSsHzbZF3o//jSVHr
	KXEFSOMwwIaPLYMeAmC+zpYnbcWYFUm+4HTV2//CVFNbGxhRdCP2Pl3YiooylopZxerRsxSe+6g9P
	WXEIN+DHdUdq0DgDAE6p+aLNGX8+I4gdzf0AsPH0vAwIqgw93xpfE+3LwDHbzn8G+GTmAcGzEl6Hi
	+8ODhlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8Hr-00000005Pmt-14wz;
	Tue, 08 Jul 2025 13:23:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8BJ-00000005Oby-3uYX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:16:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 709F2435AE;
	Tue,  8 Jul 2025 13:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B063CC4CEED;
	Tue,  8 Jul 2025 13:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751980581;
	bh=ZVuGtT3ao2Ck2P52Yl7IlTc1f1jQlD2bbjiW0uGFG2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZlwxyWQrU4D9ttuSdSt+Sc8ZcPHgsF1iOwCTCH7vcSUtRV0HIPaO2Gcy6UilNpeRl
	 sWzJCrcQlwpTM0RonjYNtTlYAwaqsD+pYEny8GbdC2XxIoRaDp5ute8gV7BGAjq1Df
	 2u+vulci9U9x6IbsqfjRoxyRP1Y1mbaTcZkyUwhJRkLXttBCjD5nnfhgBJz3Z6+fsv
	 wPL7IvHYhFGZwI8FF2NRGCJoGXlG7MfkXjcKC7VIMEpVyaxaRaS9Io0SnGJ1tvDO2x
	 Jz7uI3OpFqxmbcDTEyqXOuQiZEh8AGgcuHKOkNsDPD327mOfR7EtTv5wt2Z9PrKI7q
	 QewJ1L5zROtbA==
Date: Tue, 8 Jul 2025 14:16:16 +0100
From: Will Deacon <will@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 17/22] arm64: mm: Add page fault trace points
Message-ID: <aG0aIKzxApp9j7X0@willie-the-truck>
References: <cover.1747649899.git.namcao@linutronix.de>
 <61063f55e2c2df6db69cb63eac9d6653f38fbfbd.1747649899.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61063f55e2c2df6db69cb63eac9d6653f38fbfbd.1747649899.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_061621_992572_8EE429D8 
X-CRM114-Status: GOOD (  18.06  )
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

On Mon, May 19, 2025 at 12:27:35PM +0200, Nam Cao wrote:
> Add page fault trace points, which are useful to implement RV monitor which
> watches page faults.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/mm/fault.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ec0a337891dd..d917556869f9 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -44,6 +44,9 @@
>  #include <asm/tlbflush.h>
>  #include <asm/traps.h>
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/exceptions.h>
> +
>  struct fault_info {
>  	int	(*fn)(unsigned long far, unsigned long esr,
>  		      struct pt_regs *regs);
> @@ -556,6 +559,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  	int si_code;
>  	int pkey = -1;
>  
> +	if (user_mode(regs))
> +		trace_page_fault_user(addr, regs, esr);
> +	else
> +		trace_page_fault_kernel(addr, regs, esr);
> +
>  	if (kprobe_page_fault(regs, esr))
>  		return 0;

As per the discussion with Steve on v6, I still object to relying on the
arch code to call all these different trace helpers (rv, kprobes, perf)
in the right place and consistently with each other.

In:

https://lore.kernel.org/r/20250519120837.794f6738@batman.local.home

Steve suggested wrapping some of this up in a core function to help with
that.

Will

