Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98FDCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 10:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9i5QXdIEPebG5pfUZOUy5te1KPCHUMnXEUgzoOQv3JY=; b=xDwXl+M/gvG4ncCliHRCYxsTRx
	Z85fHu8WMiwzx0UgyK/nN09wgCtAfyV6ZwU8CL/51D25OsWPWJlizVaqbuwCW2+8ltE7bvMzwkXxP
	Lpwks7CudbSPv+IC9B2XlZ4+cUaAXMPGdZQjF8IGJLiy6Ez+2LHxTYloc4rqLArwCisHARMx/7Ng7
	H7DJV31QOZ7KeUuP34I0tem86DvVAkiyzDtSjTPPd1iJ2EOsyDlKvbS963/INSYbNiiIl1OTX5+4S
	HASWv6ANzzO4dM9XpEgyjkJR4CLDauYzn0WYpxzWkyHCnsRyq3dptN5YR8qcinMnWhbodYMLaFRS8
	ITMccF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwQh-00000003Z1c-3esn;
	Thu, 07 May 2026 10:58:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwQf-00000003Z0c-2eRS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 10:58:06 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wKwQI-00030s-PY; Thu, 07 May 2026 12:57:42 +0200
Message-ID: <344d09f96081e785f1e70e75db3c5242c5eb315c.camel@pengutronix.de>
Subject: Re: [PATCH] soc: imx8m: Fix match data lookup for soc device
From: Lucas Stach <l.stach@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rob Herring (Arm)"
 <robh@kernel.org>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 07 May 2026 12:57:40 +0200
In-Reply-To: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
References: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_035805_671239_10FF8D09 
X-CRM114-Status: GOOD (  17.25  )
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

Am Montag, dem 27.04.2026 um 09:01 +0800 schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The i.MX8M soc device is registered via platform_device_register_simple()=
,
> so it is not associated with a Device Tree node and the imx8m_soc_driver
> has no of_match_table.
>=20
> As a result, device_get_match_data() always returns NULL when probing
> the soc device.
>=20
> Retrieve the match data directly from the machine compatible using
> of_machine_get_match_data(imx8_soc_match), which provides the correct SoC
> data.
>=20
> Fixes: 2524b293a59e5 ("soc: imx8m: don't access of_root directly")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Frank, please apply this fix for the 7.1-rc release series to get rid
of the regression.

Regards,
Lucas
> ---
>  drivers/soc/imx/soc-imx8m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 77763a107edbd11302017e3f61ecb4369fda1ab0..fc080e56f50d423b88a673181=
a6bc986eb4c1691 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -247,7 +247,7 @@ static int imx8m_soc_probe(struct platform_device *pd=
ev)
>  	if (ret)
>  		return ret;
> =20
> -	data =3D device_get_match_data(dev);
> +	data =3D of_machine_get_match_data(imx8_soc_match);
>  	if (data) {
>  		soc_dev_attr->soc_id =3D data->name;
>  		ret =3D imx8m_soc_prepare(pdev, data->ocotp_compatible);
>=20
> ---
> base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
> change-id: 20260424-soc-imx8m-fix-90d7ce2397f5
>=20
> Best regards,


