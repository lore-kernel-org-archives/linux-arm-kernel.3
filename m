Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338E5FE5204
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5gTkcH32uD+Dsajybdo76tx0SOK3NMIQVQJNVoC96k=; b=qh6ffPsqE5Jkt0i74TV+5LLoa6
	jwcbjSdVcgsgstLNEqUGnZ9Tb3vVo697v7CcUBXzXknMD5eDdRdjMd7OegKIEaxwknKNglqyiwInc
	gG0LtkFI1A2iQoMUN4tLJyOmCmjVSRi0CVGL4HRA1sQJ1jTOB/zPIW/cKHyYSqOAndJch5ykFPUMr
	uItdiVCYqBdjktAR29xh4qhJTWKUDZdtNXK2j3xfwbFpsDG4lhJ9PRc4/hnRFt8CNaM4pgh62r+eA
	Ycn1XDzui1WQMVeDNyBKZ0/OqS4Zeo/LSinzUt+CqkCSQ58cS4gemmY9JJHhLf3UXm+K8Cf1Exeud
	GXIIiZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGE0T-0000000D3Ap-3XPy;
	Fri, 24 Apr 2026 10:43:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGE0T-0000000D3Af-0Pq4;
	Fri, 24 Apr 2026 10:43:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 388096001A;
	Fri, 24 Apr 2026 10:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2B3C19425;
	Fri, 24 Apr 2026 10:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777027411;
	bh=kknDDv9TuvxwgtonleSpBC/+VyXVDvyX2AE+3GnIAw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDMQHrfzRkuh92o/aG4I5AFMn1snndSnL+7WSnv5nef9ruDSGgGHKYWXEj7SPnJRm
	 LY24+LVI4JMn1/V+jz/EXg2ysR8wksLiEdHrEs4oDg2Sg77Yv95DdREYTz1A6MHlbm
	 zahdprpJZ8p9EDrFlUBQYhcXq4HLG3Th+yEgwKzPFS4yBqgKcaW0Hsg5UewY116SPo
	 /UW4PgZfJUoJBxnt0rZHnVuSWp1AVHunPk5zviLN7TnXoiGy9WO8r5RAPu5LgZ0YNi
	 yt01acpjkuo++DRtrv2I/a5YrVDa3/WsYv1ERETrMb6GtLkE+eGYnzouqLWZH2mPGZ
	 x4CrRrJbSwWVw==
Date: Fri, 24 Apr 2026 12:43:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Damon Ding <damon.ding@rock-chips.com>, kernel@collabora.com, 
	Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/6] Add Rockchip RK3576 PWM Support Through MFPWM
Message-ID: <aetFgdIUlDG0AiMn@monoceros>
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260421165656.168fe262@jic23-huawei>
 <dB_doorKQsK5TdJ40Tv8Lw@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nqpklusenoeywtel"
Content-Disposition: inline
In-Reply-To: <dB_doorKQsK5TdJ40Tv8Lw@collabora.com>
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


--nqpklusenoeywtel
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 0/6] Add Rockchip RK3576 PWM Support Through MFPWM
MIME-Version: 1.0

[Dropped Jonas Karlman from Cc:, their email bounced for me in the past]

Hello Nicolas,

On Wed, Apr 22, 2026 at 01:31:14PM +0200, Nicolas Frattaroli wrote:
> On Tuesday, 21 April 2026 17:56:56 Central European Summer Time Jonathan =
Cameron wrote:
> > On Mon, 20 Apr 2026 15:52:37 +0200
> > Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> >=20
> > > This series introduces support for some of the functions of the new P=
WM
> > > silicon found on Rockchip's RK3576 SoC. Due to the wide range of
> > > functionalities offered by it, including many parts which this series'
> > > first iteration does not attempt to implement for now. The drivers are
> > > modelled as an MFD, with no leakage of the MFD-ness into the binding,=
 as
> > > it's a Linux implementation detail.
> >=20
> > Just thought I'd point out that as this includes the linux-iio
> > list sashiko took a look at it.  Quite a few things and at least
> > the first one I looked at was valid (a dereference before a validity
> > check)
> >=20
> > https://sashiko.dev/#/patchset/20260420-rk3576-pwm-v5-0-ae7cfbbe5427%40=
collabora.com
> >=20
> > Whilst this tool does generate some false positives, it also finds
> > quite a few things it seems us humans fail to spot.
> >=20
> > Jonathan
> >=20
>=20
> While I'm not entirely opposed to this, I do think reviews should happen
> on-list when possible. Sashiko is a Google service, so it has about a 50%
> chance of still being around in 2 years time. One of the benefits of the
> kernel development workflow is that discussion going back decades is still
> accessible.

I mostly agree to your point. A possibility that I would consider
compatible with on-list review is looking through what Sashiko found and
address that on the list. Something like
https://lore.kernel.org/all/20260420204647.1713944-2-u.kleine-koenig@baylib=
re.com/

> The reason why these aren't posted to list goes into the other thing
> that I currently am not stoked about, which is that I'd have to act as
> a filter for a Bring-Your-Own-Brain noise generator to pick out the
> parts that aren't convincing lies.

I didn't look through the complete feedback, but the part that I looked
at (I'd say the rough half) seems to be legitimate.

I'm also have reservations about AI, but my (little) experience with
this one seems to show that it's in the better half of the scale between
helpful and useless time consumer. So when I come around to review your
series I will for sure look through their feedback in more detail. That
means that if I'm too slow for you, looking through the feedback
yourself and addressing that (or deciding against it) might be a good
way to spend the waiting time and maybe even making it easier for me.

Best regards
Uwe

--nqpklusenoeywtel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnrSU4ACgkQj4D7WH0S
/k5RbwgAosunTIJtGGwUzsLZV8Zw2wd/vePOh4BvI6BFVJqacUQI3GU2p7tDClfB
CdyBjNdiFYBInb1IzLr2sBOr089SEgf6BzpuZn/ZHATI8hGw+ZeAUkJDfVkeJtno
qRd6UZuLbzftwQqGudASQBbgc4/mTSqFC9kL7GriORrJ3FJNhtZdoLfUpglbCP65
G6q2RWvEGqhht5UMfc7cjUk8l67cMru0ctOP32tzCQVBXGpZdbM3cBdcs8ZtBwN0
KouApV1mbrQhFVXtvCPFTYTosXBb+rsRnq/mO8UWBeOVboAxVASK9PhP1eHJgutn
Tk3r77pzRnSnrSTnagBFPlKU45DHOg==
=/p0a
-----END PGP SIGNATURE-----

--nqpklusenoeywtel--

