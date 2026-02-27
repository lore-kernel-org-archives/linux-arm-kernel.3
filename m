Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E81FD7F7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhnoaMasZZyl4yTSPKKX7UeOHAXyDdKHee+4Df8lMDo=; b=DlZRNKMgyBvZX3Cx0bsQfBehwu
	5yQs2wCZPppmhNuKBdoHOIKHJ1iMYfx64/sf4qyJgPlxw3Fo5ITL5i4gGV7ltdgUAw/M9uVq/j27u
	bjcUCgopZRVS0lYB0IIyIKIfo0lLR77e6UArNuNl4lxw1Yj1ye5gdhqsmgpTariHFZJzl3ce7kixK
	kbmfp5fiTsVh0WqiOtL0sL+9x7rmGHKDu/Au8hRpI/IEiPq/tcIkxIQpw51xSzPYkINbLewnk9MQ+
	h1px4B0wrji2V7nvsOIZ4RloRT9LzvDfBQnWNLP3mKw3fjq1+mvL7AuDyO3daOB89EUcyy7rjPpCq
	yXLVNJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvusa-00000008DMY-4AuI;
	Fri, 27 Feb 2026 10:15:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvusY-00000008DMS-2quH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 10:15:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB0A761344;
	Fri, 27 Feb 2026 10:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09533C2BC86;
	Fri, 27 Feb 2026 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772187325;
	bh=HhnoaMasZZyl4yTSPKKX7UeOHAXyDdKHee+4Df8lMDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mG3bBuZcnBSPyfTnL3qPdrwkIHZOTZiZ/emwbsaBuLDwVFO8gUx08qlhHf25tXhrN
	 iKONE3fEUE9p9X1UJsIyfp0aLkeaWyU7pZUWhfKP938ESCPRBzQ0u+1oX5sjG6EY6I
	 rpGWQpeR+XyBhjn+0gJXTJYCaxHo6ULE9lr3D9UloipBqMa6NoxjmEbvBdaHsEluy5
	 /9pr8V3xswGZVtY4+m4uFnLD8Jj2zACItROg6JVxnvWYRLexCbcdSIzwVJMWUfftyh
	 RqQL8m7G1fefKdOK9yvEjKXv3DAmbNizjM1j/RB7HHOQfM6V/CJmMBkSWkBJNsb5rI
	 2w0VXwPdUVMvg==
Date: Fri, 27 Feb 2026 10:15:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robert.marko@sartura.hr, daniel.machon@microchip.com,
	Steen.Hegelund@microchip.com
Subject: Re: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip
 platforms
Message-ID: <20260227-wolverine-slogan-7af0661f6e44@spud>
References: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com>
 <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org>
 <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
 <10bb25d3-2f46-4b62-affb-31257d51e24f@app.fastmail.com>
 <CAMRc=MfupCCr8J+qnJACVeri4nZZCnULWaRgSvi4LWs4J3-5vw@mail.gmail.com>
 <9132501f-76e9-46c0-839d-bde7246c3883@kernel.org>
 <244fdbad-0d9f-42bc-a005-5f5ef34d067d@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PAx6QxGFekF6HuGj"
Content-Disposition: inline
In-Reply-To: <244fdbad-0d9f-42bc-a005-5f5ef34d067d@app.fastmail.com>
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


--PAx6QxGFekF6HuGj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 10:28:53AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 10:21, Krzysztof Kozlowski wrote:
> > On 27/02/2026 09:51, Bartosz Golaszewski wrote:
> >> On Fri, Feb 27, 2026 at 9:49=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
>=20
> > I don't think this is fixable, that's why I wrote that I accept the
> > negative impact because I like the cleanup more.
>=20
> Agreed. I remember when we split up the ethernet drivers into per-vendor
> subdirectories and had to add 'default y' to each one in 88f07484ccdf
> ("drivers/net/ethernet/*: Enabled vendor Kconfig options"). Changing the
> default to 'n' would be a regression now as much as it was then, so it's
> not something we can expect to do more easily in the future.
>=20
> If the Microchip maintainers think the change will cause too much
> extra work, we can leave the current version forever, otherwise lets
> apply it for 7.1.

Here's the previous discussion when this was added not too long ago:
https://lore.kernel.org/all/20250811122053.4bfyoefln7wpz2a4@DEN-DL-M70577/

Daniel is probably the one that "needs" to answer this, I think the
lan969x is added recently enough for this to not be particularly
disruptive.

--PAx6QxGFekF6HuGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaFuuAAKCRB4tDGHoIJi
0sDdAP0a1SfxiBaSqSvGnDiaFsOnK3r5lMRKnynwHxC1q1YlowEAhH4jXdZZwoSA
NCbTicsB3WkJBH5tagAyX8Ab11vXVws=
=miX3
-----END PGP SIGNATURE-----

--PAx6QxGFekF6HuGj--

