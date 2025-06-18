Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ECFC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBuwWCDRC2ilLYV7xPaa0C272Wi1C7s/4cz4zNKLglM=; b=v7upUKvlp+bIAcaFnaIdbWAc5C
	Ac4rEnD33tzUrc0jdjNDCIjwo4Yw6aCjGNq2ls1jbPzX0KAOjiUnvNjI+QCnKW2kAVgU+c7lqfd/o
	0juLKM3QOaO1H+Rdc+nG3KmsAwFRhM5iKkU48d/skY5ITogrAs618FcKLqaLeD5TwoqjoYJf37T2I
	KsNB8gtzDlYYEWD3Nz5ZA4DyQVfZ1JLvhjTbs3vI+LtuzGKeJuYw7A5wQjvUTU8uxr12o8CP8IijM
	7Su6SBSV0dV7e4kQa4T6TlLP8vU48qnl0jyTyPF626YM1mHD5/69PH8WyWNEwmn4/6Wr8fP8qGyic
	CdV3qirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsF7-0000000ABkv-2pM3;
	Wed, 18 Jun 2025 12:50:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqDN-00000009okk-29yb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 751C05C5899;
	Wed, 18 Jun 2025 10:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139BEC4CEED;
	Wed, 18 Jun 2025 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750243220;
	bh=AueBCN8tRB74R7bXda+ZgkK2ACmlaLw4HLQJigCYu9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOAOqYRI7zTBWv26itXvLZdWWRRLaHeZ1iwa9q1jcrqFYpArRa1V4qOB9cPvGI8kb
	 3X1Od12B/08BKQHxbN37k4Z8uO1xZrlOHAFYw9ETGBBzgI2TzLswuWY+K1JQS0u6v0
	 se8tPwjG3FZejiybWuku+r4enNg0kqg906oWeNdk6wBxv6inRTET6rApN7Yokm1lYg
	 GZ8ZyH/2dYatyJ+py/2KG6vGeyKgJZmS/4vyBi8ZHxJM+8BDmsmuOzyaQ0coOAepPX
	 lo1vj+/yCiOSvZHwevxyS1Y5bznqpDAmLftww3FBF+ihoVAD50+Rp+S3hiNPVvfXdm
	 kBzBc8huXEpaw==
Date: Wed, 18 Jun 2025 18:40:13 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.d,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] usb: chipidea: imx: implement workaround for
 ERR051725
Message-ID: <20250618104013.GD34284@nchen-desktop>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
 <20250614125645.207732-4-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614125645.207732-4-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_034021_645021_6B66EDD5 
X-CRM114-Status: GOOD (  23.05  )
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

On 25-06-14 20:56:45, Xu Yang wrote:
> ERR051725:
> USB: With the USB controller configured as device mode, Clearing the RS
> bit of USBCMD register fails to cause USB device to be detached
> 
> Description
> 1. USB controller working as high speed device mode with USB gadget
>    function enabled
> 2. Cable plugged into USB host
> 3. Use case is software-controlled detach from USB device side
> 
> The expected result is device side terminations removed, increase in USB
> signal amplitude, USB host detect device is detached. But the issue is
> that the clear RS bit of USBCMD register cannot cause device detach event.
> 
> Workaround
> - Use the below steps to detach from the host:
>     write USBCMD.RS = 0b
>     write CTRL2[7:6] = 01b
>     write CTRL2[8] = 1b
> - As CTRL2[8] is set at detach case, so attach the steps should add clear
>   CTRL2[8]:
>     write USBCMD.RS = 1b
>     write CTRL2[8] = 0b
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c |  5 +++++
>  drivers/usb/chipidea/usbmisc_imx.c | 21 +++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 780f4d151345..79e466e17788 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -331,6 +331,11 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
>  		if (ci->usb_phy)
>  			schedule_work(&ci->usb_phy->chg_work);
>  		break;
> +	case CI_HDRC_CONTROLLER_PULLUP_EVENT:
> +		if (ci->role == CI_ROLE_GADGET)
> +			imx_usbmisc_pullup(data->usbmisc_data,
> +					   ci->gadget.connected);
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 9db67d6d0ec4..415d3ba2e9ad 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -998,6 +998,25 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
>  	return 0;
>  }
>  
> +static void usbmisc_imx7d_pullup(struct imx_usbmisc_data *data, bool on)
> +{
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
> +	if (!on) {
> +		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
> +		val |= MX7D_USBNC_USB_CTRL2_OPMODE(1);
> +		val |= MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
> +	} else {
> +		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
> +	}
> +	writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +}
> +
>  static int usbmisc_imx7d_power_lost_check(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> @@ -1115,6 +1134,7 @@ static const struct usbmisc_ops imx7d_usbmisc_ops = {
>  	.set_wakeup = usbmisc_imx7d_set_wakeup,
>  	.charger_detection = imx7d_charger_detection,
>  	.power_lost_check = usbmisc_imx7d_power_lost_check,
> +	.pullup = usbmisc_imx7d_pullup,
>  	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
>  };
>  
> @@ -1131,6 +1151,7 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
>  	.set_wakeup = usbmisc_imx95_set_wakeup,
>  	.charger_detection = imx7d_charger_detection,
>  	.power_lost_check = usbmisc_imx7d_power_lost_check,
> +	.pullup = usbmisc_imx7d_pullup,
>  	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
>  };
>  
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

