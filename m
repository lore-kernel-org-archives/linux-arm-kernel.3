Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADB8C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS2sI9UkmHC+157QJRhoi9K5j3T9szzKe4hMK9xu6V8=; b=vkrNYSQMAC4arbSbFjfLOCsjrO
	ZtZTFO7Xv/jEQrYBsOiLSlSsb8KrJa0/8biovo/n3xNHdZRNwJhjoZZmTjp57qpaeQ6GZ9RzNmICz
	lvpZGj4XgNIIzz+YfwIyMy9Jlgr1CdbsLQRs+4xZtRynH7jd0aRCFJIPEQuNNgjN+zrXYD4y7fewY
	UL5aWsoJtXfE5Mg0HJMsdqVN0Gc35tPWGdMnU1aX59OWrzPW75LK6mz5wWSJEZCm+b1CRgPtcSFce
	JI03nsPRKWyiiuUI1nZ948WkV+CMMApyi0KQXKA1NXAswflmVnCl3ZIDqWrUsNdQvbW6CRsICJiUl
	p4pp1/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J2z-00000007gsx-3qIh;
	Wed, 23 Sep 2026 09:13:49 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J2x-00000007gqY-04YN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:13:48 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4F2D6201CEF;
	Wed, 23 Sep 2026 11:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790154823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PS2sI9UkmHC+157QJRhoi9K5j3T9szzKe4hMK9xu6V8=;
	b=EWEvmaggRytp4w+VexO1vp7Ii4h01iDFSl6Rk1FY5bMIZ6OYOWnYzWTiYBBqpdlfSE9Tyi
	MpOivle8AT1X6zZNgGxLUNfhZ6GhhYNz3QQ6BfhIzE3Gar/7fRDGfVeWQ7SkWFqDminL2r
	1tR7e2FlNc9thj7YZ8MMP0cCAU6mGcS/deWUHK/XwP8oVNvxRBhq6dFeHxoYzCPpfVE0zY
	tXNHtnB54KiYKDApQlajLDpYN4acGXDNp3qmwp54ESJ298Rg03Vq7VZxLPzAW7REEFg22K
	ssTPmM17FCB7gpZtn+IyjZcOfEG8hRDV/l4fdo7rhUExltqwHs2TQ+YDwiA3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790154823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PS2sI9UkmHC+157QJRhoi9K5j3T9szzKe4hMK9xu6V8=;
	b=P0+33uyLO+y4AEiD1puLoXrZvB1E2pq4deNWdg+mg1GS1/RzafdZUPUt+D4iqVnkc84bSa
	wWi5lcUSWK0ePQ7hzdKTjiQgtzG1AAoH+lbXJjfeSsmGi5FT39dvmoouSbd52bkzO7Rewp
	z9R6+8PP1/rkvysn6AAOkhVNfp6nYdbHsfB09068sG1x12UQkGYXwJVZe3IAUA8CVkrKbw
	WMIp8RoogzKhwwgsM9xHtVpNH9N03KZHBABfHWJp20JvaJwFowjaH1w/MxBp8LX7B4f4X8
	PTqU2LSAnB6JrEd6oF9M8Hxa/eLboliL7bRbDwtRzHv8i2FbhvcH2DT6ip25Pw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790154823; a=rsa-sha256;
	cv=none;
	b=TBoRXXLaPGSPk37AIej7rZWoVLc1YZ7gBNbRSiY4iiqASKB/PcCm6LJ+Vriwsoo/7uzkeA
	ukDKQDzdfVjR5x+J2JJbFhAwRFgves8lI94/jThopcAm/8ptXfc1f3gzZxzP4RUPuu9zdq
	ZDeZHuYAo5ZTtVwiqVVC1+d/498O4Xr2BBhe5MzaYeyiXRyK9wzBGc1skc8mE68m8O90jN
	tcE1Ie57BDFz9vpZlx5dFe0gDo9wbL+w9ZkEmcNYzdKSheJjKFZiq2IseONvfFQ/0QrBJ9
	rj4EBK8a3OccAXYYbumtTD635TzzCrYsDzWIqXxcv79nob2XA8ZMoRWJjGluuw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <7bfea0211710cc1cdab9ac7235c4f283f2c6d8ad.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] usb: dwc3: xilinx: re-assert resets on ZynqMP
 init error paths
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, michal.simek@amd.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 23 Sep 2026 11:13:43 +0200
In-Reply-To: <20260922182125.11067-3-radhey.shyam.pandey@amd.com>
References: <20260922182125.11067-1-radhey.shyam.pandey@amd.com>
	 <20260922182125.11067-3-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_021347_216115_1F7BD744 
X-CRM114-Status: GOOD (  20.73  )
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

