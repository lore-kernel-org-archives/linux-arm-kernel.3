Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F0FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSbQfVIcx6ukNQY9vN5gyk/LMc86CfAZUQgC0YBG6V0=; b=zO5K/ayDOEJPTfHwlfaq3kNCS6
	JD3M0C5kZFLBMzx0BjmUbYPfz/TEjR0JSYltJjqpLrWXSq+hau0iWEK4RWl8PX1XjkR4BdB3H7CCj
	rme40h94XuwLs9ZJwq9MXjraZe01MTbugZP6UmKEySxKQfOE5rNmKrlkNNuxRErIIiKkgyM3bIYse
	GeOhJI028yrFy083mko9iGhzN0OHZBWhyGdbujBMfI6vw1+j3RdsGeZ5ciZ2ypFDVDReNJVf8Vl7t
	kEo/rApG1gdE+VYDLMks4H471W0zs1QHd6tNtxh/Rjo6Ruh+2kAxMAyGdzzhG1k+K+SqZszrwc2TU
	fAH5GZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTefd-0000000ChAG-08vw;
	Fri, 03 Jan 2025 10:12:45 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeeO-0000000Cgu2-1a5Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 10:11:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so21151120a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 02:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735899086; x=1736503886; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HSbQfVIcx6ukNQY9vN5gyk/LMc86CfAZUQgC0YBG6V0=;
        b=TSLRe2ygR1NaPpZ9+H5CieAJ4d33G1qnkMbsvOjQv20MZl1Hy4XfhSZ1uCGZebor2P
         YnjDVf8swsfX56CGTBzE3t7vcTiVzQLqOFQDR130Sdxld+roey9M0c8lwUdxQvWRiHst
         M5+GfHjJOYlWA13Gv1vAV5zKrlpIh4kdmnd70aqEJse1VITEKVO2fzSea4ZVbdEY0bLR
         tsyZVUEKaSIKXFCEOIITG8K1MzJF8rMjpGimqNDNrKUX9UVLtCmTU4LQl+RZd9k+ps8U
         6cJRO9yN/1f36GJ532uauOD9evFSYkWp8NPL54FmtnJlUvqbXjAE9wZv8LOwoKosVV2U
         OjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735899086; x=1736503886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSbQfVIcx6ukNQY9vN5gyk/LMc86CfAZUQgC0YBG6V0=;
        b=bPdRt8V4H1Y+yYAaFN3wr3AHjKsouMEni/l59O6jwihP+zdtPVxkneQ4nQon3PaqmQ
         QRrPn6LIDxrpya8ykJHcrj7liwBVQwUQ0706DmlcWQHpj/zBQY9H0JB4JwrIMh978EZy
         nSX2YL/4MZ0OQXbVff3oTHIADJACXHk76HrW5Km00tjGpqvt1pZTq+IzfNJDIGSHF38y
         uJQzrWiF8XE69iL0TJEFrilqQ6HoYx6/Tq0RUuSRsCvsfBOYM8to8qstz2yMJN/5xXg/
         QEkW3xBVioNGHb54wWAj4NEEugjU+bZVOy7i7EODw4sX+151LcQnpm6rn5N/MDupAEsD
         4I9w==
X-Forwarded-Encrypted: i=1; AJvYcCW3suU2rMkmEKlSTx0TgpN3bi9wA/jGzcW+zDpfTAL+U+fmRSwmvYKOnNhS8c2Q+ijmRWdCm9yXriXRCblvtkMV@lists.infradead.org
X-Gm-Message-State: AOJu0YyTeJUB2ejdX5eoXoIMQvg0R40AQxD47FuQizFkc9gFw26FYa1G
	vcJreAmfTyy5xlQCrttT+tkoxSM3pBmqxnPtFm+SPx8SvBQG1lM9GcvBG/ivin8=
