Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BA7C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 01:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdulRIw8Gk4k6696aV+S359wzRZFArkLfSz7SWCKPf8=; b=SYhSuD4IH6VvGCn+0X4YFjbqVn
	4W4tlRG3a9sWXPND6XSxjMoBSk36+hI6TsTrfCzp5KYkquTKvQfbmon4owbV24f40HqjYUcmGS2Ur
	a3LDVgBNCGRcWKBdOLTHVRe7/kuI6QIjwK+J60Gt7FJaDuZaz4hqaRZIH0+nJRSQrzdjbwolHtDYa
	K68+nH1Wk/TNkxH1SMWGK7dX+JF1yz0kjWLbw1CNETmQZBYXWjMdIp53IaDzNp+xa5mDr1wfdrI0L
	NIAsaN6WGkGDK0V0hFe9HewW4SI7jpqoawab86Kxe+sB0/yHI9SvrbpgzvutwINiyMKz0lBTZ5pN2
	EveKt5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzl1-00000000tQL-0ody;
	Mon, 17 Mar 2025 01:59:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzi6-00000000tAa-389y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 01:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3637F5C4C9F;
	Mon, 17 Mar 2025 01:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA194C4CEDD;
	Mon, 17 Mar 2025 01:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742176569;
	bh=DW/PqvX6IeUImr+orrmNc0CoOSwyap646QVZ5Tbd3sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgO6gic3aLP5WD4qeK/GnvwCiJSitTz2Gt1erDNWLnNrEkznxdXhqdc+O75VTAdxr
	 61ZnvHhdUVMXBt5XeFtR9/A0H/OpeEG5Dg5ery/d6mRbPS3IIPbVr2NauH2bds90Xb
	 oF5pg6/M568SpedRB0+4TCbcBKrbV7CVXP7XXSeerfOMCq5HQ2OcMlHSTHgASYe4WI
	 ROiiBVv2ivwoe8mv9X89u2tpEWAsr/qZWwp0ADenS+DlqtIz8iXTJMSByy0k1QGhGc
	 cue4kBlKeuA+rX6fTqLdLjoQSnM0MZqTTEvemDBE31VX4R5tCbBV3Wf/o8SEFaDY4f
	 9expRlxM54ztg==
Date: Mon, 17 Mar 2025 09:56:01 +0800
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
Subject: Re: [PATCH v2 3/3] usb: chipidea: ci_hdrc_imx: implement
 usb_phy_init() error handling
Message-ID: <20250317015601.GC218167@nchen-desktop>
References: <20250316102658.490340-1-pchelkin@ispras.ru>
 <20250316102658.490340-4-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250316102658.490340-4-pchelkin@ispras.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_185610_894635_E331CA24 
X-CRM114-Status: GOOD (  18.27  )
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

On 25-03-16 13:26:56, Fedor Pchelkin wrote:
> usb_phy_init() may return an error code if e.g. its implementation fails
> to prepare/enable some clocks. And properly rollback on probe error path
> by calling the counterpart usb_phy_shutdown().
> 
> Found by Linux Verification Center (linuxtesting.org).
> 
> Fixes: be9cae2479f4 ("usb: chipidea: imx: Fix ULPI on imx53")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index d942b3c72640..4f8bfd242b59 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -484,7 +484,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	    of_usb_get_phy_mode(np) == USBPHY_INTERFACE_MODE_ULPI) {
>  		pdata.flags |= CI_HDRC_OVERRIDE_PHY_CONTROL;
>  		data->override_phy_control = true;
> -		usb_phy_init(pdata.usb_phy);
> +		ret = usb_phy_init(pdata.usb_phy);
> +		if (ret) {
> +			dev_err(dev, "Failed to init phy\n");
> +			goto err_clk;
> +		}
>  	}
>  
>  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
> @@ -493,7 +497,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	ret = imx_usbmisc_init(data->usbmisc_data);
>  	if (ret) {
>  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> -		goto err_clk;
> +		goto phy_shutdown;
>  	}
>  
>  	data->ci_pdev = ci_hdrc_add_device(dev,
> @@ -502,7 +506,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->ci_pdev)) {
>  		ret = PTR_ERR(data->ci_pdev);
>  		dev_err_probe(dev, ret, "ci_hdrc_add_device failed\n");
> -		goto err_clk;
> +		goto phy_shutdown;
>  	}
>  
>  	if (data->usbmisc_data) {
> @@ -536,6 +540,9 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  
>  disable_device:
>  	ci_hdrc_remove_device(data->ci_pdev);
> +phy_shutdown:
> +	if (data->override_phy_control)
> +		usb_phy_shutdown(data->phy);
>  err_clk:
>  	clk_disable_unprepare(data->clk_wakeup);
>  err_wakeup_clk:
> -- 
> 2.48.1
> 

-- 

Best regards,
Peter

