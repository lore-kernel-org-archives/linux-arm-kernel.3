Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28781CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IhEXhH0GzZkxVr6xhPi4zF+UYRepWWZmFoVPtiXnCQ=; b=rvX8xi6zZ11TgcJYwJ50x0zJZY
	Ea7VN3HlnTcb3DE1R+EcU82WotU426cIwHIWEVxvpWCmge7dCeyVRHLBC7wwmUjBTATBOBrvtGvnf
	wQQiDr34x6N1dDZHGMpaIwD6b/K1nwvnwEAS0FgLkPDy3at1EwtKHyoNABrOvW/09gIhslZhanYd7
	956DIB+KnGVx78PCYH6fCsZsDOHSWJmnx4BVOQls2IVJYJeY+d4S26ogUhK2IIyxLtwYBkOwutQvQ
	00hYjTvIaqs6WU1y0KlsPsiYe8Az50qxBY/aaXT7iu4dEz9zYxXZHCMpCKDDJSAyUjxJfIDeRPCTC
	IE6L3NJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8Cx-0000000GMlA-3t8H;
	Tue, 21 Oct 2025 08:59:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8Cv-0000000GMki-0A9a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:59:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47109187c32so25471395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761037143; x=1761641943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6IhEXhH0GzZkxVr6xhPi4zF+UYRepWWZmFoVPtiXnCQ=;
        b=KfjkqODztaDeCrSm7xZlIcQ/ZMNeC0VOtcPH7IUT1hTgPXRsPcVDY3g/H7PxXWt6Sf
         iGCJA4Io9nL4tn0tRJV7f+3y5Zjz3aDiIUCaCELX8rLiAb6z9dRITTMqxFGtAwlgKw3H
         pV4eNrQ0Ggynm5q1rjY68c1e5tbeT0fvsYSgpVESaDvKGMemz/lPb78Yhb8aznMgpiqL
         Xd8TMmhoXaUPN9+eUgbGUt/DwAPWil4lR07XM7/ETasO4KwFjA/tv4URMkzbp/RcSjX+
         qt2MMB36JiNIor7480t/aCouSLDJ0umehIWHav7NIBWiZKjSR/2rutPUyV0fRP0ePd7A
         RcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037143; x=1761641943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IhEXhH0GzZkxVr6xhPi4zF+UYRepWWZmFoVPtiXnCQ=;
        b=TdHCU7KcCsz12nRKYP4V99ImlBMTyHZrguKADMRfoBkcTYrk3VO1/6KEIZrllkBLsx
         ry2o74/zn4oghoc5KRfWCH0Yx5yXQuxi1owSgornVcERMsyTypfSvPZTsT6P0s3guzUH
         AMojAhmH8Q4dxO0Z0dtHfqHiSJQi0QX/4dLUk5+n9pPAQyLufs4PQR6rW9RwVoT+X0DG
         NOgV07UtEdYMJk5aUDSnjJFSe6LTa3f38yQdu5ZxgiyfuBKFbttp/s3/+TNOPWI8Cn2u
         WQb3BTv3EFxg0OTudPoQtVlFehwPh68+5bJgXRaXrK+fMiYTQ0m66mDUaaSCF6c1rvGF
         6Usw==
X-Forwarded-Encrypted: i=1; AJvYcCX0KZNn0y9fyW/vuHa4Pyd6qkMPOJbv0UTnJfDfNhh5z137KtCHu1pWfj6i7+R4LrPmCUOY+ojoXaXDMxtHU5YI@lists.infradead.org
X-Gm-Message-State: AOJu0YwnJuQ8IKEdahjqmfI6o/TJEo+jUscvY4FaTwJbWbgziTHzaZiF
	psZlyBMy+xo4IQGgMJqhEi1XTSO0zw8FAubjdG7z+vgxkWID9Zoztx+DgLxHHkm4UYE=
X-Gm-Gg: ASbGncuc3MWcFnK8iq2rKSX4wAoljUtu0KTLPX6i/clEtNQhl0/lEcs47ppqjJ/m4Fr
	b43MB92/IRFXqgyFl6AjdjefCKF0/dLwxcYmgTEKWvWTVR6WmPq1eD4U1nH8/D8mQ8Mv32qxTJ7
	dQ12F7AyBIPL4ImZtqpOZoFVogRGJRW1DB2FzyJ4Lc2BVnz042FTc52VOg92L+T4lt+bN0Ojupm
	VPgv256THyOMNptODkEE6QF/hItbRnRIFhhiKM7ksl7e96+HmZXzlLwqcuACf+YZ7WiQipbmTT7
	pFEsuTzh0aHwBhexLQRcz2+KmIg+ulF36TkR6m3Bf2A6Zf5zetfvKWd4IKHm5ftPiSNNfuLqkmT
	3TQdBR9wuaeC64a65xCe88mrpv5vh5fEyycT/SgMByQVJd1tejxgz4qrOJcYZJOjDr07jvyW8RR
	RCuVJ1eKKdi9394NwY3k9evSxsTv46az+/YEHqhhe2CTgY+u/H9/Hx
