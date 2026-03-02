Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D8CE9B35B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o7xK2KLyVLPeKdnPq73iKRcvJgeK10gXor6T1iRFhg=; b=mT99Pd8iMUZk8iwPOVyj0IB/v2
	aHx89xicHXvNVZHCPLnCyDzb7duOJ66L4Z0MkYbMYOsYRTX/SmDv8eSSFP+9+aQRgGGVZx4/yNLbJ
	nA+JzuFWmNcuMyUgMYO6QmL2C0T+irWi0DwbQiL+QcyRd1VbwsoNGBmW0DCxn4jgZYxwKye4YI8Tk
	hFUSS3+xMjQD2/jHOQ7I//ynftLgukLDeKGRzqmH1Ch8UD1pV5SrOtT2Rog3x4lbFtcFW5tqFiw0Z
	9ie+9iEP1T2fkdfEsHMkiYSbjwqKDwtyj+onsg6DtWIfzsDS/F5pvKUcqVcAkPXZv9/ksOhN9zv3W
	H1vkssMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0k9-0000000CjIj-2476;
	Mon, 02 Mar 2026 10:43:17 +0000
Received: from mx-relay91-hz1.antispameurope.com ([94.100.132.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0k4-0000000CjIH-2gdL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:43:15 +0000
ARC-Authentication-Results: i=1; mx-gate91-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9o7xK2KLyVLPeKdnPq73iKRcvJgeK10gXor6T1iRFhg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772448183;
 b=bsuRoa/Yu7ZVTPFLWjjQcVaYmjdySEBzy0QXsDZH2RdsNOBgzsmp97/8l6opuR7Mpx7XLocp
 qRJZ+9dJbwb0S2G9JUO/wV2xHQ3DCjS1tCXaAl6ysXxX2pZORw1903AJOiBGGuZkALmr/IEPKIy
 0F0YD1DoBBRJJVZEtazfsri9rKHn0AdTEa34huGZJwm5MAS6yBu6N4cUBnynRxXk/nKornZ4gp6
 s4hZotwLFOQ6LaYOHigCr9ZKAbuhpNvF13W5tMyonUZTvv/yjW/xnP3PBLdsWVMoF9UAjc8+BdZ
 zNdzJ5sDhCuTnEzNGSZ5LF5zSJ4ZnPjRgML6vJfRj/W5Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772448183;
 b=MXc5WAW11CeTB9yvTvpYqjZ3mzoOtnDI720Qm3kBhiN4JsfXDxu+xVwxodTTczAbcffo1GTR
 ACJ4r4IMVv3nvg0yGNkJ3d6rTSgWenRU/so7MQwJ73Ncq61/HCW6bQfv8Q5ExOXFz4ST3CUW6rV
 +xyE6tIJTi4SkbMIWNRiaynJZHF6C7FOV58YUD4I/mG1zkV21cTeS8ORNPhtj0ACKe6cWKsjWG9
 k9DgerqjhQfMeqlPENUCwKC5ZUHebPiK0AvARz7KVQUajlMcjkVT7+5fZRkMCrnmngWoEOXzPep
 5zefq8C5KSrSlLmcE6f5tyUMs/P0W3oXvv3oUG9ZM6Q8g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay91-hz1.antispameurope.com;
 Mon, 02 Mar 2026 11:43:03 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D99EACC0CCA;
	Mon,  2 Mar 2026 11:42:49 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux@ew.tq-group.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix
 UART1 RTS/CTS muxing
Date: Mon, 02 Mar 2026 11:42:49 +0100
Message-ID: <5083150.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260302084548.6471-1-nora.schiffer@ew.tq-group.com>
References: <20260302084548.6471-1-nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay91-hz1.antispameurope.com with 4fPb9l44JYzMpHt
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security: scantime:1.592
DKIM-Signature: a=rsa-sha256;
 bh=9o7xK2KLyVLPeKdnPq73iKRcvJgeK10gXor6T1iRFhg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772448182; v=1;
 b=TWMN0ZY9kf07Oa0KY0tr8ER9BerDm3c10q0m+u3gJKFfFXx1J10SCC/NnqK3fnI6MP50H79x
 LnrU4SqdGmthLEEQnoBcARftVMe6wGaIv4uAqHIm9TImdxF0JUOvKOLxzRSrtzysDD/xZ3T0oWG
 Lo8KZpHsNd3zKKqsFS3LePjRH1M+RoBjhfD6QLYF+mwisH30tnHo0vkHndLohthU+h58gz91jKW
 Z1tzOn2LpVvb5DdjKq50KYd5texwX5q2TICvcW9zOA8jDkQNs6JxjBADQQ1rcclCXWBrki/GXGC
 Tc5SsxzDvqgY9SR6Fp1WBd92BTQg1Bh+EhONa9fXPN0ZA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_024312_933161_315F3B7A 
X-CRM114-Status: GOOD (  16.19  )
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

Am Montag, 2. M=E4rz 2026, 09:45:48 CET schrieb Nora Schiffer:
> UART1 operates in DCE mode, but the RTS/CTS pins were incorrectly
> configured using the DTE pinmux setting.
>=20
> Correct the pinmux to match DCE mode. Switching the RTS and CTS signals
> is fine for this board, as UART1 is routed to a pin header. Existing
> functionality is unaffected, as RTS/CTS could never have worked with
> the incorrect pinmux.
>=20
> Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS3=
14")
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>=20
> v2: updated commit message based on suggestion by Frank Li
>=20
>=20
>  .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314=
=2Edts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> index b7f69c92b7748..1665a5030b993 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> @@ -848,8 +848,8 @@ pinctrl_tlv320aic3x04: tlv320aic3x04grp {
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins =3D <MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX	0x14>,
>  			   <MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX		0x14>,
> -			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DTE_CTS	0x14>,
> -			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DTE_RTS	0x14>;
> +			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DCE_RTS	0x14>,
> +			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DCE_CTS	0x14>;
>  	};
> =20
>  	pinctrl_uart1_gpio: uart1gpiogrp {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



