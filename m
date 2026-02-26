Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852B1FC592C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUn9csnyj4e4zd3fT0P+1ubmMOmYC1BISsEuxDwjNs4=; b=vX9c4hsqli8828WC3d45bE8H2e
	rhgW4qmhs/Z79Ef6CXUIkWt1O3TViQ/m/8JLapNglKag4Rc1CBl0HE7IRAkadq5L+JmP402DcnkZR
	3oY/9TaPwLoVG7ntyL9SFSKKtT6u4lGXsRWQr9BhOkYdt1Hpu+9O9ZJvGBebLXa6d+QCjusIVqA94
	I2ascrpK8pfoYZ1WSFYkPMikoD7FnKyl7KYFmuLMcZ6cHhs48wnkODetRwnknjhJwFBZk9DPfLkfb
	AXOWq/rp4SMWo4goHxn4K1k1nvJUXSClzzRopmRZwX5VWK4Xk/Hlh+TaGjFE6O5xTSr06hTwsHn/I
	XgC5D21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYYO-00000005uAe-23rE;
	Thu, 26 Feb 2026 10:25:08 +0000
Received: from mx-relay97-hz1.antispameurope.com ([94.100.132.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYYK-00000005u9T-0jxJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:25:07 +0000
ARC-Authentication-Results: i=1; mx-gate97-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=kUn9csnyj4e4zd3fT0P+1ubmMOmYC1BISsEuxDwjNs4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772101483;
 b=ZZ4kY1VCe1wsAqgBXMUyMQbIDBG5T4oyGUg8t4Uw5LE8nWprJuHuYSNHfnXUxVs/4A5XV2hy
 YoSa0/X9u5nITcPncKhv//Hted2OO4xeTWCsK65pVOKOgtg8jOtlBXhZiwkRvUVdD/mg8AKO1fQ
 2lIkG3DkCcxBKpVnBmD46J8gY0WTQRY63RwgwehX278f53rYrfY2MYZrAmQCIxCJEWylqmNJsJv
 7xjCgkTH9sar6XVD56IUvrKUENw3GeuZi1b0L09x/XSmY7hKTv/4pPODKZubC2H1CvM1JXZ8XQK
 nOlbuZhjkJPXuBhzQZwxG5KyZMCP0O03X2Ix5RFxaDb9w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772101483;
 b=P0fI8gM7KKuwRB83M8u7F41PzMPx99as56C16TO1ZdQtTWDZOO/nzP0FIW5rC8YQOh6UzD5w
 S4O3237lxqUPxWZQubOam0UK7DaI9Ek5X42rG0dUSb0pE1BXlgYZ97W1q48RtbxanvvNU0HtBXR
 pITIchhzfW2I5qLeNYzTz5ErtzUv4kJg35YetNSN0l6nc+iwt/L14gF7VaPB6cWqodOUU/nLW/t
 ETDA43sTKyLdz7q4Hwaw57QAI5P1EtFqXWg6tVo6IWq1mPydjKXHVyzdPW3E5KG9KIR72A60+x6
 GN1lH/PjEMfk6zeoMeqpI3EnSwAm+Nal6whWdGIS782Tg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay97-hz1.antispameurope.com;
 Thu, 26 Feb 2026 11:24:43 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id E9B992205B2;
	Thu, 26 Feb 2026 11:24:27 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 markus.niebel@tq-group.com, matthias.schiffer@tq-group.com
Subject: Re: [PATCH] ARM: MAINTAINERS: TQ: Orphan TQ Systems boards
Date: Thu, 26 Feb 2026 11:24:27 +0100
Message-ID: <2403960.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260225171135.122955-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260225171135.122955-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay97-hz1.antispameurope.com with 4fM6yN64Qkz27lDm
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 5f8ca20172c337f721ff1e894cd67a83
X-cloud-security: scantime:1.864
DKIM-Signature: a=rsa-sha256;
 bh=kUn9csnyj4e4zd3fT0P+1ubmMOmYC1BISsEuxDwjNs4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772101483; v=1;
 b=o6kugo0D7aCWHVXqBY8k3VJpiM/+GlzwMZyI5Czs1x3cI+Zab3G8qgOGlyGWDhnPi9cVGHX4
 y20FqvMX2vb+Lrp15Akomj+TIrbYZqh5MoaaQwAJaSBJl/Nu2/rUrE4FP/c81S5vkG5s7ttR8XR
 x5Db8ExWSIhBX7+6OlJnlxKoBnVMHuKf9x/6eMsEkADcGBJZagaBsriA0g2ElxwQ2mlCpLlK6OC
 YfrubfoSG63CQ+HwOBNql3md6kPsP66AxprNcdy06duvg125O5ajXnHlL7voPmnoCCTvgICkuid
 g3X8hjG/S2HdonnlSvHFmkFfsZ3z3PjUb1d0iwENK4WpQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_022504_469299_D209C1D5 
X-CRM114-Status: GOOD (  17.23  )
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

Hi Krzysztof,

Am Mittwoch, 25. Februar 2026, 18:11:36 CET schrieb Krzysztof Kozlowski:
> Emails to all TQ maintainers bounce for a month or longer, because their
> systems decided to block smtp.kernel.org.  This is nothing which can be
> fixed by Linux Foundation IT staff, but aggresive and irresponsible
> email provider.
>=20
> There were no answers from linux@ew.tq-group.com or anyone else in TQ
> Systems after my inquiries about this problem, thus assume the mainline
> efforts are abandoned.
>=20
>   <Markus.Niebel@tq-group.com>: host mx01.hornetsecurity.com[94.100.132.8=
] said:
>     554 5.5.4 Your IP address 172.105.4.254 has a bad reputation.
>=20
>   <matthias.schiffer@tq-group.com>: host mx01.hornetsecurity.com[94.100.1=
32.8]
>     said: 554 5.5.4 Your IP address 172.105.4.254 has a bad reputation.
>=20
>   <alexander.stein@ew.tq-group.com>: host mx01.hornetsecurity.com[94.100.=
132.8]
>     said: 554 5.5.4 Your IP address 172.105.4.254 has a bad reputation.
>=20
> Cc: markus.niebel@tq-group.com
> Cc: matthias.schiffer@tq-group.com
> Cc: alexander.stein@ew.tq-group.com
> Cc: linux@ew.tq-group.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for rising this up and sorry for the delay of my response.
We are still in the process of resolving the mail filter issues.

NACK for the patch though. Our mainline efforts are not abandoned and
we still support our hardware.

Best regards,
Alexander

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index faa914a5f34d..f446fb30cf6c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26781,7 +26781,7 @@ F:	drivers/hwmon/pmbus/tps546d24.c
> =20
>  TQ SYSTEMS BOARD & DRIVER SUPPORT
>  L:	linux@ew.tq-group.com
> -S:	Supported
> +S:	Orphan
>  W:	https://www.tq-group.com/en/products/tq-embedded/
>  F:	arch/arm/boot/dts/nxp/imx/*mba*.dts*
>  F:	arch/arm/boot/dts/nxp/imx/*tqma*.dts*
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



