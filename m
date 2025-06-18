Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD64C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MHrtaWQYxYQbOY1jXBZbhCbwYlDmgnWya6qmbQvgdY=; b=rZM2K4yTRe+a+T9fb5wkuGyjp9
	8pPM/cQB6LHNjbf3dZQXGKVMjBzr7nTAdZHLlrLvuAUIBAKDdy0YDa4hT0BRJdFVYomVsV+yBm0xn
	JVTaNnwan8Xw+UO5I6ZTNMTLPnjGuo76+eICq+/H9NAlBLkpccR9/gkEq6Ad3u/vX4CPzVedOWw0A
	UG4Zq3w86xJyXhOjg2LzBYEHyQ4TaKtWxYvMb2eSkZ7Do5XpL/+4eqK0QXYc18Rgf+Zc68gczlnMS
	GhudJKT/4CiAxVghyiGlfkfxC7skytwf7TLMSyZA2qL78XaE8rK9J1dF4NPdXGWTkqJ0uqzGVYIa9
	8Tm4/zXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvEU-0000000AfbO-0yOC;
	Wed, 18 Jun 2025 16:01:50 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrxe-0000000A8e4-0tiM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:32:15 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553b51f5218so5207740e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750249932; x=1750854732; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MHrtaWQYxYQbOY1jXBZbhCbwYlDmgnWya6qmbQvgdY=;
        b=Xr0tV8//BUtu2iJeVlxFB4lUj26uoyQjpDLfWCJtzSc3ZosVE9jTbVglto1Qr4INzB
         PsO1eyn/JjF1GkZuk/0gjKQ15tWB3jB0yWw3SdGyTCLtVmMWBTm3cbMOTfpqMsM7aMNe
         LjQQWAqcXeqknfyhY0DZKcZ45embgYYt6BncrBrnE85KN6/0VCJaq59aTcx7FlPcc+Q9
         d9akI7zFkMAHZOfX4U6TvxUdr+3PAA9vl7+Vgc1T3/aDWRrsK5Wnb8JovdbB1N9qUN1+
         r1EMV6WFEaPllG7+1XOKVsTqlaD+o6zCJibwgL4/SpwJU4cd0ZhcvB6SYc8p49Qv/myf
         VgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249932; x=1750854732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MHrtaWQYxYQbOY1jXBZbhCbwYlDmgnWya6qmbQvgdY=;
        b=hWYTp37tDHEItOe1cL1EyY5L4XLDMjPwrpznmTj1rDVA+bWu3dvBZY64yXoIihxzd6
         OHeLBBrXlbtWXsN28A2CUPAYgP6ko+iU02jt/dmTO/AHfAzD9nsvyPcSfXxD1BcxgKKG
         z/1aGKvqyxLOD08k9ye6SD4InEkR44yhbWEAvyNF0ZruzKP7NFcn1KPvIoANlje9VCel
         txtePnbiFzrpKiBrPkSvQZlwZojKy0b704YXmMRgHEVu4Lu1+c56vn5lWMkaWOF0Crks
         K2l33+hnJY7SG4y8v7Bp4F4h+gv2F8oZ+NXoD2ESwjgthkL8uKbKlr0WdU4z1OBEAhZ4
         xpTA==
X-Forwarded-Encrypted: i=1; AJvYcCUiqN7BGig+gWjIT76/FFdwvY43XUy4mBZ0A1a2Z6GgybKDqd6WLdvb2vydMFvo6zFDmkkyHEg3ZN6sLhLizb+q@lists.infradead.org
X-Gm-Message-State: AOJu0YyoNt+kjUlCWsKydn2Fc6UjNdHXramz4NmJwiYlVi8scolPAVeV
	YZ7IWhO8A76vyrKRxQuL+EtqvJN3sAnP/KCanoHXesTMUp5B007/pCI5kRTomTW5yTQV/CBuyUD
	LxaFEy7ATG7doPZea708N0WCnrsyJFNKAz09nIkhmrA==
X-Gm-Gg: ASbGncvnXkmW7DWdIKSjJWHHYQdcnmdasLbie8PkuHtiKnHq1lgXP3DDKiszsr0Xp37
	DRGLKik3Jyy0qUuFbCrtKVT9c2WF8PUyCXhZ9zUHZ1jYh6FJFVe8BWq+Nb+JpP0Qs6KLhBjv3gk
	Fswa0b6QF3LFfp5saL9pkxBM4RtSHDSlgjUd+WHbet9v59LRdG07gyGh43KpSKUGDKtsjMXXQth
	Q==
X-Google-Smtp-Source: AGHT+IFAMnM7CSQpA77g/OMbt8IoqXvkUX7g9VLTQkGZp3kx9iir6pjz35t/vnj3pTtA5gMi1QAzjji43YJ6cOMM12U=
X-Received: by 2002:ac2:58f1:0:b0:553:ceed:c859 with SMTP id
 2adb3069b0e04-553ceedca11mr1249211e87.21.1750249931831; Wed, 18 Jun 2025
 05:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com> <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
In-Reply-To: <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 14:32:00 +0200
X-Gm-Features: AX0GCFsVjqlM3hFZShUrbzkpCsjw98BAff7JIDMVgVQXijZgm6doHKA1YxG22Rc
Message-ID: <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_053214_491560_CCB5D5A8 
X-CRM114-Status: GOOD (  25.18  )
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

On Wed, Jun 18, 2025 at 2:21=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Mon, Jun 16, 2025 at 10:05=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > On Fri, Jun 13, 2025 at 12:16=E2=80=AFPM Cl=C3=A9ment Le Goffic
> > <clement.legoffic@foss.st.com> wrote:
> > >
> > > This patch series introduces the Hardware Debug Port (HDP) support fo=
r
> > > STM32MP platforms.
> > >
> > > It includes updates to the mmio gpio driver, the addition of device t=
ree
> > > bindings, the HDP driver, and updates to the device tree files for
> > > STM32MP13, STM32MP15,
> > > and STM32MP25 SoCs.
> > > The series also updates the MAINTAINERS file to include myself as the
> > > maintainer for the STM32 HDP driver and adds the necessary
> > > pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
> > >
> > > Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> > > ---
> >
> > [snip]
> >
> > > ---
> > > Cl=C3=A9ment Le Goffic (9):
> > >       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
> > >       dt-bindings: pinctrl: stm32: Introduce HDP
> > >       pinctrl: stm32: Introduce HDP driver
> > >       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer
> > >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
> > >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
> > >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
> > >       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP p=
inctrl node
> > >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-d=
k2 board
> > >
> >
> > Patches 1-4 and 5-9 can go upstream independently. I suggest taking
> > patch 1/9 through the GPIO tree and providing an immutable tag to
> > Linus to take patches 2-4 through the pinctrl tree. Linus: are you OK
> > with that?
>
> Yes go ahead if you want, an immutable branch based on v6.16-rc1
> is the best for me, then I pull that in.
>
> I could also just apply it and hope for the best... it usually works.
>

I have a rework of gpio-mmio in progress that removes the bgpio
specific fields from struct gpio_chip. This includes moving the flags
into a separate gpio/generic.h header. I really need to either apply
it myself or get an immutable tag from you with this change.

Bartosz

