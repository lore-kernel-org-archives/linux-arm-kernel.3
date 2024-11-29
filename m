Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10924D729E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8ZduSCXx+T9t862mFfTVamD3ZvIyVqH4xZpWXNHI8s=; b=W8U3T1H+nAJWAQfAiWzl1bGfQO
	hU6txNrA8XeFtINrWT7yf6krhQWwpKESunUbrtFP37M/XN10zLQCTs7wA6n4ARXtTWXb48Cl1hlwX
	Qej6LUqUNBHU5agsYxPhLJRSP0YSZ9YVZyTAdn6pc4ty6/QjjrG/rfZ/2D8IUydlSgJPoQD7E6z3g
	yZEQhW2RitE1ON5TjhEWnD33z68Uk/7ZbwSRicHlI+7AM0YA6LYUpK3I7PYPf+svVbgPlTiRbGHBh
	ZNrzMMuVXFIyxFGF7HtgFdyrTmqoqA1athteqdSaYW6uc6fMj0OiWTcAL3tRZmDozLOa37ToDAiRI
	D+N/HLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH34u-00000000U4V-42ax;
	Fri, 29 Nov 2024 15:38:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH33w-00000000Tsp-1Vba
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 15:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8285F5C5737;
	Fri, 29 Nov 2024 15:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D866C4CECF;
	Fri, 29 Nov 2024 15:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732894663;
	bh=B8ZduSCXx+T9t862mFfTVamD3ZvIyVqH4xZpWXNHI8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5DSdd69wrziYSI7Y481XqxoGe44LO/arqKa2tz4/uZFMGslQMfwZC1ZLUPGewepR
	 emsKb9hU+gqOKFa7psWcnFDLQVKphFIyFeKdAY1ybWodFsP4U0GB7i2v7r4H7Sm/hn
	 hxv1gNulM2xM523moMfb5WFLHD5NppVHUiSjGUdwPPgI9+6xcRhr/vleHLxOhGXbF6
	 P35JKxGiDY0elKcnuplnPDyikTsOgnAtNls3+myOBdRYrcFXC8/A/g5NSO21gHJDBL
	 gFXSGPOwQ80eRItrGdyeE++p/V1Y1cJ6j8kRzFzxgqK/teDjw4rXLM3J4E2hi7abtR
	 /fbSizfWvVL5Q==
Date: Fri, 29 Nov 2024 16:37:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <20241129-amazing-whale-of-proficiency-ee6fd2@houat>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
 <20241119-vivacious-optimistic-squirrel-a2f3c5@houat>
 <ZzzdT0wr0u1ApVgV@collins>
 <20241120-wild-stimulating-prawn-ffefb7@houat>
 <Zz20dquzl5_2_3TQ@collins>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4fudffiqskytk6s2"
Content-Disposition: inline
In-Reply-To: <Zz20dquzl5_2_3TQ@collins>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_073744_488734_CBFE183E 
X-CRM114-Status: GOOD (  24.90  )
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


--4fudffiqskytk6s2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
MIME-Version: 1.0

On Wed, Nov 20, 2024 at 11:05:42AM +0100, Paul Kocialkowski wrote:
> Le Wed 20 Nov 24, 09:01, Maxime Ripard a =E9crit :
> > > > If anything, the status quo doesn't impose anything, it just rolls =
with
> > > > the hardware default. Yours would impose one though.
> > >=20
> > > The result is that it puts a strong limitation and breaks many use ca=
ses by
> > > default. I don't think we have to accept whatever register default wa=
s chosen
> > > by hardware engineers as the most sensible default choice and pretend=
 that this
> > > is not a policy decision.
> >=20
> > You're making it much worse than it is. It doesn't "break many use
> > cases" it broke one, by default, with a supported way to unbreak it, in
> > 12 years.
>=20
> I think this is exaggerated. Like I mentioned previously there are *many*
> situations that are not covered by the default.

Note that this statement would be true for any default. The current, the
one you suggest, or any other really. The fact that we have a way to
override it is an acknowledgement that it's not a one size fits all
situation.

> The fact that I'm the first person to bring it up in 12 years doesn't
> change that.

Sure. It does however hint that it seems like it's a sane enough
default.

> Sofar the downside you brought up boils down to: badly-designed
> hardware may have relied on this mechanism to avoid interrupt storms
> that could prevent the system from booting.

It's not about good or bad design. Buttons bounce, HPD signals bounce,
it's just the world we live in.

But let me rephrase if my main objection wasn't clear enough: you want
to introduce an ABI breaking change. With the possibility of breaking
devices that have worked fine so far. That's not ok.

Maxime

--4fudffiqskytk6s2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0nfxAAKCRAnX84Zoj2+
dk7LAYDGqN4+FFKYNkVeh8uBncZUXNq1+3hQGCVKth0yfd3qHhn9VImj9CLuhxpe
0uuZEIkBf18IaV+JYJMvpW2AWpLOCDfVa5A+SLz6MGRXBt8mhAfrxGWV/K10P8XN
7auTbJcbqA==
=P+2t
-----END PGP SIGNATURE-----

--4fudffiqskytk6s2--

