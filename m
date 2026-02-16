Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF40EF5867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhbOHynWdIqyd2LkLlh4zuE6O3h/dec0WUZPV7py2YA=; b=Vak1nCcI2qBM5ZP11GZH049Wdh
	6mKdNPPtkT53cOPc0ZGbjA0ZxThxztHgR17TGjTbRReBZ+n34aqCs4IdCK4EPVtDn8iF39AOSStKS
	GG6TcWtVKbHrYp6z85CxM6yFLyLra50myZC63u2nzNQJTPx8hou+W+trvIpO8ueDSxSqqj6sMMiM2
	bbLbz4hddaqzP6as4opULmzDZ249JjCq2KJ1mB/Sb0M8VF12ZJSK7fdt+VZS4LXulzZHe1pMG7iRo
	ZooSN/wpQxi/929FeVAL53/l5NENK0zUQawnlibQJkBSIqxPtR7M7QCSac2Vwp8WLAUAOTT9Xj4U7
	6loZAo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrv9s-00000006I7j-2U8q;
	Mon, 16 Feb 2026 09:44:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrv9a-00000006I1b-2d0P;
	Mon, 16 Feb 2026 09:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771235068;
	bh=ZmNpag6GBURIks4wmS3ojXtnwZVF30mG5EnZSm/42mM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FEiCZYIl0PM2WOaah9nVZrSvsCdSKwKNLfCD+UYJF/IgEmZSmsyUdvPWNVRDhU6Zz
	 HLsdZID4K3bLcl7wVOEEePR+PyIjUjxlMBD0O3/F8GBitCJBvH/FnLWm3MfuAAKwDF
	 2Hv3MiIVwzGLbxx+GyPk4Lr32zrHmgTbMz/3mO03RuvUyxlvHxAJhaRAFUgPTWZWlb
	 yfO9tJEmjxotzi7TjCN904iA+CEiy1ytTOZJB0yGTK/v52v4NPe8v50fAQ+frMwPrE
	 rKvgD4+TyXe7CCkD/iA9MRiuNLFjHwpToTbnBKSzL9CZ1ZYNjsC6vpOFtE7j3GWGM+
	 YjCjTxQghzd0A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8841A17E137B;
	Mon, 16 Feb 2026 10:44:27 +0100 (CET)
Date: Mon, 16 Feb 2026 10:44:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Adam Ford <aford173@gmail.com>
Cc: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except
 mt8196
Message-ID: <20260216104423.6b5bcc96@fedora>
In-Reply-To: <CAHCN7xJJgLxPSf0QJ9nvY4Z3BguDmYJtpeprT+obD5DgA8rOgQ@mail.gmail.com>
References: <20260215100302.136719-1-work@onurozkan.dev>
	<20260215100302.136719-2-work@onurozkan.dev>
	<CAHCN7xJJgLxPSf0QJ9nvY4Z3BguDmYJtpeprT+obD5DgA8rOgQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_014431_077145_F7B20955 
X-CRM114-Status: GOOD (  26.10  )
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

Hello Adam,

On Sun, 15 Feb 2026 16:21:34 -0600
Adam Ford <aford173@gmail.com> wrote:

> On Sun, Feb 15, 2026 at 4:04=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.d=
ev> wrote:
> >
> > If sram-supply is missing, Panthor falls back to a
> > dummy regulator with a warning. This implicit behavior
> > hides missing DT wiring behind regulator core fallback.
> >
> > Make SRAM handling explicit: require sram-supply for all
> > Panthor compatibles except mt8196-mali where GPU supplies
> > are intentionally managed outside Panthor and DT does not
> > model sram-supply for that compatible.
> >
> > This keeps DT power modeling explicit and avoids relying on
> > dummy-regulator fallback.
> >
> > Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/dr=
m/panthor/panthor_devfreq.c
> > index 2249b41ca4af..5f6075f18fe3 100644
> > --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> > +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *p=
tdev)
> >          * But without knowing if it's beneficial or not (in term of po=
wer
> >          * consumption), or how much it slows down the suspend/resume s=
teps,
> >          * let's just keep regulators enabled for the device lifetime.
> > +        *
> > +        * Treat sram-supply as mandatory except for mt8196-mali. It ma=
nages
> > +        * SRAM outside Panthor so this driver must not require direct =
control
> > +        * over it.
> >          */
> > -       ret =3D devm_regulator_get_enable_optional(dev, "sram");
> > -       if (ret && ret !=3D -ENODEV) {
> > -               if (ret !=3D -EPROBE_DEFER)
> > +       if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mal=
i")) { =20
>=20
> I wonder if a more generic device tree flag would be better here.

No, we don't want it as a separate DT flag. This is all stuff we can
hide behind the compat, and every bit we add to the DT we don't
strictly need turns out to be a liability in the long run in general.

> What happens if others do the same as Mediatek or Mediatek decides to
> do this with more processors and this list grows?

That's what panthor_soc_data is for: you can attach per-compat
properties without polluting the DT with more stuff that can be
directly inferred from the compatible.

> It seems like a
> panthor binding might be useful to prevent future bloat.

It's actually the opposite, the more we add to the DT, the trickier it
gets to maintain, because we tend to get those things wrong (is the
SRAM really not needed on mt8196, or is this just a workaround to hide
the fact the PM is deferred to some FW?).

Regards,

Boris

