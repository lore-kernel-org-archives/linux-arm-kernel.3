Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC75DCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ML+fhGCtqrS6nYIK3KHsCQErHIIB6z1uyNGHrfcGFy4=; b=j2ErePPQa0d9Rwz9TBQx88MiWN
	N9Fh7ExSW66uj1B3aYvbK2cvPy0gSsmjT/H/iQgLQA7lJaL1hSzqslnfoNEFjWDnp+W6mGZ+7i42S
	aGfPu5s87rzIKEIrDpxyEIi3wCUZyda4z0RIoHwc6S//Te1I//qabLbLtZUwBakcOjei0KphVOof1
	qyH1/CoDRZ3kOBKTOND76FBWGDkDh52u7vEqTVlfiCV/tmKc/2TObKc7XOsTN8az+THVtNvnbLuwE
	G1o/KkUZS07h3rbt4TeiOC7jWDtnums2dM1KQwLCMuFhPXZs3pzkWHlM3r2Mqp3ceVOK6aEEl+OJF
	xw79jMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOspd-0000000EgHn-3wTw;
	Mon, 18 May 2026 07:56:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOspa-0000000EgGc-12t9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:56:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so8168075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 00:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779090964; x=1779695764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ML+fhGCtqrS6nYIK3KHsCQErHIIB6z1uyNGHrfcGFy4=;
        b=emChw3Ske27k0hd9vQZerYEOE9iBY8QAJcdl8tSkRIH8dkggIl3dJRccfyE0zIEHpt
         KFf74474RNaUJaSjyeWWZdERAzAG5GNmWSIq5JdVDEmD+9GC8qDryohZjwlSa3bbXsUK
         xRIbjDa7jaLTUtKbS33b2AeXsNFz1/sUeg4CVZ97pALZIfdAxekGK2suHlw0GKBbVVjn
         2uNrUfKOZfkgaAfzfomsdtUAE3AjnZuSit0EuFRQLX7Xu1aY/YGbjw8uVHNm1EKEDKfL
         mVr+5piNocXyBYyzQVzq7m5Ftvu1GbfdDsUvbTMvULbdrXuX5DN/zwmAgn6eF2upjw7p
         /CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090964; x=1779695764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ML+fhGCtqrS6nYIK3KHsCQErHIIB6z1uyNGHrfcGFy4=;
        b=cJ5smHlD5Pgc8KbKjmIrt214dIsWF7uqzBcB2Me3WcTlPQUcUAcCED6NoOJV4gBhg4
         5W5BULIbvFJc+MIg7recYXiUqStm9aZVNWjCuSF0tLn79jBgvofZIg15gDEf0paSRde4
         Knq4ipkRT28bW5vpIagmsMbWX8AH7DonzwMKjN5VKJ2DlyitWhRUqmX3dPl5tysBQzKe
         MEHXdKnszP45Ov4jcEUQqA3Qvx8UZ9GXepceVhscc9CDzcjchDgsiPwh8NNsEAIYEo1h
         KgRwOCQJUlZUuvuNbaR7w6wZYI8+YjAjzyveON1S/w1sLLmsciilPhc0GMf0SCn2MiIH
         Ga6w==
X-Forwarded-Encrypted: i=1; AFNElJ+oi7KEtS3PL8MVT5TPM6xItXDYIBZpJ6V5JTUXhl1AJqj2MdLS17kl60HyJ9fJUjrbGTxtmlL/9BgIwzycePPJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu1cxYsoJ1vJwZ7ip/JvGFHtGToPRTfDnjUE+NSA9vKxN3uIeX
	XCAUPL9Z8iRCyXU+ITCGXNSSGK1uvKz0s1GCK3Vk8gFVoMsa5XmENK6iW7+qtISju/E=
