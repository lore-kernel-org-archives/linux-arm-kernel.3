Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557C1E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 02:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+JuCaHyP3h5GlJNAz/MUfxcAGzf5JyI5EjkjHGule8=; b=1NbZHfKo1wz7+/m6TlvffQhTad
	GSJBCaYn3aUWTnWMSBVaes3uvewNO2RV7KCvOekgKG1CZiOshMXZhmpCk+Voyw2ADXViRuW/K2+1H
	L0OOVsr0YwIp8f9nvQ2sYb3SwDcbPH24Asg1ikfaoObp7oqlj7L+Z02TpjPwmlO6iYFmMLA5Wlqi2
	Pl2RwhGpDstsPYzBorNXmYYoxQY3sNUUlNIWZOEy0RcfZTpZxlvJTDlBWz/Q+9Qtmo/VuRVSfupjn
	X72OxBCdCiLnwOt0jIJxahcIEV7Hn23DJMq/xcsfc5DlPgwk5cmK4SNTqocZQ1YjKWmwS26HdciWm
	jeUwiSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsXiG-00000009Csr-03md;
	Wed, 18 Feb 2026 02:54:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsXiD-00000009Cry-0wfv;
	Wed, 18 Feb 2026 02:54:50 +0000
Received: from neptunite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:e39a:e0d4:739a:978])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 457AC55C;
	Wed, 18 Feb 2026 03:53:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771383231;
	bh=tUAWp2kXb7nKs705e+REMwmQUKWD1H5m05HAOvz39C0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sRfkBMWTJmduEcr8fSHCHPPPZ9ohmPRqOb+weJ5rB5AL5I2BeOTT/qQcyM1qh0a7V
	 P1HpM1QF9FjceIVpNJ2+TR5M54agiMSQ7IG/o+wXG/dGbo9tkF6qogRYolcs4DHqcx
	 U+uT+2bpe8lYJBwvEDRIW9skGbut/QZth4RBTKC0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260216-rkcif-fixes-v1-1-b16db20b6d68@collabora.com>
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com> <20260216-rkcif-fixes-v1-1-b16db20b6d68@collabora.com>
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: fix off by one bugs
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Michael Riesch <michael.riesch@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 18 Feb 2026 11:54:35 +0900
Message-ID: <177138327574.607498.2921551745951217715@neptunite.rasen.tech>
User-Agent: alot/0.0.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_185449_722357_69157708 
X-CRM114-Status: GOOD (  14.78  )
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

Quoting Michael Riesch (2026-02-16 22:49:56)
> From: Dan Carpenter <dan.carpenter@linaro.org>
>=20
> Change these comparisons from > vs >=3D to avoid accessing one element
> beyond the end of the arrays.
>=20
> Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vica=
p mipi capture")
> Cc: stable@kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 +++++---=
--
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b=
/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index 1b81bcc067ef..a933df682acc 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -489,8 +489,8 @@ static inline unsigned int rkcif_mipi_get_reg(struct =
rkcif_interface *interface,
> =20
>         block =3D interface->index - RKCIF_MIPI_BASE;
> =20
> -       if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> -           WARN_ON_ONCE(index > RKCIF_MIPI_REGISTER_MAX))
> +       if (WARN_ON_ONCE(block >=3D RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> +           WARN_ON_ONCE(index >=3D RKCIF_MIPI_REGISTER_MAX))
>                 return RKCIF_REGISTER_NOTSUPPORTED;
> =20
>         offset =3D rkcif->match_data->mipi->blocks[block].offset;
> @@ -510,9 +510,9 @@ static inline unsigned int rkcif_mipi_id_get_reg(stru=
ct rkcif_stream *stream,
>         block =3D stream->interface->index - RKCIF_MIPI_BASE;
>         id =3D stream->id;
> =20
> -       if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> -           WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
> -           WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
> +       if (WARN_ON_ONCE(block >=3D RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> +           WARN_ON_ONCE(id >=3D RKCIF_ID_MAX) ||
> +           WARN_ON_ONCE(index >=3D RKCIF_MIPI_ID_REGISTER_MAX))
>                 return RKCIF_REGISTER_NOTSUPPORTED;
> =20
>         offset =3D rkcif->match_data->mipi->blocks[block].offset;
>=20
> --=20
> 2.39.5
>=20
>

