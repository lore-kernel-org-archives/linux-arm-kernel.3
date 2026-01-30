Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDB6D49C92
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 10:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMfmaKUDE9IODZF5Z4UN3v01OaH8ehzRVNFaDMBFc5Y=; b=xExI5hrsknfUio+ScgBbYVog0n
	pX44rVSaUUGRfokfLAna4ujxm2R7c13uRYZVgTokFhXS6Buu+H148EimsbPFuZPWsC9uAMO4h82Bl
	9aTXHJPgoZ0AEShrAkyiyhOTbkP+SdB662rBk7IasF/bLnjCR/wep3iQS3NtInoVpGGrYK03yMvfR
	PIM09CKwnN95h3Xu0xwkTfGx9VIGyXfrkUaNbxetxGGfZ+ZobrC9sVeY6b2DxX2bW4sJrrJB0v15V
	3p1FFJec7qBZEzgV4I7xiZuzltiJdCm7Y37wH9R4GdqH7hY/d55jPjHahSIxDtwYIBqy30dvEOjNC
	pXRHd6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllZ5-00000001JGO-2nMh;
	Fri, 30 Jan 2026 10:17:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllZ4-00000001JFx-0bIy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 10:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14ECB60126
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 10:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C149BC116D0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769768240;
	bh=WMfmaKUDE9IODZF5Z4UN3v01OaH8ehzRVNFaDMBFc5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e+CKW6cWM+z22RPe7Rjs2QRyCOR323239Chqk+y8lE1u7pbtsjXP4jCi7MHq6Wby3
	 saa1SUBskSouUNpYMjm2yzCHQdspgLTdsqnj6feqHybbb5q4m5VGef7mTHz1canzuO
	 j4GyFPv1+hbE7X7LXZK2MukjiafbYru8HkUyNcN0oyP3277n5FB/da2GD0MZDznLmR
	 brCtOzMh5tBZdoEuJnJ+87QB/nGNEbKjaMchC7VT2NFSmuDDzDjKPjQ0TzqWVJ5e5B
	 TZoyLWxjO8HUUANg+qBHLqB2GD92nHdoUmRIoZ8bzlnDBCl9DQNWxuQ+5SKRwLPBZ9
	 fK+2yNa9rb0Eg==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64942ebf1a3so1892412d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 02:17:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjP1+1k7+KoPyIktlzJVW8h/XvjJl5awTk11DeOKJsIP4SognNkzYmeZc/GbfAHGOxdrgxpbzrXS4EUwuKbkW5@lists.infradead.org
X-Gm-Message-State: AOJu0YxE+b+Lni4gkO8aqOpl44lbyswb45vOdwljhvIAvP8jd15eKK+R
	QY+D1eR+TusAnONKefU3JB4U9Z8o4Ui5VwqL87N0nKRnxzhZ6l8MFMS3WScw45+jXvvzuEGMbYE
	56Fst19Oh6y8xN253iKsCasFpATF0eG4=
X-Received: by 2002:a53:ac99:0:b0:648:f57b:d07d with SMTP id
 956f58d0204a3-649a83a6afdmr1992000d50.7.1769768240111; Fri, 30 Jan 2026
 02:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com> <2936803.ElGaqSPkdT@grey>
 <9325c1b8-40f8-4403-8098-b924124e3868@app.fastmail.com>
In-Reply-To: <9325c1b8-40f8-4403-8098-b924124e3868@app.fastmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 30 Jan 2026 11:17:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLnteXd5HrmesZSu1=hG_yDbrnC=hUTSt6d2CJJQbX6jzA@mail.gmail.com>
X-Gm-Features: AZwV_Qghme4sRA-K6OnA3bYigH8jv2YPh2f3vsfRoMEH1yKjUwTsdWQ8ySUYdv4
Message-ID: <CAD++jLnteXd5HrmesZSu1=hG_yDbrnC=hUTSt6d2CJJQbX6jzA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
To: Arnd Bergmann <arnd@arndb.de>
Cc: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	Jun Nie <jun.nie@linaro.org>
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

[Sorry for missing this discussion on 0/7 and posting on 1/7 instead]

On Fri, Jan 30, 2026 at 9:59=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Thu, Jan 29, 2026, at 20:38, Stefan D=C3=B6singer wrote:

> > The ZTE 3.4 kernel code suggests that there is/was a zx297520v2 that wa=
s
> > Cortex A9 based, and then ZTE replaced the Cortex-A9 with a Cortex-A53 =
and
> > left the rest of the system unchanged.
> >
> > A later version of this SoC, zx298501 switched to 64 bit, including ker=
nel +
> > userland. But I don't have any hardware based on either of them.
>
> Right, it's quite possible that v3 was a node shrink and Cortex-A9
> was not available for the new process.

Would it be possible that the DRAM IP on the next version could not
even deal with such a small memory (64MB) making the in-between
SoC a desireable choice?

> >> Support for 64-bit cores is actually quite rudimentary in 32-bit
> >> more, as we are missing a lot of the errata workarounds and ARMv8
> >> specific features in the kernel. If you can figure out how to
> >> use 64-bit kernel mode, that would be ideal.
> >
> > One of my co-hackers is giving it another try. Pairing a 64 bit kernel =
with 32
> > bit userspace seems reasonable. Of course the other question is what qu=
irks
> > are hiding in the hardware when we run them in a mode the vendor never =
tested.
>
> Right, that is clearly a risk. I see that we do support FPU-less
> systems, e.g. 82e0191a1aa1 ("arm64: Support systems without
> FP/ASIMD"), but I doubt that this code path is well tested.

I'm checking with Suzuki to see if he has tested that recently.

Yours,
Linus Walleij

