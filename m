Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C134D10380
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 21:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVeHxFOlpm7vmwFphRpkxStlmC/W0v5aNc36nSPpWmc=; b=pBg45ZJW4AakRBNTekluTWzMxy
	g6+4CNC3VenTbyWkHR17gkxP5Jdw4lkIC7ns4N5q4wgCrnuUfovDvjOzZu7jrUc0A1d8EjuAP8ME4
	XHUNDuLm+2KEFb097i1Bx7iKl+La/xy074QV/DvYCEdXW8fZDk75PRZv8gVFsz2oWtFYlx6QChoZa
	zYlyC217K8+sJ21D5NebRnfnOd7cKlAaj+S1KcVGpuoaoQi4NQnzSLtLInyXKthaspgM1t/3qQIPI
	q84z46ejnhz+J3Mzj37tPiYojXPfq5XhOu3Rb9CmuLKU9yYxuhNvDr2nVuL9nLyoc8fvdwIEFRS6o
	GGerlPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t459a-00000001qfn-0M95;
	Thu, 24 Oct 2024 21:13:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44xc-00000001o7c-1N88
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 21:01:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-431688d5127so13869575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 14:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729803694; x=1730408494; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vVeHxFOlpm7vmwFphRpkxStlmC/W0v5aNc36nSPpWmc=;
        b=JYqjuGOGdxNVMOmrmHeGFpPTUhYlPwxhPI5ZXhx4LgVRCpJ+6vqdFZTewB9Lz/HHHx
         528croElHkQ50xgF44ALjC3OuweCbCpFT3AhzRh6Ul8NtBK+vfZyjmPRvrxEQGAJpQa+
         WZa3A9EWTFd7LHuihb10GWz1flXJWlQSOLr45hmDpkHYRtZ5b7awxtC4IOa3MYPQ3C4e
         7FjNUTXENORqcJRNMdJ5MOJOwpvZ1j8fUaCFgU/31aJS1lQ0TAHiMMez5BjP7qPIRZ4P
         y3hRDryKImqjrHwp7m1X40U3J9SXXvddszVcG9uQhZZ1eQFa2auF8GnMSFqQUkZt2XwH
         dDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729803694; x=1730408494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVeHxFOlpm7vmwFphRpkxStlmC/W0v5aNc36nSPpWmc=;
        b=mrVNQ7u6QALyalLEOydy+DfydpBpz+UTx+gmfLZkaw8Z7qhz31WDxGnFZfcJ1ybBhy
         AaYzd8DxGWIa8n5nrGLlDBtzDQ2JSJBfsjayBtSDOEo6j8NylsRYWgy1LXciJAj2MJfz
         xMwB9RYOn4RdWA6zW5DNfWs52IrmpTG+1hXYb1w9mkoIqL0C2SxbZn9WwHIz9qogJPtZ
         bO4lWO3LCdcYfg2OVLO820WFENZoFTa0w6Zrt7RuSfcmo9rhPr290SXG1xg34MKoGA6l
         Ghdx1E3VHRhrLZtlap4wealLQlp7jV+COHhFjkFq1zxP0o/N8ta4JlAftiCj2esRB0H9
         wTmw==
X-Forwarded-Encrypted: i=1; AJvYcCXJFszPXSEMt7WgPzfV/fC3+4nqPzoGkY7Or6Ei0OzEMcXxNNxOMnBUonK4JUO4nKA89iV/XPiADrqCWUeMT81C@lists.infradead.org
X-Gm-Message-State: AOJu0YxNFWYa2pkekmhPeYkZGPvkrSiV+89HJETdijAQsnLP0hWTxVv3
	3FYSaays09N17X7mEU7KsHaONHeW8WAi1czVG4U78OSqeI12Paq7sJTLxbuDHHM=
X-Google-Smtp-Source: AGHT+IHGL2Dd1tCBiG6JOVa+iPPOY+Ojg8AJron0OjLTDMAI3qhPj8i7GxizFBH7+p2Vte+JfMZqgQ==
X-Received: by 2002:adf:f80f:0:b0:37d:4956:b0c2 with SMTP id ffacd0b85a97d-380458f2712mr2168793f8f.58.1729803694102;
        Thu, 24 Oct 2024 14:01:34 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:b203:5494:7e5a:8c7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37b7dsm12123329f8f.24.2024.10.24.14.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 14:01:33 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:01:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Erik Schumacher <erik.schumacher@iris-sensing.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH v2] pwm: imx-tpm: Use correct MODULO value for EPWM mode
Message-ID: <wqjwdjqsjn5yngbkdpbinwtonxdpugy6n6nide7fcodhpto4hh@7yxigtrvvu2n>
References: <91bfd0c1726d2e6d10c96a3f2e141a7315b08467.camel@iris-sensing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vghwwyw4ni4jtc4u"
Content-Disposition: inline
In-Reply-To: <91bfd0c1726d2e6d10c96a3f2e141a7315b08467.camel@iris-sensing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_140136_395266_21FC4059 
X-CRM114-Status: GOOD (  17.20  )
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


--vghwwyw4ni4jtc4u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: imx-tpm: Use correct MODULO value for EPWM mode
MIME-Version: 1.0

Hello,

[dropping anson.huang@nxp.com from Cc]

On Thu, Oct 24, 2024 at 06:41:07AM +0000, Erik Schumacher wrote:
> The modulo register defines the period of the edge-aligned PWM mode
> (which is the only mode implemented). The reference manual states:
> "The EPWM period is determined by (MOD + 0001h) ..." So the value that
> is written to the MOD register must therefore be one less than the
> calculated period length.
> A correct MODULO value is particularly relevant if the PWM has to output
> a high frequency due to a low period value.
>=20
> Fixes: 738a1cfec2ed ("pwm: Add i.MX TPM PWM driver support")
> Cc: stable@vger.kernel.org
>=20
> Signed-off-by: Erik Schumacher <erik.schumacher@iris-sensing.com>

No empty line between these trailer lines please.

> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
> index 96ea343856f0..a05b66ffe208 100644
> --- a/drivers/pwm/pwm-imx-tpm.c
> +++ b/drivers/pwm/pwm-imx-tpm.c
> @@ -106,7 +106,7 @@ static int pwm_imx_tpm_round_state(struct pwm_chip *c=
hip,
>  	p->prescale =3D prescale;
> =20
>  	period_count =3D (clock_unit + ((1 << prescale) >> 1)) >> prescale;
> -	p->mod =3D period_count;
> +	p->mod =3D period_count - 1;

This looks bogus if period_count is 0.

Best regards
Uwe

--vghwwyw4ni4jtc4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcatakACgkQj4D7WH0S
/k4v5AgAoynsE1256Znci8l+VfnrzUQeRlgpkK0Dq4OS63K/RlHB1OdCuHwilJ3l
bblW1Og6wzb8hW/yic+otowhI+bH5gN7w4g+c2r/ktINgpKRQjAgg6vr0QGcfjj2
bHVxUoHZDyzwyfWT7bcDQcjp/Zm52nvCCdqe2e0247fKvFeXIMLOM2965MqHrpH5
BP23T5KLr52w1wz9OatP3YMG6blO9o2V+5qnzDo7qzs8c5vWRpwQWoS8OzEzJplQ
B1ldjt5+0A2exi6m0WjnNjt3YcYLbvCgrEt6TGuaYCHRoq23t+gDfofAQcpx/BLi
iY7/d+uS99AvcDUkbIQHNxk0M8i9Eg==
=HA4T
-----END PGP SIGNATURE-----

--vghwwyw4ni4jtc4u--

