Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5CEC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 01:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEw+Ox0DghdKeZ8X4o3noEp8fzw25Y32JHB4BzY58wA=; b=OHRvUeZsNqpJVy8sPntw8YLD+u
	kNzksZIAx1c3dL6ZbCBc4u5hxUvQFSxP1jTm72qw1EExJCTtgzafowCkA0GvOeBNZfa0Ixzfm0Gfe
	gvy9+cNfYAB6hDX7paqKMfcTuVia3b6tkpeCuMYJ89LkOift6AtqxZ2bTdw//zaGQpEBVgf6aKIVM
	ePKU8J/nd8QnpYhifNObVKtW66oq68O+urS6qDL/Js+J84zK9RSKfKXs3hrmTybVVs+W+5yMATSQ3
	IUnZqadXg3+82X1SOZTQ/gr9dZLC30ZVwhd0b2lhKVcjHgPWaao+rWc61ObKkEfCxeLnK0uu21sGO
	F0oxHJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1D9N-0000000AmbZ-0XTI;
	Tue, 01 Sep 2026 01:18:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1D9L-0000000AmbJ-30C9;
	Tue, 01 Sep 2026 01:18:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C1F38601DE;
	Tue,  1 Sep 2026 01:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2511B1F000E9;
	Tue,  1 Sep 2026 01:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788225534;
	bh=VEw+Ox0DghdKeZ8X4o3noEp8fzw25Y32JHB4BzY58wA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EXTX43n3Mp30tiy8dMe/16L2DfBWjbn9CXvP5TGjW6VYhMZzLqXGV2KCjnNf7G3c+
	 EzAgGHAubJSyCedCpY9KUZnsCnmPuLXJ6bVCldZFW+989JzUwkwbtY0tFTnrw+Vpf1
	 zA87pqo54fknw1bhvcIofjHM/xOuX37XnSOJSB9hZOTfjYOSTjhishxKVQ2GTQFfGo
	 U9Wgu8Ikd2bFPZBC3kVVxzYP2LBhDu3kh8qlPFxQ9exzOva+dpjJ6KinxPlaam4ceQ
	 vtokMVS1GxwhOnR3tpKvo8DYxda7YMe++e/DUT6V/M6Xo9EAGricAPjH8h1Ex+S9xT
	 9mGn23LBSHCqA==
Date: Tue, 1 Sep 2026 02:18:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Vladislav Leonov <vlad@zlab.su>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joshua Crofts
 <joshua.crofts1@gmail.com>, Simon Glass <sjg@chromium.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Fix RV1106 SAR-ADC support
Message-ID: <20260901021846.59b71f5b@jic23-huawei>
In-Reply-To: <5330090.ejJDZkT8p0@diego>
References: <20260823122039.20831-1-vlad@zlab.su>
	<20260831025557.6ee7c42e@jic23-huawei>
	<5330090.ejJDZkT8p0@diego>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 31 Aug 2026 10:17:17 +0200
Heiko St=C3=BCbner <heiko@sntech.de> wrote:

> Hi Jonathan,
>=20
> Am Montag, 31. August 2026, 03:55:57 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Jonathan Cameron:
> > On Sun, 23 Aug 2026 15:20:31 +0300
> > Vladislav Leonov <vlad@zlab.su> wrote:
> >  =20
> > > This series fixes the support for the RV1106 SAR-ADC in the
> > > rockchip_saradc driver and its device tree bindings. =20
> >=20
> > I debated how to apply this.  Technically patch 3 is a fix, 2 is an ena=
bler
> > and 1 is also a fix, but one for something that we just effectively pat=
ched
> > out from running in patch 3.
> >=20
> > So in the end I'm thinking take this the slow path for next cycle.  Sho=
ut
> > if anyone thinks this should go in during the -RCs and whether all 3
> > should do so or just patches 2 and 3 (leaving us without driver support=
 for
> > now).
> >=20
> > Applied to the testing branch of iio.git =20
>=20
> I guess I should shout then ;-) .
>=20
> DT-Binding patches are sort of independent of the driver change and
> are considered API which should not change after the fact.
>=20
> Our DTs (but also ones possibly contained in firmware somewhere) are
> validated against the binding and it seems the correct compartible goes
> from=20
>     "rockchip,rv1106-saradc", " rockchip,rk3588-saradc"
> to
>     "rockchip,rv1106-saradc"
>=20
> As the fixed commit is part of 7.3-rc1, I guess it would be nice to
> have patches 2+3 in 7.3 and patch 1 can wait for 7.4 .
>=20
> We don't need the driver support (dt-nodes just doesn't bind to
> anything), but it would be nice to not proliferate the wrong binding in
> an actual release.

Ah. I should have checked when the original bug went in.
As it's this current cycle, what you say is indeed an easy fix.

Applied 2-3 to the fixes-togreg branch and left 1 in the testing
branch for 7.4.

Thanks

Jonathan

>=20
>=20
> my 2ct :-)
> Heiko
>=20
>=20
>=20


