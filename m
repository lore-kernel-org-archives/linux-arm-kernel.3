Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EE0D1D878
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 07:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRKpe5m4uI+URjqo+MF4NUpskf9/M3efMzxetxiqdyo=; b=taTo+ValqxKduJYqeQTp7bX9N6
	jUWrBg0I2Q0y7+w2VDu/3IpPU6VYYLmvk5HEPqRivpgn4rvKtfXygtz4e3UE/6ervj8UGxF5A8Ozv
	OwsXffo3ATsmsT5dOJloYl1wdfFrewmsyJ8aCMSWzyzYjj7NsWvPzQ+oG2ROv+r6oMVHGfCVsVtfr
	sK5Qm6NOJpgRSBnbGHp+/kFGW+0ZeP7W0NvaqEGvBvsYSZWHfiys27eI0SRLJuKnrkXpAGaNo7qFK
	ELgh/S8winAe0kiP+4vHnHxRE8iW3Bjsx+QmgJ096F+96SS+lOZIa4ldp1BjsbLm1Yl4BNz+ez1Uj
	M98vpwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR41C-00000007ctH-16xk;
	Thu, 04 Dec 2025 07:44:50 +0000
Received: from mx-relay112-hz1.antispameurope.com ([94.100.132.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR417-00000007csC-21Ii
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 07:44:49 +0000
ARC-Authentication-Results: i=1; mx-gate112-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=nRKpe5m4uI+URjqo+MF4NUpskf9/M3efMzxetxiqdyo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764834269;
 b=hauK3F0hyuRpfZsndQ2ju9w/NsKZXd8+38jowQ3LNPhu87MeHJ/DKbLlYuGz1XInLMBsV2Yp
 MkCFNeX9M8H+UlCB/nfH+R/sSRssNivHblHDJstuqehoDBtTDeKSFW7rZi77uj4evjJkQ5ii9DJ
 v1tSiXFzGP8I+OFfbL57Ycp1zhD8AGihsLSRrkgjbnz6pJGmcS2KsB0pEZpNpqkiO2V2DMiqjWM
 jYWlg7BHOtcW/WCEQJCIRE09tsSetgv1yq5/kmp1A465niSXareuLocPCAvenedr2aJLbvdBzRr
 PcTBQzqOe7HKWd9qm90C7jONVWbFo6qGWVszHQiLYHBjw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764834269;
 b=ASacCQaC0ZjY7apRk8f7J8FTNL0xCBtto/V7oGdpvrucoKcHkcgoW9GHz2RShbYWKVsCGkXQ
 l3EsUTmeItNSab5YsO30wcqryxK3CeaYPBWQuq4RAsrGhn1RnviwgcLn5hvH86f96/1LqoTYodD
 sWaOzj1CQTB5iu2fKaR3Vf1G3t0xNdNwSecDKeb2Sqz0WesfcxLG3/ZP6NePpvVjgVdRiEYO18Z
 IySgWEj4ko9bja3PnkSRpwav4c7oMU87fGqmQhb6Pwsg9aw/d9Kn2XxyPgRTwy5bUhbK05dqiz4
 HPb+iingFLGBEXocFWaQ56H93VKFnhWPyqJKVs9qK1qaw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay112-hz1.antispameurope.com;
 Thu, 04 Dec 2025 08:44:29 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id ABE6CA4134F;
	Thu,  4 Dec 2025 08:44:13 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 frank.li@nxp.com, Sherry Sun <sherry.sun@nxp.com>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] arm64: dts: imx8qm-ss-dma: correct the dma channels of lpuart
Date: Thu, 04 Dec 2025 08:44:12 +0100
Message-ID: <3023939.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251203015956.116364-1-sherry.sun@nxp.com>
References: <20251203015956.116364-1-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay112-hz1.antispameurope.com with 4dMRNG3FgKzwTWn
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 073b527d389ddc73e181e67b15c075cb
X-cloud-security: scantime:2.175
DKIM-Signature: a=rsa-sha256;
 bh=nRKpe5m4uI+URjqo+MF4NUpskf9/M3efMzxetxiqdyo=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764834268; v=1;
 b=oHqbXFs56S+NxLZMag1QkJ+4/6dZojukRLdK5+Zv7rxwqSbIfuzuRFi2jgxJiR8TXjXDHNy+
 qcdcoe/Vad6U7ISWuA2bYc4jHgpLxGs14sAc5vTwZUh7f+mNBYriaEMBfCoEi77hzp27vwqW8NL
 iIfNxlHEDZ6kZ+SnN3PyXrvbsAp19b53+Ora7gXGQDoxoxIEm3kscr3vecg8w360eEiCAVGJ0Zr
 hfBZiuEYe0STvIwHu28KflhgXH0e1eyg5JPNpZmAhpIfs+mN5aqzRQsIjiftR8DbzXMm5KI3LuX
 a+liKpKeFSkXEkuUyQS3c4Tgwb8gyO1YjHwTqeeCHku6Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_234445_991113_2AB4E530 
X-CRM114-Status: GOOD (  15.31  )
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

Am Mittwoch, 3. Dezember 2025, 02:59:56 CET schrieb Sherry Sun:
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
> Fixes: 5a8e9b022e56 ("arm64: dts: imx8qm-ss-dma: Pass lpuart dma-names")
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Changes in V2:
> 1. Correct the fixes commit as Frank and Alexander suggested.
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



