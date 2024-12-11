Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170DBE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RbHJfGUC+OlMc8Fj7GIJ91kNLQs1PD4Eew5jeTUlMg=; b=aN1GC3qg9975+yEbGNern4Y1XE
	lgPnx7tSZnZ3+I+mYQeUfsW11SamhO4CnIosJ7AC7k/Pau+MJ68XC6094vp1ESbkrGoO9LA/dXs4m
	PNbh4fhp5PahkkaStKJyfBG07g1mqRLfCTziYT89LutCJO30KoNLj3+kTFQWFjRi0m5PW3Jy3ZCXM
	8E8LD5ba7HFni0YySicXRz/u7FLv6c8m6so1wUsNLargwAbEelezIo3DEV8rREpIJQR98pO8ZXvVZ
	zd9tUPVp87PkZCC0Vfd/olPN7kgF3wKtlD+P6Z+OK/NW8sZpWWrpxCd0MUPCA07REqiwX8tUzisfX
	jKuZOnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOuh-0000000FJd8-2nSJ;
	Wed, 11 Dec 2024 15:46:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOtd-0000000FJQ5-1Wo3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 268E1A40BA6;
	Wed, 11 Dec 2024 15:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB6CC4CED7;
	Wed, 11 Dec 2024 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931904;
	bh=vHm0I24vOCK9hphozbx59ldx5MK6x+yw152du/dxzQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwdZuG/9DGh1Kv6z9czTnByEkoQ7zv0Ni6reos4sf6Y+LDh737/aEjnOnrpzbywKM
	 MI7cbuFIN67NNDauEeu/pvjX/UM8XiGRcVOdHbwnmkMeK3I/BKuIxFewEB0AJUqmZo
	 YMo4QxJ6xG3o5gY7sE1SlZUtBDdAZ0OwjKEQwI3FItt3VwFzlA9Tv4cnPG/MzfGNC1
	 0TkVsoLpJP/U21I4jq7fnEBgdnT9JH/+4pj74d419+luMBlcSTGzSLnfkROYMdhreS
	 7PtOaZx+l/aRJG0ONrGstgp7mn7m5hCcPSwh89UlGIdIaN3TUHrMdvnTGujDQTUBhc
	 o+xjgo1wLNXqg==
Date: Wed, 11 Dec 2024 15:44:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <3b090335-20b4-4d73-aabc-ddac98311e33@sirena.org.uk>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-3-andrei.stefanescu@oss.nxp.com>
 <20241211124454.GE7139@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wVbzCNTZslHN//4Y"
Content-Disposition: inline
In-Reply-To: <20241211124454.GE7139@google.com>
X-Cookie: Every path has its puddle.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074505_467214_5D0400F8 
X-CRM114-Status: GOOD (  11.45  )
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


--wVbzCNTZslHN//4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 11, 2024 at 12:45:56PM +0000, Lee Jones wrote:

> Seeing as the vast majority of this 400 line driver pertains to Regmap
> handling (!), would you be kind enough to cast your expert eye over it
> please?

Is there something specific you're concerned about there?  It looks like
it's just data which should be fine.

--wVbzCNTZslHN//4Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdZs3cACgkQJNaLcl1U
h9DjSwf/a3+f8IyMBTLXlpe5a4EfnD4elhoE27ywlRj5aQYmHVvYh/b/32n4w27U
WkS8gziks+D3cLHY34wMDKv+Vvv20SrhfVTUIOjfzNibhRpIb4QhaQE6BBd4+iXa
aRkjxjYkPEUnAkkREJnTqhHddR1J3iNLi6ADGPmzRPd3vHbF5gwg7RytZpJPyYjr
y65mFPZIQQXb/9w3cEp9UTUyrpOy7bjV1eeoGj+SlnFmGipONjjS56azAV4IxBg4
2xgFkB28tT7gNMWacjT3ha8MGAKRPK+GFzYiVxFJo6nsBkajTLZ1RyVI+fjiFY8Q
yyJ5g5C3ZWYjAL87ug96nFUMV/sC8A==
=0gSx
-----END PGP SIGNATURE-----

--wVbzCNTZslHN//4Y--

