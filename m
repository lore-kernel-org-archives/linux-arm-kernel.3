Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF24D4923C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FJ/y1hwLv7jcpGEhdKgqRE0J3ZJWVPbAe/kdhme5J4=; b=piywUmaNAmTUVVJPVG3exYlV6x
	+MlyXODoOnc+cGXZcZ9K4IXiIwhCtexW9zlbciBqm46r/MuzdFhX3xlSMu8LFiNKJhvYEt82CcZJq
	b0WG59IN9fIr+wt0cRSXKSD2KyW092mze88N6uIvT0hEyiGcGJDjB/Lx1JDx88SVVyZToF3Ttu91M
	1MrGy3gvzOGUa2l0yZ1u6D0krOHNayKzSC7YjfsMGYlHpTs3PxJ1Z1GF6lcsfIsFbcmIWPo+tgaKU
	vaSLfYKEomvM7r8OOBAAX65yCHiCRjz1B5lK/aRidu+hV5HBeFnyKmjOsMdIoJkn950ukIV8M0fEJ
	kUwOrjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4Cm-0000000A0ob-3w6o;
	Mon, 18 Nov 2024 16:02:24 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4B1-0000000A0O3-3hOY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 16:00:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B72082000B;
	Mon, 18 Nov 2024 16:00:30 +0000 (UTC)
Message-ID: <a35ba8dc-fd4a-41ae-9ad7-7702f4f48980@korsgaard.com>
Date: Mon, 18 Nov 2024 17:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: xilinx: make sure pipe clock is deselected
 in usb2 only mode
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, michal.simek@amd.com,
 robert.hancock@calian.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com, Neal Frager
 <neal.frager@amd.com>, stable@vger.kernel.org
References: <1731942491-1992368-1-git-send-email-radhey.shyam.pandey@amd.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <1731942491-1992368-1-git-send-email-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: peter@korsgaard.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_080036_071092_8DE602B9 
X-CRM114-Status: GOOD (  25.65  )
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

On 11/18/24 16:08, Radhey Shyam Pandey wrote:
> From: Neal Frager <neal.frager@amd.com>
> 
> When the USB3 PHY is not defined in the Linux device tree, there could
> still be a case where there is a USB3 PHY is active on the board and

2nd "is " should be dropped. This sounds a bit confusing to me as the 
PHY is on-chip on zynqmp, maybe you are referring to a reference clock 
input to the PS-GTR instead?


> enabled by the first stage bootloader.  If serdes clock is being used
> then the USB will fail to enumerate devices in 2.0 only mode.
> 
> To solve this, make sure that the PIPE clock is deselected whenever the
> USB3 PHY is not defined and guarantees that the USB2 only mode will work
> in all cases.
> 
> Fixes: 9678f3361afc ("usb: dwc3: xilinx: Skip resets and USB3 register settings for USB2.0 mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v2:
> - Add stable@vger.kernel.org in CC.

Other than that looks good, thanks.

Acked-by: Peter Korsgaard <peter@korsgaard.com>


> ---
>   drivers/usb/dwc3/dwc3-xilinx.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
> index e3738e1610db..a33a42ba0249 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -121,8 +121,11 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>   	 * in use but the usb3-phy entry is missing from the device tree.
>   	 * Therefore, skip these operations in this case.
>   	 */
> -	if (!priv_data->usb3_phy)
> +	if (!priv_data->usb3_phy) {
> +		/* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
> +		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>   		goto skip_usb3_phy;
> +	}
>   
>   	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
>   	if (IS_ERR(crst)) {
> 
> base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c

-- 
Bye, Peter Korsgaard


