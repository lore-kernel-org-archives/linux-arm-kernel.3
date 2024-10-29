Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA3ED2AB08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=; b=lacfYfLuIuXFQInfARnBkcnWMz
	Yd+z7Wz+/YWow1rcNAL5Z+Wc+XZcjWwVTXaDm8Y2ddo7Pz0sq3uwFjyxsS9yyI3GIAHXL+/N8i1rt
	MzDiK0nZrtgChxFrPgzc+gEOTtRTWtZobHWXrfGzynTx+FVL6yeSAJ6sxTdQ1ksvj2dGpvsQFbKyl
	i9aRKXCg+3bz3oHrI3UpMhcRfSNaBNdU+4tivDx4GIVDV0rDAEm4aQ9xdfub+1/+qGjpq+X18xW/w
	D5yESuIEmYVPW+oYTNZ8+9puZlaZMPYAQnTcEIlXOKcGVy7RFpxBi9SiDd09H4rQTaH1EoLYj4M8B
	1t8S9eZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iTg-0000000DsSU-305c;
	Tue, 29 Oct 2024 09:25:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iRr-0000000Ds34-3psG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 09:23:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so3506774f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 02:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730193813; x=1730798613; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
        b=Qz7GEsYl/co2SgdOy06LwKUju6EKbzNYr7a1cPAotrEZnrMqi+muvGfiGOVhj2/dKD
         tujmRbatUcXvRWFwPI2vPsY9BBWWlEPl5JP08pYQaJ4ElaZ1LC9RmHeoA1CYfx1YcHVA
         yxFepRm92tHNoJheD4Nvwco55Jn7Z8FjNd/QFM0QWrX2yVtF70mntsk8Cppbrh5J/tpv
         tK0cQ5w4jOGmbBw6j+/vGwFp5IAQCPpooxoAUyok/9cOuMvKI4dfbB1WuvrfDuOUFMgB
         h+1HvBSX1cAg21QY/1D7I47gYljUbXuSuU3Bj6OohT5hMa2X9e8VpyYvqEJVBuxrldEM
         pB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730193813; x=1730798613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
        b=IDlMZzYsw4m304Mc1ttOnmZjlttTWgiEhOvhnCKWdZu/im6+cQc88d9qojkSvQPKkE
         ewAfnpJIX8LSlMXz1yB/KsTlGuwFM9gCvhA7jO9yuqKff5o4dcY8ADGNKWF/HgfohHFL
         TeCz7tQNAf+qlaZ+3ybExWOuumkUy9HN2BRS7/Tz6UyswJh8836dDCyXflXowX2u+3W3
         TaNW6T/pTSosMFQDYuB3S3fqy4vgLF3EEOOBqz+4lJMp0BC+5Jdc5o/juQ5m3L/t/lpD
         OeXsBdJ8pjs1HCsxmbTgOqmt2Rh7dXckUhc5CVBP70VBe877209G25Jt6uI+s/9HwA2B
         nDaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfi95blKDE/yqSES4XHdPrFw4TygnOmraQ2ZowMr1eDF9H6cNic1QYvZztEKKjrad0/lsKwbTREsR0T0w9etw4@lists.infradead.org
X-Gm-Message-State: AOJu0YxUP5mscIQT/1hZlyiQI5df5t4xdh363dpI+U7eXQwhy/2hGS70
	JBcMX4YyOFeb0MSLuRpHrsXGjZuZUIUTHcwmUhRdd/VNdKj6igi3Xh0d7ffbNvM=
X-Google-Smtp-Source: AGHT+IH1aaCnWxJ+190B4X3rRtI27v+kXSCMfEXtrprcgTAAwyxSHjsuSln+B4lGQpKN2Z0UMJ9hgw==
X-Received: by 2002:a05:6000:104a:b0:37e:f4ae:987d with SMTP id ffacd0b85a97d-38061159141mr7795045f8f.29.1730193813087;
        Tue, 29 Oct 2024 02:23:33 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b71479sm11836108f8f.69.2024.10.29.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 02:23:32 -0700 (PDT)
Date: Tue, 29 Oct 2024 10:23:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
Message-ID: <mr7tjtqtmblum57yirmvfhzqg5rhyqdotlzn6kvjk4nlixyqrn@uyne6x2vefp6>
References: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
 <8734kf2sa6.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e4aa3yd6q5uca44q"
Content-Disposition: inline
In-Reply-To: <8734kf2sa6.wl-tiwai@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_022336_126491_CD93A32F 
X-CRM114-Status: GOOD (  27.87  )
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
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--e4aa3yd6q5uca44q
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello Takashi,

On Tue, Oct 29, 2024 at 10:05:21AM +0100, Takashi Iwai wrote:
> On Tue, 29 Oct 2024 08:37:47 +0100,
> Uwe Kleine-K=F6nig wrote:
> >=20
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> >=20
> > Convert all platform drivers below sound to use .remove(), with
> > the eventual goal to drop struct platform_driver::remove_new(). As
> > .remove() and .remove_new() have the same prototypes, conversion is done
> > by just changing the structure member name in the driver initializer.
> >=20
> > On the way do a few whitespace changes to make indention consistent.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >=20
> > I did a single patch for all of sound. sound/soc was already converted
> > separately, so isn't mixed in here. While I usually prefer to do one
> > logical change per patch, this seems to be overengineering here as the
> > individual changes are really trivial and shouldn't be much in the way
> > for stable backports. But I'll happily split the patch if you prefer it
> > split.
>=20
> It's fine to do this in a single shot.
>=20
> I suppose this can be applied for 6.13, not necessarily to be merged
> for 6.12-rc?

Right, this is not critical and I consider this merge window material.
6.13-rc1 is fine.

Thanks
Uwe

--e4aa3yd6q5uca44q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcgqZEACgkQj4D7WH0S
/k7PTwf/RuQE2So+Bj2/unZ19jDNVY04i3Yaa0IrSvWShbO7Nv/nsVzANSVA6jUU
RRVMKI8AUoBJfFn4R+ZodJnwtjckrihdYHVIBnfB4krigFCmPCydnq1ANy0qMX+E
EbsWx9Q49q5Q7IQayl1BQA/PzL0GzKAase8VT+A9VlrJ5EHgz06aeEJtZTwutQKK
Q11L0Y0rkv/9abSCq1eyEDYvISb38m8iGr9J2iY7gAWVVuUmEkMqR816qixk7n2m
kPdT7cDib074IgZeN0ir30E+t4pT+IsIEDaelPwGia+A3iatvvG/D65jcThdIC9D
7GxxrOXjxiYz1IZcAJwESz+aYyScmA==
=w7Ha
-----END PGP SIGNATURE-----

--e4aa3yd6q5uca44q--

