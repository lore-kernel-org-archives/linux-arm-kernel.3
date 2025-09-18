Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338B3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 05:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKjp6N/ixan1BjatOrTjluVvM3Lvf9IQYxDJwVkTHGI=; b=rJshsjii1j5tjOTKwAxF7/+YZP
	tjT8afZGYMdfxhKVEPpF11XF60emX4xCx6EvJKEBVPXHg8NqVuUCjpnr95M82fdPJ+8pJ2KSim6Sg
	v9DHutXAglU9HISjtRdEUOQTrN5M7znKkj/IGciYf0W82EzJ3GxpXE4DA+oJesZztzTInyP7d9NZT
	SDmjcbR3CKYyLzyJ2n7cuygVwMS73Fqk9Vbu+MWy4lf59xEnr0bS7BFiT0YyCyG9V18AmVE6pD9bA
	ENAqZtmsRjn01sNaidoiQh145XKAWOwB+TM69yCEKiVp/QAhBds/CJ0KR9x6XVvpYnFgCSYJDMVCy
	TqnAwErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7N5-0000000GKto-0xe7;
	Thu, 18 Sep 2025 05:39:55 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7N2-0000000GKs0-0mi0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 05:39:53 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58I5dad41676466;
	Thu, 18 Sep 2025 00:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758173976;
	bh=DKjp6N/ixan1BjatOrTjluVvM3Lvf9IQYxDJwVkTHGI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Jn+/3YUR2Waxjc9kICUNeTvsLCWZ4SzptzZzI552+gi1e+Q2RL8vnGaY9mJvRB210
	 IBO/CfMwq6N3MSR4jYnGhI4HH7PNUrWg5OaAvNzXbiZrzAR++zhdOj5N7ozg9HZlXF
	 ng1LpS5A5lLuaRU1bZCJWi9aSylBGdVhX1NZzp+A=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58I5da5Q1878417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 00:39:36 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 00:39:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 00:39:35 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58I5dYu7066935;
	Thu, 18 Sep 2025 00:39:35 -0500
Date: Thu, 18 Sep 2025 11:09:34 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Peng Fan <peng.fan@nxp.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek
	<pavel@kernel.org>, Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Xu Yang <xu.yang_2@nxp.com>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <imx@lists.linux.dev>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] pmdomain: core: Introduce
 device_set/get_out_band_wakeup()
Message-ID: <20250918053934.dweerdmcqdkr342w@lcpd911>
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
 <20250902-pm-v3-1-ffadbb454cdc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250902-pm-v3-1-ffadbb454cdc@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_223952_365171_724BCC8B 
X-CRM114-Status: GOOD (  26.16  )
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

On Sep 02, 2025 at 11:33:00 +0800, Peng Fan wrote:
> For some cases, a device could still wakeup the system even if its power
> domain is in off state, because the device's wakeup hardware logic is
> in an always-on domain.

Don't we already have something like wake IRQs [1] for such purposes?

8<----------------------------------------------------------------------
That may involve turning on a special signal handling logic within the
platform (such as an SoC) so that signals from a given line are routed
in a different way during system sleep so as to trigger a system wakeup
when needed
----------------------------------------------------------------------->8

[1] https://docs.kernel.org/power/suspend-and-interrupts.html#system-wakeup-interrupts-enable-irq-wake-and-disable-irq-wake

> 
> To support this case, introduce device_set/get_out_band_wakeup() to
> allow device drivers to control the behaviour in genpd for a device
> that is attached to it.

Do you have any explanation as to why wake IRQ is not solving this
problem and you need to introduce these new APIs?

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pmdomain/core.c   |  6 ++++--
>  include/linux/pm.h        |  1 +
>  include/linux/pm_wakeup.h | 17 +++++++++++++++++
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 0006ab3d078972cc72a6dd22a2144fb31443e3da..8e37758cea88a9ee051ad9fb13bdd3feb4f8745e 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -1549,7 +1549,8 @@ static int genpd_finish_suspend(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
> +	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
> +	    !device_get_out_band_wakeup(dev))
>  		return 0;
>  
>  	if (genpd->dev_ops.stop && genpd->dev_ops.start &&
> @@ -1604,7 +1605,8 @@ static int genpd_finish_resume(struct device *dev,
>  	if (IS_ERR(genpd))
>  		return -EINVAL;
>  
> -	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
> +	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
> +	    !device_get_out_band_wakeup(dev))
>  		return resume_noirq(dev);
>  
>  	genpd_lock(genpd);
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index cc7b2dc28574c24ece2f651352d4d23ecaf15f31..5b28a4f2e87e2aa34acc709e146ce729acace344 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -684,6 +684,7 @@ struct dev_pm_info {
>  	bool			smart_suspend:1;	/* Owned by the PM core */
>  	bool			must_resume:1;		/* Owned by the PM core */
>  	bool			may_skip_resume:1;	/* Set by subsystems */
> +	bool			out_band_wakeup:1;
>  	bool			strict_midlayer:1;
>  #else
>  	bool			should_wakeup:1;
> diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
> index c838b4a30f876ef5a66972d16f461cfba9ff2814..c461c7edef6f7927d696b7d18b59a6a1147f53a3 100644
> --- a/include/linux/pm_wakeup.h
> +++ b/include/linux/pm_wakeup.h
> @@ -94,6 +94,16 @@ static inline void device_set_wakeup_path(struct device *dev)
>  	dev->power.wakeup_path = true;
>  }
>  
> +static inline void device_set_out_band_wakeup(struct device *dev, bool capable)
> +{
> +	dev->power.out_band_wakeup = capable;
> +}
> +
> +static inline bool device_get_out_band_wakeup(struct device *dev)
> +{
> +	return dev->power.out_band_wakeup;
> +}
> +
>  /* drivers/base/power/wakeup.c */
>  extern struct wakeup_source *wakeup_source_register(struct device *dev,
>  						    const char *name);
> @@ -162,6 +172,13 @@ static inline bool device_wakeup_path(struct device *dev)
>  
>  static inline void device_set_wakeup_path(struct device *dev) {}
>  
> +static inline void device_set_out_band_wakeup(struct device *dev, bool capable) {}
> +
> +static inline bool device_get_out_band_wakeup(struct device *dev)
> +{
> +	return false;
> +}
> +
>  static inline void __pm_stay_awake(struct wakeup_source *ws) {}

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

