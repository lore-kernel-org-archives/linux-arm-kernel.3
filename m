Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD262CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQRY9Or8sg/fb5DJ7638erwZoUg0oZEnawjGh0xLpBY=; b=C2l3Z/n18WueZlAl1SYRL5TsNR
	8axzknZ0Vq/YIuzNfj5vFCmMLSqEDfBitGzE/UbKqdXW9rSatVCoOXZGyWF5l0i4yE0P0GkO7m14S
	8GDWhb28a827aBdrv4L45+MUPb0XOfPWQJ1TKcFIIDzHFY52dqOJ8m8F5SS3Yb3yoHNlAz72+8MXS
	ZJFNr8a6NI37o4Mi2Nl6q2s/Y8tsAGDCujP9u+KzsfxZpu7OU+HZdlY4+5FXjNogmYrwTxC5YERcK
	tWFq2guJuhVP+RtcxyLxmYwefKRR2OQ8Ie1eQTJvfvTAbTpMO9/ORPxn/Y7wEaPAaWfWCdQgXj6+x
	VeNB+coA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvs6q-00000004mJN-46K3;
	Tue, 09 Sep 2025 06:45:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdvn-00000000TuV-3mgV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 08 Sep 2025 15:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YQRY9Or8sg/fb5DJ7638erwZoUg0oZEnawjGh0xLpBY=; b=Zz4yu4XEP9xU7puhAVA41dsaCf
	N4fj6wnOi3T9rIih+Vvnyfi37YZa8oq7qxbM4cjIUZ6hhIz4+6a2ws9dn2I1w8lUikeP6g+06gfLr
	nivqroXMdazYKeLGVrtYlYzfrx2xJi2V8Rx+vRI/tCIL7OVi9yOaA3xPDUKNVMz3kdzwRGNdDL5OU
	/U8s3BW43XE2KHFbAQ6MMs53vYHTnIPg8MNBmbbpVmSRZ8n5Kf7tpyvqe/x85OFxEZu6bVi2+bkab
	eO6EQiyqhxSUoD+e0aGX2cE3D3ysz/4Com0yXSaMRQs7BuV4WYPKXP+fIROHlyrXELv3KYRGvUrWC
	+ukROBIw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdvm-00000008xgT-23SJ;
	Mon, 08 Sep 2025 15:37:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B6AF5300230; Mon, 08 Sep 2025 17:37:20 +0200 (CEST)
Date: Mon, 8 Sep 2025 17:37:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 5/7] arm64/efi: Use a semaphore to protect the EFI
 stack and FP/SIMD state
Message-ID: <20250908153720.GF4067720@noisy.programming.kicks-ass.net>
References: <20250905133035.275517-9-ardb+git@google.com>
 <20250905133035.275517-14-ardb+git@google.com>
 <20250905134409.GD4067720@noisy.programming.kicks-ass.net>
 <CAMj1kXE49HFQHYJ=bgz2hPoa7ZocqbeL+pWGtpxxBU2g6_7+SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXE49HFQHYJ=bgz2hPoa7ZocqbeL+pWGtpxxBU2g6_7+SA@mail.gmail.com>
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

On Fri, Sep 05, 2025 at 03:54:55PM +0200, Ard Biesheuvel wrote:
> On Fri, 5 Sept 2025 at 15:44, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Fri, Sep 05, 2025 at 03:30:41PM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Replace the spinlock in the arm64 glue code with a semaphore, so that
> > > the CPU can preempted while running the EFI runtime service.
> >
> > Gotta ask, why a semaphore and not a mutex?
> 
> Because mutex_trylock() is not permitted in interrupt context.

Ah, true. Might make for a good comment near there.

