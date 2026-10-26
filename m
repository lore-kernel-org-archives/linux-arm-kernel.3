Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB60F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZvVafAuz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Uz73HNC5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=okdfPAUG/95gVMAQwqPlFeuM9Ab2hbczPB989+Nnh8A=; b=ZvVafAuzfhdutqzKlYmhxJXvN/
	wMn8w6kMoB7cls4tKB6Fh55W4ti9PVI6KobbYC6mMkxWDv7gm+H9kAZfD05SS5n7ihSkgQ9sCrFQO
	8Wngiv0U4rTEDinexRVKH4uXANYDh0xRfKTaLszqcD63RFkLfzJtaaVbxzKCxEeE6UW6WqpWeBmCe
	DT89uJ1MyTQuy0puTCpOyO4DcYzMsww7sCu5n8Jt9ZcV5Pj8P7v3TXbWgduDFAh+idEV6ZRkfwjs/
	IFUI7lOVivud4QX8ZWW6jR2LTLyuu7Xc8i0f7Hk7whGD49t76BzgNXh6ASCtC3JINfk/vyaEr6NZ5
	X//fgfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHre-00000002GD3-30Ms;
	Mon, 26 Oct 2026 10:23:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHrd-00000002GCm-0kOU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 26 Oct 2026 10:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=okdfPAUG/95gVMAQwqPlFeuM9Ab2hbczPB989+Nnh8A=; b=Uz73HNC5lZ1q0U4x7QEx2+B/ZH
	W40bkcZxhehHLm0p1STMmTz7+2PlM/pbZ5yUhLMtmFeCaI12vt4B8FtLbVea9wNshblVvSBGjJBGZ
	/LQPw+P1zZRH4C5aFKd8H+m1ucWRm0HC9yIBPVn5RqfejAvAdHqzazJJZWJvYZcgwOPVQjdYHI4by
	bNXCqQkqRwS8OBzlFX8rihjDC9kr4XEyo1vuT4ulUZ+v47p360aMQzJ6gSPUarTRBYiVFDRQ9Iej8
	M/43SnV17EcrU19Eu+ZSduO3ydX5ocr2qbMdhkj3GQBhk7LerKSmC5sk3bqtYuBQb6o30Nl0CaH1Z
	Qp5C8/Uw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHrZ-0000000Dh8Z-1wMg;
	Mon, 26 Oct 2026 10:23:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AF037300DB9; Mon, 26 Oct 2026 11:23:32 +0100 (CET)
Date: Mon, 26 Oct 2026 11:23:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marc Zyngier <maz@kernel.org>
Cc: zhangqiao22@huawei.com, Zhan Xusheng <zhanxusheng1024@gmail.com>,
	tglx@linutronix.de, jstultz@google.com, sboyd@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [QUESTION] sched/clock: Potential timestamp jump due to
 inter-CPU counter skew?
Message-ID: <20261026102332.GB2668200@noisy.programming.kicks-ass.net>
References: <cf7a043c-384c-0642-204c-8f207eff3d42@huawei.com>
 <20261026082730.2117173-1-zhanxusheng1024@gmail.com>
 <86zew0ygqr.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zew0ygqr.wl-maz@kernel.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 09:05:00AM +0000, Marc Zyngier wrote:
> On Mon, 26 Oct 2026 08:27:30 +0000,
> Zhan Xusheng <zhanxusheng1024@gmail.com> wrote:
> > 
> > On arm64 the system counter is meant to give all PEs a common view of
> > time, and keeping the copies on separate dies in step is the
> > implementation's job.  The kernel has no tolerance for skew.  The counter
> > errata handled in arm_arch_timer.c (Freescale A-008585, HiSilicon
> > 161010101, Cortex-A73 858921, Allwinner A64) are all reads on a single
> > CPU returning a wrong value, worked around by reading twice; none of them
> > is skew between CPUs.
> 
> Indeed. If the implementation cannot give any two arbitrary CPUs
> anywhere in the system the exact same view of the counter, then this
> implementation is broken, and unsupported. No discussion.

The limit is the cross-cpu latency.

CPU-0			CPU-1

			A = clock();
t1 = A;
t2 = clock();

BUG_ON(t2-t1 < 0);


CPUs must never be able to tell time goes backwards. This is not to say
the clocks must be in perfect sync, only up to the point where the error
is smaller than the observation limit.

So effectively, if software can tell the clock is wobbly, you've lost.

