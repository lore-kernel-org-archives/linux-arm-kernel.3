Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92F61073C9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWCigTS0KAZbJIgeNlAz+fchjs6na1NDpvoRi/IohXM=; b=dDK+tCM5KrMarfj0apzkexWddw
	j5AXC1ZVD3Gha2/OGAOsRjDYPW+Qc2ar7rElDpMWzY8lWVBsMh6P2m3KXpx3gm6Bq2r+X7wgTlgF2
	y6B5yu4TBZd2Mevl0EF4fHye2PoH5P1JagizfKLxxAXY+A3cfHhliGahM2r+/NMRdu69Fa1HDbBtg
	Gpb0Vy5WYZl0FMLNCfjx9FlszUntpQZL3G4D6Tgydz8VZAxBEJwUMs92apUY9Gb/AqHiMd+3fxTmN
	HgNMSlV0bnyZQykxq0vxw6mA7823JQa/HcNwnRLTsuwbhBdSQMxn77KP2lYBki80hGhSsXgPYhP/5
	FAExakbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARMN-00000008mLY-3QhL;
	Wed, 08 Apr 2026 11:46:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARML-00000008mLI-2AWb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:46:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53718600AD;
	Wed,  8 Apr 2026 11:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12E9C19421;
	Wed,  8 Apr 2026 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775648771;
	bh=pXDdDq1OeM2ARLlFkfpX3cDC8uKfgPA6ypCaoec4WYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYau3CYoCiinWGWS1IN9aV5DKhmV5bFEpiTxh8xGhRNciKb02kkXhbAQKgsD/Qpue
	 xnE6QPmxqn8QAIV8YzepAGlHD5P+GWSmRnWI/Ni3g4ryxKhlfxxPQGg2FH0ALex1P3
	 gYIWtd7TeEENTnvhX0Mkzj6BanGa3A3jqAzWZDOs=
Date: Wed, 8 Apr 2026 13:46:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: srini@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	martijn.de.gouw@prodrive-technologies.com
Subject: Re: [PATCH] nvmem: imx-ocotp: Initialize in subsys_initcall
Message-ID: <2026040852-crevice-hazily-adf4@gregkh>
References: <20260408101901.2111140-1-paul.geurts@prodrive-technologies.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408101901.2111140-1-paul.geurts@prodrive-technologies.com>
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

On Wed, Apr 08, 2026 at 12:19:01PM +0200, Paul Geurts wrote:
> The i.MX OCOTP driver is implemented as module_platform_driver();,
> which makes it initialize in device_initcall(). This means that all
> drivers referencing the clock driver nodes in the device tree are
> deferred by fw_devlink.
> 
> As the OCOTP driver is arch specific, but dependent on the i.MX clock
> driver, which is also initialized in arch_initcall(), explicitly
> initialize the driver in subsys_initcall(). This makes sure the drivers
> depending on fuses defined by OCOTP, which are initialized in
> device_initcall() are not deferred.
> 
> Fixes: 3edba6b47e42 ("nvmem: imx-ocotp: Add i.MX6 OCOTP driver")
> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
> ---
>  drivers/nvmem/imx-ocotp.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index 108d78d7f6cb..9b1e7bb14ced 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -638,7 +638,18 @@ static struct platform_driver imx_ocotp_driver = {
>  		.of_match_table = imx_ocotp_dt_ids,
>  	},
>  };
> -module_platform_driver(imx_ocotp_driver);
> +
> +static int __init imx_ocotp_init(void)
> +{
> +	return platform_driver_register(&imx_ocotp_driver);
> +}
> +subsys_initcall(imx_ocotp_init);

This is not a subsystem, sorry, but this isn't ok for a single driver to
use.

Please use the default level here, module_platform_driver() is correct,
and handle the deferred probe correctly, that is what it is designed to
do.  Playing games with init levels will not solve the root problem
here, as was pointed out by the fact that you could load this module in
any order and have the exact same problem you are attempting to "solve"
here.

thanks,

greg k-h

