Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92BAC71157
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 00:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urvg2EBUVSXLilCyfEaHeQbpskk5FRYN4N/flVkvV78=; b=0fggaW2OhlDduBWwVQ29U98Yi4
	aBDdhgn/cQJ+w9qwpk6Fde+x2mjPAUr22yT5F8GQWZdkosNeYMtwshiMNcK1h7yXs6hAbSlpd+CGY
	EWw5YyBnDvEhZWQO9faTWJXARpzgB/bOhraG6u0FjYwu0F8AgamQ+ZoO/czKU3xvJt6sakdGRzkvg
	uAN+W6kalc188ZqwTaWg009/gyGMS8vjGcDrVEJJckZLZ014LUYUTYEeiOzB1eW1S5aL9i84C1Iy9
	A6h/22+0UgsGEAwZFLCjr36DAfX/BMJktXH4h09iYsdK7h6j5O9Ya3LkIr/WKBKe1yJX2Llu3eyjj
	vk8xS2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT8xR-00000000Par-22J3;
	Sun, 22 Jun 2025 00:53:17 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT8vA-00000000PWL-1pwT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 00:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750553434; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nTaZPuxdEjw5EDw3tPF6Qy0HTEagp2m1aPmSyKRU2f+HJ4+u4ZC9f9ngF5plydcBC9kimI5uBnGvZW1ulzgKNnL3OTVtWFNbwWu5fIcuR2q571R50jIQsJVnfwvJRyo5awpB1R0KUQNeWe6IQABQCXGhl2E48HfHk3DK3Co/Mhg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750553434; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=urvg2EBUVSXLilCyfEaHeQbpskk5FRYN4N/flVkvV78=; 
	b=VMwG6vR1GWzzfCk+Cx29KkHCudiWzscFawcybcqqs6bzMGajtS1tj+BohE9OpogqjM4tnDrOnbkVmS/ssCvr4wn2nMO8ofiGtwuwVAOEyibWApOl3/OTLFoA8RT2+Bsy0iBJbPPGD0KhjBYciUTt84Qr4RPzxpaw6YzPak7nVfI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750553434;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=urvg2EBUVSXLilCyfEaHeQbpskk5FRYN4N/flVkvV78=;
	b=f+3EfA9yIO3WRuPNshg8xFVyn5cJqqTmm+HuH6SYP2wxA8YbGSB9NVhIfxv1Srqu
	g78eV9eGHUVlWk5ocPdAIe4R9O5qpDtklKq5fy+NKC4huRj++YXYgvw4q8DYOmHA2Vg
	BsJH1d6xAxvoJ1mU3nqshGz+Ejf3jcaht79PvMpI=
Received: by mx.zohomail.com with SMTPS id 1750553431554582.0728404463048;
	Sat, 21 Jun 2025 17:50:31 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 15EE4180692; Sun, 22 Jun 2025 02:50:26 +0200 (CEST)
Date: Sun, 22 Jun 2025 02:50:26 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sven Peter <sven@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v7 05/10] mfd: Add Apple Silicon System Management
 Controller
Message-ID: <pqjz6jyfsoaf5matffwsly7ba6xwbw5fsumokmpow6eox7vjdx@fbuxkcjjyh6n>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-5-556cafd771d3@kernel.org>
 <20250619114958.GJ587864@google.com>
 <f30406ae-90ed-4f81-9519-e6ae2dcc9e03@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xcojizk7w6niahmw"
Content-Disposition: inline
In-Reply-To: <f30406ae-90ed-4f81-9519-e6ae2dcc9e03@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/250.540.22
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_175056_551470_45CE2E4A 
X-CRM114-Status: GOOD (  24.38  )
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


--xcojizk7w6niahmw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 05/10] mfd: Add Apple Silicon System Management
 Controller
MIME-Version: 1.0

Hi,

