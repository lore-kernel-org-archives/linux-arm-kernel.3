Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55450E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zywy86/SXHSrDVv61Xy7UCwbcBCIc1xb4djHs3K/9IA=; b=dZbcm1RqKRgJrMMo6tp6J0oAlS
	NHNKIdt8kYkn/h11WsHj5qMNBYP2FgL9dl3iNRNkpQt8Pd8sK+vhPGfbo35sqgD6wQAIaHNE/iKYh
	t2FY/9CrLr4cHtG3pYwBzdbzfq/1EmmYDU5N3tBfeEyZFnVVMkfnb5I9lQle5eNANTRTyaYZz7Kq5
	eqkGrQMrQhrrUegBRtojQaUc9ZD/uN4CEGpdu/Gxj9zWGqQkC2OGMDU5QJfBcFKnd8kUSQDF4h9nB
	gLP1De0KEhKmIWaiDrcMqKZ0bg7eUCtqaINJsst8szebUAmaXHSHbTTLpSVrS5UZlXY/FQ5MLcqYV
	qZmLTIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSgmX-00000007aTN-3W9c;
	Tue, 31 Dec 2024 18:15:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSgkb-00000007aHI-3n3O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 18:13:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39E60143D;
	Tue, 31 Dec 2024 10:14:21 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D21A3F673;
	Tue, 31 Dec 2024 10:13:50 -0800 (PST)
Date: Tue, 31 Dec 2024 18:13:48 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Message-ID: <Z3Q0XGA9li-nVcum@pluto>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_101354_014882_FDF3AB55 
X-CRM114-Status: GOOD (  17.86  )
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

On Wed, Dec 25, 2024 at 04:20:45PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> is created earlier, and the fwnode device points to the scmi device,
> non-i.MX platforms will never have the pinctrl supplier ready.
> 
> So bypass setting fwnode for scmi pinctrl devices that non
> compatible with socs.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 12190d4dabb65484543044b4424fbe3b67245466..87665b09c8ff492953c8300f80ed73eab6cce4fd 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -345,6 +345,11 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	device_unregister(&scmi_dev->dev);
>  }
>  
> +static const char * const scmi_pinctrl_imx_lists[] = {
> +	"fsl,imx95",
> +	NULL
> +};
> +
>  static int
>  __scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
>  		       int protocol, const char *name)
> @@ -353,6 +358,15 @@ __scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
>  	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq"))
>  		return 0;
>  
> +	if (protocol == SCMI_PROTOCOL_PINCTRL) {
> +		if (!strcmp(name, "pinctrl") &&
> +		    of_machine_compatible_match(scmi_pinctrl_imx_lists))
> +			return 0;
> +		if (!strcmp(name, "pinctrl-imx") &&
> +		    !of_machine_compatible_match(scmi_pinctrl_imx_lists))
> +			return 0;
> +	}

...and same here, you could set a flag scmi_dev->avoid_devlink and
just avoid calling device_link_add instead of killing the device_node...

Thanks,
Cristian

