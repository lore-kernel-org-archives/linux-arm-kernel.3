Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45A2FD5310
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNGybdHuG/qwA5MuHMN/2SQnSrMaG/RW0SpGA0+CTRQ=; b=3U5nHryfZjKiksJn3wD4CQ384Y
	wuKNm5znwnIGsEISK+Fut4kfcwBLv8oCCp2b6VMoxsiGhXXvfsQAisG44BFO1yD/bNe2i3wqvEKPi
	owLx6Yci1StdUTvw4OuVSgmHTm+ruzqnvuZ4xGYf8bPuG/CNVXLL1mv8woNsJnVlh6blbGEnt5p5Z
	hyixjbTxmOWOqrTfDVuHxBfCGPXEe+vVWfDuO7qO9edMEMRl6t346EsphS6BzvrKIqgsDysLIMyV7
	OtoXHxbNwiDzkD3oxWIWizQx7e29OTRxPbN+fJ2kpdqiHti8X9Wx8PPL8Ia/0IzYwBjR5FRKBBVVk
	B0J3W0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtZq-000000081zY-2un7;
	Fri, 27 Feb 2026 08:52:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtZp-000000081zF-0GmY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:52:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00E84600CB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 08:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA24DC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 08:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772182319;
	bh=zTSwemO+H6Nr+uY/D8bAgA0jDnb+sx/OUa7FaiaxO28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J/+V58Ck448JEtPw58idR/4zMu5EY0acWGrTWdYSViUuO4hlg1mYx+ylSBZPed2uU
	 sL0OtrY7k2rbpLMOEvpEfKxp4kckOGEkYDJIO8W9ibZ72C2FoEbi3cquvzTEFi0Did
	 Rb2jlLHJC+nmPuw7VupDTNQKcvCZIvxU8tFvw3styFXlAPPbvQ9WUQC3fI+og8DhJq
	 TTXsFiG+VABYzV1noWE9vhsAvTTi6dx+GUa90yS5heJ4/TCg4S1aUuKS47AzoYJuY6
	 irqL+paNADe4CxvuTp0rcEs3PLRFjg9aLjiQgn1ryqoMHWQfYk8xdpVVnMK8s1LGNk
	 rpkvLob77lhuA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3870778358aso19829561fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:51:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7ckvXzyYh4lc3/xjz8NAGtD9CgvejyrD9F7CVc21JcUwx+lRxbxuwid+3U16Rp7GgfEVrOwSKYU8AaiG2TBXE@lists.infradead.org
X-Gm-Message-State: AOJu0YyA/e/JWM3v1RHiMsdzZv/6DWCFuRV1yTBE+AEcK/WKUEeGy0pn
	V5slchxkB0HR6FXk6HBFlDkxASUJTCC2udHdDxQ8eKjrA6JgLdKvVZWD0UfRBuOS1TJDKv9PR4D
	ZnljVZyXavxmFrJlBi9CuceKiD27y9OS5BH7IuUKgmg==
X-Received: by 2002:a05:651c:3044:b0:385:c21f:37e1 with SMTP id
 38308e7fff4ca-389ff140698mr9116261fa.15.1772182318289; Fri, 27 Feb 2026
 00:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com>
 <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org> <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
 <10bb25d3-2f46-4b62-affb-31257d51e24f@app.fastmail.com>
In-Reply-To: <10bb25d3-2f46-4b62-affb-31257d51e24f@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Feb 2026 09:51:45 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfupCCr8J+qnJACVeri4nZZCnULWaRgSvi4LWs4J3-5vw@mail.gmail.com>
X-Gm-Features: AaiRm50ByR64ghzpuSyZjUSHgfNc4yR169bV0swOH-eTRwdz8Y8xhwDJget1iyQ
Message-ID: <CAMRc=MfupCCr8J+qnJACVeri4nZZCnULWaRgSvi4LWs4J3-5vw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip platforms
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org, 
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

On Fri, Feb 27, 2026 at 9:49=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Feb 27, 2026, at 09:42, Bartosz Golaszewski wrote:
> > On Thu, Feb 26, 2026 at 3:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> This will surprise all out-of-tree non-defconfig users, because their
> >> boards will stop working (drivers depend on ARCH_LAN969X|ARCH_SPARX5
> >> which will be now disabled), but I like the consistency.
> >>
> >
> > I'm not following, ARCH_SPARX5 remains enabled in defconfig and
> > ARCH_LAN969X was already disabled by default.
>
> Your patch to the in-kernel defconfig is fine, but most users don't
> use that but instead have their own defconfig files which they now
> need to update.
>

Ah ok, I see. Do you want me to do:

config ARCH_SPARX5
    def_bool y if ARCH_MICROCHIP

?

That should fix it, right?

Bart

