Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB583CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2gCNeJndf4x1HJeC8ZCnVzDBbrBAvF9t9ntcRkg+r8=; b=UXFAZotbnuNSLArO2Z9FkqYPfA
	Uyxw8QDq1HOcekRl6buqHjgzz02bpXq8uM31r7ei+PXA7ZEpAL1JXXqWKF30YcT7LiOowmpQH193i
	YipgJFvi8sPO7LDD3D88AetjjerfB5XHJWJVi6lPJyNpmLAjLCGh9YCtUl78m7bbpwj2Q3q95qEUI
	+KB1xEIZ4R+MU0GWGEIjv5qIeZ8zJN6ZO+Hs33O4y9tTjL/78eAuSIipJ9qs6OEpM5+VBy+tqL+ua
	1FCabJA+xTbAihfELb6GLAq5fZiRQ5s3ECMvi6JrLRjT6MzjNCKVrLNxp0cfeZld+jJLUiBtBytvw
	Uk2R/bnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yQi-00000001E90-33ig;
	Wed, 15 Oct 2025 10:08:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yQc-00000001E5F-3o8O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 10:08:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yPu-00057X-NE; Wed, 15 Oct 2025 12:07:34 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yPt-003hk2-23;
	Wed, 15 Oct 2025 12:07:33 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yPt-000000007Ix-2FwJ;
	Wed, 15 Oct 2025 12:07:33 +0200
Message-ID: <6bea63bb14f2be814762fa719d3d7944bad39b6e.camel@pengutronix.de>
Subject: Re: [PATCH 5/5] scsi: ufs: mediatek: Rework resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart Van
 Assche	 <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Stanley Chu	
 <stanley.chu@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Peter
 Wang	 <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	kernel@collabora.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
Date: Wed, 15 Oct 2025 12:07:33 +0200
In-Reply-To: <20251014-mt8196-ufs-v1-5-195dceb83bc8@collabora.com>
References: <20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com>
	 <20251014-mt8196-ufs-v1-5-195dceb83bc8@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_030819_021307_52FEEA48 
X-CRM114-Status: GOOD (  26.68  )
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

Hi Nicolas,

On Di, 2025-10-14 at 17:10 +0200, Nicolas Frattaroli wrote:
> Rework the reset control getting in the driver's probe function to use
> the "_optional" function instead of defaulting to NULL on IS_ERR, so
> that actual real errors (as opposed to missing resets) can be handled as
> errors in the probe function.
>=20
> Also move the MPHY reset into the PHY driver, where it should live, and
> remove all remnants of it ever having been in this driver.

Part of that happened in the previous patch.

> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/ufs/host/ufs-mediatek-sip.h |  8 -----
>  drivers/ufs/host/ufs-mediatek.c     | 67 +++++++++++++++++++++----------=
------
>  drivers/ufs/host/ufs-mediatek.h     |  1 -
>  3 files changed, 38 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/ufs/host/ufs-mediatek-sip.h b/drivers/ufs/host/ufs-m=
ediatek-sip.h
> index d627dfb4a766..256598cc3b5b 100644
> --- a/drivers/ufs/host/ufs-mediatek-sip.h
> +++ b/drivers/ufs/host/ufs-mediatek-sip.h
> @@ -31,11 +31,6 @@ enum ufs_mtk_vcc_num {
>  	UFS_VCC_MAX
>  };
> =20
> -enum ufs_mtk_mphy_op {
> -	UFS_MPHY_BACKUP =3D 0,
> -	UFS_MPHY_RESTORE
> -};
> -
>  /*
>   * SMC call wrapper function
>   */
> @@ -84,9 +79,6 @@ static inline void _ufs_mtk_smc(struct ufs_mtk_smc_arg =
s)
>  #define ufs_mtk_device_pwr_ctrl(on, ufs_version, res) \
>  	ufs_mtk_smc(UFS_MTK_SIP_DEVICE_PWR_CTRL, &(res), on, ufs_version)
> =20
> -#define ufs_mtk_mphy_ctrl(op, res) \
> -	ufs_mtk_smc(UFS_MTK_SIP_MPHY_CTRL, &(res), op)
> -
>  #define ufs_mtk_mtcmos_ctrl(op, res) \
>  	ufs_mtk_smc(UFS_MTK_SIP_MTCMOS_CTRL, &(res), op)
> =20
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-media=
tek.c
> index 758a393a9de1..ac40d4a3a800 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -204,49 +204,60 @@ static void ufs_mtk_crypto_enable(struct ufs_hba *h=
ba)
>  static void ufs_mtk_host_reset(struct ufs_hba *hba)
>  {
>  	struct ufs_mtk_host *host =3D ufshcd_get_variant(hba);
> -	struct arm_smccc_res res;
> +	int ret;
> =20
>  	reset_control_assert(host->hci_reset);
>  	reset_control_assert(host->crypto_reset);
>  	reset_control_assert(host->unipro_reset);
> -	reset_control_assert(host->mphy_reset);
> =20
> -	usleep_range(100, 110);
> +	ret =3D phy_reset(host->mphy);
> +
> +	/*
> +	 * Only sleep if MPHY doesn't have a reset implemented (which already
> +	 * sleeps) or the PHY reset function failed somehow, just to be safe
> +	 */
> +	if (ret) {
> +		usleep_range(100, 110);
> +		if (ret !=3D -EOPNOTSUPP)
> +			dev_warn(hba->dev, "PHY reset failed: %pe\n", ERR_PTR(ret));
> +	}
> =20
>  	reset_control_deassert(host->unipro_reset);
>  	reset_control_deassert(host->crypto_reset);
>  	reset_control_deassert(host->hci_reset);
> -	reset_control_deassert(host->mphy_reset);
> -
> -	/* restore mphy setting aftre mphy reset */
> -	if (host->mphy_reset)
> -		ufs_mtk_mphy_ctrl(UFS_MPHY_RESTORE, res);
>  }
> =20
> -static void ufs_mtk_init_reset_control(struct ufs_hba *hba,
> -				       struct reset_control **rc,
> -				       char *str)
> +static int ufs_mtk_init_reset_control(struct ufs_hba *hba,
> +				      struct reset_control **rc,
> +				      const char *str)
>  {
> -	*rc =3D devm_reset_control_get(hba->dev, str);
> +	*rc =3D devm_reset_control_get_optional(hba->dev, str);

Please use

	devm_reset_control_get_optional_exclusive()

directly, or see below for an alternative suggestion.

>  	if (IS_ERR(*rc)) {
> -		dev_info(hba->dev, "Failed to get reset control %s: %ld\n",
> -			 str, PTR_ERR(*rc));
> -		*rc =3D NULL;
> +		dev_err(hba->dev, "Failed to get reset control %s: %pe\n", str, *rc);
> +		return PTR_ERR(*rc);
>  	}
> +
> +	return 0;
>  }
> =20
> -static void ufs_mtk_init_reset(struct ufs_hba *hba)
> +static int ufs_mtk_init_reset(struct ufs_hba *hba)
>  {
>  	struct ufs_mtk_host *host =3D ufshcd_get_variant(hba);
> +	int ret;
> +
> +	ret =3D ufs_mtk_init_reset_control(hba, &host->hci_reset, "hci_rst");
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ufs_mtk_init_reset_control(hba, &host->unipro_reset, "unipro_rs=
t");
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ufs_mtk_init_reset_control(hba, &host->crypto_reset, "crypto_rs=
t");
> +	if (ret)
> +		return ret;

It looks to me like you could combine these into a

	devm_reset_control_bulk_get_optional_exclusive()

and operate the three resets with reset_control_bulk_assert/deassert().


regards
Philipp