On Di, 2026-09-22 at 23:51 +0530, Radhey Shyam Pandey wrote:
> If reset deassert or PHY setup fails partway through
> dwc3_xlnx_init_zynqmp(), re-assert any resets that were already
> released before unwinding the PHY. Use fall-through error labels so
> unwind matches how far init progressed, for both USB2 and USB3 paths.
>=20
> Save the ZynqMP reset handles in driver private data so later probe
> teardown can re-assert released resets.
>=20
> Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes in v2:
> - Split out of the combined five patch series; see patch 1.
> - Reordered ahead of the platform-data cleanups.
> - Added Cc: stable.
> - No functional change to the patch itself.
>=20
>  drivers/usb/dwc3/dwc3-xilinx.c | 49 +++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilin=
x.c
> index 8c63e02575f1..d18d3e364381 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -48,6 +48,10 @@ struct dwc3_xlnx {
>  	void __iomem			*regs;
>  	int				(*pltfm_init)(struct dwc3_xlnx *data);
>  	struct phy			*usb3_phy;
> +	struct reset_control		*usb_crst;
> +	struct reset_control		*usb_hibrst;
> +	struct reset_control		*usb_apbrst;
> +	bool				usb_resets_released;
>  };
> =20
>  static void dwc3_xlnx_mask_phy_rst(struct dwc3_xlnx *priv_data, bool mas=
k)
> @@ -112,7 +116,6 @@ static int dwc3_xlnx_init_versal(struct dwc3_xlnx *pr=
iv_data)
>  static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>  {
>  	struct device		*dev =3D priv_data->dev;
> -	struct reset_control	*crst, *hibrst, *apbrst;
>  	struct gpio_desc	*reset_gpio;
>  	int			ret =3D 0;
> =20
> @@ -124,25 +127,25 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *=
priv_data)
>  		goto err;
>  	}
> =20
> -	crst =3D devm_reset_control_get_exclusive(dev, "usb_crst");
> -	if (IS_ERR(crst)) {
> -		ret =3D PTR_ERR(crst);
> +	priv_data->usb_crst =3D devm_reset_control_get_exclusive(dev, "usb_crst=
");
> +	if (IS_ERR(priv_data->usb_crst)) {
> +		ret =3D PTR_ERR(priv_data->usb_crst);
>  		dev_err_probe(dev, ret,
>  			      "failed to get core reset signal\n");
>  		goto err;
>  	}
> =20
> -	hibrst =3D devm_reset_control_get_exclusive(dev, "usb_hibrst");
> -	if (IS_ERR(hibrst)) {
> -		ret =3D PTR_ERR(hibrst);
> +	priv_data->usb_hibrst =3D devm_reset_control_get_exclusive(dev, "usb_hi=
brst");
> +	if (IS_ERR(priv_data->usb_hibrst)) {
> +		ret =3D PTR_ERR(priv_data->usb_hibrst);
>  		dev_err_probe(dev, ret,
>  			      "failed to get hibernation reset signal\n");
>  		goto err;
>  	}
> =20
> -	apbrst =3D devm_reset_control_get_exclusive(dev, "usb_apbrst");
> -	if (IS_ERR(apbrst)) {
> -		ret =3D PTR_ERR(apbrst);
> +	priv_data->usb_apbrst =3D devm_reset_control_get_exclusive(dev, "usb_ap=
brst");
> +	if (IS_ERR(priv_data->usb_apbrst)) {
> +		ret =3D PTR_ERR(priv_data->usb_apbrst);
>  		dev_err_probe(dev, ret,
>  			      "failed to get APB reset signal\n");
>  		goto err;
> @@ -156,19 +159,19 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *=
priv_data)
>  	 * absent.
>  	 */
>  	if (priv_data->usb3_phy) {
> -		ret =3D reset_control_assert(crst);
> +		ret =3D reset_control_assert(priv_data->usb_crst);
>  		if (ret < 0) {
>  			dev_err(dev, "Failed to assert core reset\n");
>  			goto err;
>  		}
> =20
> -		ret =3D reset_control_assert(hibrst);
> +		ret =3D reset_control_assert(priv_data->usb_hibrst);
>  		if (ret < 0) {
>  			dev_err(dev, "Failed to assert hibernation reset\n");
>  			goto err;
>  		}
> =20
> -		ret =3D reset_control_assert(apbrst);
> +		ret =3D reset_control_assert(priv_data->usb_apbrst);
>  		if (ret < 0) {
>  			dev_err(dev, "Failed to assert APB reset\n");
>  			goto err;
> @@ -179,7 +182,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *pr=
iv_data)
>  	if (ret < 0)
>  		goto err;
> =20
> -	ret =3D reset_control_deassert(apbrst);
> +	ret =3D reset_control_deassert(priv_data->usb_apbrst);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to release APB reset\n");
>  		goto err_phy_exit;
> @@ -195,21 +198,21 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *=
priv_data)
>  		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>  	}
> =20
> -	ret =3D reset_control_deassert(crst);
> +	ret =3D reset_control_deassert(priv_data->usb_crst);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to release core reset\n");
> -		goto err_phy_exit;
> +		goto err_apbrst_assert;
>  	}
> =20
> -	ret =3D reset_control_deassert(hibrst);
> +	ret =3D reset_control_deassert(priv_data->usb_hibrst);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to release hibernation reset\n");
> -		goto err_phy_exit;
> +		goto err_crst_assert;
>  	}
> =20
>  	ret =3D phy_power_on(priv_data->usb3_phy);
>  	if (ret < 0)
> -		goto err_phy_exit;
> +		goto err_hibrst_assert;
> =20
>  	/* ulpi reset via gpio-modepin or gpio-framework driver */
>  	reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);

Are the resets asserted if this fails?

Same question about if probe fails after pltfm_init() succeeded.

> @@ -226,10 +229,18 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *=
priv_data)
> =20
>  	dwc3_xlnx_set_coherency(priv_data, XLNX_USB_TRAFFIC_ROUTE_CONFIG);
> =20
> +	priv_data->usb_resets_released =3D true;
> +
>  	return 0;
> =20
>  err_phy_power_off:
>  	phy_power_off(priv_data->usb3_phy);
> +err_hibrst_assert:
> +	reset_control_assert(priv_data->usb_hibrst);
> +err_crst_assert:
> +	reset_control_assert(priv_data->usb_crst);
> +err_apbrst_assert:
> +	reset_control_assert(priv_data->usb_apbrst);
>  err_phy_exit:
>  	phy_exit(priv_data->usb3_phy);
>  err:

Rather than storing usb_resets_released state, and then having
conditional teardown in the next patch, this could be handled via
devm_add_action_or_reset.

regards
Philipp

