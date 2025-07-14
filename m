Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1A1C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=io1tVKXnDmOOI4XAw6Cl9XPcaBmlolImRCBWLa00h8I=; b=V9I0wz1nTI4yxyEQ08aSEzInic
	1xgi5oOS//Jf2+zzvS1P3x+cG43qCepyuLCx7um6GNgsPKDKA2V5s4ZkXX8auXMmG43PgAU3XJvxU
	PkzGMiTxXWIeN/Se856gibSiCItB92O5hLa2Qwh2xrR5qQZw/vTnDWiqM+8VdPNU0vhIoZJN9lr8p
	IsNRrD3JW31b68mNXXpYaWn+VebNNrTVvVA2aSLknuWuc/PpoHVNwksav8grwfNpP29NqpSmF2dVr
	syvGMK+VY0BW82+fNVPKY4SNnX+zY205kfQ9b+3j6IKOyj7FDhIbgV9TQWnXv6u6h+dY2gzvLfEp+
	q4zl0tgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGsg-00000001yiA-1A4v;
	Mon, 14 Jul 2025 10:57:58 +0000
Received: from [2001:8b0:10b:1236:d4b0:a112:9c86:6a4b] (helo=casper.infradead.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGqC-00000001yDl-3Nrr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Jul 2025 10:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=io1tVKXnDmOOI4XAw6Cl9XPcaBmlolImRCBWLa00h8I=; b=N4D6me884F1hBjIu5NxRO7FgvY
	iXLtliNvdrcSD8/DIyEzvNJYZBZABGiXogm2TnPRf7I5Y8QOT0/jzkf3/DIh+ST6w7305iOxhodEd
	mgJxBWZRB25kusp+aKjCUeyCmjROcjZG0LCGqPdCUB8+AzV1WkgyqgKUhTKjh1JXjF15Iom/z3g0L
	+9kNFg38iKHO3n4FUXUhs73cKTob67z5QgqWf3YnsUlL12FvR3DTPKzed82xsBEP4mS7POZKUYCUe
	R0T6pylJ8olwL3CKTaoviWWTUhiCMiCgd5yZm45AYEtrcJqWaoWvMRHXZ/6wPnQWdq0YGhZTxADi3
	+CGUYysA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGq9-00000006w5j-0q8W;
	Mon, 14 Jul 2025 10:55:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BE084300186; Mon, 14 Jul 2025 12:55:20 +0200 (CEST)
Date: Mon, 14 Jul 2025 12:55:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [RFC PATCH 7/7] arm64/efi: Call EFI runtime services without
 disabling preemption
Message-ID: <20250714105520.GS905792@noisy.programming.kicks-ass.net>
References: <20250514174339.1834871-9-ardb+git@google.com>
 <20250514174339.1834871-16-ardb+git@google.com>
 <20250711134833.GI905792@noisy.programming.kicks-ass.net>
 <CAMj1kXGEHWMhMgY8ZMiRxKPTeD+oZBReozKwA4udJsrp-j_P_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGEHWMhMgY8ZMiRxKPTeD+oZBReozKwA4udJsrp-j_P_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_035524_870222_D6C25634 
X-CRM114-Status: GOOD (  25.64  )
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

On Mon, Jul 14, 2025 at 12:20:30PM +1000, Ard Biesheuvel wrote:
> On Fri, 11 Jul 2025 at 23:48, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Wed, May 14, 2025 at 07:43:47PM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > The only remaining reason why EFI runtime services are invoked with
> > > preemption disabled is the fact that the mm is swapped out behind the
> > > back of the context switching code.
> > >
> > > The kernel no longer disables preemption in kernel_neon_begin().
> > > Furthermore, the EFI spec is being clarified to explicitly state that
> > > only baseline FP/SIMD is permitted in EFI runtime service
> > > implementations, and so the existing kernel mode NEON context switching
> > > code is sufficient to preserve and restore the execution context of an
> > > in-progress EFI runtime service call.
> > >
> > > Most EFI calls are made from the efi_rts_wq, which is serviced by a
> > > kthread. As kthreads never return to user space, they usually don't have
> > > an mm, and so we can use the existing infrastructure to swap in the
> > > efi_mm while the EFI call is in progress. This is visible to the
> > > scheduler, which will therefore reactivate the selected mm when
> > > switching out the kthread and back in again.
> > >
> > > Given that the EFI spec explicitly permits runtime services to be called
> > > with interrupts enabled, firmware code is already required to tolerate
> > > interruptions. So rather than disable preemption, disable only migration
> > > so that EFI runtime services are less likely to cause scheduling delays.
> > >
> > > Note, though, that the firmware executes at the same privilege level as
> > > the kernel, and is therefore able to disable interrupts altogether.
> >
> > Is the migrate_disable() strictly required, or just paranoia?
> >
> 
> Runtime services might be polling the secure firmware for an async
> completion when they are interrupted, and so I don't think it is
> generally safe to assume that an interrupted EFI runtime service can
> be resumed on another CPU.

Can we please get a comment with that migrate_disable() explaining this?

Thanks!

