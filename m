Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1BECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+nD8HNdH2N+reg5mrRLQzAfdOKRWqLsO8iNzTlmxnQ=; b=QSmImSOrh/6+FFcODng9LOMRC8
	VYZG+ond3sZHfzjukP8gTb2LiNPxN3oIE8ymrfYnDoUVjpC5h5oczk8qTkdIOCp57siBtV4DE+JfS
	dLbdcrMTc5PLHRFJj83/L+PAysqLAji4M/jE3Suwk68DtzCzKRr7VRsFfPM1bhTflM/w6bTuU5BMj
	JWq+o2k7zQh41TclZS/L7LZfC0aWssJlParEowo00yDDNf8lHd2VetpPDle8zdl5X1rs3EhQryZo1
	Lh+m4wHs6yaIfFnjrw7NJRNdVR9VSTvcCt20Lm9lcP4B9vXqPmB/0j+owEHmoupEj6xd/IyVJTkNe
	RCqH7kMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5ihs-0000000HPFO-3I5w;
	Mon, 06 Oct 2025 10:44:40 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5ihq-0000000HPEc-1xEk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 10:44:39 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596AiRjL3592281;
	Mon, 6 Oct 2025 05:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759747467;
	bh=u+nD8HNdH2N+reg5mrRLQzAfdOKRWqLsO8iNzTlmxnQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WPsqXsmussjX3OTMl3+oHxR69jmbAHzCOAQ341/cEYsYNxaESt89YrtV5ifBkvLvH
	 IbMl+HayyTp+R766+HNOJcK312cSKKWiwqke0pfj+QXO4crgNII7Zvcvy6K1JEkwSl
	 yrIpinh8OfxXnAo5sd67x52c3D3ftIq+bk2wOp0k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596AiRYl3250715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 6 Oct 2025 05:44:27 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 05:44:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 05:44:26 -0500
Received: from [172.24.233.14] (shark.dhcp.ti.com [172.24.233.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596AiL6x3546968;
	Mon, 6 Oct 2025 05:44:22 -0500
Message-ID: <98d588bd-7b46-4df4-b31c-2bb53a47c279@ti.com>
Date: Mon, 6 Oct 2025 16:14:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] clk: conf: Support assigned-clock-sscs
To: Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Marco Felsch
	<m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Brian Masney
	<bmasney@redhat.com>,
        Dhruva Gole <d-gole@ti.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>,
        Geert Uytterhoeven
	<geert@linux-m68k.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <20250915-clk-ssc-version1-v4-3-5a2cee2f0351@nxp.com>
Content-Language: en-US
From: Sebin Francis <sebin.francis@ti.com>
In-Reply-To: <20250915-clk-ssc-version1-v4-3-5a2cee2f0351@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_034438_603444_AE744E94 
X-CRM114-Status: GOOD (  23.49  )
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

Hi Peng,

On 15/09/25 13:59, Peng Fan wrote:
> Parse the Spread Spectrum Configuration(SSC) from device tree and configure
> them before using the clock.
> 
> Each SSC is three u32 elements which means '<modfreq spreaddepth
> modmethod>', so assigned-clock-sscs is an array of multiple three u32
> elements.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/clk/clk-conf.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..dd6083597db3f8f27d86abf5640dfc3fb39a9b88 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -155,6 +155,71 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
>   	return 0;
>   }
>   
> +static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
> +{
> +	struct clk_spread_spectrum *sscs __free(kfree) = NULL;
> +	u32 elem_size = sizeof(struct clk_spread_spectrum);
> +	struct of_phandle_args clkspec;
> +	int rc, count, index;
> +	struct clk *clk;
> +
> +	/* modfreq, spreadPercent, modmethod */
> +	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
> +	if (count <= 0)
> +		return 0;
> +
> +	sscs = kcalloc(count, elem_size, GFP_KERNEL);
> +	if (!sscs)
> +		return -ENOMEM;
> +
> +	rc = of_property_read_u32_array(node, "assigned-clock-sscs", (u32 *)sscs,
> +					count * 3);
> +	if (rc)
> +		return rc;
> +
> +	for (index = 0; index < count; index++) {
> +		struct clk_spread_spectrum *conf = &sscs[index];
> +		struct clk_hw *hw;
> +
> +		if (!conf->modfreq_hz && !conf->spread_bp && !conf->method)
> +			continue;
> +
> +		rc = of_parse_phandle_with_args(node, "assigned-clocks", "#clock-cells",
> +						index, &clkspec);
> +		if (rc < 0) {
> +			/* skip empty (null) phandles */
> +			if (rc == -ENOENT)
> +				continue;
> +			else
> +				return rc;
> +		}
> +
> +		if (clkspec.np == node && !clk_supplier) {
> +			of_node_put(clkspec.np);
> +			return 0;
> +		}
> +
> +		clk = of_clk_get_from_provider(&clkspec);
> +		of_node_put(clkspec.np);
> +		if (IS_ERR(clk)) {
> +			if (PTR_ERR(clk) != -EPROBE_DEFER)
> +				pr_warn("clk: couldn't get clock %d for %pOF\n",
> +					index, node);
> +			return PTR_ERR(clk);
> +		}
> +
> +		hw = __clk_get_hw(clk);
> +		rc = clk_hw_set_spread_spectrum(hw, conf);
> +		if (rc < 0)
> +			pr_err("clk: couldn't set %s clk spread spectrum %u %u %u: %d\n",
> +			       __clk_get_name(clk), conf->modfreq_hz, conf->spread_bp,
> +			       conf->method, rc);
> +		clk_put(clk);
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * of_clk_set_defaults() - parse and set assigned clocks configuration
>    * @node: device node to apply clock settings for
> @@ -174,6 +239,10 @@ int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
>   	if (!node)
>   		return 0;
>   
> +	rc = __set_clk_spread_spectrum(node, clk_supplier);
> +	if (rc < 0)
> +		return rc;
> +
>   	rc = __set_clk_parents(node, clk_supplier);
>   	if (rc < 0)
>   		return rc;
> 

Here you are setting the clock's ssc before the setting the parent and 
rate, is it possible to move it below setting of parent and rate? 
because the ssc is enabled after the parent and rate is set to a clock.

Thanks
Sebin

