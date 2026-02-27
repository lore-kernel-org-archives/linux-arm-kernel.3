Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF7FFEFB6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4BMQf7DS5bTYv4ysKMA/Kz1rPgEc5mN1e6U/NCEiUs=; b=pS3O/cOV8lPj9OgmOYQCSNln//
	JjWgx2tO4QliiNxIf33qeX6bDBBLBVIXSB19KXVEXmdUksGIQSDVtGsMuyavHIkbgnOHBv+lbc18+
	vm8fk+6ZwZJzmvxfx8/Pe+y5pKa1ftSrFURsNnrG6N5Mn2601PXmhuNx+lZ7P5vDim1d6EBu4qKbo
	6Oy7G2nM7n95n6L9+gbItA010edS3Ql0JwqJHLbAL5WjgcXIt5PAq0WbNIXL3VBDgECNM49RQBxYW
	D5yFpd9vpveXb9gFe/qFuVx8kRss86plpB20g5vZqm2ew5W3W1Y3ltYiJuUJFtQo9W5P0x04qNKYB
	4nkhvP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw161-00000008lHW-3trD;
	Fri, 27 Feb 2026 16:53:45 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw15z-00000008lGt-0dqa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 16:53:44 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fMvXV3bTQzJ469d;
	Sat, 28 Feb 2026 00:53:14 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 48E0D40572;
	Sat, 28 Feb 2026 00:53:41 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Feb
 2026 16:53:40 +0000
Date: Fri, 27 Feb 2026 16:53:39 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <sudeep.holla@arm.com>,
	<philip.radford@arm.com>, <james.quinlan@broadcom.com>,
	<f.fainelli@gmail.com>, <vincent.guittot@linaro.org>,
	<etienne.carriere@foss.st.com>, <peng.fan@oss.nxp.com>,
	<michal.simek@amd.com>, <dan.carpenter@linaro.org>,
	<geert+renesas@glider.be>, <kuninori.morimoto.gx@renesas.com>,
	<marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH 10/11] firmware: arm_scmi: Use bound iterators to
 minimize discovered rates
Message-ID: <20260227165339.000023f7@huawei.com>
In-Reply-To: <20260227153225.2778358-11-cristian.marussi@arm.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
	<20260227153225.2778358-11-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_085343_342053_605BDCA6 
X-CRM114-Status: GOOD (  12.57  )
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

On Fri, 27 Feb 2026 15:32:24 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Clock rates are guaranteed to be returned in ascending order for SCMI clock
> protocol versions greater than 1.0: in such a case, use bounded iterators
> to minimize the number of message exchanges needed to discover min and max
> rate.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> +
> +static int
> +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> +			      u32 clk_id, struct clock_info *cinfo)
> +{
> +	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> +	int ret;
> +
> +	/*
> +	 * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> +	 * be discovered in ascending order, lazy enumeration cannot be use for
> +	 * SCMI Clock v1.0 protocol.
> +	 */
> +	if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> +		ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> +	else
> +		ret = scmi_clock_describe_rates_get_full(ph, clkd);
> +
> +	if (ret)
> +		return ret;
> +
> +	clkd->info.min_rate = clkd->rates[RATE_MIN];
>  	if (!clkd->rate_discrete) {
>  		clkd->info.max_rate = clkd->rates[RATE_MAX];
>  		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
>  			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
>  			clkd->rates[RATE_STEP]);
>  	} else {
> -		sort(clkd->rates, clkd->num_rates,
> -		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
>  		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> +		dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> +			clkd->info.name, clkd->rate_discrete,
> +			clkd->info.min_rate, clkd->info.max_rate);
>  	}
> -	clkd->info.min_rate = clkd->rates[RATE_MIN];
>  
> -	return 0;
> +	return ret;
Why?  Far as I can see it's still always zero if you get here.

>  }
>  
>  static int


