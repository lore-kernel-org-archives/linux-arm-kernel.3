Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C320C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AqPf7T899io12qypJ/mms7Lr5Nr9wni8SyAes9z2vI=; b=tDKt4Z/oe/inpX/7H6IndPy41C
	WeeWDcJ/VbmXGzC+Q+A2yL0fDD/lpRTfRc/Z8tmP/ycjG5PAHeEFxfFGmq9cr/HT2f2aivEYAug2r
	b+eQl3yqyuJWpuJKnLTqR4Vxq5ZmatcT0dUv4+ueDvJbR6v4jx1N6n4WHIAVkuBeUvzID4lDqHgxG
	H3Q0L+29BMTAEIAh15wahvG6W4h5eBW5CKukqPoaB6qn5iwYdQZjAjtxDu0MyUPXkQhIWCOXIXKGl
	gVXJLUH5RG3XDWm5HgnkZC4B8cy2SpdKw8fuxhj4xwFn/3C8E+I90+N4s5g5UzkxnEZw5W7Z/wBV8
	QQ+r0chA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpC-0000000Dfng-3rPH;
	Tue, 06 May 2025 23:35:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKrb-0000000CcyW-15YA;
	Tue, 06 May 2025 16:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27E4D5C341F;
	Tue,  6 May 2025 16:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E07C4CEE4;
	Tue,  6 May 2025 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746547786;
	bh=1AqPf7T899io12qypJ/mms7Lr5Nr9wni8SyAes9z2vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YL0jVWeOd2s74qnpkynu5XmWmK16ssceH5qmopx7m7dxOJjOXSGUQtCPBNOg/Oz49
	 37dOweLLtPGvzHFhP+6u+7eHmpivki9joZPtkhirZHDMeNjuQyhQbr+e/jkn8GnpHL
	 TLHcsZHUT3aRldmvNpMFP0hs5lL7lANiKIWvORQxCMJtTPM0s+xwtlsl6VxPr8NmA1
	 LAG7B1VWtaDuWebv5PobKgCo/GNw6wioQ88wuRnMyF03mX7nPj67mGqA3YEio7dSxv
	 8AhnvEk/ymk50+DUDPBY4alQGcZgnHxsOM8xy8plh/m8ZOhsf1cMSiydJsWprsfanM
	 Bp/pw8/P9aN2A==
Date: Tue, 6 May 2025 17:09:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: sophgo,sg2044-dwmac: Add
 support for Sophgo SG2042 dwmac
Message-ID: <20250506-tidings-backless-99cfc65a2ab4@spud>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <20250506093256.1107770-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xnhOoqcIxXVoDYDg"
Content-Disposition: inline
In-Reply-To: <20250506093256.1107770-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_090947_352224_588D5400 
X-CRM114-Status: UNSURE (   9.54  )
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


--xnhOoqcIxXVoDYDg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 05:32:51PM +0800, Inochi Amaoto wrote:
> The GMAC IP on SG2042 is a standard Synopsys DesignWare MAC
> (version 5.00a) with tx clock.
>=20
> Add necessary compatible string for this device.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <rabenda.cn@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--xnhOoqcIxXVoDYDg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo0QQAKCRB4tDGHoIJi
0uzcAP9AXEpRJB9kYjvwkSr1RxOOhB6kQeDj6R9Xa2LcbHBQOAD9FXI/OFWlXOrQ
PME/DZ4B5w9p7Kbs85bcMHB0v6+2zAI=
=rLmY
-----END PGP SIGNATURE-----

--xnhOoqcIxXVoDYDg--

