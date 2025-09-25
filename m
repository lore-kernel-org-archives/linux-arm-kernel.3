Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCF2CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 01:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4jzRMU+Wy1HXNCFi7H901JFVS8+fdDRisj5XC2xvCA=; b=RbNO9JE077MSdJTArcw1/xvuE5
	0T8KlmKNvzf+BWGTajZbX769OtXA0PRizSzDql7pEiOl9mht31C76aO0P1kN75iH0pXam6W5AqnHS
	6xD5UbyrnzrK6ngNita7i/XNifPHkp6ABcv7a3H/hT3RObqkcnlTr/Sx/cFOSWlkEsSMSRz+IEq0Z
	m2L8S/9bKVkyMlFLnXPBcOy22356qk3Hpa/n/A/GDzxcP74TI+BVGjB6Wu4MMzCoRq0+rQWhp7lKf
	sQejsciA7FStWfbFVxAIZdjHBR8s6tip2wxeXm/zt9K+qgYofpJIQu1MZVjKXEGj7q1trVX2KfXfq
	hDrhjH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1avx-00000005Cdb-3c6k;
	Thu, 25 Sep 2025 01:38:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1avw-00000005CdD-0O5R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 01:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AB0443A69;
	Thu, 25 Sep 2025 01:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED217C4CEE7;
	Thu, 25 Sep 2025 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758764287;
	bh=R56JQo7sMGCvl44O1tarkNLRb1ITcNAK6pzLL40GZZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsIGJwfXVGGILnvr3bZSJVeaPojWCRzGfd0hPeRv/MJD568JGvSE0713/ssJUQiiC
	 mHwNJzzsv92kQOdsGzjRjvI/yZWUxvEoyh6pgp8szk1Dd77UIGv+JehwtsdXuIA0HN
	 ZKNtJaVTfm8bSIDeCY0theuEY5UbK53ypzuDvOK549niBPj8EoF3f+wjvzRTDfn1ob
	 7IS2tbLwKaQXK9iKp2gXgj7b49NZm5O6cYzpcPc+6XDGqQw4ed6lELIu04QMQWOBGC
	 Ky0OV8IunuQOU/f8YIfcw+MdgkUnSpiBUKRh43yPE9J28y2xx74buqybdkxzJo1FqK
	 Vt5hBzx3jfsqA==
Date: Thu, 25 Sep 2025 09:38:02 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peng.fan@nxp.com,
	jun.li@nxp.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] usb: chipidea: imx: add USB support for i.MX94
Message-ID: <20250925013802.GA3106023@nchen-desktop>
References: <20250919071111.2558628-1-xu.yang_2@nxp.com>
 <20250919071111.2558628-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919071111.2558628-2-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_183808_157047_EEA53E16 
X-CRM114-Status: GOOD (  16.46  )
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

On 25-09-19 15:11:11, Xu Yang wrote:
> Add new imx94_usbmisc_ops for i.MX94 due to it has same wakeup logic
> as i.MX95, but it doesn't need workaround for ERR051725, so pullup
> is not needed.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index b1418885707c..bb027d2bd700 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -1224,6 +1224,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
>  	.power_lost_check = usbmisc_imx7d_power_lost_check,
>  };
>  
> +static const struct usbmisc_ops imx94_usbmisc_ops = {
> +	.init = usbmisc_imx7d_init,
> +	.set_wakeup = usbmisc_imx95_set_wakeup,
> +	.charger_detection = imx7d_charger_detection,
> +	.power_lost_check = usbmisc_imx7d_power_lost_check,
> +	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
> +};
> +
>  static const struct usbmisc_ops imx95_usbmisc_ops = {
>  	.init = usbmisc_imx7d_init,
>  	.set_wakeup = usbmisc_imx95_set_wakeup,
> @@ -1481,6 +1489,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
>  		.compatible = "fsl,imx8ulp-usbmisc",
>  		.data = &imx7ulp_usbmisc_ops,
>  	},
> +	{
> +		.compatible = "fsl,imx94-usbmisc",
> +		.data = &imx94_usbmisc_ops,
> +	},
>  	{
>  		.compatible = "fsl,imx95-usbmisc",
>  		.data = &imx95_usbmisc_ops,
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

