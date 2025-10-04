Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CE0CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Oct 2025 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0hnA0tM8jZVaYJeVhFId5qO5saJXLGBc/fF/KTNJoI=; b=stwwCF4Xhui3rSVOb9hkbeH8PY
	Cw+3L93qZz5knG1pQFRBdsoAIdyhgivMI/i82CxzfXxkE1Mp2ahZfXz0DZyWvUfkzHw7NVBq9Vzpz
	OyYggscnDNohgBoVu/pbh5nQAREMMIwvLd4eBDBxmCeni6rUdyrTHjRlFGUgdB7unEELvVdPUXEkz
	/o6r7u72A3Pe3lpjoMxf7TCP2Hfj2AdljOtB0D9HjoS20alfZcxIjyZd54v0pjdHBMUp+sDptAfrS
	dSI6Bnj5iS0khQPWPsVY88Bja3yTZYXGRT7X2+LBCL2jfxPJTFyMzJURiy+Hq0kZgq7EAlQiesMpX
	gp4RkFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v52GP-0000000Djs4-1hrf;
	Sat, 04 Oct 2025 13:25:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v52GO-0000000Djry-0XNa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Oct 2025 13:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CFDF60144;
	Sat,  4 Oct 2025 13:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C60C4CEF1;
	Sat,  4 Oct 2025 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759584326;
	bh=bc5bP7EqrX/7tverHK4ahEMxMXdfuaRoCJxs+IXR4UI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=isrBaMWfApwQ1NDz1qxYerr3ggmdcFTR9LgDdgHJYQ39uEppFCwRZbzDkDTYqIZO8
	 BtOqmkcx73Hww6vj5nUDaAK5msqyyJqgg9lGfSngFsus5mReiwGCb4TIzeDMlSKyxM
	 S39iQ9sSMoUSCQYj82BBrXcE/ZfosunC3Xuk2z9JEDJ+Zc5x3pQRwTCAMD/kRn6OUt
	 tYN6hcLHKcPxTOrcjOTjWdzGTocQp/+z5/AlZlMcWZZcV9n08/CT2hsiF5iOM2/QfM
	 mCEyOYo8cWREIDsLjD7+CLWL0tbQD1Qtt+a0o5WlqGonWbx4jZRB3ZbpLJ5Z6ht4/I
	 IAWGofaVST+GQ==
Date: Sat, 4 Oct 2025 14:25:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=	 <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Maxime Coquelin	 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: stm32-dfsdm: fix st,adc-alt-channel property
 handling
Message-ID: <20251004142517.0cf3e7a2@jic23-huawei>
In-Reply-To: <5243c2c5a8f3dd24f40e30a695e2a3d4f948f388.camel@gmail.com>
References: <20251002112250.2270144-1-olivier.moysan@foss.st.com>
	<5243c2c5a8f3dd24f40e30a695e2a3d4f948f388.camel@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Fri, 03 Oct 2025 07:15:56 +0100
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Thu, 2025-10-02 at 13:22 +0200, Olivier Moysan wrote:
> > Initially st,adc-alt-channel property was defined as an enum in the DFS=
DM
> > binding. The DFSDM binding has been changed to use the new IIO backend
> > framework, along with the adoption of IIO generic channels.
> > In this new binding st,adc-alt-channel is defined as a boolean property,
> > but it is still handled has an enum in DFSDM driver.
> > Fix st,adc-alt-channel property handling in DFSDM driver.
> >=20
> > Fixes: 3208fa0cd919 ("iio: adc: stm32-dfsdm: adopt generic channels bin=
dings")
> > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> > --- =20
>=20
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
Applied to my temporary fixes branch that I'll rebase on rc1 once available.
Also marked for stable.

thanks,

Jonathan

>=20
> > =C2=A0drivers/iio/adc/stm32-dfsdm-adc.c | 5 ++---
> > =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-=
dfsdm-adc.c
> > index 74b1b4dc6e81..9664b9bd75d4 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> > @@ -725,9 +725,8 @@ static int stm32_dfsdm_generic_channel_parse_of(str=
uct
> > stm32_dfsdm *dfsdm,
> > =C2=A0	}
> > =C2=A0	df_ch->src =3D val;
> > =C2=A0
> > -	ret =3D fwnode_property_read_u32(node, "st,adc-alt-channel", &df_ch- =
=20
> > >alt_si); =20
> > -	if (ret !=3D -EINVAL)
> > -		df_ch->alt_si =3D 0;
> > +	if (fwnode_property_present(node, "st,adc-alt-channel"))
> > +		df_ch->alt_si =3D 1;
> > =C2=A0
> > =C2=A0	if (adc->dev_data->type =3D=3D DFSDM_IIO) {
> > =C2=A0		backend =3D devm_iio_backend_fwnode_get(&indio_dev->dev, NULL,
> > node); =20


