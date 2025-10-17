Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52650CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSuJ0ACXse9H5YfB3aq/7dIEkglg7Np8q6vNe0vp/Qg=; b=H345dQW/HvXRLFsoF0MOVMGmFn
	rYxb8c6+FIG8T9V4QEDTh8iQFtKtJmRpcRvaTVxZGXdF5GXaxM53hT979wlPCZ9rodbaVLDuDwWuX
	Iv8EQ/nowx8VlzBQKkJGL6w8Uo3P/dol52p2xKgPqb7KAfwuvafgAwplYQoYmUR68JPWj1yctK1nW
	TSlzxy/ZxS1q07tKBn5KRxLm1d1KoR/WCMxfyWVP0xPLxN+RoB6QDweE/z8tQ6Q2GJNmATpWnOoJ1
	O6mqm1AjvRYgJk5rJXx+NqtZfCer9YVKsM0t1S/jSWENfBzbwepNptGAakGaz6szauvMfHkHGMHxj
	1feCT0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lx7-00000008C7r-3czu;
	Fri, 17 Oct 2025 15:01:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lx5-00000008C6R-2v41
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:01:09 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-63c31c20b64so1078824a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760713265; x=1761318065; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSuJ0ACXse9H5YfB3aq/7dIEkglg7Np8q6vNe0vp/Qg=;
        b=LoPdvP6PBhbApT32t6wq+D3KEELJn0hlGUAdys+HLIPN1LGU+VOGOMz6HmD1MX5zui
         jXjQZyoOp8pl6FElySW7SFrHcU3xY4NsNsx+qfaAwTj1SoUWhBltUfpA9vmBY9jzyWrQ
         lMWh1mu5hZ3r6LuLaIzkczsamLRd0fFqtEkP8Ot4IR1oHX9vA9quqP27w9n+P0cF5W5h
         EVqdWt5u0eIQcTkELVHyxjmerrulN70sDMA5fHtR8Uuu6en396EJyjhcJgGbkrc8+ehY
         +33FHmdZtULGl7W97ROECWAYPpIlNnNaAy0lWhULD4R/HHYE1if9QHciYOagurz3SS2L
         6sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760713265; x=1761318065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSuJ0ACXse9H5YfB3aq/7dIEkglg7Np8q6vNe0vp/Qg=;
        b=w0VIDzMt57CiMkqr+TuJLIsFqKDcN8khKZzmdigbf9e5nigAzA79pBBLcbob2oqRu3
         j4efuWI14tvl/GLqXjNPubenws568Foond0zKWRe7RD9VGKwScdcMmma6YeQhIS/bWxF
         F6YVIFbl2acLpmaHHDmQxXctxvA7Uj/eFFwQjW8StLeYOgafwEYgNxiUKH5zUOf7LnEc
         uzuJD7YUD3H5lvmg4LkqHJ57jrw3Jy3hKsZUOcat5xmYxhElomT/ZmAJioreo9iYi8YU
         PToQXENQI3TjdVeorNMehAGt9kVUraA5gske8eJ/LMdOIZsFXMyY2KuWKmvcYv3hxyh/
         LC3w==
X-Forwarded-Encrypted: i=1; AJvYcCVAnJ0diuXhR8XFhh41bvCypGlyLYipCNS5pqb0k/FURhyztgmHWTuEDch8UjTBT1RdvByOaB7kjRLsiww1fU35@lists.infradead.org
X-Gm-Message-State: AOJu0YzUaPqlhfjn7XqMsBSbCMpWWirT0nP25yruwJ/qNhtiDz5NhkaY
	eNpji/nEjntoE3jlglNO3LTZz02Nia0A32kKB/8dN4G1ss5DWyc7FEALicLM1remF8Y=
X-Gm-Gg: ASbGncssiBqiD7wXERwZXSeygf9eO8ZEwUicrh+rxijXb9YHE/OHxpQ04xgnVNJMvMc
	ICpix85ZjaS2TYJM5LBiIqQiHgMvVBnc5dNcyO8TixozqhGnASd4NKCZD4lH/hE2AS7vkdsUamS
	lT1+E+qRhbnL9aatsfxRIjA4GgIQxSX3Nbjc3SbVwLoauUPU8YwQ8JuwvWmye7LP47jEQHUg1s9
	v0Z5M/JTigPEHz7RfFD7bfuQXTO8wX88wCmlyXLS1xiNUplrOCdQ22jHqhumzrSDNOTf8Reh+y8
	2zOP66QKGALKUv7sCmUmheRuYZ8oA9flZpJgcG4aia/z2FigQT0/oedf7dSj43qR0opPKO+PjP3
	TR3tVDvjZThIIKHEARBXz8XbsqbUXgWbnNskvVDcX1wDF2VPtdCW7qAVAn++zvw43sDLvAtm+Kc
	PT12SmXssVQErPmsI=
X-Google-Smtp-Source: AGHT+IFDFe/2+iyA5FeI+RGuDLZ1H4kJaebU9REAfIID6sqcvriuQNr4F8M74Wd8OLwWVRFHd3xISQ==
X-Received: by 2002:a05:6402:84d:b0:63c:4537:75c0 with SMTP id 4fb4d7f45d1cf-63c45377875mr654360a12.38.1760713264992;
        Fri, 17 Oct 2025 08:01:04 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63c0e77b34csm4048961a12.16.2025.10.17.08.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:01:03 -0700 (PDT)
