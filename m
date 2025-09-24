Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB195CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 00:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnGednQAnwv9ER2iB1Z9NBS4T2mF0GFsZAmAism9VDs=; b=y1iZ6M7AReHc0gOUfXs6rSAiAw
	dyuFBB9EYCX48H7k/yIPAk+/LJc9CEvzQcJ8ceDidVwOMhb911vmYkU9GmpdCsOKzuLeh4vwf5mmT
	yYrPYy30YuT0X2wv8ChuGrhXDER0qAqmArySdaYZgKDqbz/nFnmVJcmrZXlRz+IAuA6peH1KIQnLU
	KwfDbMGZ0j/webt2E0Gui4Xb5OagJmnl/xHihFJ2okOYbVQaktOhDhuqSaZ72H9QJTlwVqpqVnlO2
	XyZ4G7mJ928MrWAeShFfl0Q/JzR7L3/0N9zYA+si90mjITFjESEcQXb7Ni5NQqWb24zy/o8hRaqmu
	0OpcOBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Djy-0000000FF97-1GOh;
	Wed, 24 Sep 2025 00:52:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Djw-0000000FF8x-2ljU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 00:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B95B96020F;
	Wed, 24 Sep 2025 00:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C316C4CEF5;
	Wed, 24 Sep 2025 00:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758675131;
	bh=AVfHO1CTr0Qk1/2kp7j+A2HLBwT4+lGQ8iNME1oqqtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKDa67y6SyEFw1qlA6a9iuqltKqS79FgbeO5XHRgbgEJrbRFMGLyes+sdJl4P9Kx1
	 1Bdl/6xJlKkXJG7OLvO5j5xgFuFwUY/k5DADcWja7MHn/iR7QkmOIi3LOPlPuWQpPA
	 zEDH4f9m4ww4taqjnFfi27ghihSD6O4b+BT8gujROOLRCQ4si+7r136kK3fNJDxc/r
	 4ea+MQIeBO5jArQvh2YxrjviMh46GmoB5n0zp3nR5+fS7Sl+T9lGw5ALVTxMzxSMFq
	 wEfjCBXp0IEJty2uolJs47GNwkp9Q+jJlk+b7NYqtTN1QHj8n7uolepgdwxV0VgxM7
	 tDKztVOK9js6g==
Date: Wed, 24 Sep 2025 08:52:06 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v4 4/5] usb: chipidea: ci_hdrc_imx: Set out of band
 wakeup for i.MX95
Message-ID: <aNNAtlP768mMPPVC@nchen-desktop>
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
 <20250922-pm-v4-v4-4-ef48428e8fe0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-pm-v4-v4-4-ef48428e8fe0@nxp.com>
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

On 25-09-22 10:21:09, Peng Fan wrote:
> i.MX95 USB2 inside HSIOMIX could still wakeup Linux, even if HSIOMIX
> power domain(Digital logic) is off. There is still always on logic
> have the wakeup capability which is out band wakeup capbility.
> 
> So use device_set_out_band_wakeup for i.MX95 to make sure usb2 could
> wakeup system even if HSIOMIX power domain is in off state.
> 
> Tested-by: Xu Yang <xu.yang_2@nxp.com>
> Reviewed-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org> 

Feel free add my ack if power part has accepted.

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 11 ++++++++++-
>  include/linux/usb/chipidea.h       |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index d7c2a1a3c2715967203b98c819fa864e06a00a32..d4ee9e16332fe8b506711e4739c9008f73a377bf 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -79,6 +79,10 @@ static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
>  		CI_HDRC_HAS_PORTSC_PEC_MISSED,
>  };
>  
> +static const struct ci_hdrc_imx_platform_flag imx95_usb_data = {
> +	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM | CI_HDRC_OUT_BAND_WAKEUP,
> +};
> +
>  static const struct ci_hdrc_imx_platform_flag s32g_usb_data = {
>  	.flags = CI_HDRC_DISABLE_HOST_STREAMING,
>  };
> @@ -94,6 +98,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
>  	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
>  	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> +	{ .compatible = "fsl,imx95-usb", .data = &imx95_usb_data},
>  	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
>  	{ /* sentinel */ }
>  };
> @@ -704,9 +709,13 @@ static int ci_hdrc_imx_suspend(struct device *dev)
>  
>  	pinctrl_pm_select_sleep_state(dev);
>  
> -	if (data->wakeup_irq > 0 && device_may_wakeup(dev))
> +	if (data->wakeup_irq > 0 && device_may_wakeup(dev)) {
>  		enable_irq_wake(data->wakeup_irq);
>  
> +		if (data->plat_data->flags & CI_HDRC_OUT_BAND_WAKEUP)
> +			device_set_out_band_wakeup(dev);
> +	}
> +
>  	return ret;
>  }
>  
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index e17ebeee24e3ecc4b1c2d153d9ea9b656b5a3d35..c6451191d2de68607a9380482701d11f949d0ff7 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -66,6 +66,7 @@ struct ci_hdrc_platform_data {
>  #define CI_HDRC_HAS_PORTSC_PEC_MISSED	BIT(17)
>  #define CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS	BIT(18)
>  #define	CI_HDRC_HAS_SHORT_PKT_LIMIT	BIT(19)
> +#define	CI_HDRC_OUT_BAND_WAKEUP		BIT(20)
>  	enum usb_dr_mode	dr_mode;
>  #define CI_HDRC_CONTROLLER_RESET_EVENT		0
>  #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
> 
> -- 
> 2.37.1
> 

-- 

Best regards,
Peter