X-Gm-Gg: Acq92OFdDJgdNLqZD6u6dZ+s9zSWIbNb6Mxvs3NKuiHBk/RVmfNudxV98ghXWy1CUps
	ue3FiO/9KiCFZYCkMtvCqaW053Hl8YeY+MLC8S1YsnhIiB8UF1XC+6mgEybAq3uQyzDaUToFsRF
	N1IT2GPTZs5Y32tBnVPqYDKS59WJbOwpuKL55lGd9I/r8x8MJw1nyv+fsRrYqum5FxBIuRMkwOI
	7M/vvhtCBAhRjIF+wUm2RrzTxti69H9Ise2edwUokBmTq+5TK98ulHmEtnvFng+Li5ZDD8EPxgZ
	Q7xDSOMydIJhWnuOrvKaBN2MJPtG7ZepXklIZJpiPG9fzOA0s8jdFeoudYQTWVkQaYe3iQ1kYeC
	Rkm+pFmfGF+5dgblDs9b44rkOdfNFjVh5SOyfP9UE7M2iHsBlEeUs9C+FuMwjzXgUA1a/KHeKdk
	WWsIvUJmT2+tozH+qPs/4hATpZ++J+kzUZQKOuT0zU+gnLrGaxxz+DkhA8ALoEbsCVmOjIg/OeS
	cxBj4TkRgFABCcfDSw+9Tcu2m+EYLmp/Qp8
X-Received: by 2002:a05:600c:a406:b0:48a:599a:3716 with SMTP id 5b1f17b1804b1-48fe651487emr168781505e9.23.1779090964101;
        Mon, 18 May 2026 00:56:04 -0700 (PDT)
Received: from localhost (p200300f65f47db049367b55fc4056f2b.dip0.t-ipconnect.de. [2003:f6:5f47:db04:9367:b55f:c405:6f2b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da15a562dsm35387139f8f.33.2026.05.18.00.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:56:03 -0700 (PDT)
Date: Mon, 18 May 2026 09:56:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Anshul Dalal <anshulusr@gmail.com>, 
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
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
Message-ID: <agrFDLaPu1nnLIN4@monoceros>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
 <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
 <agrAG3cLjEAPV90B@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ledpsosxjgbf2xjn"
Content-Disposition: inline
In-Reply-To: <agrAG3cLjEAPV90B@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_005606_560406_CCAA556C 
X-CRM114-Status: GOOD (  22.12  )
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


--ledpsosxjgbf2xjn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

On Mon, May 18, 2026 at 10:30:35AM +0300, Andy Shevchenko wrote:
> On Mon, May 18, 2026 at 09:24:35AM +0200, Geert Uytterhoeven wrote:
> > Hi Uwe,
> >=20
> > On Fri, 15 May 2026 at 18:48, Uwe Kleine-K=F6nig (The Capable Hub)
> > <u.kleine-koenig@baylibre.com> wrote:
> > > My additional motivation for this effort is CHERI[1]. This is a hardw=
are
> >=20
> > Nice!
> >=20
> > > extension that uses 128 bit pointers but unsigned long is still 64 bi=
t.
> > > So with CHERI you cannot store pointers in unsigned long variables.
> >=20
> > Good luck fixing all implicit assumptions about this in the kernel!
> > Also, good luck convincing people to use uintptr_t instead ;-)
> >=20
> > https://lore.kernel.org/all/CAHk-=3Dwj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVL=
MXHe7A1d-g@mail.gmail.com
>=20
> Yeah, I believe Linus will have a strong opinion about all this CHERI stu=
ff :-)
> But let see, it might be surprising turn around.

Yeah, it's not yet the time to start that discussion, I want to have the
patch stack in a better state before that.

I think the strongest argument will be that

	"unsigned long" [...] is an integer type large enough to hold a
	pointer.

just isn't true for CHERI.

Best regards
Uwe

--ledpsosxjgbf2xjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoKxg8ACgkQj4D7WH0S
/k75XQf/fJBvg+bkcjF1RD9zN6ORGpW8MCPpjekC79O2A1nW+vWJClXaxkKullcM
RNcA6S+Y0Uw9HmLHEkyScdB1VYiKlnOw/gzCrSTCR9JK7CYN1rKq99EoMheR7+DD
uVa7Rai/eEhJYIh7vpBfGS/QtapI3qrJCb9hfOrfkP16by8BWbMcqFzUpGd9CBPh
pb6E63QmhOxL3fyFRcnpEzRCgyg3eTVKynQ+7tPmH2cU7leNveZhBkWfkLYDJWgM
a6K+Do5D2xWle5UGHlxxgWvA3SdTvGEXpIXWD2JM67KsBrmKuAVx2Oxzh7rYfORT
A1krybshSByxRK8iPTzSCW+n+EBR/A==
=/va5
-----END PGP SIGNATURE-----

--ledpsosxjgbf2xjn--

