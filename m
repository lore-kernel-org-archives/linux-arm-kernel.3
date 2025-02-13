Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B662FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdBorC2iPu6XWE9gMaUy4xVTMRJsxDq2+h3Id4YjZw4=; b=GUUV+gHyczuZN858kJ+EFyy7Q2
	FnIvjOXTsUQsnELrh21ztDX7wm7Cfr+L+wTYsUEN6SQnxrR5+kuk/a8GnVh3wvCi8G1AsOvh5JJDi
	1BMBUddv26VwxDvXnqLlLeov5xERdDqSO2NwPpKxxph87HPbLoQbkMP/inWyL+uscb5wlExZEGJVs
	L5uNamv+YHIYiFOpRIPQUqbkq520iPHzQ6sL5edoRXfAZ2Sy7jksdIvizijUYVF8zJqWxOUNBr+1a
	VN0XdUkRLHOlFzJUZ6y3UWnPiwX2nS5TjB+7iw5zksb+W/BsG5ilkGuZB9tA5rG4VLh5Pxux1tYJj
	ramgztsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifUg-0000000CUyD-1vxU;
	Thu, 13 Feb 2025 20:07:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifTE-0000000CUoA-3Ape;
	Thu, 13 Feb 2025 20:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE1E25C5729;
	Thu, 13 Feb 2025 20:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8B6C4CED1;
	Thu, 13 Feb 2025 20:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739477159;
	bh=NACchtxeonADU5GQJHVdhJAYs1NUCFnsjx8N1JQdRrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/JH8jfV1QVq1uasHTsNeuvpUp+d/jj3Sxg0GxQKCVk7MJyvAD+eV7i506He6qDkk
	 CgczH1mXZqmixuHsk0D/2KtFkSCe/Wmi8P9wl7zCIUczWtl3sD9Vq+H2A5cpdDdnQF
	 qNGJnP9y/5CtGu9vhXYx1B8p7h+0KKFG7NvnxjfzY6NPNfHSqEgpjg6KZXdcGWsLa9
	 aw79CG0LR2+U1fZ2shFOmgWKUurnvnCGkvfOKwv3xXZMFivGXD6G8/TJk9OItg0FuJ
	 zk2HZ3DJcceF9gUMbY0NZul7L33XU3Emvw5VLBcspBPrQFTtCjH/OY7sZFLz2zeqsk
	 MyoYXycWED0Ew==
Date: Thu, 13 Feb 2025 20:05:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev,
	loongarch@lists.linux.dev
Subject: Re: (subset) [PATCH v1 0/4] Removal of non-existent DAC nodes
Message-ID: <20250213-calamity-smuggler-5d606993be32@spud>
References: <20240717-anvil-ashy-544e80a1317c@spud>
 <173939339997.59416.11108011581545463665.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t2TI/qcM7Hcs5rgZ"
Content-Disposition: inline
In-Reply-To: <173939339997.59416.11108011581545463665.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_120600_836739_0063AE96 
X-CRM114-Status: GOOD (  17.51  )
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


--t2TI/qcM7Hcs5rgZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 09:49:59PM +0100, Krzysztof Kozlowski wrote:
>=20
> On Wed, 17 Jul 2024 10:37:52 +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Recently I've been getting triggered by abuse of the Rohm dh2228fv
> > compatible to get the spidev driver probing in Linux on development
> > kits by employees of various silicon vendors (like NXP or my own
> > employer). I had a look around the kernel and all users other than the
> > original Clearfontz board added by Maxime appear to be similar abuse.
> > Drop the non-existent nodes from all of these devices :)
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [3/4] loongarch: dts: remove non-existent DAC from 2k1000-ref
>       https://git.kernel.org/krzk/linux-dt/c/854a080f0b73ff966a813ec2dc53=
891831daa28d

Heh, funny that you picked this up yesterday - I noticed that it was
there while poking at spidev doing some debugging yesterday and was
going to grab the patch myself. Thanks.
Noticed also that there's a user of it in riscv that I hadn't included
in my original patch. No clue why I didn't include that, but I've sent
out a patch for it now.

--t2TI/qcM7Hcs5rgZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ65QoQAKCRB4tDGHoIJi
0hJOAP9qWBg0rjsbzm7opAMArAFEycQu0lJBHYdR+tfeeXkkhAEArfJdGry0AYEf
b8lHjUhG8iocKhPAo6JWSZBlm8Sn4w8=
=cxBE
-----END PGP SIGNATURE-----

--t2TI/qcM7Hcs5rgZ--

