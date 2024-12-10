Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5C5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Q2mjqK2utewnwz3SOQOMOSFMFJ6XlJSNAJslzIgiJI=; b=lzJLdoL02Ib0r4o7vTqndn/7hs
	vHruRCJdO/GTALWhQKjjPOj9CAMjWXcMbaJmr4LMG+Ye3l3fDn9A6PKcmkDDZjDpPe+lpWv8UJzze
	2cC1C8AqpUFHQP8U1oczQb5pR4B6znjbVwJbNe3rREm96xT8izJXEHJK5AhDjMyTqjxdEFaatHKmL
	zGPcgFEdDr2HqSR3j8vAi7LZwUUzi1MKsNKp7q8JErJT5y0E8nffrxAUciEYCcpJG1QBdjBy5wD6v
	QQd2GLcdZUSQLG7QADFH8ubM36CN4BTXt054rZsYCeRLStEFKffExRBlH/VriOZGEsnDvH+4/B4EK
	MkxN6YGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxnL-0000000BBvy-3vqs;
	Tue, 10 Dec 2024 10:48:47 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxmH-0000000BBkb-2tnc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:47:43 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BAAlbqh2453885
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 04:47:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733827657;
	bh=0Q2mjqK2utewnwz3SOQOMOSFMFJ6XlJSNAJslzIgiJI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jZE1pnzR0Y7+n1EAHHaHZVWis7kL5hRKkEDugXvnvg3+fOUgbtObJbND0HWMn3GY+
	 6gwDkM9zUoUNJtAmqx8ibu5bt2P1th+sdKw35QA8yWLSSLN+jjlOv8nYE8AVTsV5a0
	 9Z2WYMkVizoD7QvC1tcxSyiIO4MskccTUIeBxpKA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BAAlbiq077159
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Dec 2024 04:47:37 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Dec 2024 04:47:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Dec 2024 04:47:36 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BAAla88122432;
	Tue, 10 Dec 2024 04:47:36 -0600
Date: Tue, 10 Dec 2024 16:17:35 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kevin Hilman <khilman@baylibre.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, <linux-pm@vger.kernel.org>,
        Nishanth
 Menon <nm@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
        Sebin Francis
	<sebin.francis@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/3] pmdomain: ti_sci: add per-device latency
 constraint management
Message-ID: <20241210104735.dtzdhdds6l7yjvgk@lcpd911>
References: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
 <20241206-lpm-v6-10-constraints-pmdomain-v6-1-833980158c68@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206-lpm-v6-10-constraints-pmdomain-v6-1-833980158c68@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_024741_892482_9DF5C99D 
X-CRM114-Status: GOOD (  27.54  )
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

On Dec 06, 2024 at 14:12:50 -0800, Kevin Hilman wrote:
> For each device in a TI SCI PM domain, check whether the device has
> any resume latency constraints set via per-device PM QoS.  If
> constraints are set, send them to DM via the new SCI constraints API.
> 
> Checking for constraints happen for each device before system-wide
> suspend (via ->suspend() hook.)
> 
> An important detail here is that the PM domain driver inserts itself
> into the path of both the ->suspend() and ->resume() hook path
> of *all* devices in the PM domain.  This allows generic PM domain code
> to handle the constraint management and communication with TI SCI.
> 
> Further, this allows device drivers to use existing PM QoS APIs to
> add/update constraints.
> 
> DM firmware clears constraints during its resume, so Linux has
> to check/update/send constraints each time system suspends.
> 
> Also note that the PM QoS framework uses usecs as the units for
> latency whereas the TI SCI firmware uses msecs, so a conversion is
> needed before passing to TI SCI.
> 
> Co-developed-by: Vibhore Vardhan <vibhore@ti.com>
> Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
> Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Tested-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  drivers/pmdomain/ti/ti_sci_pm_domains.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> index 0e4bd749d067309654307484c5bb98711bf06daf..963fe1901c959197d5d8b5d34fd8420dfb180087 100644
> --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
> +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> @@ -13,6 +13,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> +#include <linux/pm_qos.h>
> +#include <linux/pm_runtime.h>

nit: Do we not need to sort these includes alphabetically?

>  #include <linux/soc/ti/ti_sci_protocol.h>
>  #include <dt-bindings/soc/ti,sci_pm_domain.h>
>  
> @@ -51,6 +53,32 @@ struct ti_sci_pm_domain {
>  
>  #define genpd_to_ti_sci_pd(gpd) container_of(gpd, struct ti_sci_pm_domain, pd)
>  
> +static inline bool ti_sci_pd_is_valid_constraint(s32 val)
> +{
> +	return val != PM_QOS_RESUME_LATENCY_NO_CONSTRAINT;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static void ti_sci_pd_set_lat_constraint(struct device *dev, s32 val)
> +{
> +	struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +	struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
> +	const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
> +	u16 val_ms;
> +	int ret;
> +
> +	/* PM QoS latency unit is usecs, TI SCI uses msecs */
> +	val_ms = val / USEC_PER_MSEC;
> +	ret = ti_sci->ops.pm_ops.set_latency_constraint(ti_sci, val_ms, TISCI_MSG_CONSTRAINT_SET);
> +	if (ret)
> +		dev_err(dev, "ti_sci_pd: set latency constraint failed: ret=%d\n",
> +			ret);
> +	else
> +		dev_dbg(dev, "ti_sci_pd: ID:%d set latency constraint %d\n",
> +			pd->idx, val);
> +}
> +#endif
> +
>  /*
>   * ti_sci_pd_power_off(): genpd power down hook
>   * @domain: pointer to the powerdomain to power off
> @@ -79,6 +107,26 @@ static int ti_sci_pd_power_on(struct generic_pm_domain *domain)
>  		return ti_sci->ops.dev_ops.get_device(ti_sci, pd->idx);
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int ti_sci_pd_suspend(struct device *dev)
> +{
> +	int ret;
> +	s32 val;
> +
> +	ret = pm_generic_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	val = dev_pm_qos_read_value(dev, DEV_PM_QOS_RESUME_LATENCY);
> +	if (ti_sci_pd_is_valid_constraint(val))
> +		ti_sci_pd_set_lat_constraint(dev, val);
> +
> +	return 0;
> +}
> +#else
> +#define ti_sci_pd_suspend		NULL
> +#endif
> +
>  /*
>   * ti_sci_pd_xlate(): translation service for TI SCI genpds
>   * @genpdspec: DT identification data for the genpd
> @@ -182,6 +230,13 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>  				pd->pd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
>  				pd->idx = args.args[0];
>  				pd->parent = pd_provider;
> +				/*
> +				 * If SCI constraint functions are present, then firmware
> +				 * supports the constraints API.
> +				 */
> +				if (pd_provider->ti_sci->ops.pm_ops.set_device_constraint &&
> +				    pd_provider->ti_sci->ops.pm_ops.set_latency_constraint)
> +					pd->pd.domain.ops.suspend = ti_sci_pd_suspend;

Rest looks good.
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

