Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEA9D68BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGLcu5n2GBoAIrM41iGGXSFf1+jVe3MA7qVsLR0YhSU=; b=ILxULEIbqixvfiFsFTtpeGtB/3
	DATfom8mJuyeMKgzPT+C1UqEphIocg1Jn1LFtZ1DSsShUDP5LcPOCBRQwk32ZUO56KgTWoMoyaq0Y
	Tu3LiN2UDb/7AZ/SImLE8X/VT7fiuiCjmaHiyRR8Rdl0RiyP3UjVvOZdFOFbEs1/seuKcINFBCK42
	3F5xl46ax4x60kyyLdwNx5Vs81g3H3cJzUBCoIG5UixEQNBlsmB6VW0AWPgLy0ZuypB7aYvqo1eyz
	X20SCszc2FPe4x90UgypE7pOvuTYtCsyOQklKdC/ff5fVk9h1F5wVsQkW3f7NmE8c6r4K2vgV/Mos
	L8/7/I4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCDpc-00000005C44-1981;
	Sat, 16 Nov 2024 08:07:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCDoh-00000005Bx4-02JZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 08:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED82BA4030B;
	Sat, 16 Nov 2024 08:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B116C4CEC3;
	Sat, 16 Nov 2024 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731744361;
	bh=bQ/rmffOm2v/gX5o6y6qAx3LH5jlMVgs8emLepbSxaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xf9uzds67a2eJp61+uQC+qqZv1QVVn0+RSAOWiwwWjYIF1EhHjWsN1AZMDM6SdxzX
	 SBjeQf6v6VK8J+BtJbjKxXFd9I0z8UEowkx1QIVUJ2uUlrULO8kAICykISe5GBxgzv
	 5bqQHEy62GZjD5G2b+q9acu9nehbEeh5ftB1XUFI=
Date: Sat, 16 Nov 2024 09:05:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: Thinh.Nguyen@synopsys.com, michal.simek@amd.com,
	robert.hancock@calian.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com, Neal Frager <neal.frager@amd.com>
Subject: Re: [PATCH] usb: dwc3: xilinx: make sure pipe clock is deselected in
 usb2 only mode
Message-ID: <2024111625-afraid-pencil-b567@gregkh>
References: <1731695460-1814409-1-git-send-email-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1731695460-1814409-1-git-send-email-radhey.shyam.pandey@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_000603_186670_E2E9AC19 
X-CRM114-Status: GOOD (  32.75  )
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

On Sat, Nov 16, 2024 at 12:01:00AM +0530, Radhey Shyam Pandey wrote:
> From: Neal Frager <neal.frager@amd.com>
> 
> When the USB3 PHY is not defined in the Linux device tree, there could
> still be a case where there is a USB3 PHY is active on the board and
> enabled by the first stage bootloader.  If serdes clock is being used
> then the USB will fail to enumerate devices in 2.0 only mode.
> 
> To solve this, make sure that the PIPE clock is deselected whenever the
> USB3 PHY is not defined and guarantees that the USB2 only mode will work
> in all cases.
> 
> Fixes: 9678f3361afc ("usb: dwc3: xilinx: Skip resets and USB3 register settings for USB2.0 mode")
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  drivers/usb/dwc3/dwc3-xilinx.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
> index e3738e1610db..a33a42ba0249 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -121,8 +121,11 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>  	 * in use but the usb3-phy entry is missing from the device tree.
>  	 * Therefore, skip these operations in this case.
>  	 */
> -	if (!priv_data->usb3_phy)
> +	if (!priv_data->usb3_phy) {
> +		/* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
> +		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>  		goto skip_usb3_phy;
> +	}
>  
>  	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
>  	if (IS_ERR(crst)) {
> 
> base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
> -- 
> 2.34.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

