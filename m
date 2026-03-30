Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B086C10F3DCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iq0He9/oXJLUWm6vOdkZ5IQUo5MP9X7z1MRLQ9BwIMg=; b=nPyWQAL3R9/tmqjmDZtWEzW4nz
	V0aYqFP0+NpIPakvzwgqadPF0rO+MyLuTChudqD2ED99UDBT2AabdtvMxg11RN9f7ZjOjGKbLz/3R
	axn5VNmef5gFQbQm8/CsbCQMGDmuzEn4mO3cdmn8eQs4Zx1TFKhQTSy0D5ZX76BLVWyKHyu7zUluD
	CSMEsYToyeKU3dS3+ZCmkM51eG1SJ9PUsOknKBN+qBhIarU6M76gvW+I7YS4A4ToKXrVHJyJ4Mp2D
	+aoGn0a2g58fVvsj5K6o8yT5l+MmwOycEz+vnmGG6Ra1wpaOTWqPAO28AUeLZVJGo74uhZH+fstxX
	jFgg0Gsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DSm-0000000BPK7-41V8;
	Mon, 30 Mar 2026 14:19:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DSj-0000000BPIN-2nFB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43162435F4;
	Mon, 30 Mar 2026 14:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E44C4CEF7;
	Mon, 30 Mar 2026 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774880368;
	bh=7JKfQ4X60P8s34YNmEr/x5qM0Dqg73sBd6HWsb7F41Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koc9ObP56Zk6I/x3PxH9MOtjozVM385t3ulgg6JRKvOQrpPLo7M2vMdoqb5u2Ec94
	 qe7pfwYLf7Ig/wM0VM7u1jLdI5rLHHYUJKCgxJ2MrIETU8gmtMqLGDs9gr3Tz+BKN1
	 Q09cWbw4kptRO4/dVw6F4+9PdvFNZqnb5QaNzS3M=
Date: Mon, 30 Mar 2026 16:19:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: phy: mxs: manually reset phy regs after a warm reset
Message-ID: <2026033057-sixties-erupt-fea7@gregkh>
References: <20260330093133.973785-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330093133.973785-1-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_071929_736787_419F693C 
X-CRM114-Status: GOOD (  16.85  )
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

On Mon, Mar 30, 2026 at 05:31:33PM +0800, Xu Yang wrote:
> The usb phy registers are not fully reset on warm reset under stress
> conditions. We need to manually reset those (CTRL, PWD, DEBUG, PLL_SIC)
> regs after a warm reset. This will reset DEBUG and PLL_SIC registers.
> CTRL and PWD register are handled by "SFT" bit in stmp_reset_block().
> 
> ERR051269: USB PHY registers not fully resetting on warm reset under
>            stress conditions
> 
> The following USB PHY registers must be written by SW to restore the reset
> value after a warm reset:
> 
> Reg: ctrl Addr: 0x29910030 Data: 0xc000_0000
> Reg: pwd Addr: 0x29910000 Data: 0x001e_1c00
> Reg: debug0 Addr: 0x29910050 Data: 0x7f18_0000
> Reg: pll_sic Addr: 0x299100a0 Data: 0x00d1_2000
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 7069dd3f4d0d..dd42db8a0829 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -209,6 +209,9 @@ static const struct mxs_phy_data imx6ul_phy_data = {
>  static const struct mxs_phy_data imx7ulp_phy_data = {
>  };
>  
> +static const struct mxs_phy_data imx8ulp_phy_data = {
> +};
> +
>  static const struct of_device_id mxs_phy_dt_ids[] = {
>  	{ .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
>  	{ .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
> @@ -217,6 +220,7 @@ static const struct of_device_id mxs_phy_dt_ids[] = {
>  	{ .compatible = "fsl,vf610-usbphy", .data = &vf610_phy_data, },
>  	{ .compatible = "fsl,imx6ul-usbphy", .data = &imx6ul_phy_data, },
>  	{ .compatible = "fsl,imx7ulp-usbphy", .data = &imx7ulp_phy_data, },
> +	{ .compatible = "fsl,imx8ulp-usbphy", .data = &imx8ulp_phy_data, },

Why can't you use &imx7ulp_phy_data here as it's all just empty?

thanks,

greg k-h