X-Gm-Gg: ASbGncvfHARwPFmhkmImVOe28ikshy/y/yLX8U/XCP31sEA9fzH4A//JBnt+bHqjUEg
	L+tYSW7OCAwVLCHjD9ZD0j+QyJ//8xKRERM5zmtGp53oh1zMUrCpqbVFtHiXXYT7CP555VuxDkB
	6bN3j3+0HbgzQkXHvxxmpzmKVXol15aTWcYgWtMEVrsG8kzbaaCfSaqF+SnYL9Kx7j1lFlCug2r
	K1ExqgBKQBMbq2EJa1itKcrYUuyvElZ/ZXnhpR6W+xX52LGkJg7
X-Google-Smtp-Source: AGHT+IGVhK8RxUfOgN5/AP02t7KJ1IsWpVINw+ADRYIKZE5PdYvzjFxNJilJ3zjN0WbNezateHeIPw==
X-Received: by 2002:a05:6402:3510:b0:5d0:e2c8:dc8d with SMTP id 4fb4d7f45d1cf-5d81ddfe37cmr45262786a12.20.1735899086217;
        Fri, 03 Jan 2025 02:11:26 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:3b5a:db2d:b2b7:c8b4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f128sm19178394a12.44.2025.01.03.02.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:11:25 -0800 (PST)
Date: Fri, 3 Jan 2025 11:11:23 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 2/4] firmware: ti_sci: Partial-IO support
Message-ID: <24h2xx6plhjtdsuntyygghalo4cqxdoh6ncexzrxk4kpj5coy2@5jwdqxixdwto>
References: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
 <20241219-topic-am62-partialio-v6-12-b4-v4-2-1cb8eabd407e@baylibre.com>
 <20241220115043.qhjroeqc4gl3pwtz@lcpd911>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iknrznhvbakof7yi"
Content-Disposition: inline
In-Reply-To: <20241220115043.qhjroeqc4gl3pwtz@lcpd911>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_021128_626816_3A860066 
X-CRM114-Status: GOOD (  44.89  )
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


--iknrznhvbakof7yi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] firmware: ti_sci: Partial-IO support
MIME-Version: 1.0

Hi Dhruva,