Date: Fri, 17 Oct 2025 17:01:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
Message-ID: <cdkpp74ra2ltr7h46psutkwnzyvl4iegcicnhqqj7svm5trltm@w2egfj5nryjm>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxlujyqvbxqnez6y"
Content-Disposition: inline
In-Reply-To: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_080107_761247_C381AEC3 
X-CRM114-Status: GOOD (  35.94  )
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


--nxlujyqvbxqnez6y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
MIME-Version: 1.0

On Thu, Oct 16, 2025 at 01:37:30PM +0200, Matthias Schiffer wrote:
> The CTS GPIO is only evaluated when the CRTSCTS termios flag is enabled;
> it should be possible to enable the flag when only GPIO and no hardware-
> controlled RTS/CTS are available. UCR2_IRTS is kept enabled in this case,
> so the hardware CTS is ignored.
>=20
> Fixes: 58362d5be352 ("serial: imx: implement handshaking using gpios with=
 the mctrl_gpio helper")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  drivers/tty/serial/imx.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 500dfc009d03e..4a54a689a0603 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -1117,8 +1117,8 @@ static void imx_uart_set_mctrl(struct uart_port *po=
rt, unsigned int mctrl)
>  			ucr2 |=3D UCR2_CTS;
>  			/*
>  			 * UCR2_IRTS is unset if and only if the port is
> -			 * configured for CRTSCTS, so we use inverted UCR2_IRTS
> -			 * to get the state to restore to.
> +			 * configured for hardware-controlled CRTSCTS, so we use
> +			 * inverted UCR2_IRTS to get the state to restore to.
>  			 */
>  			if (!(ucr2 & UCR2_IRTS))
>  				ucr2 |=3D UCR2_CTSC;
> @@ -1780,7 +1780,7 @@ imx_uart_set_termios(struct uart_port *port, struct=
 ktermios *termios,
>  	if ((termios->c_cflag & CSIZE) =3D=3D CS8)
>  		ucr2 |=3D UCR2_WS;
> =20
> -	if (!sport->have_rtscts)
> +	if (!sport->have_rtscts && !sport->have_rtsgpio)
>  		termios->c_cflag &=3D ~CRTSCTS;
> =20
>  	if (port->rs485.flags & SER_RS485_ENABLED) {

This hunk makes sense.

> @@ -1794,7 +1794,7 @@ imx_uart_set_termios(struct uart_port *port, struct=
 ktermios *termios,
>  		else
>  			imx_uart_rts_inactive(sport, &ucr2);
> =20
> -	} else if (termios->c_cflag & CRTSCTS) {
> +	} else if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts) {

I agree to add the parens here and consider this more readable than the
alternative

	} else if (termios->c_cflag & CRTSCTS && sport->have_rtscts) {

=2E Note there is no real win here. If the port doesn't have RTS/CTS it
doesn't matter if it tries to control the RTS line. While you could
argue it shouldn't set the line, it only makes an externally observable
difference if one of the SoC's pads is muxed to its RTS function.
I claim it's more robust in this case (i.e. no uart-has-rtscts property
but a pinmux for the RTS line) to control the line according to the RTS
setting. This is (at least IMO) better and more expected than driving
this line to a constant level. So I oppose to this hunk.

>  		/*
>  		 * Only let receiver control RTS output if we were not requested
>  		 * to have RTS inactive (which then should take precedence).
> @@ -1803,7 +1803,7 @@ imx_uart_set_termios(struct uart_port *port, struct=
 ktermios *termios,
>  			ucr2 |=3D UCR2_CTSC;
>  	}
> =20
> -	if (termios->c_cflag & CRTSCTS)
> +	if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts)
>  		ucr2 &=3D ~UCR2_IRTS;
>  	if (termios->c_cflag & CSTOPB)
>  		ucr2 |=3D UCR2_STPB;

Hmm, not sure. On one hand the same argument applies as above, but on
the other if there are pins that are not explicitly configured but still
in their CTS function this might affect operation in a bad way.
Also this affects the (very usual) configuration where only RX, TX and
RTS are used and CTS is not. In this case have_rtscts is true (right?)
and then if there is an accidental CTS pin this is bad and not fixed by
your change. Hmmm...

So in sum the 2nd and 3rd code change is controversial. If the first one
already fixes the problem you're facing, I suggest to go for only that.
If you still think that the 3rd (and maybe even the 2nd) change is a
good idea, I'd request to do that in a separate commit as this is a
separate problem. Also the commit log only describes the first change,
doesn't it?

Best regards
Uwe

--nxlujyqvbxqnez6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjyWikACgkQj4D7WH0S
/k6wWAf/UxQyG6kZ2TILhgdrnIpfu84pODWejTX1lzvAjT7/3H/Qe8pJrRoNWf8e
/iwaPdvVerhKNiekWTz4KPUE1rm7ITBLj3fwndHy/K2BNnZngBzXt+2s+WQ+fd6f
hDZA/hvU5mimICspF0a1ZR3zFWD4VbcMqTrjs2nwFjikC77fJQHXhFAQDDt6vz1w
nOWQ4ls8DPTKU6X3ELQRiExg1Vts1gmcP4IVr9NMGtwbAmchL0brLh+mgyYRv063
enP5ezJ8VX2IV9/vb1yeSRMxN38bdLvRhmvImYwgALWjR93kiH5kbJkoy9r13fDR
oquet7e0kA4duMdCrk/t/iT8vcR4hg==
=8RNA
-----END PGP SIGNATURE-----

--nxlujyqvbxqnez6y--

