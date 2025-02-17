Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3326C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mNKZOJms8nGQ3S2fWlSQO9UA69PQ8M7ytF/ZpdkAWk=; b=KAYSWoo33aaBNO4SjSPv9X+bHE
	tOaO/mk7MRIgyHb4367weWaNpfSLRzGawdjqCkWeDNMvupv60ADgISQE2/NY96lKQx0U/R6XlYDcA
	ZU7mcWtbdUPTcQ2jm6nHLsbtrANL4d/M8xESJ4EBvIVdXcVtRI2zTJikaiVCfpiOVgU2lF2YokXzV
	PQMpmeoWxYepEcQaGIpxVJfKLpZDwdt6+bDVnVbVuh3tvADRpJ24vj6/5pRCy0qkkn/RGKyTDHB9G
	fu/Ud5fs+wO8kGuuI466p75tnA0Q6m5q1K25yKvakxUnc2FrT3xy/iOCzgWjDnQuTkhMfL99q2sNH
	i2sDhypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0GP-00000004T4V-3cx1;
	Mon, 17 Feb 2025 12:30:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzlU-00000004OjM-3jlY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:58:21 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tjzlC-0003zP-JD; Mon, 17 Feb 2025 12:58:02 +0100
Message-ID: <ab721b4a96495516f5149e91f3e4764014e39ba6.camel@pengutronix.de>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: improve imx8mq emmc/sd read
 performance
From: Lucas Stach <l.stach@pengutronix.de>
To: ziniu.wang_1@nxp.com, adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc: imx@lists.linux.dev, s32@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de,  linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, haibo.chen@nxp.com,  kernel@pengutronix.de,
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Date: Mon, 17 Feb 2025 12:58:01 +0100
In-Reply-To: <20250217110623.2383142-1-ziniu.wang_1@nxp.com>
References: <20250217110623.2383142-1-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_035820_929699_B52F074E 
X-CRM114-Status: GOOD (  24.92  )
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

Hi Luke,

Am Montag, dem 17.02.2025 um 19:06 +0800 schrieb ziniu.wang_1@nxp.com:
> From: Luke Wang <ziniu.wang_1@nxp.com>
>=20
> Compared with kernel 6.1, imx8mq eMMC/SD read performance drops by about
> 30% with kernel 6.6.
>=20
> The eMMC/SD read thread will be put to sleep until the hardware completes
> data transfer. Normally, the read thread will be woken up immediately
> when the data transfer is completed. However, due to a known ic bug, if
> imx8mq is in cpuidle, it will take a long time (about 500us) to exit
> cpuidle. As a result, the read thread cannot immediately read the next
> data block, affecting the read performance.
>=20
Is this really a problem with the upstream kernel? i.MX8MQ upstream
does not use the deeper PSCI idle states, but only uses WFI, so I doubt
that upstream is affected by this issue.

Regards,
Lucas

> Kernel 6.6 uses EEVDF as the new scheduler, which affects cpu scheduling
> and cpuidle behavior. With kernel 6.6, the cpu which the read thread
> resides has a greater probability in cpuidle (about 80%), while with
> kernel 6.1, the probability is only about 20-30%. For other platforms,
> this does not have a significant impact on read performance because the
> cpuidle exit time is very short (for example, imx93 is about 60us). But
> for imx8mq, this results in longer waits for the thread to be woken up
> while reading eMMC/SD, which drops performance.
>=20
> So for imx8mq, use the ESDHC_FLAG_PMQOS flag to request the cpu latency
> QoS constraint. This can prevent entering cpuidle during data transfer.
>=20
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index ff78a7c6a04c..b3bf9c171d46 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -337,6 +337,15 @@ static struct esdhc_soc_data usdhc_imx8mm_data =3D {
>  	.quirks =3D SDHCI_QUIRK_NO_LED,
>  };
> =20
> +static struct esdhc_soc_data usdhc_imx8mq_data =3D {
> +	.flags =3D ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
> +			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
> +			| ESDHC_FLAG_HS400 | ESDHC_FLAG_PMQOS
> +			| ESDHC_FLAG_STATE_LOST_IN_LPMODE
> +			| ESDHC_FLAG_BROKEN_AUTO_CMD23,
> +	.quirks =3D SDHCI_QUIRK_NO_LED,
> +};
> +
>  struct pltfm_imx_data {
>  	u32 scratchpad;
>  	struct pinctrl *pinctrl;
> @@ -381,6 +390,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] =
=3D {
>  	{ .compatible =3D "fsl,imx7ulp-usdhc", .data =3D &usdhc_imx7ulp_data, }=
,
>  	{ .compatible =3D "fsl,imx8qxp-usdhc", .data =3D &usdhc_imx8qxp_data, }=
,
>  	{ .compatible =3D "fsl,imx8mm-usdhc", .data =3D &usdhc_imx8mm_data, },
> +	{ .compatible =3D "fsl,imx8mq-usdhc", .data =3D &usdhc_imx8mq_data, },
>  	{ .compatible =3D "fsl,imxrt1050-usdhc", .data =3D &usdhc_imxrt1050_dat=
a, },
>  	{ .compatible =3D "nxp,s32g2-usdhc", .data =3D &usdhc_s32g2_data, },
>  	{ /* sentinel */ }


