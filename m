Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1230606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bSKzkggj;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=zdYbA7OO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=advfz8qU7dnMlSXaKuDgnefU48uHbLndv3sHhQbWPMw=; b=bSKzkggjdLWJzPR32eQIaKiRKf
	P5Cysaj/Ybyf8Pa0oiYk+JZtEv96Gn90afApKbGpm4827X1PjXGeEM2MCIO13RYVZX+ivngJeMg1Q
	fomCUCcw+lw0EYuYfo6adUhqi7sR/HFl8ViQj+C7tXdIcZ/yjlG+qJiJCm4ZLw1WpwiMXosARXINH
	7ed9HId46I655pQcjtDrhzlf1dd423iaWmobZD2KA+uVebYU7N4iTYH9sC2gTGn9bYhiOu2DZvXL1
	4wnD609a//FR2r0JsE67kRflihackRXfUiqhLtynNNmdQyXmqYMX8Q0giT48tsqC695BUG3usM7a5
	i1RNFkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYdK-000000053t1-2HOi;
	Wed, 04 Nov 2026 10:54:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYdI-000000053sC-0CQF;
	Wed, 04 Nov 2026 10:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=advfz8qU7dnMlSXaKuDgnefU48uHbLndv3sHhQbWPMw=; b=zdYbA7OObWwvo7rs7AE3iCVGzj
	BDWigqB1/746eJLXXkDf5qazrTOAWtpR6IXVUy5F4lAy5LRoWZzSvOuDDxhuxlWORs7Qh69SwEZHc
	/9XupRpbA4WLdDHRfdMCjKF3Z6gu12ueLkcIdQmUVPxsP9aWKjSFXTyd9KVC5arkHdNzBjEbyymlN
	BWkvNbJCMZ/yMIKfdw/XZIRe7TItZc9UJTFoBH0IcZQYPT5jLnIgAPXCbtTEVaKoSrJRTb8+SKCSY
	LbXBS/G7gGrWxExn6fTQEFPtVasKqtTGmql2SVnWJq0h+v6qQkSjC7PI+cWefytkCnlECJnArTLKw
	e6i1O+cQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 ulfh@kernel.org, p.zabel@pengutronix.de, ogabbay@kernel.org,
 zhangqing@rock-chips.com, Jiaxing Hu <gahing@gahingwoo.com>
Cc: royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
 u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 jeff.hugo@oss.qualcomm.com, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>, chaoyi.chen@rock-chips.com
Subject: Re: [PATCH v15 14/15] arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
Date: Wed, 04 Nov 2026 11:53:47 +0100
Message-ID: <2915499.MsWZr2WtbB@diego>
In-Reply-To: <20261101082307.151957-15-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
 <20261101082307.151957-15-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_025420_094910_8A8EA12F 
X-CRM114-Status: GOOD (  15.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Sonntag, 1. November 2026, 09:23:06 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Jiaxing Hu:
> Add the two RKNN cores and their IOMMUs, disabled, and label PD_NPU so a
> board can give it the NPU rail. Each core lists both core domains, its own
> first, as tested.
>=20
> Assign CLK_RKNN_DSU0 594 MHz. Nothing in mainline sets its rate or the NPU
> rail, and at the 786 MHz it comes up at, on the 750 mV a ROCK 4D boots
> with, two cores running together write wrong words, 11 to 25 in each pass
> of 5400 rows. 594 MHz is clean, and Rockchip's OPP table asks only 725 mV
> of its 500 and 600 MHz steps.
>=20
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 74 +++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index ea9229b6e6f5..80943d748bfa 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1057,7 +1057,7 @@ power: power-controller {
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> =20
> -				power-domain@RK3576_PD_NPU {
> +				pd_npu: power-domain@RK3576_PD_NPU {
>  					reg =3D <RK3576_PD_NPU>;
>  					#power-domain-cells =3D <1>;
>  					#address-cells =3D <1>;
> @@ -1284,6 +1284,78 @@ power-domain@RK3576_PD_VO1 {
>  			};
>  		};
> =20
> +		rknn_core_0: npu@27700000 {
> +			compatible =3D "rockchip,rk3576-rknn-core";
> +			reg =3D <0x0 0x27700000 0x0 0x1000>,
> +			      <0x0 0x27701000 0x0 0x1000>,
> +			      <0x0 0x27703000 0x0 0x1000>;
> +			reg-names =3D "pc", "cna", "core";
> +			interrupts =3D <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cru ACLK_RKNN0>, <&cru HCLK_RKNN_ROOT>,
> +				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>,
> +				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
> +			clock-names =3D "aclk", "hclk", "npu", "pclk",
> +				      "aclk_cbuf", "hclk_cbuf";
> +			assigned-clocks =3D <&cru CLK_RKNN_DSU0>;
> +			assigned-clock-rates =3D <594000000>;
> +			resets =3D <&cru SRST_A_RKNN0>;
> +			reset-names =3D "srst_a";
> +			power-domains =3D <&power RK3576_PD_NPU0>, <&power RK3576_PD_NPU1>;

Why do you need both power-domains here?
The naming does suggest each belongs to one core - similar to the rk3588?

If each core really needs both domains, please state this explicitly.

Rockchip sadly does not provide RKNN documentation the first
two parts of the TRM.


Heiko




