Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3567FCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 00:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uYueVCnhFig6wd4EAi1d6+7+lqgnd7MHxpQ+CybGP0=; b=wsfqNpl8fKep14b7JHgXvkD+tG
	WWVU4J6wZrz17t6UYnXTZFucD7K0NSRJk8RYz1tfFjA8BRBvn3lX2pviPGpUif2pxIm39W+46Zl3H
	sWaKlCTDBczlJDSa2TAumUbEvscvE27A4YOw/11TgqqjA0lpqvNnuojdnHPgIMB1yoJAjdOoN3ecJ
	i7zE0Myt/vYcrR5yi79649WY1lBvswPsqbJairUPoEzrNJRohKESup838smCvGO9lWcQeooVQ5+Qx
	SbnNc9bwGdQxF0zCO7DqMHwgSMzICgHouk15Ilqq/02pfmZ8X5KmrYMFh4zOFrP5Ekg66FsnQrY+Y
	shKN7F/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v717s-00000007Nzg-0dIa;
	Fri, 10 Oct 2025 00:36:52 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v717n-00000007NyD-3njz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 00:36:50 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-33255011eafso1667560a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 17:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760056607; x=1760661407; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uYueVCnhFig6wd4EAi1d6+7+lqgnd7MHxpQ+CybGP0=;
        b=oJ222abxkVqUQiKj8FqVi/vO6zp3EMkZb1XvQbYUrojAMAluiLFTRpFkwTO3CCq7pt
         RkQk+QJN88pRMzZePRQltVPKw/dxxCT1GlL6XdHQwcICr5DQXO1e4KM2oVsq2UGVLsky
         ijBxYkSRYPPVCAE9WwFpUZEIzRsb57p8EOF2QCNvyNfOFoklxdRl++t5yubhRdrpg4/B
         VaG2d+tlyesVeDEyS12nVaPwRwPrJ654RZV23sikcZya5/fO89Obid7l1diMrQHJIrUE
         cpwjjBe1rR18vQhkc+LZlyB/Gp0ghHPCZkgeU6w6kAwowUe0J/tYmaKJpv50Qf+V6NoV
         N7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760056607; x=1760661407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uYueVCnhFig6wd4EAi1d6+7+lqgnd7MHxpQ+CybGP0=;
        b=nS4PJb8CO2m4vyEZSJqBaHXfXazGrHRAssCdKGGIS/KshWdn59V7nTUmSqDHoDBPG0
         nt2GTNtEjae5qHGsxiNfYmwX83FNEgULvx5UbXzErBmlAUpSoNvoFXhIb4hB0JaDpobK
         exJzwH40iUNSHnzVdsqj1yNZEybDB20Yjo8MEngMmt/9Y3tf2mdM+B6y8GJ3kOeVEmi4
         cfhyEEHfeZ2d2H4uYo+u0E24Vy/T5Vg3a0omizUcdrbfEa+qUX3EsD6h5wVmum2jPS2p
         7QVcyCy8hCpa2q3UayFGEFNQz1mhVv+g8HXxOYeHvekgW8Gn++ENFc3XAjdK/KoQn7gZ
         xYqg==
X-Forwarded-Encrypted: i=1; AJvYcCX5KZVJsetLnBel+HJSUQcegke9FAEOPbWhkM4T0eCpstLuMkQEzVq+NVBCYROJETJ7B+VlwECENyyZ0V14lNqe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo//mJ1638PI7y5GoY7cXFkIR0ZaSmhUgytALOl6c8BzROgniG
	OnRbC5cfFwUMqOALFMD01KqWVBDI0ri0MxbfK0tH5HW9epHGSWLlB1eDy9GbBWA8QBXPoQcUfnK
	Y7hAGJ+2rFcOdm2N0PUfiwxdTNkuRGvl2IWBER+Yc
X-Gm-Gg: ASbGncuc3p4dUtkfj1zH25kvpeY7zPMuiUdyklONOvKvJfNz/z+k54RzBE3lwmbiMvI
	Pxzpqum7hygFOyokRWtuGBhpAtOfbv2gNqmx5f1Jk2ZImLfPG/A9SGcQF6ws/Q9yvgooqqNNVxZ
	yyE+azcNFBzVg0zGWXre7poG/rxvQb6Ss+hs2xZMJY8QqbBeZ+f5XJ1OCoadOYCqxJ9PSpYj7c0
	MzOWdezlt1jidT2v/PH91NVnKGOs0Zva8qHHvw=
