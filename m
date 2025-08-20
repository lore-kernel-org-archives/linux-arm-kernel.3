Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24E0CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 21:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qj64TOB/5TJyA+F8gnbV+C+TIwj10ue6VgL1vNx3FS4=; b=JpEp83KMXEl+4Hbt+MydwgG4CL
	J9X1tHTa5VRBJ209cjIvzRD+qtGPjyJA1P63aBGljnVxd2jxCxK8ppFSFV8MD5bEj7cF4zajstTat
	JOXwhC+UEAxpHwTY5nNufL7BNmYZrarKfndQdV1WIZtx2BDtY0HnTf28uUYqEc6Fh9LXg8XAm5Y54
	t3rY1DGB1DSUZ+xybzE/geoyu85P+JO5YteUpBwm5EWwERwIoApGIjOa1i/4oF8n5baZJqgZkSCvG
	SwannKrcihv/OWAeI+8YfhffgXMzsf26OvTviQvvgZPfQwy1omuTJ9muRWkx2Ap1PlqUHNq5E7PT+
	XSP2q5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopxW-0000000EwaI-0ZmF;
	Wed, 20 Aug 2025 21:03:02 +0000
Received: from bues.ch ([2a01:4f8:1c0c:6e7f::1] helo=mail.bues.ch)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomLG-0000000EUZd-2CbH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 17:11:20 +0000
Date: Wed, 20 Aug 2025 19:08:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bues.ch; s=main;
	t=1755709874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qj64TOB/5TJyA+F8gnbV+C+TIwj10ue6VgL1vNx3FS4=;
	b=P3Ix/CG+bKZ8eCztNYX9NEzGOCjh+CB2q4tOL5YeBo77KZbDF0nesLo0UQkBq2PFEdFptx
	7zlWS/a5OZIIYrA9U+JcHkT43UikkDhSYnSB5jfzuS9+q9jKViYj2mvgRdrDWhnGcra5pT
	KuQd5+auScDpYTQDxekTeZa5BMSI+AbEW7T+4VMCptcEueWSKxPvLL8UFLBuYL2B03wtvy
	8TAI/XLQ7J22VTHzPPKYoEF0YeuAXIREtK4oFPeF6yPj9IjVK3WlXoZsxWFLukuQFm5Ndf
	mnTOs5b2AV7Zp7BfC5xJ7ze8LCo5AjtqhYaY+Wxx94n2KcOQHdczTnwR1g9K3g==
From: Michael =?UTF-8?B?QsO8c2No?= <mb@bues.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, Hoan Tran
 <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, Daniel
 Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar
 <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli
 <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux@ew.tq-group.com
Subject: Re: [PATCH 03/16] gpio: bt8xx: Use modern PM macros
Message-ID: <20250820190842.4e3c07ec@barney>
In-Reply-To: <20250820154037.22228-4-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
 <20250820154037.22228-4-jszhang@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jlj+UyB8B0l7lUKjchj3xEt";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101118_715023_EF6A94AE 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

--Sig_/jlj+UyB8B0l7lUKjchj3xEt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Aug 2025 23:40:24 +0800
Jisheng Zhang <jszhang@kernel.org> wrote:

> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>=20
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Acked-by: Michael B=C3=BCsch <m@bues.ch>

--=20
Michael B=C3=BCsch
https://bues.ch/

--Sig_/jlj+UyB8B0l7lUKjchj3xEt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEihRzkKVZOnT2ipsS9TK+HZCNiw4FAmimARsACgkQ9TK+HZCN
iw53uxAAytnVanFnDDU72bYeydk9D/FlxnSQVlQplGz9Sv9WyFxKGYqow2qKqyDK
AWlZAd4aMCkopCnzU53auLsQ47ye5gWiWtNpCysbLDY7U/iL6+cdKAvgJJBaf1fI
hXEfKAvUQq8bjhSxfhxsbVa09xZGG7UEUhE5/dzRdsr4oK2F90PfaHwqMyiYibmf
7kKpf3XYrBJTn7WAsIetWOx2NKglt8GWVpPCg9AqY2r6QbfAfKeqBi/qPEGRurFb
zf0qtLTxoYUUyJti5aH0ClYQ0kZdB5HvOY3mIX4cP0ncLEE+kIoyHCtJjV02jgcA
N2fza9GRVEG0adwvSP+iehkbQgKJpl5QifdS59uHmchgyV3ZorBLtrlKoeeVNohr
DhbkJlrWH5qr9cmH2+mNE344zODtaL+nE5hg8Vc7hC7Mx0K4SrKebHNKlce//7bM
RCkxTbZdQ4R2Q2nP/Q6cQlwps86kiveI3zRQYPldRNBzHZSGS7cTDRKGkTJoh3F6
flGSi32S7a0v7jfJAY+hM8HKgyeMGu9FZawZVwmGBS6wQIbtLL+cDFjMW1HND5eJ
bEQ5UOeRpFaLh4Czw7fvLPNVUFajyynwur5gFuBJns01Amdp5XlFf5I3c87x1IyU
2vgv+kA/wr+dPwpJ5b2ZobRzUbBrsoYm1yOauIhH28EayNHHGII=
=hcGT
-----END PGP SIGNATURE-----

--Sig_/jlj+UyB8B0l7lUKjchj3xEt--

