Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88EDFCC9DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUKCgb/6rFAp2KPC7McERCizJUEbCTrmZZm2r9c2yW0=; b=Th3vISc96KDG5oD3Nvm9NE5BW3
	PwgQHctWC8U+sMye8jU1BAuAxmuVKO0O3gUJB5XM/dMTmqj0HJCV5CesaSvCbPhT41v5jSShwbhCs
	PEEvzaoqC9xMm0d/0xUZ/RsPIlWqkLq0johYnqoLGhfD9CrgnqDtKn8qoeVRxw1kArjnxDF7xnATP
	oxipser+27thMdG2n6Rb70qKVagr/Z+hWgRYOC+avCydX+fS6ODQIsiSt7WpP/cwTqK8TFTcssSF8
	G+a1vhHNU+5ISH+bMSExQ7h75LgRyXVPKjbEtW/pL9+L9s2Cyy3PyG3klmO2nfJdXWO0ysj6pF8Ym
	ZDv2OhGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzte5-000000097nh-29Nd;
	Tue, 10 Mar 2026 09:44:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzte3-000000097nA-0nTA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:44:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vztdz-0002P1-68; Tue, 10 Mar 2026 10:44:51 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vztdw-004fwu-2z;
	Tue, 10 Mar 2026 10:44:50 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vztdy-000000004Bl-0pVJ;
	Tue, 10 Mar 2026 10:44:50 +0100
Message-ID: <fef2059f0e184f918102e4d0656207fec09dbc83.camel@pengutronix.de>
Subject: Re: [PATCH] reset-controller: ti: introduce a new reset handler
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Zexin Wang <ot_zexin.wang@mediatek.com>, Matthias Brugger
	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, Sirius Wang
	 <sirius.wang@mediatek.com>, Jack Hsu <jh.hsu@mediatek.com>, Vince Liu
	 <vince-wl.liu@mediatek.com>
Date: Tue, 10 Mar 2026 10:44:50 +0100
In-Reply-To: <20260310033942.29585-1-ot_zexin.wang@mediatek.com>
References: <20260310033942.29585-1-ot_zexin.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_024455_227073_B3FB9020 
X-CRM114-Status: GOOD (  25.41  )
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

On Di, 2026-03-10 at 11:39 +0800, Zexin Wang wrote:
> Introduce ti_syscon_reset() to integrate assert and deassert together.
> If some modules need do serialized assert and deassert operations
> to reset itself, reset_control_reset can be called for convenience.

With this change, reset_control_reset() would stop returning -ENOTSUPP
on all existing platforms using ti,syscon-reset. But it wouldn't work
correctly because no delays are specified.

Note that reset_control_reset() was introduced to support hardware that
is hard-wired to create reset pulses of a fixed length, with no
individual control over assertion and deassertion. If the consumer
driver does not need to work on such hardware, using
reset_control_reset() over reset_control_assert()/deassert() is not
necessary.

> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
> ---
>  drivers/reset/reset-ti-syscon.c | 34 +++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-sys=
con.c
> index 23f86ddb8668..f37685e32b0a 100644
> --- a/drivers/reset/reset-ti-syscon.c
> +++ b/drivers/reset/reset-ti-syscon.c
> @@ -7,6 +7,7 @@
>   *	Suman Anna <afd@ti.com>
>   */
> =20
> +#include <linux/delay.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -42,12 +43,14 @@ struct ti_syscon_reset_control {
>   * @regmap: regmap handle containing the memory-mapped reset registers
>   * @controls: array of reset controls
>   * @nr_controls: number of controls in control array
> + * @reset_duration_us: time of controller assert reset
>   */
>  struct ti_syscon_reset_data {
>  	struct reset_controller_dev rcdev;
>  	struct regmap *regmap;
>  	struct ti_syscon_reset_control *controls;
>  	unsigned int nr_controls;
> +	unsigned int reset_duration_us;
>  };
> =20
>  #define to_ti_syscon_reset_data(_rcdev)	\
> @@ -150,9 +153,37 @@ static int ti_syscon_reset_status(struct reset_contr=
oller_dev *rcdev,
>  		!(control->flags & STATUS_SET);
>  }
> =20
> +/**
> + * ti_syscon_reset() - perform a full reset cycle on a device
> + * @rcdev: reset controller entity
> + * @id: ID of the reset to be asserted and deasserted
> + *
> + * This function performs a full reset cycle by asserting and then
> + * deasserting the reset signal for a device. It ensures the device
> + * is properly reset and ready for operation.
> + *
> + * Return: 0 for successful request, else a corresponding error value
> + */
> +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
> +		   unsigned long id)
> +{
> +	struct ti_syscon_reset_data *data =3D to_ti_syscon_reset_data(rcdev);
> +	int ret;

This should keep returning -ENOTSUPP for unspecified delays.

> +	ret =3D ti_syscon_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	if (data->reset_duration_us)
> +		usleep_range(data->reset_duration_us, data->reset_duration_us * 2);
> +
> +	return ti_syscon_reset_deassert(rcdev, id);
> +}
> +
>  static const struct reset_control_ops ti_syscon_reset_ops =3D {
>  	.assert		=3D ti_syscon_reset_assert,
>  	.deassert	=3D ti_syscon_reset_deassert,
> +	.reset		=3D ti_syscon_reset,
>  	.status		=3D ti_syscon_reset_status,
>  };
> =20
> @@ -196,6 +227,9 @@ static int ti_syscon_reset_probe(struct platform_devi=
ce *pdev)
>  		controls[i].flags =3D be32_to_cpup(list++);
>  	}
> =20
> +	of_property_read_u32(pdev->dev.of_node, "reset-duration-us",
> +			     &data->reset_duration_us);

This OF property is missing documentation. At the very least
ti_syscon_reset would need to be gated behind existence of this
property or a new compatible. But, since there is one delay for all
reset lines, this is the maximum of all per-consumer necessary delays.
This is a fixed property of the SoC. So why specify it in the device
tree at all? You could just derive it from a SoC specific compatible.

regards
Philipp

