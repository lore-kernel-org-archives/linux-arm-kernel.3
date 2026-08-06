Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1266CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 20:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAPr7dBMCf8yUzJi59dnnodBINCClaGWigQ3oRl4LAU=; b=2Ub21gFlSf2V1knPvTziYqPDH9
	SVJHrK01v0JZTj9L/YYAv/KHI1PV9WAP1GkSh5/nYNXIfswFIPLjH3aHelQ1rgRCXnHOxFy8LSkiR
	ZsrXNX7kyA/+8pm3V8Nq8lrsdUir5F+/T+/BNwcEUh8CV3XEy+yc/dYExYUm7Bf/fNLdXs2C1+zl7
	gEpxmLqKUXM2iUTUwdd+kF3IicU9hKMzRXdWH8rw6KtnIta+IsDxfQPEZr3wiVbD1cDClcaX02Nim
	DFoTfN8/5ZsVCUpvS1DzdVXHC4Yt6Qnfbqr2r/XeM/OKDMAh7vTMI8JIJQumWGQOAvOwkrkw5w3Ma
	Ws1Ke4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4v2-00000006gNu-2p3b;
	Thu, 06 Aug 2026 20:42:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4v1-00000006gNl-3keZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 20:42:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38A5E600AF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 20:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62F51F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 20:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786048942;
	bh=gAPr7dBMCf8yUzJi59dnnodBINCClaGWigQ3oRl4LAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ThCAtXuBFveNGBgOi4U8LJwTjM9q6jk8MytdRfLKZlElTTQt+SyCiVRetZZ4CtVzj
	 5akf/JfyuZkrh+yYQ8yo0n945k1oPZYZnP9ea8l8mFls4hJ7Zh5mScndjnqfmHmpG0
	 OLCCopE01irRyKb+mlwaMwBU4DzhZjH6p5gP21fNtD4h/xAJupZ3UHSQpVssh48jE2
	 +R231GdFATbO4juLDgb4ilALTOmKegP18NTQZ7USGEYGAv0BTTu9ZSAtKDxTdFTian
	 EpXQXQNUFzMlk3DkB5iDmbOMvURstSa5awD6niFHfqtUkY5cgU22MVRpZhrxR/Uj2u
	 kX94+hCg/o3gA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so2771881e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 13:42:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq0n5hBWkdQ3uOPljG78weGvGiITZz/VbXwnMKKujRwAOKSDBihep9yP+OgV/qlC+T5mYayFc0sDxglctau894K@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt5IHA33Bw/ich6XmYuILS7EE7oRAxHU3sqjQ9/eNh1QZn2zJB
	1bUY5T5iJ5JXsyfmQ8w+V63QEjNXkyvPNWqD6u8D77bVWRW6jyQW09EeaTEOe8BHXgxBx7kvOYO
	wg9t60StuGRvaChk/6N+tT5gMSHp8Vmg=
X-Received: by 2002:a05:6512:2388:b0:5b0:1b0a:2370 with SMTP id
 2adb3069b0e04-5b2f4b960aemr2506954e87.2.1786048941742; Thu, 06 Aug 2026
 13:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-arm-generic-irq-entry-v7-1-v1-1-f25ca7079e3b@kernel.org> <c10eb90f-3da5-48c4-9734-1913ea62bd9d@huawei.com>
In-Reply-To: <c10eb90f-3da5-48c4-9734-1913ea62bd9d@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 22:42:09 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ZiU4K1h7Xo8-eOGcfLEWjsHTQ9xk843T-VFoOCX7BUQ@mail.gmail.com>
X-Gm-Features: AUfX_mw8cHybIofmmWvpUNOCHVFuyexHEc1HC_i-wCbtiWbMWu4jBHqLm_Y5234
Message-ID: <CAD++jL=ZiU4K1h7Xo8-eOGcfLEWjsHTQ9xk843T-VFoOCX7BUQ@mail.gmail.com>
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

Hi Jinjie,

sorry for slow return to this topic :/

On Sat, Jun 27, 2026 at 4:57=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:

> I have a small suggestion regarding the `interrupts_enabled` logic. If
> arm32 could also implement `regs_irqs_disabled(regs)` (similar to what
> arm64 and some other architectures already have), we might be able to
> unify this across subsystems.

Yes, the patch implements this, hehe :)

> Specifically, we could then replace the custom `interrupts_enabled`
> usage in both the arm64 architecture code and drivers like
> `drivers/irqchip/irq-gic-v3.c`.

That should already be possible with this patch.

I could also make a patch to replace all uses of interrupts_enabled()
with regs_irqs_disabled() as a follow-up to this patch (which introduces
regs_irqs_disabled()) if it gets accepted, I don't know if
that's a good idea though, maybe it makes the code harder
to read?

Yours,
Linus Walleij

