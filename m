Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2184CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mb9T7/XqnSjsJ0QZFf0vmO3IhoiW97BIVEs9q7ZQRnU=; b=Avu7odPL0VostkhHA2pl6KGFqt
	v4vC15FqW+iiQtCSfrqFeRVzOZ/T91ralt3R0mdXFaYFv1V+Jn2NBs6JroJHTT9CvXOLZXGer5sU/
	4thpDQSV36dRrhuZp0yc0/X2fikQOM+6K2tVE/elo0HeXEy6iFca8PbUoLmQlZnT3jsGm8l4BNCDC
	N6ZtMQO3deNzgYKSF7vyB1oCMFOuVxP6jmzJjH6w1IutqP0TSw9gR2Z92llmFduMDUr65gKvtwl28
	dC5WJ7EE7hVYD2qcWITczzyxuCLXbuEaxMjfICEpgC90QUyGsOzGNTIBbUlgEUUjdOBYDahyz4NvI
	ro6QniQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYNy-00000004gW6-4Ahn;
	Thu, 30 Oct 2025 19:32:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYNv-00000004gVW-1j3W;
	Thu, 30 Oct 2025 19:32:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCBBA40810;
	Thu, 30 Oct 2025 19:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E56C4CEF8;
	Thu, 30 Oct 2025 19:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761852754;
	bh=iGCxq+nOC/gm/4t2m2k1i6Pdm4+kZ75nPWFm76rh8DM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u41ac5T0O6qtGzbuC88TnasgBH+1jd1AwJpS+B5g1fCypV2oXXyaCH77gKLTelu+N
	 5x8vhVUniIxZxImSHqVhB8OyY/YQDOM/xJ94vnyeTtYWWoJLgIDAzdWWA0Mzpl+IQa
	 yVS983TUUu50CWfnaxMN256DfoGKh41xUAar2B9Yapd7nuhBr85+o9BdDATMn/1MzK
	 p9WbRE4NOvfa/f6A42jg0P4xXsD3dqPBU3WYbUJxNgfoOpWVut4JjF8HbDcSCHus7w
	 HKSKKsihWTxyoHYnBTHrThyZb+xLjMSVQwt/hYDjPKtTkCbhhdBE1viFO5TnLIXkRF
	 9CfVbXv5eqYxQ==
Date: Thu, 30 Oct 2025 19:32:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Jack Hsu <jh.hsu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, srini@kernel.org,
	ukleinek@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
	chunfeng.yun@mediatek.com, wim@linux-watchdog.org,
	linux@roeck-us.net, sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com, jitao.shi@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 07/11] dt-bindings: usb: Support MediaTek MT8189 evb
 board xhci
Message-ID: <20251030-underwent-courier-1f4322e1cb34@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-8-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W0QGy4D+uQ2gIdd5"
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-8-jh.hsu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_123235_486916_3FAD1C75 
X-CRM114-Status: GOOD (  15.66  )
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


--W0QGy4D+uQ2gIdd5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 09:44:39PM +0800, Jack Hsu wrote:
> modify dt-binding for support mt8189 evb board dts node of xhci
>=20
> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml         | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml=
 b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 004d3ebec091..05cb6a219e5c 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -34,6 +34,7 @@ properties:
>            - mediatek,mt8183-xhci
>            - mediatek,mt8186-xhci
>            - mediatek,mt8188-xhci
> +          - mediatek,mt8189-xhci
>            - mediatek,mt8192-xhci
>            - mediatek,mt8195-xhci
>            - mediatek,mt8365-xhci
> @@ -119,6 +120,9 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  reset-names:
> +    maxItems: 1

Is this reset required on mt8189? Does it appear on other mediatek xhci
controllers?

> +
>    usb3-lpm-capable: true
> =20
>    usb2-lpm-disable: true
> @@ -168,7 +172,8 @@ properties:
>              104 - used by mt8195, IP1, specific 1.04;
>              105 - used by mt8195, IP2, specific 1.05;
>              106 - used by mt8195, IP3, specific 1.06;
> -          enum: [1, 2, 101, 102, 103, 104, 105, 106]
> +            110 - used by mt8189, IP4, specific 1.10;
> +          enum: [1, 2, 101, 102, 103, 104, 105, 106, 110]
> =20
>    mediatek,u3p-dis-msk:
>      $ref: /schemas/types.yaml#/definitions/uint32
> --=20
> 2.45.2
>=20

--W0QGy4D+uQ2gIdd5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQO9SgAKCRB4tDGHoIJi
0soAAQDNsik8zgyDq1CJEDvhDCDIrIOJlea5QC3W8+UKQZXN9wEAy7Gh90cGt4nY
42Kle5H3RlFGQAZQQgg/cPi5ol120wM=
=FAxM
-----END PGP SIGNATURE-----

--W0QGy4D+uQ2gIdd5--

