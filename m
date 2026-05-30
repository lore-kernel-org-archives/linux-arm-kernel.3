Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F2ECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgNiBxvAE0zM3QGPzW0VTokh/HeWsq2F7ow5cn6lSMc=; b=lt1QiC9Wf0okz7jHbRlZy0xd6F
	mdg3fKQrKtu4RHLt1b6/z51DRV6gJRW/rp7sFnWtMBA4H/qLk0qxgRvHKxMo7S9wjdedpTPjXOSMY
	nAATWkV/C7xMG6d97o8I3/6aPMLen/sFAuLGXiixMuMBoscPagvzdG/IpZjsrskafq2Y5L3Qflr+C
	Tn1GIEKGvbhnkALyjK4om9FMoqqDEAl3/lfurS2kCqy9pOFkMHCbyC3dwuWvZJZUahDCmah/FRsa2
	u2rCLfAEkxzk2H5H4WYjDXzhzN9nWx5si0BSNzMIDsgpUWpul5MZ7yws+6tPpe3nhQdM420ZIbFJK
	zeN7ozew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTIOb-00000008i9d-2t6d;
	Sat, 30 May 2026 12:02:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTIOY-00000008i96-1KXp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 12:02:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4906238c62eso65285565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780142544; x=1780747344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgNiBxvAE0zM3QGPzW0VTokh/HeWsq2F7ow5cn6lSMc=;
        b=PwIzMILS9FHdw44Waet+/qJg9W2l6OG4fIIwuHhZS/jpEV2CeKwHlXaF1giwVoJksN
         rcxvY3TbXvPNugPmlJsREKJFQk3wF0CK9mqTBLf1AIDUnukfYGamxW9PezN62WXSzzMt
         J/FkhxfZD6MXW7nWN/qQxc5AEONbERFk+SoTBF2nOpRxRL0EYy6T4JwwGmKzkkR+8A8J
         ASUuwJgHcCXQTWphAUJv0NxUQnzksWqq2SLfDqF6Nfy6TZJddICdTRc/YvfA4poBpPHR
         b/W7Bc90Jr9SLj2Hf/1lUajAWwujEaYf4EhM4WXm+EkMDdhQIyov5vCKzjBWUCKkhzBT
         gWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780142544; x=1780747344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgNiBxvAE0zM3QGPzW0VTokh/HeWsq2F7ow5cn6lSMc=;
        b=aQkHRVMW3sRlLakFzpLVKkFkadWM2gcTJKAHF43z4kDcYR+LZOueKht845RNPO9/hd
         kWiPcIiUlNY8By5Xw5YdDUTBWEdxGgQXBz5PbA3qWZ+N0+Q8rGWHsXxdCKZXmuJ2Ns5F
         Rcjmt5eDR6SX3hmgRG9j6T5zqZFkoHgolxMiis27AjRc0jtqgDkxDXz1cMo6sdcdZ2EQ
         kxhUXOsoaeCHxKtPmsZ90KiH3PtGD4IFtSEcGmb37BPtOsQXh4dFoF9Sg3GPdN9Hgdcq
         o3jIWKp+ky8iXwuRshdnHOiolXOAGAU4OvcjC7FB2JlXuw7sRg8SauU7Py7VYn7QdrWC
         Bnkg==
X-Forwarded-Encrypted: i=1; AFNElJ8/tyN1OJsnPIpRXii8JKdy9mb88HbwuijzIuMfXQWJPbnr0K7V6Qcy1CeBo3ySnG/J0cr3RRZ229yWxkdkcNeX@lists.infradead.org
X-Gm-Message-State: AOJu0YzQpiyCsyXHdDGOCipMAv6fmJAF0QHCjgspQ/7Vlhr3t4eqE0xJ
	fcp+HgRWJ8KoUcAtu4TVV+YIh+edrzHBXXwDXBJqoQRAFRR++4cNoyQJB8QhPMH/DaY=
