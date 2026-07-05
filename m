Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BA2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 20:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9NTi9C2RBjYtOfgOCY0ugvBRf+G48O3KUNLGnuN+E8=; b=tjFAjEU+iTJGmOPDwi2z26Limr
	mdy9OUrcyz7GoYnP4pYG872QIawVb4Sz143XmR5R8CiqXO3NtdkAEUDv5QISL6rA6K+XwEd1jdZen
	f4h33NHYUUg8AVjwWHRNYR+YwpyQu5IUWpJEPD5Y6S8+tz04YGeW7Rn4wdJrGiVXh2FJb5rjVuK8B
	NCXMD0scyBKbttlCJhpPsFWBb7GHbvNaW6GDaRoJ1WyRCmVq3Ct3KzyG9lRM4WbXKjkTBod5kHr29
	4MPB0L6VjJzPdEpXL0aLZZwHI8gYAMo2n4+3xN4k/7/ViO48VLgxRfBvGG57k7TXgSOVYxxirvyRK
	ZnzS2F+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTNh-00000009hHj-2vGb;
	Sun, 05 Jul 2026 20:24:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTNg-00000009hHO-1t99
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 20:24:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C87160018;
	Sun,  5 Jul 2026 20:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839EA1F000E9;
	Sun,  5 Jul 2026 20:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783283039;
	bh=G9NTi9C2RBjYtOfgOCY0ugvBRf+G48O3KUNLGnuN+E8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YlOcVFnfhkPwgN/y4FUNIckKpvHJmY6lCcSYvUzpOO44HOBXc38zVWSaK+TewrTMi
	 czIvtQfpeEav65qbUJD/dLrw2lub1UR5b/p8dd8VYJJDCYzlUbu0g7w36eCPq03k+T
	 ya8xEO69XujGlZlAVeWvuRozXE2bHHblCziJAUPAMrmT2m6Q1Ep6a5TjhAjPnEwFr+
	 kFl1InnS3RsngVOPsh6LofpBRVtB5QzcfI4I5aJxYqacBkAIWV2rCZYWPveEJwGprk
	 FiWnqik5XCHee6Hiep3vbVo5p1HTkaH4jDCXG4ajBcdECO/HIFmCeRf6DIJA+1KK8K
	 B1GiyWKhARJbg==
From: Thomas Gleixner <tglx@kernel.org>
To: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Carlos O'Donell <carlos@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>, Rich
 Felker <dalias@aerifal.cx>, Torvald Riegel <triegel@redhat.com>, Darren
 Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>, Davidlohr
 Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>, Uros Bizjak
 <ubizjak@gmail.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, "Liam R.
 Howlett" <liam@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, LKML
 <linux-kernel@vger.kernel.org>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>
Subject: Re: [PATCH v4 0/5] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
In-Reply-To: <20260705-tonyk-robust_arm-v4-0-e0fd0fa259d3@igalia.com>
References: <20260705-tonyk-robust_arm-v4-0-e0fd0fa259d3@igalia.com>
Date: Sun, 05 Jul 2026 22:23:55 +0200
Message-ID: <87qzlhjick.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, Jul 05 2026 at 14:56, Andr=C3=A9 Almeida wrote:
> As explained in the Testing section above, we developed a test that puts
> breakpoints in the code to test if a user code being interrupted really c=
lears
> the op_pending pointer. This test wasn't initially working because of thi=
s check
> at futex_fixup_robust_unlock():
>
>         /*
>          * Avoid dereferencing current->mm if not returning from interrup=
t.
>          * current->rseq.event is going to be used subsequently, so bring=
ing the
>          * cache line in is not a big deal.
>          */
>         if (!current->rseq.event.user_irq)
> 		return;
>
> rseq.event.user_irq was always false during my tests, and it prevents the=
 fixup
> to happen. I figured out that arm64_syscall_enter_from_user_mode() was the
> issue because it doesn't set user_irq to true when the task comes from a
> syscall.

I have no idea what you are babbling about.

A syscall enter never sets user_irq to true. It's only set to true when
an interrupt/exception entry comes from user space, i.e. via

    irqentry_enter_from_user_mode()
        rseq_note_user_irq_entry()

No?

Thanks,

        tglx


