Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523D6C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2tV2waLfrz+hH7M5PM5u39hRzN3D90MNpx1km/idhU=; b=DabI+YR407B55YwtLux7jDq3iN
	q/pFv0WEHgm4TejfBSeSGC3il70LvHR/Qnm/ZHQqo/iurnt/Q3mzk2YKuvqi8swHCUHY3Os2kQh5n
	VFAUD1OzeTgNHCklZRUl3OwFe4Q3fD4zNkL5st0Mvn2r4b5JZDg51Awz3Zi+p/Qr2LLpP1A4/vXyg
	PjZLHyJgTjpaytFK1XSQQMHfC8BMhaEbTcvDFzMtnZnhG6cF/ZFrf/9sxjgC7R7KkavDZ19HsMZpm
	8T4wBX6HElTDkf7DCD0Ba8roWVumeeOaoJ6qLcasrYT103XcMuih5TqEfQjkw0JOnfR4bQ89blr0R
	+Af/aJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt00R-0000000A99q-0Yqt;
	Sun, 09 Aug 2026 09:39:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt00P-0000000A99N-04TQ;
	Sun, 09 Aug 2026 09:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=e2tV2waLfrz+hH7M5PM5u39hRzN3D90MNpx1km/idhU=; b=zZEPnCMzwhtm9l/12WM55pnpXJ
	aXqeg/pf8AM+3OfOkQm9xRDfhU877IiEfaiycVhVXjJXKgtO9/vshQht/ubQcimNW1RFBwadzEPx8
	gcFFCrOWc4XUdKhMQkNiX7tRF/K1utYsd18M/xf2uapKYbsXdu/GKDsUq+oKhOT6HCCXgOTgTm9V2
	3NPXNTMiFx5s91rKAyXPEyulaFJ8X/gPnklIxGSmFz6ype0gW9/xoR4OQqO6kNiaP4MB5RhLhZV43
	KjE36/0/e2HHZ0lO6K2JNMrgNf0OVSrNJJq8Vz7CrQPKFKNbHNpd8lHblTOy4WNvIdBpd4s42FsR6
	NXdMd7hg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Ye Zhang <ye.zhang@rock-chips.com>, huang lin <hl@rock-chips.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] pinctrl: rockchip: Decode drive strength in the get
 function
Date: Sun, 09 Aug 2026 11:39:33 +0200
Message-ID: <8942531.Sb9uPGUboI@diego>
In-Reply-To: <20260729132736.3807082-2-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
 <20260729132736.3807082-2-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_023945_138635_DE76EE49 
X-CRM114-Status: GOOD (  18.45  )
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

Am Mittwoch, 29. Juli 2026, 15:27:25 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> The decoding of the 2-bit and 8-bit level drive-strength values sits in
> rockchip_set_drive_perpin(), where it is unreachable: the SoCs whose
> banks declare these drive types (RK3506 and RV1103B) take the early
> ctrl->type branch in the set path, and the read-and-decode logic in a
> set function has no purpose. Meanwhile rockchip_get_drive_perpin()
> lacks the decoding, so pin_config_get() and the debugfs output report
> -EINVAL for these SoCs.
>=20
> Move the two cases to rockchip_get_drive_perpin(), where they belong.
>=20
> Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>=20
> Changes in v3:
> - Add new patch moving the drive-strength decoding to the get function
>=20
>  drivers/pinctrl/pinctrl-rockchip.c | 38 +++++++++++++++---------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
=2Drockchip.c
> index 7e0fcd45fd26..08a46a04a815 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3267,6 +3267,25 @@ static int rockchip_get_drive_perpin(struct rockch=
ip_pin_bank *bank,
>  	case DRV_TYPE_IO_1V8_ONLY:
>  		rmask_bits =3D RK3288_DRV_BITS_PER_PIN;
>  		break;
> +	case DRV_TYPE_IO_LEVEL_2_BIT:
> +		ret =3D regmap_read(regmap, reg, &data);
> +		if (ret)
> +			return ret;
> +		data >>=3D bit;
> +
> +		return data & 0x3;
> +	case DRV_TYPE_IO_LEVEL_8_BIT:
> +		ret =3D regmap_read(regmap, reg, &data);
> +		if (ret)
> +			return ret;
> +		data >>=3D bit;
> +		data &=3D (1 << 8) - 1;
> +
> +		ret =3D hweight8(data);
> +		if (ret > 0)
> +			return ret - 1;
> +		else
> +			return -EINVAL;
>  	default:
>  		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
>  		return -EINVAL;
> @@ -3390,25 +3409,6 @@ static int rockchip_set_drive_perpin(struct rockch=
ip_pin_bank *bank,
>  	case DRV_TYPE_IO_1V8_ONLY:
>  		rmask_bits =3D RK3288_DRV_BITS_PER_PIN;
>  		break;
> -	case DRV_TYPE_IO_LEVEL_2_BIT:
> -		ret =3D regmap_read(regmap, reg, &data);
> -		if (ret)
> -			return ret;
> -		data >>=3D bit;
> -
> -		return data & 0x3;
> -	case DRV_TYPE_IO_LEVEL_8_BIT:
> -		ret =3D regmap_read(regmap, reg, &data);
> -		if (ret)
> -			return ret;
> -		data >>=3D bit;
> -		data &=3D (1 << 8) - 1;
> -
> -		ret =3D hweight8(data);
> -		if (ret > 0)
> -			return ret - 1;
> -		else
> -			return -EINVAL;
>  	default:
>  		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
>  		return -EINVAL;
>=20