On Sat, Jun 21, 2025 at 05:51:33PM +0200, Sven Peter wrote:
> On 19.06.25 13:49, Lee Jones wrote:
> > On Tue, 10 Jun 2025, Sven Peter wrote:
> >=20
> > > The System Management Controller (SMC) on Apple Silicon machines is a
> > > piece of hardware that exposes various functionalities such as
> > > temperature sensors, voltage/power meters, shutdown/reboot handling,
> > > GPIOs and more.
> > >=20
> > > Communication happens via a shared mailbox using the RTKit protocol
> > > which is also used for other co-processors. The SMC protocol then all=
ows
> > > reading and writing many different keys which implement the various
> > > features. The MFD core device handles this protocol and exposes it
> > > to the sub-devices.
> > >=20
> > > Some of the sub-devices are potentially also useful on pre-M1 Apple
> > > machines and support for SMCs on these machines can be added at a lat=
er
> > > time.
> > >=20
> > > Co-developed-by: Hector Martin <marcan@marcan.st>
> > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > Signed-off-by: Sven Peter <sven@kernel.org>
> > > ---
> > >   MAINTAINERS                |   2 +
> > >   drivers/mfd/Kconfig        |  18 ++
> > >   drivers/mfd/Makefile       |   1 +
> > >   drivers/mfd/macsmc.c       | 498 ++++++++++++++++++++++++++++++++++=
+++++++++++
> > >   include/linux/mfd/macsmc.h | 279 +++++++++++++++++++++++++
> > >   5 files changed, 798 insertions(+)
> >=20
> > This is ready.  Let me know when you have all of the other driver/* Ack=
s.
> >=20
>=20
> They've all been reviewed by the respective maintainers.
>=20
> I assume you want to take this all through the mfd tree and we'll need ac=
ks
> from Sebastian for power/reset and either Linus or Bartosz for gpio then.
>=20
> The one line change inside drivers/soc/apple would usually go through my
> tree and I'm fine with taking that through mfd instead.

I'm fine with the power/reset driver going through mfd once the
recent probe discussion has been solved.

-- Sebastian

--xcojizk7w6niahmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmhXU1EACgkQ2O7X88g7
+pp5mBAAqeYtgkz3ot6SuhXbvwuOhMII4zpE8jhfW1y9qUm85/HabSF/PRrM8fTX
mrOmos/ImxU32f83/mPZshVf0+mESLu/t8jEcfWUZp9OCDWwIP22zJ0BScizgWpg
d6vfEd4K8zdCjpEwNTmghrqahi7gGfapSzfpOGoZ7yLnGSp19rWdfG8CvQ4BI6b6
EIy+2XySeO6V2n+fGt/78Td4+LVQ8k6gm6B/9/grN5WP2OBC2KwTSAsmieBXXpCD
GBT911zqqYpJ3wfaSndyeztq1sOfKH6feAYTbCKjlz2frvOG5A+0A2nRLD4UXvCW
JQmbyzwj7d03GFgqOIa95RyYZL2C0H3gdw1ZV+KO5OCGKIHWcrbRGsUnU0gzSyQj
sRP6gLNKPNXeIgcvTBVNAiuy+NA/UUTzovImxl47hAO1jfbqjMc4rGYZVGwqYevJ
szl41k3EmNjCU+Wb7Wm3xoQLb7xhjPBd4CbZBBnxJ9Zq6aRSTgyHPV6Q09/X7npU
SJG9k/V+dqhpRWtSyhJVsQ326oWDeNatp5iSKU+ZCaLN3QI+7ouH0pAi/MPlpeoq
UuK9iVt2lITPAvuHZ07XKQUHjxa/5tir3DpJJP2WAVPQM/n7ejypyXh/SHolX8G8
M5BUD7E9puP4hgXS8ETreeIi0UlYz/STD6ck27xMFk8yVIyyyik=
=Yc2m
-----END PGP SIGNATURE-----

--xcojizk7w6niahmw--

