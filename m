Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E450CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iI95N45xUlZVhTMjnyMu5qguS//l74sBdQ6FwuCHQXw=; b=a1r9OvJ1FcvhBXqHcIxXvrGp/i
	eD44JHHmla/QI/eisChVdOhQPRDkDQq8u9WCPl5KJQUXNOJ6WPZJWD7OICtP9zFmRdj/W8V8GCkyD
	085VJKKnsxA86Y84H9YFgYF2sPXuoBU5TLEq7nr7t04KupXghAc3agf0pbqF3x5ymZNDWTMRzLMqF
	xfvFBfwiLBfzlF+mGW0l2tBcdUq4zd1/LV/miZl6uh8UxN/tQ3XN7DLe9ZcJ3i/6+tnLdafJxcuPR
	hRX/js+A/I+SU655XZcgQae+x47+7NpNkYC64AYfEahOkQnJizMQ9INJv1XpSynjMKXBBgmEq39A1
	ryl/WegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvpL-0000000A2iK-14F8;
	Mon, 03 Nov 2025 14:46:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvpJ-0000000A2hx-2nRF;
	Mon, 03 Nov 2025 14:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iI95N45xUlZVhTMjnyMu5qguS//l74sBdQ6FwuCHQXw=; b=tcpIk2F7iJsy2Cok39kpG4TNpm
	lKGFJAP9fR4texKlFgtntVEWzbhlmiENIrTA4l+0JifVpJqLmNZfyAXXzOs8FaCh5TGjX0XUTzarD
	8Bot3EmkXkU73yUEzFf/8auMdO142JWOdp6VgE+ueiT+l21xWODyM9U7fixMQ/Zt1hFAeXAgJGlvM
	yc7JRFC4M5dUyOMS2EHvc/py/A352QKchG1ymiHG1p+aVeuaAEdBB7aRZ8j+BXdpJvRIJwtRaNrR/
	ekhG7PmxVehxdQ8KrpsBgKsQGg3mU3AAzOvUzl92pYuLNuhkTO5useVCbiw5bU+POSPXTGYVwLK21
	AblPip2A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvpC-00000009AtY-0Qhs;
	Mon, 03 Nov 2025 14:46:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 40487300220; Mon, 03 Nov 2025 15:46:26 +0100 (CET)
Date: Mon, 3 Nov 2025 15:46:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	David Laight <david.laight.linux@gmail.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
Message-ID: <20251103144626.GX4068168@noisy.programming.kicks-ass.net>
References: <20251027083700.573016505@linutronix.de>
 <20251029102331.GG988547@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029102331.GG988547@noisy.programming.kicks-ass.net>
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

On Wed, Oct 29, 2025 at 11:23:32AM +0100, Peter Zijlstra wrote:
> On Mon, Oct 27, 2025 at 09:43:40AM +0100, Thomas Gleixner wrote:
> > Thomas Gleixner (12):
> >       ARM: uaccess: Implement missing __get_user_asm_dword()
> >       uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
> >       x86/uaccess: Use unsafe wrappers for ASM GOTO
> >       powerpc/uaccess: Use unsafe wrappers for ASM GOTO
> >       riscv/uaccess: Use unsafe wrappers for ASM GOTO
> >       s390/uaccess: Use unsafe wrappers for ASM GOTO
> >       uaccess: Provide scoped user access regions
> >       uaccess: Provide put/get_user_inline()
> >       futex: Convert to get/put_user_inline()
> >       x86/futex: Convert to scoped user access
> >       select: Convert to scoped user access
> 
> Applied to tip/core/rseq along with the first set of rseq patches. The
> core-scoped-uaccess tag should denote just this series.

Due to various build fail, I've re-created the whole branch, including
the tag. Sorry about that.

