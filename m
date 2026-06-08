Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8AECD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owPp2WTGol85f4Xo6sbmSK2j2EOjrf4lzpS/gogNVkA=; b=A8a3Gl4sakptVDoOxUpFs5A+XW
	73GvuvQ2HotXljOR37BWStHxguxOAiAfkMefIXMiGWUUZ0VlwgJfc/o0ZJv5QDsYYguIkvcaE60tk
	uAvBK+9tvQ2kL8pVIqeE08GcC5VlqS6pp7aQnezvs2GxqyF5DQNPNH3ir3BScG9RtFjJLS53O715b
	Xj6fQDYbeHQCuveqP0Vjag++i8YZIdiFyZ4Px9K+O4lt/N2yq/eG12EAWJ4SOV7pzV4eNcTSXkdS/
	2fcdgAOttZ+gBmQIPjI8+6ckAyNnKsXPwnzMYvGMHPbM8Qy+ystpB8lYuonFkz6U+/2Ua4hWz+FzE
	CBygJiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVgK-00000003759-3udi;
	Mon, 08 Jun 2026 08:50:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVgJ-00000003751-32To
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:50:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3024C601F8
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 08:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2A41F00893
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 08:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780908602;
	bh=owPp2WTGol85f4Xo6sbmSK2j2EOjrf4lzpS/gogNVkA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Mk+r112R6sszN5YTqTH3Ugpd9RebRKAb9jFZLY/zk2+IYDRoGs5z40dS/YOOIcCBe
	 V1+KgJQO3cMLKL7L68oGNgIqUuLbEhY9/vbpBzJ6/j1v+Zarl51y/vyyoXXFvEKIrH
	 DsYoKpnf35Y0c2gR2l0XJou1SPoolLFXIX/QC8cCQgp4KYq1X2+c+Z1d3a7lR1ZeBz
	 yoty67iwkec7m8yuhgs/1uo0b2ThCbpHfMJE9NDVQheFwEqYOWrRl7pzDvKLOJ3Sar
	 lt1ET6ATb6vHfYBcnQaXcH2C6/M5j7hzH81Fygev1FaM1PXNENrLjF/oPW5pgXIfPA
	 wGOnFgDdie07A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3965eab14cfso29964211fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 01:50:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YzlgVIAdztit3HB1y+RUNRNB56up8+xnzmXOKZq2Z59hLb67qai
	pX0sqPb6oARQcIm4BqAmyjeZ4JZncSyXqLaXmJKfzUBzRObJEO8AlwPfjUAVahjCb+qOECfdQmS
	GGoyM/1n0kn6bq1wpYWiaWw0pQWMq/eI=
X-Received: by 2002:a05:651c:2128:b0:396:73ed:695d with SMTP id
 38308e7fff4ca-396d0836ea3mr43576871fa.11.1780908601609; Mon, 08 Jun 2026
 01:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260510052107.555825-1-enelsonmoore@gmail.com>
In-Reply-To: <20260510052107.555825-1-enelsonmoore@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:49:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLmUW4KjxEjwv7_an_dEMTSOtvG=q2MjhqKvnuGrWaaCsQ@mail.gmail.com>
X-Gm-Features: AVVi8Cey8G22PfktZkGwHwtR7mCZO1YUzasXgiZ-WMqXRZAcQy-0NUYhP4onn0k
Message-ID: <CAD++jLmUW4KjxEjwv7_an_dEMTSOtvG=q2MjhqKvnuGrWaaCsQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: footbridge: convert to sparse IRQs
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-serial@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Weissschuh <thomas.weissschuh@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, May 10, 2026 at 7:21=E2=80=AFAM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:

> To improve future maintainability, change the interrupt handling for
> mach-footbridge to use sparse IRQs.
>
> Since the number of possible interrupts is already fixed and relatively
> small, just make it use all legacy interrupts preallocated using the
> .nr_irqs field in the machine descriptor, rather than actually
> allocating domains on the fly.
>
> Many files had to be adjusted to include <mach/irqs.h>
> explicitly because it is no longer implicitly included with sparse
> IRQs.
>
> Description adapted from commit c78a41fc04f0 ("ARM: s3c24xx: convert
> to sparse-irq").
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Have you tested this on real hardware?
The commit doesn't really say.

I might have to dig out my NetWinder to test this.

Yours,
Linus Walleij

