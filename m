Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238E2D1CA13
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 00:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BO2QcDRFFAaiuV+OhP+PhlZriVjaJKVdjnnUFX4vNvU=; b=vzUGHclmaaF13lnGlKdQ5BX5Gy
	PqjXyyiejoyAQk+iQxJmZEumv6viF0UdYE/1EfyJ+PLdhF9WTrXG1erZGeUZiF9nt1eKDQ19om639
	YU4hOdvj8pEIalR7hFKm3O6eNnP5PpRj56s3QO7SQg1ZurkdThr3uneDU4yBuODhB5Td4soDLiHRS
	+Kki3Hz8FQEyf9b+4Nu8Z9kLQiUnsuKY+TevP1ZmTkY8CMyJB+b6kIbTr8ETuvzqepOuRMFFdu8Qp
	1+yU4h4PGnNEI4aLnuWvfOciZOUNv4w6P+u+z1jYhkVYqByhOZPV3RHhJpXgq+VMt5a/5vpcyl5H/
	TZ2Ks/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t87mo-0000000FVSs-1KRW;
	Tue, 05 Nov 2024 00:51:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t87l6-0000000FVKQ-0nnG;
	Tue, 05 Nov 2024 00:49:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F681A418CE;
	Tue,  5 Nov 2024 00:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F15FC4CECE;
	Tue,  5 Nov 2024 00:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730767761;
	bh=WIqZTsHOsvR2cFhpx5SuKyMp6tJGa9n+Huix9B8qTm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAtNlfREYYQHlbtaxoOJUWP8Iq2IDfDC22EX7yDKjiMQf2n4lIjBPR3ZlEibVlNaB
	 GYzNgLSVCk7/gCV1ar8+cIUQtZE6fqr4uU2h3e6XLKPXBXfT1dqWhM9Qv4vLq/bZNB
	 RbOzzk91S+Ibel9U9LiZD3bbRAZTcVBWrGI8eVt/5DO3zEnNDo0sn1/y2Fa2JplG1G
	 IEI9N8vHGcoyz+nFGpZSMwixFPy8CoaCAoOwwu/UFa+N04vXZM4qIGsCXpRtaK8y5G
	 40iy0u7zMTCncyv7ik6mta9XvtWRwewhy+LakW/BCLfqloo3VhBupJfGw8ao+JJTIC
	 aQRUutQDlbEZQ==
Date: Tue, 5 Nov 2024 08:49:12 +0800
From: Peter Chen <peter.chen@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] usb: Use (of|device)_property_present() for non-boolean
 properties
Message-ID: <20241105004912.GA125226@nchen-desktop>
References: <20241104190820.277702-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104190820.277702-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_164924_384536_A32A3302 
X-CRM114-Status: GOOD (  17.62  )
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

On 24-11-04 13:08:18, Rob Herring (Arm) wrote:
> The use of (of|device)_property_read_bool() for non-boolean properties
> is deprecated in favor of of_property_present() when testing for
> property presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/usb/chipidea/core.c        | 2 +-
>  drivers/usb/dwc3/core.c            | 2 +-
>  drivers/usb/dwc3/dwc3-omap.c       | 2 +-
>  drivers/usb/dwc3/dwc3-qcom.c       | 2 +-
>  drivers/usb/mtu3/mtu3_plat.c       | 2 +-
>  drivers/usb/phy/phy.c              | 2 +-
>  drivers/usb/renesas_usbhs/common.c | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 835bf2428dc6..18ecfcc08b97 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -765,7 +765,7 @@ static int ci_get_platdata(struct device *dev,
>  
>  	ext_id = ERR_PTR(-ENODEV);
>  	ext_vbus = ERR_PTR(-ENODEV);
> -	if (of_property_read_bool(dev->of_node, "extcon")) {
> +	if (of_property_present(dev->of_node, "extcon")) {
>  		/* Each one of them is not mandatory */
>  		ext_vbus = extcon_get_edev_by_phandle(dev, 0);
>  		if (IS_ERR(ext_vbus) && PTR_ERR(ext_vbus) != -ENODEV)
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 9eb085f359ce..e1beb760e913 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1935,7 +1935,7 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
>  	struct extcon_dev *edev = NULL;
>  	const char *name;
>  
> -	if (device_property_read_bool(dev, "extcon"))
> +	if (device_property_present(dev, "extcon"))
>  		return extcon_get_edev_by_phandle(dev, 0);
>  
>  	/*
> diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
> index 2a11fc0ee84f..c2d7582c151a 100644
> --- a/drivers/usb/dwc3/dwc3-omap.c
> +++ b/drivers/usb/dwc3/dwc3-omap.c
> @@ -416,7 +416,7 @@ static int dwc3_omap_extcon_register(struct dwc3_omap *omap)
>  	struct device_node	*node = omap->dev->of_node;
>  	struct extcon_dev	*edev;
>  
> -	if (of_property_read_bool(node, "extcon")) {
> +	if (of_property_present(node, "extcon")) {
>  		edev = extcon_get_edev_by_phandle(omap->dev, 0);
>  		if (IS_ERR(edev)) {
>  			dev_vdbg(omap->dev, "couldn't get extcon device\n");
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index c1d4b52f25b0..649166e2a8b8 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -161,7 +161,7 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
>  	struct extcon_dev	*host_edev;
>  	int			ret;
>  
> -	if (!of_property_read_bool(dev->of_node, "extcon"))
> +	if (!of_property_present(dev->of_node, "extcon"))
>  		return 0;
>  
>  	qcom->edev = extcon_get_edev_by_phandle(dev, 0);
> diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
> index 6858ed9fc3b2..2380552025e4 100644
> --- a/drivers/usb/mtu3/mtu3_plat.c
> +++ b/drivers/usb/mtu3/mtu3_plat.c
> @@ -307,7 +307,7 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
>  	if (otg_sx->role_sw_used || otg_sx->manual_drd_enabled)
>  		goto out;
>  
> -	if (of_property_read_bool(node, "extcon")) {
> +	if (of_property_present(node, "extcon")) {
>  		otg_sx->edev = extcon_get_edev_by_phandle(ssusb->dev, 0);
>  		if (IS_ERR(otg_sx->edev)) {
>  			return dev_err_probe(dev, PTR_ERR(otg_sx->edev),
> diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
> index 06e0fb23566c..130f86a043ad 100644
> --- a/drivers/usb/phy/phy.c
> +++ b/drivers/usb/phy/phy.c
> @@ -365,7 +365,7 @@ static int usb_add_extcon(struct usb_phy *x)
>  {
>  	int ret;
>  
> -	if (of_property_read_bool(x->dev->of_node, "extcon")) {
> +	if (of_property_present(x->dev->of_node, "extcon")) {
>  		x->edev = extcon_get_edev_by_phandle(x->dev, 0);
>  		if (IS_ERR(x->edev))
>  			return PTR_ERR(x->edev);
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index edc43f169d49..e4adfe692164 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -632,7 +632,7 @@ static int usbhs_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> -	if (of_property_read_bool(dev_of_node(dev), "extcon")) {
> +	if (of_property_present(dev_of_node(dev), "extcon")) {
>  		priv->edev = extcon_get_edev_by_phandle(dev, 0);
>  		if (IS_ERR(priv->edev))
>  			return PTR_ERR(priv->edev);
> -- 
> 2.45.2
> 

For chipidea part:

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter

