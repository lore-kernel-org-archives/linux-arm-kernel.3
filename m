Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B08C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 22:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eMskAXrsKj+yPhrh5gsUKk0GeOs6CV2lDoAzrqp+eY=; b=qtJO0Cw73xlXtYWAy3DlteDFUH
	yzR402tkFXQZ8mrernULrOHxkHgtYsX05ucoT81vQk6Ez1/Yu1UxazHQySKYRgYOSxrddElrZ4AFV
	tkQ3JbTfUE7k9Hya9HC+61U80/499DcF9Ur0uawa5LFqwqKIBfTtpHyNrsm1I+8q23Irg4WPM+vm5
	SzDuAIDlD+kvxo3uClSXHX3jYW/Qoa/yhdoa9yKDG0L3ju0MW1Hj9HGYO27vjqaf0at8AN3kCAW8U
	MbSpTal6CgeUHzfNge0HnhVxlrTv5J3t785k/ul8izezeq9l32N2utETJpKk2bAuaYaVMRIMYPne5
	jBGE3h7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYuWx-00000001SK1-2XiY;
	Fri, 17 Jan 2025 22:09:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYuVf-00000001S7d-1ROL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 22:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAF4A5C64DC
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 22:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B57C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 22:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737151690;
	bh=6eMskAXrsKj+yPhrh5gsUKk0GeOs6CV2lDoAzrqp+eY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N8l/Kqq4V9SaA8CdBa8HP/4dyleSc4jRLHY3fUjNNqrDC49X/8nR9ba78yxKm50IE
	 2YAYZvWnjmBQMedzs2D+N2qO6dU/4ZN2mymr36Tq2zXCASZlR8/Y5a2rMV47fZTF5W
	 A9RVRJgy8Z+h2pYIt0Vvn/gdcVUn4L1kpG8odH298sEC5lB1TLJ+6mNUVhPif2xJam
	 3QorP8g1IWh9kh1D0S04nU99sSjlJFiZGN3Nl8p2Ott05e0L8qcg0ia1Shvk3MA++V
	 Hezt16+AhWEcSveUT59qU/5t34dRsrqF33ZP22yU6/X+JnPiqfylInUjEQCIitpWNX
	 IEX16esO2G8aQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3778bffdso2822970e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 14:08:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWBsFmPxHW1VKcLSnPAod5xcZ/YqygKuTkLjGBY8vIgL/OoW6Bxp7TvLVv/on7qpokbNHdvGRweSzd3t2rRcv5T@lists.infradead.org
X-Gm-Message-State: AOJu0Yznw2MHXfsAW8p0jJFxFi6IIgt5WYJLruQSM+k9gzeqUDA+UPzq
	pzb1EI/OLrfyXUOwC/ikz4IrdcMsVrZRo9p3IVT70plta1/fvE9+61R193CtsVIj3XWj1kULeyC
	o54VjJmbPPqsA/uT/f2B+4c1oyA==
X-Google-Smtp-Source: AGHT+IEgpKi5iU2Ry8bgcFk3ypohPNuQOcWdD3eLZQ0Yrk230Xh+rHDMCHRK1H7BAsvHETXiMfMqJ+pcY/x3PQ0wC54=
X-Received: by 2002:a05:6512:12ca:b0:540:1fec:f321 with SMTP id
 2adb3069b0e04-5439c285412mr1386422e87.41.1737151688439; Fri, 17 Jan 2025
 14:08:08 -0800 (PST)
MIME-Version: 1.0
References: <20241220072240.1003352-1-anshuman.khandual@arm.com>
 <20250102160402.GB3990035-robh@kernel.org> <Z30adHnQ7ZFaU9UR@arm.com>
 <CAL_JsqLLnh1o4L1=PpNt5brBwZZCgp7mOygByOYakchrzc29Ow@mail.gmail.com>
 <86wmf5wo8u.wl-maz@kernel.org> <CAL_JsqKKiEOj=a1k6U-bB0F6-ht7QokDnh3bspHupp-QG=haSg@mail.gmail.com>
 <Z4kmlhnlpKjS_MII@arm.com>
In-Reply-To: <Z4kmlhnlpKjS_MII@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 17 Jan 2025 16:07:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK1k7fG=yDZSbTbV63yRP5U9=GpuAiv=NWZJWdppUtRwA@mail.gmail.com>
X-Gm-Features: AbW1kvZCaGPAdTzQQUI5Q5j42V1TeAoCQ3yfC8Cjc8iBuIXUrThvrm6lQVxJhg4
Message-ID: <CAL_JsqK1k7fG=yDZSbTbV63yRP5U9=GpuAiv=NWZJWdppUtRwA@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_140811_470389_915B6ED9 
X-CRM114-Status: GOOD (  19.61  )
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

On Thu, Jan 16, 2025 at 9:32=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, Jan 08, 2025 at 07:47:16AM -0600, Rob Herring wrote:
> > On Wed, Jan 8, 2025 at 5:15=E2=80=AFAM Marc Zyngier <maz@kernel.org> wr=
ote:
> > > On Tue, 07 Jan 2025 22:13:47 +0000,
> > > Rob Herring <robh@kernel.org> wrote:
> > > > On Tue, Jan 7, 2025 at 6:13=E2=80=AFAM Catalin Marinas <catalin.mar=
inas@arm.com> wrote:
> > > > > But does KVM actually expose the feature to EL1 in ID_AA64DFR1_EL=
1 and
> > > > > than traps it at EL2?
> > > >
> > > > As Marc pointed out KVM only advertises PMUv3.8. Regardless, guest
> > > > accesses to these registers are trapped with or without this series=
.
> > >
> > > And most probably generates a nice splat in the kernel log, as nobody
> > > updated KVM to handle *correctly* PMICNTR_EL0 traps, let alone deal
> > > with the FGT2 registers.
> >
> > Isn't that this series[1]? Should that have come first, I guess I know
> > that *now*.
> [...]
> > [1] https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khandu=
al@arm.com/
>
> It's not any clearer to me. Does this series depend on the 46-patch one?
> Or, if we had the other, is this no longer needed? Or none of these,
> they are independent.

They are independent. I think ideally we'd want everything landing at
the same time, but we're past ideal at this point. Without this
series, if someone uses PMU on v8.9 and firmware enabled FGT2, then
the kernel will crash. Without the above series, KVM will have
warnings in the kernel log, but otherwise function.

Rob

