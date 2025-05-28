Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CFBC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 19:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vXV8CibleBJLNxJ+dgTqNe61IgPpMT7YMSdJt8YOB4=; b=1M9at4PSS/MNFU3QM1QxHBnT1V
	OUjuKmGVGGxgpzd99JdAopMdpsvCkukAhmNFUEY0TH3ooWGqz5Ri6rK+79meURMj/ekkSg16GCbEN
	pHvIYJT2eYkqAlePTvr8+mXuUSOwaihEcVkUNt4lRkN7NTdYmBXWTDjjzCjv5LxqoyYfVNvSDLEeF
	aDBudhR/K+6DhnAShS0lzu1ubZm2ygXwGXawWZmmmjbPq0F90zK5RsxYCmpqoAulP6q1+jKVm67L9
	r/F71jZqcE0PQmuMLJKY852ChjAbsm4FjGA950a3uviCw+MFmkn4t0N9hyHWzEhiNbopbucyqHBy1
	J2PrduBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMD4-0000000DyU7-0LAd;
	Wed, 28 May 2025 19:13:06 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMAt-0000000Dy5s-0aIa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 19:10:52 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6faa01a3a5cso2099886d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748459449; x=1749064249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vXV8CibleBJLNxJ+dgTqNe61IgPpMT7YMSdJt8YOB4=;
        b=RBXUICVS5jN/0GqAv3Kh+2j1cMi8Ytw86NJpXT4YyHnviSxNyIhTE5hEandoxkUz5I
         RD9rNAEjzEHqvd6lYIN77JP1m9bKcNEMmyu66mZY6rcz4w1iW+kH0W0aAsYKauAjPyuw
         VRvBRDWVFlgnSmRyiKITiZHZG+7WWpxkGOBJz3stCepWc/yWRDw7imISx0cGQHdqKI4H
         qbJm76Bkf+VQttRZs6cxAKVSWjO8QFgqMOFLvurWBG35F68L6f0ucRKaCRtbiL+5IFpQ
         UXgdZcEBO/fgWTQvOeSjEYizpWtbLL10Man7v+gjHYrS6hyNbmjyzBzl5nPsaHfW2R78
         20bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748459449; x=1749064249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vXV8CibleBJLNxJ+dgTqNe61IgPpMT7YMSdJt8YOB4=;
        b=dMtmYVtcjm58xIezjgVicuw5018LWa9QmuFD8xV1y/1/4gaJri9oI3HlrD6T0lBkYK
         r3zMN9+PuotqoUY37MXlS7X9b9iYDgKpKN9ykp5tGBCtJ5vAVTAExfZqNFXewWkwPrcS
         0TFK9H7Y8lQPVXrjMKT43bfwDj0vCVX+V7Oy6laHFCSVKzOcThwj8ZmYVO2nsu4puQxx
         HZlF3ZFH8il+rQ7tnqLluJ9iQPFidjH4G5xjt9fw+NjmOghbtpRHdI7jApcIHJ2Ivb1t
         qlkxvc/0yJqsoK0pYZLQJj+RhdN5sUc6hmLFdGQ0/TZafyyW84045fkOnu5v0sA3lw9u
         9Kzw==
X-Forwarded-Encrypted: i=1; AJvYcCVRHCeP+9wRA3Ag56W26Eg/oA6QebZWolViy8Zt8nSLJ1aj7jTq9DM2Jr+GqFLoaNYB/fWeKAp4X3tkxofF/BkR@lists.infradead.org
X-Gm-Message-State: AOJu0YyFFf54iIAxSVmK8PzuPmTG3Zo1Cn5mfpJuiymL4DohJ1fnu4Lq
	dZlu5kJvR2v2jFZAs+K5k5MSZqPHO/bB47b52KAHDrfUB79VpQmoC4vecGwtozwmWcb5QwlwRA4
	VVGJNPFRi4S6hOclGWrqCFmRowCQfKPc=
X-Gm-Gg: ASbGncvEyZqU3bqVVmTXmLt7FuHMAGZYbHBwhCd9teEkNmL9PnVdanDPmckVIut+FRJ
	3DVcDvxGS1GS7/P+OmcstOUjmpohUL1Oq77EYImfj6kYutYD7A5OqrMkDPTgPFufSxBYy6dq+e6
	9zgC5Am3Qjufc8oYCx43bgND7nRT0yClUwyQ==
X-Google-Smtp-Source: AGHT+IGVokqUFuch5bu9nFuPki/cq4vIjcMqBAkbbK4WqjP5C4EtlfVsOQ8KegrxN/Gxv4Xm6H/hNsYjoGFcdfxxUEo=
X-Received: by 2002:a05:6214:2488:b0:6fa:bb74:8d71 with SMTP id
 6a1803df08f44-6fabb749047mr58286646d6.22.1748459449367; Wed, 28 May 2025
 12:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk> <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch> <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com> <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
In-Reply-To: <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 13:10:38 -0600
X-Gm-Features: AX0GCFuaoONi18V1jbCdzW2xpOvgDWlCjKjVZpkQiI6k60N1aEB22gQ3UxxtMcg
Message-ID: <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: wens@csie.org, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_121051_179657_39C3EE02 
X-CRM114-Status: GOOD (  47.49  )
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

