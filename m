Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB27CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2BoxPYyqOK4bolIbnOAqTEAwN1RnM0dwCy8BYozWgc=; b=l8dQvUs5CBDB+uJBSV0WcaxBg1
	U4dV2LI0gS0SMujtfictVeg968O9P7MbtiqWL/MnJwyl2s6+/p/tB19dQ85NlpYtEJl9R+vSEsg4l
	FzKEogyl5R9e/e6HNzPUhocw2KuzKXnLo0xFWjT5Ue95JIGns3ZUVs/ga1+Eapl/P6jiEuQVQZAgI
	MQ/GgKb5fkH01VO3dcEmypWfOQ5DlNKiRxMAJvEeBBn1LwXcTkOJ1VY+SQudmVznv1vjkqfS9AOma
	CYV0E+1t0RyBoEW1Jp+7NBK8LTnqsizNAG6JWfO44NQ7bLNff/QG2EvokacFY0UOgtJ8QJsz1KZSs
	9rVcMrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB67O-0000000FwwP-3WyQ;
	Tue, 21 Oct 2025 06:45:14 +0000
Received: from mx-relay04-hz1.antispameurope.com ([94.100.132.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB67H-0000000FwvQ-10SV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 06:45:13 +0000
ARC-Authentication-Results: i=1; mx-gate04-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Z2BoxPYyqOK4bolIbnOAqTEAwN1RnM0dwCy8BYozWgc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761028816;
 b=M2KfLcaHo2xsElDq7xgugPfX/upRW/lg1Ng6d2MAztTKFZGTi4J1F9woUpDVPIyK+NDcAled
 fOuiykZEyNCCv7KG08vODIsyDjctlTNOt+56jqAARHbs9CQKAyOrdQX1iv65vByEgL3wYr/l3Px
 jaDtMuHhziJFRaCoL4XA6n55NEa8Xc4+ecCyRGztV9ZEEP8p/L8iy5riNBRrn+jFGamVrAcN5Ge
 sxcIaaIostHMMkzWNW5O9BTwJlU9X3Q7Rkm4AVJf8kLY2LExI90d7sLpJhtkLyiLG/N42WuEIkU
 aIeU6Ld4wYpVG3qkVK3N4Gl1XZvkfmzMZ0V0wp50dnapQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761028816;
 b=g+moJPI7wEEp8SsWV/bxwBy7NuOVUVYwvJbUMHXcJLtkv7UFlnAvxF3dmwrvwrH+S+zKwgoy
 QQQZi2jrF6MnhTDYONjOLZyN25+7yDXiYCP9W0KfFc4U2KnRvM5purDfQS4elX/F1iz1Gkx1BPy
 fjeR+TQdzn5VQuZUOpxf26MP9tMV88wapUks/bwjP0fkZJRApxupdS1pjL31AhTliZgEJDZUCr4
 +saHmR3zv/GUblRyCydGwi+f9zFtGBnjl6K6aY7o9FmgXcdXk55+SzfPC9blQNPAhN+3eKgG9Ne
 RBxtRpiyEciGZTMkdjaMIPU+cbtcpVSNUKoIqHonLRVtA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay04-hz1.antispameurope.com;
 Tue, 21 Oct 2025 08:40:16 +0200
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 82D03CC0CC7;
	Tue, 21 Oct 2025 08:40:05 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: fsl-ls1028a: fix USB node compatible
Date: Tue, 21 Oct 2025 08:40:05 +0200
Message-ID: <5053235.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aPaXaFigEh50sdZC@lizhi-Precision-Tower-5810>
References: <20251020133754.304387-1-alexander.stein@ew.tq-group.com>
 <aPaXaFigEh50sdZC@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay04-hz1.antispameurope.com with 4crN2Y6qXhzRjXw
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: fc7bbb2e0881c9dff808c6ef9b35ca67
X-cloud-security: scantime:2.297
DKIM-Signature: a=rsa-sha256;
 bh=Z2BoxPYyqOK4bolIbnOAqTEAwN1RnM0dwCy8BYozWgc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761028816; v=1;
 b=ovcVet+b5l4m32d0bfNTOIQVwxRDpScfmAVEgA3uP24Qtl5gw/5kbzRun04ZC81YIn9/6hlM
 XxeRE+ceaeBfyDWxQoC0SeKl7W7tUBIgw1piNV+51FirTjyMSQrIeWwGNZS9VUp+XrZ/DQHgGiP
 Eqk2+ZO6ZNYmZKAspnkqcD+sEv1FLfvcOPOJwb30ik8ONG1UOQj/UbMKxb0PPGFQiwCsvaMUFkh
 V7/bCF+AynltMvh8wrstdvetOS0HosTo5JG1YphgqeP9Af79KKsEToEbccxIAfMMm75qB09kuod
 EB0gSZkZcsezxv9l+bhGPfMgiIcEiLfzmbQ2Ek87iwesQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_234507_414201_ABC91CB2 
X-CRM114-Status: GOOD (  17.94  )
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

Hi Frank,

Am Montag, 20. Oktober 2025, 22:11:20 CEST schrieb Frank Li:
> On Mon, Oct 20, 2025 at 03:37:53PM +0200, Alexander Stein wrote:
> > usb/fsl,ls1028a.yaml says the compatible is just a simple
> > 'fsl,ls1028a-dwc3'
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Thanks, but it is similar with last patches of
>=20
> https://lore.kernel.org/imx/20250929-ls_dma_coherence-v5-4-2ebee578eb7e@n=
xp.com/
>=20
> Waiting for shanw pick dts part.

Ah, I missed that. Thanks for the link

Best regards
Alexander

>=20
> Frank
>=20
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm6=
4/boot/dts/freescale/fsl-ls1028a.dtsi
> > index 7d172d7e5737c..ddfb007dda920 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > @@ -613,7 +613,7 @@ gpio3: gpio@2320000 {
> >  		};
> >
> >  		usb0: usb@3100000 {
> > -			compatible =3D "fsl,ls1028a-dwc3", "snps,dwc3";
> > +			compatible =3D "fsl,ls1028a-dwc3";
> >  			reg =3D <0x0 0x3100000 0x0 0x10000>;
> >  			interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> >  			snps,dis_rxdet_inp3_quirk;
> > @@ -623,7 +623,7 @@ usb0: usb@3100000 {
> >  		};
> >
> >  		usb1: usb@3110000 {
> > -			compatible =3D "fsl,ls1028a-dwc3", "snps,dwc3";
> > +			compatible =3D "fsl,ls1028a-dwc3";
> >  			reg =3D <0x0 0x3110000 0x0 0x10000>;
> >  			interrupts =3D <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> >  			snps,dis_rxdet_inp3_quirk;
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



