Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D1CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vzF8P90pJwqfmoMEA1Lju0P+zM2C2zQqCrgcHUCsoo=; b=get4W45QCu/62JGKHR9m2HX0Xr
	TvlDAL11fb3uUJG3oCEPlS578daQBqj2g4GpmnuPYxhy+TY0iLKUsqsNuK3yIR1sCkg2ATZ7TvW9g
	nqcS79oeGYcy6fNTV7tb3beamz1PM1a0G136yRYlu4CFqAohO4pBn/QWj0kfTus2f+bYHrqyLN3uA
	6NZPsRRC1F81xjYr8Vw9La5CLcvdfUIiCdBNFInu3GpLehBYVPHJIhMga8ejU9O1Yv71MIAnqEIW8
	glDXqvK0j+brB4LoauN/cHefQ3SyP54tlpMOZm6H9jCPCwoHWZRg/VQcoNzyoVwBQiJFnqETcP7wj
	J6oYlrdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5Xp-00000006idw-3Eb4;
	Thu, 06 Aug 2026 21:22:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5Xo-00000006idn-2t3b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:22:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 372744399F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 21:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1181F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 21:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786051348;
	bh=9vzF8P90pJwqfmoMEA1Lju0P+zM2C2zQqCrgcHUCsoo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UTkVffnqKSg/icWvoUhylyhF2KZnptdVSwItRiPQ7u2G+sqvGi4QZf3Op9HCajhsA
	 KUc0cFJMT+J1W5OWGJwph+pGYEp0m0YivkyMgyEXUvkkY08RueLXercOcpxYTduibb
	 kJVpbvAhS/fVlWsr+ODcM8lsCO4c6O7TcuVIPPuia/etPKWfD70XQxK/rXKZBXe1V9
	 xVgPCUs4+nw8vzEuAh5y6AYFGb7ccQWZBjBRguwz/zIkhAXpkkOa2bDpxVD6Ua1KpH
	 9TUn5lIV5r4pcJTJmRs/gEdAKDFLRLIqcfPpVDUfroCvmcISvXf/BPoT+ITOyjlTaG
	 13iZt7jPZEQ/g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b013084dc2so2462367e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 14:22:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RphKUUefPmmNZLwK1LwPEck8pg2ceYfRKzvoThXXcFeIgyo3r5B2bGvaovM4QY4cSKsNR06TKAjljGvgFur/Kz0@lists.infradead.org
X-Gm-Message-State: AOJu0YxXHeA8c+j6/mYvSpPMyM2hSR2DUXUXnOe1cpop2aDxkNtGADee
	Eht8YMIDduDIEyF/GLv1gErHlL9gk93M5H5LV3TWdLuq2emNiD3NZQDBoba2KqcElbn6DOjskJe
	fn5mVM/i3hOUEQBPtSJG0UUxrn7F14Hs=
X-Received: by 2002:ac2:51c7:0:b0:5ad:58c8:5de8 with SMTP id
 2adb3069b0e04-5b2f4c920dbmr2348971e87.1.1786051346854; Thu, 06 Aug 2026
 14:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-arm-generic-irq-entry-v7-1-v1-1-f25ca7079e3b@kernel.org> <49d4cefa-f733-4c8a-a371-5607d460ade1@huawei.com>
In-Reply-To: <49d4cefa-f733-4c8a-a371-5607d460ade1@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:22:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKzxtW=csmrV=19-_DofVG=aqnM0uiBTWGygTWmeQgvw@mail.gmail.com>
X-Gm-Features: AUfX_mwcnU-RQgatc_wVa6xnaOUPVH7OzC5qQicNmioQM-ZhpAB8rBNifOfEEZE
Message-ID: <CAD++jLnKzxtW=csmrV=19-_DofVG=aqnM0uiBTWGygTWmeQgvw@mail.gmail.com>
Subject: Re: [PATCH] ARM: entry: Convert IRQ handling to generic IRQ entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Oleg Nesterov <oleg@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Sat, Jun 27, 2026 at 5:16=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:

> > +noinstr void arm_irq_handler(struct pt_regs *regs, int mode)
> > +{
> > +     irqentry_state_t state =3D irqentry_enter(regs);
> > +
> > +     /*
> > +      * mode =3D=3D 1 means we came from userspace, and then we
> > +      * should just immediately switch to the irq stack.
> > +      * Then we check of we are on the thread stack. If we are
> > +      * not, then by definition we are already using the irq stack.
> > +      */
> > +     if (mode =3D=3D 1 || on_thread_stack())
> > +             call_on_irq_stack(handle_arm_irq, regs);
>
> It seems that the CONFIG_VMAP_STACK Overflow Protection is missing,

I don't think so, it is checked before this point in the assembly:

+       svc_entry trace=3D0
+       mov     r0, sp                          @ regs
+       mov     r1, #0                          @ from kernel mode
+       bl      arm_irq_handler
(...)

svc_entry checks it.

> should we implement the C version of CONFIG_VMAP_STACK first, before
> moving the IRQ handling to C?"

Not 100% sure what you mean here.

Currently the CONFIG_VMAP_STACK checks are done in
arch/arm/kernel/entry-armv.S, in the svc_entry macro
that is called in every exception entry.

svc_entry in turn calls do_overflow_check from
arch/arm/kernel/entry-header.S that does the actual overflow
check and calls __bad_stack() if we get an overflow.

This looks nice to have in assembly to me, and even
arm64 does this check in assembly?

How do you imagine C doing this without using any stack?

Yours,
Linus Walleij

