Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEF9C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 06:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3mbucpkgZ2WSwKMpm4B16Ym8Ab1VlTN9p2Q5t/6Cx0=; b=oqO1yTWNr+P+El6SSC0rd5Myl1
	t9urqvB6k4bO37TvC39dgdMK0wGEtKLKW+ZhkR4CDubcOStSLjhYcVt7P7F2ZuRS+BmAC4nnPnbug
	syQBTvtd7DgFz5IRDsf1MZwk+MVgJ3MG+kNkEjBCNj49a6fk+cWcuqTbPICUoMnu6HGRDZe/y/tcC
	x9qXHkDI4m7iDIExGJWpz6ojRPxKpwv4UigOFuqwaYplnjg+IeWB8D/ZJDd3LXlFJ3PM9mhbCx4wH
	VYHf7Y8WkIGGnJ31CX4UJLMWWLlN8onceizqvbjGd+wPu3oLS95jPMGYiiUS7YQcNO7HHJkkHQIJa
	mHxvrllA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAk59-000000010Iv-3Egh;
	Fri, 02 May 2025 06:41:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAk3D-000000010AE-0jA8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 06:39:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CD9C106F;
	Thu,  1 May 2025 23:38:55 -0700 (PDT)
Received: from [10.163.80.122] (unknown [10.163.80.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20E023F66E;
	Thu,  1 May 2025 23:38:58 -0700 (PDT)
Message-ID: <063577a4-1530-4658-9838-934b0606e8e0@arm.com>
Date: Fri, 2 May 2025 12:08:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] coresight: Avoid enable programming clock
 duplicately
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-7-leo.yan@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250423151726.372561-7-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_233911_261797_0457E661 
X-CRM114-Status: GOOD (  20.24  )
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

On 4/23/25 20:47, Leo Yan wrote:
> The programming clock is enabled by AMBA bus driver before a dynamic
> probe.  As a result, a CoreSight driver may redundantly enable the same
> clock.

Are you sure AMBA bus driver always enables such clocks in all scenarios ?
Even if that is true - why cannot coresight_get_enable_apb_pclk() ensured
to be called only for the platform drivers cases via code re-organization,
rather than changing the coresight_get_enable_apb_pclk() helper itself.

> 
> To avoid this, add a check for device type and skip enabling the
> programming clock for AMBA devices.  The returned NULL pointer will be
> tolerated by the drivers.
> 
> Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  include/linux/coresight.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index b888f6ed59b2..26eb4a61b992 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -476,15 +476,18 @@ static inline bool is_coresight_device(void __iomem *base)
>   * Returns:
>   *
>   * clk   - Clock is found and enabled
> + * NULL  - Clock is not needed as it is managed by the AMBA bus driver
>   * ERROR - Clock is found but failed to enable
>   */
>  static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>  {
> -	struct clk *pclk;
> +	struct clk *pclk = NULL;
>  
> -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> -	if (IS_ERR(pclk))
> -		pclk = devm_clk_get_enabled(dev, "apb");
> +	if (!dev_is_amba(dev)) {
> +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> +		if (IS_ERR(pclk))
> +			pclk = devm_clk_get_enabled(dev, "apb");
> +	}
>  
>  	return pclk;
>  }

