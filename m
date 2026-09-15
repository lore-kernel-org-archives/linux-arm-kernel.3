Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BB7C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jqazLvI6PHhKlLUw5ES9AlYBTQV/CW02EbTg8KOkAc=; b=UPsGY2JJ/HX44o10iLW2Rw4Nr5
	VVowB1Yw+Ab1c9LH4L97UNWZ6384dOOETxUcn+77VM2bsZPkdrSIxOjh4BSn6zOu8US+YPu4xTodz
	QYYsKt6k/2M6D21XOQ6FlfD7axNGSENj95nD/RPK4gV5xWsUyL3kDFu7eTkOPO69zLkgXYgHGIlLd
	yKz1JGfIL7gLkXsXoDG9OAznMTJy+nGIS36CyYl1lfWS4uvhd2shq4G9klMbeo0UZCAA0sIqGlCq0
	2evgHvCfB6CDM744CY9482JU33RJ/AicKwZkFRsjl9xi7sZ43zfZTIAbCKVf99pe1Tz5giDKqFKl0
	HFLHmckQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NCV-00000005PeZ-1YI0;
	Tue, 15 Sep 2026 07:03:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NCT-00000005PeN-3kq2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:03:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 022666025F;
	Tue, 15 Sep 2026 07:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229E91F000FF;
	Tue, 15 Sep 2026 07:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789455808;
	bh=0jqazLvI6PHhKlLUw5ES9AlYBTQV/CW02EbTg8KOkAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DY8pZtu4LuzXGihC1YElZInpGFpLzAlctTZ5qIJHgqTbGCYvRb74jSsImxBX/Of7e
	 P0rUoS8jmWyqFsv1InIewtvA0IXOHOyhuf4iViVzEhejf/jXhPrH3TqtIs2s1DhQTi
	 KY1Qq3wU1lwpqPuYbRLl+n9f7qvELuG4c6/zO3fGPtgIBMA1li/lP8ueuCBu2P8uzP
	 vpR9ZNieeTiSO2dYr7NtjIQeGAK2C6hkvIg/+exeXoSw5ilvOgXNejrys3ydrq+lte
	 X32vaAM+P4DQW2VRBFoiGaerQ2zbPPtO8yQdygT6+VaK2aUU+SUz8YOkEIO9WZySWq
	 ih0c7yOtrqI6w==
Date: Tue, 15 Sep 2026 00:03:26 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Subasri S <subasris1210@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Duncan Sands <duncan.sands@free.fr>,
	Chas Williams <3chas3@gmail.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Hans de Goede <hansg@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: chipidea: Use %pe to print error pointers
Message-ID: <aqjtvglG5NhsDLZe@hu-petche-lv.qualcomm.com>
References: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
 <20260801-usb-ptr_err_patchset-v2-1-1698e298c1e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-usb-ptr_err_patchset-v2-1-1698e298c1e3@gmail.com>
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

On 26-08-01 17:59:50, Subasri S wrote:
> Use the %pe format specifier instead of %ld with PTR_ERR() for printing
> error pointers in imx_get_clks(), ci_hdrc_imx_probe(), and
> ci_get_platdata(). This prints symbolic error names (e.g. -ENOMEM)
> instead of errno numbers (e.g. -12), making error logs more readable.
> 
> Fix coccinelle reported warning:
> WARNING: Consider using %pe to print PTR_ERR()
> 
> Compile-tested only.
> 
> Signed-off-by: Subasri S <subasris1210@gmail.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 12 ++++++------
>  drivers/usb/chipidea/core.c        |  4 ++--
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 56d2ba824a0b..7bfe37ed68ae 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -218,8 +218,8 @@ static int imx_get_clks(struct device *dev)
>  		if (IS_ERR(data->clk)) {
>  			ret = PTR_ERR(data->clk);
>  			dev_err(dev,
> -				"Failed to get clks, err=%ld,%ld\n",
> -				PTR_ERR(data->clk), PTR_ERR(data->clk_ipg));
> +				"Failed to get clks, err=%pe,%pe\n",
> +				data->clk, data->clk_ipg);
>  			return ret;
>  		}
>  		/* Get wakeup clock. Not all of the platforms need to
> @@ -448,8 +448,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  		pinctrl_hsic_idle = pinctrl_lookup_state(data->pinctrl, "idle");
>  		if (IS_ERR(pinctrl_hsic_idle)) {
>  			dev_err(dev,
> -				"pinctrl_hsic_idle lookup failed, err=%ld\n",
> -					PTR_ERR(pinctrl_hsic_idle));
> +				"pinctrl_hsic_idle lookup failed, err=%pe\n",
> +					pinctrl_hsic_idle);
>  			ret = PTR_ERR(pinctrl_hsic_idle);
>  			goto err_put;
>  		}
> @@ -464,8 +464,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  								"active");
>  		if (IS_ERR(data->pinctrl_hsic_active)) {
>  			dev_err(dev,
> -				"pinctrl_hsic_active lookup failed, err=%ld\n",
> -					PTR_ERR(data->pinctrl_hsic_active));
> +				"pinctrl_hsic_active lookup failed, err=%pe\n",
> +					data->pinctrl_hsic_active);
>  			ret = PTR_ERR(data->pinctrl_hsic_active);
>  			goto err_put;
>  		}
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 07563be0013f..09db8a4eace2 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -680,8 +680,8 @@ static int ci_get_platdata(struct device *dev,
>  			/* no vbus regulator is needed */
>  			platdata->reg_vbus = NULL;
>  		} else if (IS_ERR(platdata->reg_vbus)) {
> -			dev_err(dev, "Getting regulator error: %ld\n",
> -				PTR_ERR(platdata->reg_vbus));
> +			dev_err(dev, "Getting regulator error: %pe\n",
> +				platdata->reg_vbus);
>  			return PTR_ERR(platdata->reg_vbus);
>  		}
>  		/* Get TPL support */
> 
> -- 
> 2.43.0
> 

-- 

Thanks,
Peter Chen