X-Gm-Gg: Acq92OEtlkTK0eNasAG7+fE6ta74xJYCEIpr9OSdxtQ8YRpJPRqdmagvrdnDh65T5+j
	PjRIR3v/1Pjn/CfDhnW5V4UYPlGwHDTddEzBk+CAxRiANrhmieESxPn6IqFe4O8IlbLT7PHaaaM
	iJOpMjvp6Rh8wVWMOlBVnZhHHHOYolzTga1fHeRBhRaKBAdWiXfuU4nkjKw7UfiqaTfcqrGpBY1
	JOOpNWpMEU9P9LjOev6X0NjbxU6RL9nJ+ShJSJWuqpTaIvqMZGEskFTmWCXC6hJurpWFjIW/7Mh
	O4Kn+Pbw9lITDuS5SJ9tvy7SmLCX4XBM+LYo8i0C+pql+P7+3HK+JO/MOB8LUt7cfKDakdvI3GR
	Uptnov7nY7NzdFbRCu+DhS4lvORTR5ZRmKwsk1hJmlMd+NHF1cpSyAPEcU98rKU8ewR1iHlpp2m
	KMiH6jC3HORfs8ZAMayYSOqKOlfmAGq4sEBiLtzH5xspGUspimxA==
X-Received: by 2002:a05:600c:6558:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490a294b864mr44962555e9.28.1780142543403;
        Sat, 30 May 2026 05:02:23 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909caa7faasm103845575e9.11.2026.05.30.05.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 05:02:22 -0700 (PDT)
Date: Sat, 30 May 2026 14:02:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Anshul Dalal <anshulusr@gmail.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	Linus Walleij <linusw@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>, 
	Job Noorman <job@noorman.info>, Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Kees Cook <kees@kernel.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Yauhen Kharuzhy <jekhor@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Minseong Kim <ii4gsp@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Oleh Kuzhylnyi <kuzhylol@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Josua Mayer <josua@solid-run.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, David Heidelberg <david@ixit.cz>, 
	Petr Hodina <petr.hodina@protonmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
Message-ID: <ahrP4STTFdUsBp0O@monoceros>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
 <ahp7WuHiPYa7Q_pX@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5hgmmhirtt5ohzik"
Content-Disposition: inline
In-Reply-To: <ahp7WuHiPYa7Q_pX@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_050226_376350_216A6FC3 
X-CRM114-Status: GOOD (  17.85  )
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


--5hgmmhirtt5ohzik
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello Dmitry,

On Fri, May 29, 2026 at 10:56:48PM -0700, Dmitry Torokhov wrote:
> I like the ability to properly set up pointers for driver data, however
> I do not think we should use named initializers for name field. As long
> as we are not planning on moving its position I like the brevity of just
> saying
>=20
> 	{ "ili210x", .driver_data_ptr =3D &ili210x_chip },
>=20
> Can we keep the old style for the name field?

I have no strong opinion here, my patch introduces the named initializer
for both members for consistency. Note that my patches for all the other
subsystems (and also other *_device_id) do the same and you're the first
maintainer with that expressed preference.

I even sent a few patches that adapt initializers without .driver_data
(e.g.
https://lore.kernel.org/all/177932943265.3832404.360063047381979287.git-pat=
chwork-notify@kernel.org/)
that got positive feedback so far.

So if you're ok with having input differ in style from (up to now) all
other subsystems, I can rework the patch.

Best regards
Uwe

--5hgmmhirtt5ohzik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoa0coACgkQj4D7WH0S
/k5r2ggAr649aJrsJJlkFeVB/fh8+B5LDe4ym+MWA77b0yhq2eW8wormOagLI3cS
ZsKy4bfc4GPxEs6Hq4U1Xtb5rZQ4FZl0S07+51ZaYlq5RbMC/B/SVTiuASJVBVPZ
B4s5kh1AWRq20efV0vpGmMVkGWdWbbWfSDJ88TI8OoCIHy0LYFyBfz9XdnD2pdag
csvvcPKwLzXbvnQDsAb1CyMxa0P5xeJSgzH5Zq3dkY7GCsHzqv+4dmXzIRjgXwmE
F0tGpraE9YOlHYxoqXNfPa2xIKxihaRChziJOKNt3hN9BQ75tAHWpwEFGWDYHn8c
xpL0QD4yV6RvVsMilRsLYNC4h2ZaoA==
=umK9
-----END PGP SIGNATURE-----

--5hgmmhirtt5ohzik--