X-Google-Smtp-Source: AGHT+IGKjXjPSXyUWNxjvvey/PIj1qEWv3CW3/XJrVZRUI28DQ4Y1brYwXDEUls30Lbe70Hr5PouwmW4vqkFNVZptJA=
X-Received: by 2002:a17:90b:1c0a:b0:32d:e75a:5009 with SMTP id
 98e67ed59e1d1-33b5114d4f2mr13047772a91.1.1760056606410; Thu, 09 Oct 2025
 17:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com> <20251008060000.3136021-2-royluo@google.com>
 <20251008-slider-uncombed-66790ea92ea0@spud> <CA+zupgxnBK_k2X0_KKX9pUMMTwY4VhsyTEEVz6v+__u=2xR8Ow@mail.gmail.com>
 <20251009-lizard-slapstick-4de7dfe2322d@spud>
In-Reply-To: <20251009-lizard-slapstick-4de7dfe2322d@spud>
From: Roy Luo <royluo@google.com>
Date: Thu, 9 Oct 2025 17:36:09 -0700
X-Gm-Features: AS18NWDGN42gjmrB8C6_VuH2yevkuUM_X9h5rPKcbGr2ZgBfcB7UAfagMIfSoXY
Message-ID: <CA+zupgwAXQEuhZUqbjxOC+9HbRG3SQ-_fhEX-49NpfCgqO4BZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_173647_948516_A4BD68C7 
X-CRM114-Status: GOOD (  26.80  )
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

On Thu, Oct 9, 2025 at 10:13=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Oct 08, 2025 at 09:40:57PM -0700, Roy Luo wrote:
> > On Wed, Oct 8, 2025 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Wed, Oct 08, 2025 at 05:59:57AM +0000, Roy Luo wrote:
>
> > > > +allOf:
> > > > +  - $ref: snps,dwc3-common.yaml#
> > > > +
> > > > +unevaluatedProperties: false
> > >
> > > So every property from snps,dwc3-common.yaml is valid here, with any =
of
> > > the permitted values?
> >
> > Conor,
> >
> > Appreciate the review.
> > Ack to all the comments, will fix them in the next patch.
> > And yes, every property from snps,dwc3-common.yaml is valid here.
> > You can find more context here [1], essentially the dwc3 glue would be
> > operating on the same platform device as the dwc3 core, hence all
> > properties are allowed.
> >
> > [1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-0-f015b358722=
d@oss.qualcomm.com/
>
> I find it exceedingly hard to believe that every property from that
> file, with every permitted value, is possible. AFAIU, the tensor g5 is a
> phone chip that's only used in pixel devices, not something that people
> can just buy and integrate into whatever device they feel like. There
> should be a vanishingly small number of possible configurations,
> possibly exactly one configuration. There are dozens of properties in
> the dwc3 common binding, of which at least 10 are for "quirks" or other
> sorts of hardware errata that are not going to be variable from one
> phone to another.

To my knowledge, the properties in snps,dwc3-common.yaml can generally
be categorized into two types:
- Function knobs: These properties translate directly to register writes th=
at
  modify the controller's fundamental behavior. Most quirks fall into this
  category. For example, "snps,gfladj-refclk-lpm-sel-quirk" enables SOF cou=
nter.
- Tunable Values: These properties also map to register writes to influence
  hardware behavior, but they typically adjust performance or interoperabil=
ity
  rather than essential function. While the hardware usually works fine wit=
h
  default settings, these values allow for optimization. For example,
  "tx-fifo-max-num" usually affects data throughput.

For DWC3 hardware errata and workarounds, my understanding is that they
are typically handled within the dwc3 driver, often involving a DWC3 revisi=
on
check (e.g. [1]), instead of in the device tree binding. While you may find
properties related to errata, they generally serve to enable or disable an
existing workaround (e.g. [2]).

For Pixel devices, it's shipped with a preferred configuration, but the har=
dware
is fundamentally capable of supporting other configurations since the prope=
rties
are backed by the SNPS DWC3 IP. Whether that's optimal is a different story=
.
I haven't tried toggling every single property but I'm not aware of any pro=
perty
that obviously does not work on Tensor G5.

I hope this addresses your concern.

[1] https://github.com/torvalds/linux/commit/32a4a135847b1e600c64756b7c7c7a=
91eb2f0aa9
    (sorry I'm unable to find the kernel lore link for this commit)
[2] https://lore.kernel.org/all/1509455515-5992-1-git-send-email-rogerq@ti.=
com/

Regards,
Roy Luo

