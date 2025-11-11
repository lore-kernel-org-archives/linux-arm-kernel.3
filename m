Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7D7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cd8tiR4oA2bomVQnghj6XdfSPPBJKKlunliO1VnFlM=; b=1CFHsiS477PGW+bocuVhheRE+H
	dTyh3cXOTfGtZS1h90UHs8E7vsxTFbbv1AOH0n5YkWaDD0K84HFT2q/o6H8aErqIddw+1SgpaEo57
	olESu/CrFnIkZLexTH1+hwCAez0ly4HGM1Go3Ce52cYZsBO4wGRYd8iuZGs4Wj8cRsEdJdNo17Gd3
	OKXeVsgmk0ABegTM205rtoeG0XogUfTHr0j3woSrx8TT1+XTPPIwCvA44eEMSLovNyCINf7p3Ljz4
	VyNDagJB6OegTLRiEtJNMZUHKedkrozjESQ/uxUvX3IrN2t/MU0HRzwyOaU4rPYKd6nkaES7JEQ+P
	SQebPL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlNx-00000006ur5-1u1S;
	Tue, 11 Nov 2025 10:14:01 +0000
Received: from mx-relay106-hz1.antispameurope.com ([94.100.133.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlNs-00000006uoJ-24BS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:14:00 +0000
ARC-Authentication-Results: i=1; mx-gate106-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=5cd8tiR4oA2bomVQnghj6XdfSPPBJKKlunliO1VnFlM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1762856021;
 b=LkzaH7WXokFFlDrSmk2lnGFGXk+7osNT76Z5TVuYSL4uDLh6hxClbWMwMbNnz9zpSJmwCTUw
 B7P1wiPI6Bd4QuhoEMyIIuNx5IBEKl5BMg+nDaWjDfsDqKE6pHycvGlrV4EB68QwWe2KmIcYyVq
 /4QgxTFQFT1PyXgYmk0CRPIgHU9nHklyTh8h184R8B4qYhH3NYGRH7HjB0B353z9z37qq8Wo1ys
 raCQT6ryK0ngfPtkycrg5umxYXKqmjUyDGtNtXwbXx+yh2GIP1vXJDWNeFYSk7kaxeDgamJ+Iuf
 Vab63lCbvvUOJ9C3ymFNt9QhN3Z1SRiwAQ9zYPH5nsgMA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1762856021;
 b=qCm81avoyE3bo4kB/6YJ9Nul2GT7HGiyQDkvHzHCjs+HWgyJhiGYOw9/YTMK7ApcclibRHAK
 2uLvvxpngoXSuUY64VQW8h4XzpqYo+/2HzK7ef5N/zf4Znc0LDvZHBde9+f9mZ4igAME41gy6wH
 MfUc9gETSiBznoIzy4M6JzdVO09LAxSV7PVj6Tdr86s75KUwJ7f9pXAJPtbYRGpWoJ9V2dpROcq
 3jQnMhZcXziBSKVsLMtZAoejMP4+n+cpsZUmQQBNiax1qImjbcHMSq8bkI4UPOdiq03uuy7uwrU
 Y5/SAPLasxHXY2odWZU6l7CKc8Bd5WdSeqm6zpx3dSU5Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay106-hz1.antispameurope.com;
 Tue, 11 Nov 2025 11:13:41 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3B9AC220C9E;
	Tue, 11 Nov 2025 11:13:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
 Li Jun <jun.li@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 4/9] arm64: dts: imx8mm-evk: add wakeup-source for usb phy
Date: Tue, 11 Nov 2025 11:13:25 +0100
Message-ID: <2809731.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251110-misc_dts-v1-4-7564b9f69a18@nxp.com>
References: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
 <20251110-misc_dts-v1-4-7564b9f69a18@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay106-hz1.antispameurope.com with 108FA11C9E97
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 98cd9670ad177dc9a441365add1c322b
X-cloud-security: scantime:1.834
DKIM-Signature: a=rsa-sha256;
 bh=5cd8tiR4oA2bomVQnghj6XdfSPPBJKKlunliO1VnFlM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1762856021; v=1;
 b=GMfvTtbQKjVYw8R7m+kSrof9QRO4fzPqfLA05rshLLFJGCr+XsU8b++eWCLn9E0iS3oPCd8Q
 w4pAc67N9HRs/rRlYuxj8a1b44nTo5tZzVo46eGOpTebUEi3Yr3cgeVsPQVJAqV5Ek6vbsG4r1n
 MVOf8k0QG5mwCbZ2GH6fHKftq1IIGiS14uObQ9eq/mqYzSpTIYSswUzCU/3vQys/MFvluPHc2WV
 gdx1GvUqrztzkvmxJR03AnGNpKiitbYxLq6a/RzGKaXTfoR+GJd7OkUJaU8Oh2PhCXY7g7M4GJY
 zHS4B8Foi0l8nPmr/aYbjCqc2nQ56nIGlRdEThO/L98gQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_021356_894849_D613816D 
X-CRM114-Status: GOOD (  13.52  )
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

Am Montag, 10. November 2025, 21:54:44 CET schrieb Frank Li:
> From: Li Jun <jun.li@nxp.com>
>=20
> USB phy can be wakeup source to support wakeup system from USB.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Typo in subject: Just imx8mm. Remove the '-evk'

Best regards,
Alexander

> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mm.dtsi
> index ed8b4843acb4804379ba025e83a63fe962c2937e..dfff164db827e80ef8822ae33=
0fa604d1642f6f9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -274,6 +274,7 @@ usbphynop1: usbphynop1 {
>  		assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL1_100M>;
>  		clock-names =3D "main_clk";
>  		power-domains =3D <&pgc_otg1>;
> +		wakeup-source;
>  	};
> =20
>  	usbphynop2: usbphynop2 {
> @@ -284,6 +285,7 @@ usbphynop2: usbphynop2 {
>  		assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL1_100M>;
>  		clock-names =3D "main_clk";
>  		power-domains =3D <&pgc_otg2>;
> +		wakeup-source;
>  	};
> =20
>  	soc: soc@0 {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



