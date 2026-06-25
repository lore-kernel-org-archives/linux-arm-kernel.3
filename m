Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF52ECDE00A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 12:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnC19SJIB8IwjPpZjyOW9vAFG81ZtsEUSHRdP82RYv4=; b=WQS4yZNcXFzoSneVUghD0QqvLd
	GPK50KrAAVaY+NMxI8zf78PW9I8bX4z4IsUDQir2cPUJ0BlsNAPkqriKkR5oDOl7wJw/tKXvCdvta
	4wolR8Z2m0Ok8+jy0SzD1eVeFdctNukSk4aMVBlAP7L88OerQ1+/jdIpXa78Lpogf9MJuuIDELPMw
	Q5XM/vivmOdBYdFhAFMkSCAw68Opz8Btb373GFCtLRsmCfHtTdwW4ozuiz/g37lAT7igT4YQsv58l
	MuJXuFdszLJ5j25Cyh4fIvhZJMYZwQJxmNaZqTd2g3LMu5OSEFOpfOFGXXu1iDUD82pdEeLyKX6pb
	/WvNsQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcisd-000000099kN-1WCB;
	Thu, 25 Jun 2026 12:08:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcisa-000000099jg-2IQh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 12:08:25 +0000
Date: Thu, 25 Jun 2026 14:08:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782389301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rnC19SJIB8IwjPpZjyOW9vAFG81ZtsEUSHRdP82RYv4=;
	b=hZWj1sxvXAx2kbIij7hPOANuGEApe9ROSVloikyhvbWue0ENgZXJP0wx9pYQCc7L3CWPL2
	azZsEGY8Kq4xT+YfwPi6Uj7b18Z0+b9F4uy/tjceDqTgKW2Sbj1EtzxEhPDU6N9M+Qan7R
	95Xq89RMt1ksBDn8S0FrBlGRHj1tsbl0G0q0kXlBofs0wzzwZHwx5nT4kK8ee1oj55LMb4
	bZYvX3RfnrjhMJsttIQ8i+4ZGo4GdUGB49YAb6dEEAKTUpU8bmKGKqzVe41cGgKXzmw1ec
	YxKTCLcV9k9wHDF++loCqt5YMfACC48XySlqNiYUtAPuAI2tffl2sz5y2TlJCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782389301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rnC19SJIB8IwjPpZjyOW9vAFG81ZtsEUSHRdP82RYv4=;
	b=NNthX3RLO/2AwrFk7DPc9eyAGWhbPpJ8XQgDtdhk4wHM9jdyiePonsiFcXkG/66zDdTtDk
	sPSHQv6K0tRz8RBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Russell King <linux@armlinux.org.uk>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, clrkwllms@kernel.org,
	rostedt@goodmis.org, linusw@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling
 user mode errors
Message-ID: <20260625120819.K5e1OVeG@linutronix.de>
References: <20260625073522.182503-1-xieyuanbin1@huawei.com>
 <20260625085034.tvyGSmaP@linutronix.de>
 <ajzvcCve4LubjH9J@shell.armlinux.org.uk>
 <20260625093008.e5I4bh-_@linutronix.de>
 <aj0A3SjMhR24e8fP@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aj0A3SjMhR24e8fP@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_050824_729200_07E01E2B 
X-CRM114-Status: GOOD (  13.37  )
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

On 2026-06-25 11:20:13 [+0100], Russell King wrote:
> > is not worth doing it? With this I can my little testcase working.
>=20
> No, it isn't, because if you enable PERF_EVENTS then BKPT breaks.
> hw_breakpoint.c claims this vector.

I see.

=E2=80=A6
> BKPT is a total mess.

Understood.

> > it does cond_local_irq_enable() which enables the interrupts if they
> > were enabled by the "caller", sends the signal (SIGTRAP).
>=20
> I'm happy with that approach as far as interrupts go, but we can't
> change the behaviour for FSR=3D2 again, beyond fixing LinusW's
> commit (which has recently been reported as a regression.)
>=20
> Note that the change which makes this raise a SIGTRAP rather than
> SIGBUS when PERF_EVENTS=3Dy could _also_ be reported as a regression
> that we would have to fix, and making FSR=3D2 raise a SIGTRAP now
> could very well invite that regression to be reported.
>=20
> Essentially, I don't think we can "fix" BKPT to always raise SIGTRAP.
> The BKPT instruction is something the kernel has never _officially_
> supported.

It looked like an easy fix. You explained that it is a bigger mess with
"other features" and so on. Given that and the fact that it was never
supported, I would appreciate just to enable interrupts before the
(SIGBUS) signal is sent.

Sebastian

