Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0F6D74965
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8AHnpnpM3XjqYhTIhCiVYGeLezuM8A5xZRbfy0K3Bs=; b=xIJlN7l9J4jFKcQodG05CT6PwA
	OYxiI1LbqGeT52o+QftqEMGqIJjIUrxVdlMf38p9gSCYUvwWY7DJpGRAsS5IdLuNIGGESjK20yQ9K
	6Bg0BuOMM0VPefcWO4hb5/sjM9YRG3EBCxkRHSP4DublIKe8exR8rFX/s4UJSasibVXoeH1FIdIGn
	+IGa5OlcSStFZUslAL8pOMl7yNfGbE8dU9fdUhuuK5ut1Jiq7BxRWgUiNumeAJnV6jfC1b6U6+Gc2
	eALn83yfDg39qmCHo8Fc8wkaouI9X96FnohcHtz4ly3lsYvIPtHoK9ho9ov4aWa+jgZgZqEymwbj0
	qrIwLutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWHj-00000009tim-3Cw6;
	Fri, 19 Dec 2025 08:56:27 +0000
Received: from mx-relay122-hz1.antispameurope.com ([94.100.132.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWHg-00000009thj-2wJ1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:56:26 +0000
ARC-Authentication-Results: i=1; mx-gate122-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=W8AHnpnpM3XjqYhTIhCiVYGeLezuM8A5xZRbfy0K3Bs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766134556;
 b=NojCFfuVScHLct4DrdoGvWGmcPGeyQr0H9BMnRe05HRcF+552LWQDklOetMsLiijHke6KyOX
 Ys6jBnCW2CuU4tmyVEeaA7/ZoSbNzjqyRVloZj8jJBSh9tTN9BIZTTWJEfpX54hw9VAFJMFzFt9
 18aL8wXM2dt8+3bja0JI1uSEZDIDMW4osmvL2P2YTdWkDSm9xcUpYmVyg2GbpqHGJ4yiajpG4SI
 u+dn5vqWmKJxKBUfnU2aDLQ/8CCRSk+Ot6yCEJEqBl6vEBhnCOxIYA9HuYaeRpJ63I8cWQAcDNf
 MU+0XgYc8qawhF2AIvTiva7WnvPk1T7TKWY4OGO6XWRqA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766134556;
 b=ZKd3Vbq4Og0UPLT6A6gse5EmXBfCS0PKloWy77nOnyZubMeZxwBgfAZqP74pE3PpHdRD3E1/
 PU9vDoLuvrQMHWmAj96deV0OcGFm/NYirgGfYdPQ5JQOXdMj0J3cbW2u73s3Kzkhbdh/pyaU5aa
 jZ/ps+HOWzGNz1wUDTxSHcnY56P0IXWpB82Xj4DztYyBKtbHfEA4FP7c8NCgXTAfMravfwOQ4ze
 obXt05pudccQJ6FU6MTKMiJdwgJL/oRl61pS929lkmXn/yvGlcRxVjYy4Cok4GKxDq9zGaTSLwj
 aQjble1IY16tj53SROuoUUHr8nKV1wqp9+6Fcy7f+8e+g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay122-hz1.antispameurope.com;
 Fri, 19 Dec 2025 09:55:56 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6FEDAA4140A;
	Fri, 19 Dec 2025 09:55:39 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 3/6] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Fri, 19 Dec 2025 09:55:38 +0100
Message-ID: <10076440.NyiUUSuA9g@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251218152058.1521806-4-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3460692.usQuhbGJ8B";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay122-hz1.antispameurope.com with 4dXhFm4fp5z34Lby
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 0c47e991cdd1e2cd38041c89430f069c
X-cloud-security: scantime:2.240
DKIM-Signature: a=rsa-sha256;
 bh=W8AHnpnpM3XjqYhTIhCiVYGeLezuM8A5xZRbfy0K3Bs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766134556; v=1;
 b=Kea4g8oyo9StsggYiLZ1HQxOcR6cvtJpPNUG07iYCER+j9pmg29NQjgtkxZTtZOl2BVSy4RI
 tU51J95A2aTnEteZGFc5L9LNeSrex9CASCxnlHYapThkrkrCKvRZ/8Ed/dF5SM0ppmfMQDLnc76
 +n/7mI7e6xEpXcmSmZU9tz6ZXY+kLY3LOOU3bWuVJRsF1sMARDXN6Qqsjx7rgMiM5nUGoixbwWe
 Lb1tZFnQpYQKA36QJsF36VVprMiiu7FIaZTdwwoDg/BlSZWmPsQYGOKUTpVKNumK4gjDtuQIdIV
 p/J46/bY7eRJrOI7hnOzHBGHte+u6gu/J7k2gE5F/C1UA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_005624_881948_C52C09BC 
X-CRM114-Status: GOOD (  19.84  )
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

--nextPart3460692.usQuhbGJ8B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Fri, 19 Dec 2025 09:55:38 +0100
Message-ID: <10076440.NyiUUSuA9g@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0

Am Donnerstag, 18. Dezember 2025, 16:20:50 CET schrieb Alexander Stein:
> IRQ mapping is already present. Add the missing DMA interrupt. This is
> similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
> DMA IRQ for PCIe")
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> index bd6e0aa27efe9..f2c94cdb682b9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> @@ -20,8 +20,9 @@ pcie0: pciea: pcie@5f000000 {
>  		ranges =3D <0x81000000 0 0x00000000 0x4ff80000 0 0x00010000>,
>  			 <0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>;
>  		#interrupt-cells =3D <1>;
> -		interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names =3D "msi";
> +		interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names =3D "msi", "dma";
>  		#address-cells =3D <3>;
>  		#size-cells =3D <2>;
>  		clocks =3D <&pciea_lpcg IMX_LPCG_CLK_6>,
>=20

This one is actually independent of the rest in this series and can be
picked on it's own, especially as I won't be able to work on the board
support until February. I just wanted to give some context / usage.

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart3460692.usQuhbGJ8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlFEwsACgkQaS+g2M0Z
/iVAFAf/c5CwO26Ggu/BI/ZSuZzcaL1LqCQ6HXiIkEKJpXXjrmbMAJ6LFFIo9ARY
MP753fb/XeCGm0ozq9rvZEfe+MQ+SYFD3GV3cNRmU59JwwBNpErTOw/jXOC67y+Q
hASUB/UEN5V7UtxEUMARpH7N0PodmW0cIQwceQoO9T9S0n+g4OwjIJV+0T7/LHx5
LOh++EEOGH/KbeOtVKwmDY/mvlYFJcO5TxNbvYfo8OrT/3PltCu2awfi+ZSOac5l
ATtxTkihCWtUFHeXYtwteS0hDXOoldi4A1137WzS5MNWkCeq8TxB/F3Fk3sKSHJk
7U2L6kHUhAjtsnQPLnIQ4yuhF7BL4w==
=Pd9W
-----END PGP SIGNATURE-----

--nextPart3460692.usQuhbGJ8B--




