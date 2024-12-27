Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DD4E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Obkpa8dleqHRpC2VnHwCwPofDUTKEsxEiAJ7QwLP5ew=; b=a+VEjki5EBIx110nVWF/3AKsT4
	wIc/gjR0VYvB/30V9U7145c3/+8zkOMKf6/UArOzpAb1GwROCzPygbsWcF/HbDpFPpHmsyQ8neUqa
	UPVBB8IApRa8CFZ40J9PyEydQMF6nl4WgkynIoXD8TWYX2kCA5v5EkzPWjKo6fSZEpvAPGIaUZoOZ
	K6c1mHPST66JoQAmKfO015sQFjVHENUgJridJxhodvajbf9Rzzwvff8FZoIoy5uz8UC5Iz0ERU5L6
	CkIGqc3a+twgKfUaYVt0BeZgn5wJ4E15cvRRJP/D3ore4Pr9O5URx5we9DeaRGxkPKiS1wayXxwUG
	Rv549tuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCJd-00000000XH9-4C4g;
	Fri, 27 Dec 2024 15:31:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCIU-00000000XB9-1wYk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 15:30:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E406D1E2F;
	Fri, 27 Dec 2024 07:31:09 -0800 (PST)
Received: from bogus (unknown [10.57.92.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E902B3F673;
	Fri, 27 Dec 2024 07:30:37 -0800 (PST)
Date: Fri, 27 Dec 2024 15:30:20 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] pinctrl: scmi: Check fwnode instead of machine
 compatible
Message-ID: <20241227153020.hl6lysid75yquca7@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-3-e9a3a5341362@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-scmi-fwdevlink-v1-3-e9a3a5341362@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_073042_558681_F533862C 
X-CRM114-Status: GOOD (  16.94  )
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

On Wed, Dec 25, 2024 at 04:20:46PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> For the platform that not compatible with scmi pinctrl device, the
> fwnode will not be set, so checking fwnode will make code simpler
> and easy to maintain.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index df4bbcd7d1d59ac2c8ddc320dc10d702ad1ed5b2..aade6df77dbb2c391741e77c0aac3f029991e4bb 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -505,11 +505,6 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
>  	return 0;
>  }
>  
> -static const char * const scmi_pinctrl_blocklist[] = {
> -	"fsl,imx95",
> -	NULL
> -};
> -
>  static int scmi_pinctrl_probe(struct scmi_device *sdev)
>  {
>  	int ret;
> @@ -521,7 +516,7 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
>  	if (!sdev->handle)
>  		return -EINVAL;
>  
> -	if (of_machine_compatible_match(scmi_pinctrl_blocklist))
> +	if (!dev->fwnode)

I would prefer to see the blocklist to be explicit here rather than
implicitly hiding it away with this change set.

-- 
Regards,
Sudeep