On Fri, Dec 20, 2024 at 05:20:43PM +0530, Dhruva Gole wrote:
> Hi Markus,
>=20
> On Dec 19, 2024 at 21:02:13 +0100, Markus Schneider-Pargmann wrote:
> > Add support for Partial-IO poweroff. In Partial-IO pins of a few
>=20
> Maybe add a comma after the In partial-IO, a few pins in this SOC can gen=
erate....
>=20
> > hardware units can generate system wakeups while DDR memory is not
> > powered resulting in a fresh boot of the system. These hardware units in
> > the SoC are always powered so that some logic can detect pin activity.
> >=20
> > If the system supports Partial-IO as described in the fw capabilities, a
> > sys_off handler is added. This sys_off handler decides if the poweroff
> > is executed by entering normal poweroff or Partial-IO instead. The
> > decision is made by checking if wakeup is enabled on all devices that
> > may wake up the SoC from Partial-IO.
> >=20
> > The possible wakeup devices are found by checking which devices have the
> > "poweroff" in the list of wakeup-source power states. Only devices that
> > are actually enabled by the user will be considered as an active wakeup
> > source. If none of the wakeup sources is enabled the system will do a
> > normal poweroff. If at least one wakeup source is enabled it will
> > instead send a TI_SCI_MSG_PREPARE_SLEEP message from the sys_off
> > handler. Sending this message will result in an immediate shutdown of
> > the system. No execution is expected after this point. The code will
> > wait for 5s and do an emergency_restart afterwards if Partial-IO wasn't
> > entered at that point.
> >=20
> > A short documentation about Partial-IO can be found in section 6.2.4.5
> > of the TRM at
> >   https://www.ti.com/lit/pdf/spruiv7
> >=20
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  drivers/firmware/ti_sci.c | 115 ++++++++++++++++++++++++++++++++++++++=
+++++++-
> >  drivers/firmware/ti_sci.h |   5 ++
> >  2 files changed, 119 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> > index ec0c54935ac0d667323d98b86ac9d288b73be6aa..693ac816f8ba3941a9156bd=
39524099ca476d712 100644
> > --- a/drivers/firmware/ti_sci.c
> > +++ b/drivers/firmware/ti_sci.c
> > @@ -3746,6 +3746,100 @@ static const struct dev_pm_ops ti_sci_pm_ops =
=3D {
> >  #endif
> >  };
> > =20
> > +/*
> > + * Enter Partial-IO, which disables everything including DDR with only=
 a small
> > + * logic being active for wakeup.
> > + */
> > +static int tisci_enter_partial_io(struct ti_sci_info *info)
>=20
> Isn't the function naming style in the driver ti_sci_XXX ? You're
> missing one `_` I guess
>=20
> > +{
> > +	struct ti_sci_msg_req_prepare_sleep *req;
> > +	struct ti_sci_xfer *xfer;
> > +	struct device *dev =3D info->dev;
> > +	int ret =3D 0;
> > +
> > +	xfer =3D ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
> > +				   TI_SCI_FLAG_REQ_GENERIC_NORESPONSE,
> > +				   sizeof(*req), sizeof(struct ti_sci_msg_hdr));
> > +	if (IS_ERR(xfer)) {
> > +		ret =3D PTR_ERR(xfer);
> > +		dev_err(dev, "Message alloc failed(%d)\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	req =3D (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
> > +	req->mode =3D TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO;
> > +	req->ctx_lo =3D 0;
> > +	req->ctx_hi =3D 0;
> > +	req->debug_flags =3D 0;
> > +
> > +	dev_info(dev, "Entering Partial-IO because a powered wakeup-enabled d=
evice was found.\n");
> > +
> > +	ret =3D ti_sci_do_xfer(info, xfer);
> > +	if (ret) {
> > +		dev_err(dev, "Mbox send fail %d\n", ret);
> > +		goto fail;
> > +	}
> > +
> > +fail:
> > +	ti_sci_put_one_xfer(&info->minfo, xfer);
> > +
> > +	return ret;
> > +}
> > +
> > +static bool tisci_canuart_wakeup_enabled(struct ti_sci_info *info)
>=20
> Add some documentation around this please.
>=20
> > +{
> > +	struct device_node *wakeup_node =3D NULL;
> > +
> > +	for (wakeup_node =3D of_find_node_with_property(NULL, "wakeup-source"=
);
> > +	     wakeup_node;
> > +	     wakeup_node =3D of_find_node_with_property(wakeup_node, "wakeup-=
source")) {
> > +		struct platform_device *pdev;
> > +		int index;
> > +
> > +		index =3D of_property_match_string(wakeup_node, "wakeup-source", "po=
weroff");
> > +		if (index < 0)
> > +			continue;
>=20
> Doesn't the fact that we're inside the for loop already ensure this is > =
0?

No, this can return several error codes if the property doesn't have a
value or the string is not found in the property array.

>=20
> > +
> > +		pdev =3D of_find_device_by_node(wakeup_node);
> > +		if (!pdev)
> > +			break;
>=20
> Same here? Would we otherwise be in the loop?
> Just having a quick look here, I could be wrong, please just check once.

The devicetree node doesn't necessarily have a device associated with
it. So I need to check if there is a device for this devicetree node.

I fixed the rest of your comments. Thanks for your review.

Best
Markus


--iknrznhvbakof7yi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd8KHufh7XoFiu4kEkjLTi1BWuPwUCZ3e3yAAKCRAkjLTi1BWu
PweyAP0eCCMETueAY2472nnJ1JUeNan/zvJZezmSWXmypz2RhAD/QAzMZDwM2l7t
7rD3gE58a3JET3KjZt288qTZzRLdyA8=
=UV6S
-----END PGP SIGNATURE-----

--iknrznhvbakof7yi--

