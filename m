Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA50C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 01:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uayjEljOTmaXAhGOZI2FmsQ8mrpyQtqY/cTEZN3Qdw=; b=A4tsy2vplIGyFpyfPjyX4VVMF8
	qd1nVBclBQJNN6lnskpDGbCrspdzhb8njo4ZcyiMm3GnxOQ/LRQUIEe4uAzXt6KgPemL4WHDZAoFJ
	kE6G0RyM1n9PfwFt7RB451FbCmGzVzLgRQlonp4Z84e/Tn8RkcQcv81XRi4XfaCzzOSID2VqZOfHN
	pbhReUEQ99KRCM4TZunsFyG9G7dggc6Wppnh/bOJUJOkgc7YYJMBdJ3EYrXcT963rrtJIIvikHyuC
	cgbWVw3v++j/C/j5zO3mW5RFQhhrN5DICG9LiGUZtil7KahSdg9trDQNQPwV3m8hqVK84BwmCXuL/
	YiMg8WEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzjN-00000000tJ6-22Tw;
	Mon, 17 Mar 2025 01:57:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzgl-00000000szV-3bkx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 01:54:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7517B5C1B99;
	Mon, 17 Mar 2025 01:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F3BC4CEDD;
	Mon, 17 Mar 2025 01:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742176487;
	bh=i8Zgs3umIvGH2qQwYjil63u/LJvMP0AVGyrUYdKPEh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzUFglXM3IaoIi+CZRubjx8LO9MQgySMquQ29q/nXWST9VMICxfYxpX7aprmijkRp
	 IyaOmCZF39L+Of3uSbI79cSE+L+cGC1H+jDCL+jBEu5L/8ghWsVfIe3nhs2tcicz6h
	 PmHoymoqQzzaTeg3heDCKFyJ4ZLaZmI0YD28HpI4eR618aGnM1p70hLCANded8hKLj
	 iQ8pieiuXtkWkgidlGT5iKzPP+VRcqoPcPfZVtPHm3E4VpdBzS16DDTDdWzD0CjEng
	 e5dZ5peRF3H/1j2/dlP6d++Y4GCmtFE8FEIZXgFgkgFBxun2RTBhU/c8xpspvmKP4j
	 7KwTqaIUoBCYQ==
Date: Mon, 17 Mar 2025 09:54:37 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Frank Li <Frank.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Sebastian Reichel <sre@kernel.org>,
	Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: chipidea: ci_hdrc_imx: fix call balance of
 regulator routines
Message-ID: <20250317015437.GB218167@nchen-desktop>
References: <20250316102658.490340-1-pchelkin@ispras.ru>
 <20250316102658.490340-3-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250316102658.490340-3-pchelkin@ispras.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_185447_989332_6DC08E71 
X-CRM114-Status: GOOD (  25.59  )
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

On 25-03-16 13:26:55, Fedor Pchelkin wrote:
> Upon encountering errors during the HSIC pinctrl handling section the
> regulator should be disabled.
> 
> Use devm_add_action_or_reset() to let the regulator-disabling routine be
> handled by device resource management stack.
> 
> Found by Linux Verification Center (linuxtesting.org).
> 
> Fixes: 4d6141288c33 ("usb: chipidea: imx: pinctrl for HSIC is optional")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

Acked-by: Peter Chen <peter.chen@kernel.org>


> ---
> v2: simplify the patch taking advantage of devm-helper (Frank Li)
> 
> It looks like devm_regulator_get_enable_optional() exists for this very
> use case utilized in the driver but it's not present in old supported
> stable kernels and I may say those dependency-patches wouldn't apply there
> cleanly. So fix the problem first, further code simplification is a
> subject to cleanup patch.
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 619779eef333..d942b3c72640 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -336,6 +336,13 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
>  	return ret;
>  }
>  
> +static void ci_hdrc_imx_disable_regulator(void *arg)
> +{
> +	struct ci_hdrc_imx_data *data = arg;
> +
> +	regulator_disable(data->hsic_pad_regulator);
> +}
> +
>  static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  {
>  	struct ci_hdrc_imx_data *data;
> @@ -394,6 +401,13 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  					"Failed to enable HSIC pad regulator\n");
>  				goto err_put;
>  			}
> +			ret = devm_add_action_or_reset(dev,
> +					ci_hdrc_imx_disable_regulator, data);
> +			if (ret) {
> +				dev_err(dev,
> +					"Failed to add regulator devm action\n");
> +				goto err_put;
> +			}
>  		}
>  	}
>  
> @@ -432,11 +446,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  
>  	ret = imx_get_clks(dev);
>  	if (ret)
> -		goto disable_hsic_regulator;
> +		goto qos_remove_request;
>  
>  	ret = imx_prepare_enable_clks(dev);
>  	if (ret)
> -		goto disable_hsic_regulator;
> +		goto qos_remove_request;
>  
>  	ret = clk_prepare_enable(data->clk_wakeup);
>  	if (ret)
> @@ -526,10 +540,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(data->clk_wakeup);
>  err_wakeup_clk:
>  	imx_disable_unprepare_clks(dev);
> -disable_hsic_regulator:
> -	if (data->hsic_pad_regulator)
> -		/* don't overwrite original ret (cf. EPROBE_DEFER) */
> -		regulator_disable(data->hsic_pad_regulator);
> +qos_remove_request:
>  	if (pdata.flags & CI_HDRC_PMQOS)
>  		cpu_latency_qos_remove_request(&data->pm_qos_req);
>  	data->ci_pdev = NULL;
> @@ -557,8 +568,6 @@ static void ci_hdrc_imx_remove(struct platform_device *pdev)
>  		clk_disable_unprepare(data->clk_wakeup);
>  		if (data->plat_data->flags & CI_HDRC_PMQOS)
>  			cpu_latency_qos_remove_request(&data->pm_qos_req);
> -		if (data->hsic_pad_regulator)
> -			regulator_disable(data->hsic_pad_regulator);
>  	}
>  	if (data->usbmisc_data)
>  		put_device(data->usbmisc_data->dev);
> -- 
> 2.48.1
> 

-- 

Best regards,
Peter

