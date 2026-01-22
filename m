Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D23DD3EE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bg/CHyhne7O2jLFcTHSAA523DDm022WUH162HuXPh48=; b=zQbZPzVkxH9seUDXblXD3Jih8Q
	PVCkQOq9Z+ja7ng9qBaW9ooO8raUkdC9c8QxdrX87Ptg1RRzuN+F0tzQ3VLex26Q2Cgw6xdHPmXFX
	o/00psOJvVsUJT0d5FLRq2py2IltpEQ4R1VwCN39RkFmkzt2HUBuqlDTWx/McO/E6YQZ9lzuMRyKv
	GHe5OFR5aAqQCM3dr4PyCZ3EgOA/UAcNenSOlbRJVpZr3g9RguTwaJTKoVXwMrdVyhM1Zj0cFyU1O
	AH+fWV04WIwI33/r6WIibELUP9aJkg7OJbqnZQr/SJLpODFioGK3gkvewIw9oUCi9EtE74KZVdEua
	Tk4dNa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viunZ-000000079iG-2b9P;
	Thu, 22 Jan 2026 13:32:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viunW-000000079ho-2EHK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:32:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D5661517
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 05:32:19 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A545B3F632
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 05:32:25 -0800 (PST)
Date: Thu, 22 Jan 2026 13:30:52 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: vexpress-config: Fix device node reference leak in
 probe
Message-ID: <aXImjNHQMeqMbcAu@e142607>
References: <20260122-b4-vexpress-config-v1-1-3f0c85bc4730@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260122-b4-vexpress-config-v1-1-3f0c85bc4730@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_053230_663089_8F819DC3 
X-CRM114-Status: GOOD (  20.81  )
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

Hello,

On Thu, Jan 22, 2026 at 08:33:04PM +0800, Felix Gu wrote:
> In vexpress_syscfg_probe(), of_parse_phandle() is called inside a loop
> but the returned device_node reference is never released.
> Fix this by using the __free(device_node) cleanup handler to automatically
> release the reference when the variable goes out of scope.
> 
> Fixes: a5a38765ac79b ("bus: vexpress-config: simplify config bus probing")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/bus/vexpress-config.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.c
> index 64ee920721ee..a1fa583e9f5d 100644
> --- a/drivers/bus/vexpress-config.c
> +++ b/drivers/bus/vexpress-config.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2014 ARM Limited
>   */
>  
> +#include <linux/cleanup.h>

Not sure this is needed. of.h includes cleanup.h, so we don't run the risk of
not getting the cleanup macros defined.

>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> @@ -390,9 +391,8 @@ static int vexpress_syscfg_probe(struct platform_device *pdev)
>  	}
>  
>  	for_each_compatible_node(node, NULL, "arm,vexpress,config-bus") {
> -		struct device_node *bridge_np;
> -
> -		bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
> +		struct device_node *bridge_np __free(device_node) =
> +			of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
>  		if (bridge_np != pdev->dev.parent->of_node)
>  			continue;
>

Otherwise, patch looks good to me. Thanks for the fix!

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> 
> ---
> base-commit: 053966c344dbd346e71305f530e91ea77916189f
> change-id: 20260122-b4-vexpress-config-1d2051861d93
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>
> 

