Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BFFD767FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqV1TxuZGmM0+l+LbeX4CZHJeCwyepPdOcdQFGFKo1c=; b=QgzWvA3DRBzQJzKsHAEfaBdLxb
	Ck4PQhvht08bFPkv1aDnZdPOmqaIryz5knIfr2TFyLs8XL3KKXFpScNkF+AEk8n5BTIrTGt13DW1A
	S55Lb56CpEWgwofcJneP2vqGr6zZYzrHPm2JgKQtRMPLkte4EU6qJQAPMy3iaVbnh3/LBw5YqcKb3
	uogNJakgnXojjbNFunbDzfwNbONRakArHW989sXX3gKK0QVIVcU007+ckOjinJjyJZPHwNxk83LQY
	HBmF2q/ShNW1g3EayGKbFk6dpF+oMqF6kXgi7VXva7L9TYIEVoB1U4/x+SscpyGG8PiS3UNpe469C
	IedgE8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaBi-0000000AKlk-2eTV;
	Fri, 19 Dec 2025 13:06:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaBg-0000000AKlC-1AKY;
	Fri, 19 Dec 2025 13:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766149581; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GmOprmdjNaFHk6r6ISU1szVfxMlr/+pLO2C+weD2Rv4jD8wnNcugOy+YO2M3bo2+PZAr4ozOIVPHucvwrdzJRdZ1DfaJ/G0FQFNY8UJ/AjqFiL2LvvUTXpSeA9rIB8kBh31UsPC2Ul+iu/0kDI9bdas0jcbpvcT+gAMGOy2ohO8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766149581; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GqV1TxuZGmM0+l+LbeX4CZHJeCwyepPdOcdQFGFKo1c=; 
	b=fE7F3kB6LAwNlS7W94d1iezckMYLkR/ngheNSK97dhE8Yjw+yTXOH3PvuBBSyJRks1qc/dDL6ywlOchnClZxGzHxG52t7Yj4f8mvJj1/1/DyAvveh5tefNGxcGDxJovozi3lEt8jPWL7YPPyvOf/L7V2PeC3jiYpuMfi27+4lEw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766149581;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=GqV1TxuZGmM0+l+LbeX4CZHJeCwyepPdOcdQFGFKo1c=;
	b=U3zPlNJ46asIrZunAiVyNdQwQnHLj85spUcDSI7cTRefvUfw/tiU49oiLP4yZYDF
	jde88XzHjxuGSTqcXYIK5+aMGoz7C6qcgkD33XzT4pv58xgOuioFBIS4C/Unr/a0CLF
	VI+oPnrIBJdT6uXnpqgmmOBJ8cJZV94NN8mDvZVY=
Received: by mx.zohomail.com with SMTPS id 1766149579059588.8359306488277;
	Fri, 19 Dec 2025 05:06:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Martin =?UTF-8?B?SG9sb3Zza8O9IChQcm9iYWJseSBOb3RoaW5nIHMuci5vLik=?=
 <mh@probably.group>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: enable both 2.5GbE ports on Rock 5T
Date: Fri, 19 Dec 2025 14:06:12 +0100
Message-ID: <3903009.mvXUDI8C0e@workhorse>
In-Reply-To: <034BDB37-34FB-441F-B79E-1631CA501576@probably.group>
References: <96516D1F-9787-47FE-A67E-4745D11D9207@probably.group>
 <034BDB37-34FB-441F-B79E-1631CA501576@probably.group>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_050628_391405_0E254AEF 
X-CRM114-Status: GOOD (  17.47  )
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

On Thursday, 18 December 2025 07:27:06 Central European Standard Time Marti=
n Holovsk=C3=BD (Probably Nothing s.r.o.) wrote:
> The Radxa Rock 5T board features two RTL8125B 2.5GbE Ethernet controllers
> connected via PCIe lanes pcie2x1l0 (fe170000) and pcie2x1l2 (fe190000).
> Currently only one interface is functional because the PCIe controller
> nodes lack the necessary reset GPIO configuration.
>=20
> Without the reset-gpios property, the RTL8125B PHYs remain in reset state
> and are not enumerated by the PCIe bus. This results in only one Ethernet
> interface being detected, or none at all depending on U-Boot initializati=
on.
>=20
> This patch adds the missing configuration for both PCIe controllers:
> - Enables both pcie2x1l0 and pcie2x1l2 nodes (status =3D "okay")
> - Configures reset GPIOs (GPIO4_PA5 and GPIO3_PB0 respectively)
> - Adds corresponding pinctrl definitions
>=20
> With this change, both 2.5GbE interfaces are properly detected and
> functional on the Rock 5T.
>=20
> Tested on Radxa Rock 5T v1.2 running Linux 6.12.
>=20
> Signed-off-by: Martin Holovsky <mh@probably.group>
> ---
> Changes in v2:
> - Sorted pcie nodes alphanumerically
> - Sorted pinctrl nodes alphanumerically
> - Added Signed-off-by line
>=20
>  .../boot/dts/rockchip/rk3588-rock-5t.dts      | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64=
/boot/dts/rockchip/rk3588-rock-5t.dts
> index 0dd90c744380..aeb8e0d42f09 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
> @@ -68,10 +68,24 @@ &pcie2x1l1 {
>  	reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
>  	status =3D "okay";
>  };
> =20
> +&pcie2x1l0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_0_rst>;
> +	reset-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> +	status =3D "okay";
> +};
> +
> +&pcie2x1l2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_2_rst>;
> +	reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
> +	status =3D "okay";
> +};
> +
>  &pcie30phy {
>  	data-lanes =3D <1 1 2 2>;
>  };
> @@ -101,6 +115,14 @@ pcie2 {
> +		pcie2_0_rst: pcie2-0-rst {
> +			rockchip,pins =3D <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
>  		pcie2_1_rst: pcie2-1-rst {
>  			rockchip,pins =3D <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
> +
> +		pcie2_2_rst: pcie2-2-rst {
> +			rockchip,pins =3D <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
>  		pcie2_0_vcc3v3_en: pcie2-0-vcc-en {
>  			rockchip,pins =3D <2 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>=20

This stuff is already in rk3588-rock-5b-5bp-5t.dtsi. Ergo, this patch
does nothing at all. What are you actually trying to solve?

Heiko, please don't apply this.

Kind regards,
Nicolas Frattaroli