X-Google-Smtp-Source: AGHT+IEPcLd9/n5F1+QuIF7nieqqGGUi36BPkr1gfJfsN/uEgAe7OHzy0yVFsDSD/cg47SwqEIucgQ==
X-Received: by 2002:a05:600c:4e89:b0:46f:b42e:e392 with SMTP id 5b1f17b1804b1-47117931c1dmr109512065e9.39.1761037142883;
        Tue, 21 Oct 2025 01:59:02 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47496cf3b51sm11749855e9.9.2025.10.21.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 01:59:02 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:59:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
Message-ID: <lgse44as4k6fpzarztfnfl7wbxq2bfg5k7m7l6xlsyx23pmem4@khal3tytgwjn>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
 <cdkpp74ra2ltr7h46psutkwnzyvl4iegcicnhqqj7svm5trltm@w2egfj5nryjm>
 <7d3df04c482e71760ccc941469c99412b608c92b.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zf3jpk3mzmqfofqf"
Content-Disposition: inline
In-Reply-To: <7d3df04c482e71760ccc941469c99412b608c92b.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_015905_138697_90E96C3A 
X-CRM114-Status: GOOD (  57.90  )
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


--zf3jpk3mzmqfofqf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
MIME-Version: 1.0

Hello Matthias,

On Mon, Oct 20, 2025 at 10:09:29AM +0200, Matthias Schiffer wrote:
> On Fri, 2025-10-17 at 17:01 +0200, Uwe Kleine-K=F6nig wrote:
> > On Thu, Oct 16, 2025 at 01:37:30PM +0200, Matthias Schiffer wrote:
> > > The CTS GPIO is only evaluated when the CRTSCTS termios flag is enabl=
ed;
> > > it should be possible to enable the flag when only GPIO and no hardwa=
re-
> > > controlled RTS/CTS are available. UCR2_IRTS is kept enabled in this c=
ase,
> > > so the hardware CTS is ignored.
> > >=20
> > > Fixes: 58362d5be352 ("serial: imx: implement handshaking using gpios =
with the mctrl_gpio helper")
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > ---
> > >  drivers/tty/serial/imx.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> > > index 500dfc009d03e..4a54a689a0603 100644
> > > --- a/drivers/tty/serial/imx.c
> > > +++ b/drivers/tty/serial/imx.c
> > > @@ -1117,8 +1117,8 @@ static void imx_uart_set_mctrl(struct uart_port=
 *port, unsigned int mctrl)
> > >  			ucr2 |=3D UCR2_CTS;
> > >  			/*
> > >  			 * UCR2_IRTS is unset if and only if the port is
> > > -			 * configured for CRTSCTS, so we use inverted UCR2_IRTS
> > > -			 * to get the state to restore to.
> > > +			 * configured for hardware-controlled CRTSCTS, so we use
> > > +			 * inverted UCR2_IRTS to get the state to restore to.
> > >  			 */
> > >  			if (!(ucr2 & UCR2_IRTS))
> > >  				ucr2 |=3D UCR2_CTSC;
> > > @@ -1780,7 +1780,7 @@ imx_uart_set_termios(struct uart_port *port, st=
ruct ktermios *termios,
> > >  	if ((termios->c_cflag & CSIZE) =3D=3D CS8)
> > >  		ucr2 |=3D UCR2_WS;
> > > =20
> > > -	if (!sport->have_rtscts)
> > > +	if (!sport->have_rtscts && !sport->have_rtsgpio)
> > >  		termios->c_cflag &=3D ~CRTSCTS;
> > > =20
> > >  	if (port->rs485.flags & SER_RS485_ENABLED) {
> >=20
> > This hunk makes sense.
> >=20
> > > @@ -1794,7 +1794,7 @@ imx_uart_set_termios(struct uart_port *port, st=
ruct ktermios *termios,
> > >  		else
> > >  			imx_uart_rts_inactive(sport, &ucr2);
> > > =20
> > > -	} else if (termios->c_cflag & CRTSCTS) {
> > > +	} else if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts) {
> >=20
> > I agree to add the parens here and consider this more readable than the
> > alternative
> >=20
> > 	} else if (termios->c_cflag & CRTSCTS && sport->have_rtscts) {
> >=20
> > . Note there is no real win here. If the port doesn't have RTS/CTS it
> > doesn't matter if it tries to control the RTS line. While you could
> > argue it shouldn't set the line, it only makes an externally observable
> > difference if one of the SoC's pads is muxed to its RTS function.
> > I claim it's more robust in this case (i.e. no uart-has-rtscts property
> > but a pinmux for the RTS line) to control the line according to the RTS
> > setting. This is (at least IMO) better and more expected than driving
> > this line to a constant level. So I oppose to this hunk.
> >=20
> > >  		/*
> > >  		 * Only let receiver control RTS output if we were not requested
> > >  		 * to have RTS inactive (which then should take precedence).
> > > @@ -1803,7 +1803,7 @@ imx_uart_set_termios(struct uart_port *port, st=
ruct ktermios *termios,
> > >  			ucr2 |=3D UCR2_CTSC;
> > >  	}
> > > =20
> > > -	if (termios->c_cflag & CRTSCTS)
> > > +	if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts)
> > >  		ucr2 &=3D ~UCR2_IRTS;
> > >  	if (termios->c_cflag & CSTOPB)
> > >  		ucr2 |=3D UCR2_STPB;
> >=20
> > Hmm, not sure. On one hand the same argument applies as above, but on
> > the other if there are pins that are not explicitly configured but still
> > in their CTS function this might affect operation in a bad way.
> > Also this affects the (very usual) configuration where only RX, TX and
> > RTS are used and CTS is not. In this case have_rtscts is true (right?)
> > and then if there is an accidental CTS pin this is bad and not fixed by
> > your change. Hmmm...
>=20
> I think it makes sense to always keep UCR2_IRTS set when have_rtscts is u=
nset,
> as otherwise there might be two separate CTS signals in the accidental CT=
S pin
> case - the hardware + the GPIO one, both affecting the UART operation.

With that change you break setups that have an RTS-GPIO but rely on the
HW pin for the CTS function. Not sure how common that is, but in this
case you only want the first code change. You could argue that in that
case have_rtscts should be set, but that's somewhat fuzzy.

> If we keep this change (the 3rd), the 2nd should also be included for
> consistency in the code path where I just changed a comment - there, UCR2=
_CTSC
> is set only when UCR2_IRTS is unset. The 2nd and 3rd change together keep
> imx_uart_set_mctrl and imx_uart_set_termios aligned.
>=20
> >=20
> > So in sum the 2nd and 3rd code change is controversial. If the first one
> > already fixes the problem you're facing, I suggest to go for only that.
> > If you still think that the 3rd (and maybe even the 2nd) change is a
> > good idea, I'd request to do that in a separate commit as this is a
> > separate problem. Also the commit log only describes the first change,
> > doesn't it?
>=20
> The commit message describes the first and third change; the second is in=
cluded
> to keep the setup consistent. I don't think these changes can be separate=
d well
> - the second and third change only affect a case that couldn't occur with=
out the
> first (as (termios->c_cflag & CRTSCTS) && !sport->have_rtscts would never=
 have
> been true). My suggestion would be that I extend the commit message to ex=
plain
> each change in detail.

I'd still request to split the patch in at least two patches. The first
code change is to allow rts-gpios to work at all. The two later patches
change details about how HW pins are controlled in the presence of
rts-gpios

Best regards
Uwe

--zf3jpk3mzmqfofqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj3S1IACgkQj4D7WH0S
/k7Z8Af/cWYKmLfxl83DzxoQYDzAkl5mc0eGGuFSd+935aXR3UXsKCXljIplfmlo
73v0Jo4EYPsEco0YCWBDGKPINHThAqK3lhrsirCAUr9BakxqQIjdBYMTk4QBmGWT
M8x1wYdlUr4u0qotAftYkNkQMrcJyGft6Esgw3OcYTdI/mXhvWs1abPlt8C5aUHz
/pC1rnJcUfjcMpHmiJ1foMw+p4qv4LtoJUveI39CRpVcroqA4pLrsux/9bTkyTvw
dZDtQ/bWgkC08BU7FXOPF/8oE9vKtKLjMUQfHvxWyaAG9nxnEWhJQ/8JYVuFmqk0
9PDRESuEIsEEFaFupc+7hBuznu85PA==
=sWEK
-----END PGP SIGNATURE-----

--zf3jpk3mzmqfofqf--

