Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C34D7831B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qu1R/kK1qfP1c9hhleo/yXfnQOWc2/8uzcTJyQ0tTSI=; b=nvJiy88Q6ZJOtMH13Caxjs03JQ
	6HGMMXsZiqtZvxWeJbuk6FxX8mKNhLYQXaQhTdlNSPGoE8IeEQ6becHMRMtEd8VkIXjvWt1o9yCrX
	1Zl2uGDI3HX7ce4zE6/n9BuTAiEKzHtQ+G1AQcXL3/QQ29E0n4xxsSrOgpu4/HP12pFKlTt2fSxcM
	ji8Gi2XCu7U83d/oYp9goKt0BTatj7MhY44MuTwYDUwBKGH1zMc344AIChJWIJDPIQrKopo6AkEcL
	E73io23svCciCDZ5TS26GdiVd1wSRIELyhIuvBmNPNh8OP2DuGRm6JyZToFTSvDTARpIQ7haCH5cs
	tyOofJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6QE-00000006EVU-1fTq;
	Mon, 02 Dec 2024 13:25:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6PC-00000006EKG-2mWI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F436A40C3F;
	Mon,  2 Dec 2024 13:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B96C4CED1;
	Mon,  2 Dec 2024 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733145841;
	bh=qu1R/kK1qfP1c9hhleo/yXfnQOWc2/8uzcTJyQ0tTSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=calzYjdHtzyKjS6MKp04EUDD1P6auKh3QqnwpOwOQRMmMm2+lbdpsnBugzXskk9Pf
	 c+tbr1T6AHkJsUbGx/F8rSNXXNdSPn6QZIJOZSPwNiDoI6YuYyvUGEbaZ4GQYOFwJk
	 lFx7mBecy+YtXN+t5939kVaRjFsJ2jZuEzEFXWoGSzAjWDjt38IpQ3fbgp1OdmHoAr
	 ZQUMYqN1pWyeOAJUJ/O9Xv0nlfduSG3IXJg3NjsZkilKJZwa/0ObRSJF1mf8LWrJlX
	 KXwcjqSoOqbK9iMICfGR4dRk17jyCsiY5fRTRIfBWbraY71ZVkyxbhp8JTaKY+vc67
	 sYJrK2+wWeH+g==
Date: Mon, 2 Dec 2024 13:23:56 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mesih Kilinc <mesihkilinc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v5 1/3] ASoC: sun4i-codec: Add DMA Max Burst field
Message-ID: <a59c5425-4401-480f-bf26-a7d607071f75@sirena.org.uk>
References: <20241102125712.2647325-1-csokas.bence@prolan.hu>
 <20241102125712.2647325-2-csokas.bence@prolan.hu>
 <fe02df7f-16ae-4128-9af8-7de7f76734bc@sirena.org.uk>
 <47344634-9681-43a0-995a-f7dc025d1d09@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TUCIIvv8937S6Tht"
Content-Disposition: inline
In-Reply-To: <47344634-9681-43a0-995a-f7dc025d1d09@prolan.hu>
X-Cookie: (null cookie
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_052402_762215_56143440 
X-CRM114-Status: GOOD (  11.52  )
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


--TUCIIvv8937S6Tht
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2024 at 02:19:51PM +0100, Cs=F3k=E1s Bence wrote:

> Try v6: https://lore.kernel.org/linux-kernel/20241123123900.2656837-1-cso=
kas.bence@prolan.hu/

> If that doesn't apply either, then I'll look into it, but it seems we
> already missed the MW for 6.13... :(

That was sent the day before the merge window opened...

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--TUCIIvv8937S6Tht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdNtOsACgkQJNaLcl1U
h9BxDgf/QXzdQ7mVZv9iRdQN5uXStSZy2H6trQtrAXTzaKsW7xWcEkqwPJ4EnnUk
wT+JiD6BWilmxjLtmCsaLWiZw3X7OxTaJjtGA0ySTfaIgpzRuRB5WWZr9xKipDXW
9F/Gs8yMot5PpUMVW1Ho6S3Ic9jktf3N95FstgEJo5GyyFM/UiFzxvunbk/zGjJY
wT0C9PkeCYTcG7bEoe20NY4whJu3MN1solOeO1F9xW8gwCYFdPBqfavB+cIdTjCf
alflkk1+6YqqnLbfzN0tHhEqNioVzlFg2qMGOXLC7cUg39DRh6A7FuC+0XxUqQUZ
hKItXmC9FyLoMhnP9wCZ3FvZ9qGn2A==
=DN0z
-----END PGP SIGNATURE-----

--TUCIIvv8937S6Tht--

