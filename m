Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5435CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 11:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPzBCQ/cVroc4yKwXafobMdff4xUZ/bh1Bgq00vprqk=; b=paP39GiItktWF9JCNVntoDI3iP
	rgezpNmlWME0hO5p6/kwpPq856AeBb490nPA2g2sn9Ze92iOw7Hk8nufx0O30hY3Mw9SzPi6kx1IP
	7R1SkAAjvF01Z9s++pal2EcfPs2DWn1/ikZZATQWHxTctVhrazGUoMaYSdautSMLljKtqtSaFOsfd
	UWrgiUkjFReVWOm7oZzAmBGPrBTzDyCH3FlOPnjtIPAQ1DpwVzC00aDF5wqB82Z08ttNT81mLhgPX
	IncmescxmOEWTdr34dnM3tWhy0k2gp7dmkMhz7ojlw4omqC5Lvq43SDUW0WuNLCiRHGoiqUO9xMjN
	b17v//hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOsA-00000005KnJ-1pV7;
	Tue, 02 Dec 2025 11:48:46 +0000
Received: from mx-relay90-hz2.antispameurope.com ([94.100.136.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOs5-00000005KmM-1USq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 11:48:44 +0000
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=cPzBCQ/cVroc4yKwXafobMdff4xUZ/bh1Bgq00vprqk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764676109;
 b=prEI4sWlyCjtqyzmjHsLJElkDo9VNdlOcnRM0z0IYNmey5ajgrh6500v2N0QBFFrxwxeFs/p
 S1LfQ/FgtxXGVRpRemu0+7cNnOV57LgPN0Zy9O70wvvHz3u0vFxcJvOqEuR4dg+X/X31VT3R81A
 JDpme5OsZzhav9XhirRxCZjgkTd+iWFTII2yv8WCNTCNUvzUDwuXwgKPkQDhBPX3GTc2rbiE9M/
 PLbi+5QCDv9edza11SYhrbGzjua8eV1A/g9uESP3FlH+49gIr1KviwUkiP3g4xT0MyvZalFPDZ0
 ujTsnRwwYSayy9WFpM6BU8VA85d8sAU22fB1fBVvQA7Hg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764676109;
 b=MXvrAI9DzAZheUlxZv7eUjotVgC5HaXd7sDqxTcYnGm0F8MMxBbWUqAKK2J22oj82FK7U9La
 ZMMx/Hv/phnmGsP4lZyA1L+LA4MoDsdwULZw3Yi/ofG58uyYkNi2aiyIK5O6jOA3Ft65sxT/fAR
 1gRm1SLn6AEhiHRwilqhNZBKfCGD2sC4zXfGADhzm/sffMdPXVCktRfikxQdSzMoi37k4ogRV/+
 Au1BMPal18NMyp7gDHLsk8vPeXpEvri3yBMDzsXiFIE15SIkzjrhi1M+dcFbPFt1Ydat29Cu2HN
 KSY1AZf9r5GVIM98yx+P3fxmQZ8Qzn8f+ijvoMDX5381w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Tue, 02 Dec 2025 12:48:29 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id BAAF7A4128F;
	Tue,  2 Dec 2025 12:48:15 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 frank.li@nxp.com, Sherry Sun <sherry.sun@nxp.com>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8qm-ss-dma: correct the dma channels of lpuart
Date: Tue, 02 Dec 2025 12:48:15 +0100
Message-ID: <2395053.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251202111638.3553-1-sherry.sun@nxp.com>
References: <20251202111638.3553-1-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4dLJtm3MJzzWycw
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 199991314bca0e7504113f70cfa02bc4
X-cloud-security: scantime:1.766
DKIM-Signature: a=rsa-sha256;
 bh=cPzBCQ/cVroc4yKwXafobMdff4xUZ/bh1Bgq00vprqk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764676109; v=1;
 b=boPZZ3Q6FJ3OEpNSMgUGKMJL8fMojUUYYL5lZjpi4CeiLJ+hJoxDt4csaAcSsT0amVBIt3Ul
 pIGq4bhGIa+QzcCHGH8OtxV8ud3biqnbEdWOrwJj+YHhffvz72FV62UkhBftKGtMFYVW/o3u6Zx
 j8Shqe3X4rFtbfsAYA2AJOf0suZVB8WVjUCIeHZGJNiznIbztYj105t/4WDxhdCnCsTgDgHcBix
 +ppoTY1+zkmUd44y+pG+HoD3+USQHhqCa9ekRCMQQ6o0+bAD/lmyFZ/cvzXPHBRKs05soDECN43
 aoTN1T6wVxc1w2A1Tn+RGtowL80/FiECvBadvH/UeLP4w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_034841_755121_FAC61AA7 
X-CRM114-Status: GOOD (  15.83  )
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

Hi,

Am Dienstag, 2. Dezember 2025, 12:16:38 CET schrieb Sherry Sun:
> The commit 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel
> order") swap uart rx and tx channel at common imx8-ss-dma.dtsi. But miss
> update imx8qm-ss-dma.dtsi.
>=20
> The commit 5a8e9b022e569 ("arm64: dts: imx8qm-ss-dma: Pass lpuart
> dma-names") just simple add dma-names as binding doc requirement.
>=20
> Correct lpuart0 - lpuart3 dma rx and tx channels, and use defines for
> the FSL_EDMA_RX flag.
>=20
> Fixes: 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel order")

I'm wondering if this is actually a fix for 5a8e9b022e569 ("arm64: dts:
imx8qm-ss-dma: Pass lpuart dma-names") instead. 616effc0272b5 just
focuses on the common parts. But I don't have a strong opinion here.

Thanks and best regards,
Alexander

> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8qm-ss-dma.dtsi
> index 5f24850bf322..974e193f8dcb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> @@ -172,25 +172,25 @@ &flexcan3 {
> =20
>  &lpuart0 {
>  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas =3D <&edma2 13 0 0>, <&edma2 12 0 1>;
> +	dmas =3D <&edma2 12 0 FSL_EDMA_RX>, <&edma2 13 0 0>;
>  	dma-names =3D "rx","tx";
>  };
> =20
>  &lpuart1 {
>  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas =3D <&edma2 15 0 0>, <&edma2 14 0 1>;
> +	dmas =3D <&edma2 14 0 FSL_EDMA_RX>, <&edma2 15 0 0>;
>  	dma-names =3D "rx","tx";
>  };
> =20
>  &lpuart2 {
>  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas =3D <&edma2 17 0 0>, <&edma2 16 0 1>;
> +	dmas =3D <&edma2 16 0 FSL_EDMA_RX>, <&edma2 17 0 0>;
>  	dma-names =3D "rx","tx";
>  };
> =20
>  &lpuart3 {
>  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas =3D <&edma2 19 0 0>, <&edma2 18 0 1>;
> +	dmas =3D <&edma2 18 0 FSL_EDMA_RX>, <&edma2 19 0 0>;
>  	dma-names =3D "rx","tx";
>  };
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



