Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFD2C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 18:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hXM8A7V/a3cE/S/AtuHx4Z34y9zL9Es5qhioYJDJsU=; b=gsQRBcYZB/UnwO5U1QQhgffa1F
	G+5urAKy/a29DHDIqLVvY2MUKmps4MfyR7b5veEL8/5i480hMRMBlX6WYjuz7+z+HD1yHq+9DXSGh
	DLi+5VzzIL55BWMO8vWTJKffoTbAcpDjPdDpjpYMWlyqYYJoQ9GztXI0vNjup5lgsBU0a+ziehDaR
	KCdV4rIScGhdnktJijiguTSgKmItCKemZzZu8XRxUFDNdUs1pIw2ncyItZu50kjIgAE3QzCSvVU/s
	3IIu2fKTEJ86b+FdTTor88o3xDfxotXOECkjTiPR526Xikr8NHlDWOYdghjKK+/1lL8FqnK/UyqT6
	RS9DsumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOh0W-00000004sZq-1sqN;
	Mon, 09 Jun 2025 18:14:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfpV-00000004k51-1I0b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:58:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFE57150C;
	Mon,  9 Jun 2025 09:58:17 -0700 (PDT)
Received: from [10.57.48.120] (unknown [10.57.48.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CECCD3F66E;
	Mon,  9 Jun 2025 09:58:34 -0700 (PDT)
Message-ID: <b30fc361-a04f-4a48-b8e2-f7c2da213e6c@arm.com>
Date: Mon, 9 Jun 2025 17:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_095837_390434_FBCC0A14 
X-CRM114-Status: GOOD (  19.87  )
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

On 09/06/2025 17:00, Leo Yan wrote:
> The programming clock is enabled by AMBA bus driver before a dynamic
> probe.  As a result, a CoreSight driver may redundantly enable the same
> clock.
> 
> To avoid this, add a check for device type and skip enabling the
> programming clock for AMBA devices.  The returned NULL pointer will be
> tolerated by the drivers.
> 
> Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   include/linux/coresight.h | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index dd2b4cc7a2b70cf060a3207548fe80e3824c489f..9afa1f76c78a3347e54d94fe9a9ebed72e3fff8e 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -480,15 +480,18 @@ static inline bool is_coresight_device(void __iomem *base)
>    * Returns:
>    *
>    * clk   - Clock is found and enabled
> + * NULL  - Clock is not needed as it is managed by the AMBA bus driver
>    * ERROR - Clock is found but failed to enable
>    */
>   static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>   {
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

AMBA driver doesn't handle "apb" clock ? So we may need to retain that 
here ?

Otherwise looks good to me.

Suzuki
> +	}
>   
>   	return pclk;
>   }
> 


