Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D1CCE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=df4TNSGzSNKm0QFOAhtHpnlWhy9nagHU1mwVeiJhueE=; b=PO6epbukedlHMC7tsNqPZ8VdNx
	h49m+Pk667z2MzRjy++gDksaDlkcrDIxb+XeIZGwD4KMxI8ZYVDXxS27600ZwdtsfDDFRh+zl3yIb
	KI+H+fGhTLjZODQVksokI17v3pdeipNr6Wi0NkVCvVTV66YKnmLU/8l/cCdSN1KFDGb47otcJTRAd
	GVdEN7TlwDWPnwH8ftvppc3IoJGooRa/kwzjQccWUpySwhsyWA0Py/Vf5VZWXiICxcCWsgpXygwby
	SitpaVS+L0nBJaU6J2S/WzSzCoY/hTZV6x40dPKdLVzBl4i5jr35Xr8jLnylEwufxusd5JopR2CD3
	ShNIbBEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41vp-00000001L2P-1SjL;
	Thu, 24 Oct 2024 17:47:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41bT-00000001HQD-1JpX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:26:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d58377339so891110f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 10:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729790789; x=1730395589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=df4TNSGzSNKm0QFOAhtHpnlWhy9nagHU1mwVeiJhueE=;
        b=EJfDekMs5gqO3nJhMEO0cLiA3ilaAEjpcUsCohCAP2+p9/YADn6p0O2wG6LKvJyH9e
         4bWxgOu/kcAh/5lURXEnbLs6TQAIARUNAvgjAL9QQ+tqX33vd84N5AeS7yR49WZACSKD
         N+ohOU7BtBnEI1hA4NIpfwDh5j7y7XN4Tlx19aX5CFv7+dxWxiIqYLMvmAgZp+6AeWiJ
         fZLaN9ZWcsKyS2iqw6MiI/g7eixdCmiE0sC9zKBVAv+gbm0mnCG8UlNNmAxHuoCjH1cD
         N69HUyiMs15l5/ig6RnXQRh1kQLQjmGyjwjdDAW4PZyfo/3KzRVjl/h5f52DSjoN26yB
         e0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790789; x=1730395589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df4TNSGzSNKm0QFOAhtHpnlWhy9nagHU1mwVeiJhueE=;
        b=i7RDDZa1ck0Jer8Q+FmIgOy2028/0WO/+sYHckklBcuq74kDaGLMV8cB389WFdpkGd
         kht3kaSLOWhfM9LSa6yTyG05PgC5Nh/AwFFdAs32kxUlrbvVzimxozHgTYSI8Bzjw9Qq
         m9eCEoHNi7zYGn5khqlB1D1Xyy2S1Wa13VOZ6aNctBE4Tvn2VstkfVNZRpDAVXDDdRI+
         /hG1yhgBQWrTdMNk+WxLkycleevkF5PKYpJKqxRMEliuOSdNjnVWnt008eI6kYeraF7Q
         04gHOkzSKbAejOOTHNAbFH4v4XrRMTjmbxGOv/5vGRNgiE3Wc0F2qQz72U33QcqTbur0
         Reyw==
X-Forwarded-Encrypted: i=1; AJvYcCWBJJvBbyLTFkj4oMjV8+xGtb0wmFjwM27lp4o+6K11jgCuoZvNT9bF8e8kSxPgd2kVqy/57DXLrasN7V8yvX5D@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFIQvna39cLfga4uPEe9PdQht84QLXtabkTnLS3gWVbZ6HHFn
	r6B+NGiyDy4HL6/T9ooRhLFDNgwrNofxfQBHNDHjq+jSb8XZxv5fsTfzWz+szYM=
X-Google-Smtp-Source: AGHT+IERuGJIotkBPQnG/sDjxSCMdboz8SG9EaUnlFwZt5gyjZXzk4XrIIAOtG10KxDOLzg+kXRQFQ==
X-Received: by 2002:a5d:4cc3:0:b0:37d:46fa:d1d7 with SMTP id ffacd0b85a97d-37efcf91b9emr6075835f8f.57.1729790789509;
        Thu, 24 Oct 2024 10:26:29 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bb15sm11814624f8f.99.2024.10.24.10.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:26:29 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:26:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, 
	Michael Trimarchi <michael@amarulasolutions.com>, linux-pm@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Sascha Hauer <s.hauer@pengutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pmdomain: imx: gpcv2: replace dev_err() with
 dev_err_probe()
Message-ID: <4vws5lnu4efupunha74pdlgtd754w6n2loymgywrxhwm2rqic2@gz4efozdrpqm>
References: <20241024103540.3482216-1-dario.binacchi@amarulasolutions.com>
 <20241024110123.wix35njjbh3nx7kn@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ow3mz7ffba4wu6es"
Content-Disposition: inline
In-Reply-To: <20241024110123.wix35njjbh3nx7kn@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_102631_377820_3013FB94 
X-CRM114-Status: GOOD (  15.62  )
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


--ow3mz7ffba4wu6es
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pmdomain: imx: gpcv2: replace dev_err() with
 dev_err_probe()
MIME-Version: 1.0

Hallo Marco,

On Thu, Oct 24, 2024 at 01:01:23PM +0200, Marco Felsch wrote:
> On 24-10-24, Dario Binacchi wrote:
> > The patch standardizes the probe() code by replacing the two occurrences
> > of dev_err() with dev_err_probe(). Indeed, dev_err_probe() was used in =
all
> > other error paths of the probe() function.
>=20
> I assume that this paths aren't using dev_err_probe because these paths
> can't return EPROBE_DEFER and therefore dev_err_probe() would use
> dev_err() anyway.

Note that dev_err_probe() has advantages even if the error code isn't
EPROBE_DEFER. In this case it's mentioning the error code.

See also commits
	7065f92255bb ("driver core: Clarify that dev_err_probe() is OK even w/out =
-EPROBE_DEFER")
	532888a59505 ("driver core: Better advertise dev_err_probe()")

Best regards
Uwe


--ow3mz7ffba4wu6es
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcag0EACgkQj4D7WH0S
/k7z5wf8CJItP63PC6N/D5K9sQTx0ydliUNv7dA1lUSVuiADSLncCZVZu3zmSuiZ
6Ta9uxNeZuOyJSAtq5mXX70s8vNrRycm/rYxPoZNvvB62ZHQOyweWF0f0Ce1AwGn
keWSqZ3/B9mNSgtSqmyEi3HHcx61NbjjO230wOBvNKfUElyL4ozrgbzFv2qbLZYF
Nt5xFEoEQiw0riAk7lgyOazrA/6D5ZyJ60YZ5AdifNXgDLfU5OkRmpVh4/eOGKD0
x/Rn15dujV72q8n+ZyXqyifZUbnGVTXYWnNzNwqwcPT/y2ESWjPMC6uyeUwiEMuo
xHEVQMNz7SHRR8PmDEwbI/fmJdDOjg==
=kHdL
-----END PGP SIGNATURE-----

--ow3mz7ffba4wu6es--

