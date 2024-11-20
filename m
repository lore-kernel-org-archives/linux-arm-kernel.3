Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B50D44171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U40w8bgx80+U51qZz8LaooL3Yp1nnphNk5nf7bSVTts=; b=VG2hYx9wF4xGZSBlyg8qTELBk1
	fPNDpPoToe6hLVtBGJyjOu7lnLbnTk5pGX8hix/Kqko+lBHe30hshz5TFuPDoEUsGwxLMuUJluSZ7
	CQ8r3YLvCMqIT9+NG5L2DAlDtn4vjuvjkN0P/4/sPZDx+9KMYTFx4fp8XTpcMYLMXGpC+FZ3/KuRC
	RdR0Yc/iJb0yCPhFA01KSfUDCKN144VFg99EYzFUQvaBnIosrvABsxXFWIYgIVh7r0yS034bph55G
	pieyVHamN0FQJPxHl5/zn3GVG1hH166Hd91fZA5aOmf5n3hB7GUPuzMRK/jmZebwOV5D4FG1WNTaA
	ZNP+S0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDh46-0000000EvWs-3NWU;
	Wed, 20 Nov 2024 09:32:02 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDh37-0000000EvPn-2ToU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:31:05 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AK9UkWf053730;
	Wed, 20 Nov 2024 03:30:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732095046;
	bh=U40w8bgx80+U51qZz8LaooL3Yp1nnphNk5nf7bSVTts=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TAnSY5SQzcGz+JUhGdciBYlxvde52ldvrUoOqpv8nX3TYeo1yqXUZTLFCjkTXuAPk
	 vzu4CfIyQRWfXiPYcERfyipf9UdMmoEn6ztn9acKIVZV1HzEtfQsq5t120vtbAPtoT
	 voxmn/qLu/tETsheEl/jv2KCkGbcuJHJmWVfRmlU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AK9UkVK055478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Nov 2024 03:30:46 -0600
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Nov 2024 03:30:45 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Wed, 20 Nov
 2024 03:30:45 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Nov 2024 03:30:45 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AK9UiLR034922;
	Wed, 20 Nov 2024 03:30:45 -0600
Date: Wed, 20 Nov 2024 15:00:44 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Jacky Bai <ping.bai@nxp.com>
CC: <lpieralisi@kernel.org>, <sudeep.holla@arm.com>, <rafael@kernel.org>,
        <daniel.lezcano@linaro.org>, <james.morse@arm.com>,
        <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <khilman@baylibre.com>
Subject: Re: [PATCH] cpuidle: psci: Init cpuidle only for present CPUs
Message-ID: <20241120093044.5yeyel4263fc27k7@lcpd911>
References: <20241120070608.1314850-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241120070608.1314850-1-ping.bai@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_013101_921563_6F0D871A 
X-CRM114-Status: GOOD (  21.70  )
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

Hi,

On Nov 20, 2024 at 15:06:08 +0800, Jacky Bai wrote:
> With 'nosmp' or 'maxcpus=0' boot command line paremeters,

s/paremeters/parameters

checkpatch should've caught this for you.

> the 'cpu_present_mask' may not be the same as 'cpu_possible_mask'
> 
> In current psci cpuidle driver init, for_each_possible_cpu()
> is used to init the cpudile for each possible CPU. but in

s/cpudile/cpuidle

> drivers/base/cpu.c ->cpu_dev_register_generic(),
> for_each_present_cpu() is used to register cpu device for
> present CPUs.
> 
> When boot system with 'nosmp' or 'maxcpus=0', the cpuidle driver
> init failed due to no valid CPU device sysfs node for non-boot CPUs.
> 
> [ 0.182993] Failed to register cpuidle device for cpu1

Please can we get a "Fixes:" Tag?

> 
> Use for_each_present_cpu() to register cpuidle only for present
> CPUs.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  drivers/cpuidle/cpuidle-psci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index 2562dc001fc1..00117e9b33e8 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -410,7 +410,7 @@ static int psci_cpuidle_probe(struct platform_device *pdev)
>  	struct cpuidle_driver *drv;
>  	struct cpuidle_device *dev;
>  
> -	for_each_possible_cpu(cpu) {
> +	for_each_present_cpu(cpu) {

With above concerns addressed,

Reviewed-by: Dhruva Gole <d-gole@ti.com>

>  		ret = psci_idle_init_cpu(&pdev->dev, cpu);
>  		if (ret)
>  			goto out_fail;
> -- 
> 2.34.1
> 
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

