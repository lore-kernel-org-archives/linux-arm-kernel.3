Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01549C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xFrz9+Xh7oWc2E882wc3WdDbfJk8+9Kb0ZZS36Ln2c=; b=HAz6M2xzch4nPT+LbHfmXP/9JF
	cxNs4yZaOHGwVXhdPxFp6TrfeICLkG0JQ9jTZvRA/9pwkbh1yxW9lkURhzrsXuAd7jb3Bgn2r5BNh
	zOXbRTWxP74ZnzSeEDA5x1dz3WTMKlD/8SfC52MEMeK0R7uso6SJKPz2NNGARlTK7bhezcmZCg04e
	Fqb207WEzQY+h1B7KN0KkygJPMv+QsM+1gZ0bA1GHZ2IzJa4EuBz46cnGgT/Z95yXB9XeiLcayZRU
	I1AzC2VWqGIxB05y8Re9x2VDdrjREMX2SWGfeQ476kKBwEsPHOrq6t1dZTUmfuRbAmPaXPVyQ+VcC
	82XkMYGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5IU-00000008hcL-3Lg3;
	Tue, 21 Jul 2026 07:53:50 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5IS-00000008hbZ-0xrp;
	Tue, 21 Jul 2026 07:53:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 88AB42028EE;
	Tue, 21 Jul 2026 09:53:43 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wm5IN-000XJf-1W;
	Tue, 21 Jul 2026 09:53:43 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wm5IN-000000002rJ-1YNa;
	Tue, 21 Jul 2026 09:53:43 +0200
Message-ID: <16651472d6a782bdef63e1c9742444de08c59f1e.camel@pengutronix.de>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Make reset
 optional for MT8196
From: Philipp Zabel <p.zabel@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	rafael@kernel.org
Cc: daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	matthias.bgg@gmail.com, laura.nao@collabora.com, fshao@chromium.org, 
	wenst@chromium.org, jiapeng.chong@linux.alibaba.com,
 frank-w@public-files.de, 	linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	kernel@collabora.com
Date: Tue, 21 Jul 2026 09:53:43 +0200
In-Reply-To: <20260720144244.88877-1-angelogioacchino.delregno@collabora.com>
References: <20260720144244.88877-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005348_447929_3FFF632E 
X-CRM114-Status: GOOD (  31.78  )
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

On Mo, 2026-07-20 at 16:42 +0200, AngeloGioacchino Del Regno wrote:
> Depending on the SoC+Firmware combination, the LVTS hardware may be
> may be actively used by one or even multiple concurrent MCUs!
> In this case, resetting it may produce either a severe slowdown of
> the entire system, or even a thermal protection AP reset, as some
> MCU(s) may be reading a very high or very low temperature while the
> LVTS is being reset.
>=20
> On those, don't fail if no reset is found as that may be omitted on
> purpose, but still check if there's one, because some board(s) may
> be running on a different bootchain with reduced firmwares or using
> firmwares with reduced functionality.
>=20
> Add a new "optional_reset" member to lvts_data and use it to check
> whether the resets should be mandatory or not.
>=20
> Also, while at it, since devm_reset_control_get_by_index() is now
> deprecated, change the probe function to instead call function
> devm_reset_control_get_exclusive_by_index(), which does the same.

Why is this using _by_index() at all? mediatek,lvts-thermal.yaml
specifies a single reset, so the driver should just
devm_reset_control_get_exclusive(dev, NULL).

>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 29 ++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index 92711896ce24..6670b5458f2c 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -160,6 +160,7 @@ struct lvts_data {
>  	int gt_calib_bit_offset;
>  	unsigned int def_calibration;
>  	u16 msr_offset;
> +	bool optional_reset;

No need to complicate things. It's not the driver's business to check
device tree correctness. Just make the reset optional, as the commit
message says.

>  };
> =20
>  struct lvts_sensor {
> @@ -1473,9 +1474,29 @@ static int lvts_probe(struct platform_device *pdev=
)
>  	if (IS_ERR(lvts_td->base))
>  		return dev_err_probe(dev, PTR_ERR(lvts_td->base), "Failed to map io re=
source\n");
> =20
> -	lvts_td->reset =3D devm_reset_control_get_by_index(dev, 0);
> -	if (IS_ERR(lvts_td->reset))
> -		return dev_err_probe(dev, PTR_ERR(lvts_td->reset), "Failed to get rese=
t control\n");
> +	/*
> +	 * Depending on the SoC+Firmware combination, the LVTS hardware may be
> +	 * may be actively used by one or even multiple concurrent MCUs!
> +	 * In this case, resetting it may produce either a severe slowdown of
> +	 * the entire system, or even a thermal protection AP reset, as some
> +	 * MCU(s) may be reading a very high or very low temperature while the
> +	 * LVTS is being reset.
> +	 *
> +	 * On those, don't fail if no reset is found as that may be omitted on
> +	 * purpose, but still check if there's one, because some board(s) may
> +	 * be running on a different bootchain with reduced firmwares or using
> +	 * firmwares with reduced functionality.
> +	 */
> +	lvts_td->reset =3D devm_reset_control_get_exclusive_by_index(dev, 0);

So this should be:

	lvts_td->reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);

> +	if (IS_ERR(lvts_td->reset)) {
> +		if (lvts_data->optional_reset) {
> +			dev_dbg(dev, "No reset found. LVTS may be used by firmware.\n");
> +			lvts_td->reset =3D NULL;

This is not necessary then.

> +		} else {
> +			return dev_err_probe(dev, PTR_ERR(lvts_td->reset),
> +					     "Failed to get reset control\n");
> +		}

And this part could be kept as before.

> +	}
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
> @@ -2163,6 +2184,7 @@ static const struct lvts_data mt8196_lvts_mcu_data =
=3D {
>  	.num_cal_offsets =3D LVTS_NUM_CAL_OFFSETS_MT8196,
>  	.msr_offset =3D LVTS_MSR_OFFSET_MT8196,
>  	.ops =3D &lvts_platform_ops_mt8196,
> +	.optional_reset =3D true,

But mediatek,lvts-thermal.yaml still specifies the reset as required
for mediatek,mt8196-lvts-ap. That should be changed instead.

>  };
> =20
>  static const struct lvts_data mt8196_lvts_ap_data =3D {
> @@ -2175,6 +2197,7 @@ static const struct lvts_data mt8196_lvts_ap_data =
=3D {
>  	.num_cal_offsets =3D LVTS_NUM_CAL_OFFSETS_MT8196,
>  	.msr_offset =3D LVTS_MSR_OFFSET_MT8196,
>  	.ops =3D &lvts_platform_ops_mt8196,
> +	.optional_reset =3D true,

Same as above, but for mediatek,mt8196-lvts-mcu.

regards
Philipp

