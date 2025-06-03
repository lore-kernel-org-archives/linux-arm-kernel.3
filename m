Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDD4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbmMDFKCp/i1Pcn4W1wCNl+zf9IfLbSUc2RL5G0OleY=; b=qvvJnWdHFdBMAw8JAgzRkEHy9m
	oFQsQy2xgtZmYkOLnSjqkWis9rtTi7rEHycJ8mIPkpPYc2P9G8el7TwM0tvywG5zIjs3XHUW5bPfV
	9dQiwBiKYxsvIpfWc1p/cdr4oW8aO/zhFHwrf32kFkEAvwa3fEWEb4k50F5vumvLFUSxTqGSskvFC
	QLKmCa4J68ll6e3GiPvf2UGcxhJ8NJGEh4K1Ie+9jIt3JoVwAdVK+RnJ7iiT7n1c1oVzOfouebm5w
	32NkJxJvv9v4vBMphF7Xj7NOFh0EjZAEFcPPiV7R0Y7wuDe5HTMSSyNLLHr2+cQfZN5lmly4hmXox
	aT76isnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTOm-0000000BG1z-2qs7;
	Tue, 03 Jun 2025 15:17:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTMZ-0000000BFm3-2cPM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 15:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF28D60010
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Jun 2025 15:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D27C4CEEF
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Jun 2025 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748963738;
	bh=uPH1qCx8aCUcLC1E09n43osZKJyp2k4rUVT6oDBr33o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PNs3TQc8gBw66VpmKxlLLhegoo6dmN9CYAQM2k3jiQ4S53yZ3iMlejdnSM/ACJ/Pb
	 HwXILoulHvvKNIO/HQAQtQfbA3qtXHuedh7cYv8aersiEFNHuBSa0QLpHI8odrxnkE
	 TIUBMZcag23heE1Cz2NlLqZOO61IgXh3V9Gbd62e35aji+OywQmP7vAIvKKG2XS8vo
	 zmWAcz9JiShd3fxzYHziMme0uZxPUhwSUjTFL1/XGTDYGBvZoMiQeoU1/xBVMoiBvm
	 dpBSgd9rLJkckFIyHozIsCubTtPLlK5Kn/TpMfuKHRfVpTkY2+Vi5PMGTXorUQcdjx
	 ebrAFA+NSdBLw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad89d8a270fso1409232966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 08:15:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKI9fWR+1shcDbs3ePuRnZWwvnzcUxDI1jONHuZjEfz00SyY59XJth1um9Odt8EXFIYiZi6Rrtxw0Lf3ZVxyfB@lists.infradead.org
X-Gm-Message-State: AOJu0YzPUjw9QdojbmJwFVU4jDhGqeTahw9TqeL3/o6N6ZBmyOosII0r
	exL+s6vMw/RXmHZiN5b+hS7OIXvbcnQz2pFK33omE1phWF8HEnBKPf3U3T2oBnMTDjE6FEfT9oK
	IcN5SPYfQysyTbEzDYSw0ZjbedSyZEg==
X-Google-Smtp-Source: AGHT+IHYuVkgYffZYwIk9zOx4O17w5xiyut7oVsDrPWVULDKwfy14qROoIZLMW73H+Zgzw3g7/yBgH6W/MtlT29QslI=
X-Received: by 2002:a17:907:1c9f:b0:ad5:5a7e:bcd with SMTP id
 a640c23a62f3a-adde5ec8284mr372128066b.8.1748963737020; Tue, 03 Jun 2025
 08:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com> <aD6ouVAXy5qcZtM/@lpieralisi>
In-Reply-To: <aD6ouVAXy5qcZtM/@lpieralisi>
From: Rob Herring <robh@kernel.org>
Date: Tue, 3 Jun 2025 10:15:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
X-Gm-Features: AX0GCFs8qXTII7-x8n1VBPezizNhamXTZTvAiFVag57Gde-h4t-14oUxQ682H78
Message-ID: <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
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

On Tue, Jun 3, 2025 at 2:48=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > On Thu, 29 May 2025 at 13:44, Lorenzo Pieralisi <lpieralisi@kernel.org>=
 wrote:
> > >
> > > [+Andre, Peter]
> > >
> > > On Tue, May 13, 2025 at 07:47:54PM +0200, Lorenzo Pieralisi wrote:
> > > > +      reg:
> > > > +        minItems: 1
> > > > +        items:
> > > > +          - description: IRS control frame
> > >
> > > I came across it while testing EL3 firmware, raising the topic for
> > > discussion.
> > >
> > > The IRS (and the ITS) has a config frame (need to patch the typo
> > > s/control/config, already done) per interrupt domain supported, that =
is,
> > > it can have up to 4 config frames:
> > >
> > > - EL3
> > > - Secure
> > > - Realm
> > > - Non-Secure
> > >
> > > The one described in this binding is the non-secure one.
> > >
> > > IIUC, everything described in the DT represents the non-secure addres=
s
> > > space.
> >
> > The dt bindings do allow for describing Secure-world devices:
> > Documentation/devicetree/bindings/arm/secure.txt has the
> > details. We use this in QEMU so we can provide a DTB to
> > guest EL3 firmware that tells it where the hardware is
> > (and which EL3 can then pass on to an NS kernel). It would
> > be helpful for the GICv5 binding to be defined in a way that
> > we can do this for a GICv5 system too.
>
> It would be good to understand what DT {should/should not} describe and
> whether this DT usage to configure firmware is under the DT maintainers
> radar or it is an attempt at reusing it to avoid implementing a
> configuration scheme.
>
> Rob, Krzysztof,
>
> Any thoughts on the matter please ?

I'm all for firmware using DT, but using a single DT for all
components with an ABI between all components is an impractical dream.
You can take that a step further even with a single DT for all
processors in a system (aka System DT). Ultimately, the DT is a view
of the system for a client (OS). Different views may need different
DTs.

u-boot and Linux sharing a DT makes sense as they have the same world
view. Secure and NS not so much.

> [...]
>
> > The tempting thing to do is to have regs[] list the frames
> > in some given order, but the spec makes them not simple
> > supersets, allowing all of:
> >  * NS
> >  * S
> >  * NS, S, EL3
> >  * NS, Realm, EL3
> >  * NS, Realm, S, EL3
>
> Maybe reg-names can help ? Even though first we need to understand
> what resources should be described in DT.
>
> Current bindings are reviewed and I am not keen on dragging this
> discussion on forever - the information the kernel requires is there,
> I'd like to bring this to a close.
>
> Thanks,
> Lorenzo
>
> >
> > secure.txt says:
> > # The general principle of the naming scheme for Secure world bindings
> > # is that any property that needs a different value in the Secure world
> > # can be supported by prefixing the property name with "secure-". So fo=
r
> > # instance "secure-foo" would override "foo".

Today I would say a 'secure-' prefix is a mistake. To my knowledge,
it's never been used anyways. But I don't have much visibility into
what secure world firmware is doing.

> >
> > So maybe we could have
> >  reg : the NS frame(s)
> >  secure-reg : the S frame(s)
> >  realm-reg : the Realm frame(s)
> >  root-reg : the EL3 frame(s)

Here's why. It really doesn't scale.

Rob