On Wed, May 28, 2025 at 12:34=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, May 28, 2025 at 11:25:20AM -0600, James Hilliard wrote:
> > On Wed, May 28, 2025 at 8:12=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wr=
ote:
> > >
> > > On Wed, May 28, 2025 at 9:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> =
wrote:
> > > >
> > > > On Wed, May 28, 2025 at 05:57:38AM -0600, James Hilliard wrote:
> > > > > On Wed, May 28, 2025 at 1:53=E2=80=AFAM Russell King (Oracle)
> > > > > <linux@armlinux.org.uk> wrote:
> > > > > >
> > > > > > On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> > > > > > > On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@l=
unn.ch> wrote:
> > > > > > > >
> > > > > > > > > Sure, that may make sense to do as well, but I still don'=
t see
> > > > > > > > > how that impacts the need to runtime select the PHY which
> > > > > > > > > is configured for the correct MFD.
> > > > > > > >
> > > > > > > > If you know what variant you have, you only include the one=
 PHY you
> > > > > > > > actually have, and phy-handle points to it, just as normal.=
 No runtime
> > > > > > > > selection.
> > > > > > >
> > > > > > > Oh, so here's the issue, we have both PHY variants, older har=
dware
> > > > > > > generally has AC200 PHY's while newer ships AC300 PHY's, but
> > > > > > > when I surveyed our deployed hardware using these boards many
> > > > > > > systems of similar age would randomly mix AC200 and AC300 PHY=
's.
> > > > > > >
> > > > > > > It appears there was a fairly long transition period where bo=
th variants
> > > > > > > were being shipped.
> > > > > >
> > > > > > Given that DT is supposed to describe the hardware that is bein=
g run on,
> > > > > > it should _describe_ _the_ _hardware_ that the kernel is being =
run on.
> > > > > >
> > > > > > That means not enumerating all possibilities in DT and then hav=
ing magic
> > > > > > in the kernel to select the right variant. That means having a =
correct
> > > > > > description in DT for the kernel to use.
> > > > >
> > > > > The approach I'm using is IMO quite similar to say other hardware
> > > > > variant runtime detection DT features like this:
> > > > > https://github.com/torvalds/linux/commit/157ce8f381efe264933e9366=
db828d845bade3a1
> > > >
> > > > That is for things link a HAT on a RPi. It is something which is ea=
sy
> > > > to replace, and is expected to be replaced.
> > >
> > > Actually it's for second sourced components that are modules _within_
> > > the device (a tablet or a laptop) that get swapped in at the factory.
> > > Definitely not something easy to replace and not expected to be repla=
ced
> > > by the end user.
> >
> > Yeah, to me it seems like the PHY situation is similar, it's not replac=
eable
> > due to being copackaged, it seems the vendor just switched over to a
> > second source for the PHY partway through the production run without
> > distinguishing different SoC variants with new model numbers.
> >
> > Keep in mind stmmac itself implements mdio PHY scanning already,
> > which is a form of runtime PHY autodetection, so I don't really see
> > how doing nvmem/efuse based PHY autodetection is all that different
> > from that as both are forms of PHY runtime autodetection.
>
> What is different is using "phys" and "phy-names" which historically
> has never been used for ethernet PHYs. These have been used for serdes
> PHYs (e.g. multi-protocol PHYs that support PCIe, SATA, and ethernet
> protocols but do not provide ethernet PHY capability).

Hmm, yeah, I had copied the convention used here
https://github.com/torvalds/linux/blob/v6.15/arch/arm64/boot/dts/ti/k3-j784=
s4-evm-quad-port-eth-exp1.dtso#L42-L43

> Historically, "phys" and "phy-names" have been the domain of
> drivers/phy and not drivers/net/phy. drivers/net/phy PHYs have
> been described using "phy-handle".

Yeah, I noticed it wasn't commonly used for ethernet PHYs, but
I didn't see any other way to define multiple named "phy-handle"s
for ethernet PHYs so I tried to use a similar style to serdes.

> So, you're deviating from the common usage pattern, and I'm not sure
> whether that has been made clear to the DT maintainers that that is
> what is going on in this patch series.

Ah, I thought it was fairly clear in the patch descriptions/example
that this was a non-standard situation due to unusual hardware.

> As for the PHY scanning is a driver implementation issue; it doesn't
> have any effect on device tree, it doesn't "abuse" DT properties to
> do so.

I was just pointing that out as an example of runtime autodetection
being something the kernel supports. To me it seems using existing
conventions like "phys" and "phy-names" is the least invasive way
to define phy's that need to be chosen at runtime.

> The PHY scanning is likely historical, probably from times
> where the stmmac platform data was provided by board files (thus
> having the first detected PHY made things simpler.)

I think a lot of ethernet drivers use phy_find_first() for phy scanning
as well so it's not limited to just stmmac AFAIU.

> Therefore, I
> don't think using it as a justification for more "autodetection"
> stands up.

If anything I think the i2c OF component probe functionality is
a much clearer example of precedent for DT integrated runtime
hardware detection since the purpose of that(supporting second
source components within the same device tree) is effectively
the same use case as this efuse based runtime hardware
detection.

