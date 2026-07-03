Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD9FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlhEmV9b3yQuDivDKOLQMuW+utydjEwNxJ3dp+PpmXw=; b=ueHowT0FEUEkZvKlfOO4fsgE9D
	WfFM7EpCo+/S1SvHZ7qBVLtZ7Fx1czYFMR6ArpHGQpAliJyV5Y6/VBcGBjXLHSKvETO+Bldm+VFjF
	8uaMws89g+YqfwikJLi1iRO3A3uelm0V6Ks6nRHud7qKrr44iqLKJCbknS9wPSZQaALTlrxGZHF+7
	YGh0yqlFVGHXDhAqLLCuNam2jg60dexbs8uxoNMeCmb+FrXHHnY1dbfgQpilu9n/psSB4Q5Sq7ZsR
	1Q4m2qXlKE8VNlRBqHS7Z83BXYpMQWul8UfkLEanROYlDHVJAd3hMWyz0Vqr8I2XFW9DvF0mngI+d
	zNEIfH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaS9-00000006VTY-1SYO;
	Fri, 03 Jul 2026 09:44:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaS7-00000006VSj-3U12;
	Fri, 03 Jul 2026 09:44:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 650D1429D5;
	Fri,  3 Jul 2026 09:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6711F000E9;
	Fri,  3 Jul 2026 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783071895;
	bh=TlhEmV9b3yQuDivDKOLQMuW+utydjEwNxJ3dp+PpmXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XTTJPkNUPp4wAbmiW3ylIpmJ5anOfLqudJkPW9QCFvMG5RndqmV+GBvkavNv10FfJ
	 iGfHuQncpHp11s38qXMelHtH3pGadPYzmJa9wwwbLMyRy8oxxxc8ovxXWJUz9gpX3E
	 6yRFjS0vdBDxfqooTw7pQQ766nzHelOCrj1av5n4=
Date: Fri, 3 Jul 2026 11:45:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:MEDIATEK USB3 DRD IP DRIVER" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:MEDIATEK USB3 DRD IP DRIVER" <linux-mediatek@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] usb: mtu3: allocate phys with ssusb
Message-ID: <2026070330-darkroom-taking-3687@gregkh>
References: <20260411035731.163580-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411035731.163580-1-rosenp@gmail.com>
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

On Fri, Apr 10, 2026 at 08:57:31PM -0700, Rosen Penev wrote:
> Use a flexible array member to combine allocations. Allows removal of a
> pointless branch. A size of 0 means phys are not allocated.
> 
> Add __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/usb/mtu3/mtu3.h      |  2 +-
>  drivers/usb/mtu3/mtu3_plat.c | 18 ++++++------------
>  2 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
> index ba5a63669e5f..d71849388602 100644
> --- a/drivers/usb/mtu3/mtu3.h
> +++ b/drivers/usb/mtu3/mtu3.h
> @@ -252,7 +252,6 @@ struct ssusb_mtk {
>  	struct mtu3 *u3d;
>  	void __iomem *mac_base;
>  	void __iomem *ippc_base;
> -	struct phy **phys;
>  	int num_phys;
>  	int wakeup_irq;
>  	/* common power & clock */
> @@ -272,6 +271,7 @@ struct ssusb_mtk {
>  	struct regmap *uwk;
>  	u32 uwk_reg_base;
>  	u32 uwk_vers;
> +	struct phy *phys[] __counted_by(num_phys);
>  };
>  
>  /**
> diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
> index cc8a864dbd63..11a919fc3d47 100644
> --- a/drivers/usb/mtu3/mtu3_plat.c
> +++ b/drivers/usb/mtu3/mtu3_plat.c
> @@ -240,17 +240,6 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
>  	if (ret)
>  		return ret;
>  
> -	ssusb->num_phys = of_count_phandle_with_args(node,
> -			"phys", "#phy-cells");
> -	if (ssusb->num_phys > 0) {
> -		ssusb->phys = devm_kcalloc(dev, ssusb->num_phys,
> -					sizeof(*ssusb->phys), GFP_KERNEL);
> -		if (!ssusb->phys)
> -			return -ENOMEM;
> -	} else {
> -		ssusb->num_phys = 0;
> -	}
> -
>  	for (i = 0; i < ssusb->num_phys; i++) {
>  		ssusb->phys[i] = devm_of_phy_get_by_index(dev, node, i);
>  		if (IS_ERR(ssusb->phys[i])) {
> @@ -330,12 +319,17 @@ static int mtu3_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct ssusb_mtk *ssusb;
>  	int ret = -ENOMEM;
> +	int num_phys;
>  
> +	num_phys = of_count_phandle_with_args(dev->of_node,
> +			"phys", "#phy-cells");

You just caused a bug here if this returns a negative value.

How was this tested?

And why is it even needed?

thanks,

greg k-h

