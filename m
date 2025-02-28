Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC0DC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFXFYJac1x/01yzYwzJ7fG3+azm9dT5eKRfdOp1DA6I=; b=jjGn/aHp98YOSB/lf15QOyQmal
	PwgObNjW7fF95P+7HWbAZyRPI+8W8XXAWgMciK5Kz6+ub8hrG9yj+/xUMe+LIq/CYiQyu0qV21K1x
	2nHP2DDqFLRBQx+j81JoGnToy2OIW/0D4YaxNyTeoJD0drBGn83yyOFTKgJbeGEU5B00xYKx+O55m
	M+oDSckO6nrcktpKp+08DXka7aUV+Yt0cKc+E+2b5KvD9sB2Xzm6UKiwhG63W4Je2RJGyAudR7NZJ
	bLA3cJkvwvHnRG7M0oEUCKOBbfOgJXMBVorY+CQJNr1EaW/mKu+/pSOxqMr7IA8axEXay0ilD9rNu
	uK0hzo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5hh-0000000CImL-1GBx;
	Fri, 28 Feb 2025 19:07:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5fM-0000000CIPp-3tl3;
	Fri, 28 Feb 2025 19:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iFXFYJac1x/01yzYwzJ7fG3+azm9dT5eKRfdOp1DA6I=; b=kQfCDKNaF+H2ib3gdNc9HGhKrx
	UutlhybJvmNLV2tN4QmVMSE25MlGZaOUHOpxhnaFtKbIeqU0CSw3OxbNdXrH1UFsZPtIt8Esa8rcH
	ztEbfTeGkCErM4mg9oNo8gUfoLpH/7+McqlMbu9qpT7FFhB3GJXM1dMKw/0CzNwTC3CZSjcGHoPYL
	ymqK/ONjKiEDjhyWBwGMS0iRXcNJocw2MB2MNSpTwe1+XN81WeHrAdkvjaAfzeIvsbDNyByI4g/Fl
	zE1Zt5ocBisZ3AA8GTXY3nUAWwv7X9dQDa/wXbyj7JAWarcYu73Bkuh68iiU5bFou1RXR2USPuKEt
	PxrzoFCw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5fJ-000000041Su-0P3A;
	Fri, 28 Feb 2025 19:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C33A5C691D;
	Fri, 28 Feb 2025 19:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18765C4CED6;
	Fri, 28 Feb 2025 19:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740769481;
	bh=iFXFYJac1x/01yzYwzJ7fG3+azm9dT5eKRfdOp1DA6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwbwhTjWsm/rEWnBTsCJipxxwmUD2J8KuLUOGYi+aUpraG2/peo7/zWSvm5cvML68
	 64lfs/0VLYwbXLLqym0E0nRDsrtuSW8UNewpyqQqE2FszcdwWxB4sgLqNfky9WGw29
	 RCBpk9vdQMnAlPYZrxjOLdbW/Ia3d+/dZFStcL2ClIqwaGPKwNibBu9bC4eCSfPBKU
	 7ahQ6elkUneoih0kqjfMqLoCU9n6jurYDR7VJUpOk1C9cYPPdTtrvk/sUprARGj2hx
	 UBTHctqjCg8baiXi68DWjerob+3LMTwlBVswGBjpbvsamKiH8qx5n9eptpaRobqUgX
	 1F8olGDoVjQ3A==
Date: Fri, 28 Feb 2025 19:04:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	Jose Abreu <joabreu@synopsys.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Rob Herring <robh@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Wu <david.wu@rock-chips.com>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: Add support for rk3562 dwmac
Message-ID: <20250228-exciting-utility-29ca9428f121@spud>
References: <20250227110652.2342729-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s6OSw9lCrmZNjA6K"
Content-Disposition: inline
In-Reply-To: <20250227110652.2342729-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_190453_320603_1170E982 
X-CRM114-Status: GOOD (  10.00  )
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


--s6OSw9lCrmZNjA6K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 07:06:50PM +0800, Kever Yang wrote:
> Add a rockchip,rk3562-gmac compatible for supporting the 2 gmac
> devices on the rk3562.
> rk3562 only has 4 clocks availabl for gmac module.
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--s6OSw9lCrmZNjA6K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IIwwAKCRB4tDGHoIJi
0l7CAQDQfVhiOrJrK6vQiAo9PKlTv9kpqY0pN2q/by1QLSaqJAEAs+3bvp2mwkfQ
MJSUw0vuqY+xCcyhOApXc3xtB4aolgM=
=7KWW
-----END PGP SIGNATURE-----

--s6OSw9lCrmZNjA6K--

