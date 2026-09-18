Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED961C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMOZG7gif+EF/8M3ypTK1YC5Ub5fNhpmWB1EicVP+4Y=; b=JSszqw+plynG6LsHnpJkO7ujG/
	oL12zAiVIxuR18WFkolkr+VLO0cXUG7/hNOcCxpLwocpb9bPzVf0L7BjScBYEspWBoFybLQSVlqa/
	A3MoQR68IJCS8ocFd+gSKjCCtqiyY+nzHLYTBDceMgJxWEndsQuSOwkpXgCJLXqyQ+i1VYixWBxYj
	pK7+REh3lxsog+u0u1wCJ0Yo8pDEKiWkndvxyQZ11EDIdrOmMK6nxWsyXNhlEUrUNeVKECWcz1vEB
	y4Setfx6B9vaGewrwQBTTfbM6z5gdKuGDHRHZbZSty/62fXD/yjpe8e5jdbr7PaTKY2bqmql2ScJr
	t4+zw5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TCP-0000000DimX-139b;
	Fri, 18 Sep 2026 07:39:57 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TCM-0000000Dilm-0xmi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789717194; x=1821253194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9HjgM9JbkGt1A3yefJhN4x6xA3Vg7LoR3hGeySb0Qow=;
  b=dNfn1UBufMKQlEjpF0j1t6LpXedNrYAqk/JJPjSpd2E2gqpPcP/atI2t
   7fUiS+zTk9R6o4oVcroOgAoW0o2cPBvJuL5mEllIoUGnMWgwm+L6zI8jZ
   9PgEhozcX1oGurxrv8J2VWIJgtDxYyF9pZ7Ph3LwsBxOqTJq9Q1Q3nm9X
   3zW4mYAAB1Hcc7LzZsu5wlG8DqLGvhSM/bWAdfeqMOnyCKuLZ3X6VXFcQ
   1bqW1HidS45YmKsgAwpEkNVNACfhNlk2l6akt3PEqPbe7wXRDblzlTeJH
   GrKR6scgYe74zMJ5Rs7Kl5YWAsjnqawxRkxN57eWZAoMXgF14OylLLwpc
   w==;
X-CSE-ConnectionGUID: gWrJ/8KFRKeUhhnthFhGiw==
X-CSE-MsgGUID: J6es9zoNQ+C2jvV/x1uIow==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89340116"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89340116"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:39:52 -0700
X-CSE-ConnectionGUID: EQSigIixQTGHBye9zTlPZA==
X-CSE-MsgGUID: SCwZTKvvQfmatyBz20cYNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297731196"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:39:47 -0700
Date: Fri, 18 Sep 2026 10:39:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wentao Liang <vulab@iscas.ac.cn>, Miaoqian Lin <linmq006@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pmdomain: imx: gpc: remove all initialized power domains
Message-ID: <aqzqvfbeh653jUce@ashevche-desk.local>
References: <20260918031323.3376849-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918031323.3376849-1-lgs201920130244@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_003954_279989_1CFFEDF7 
X-CRM114-Status: GOOD (  17.20  )
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

On Fri, Sep 18, 2026 at 11:13:22AM +0800, Guangshuo Li wrote:
> imx_gpc_old_dt_init() initializes all power domains described by
> of_id_data->num_domains. Its probe failure path removes all of these
> domains, but imx_gpc_remove() only removes the PU and ARM domains.
> 
> On SoCs with more than two domains, such as i.MX6SL and i.MX6SX, the
> additional DISPLAY and PCI generic power domains can remain registered
> after the GPC driver is removed.
> 
> Remove all initialized power domains in reverse order. Keep releasing
> the PU clocks immediately after the PU domain has been successfully
> removed.
> 
> This issue was found by manual code inspection.

...

>  static void imx_gpc_remove(struct platform_device *pdev)
>  {
> +	const struct imx_gpc_dt_data *of_id_data =
> +		device_get_match_data(&pdev->dev);

No...

>  	struct device_node *pgc_node;
> -	int ret;
> +	int i, ret;

...and no.

The result of the device_get_match_data() better to be checked, in some cases
it might lead to NULL dereference.

It's better to split semantically different variables, also naming 'i' is not
good, num_domains is better. Besides that, why is it signed?

...

> +		for (i = of_id_data->num_domains - 1; i >= 0; i--) {

What you are doing here can be written in a shorter form

		num_domains = of_id_data->num_domains;
		while (num_domains--) {

> +			ret = pm_genpd_remove(&imx_gpc_domains[i].base);
> +			if (ret) {
> +				dev_err(&pdev->dev,
> +					"Failed to remove %s power domain (%pe)\n",
> +					imx_gpc_domains[i].base.name,
> +					ERR_PTR(ret));
> +				return;
> +			}
>  
> +			if (i == GPC_PGC_DOMAIN_PU)
> +				imx_pgc_put_clocks(&imx_gpc_domains[i]);
>  		}

-- 
With Best Regards,
Andy Shevchenko



