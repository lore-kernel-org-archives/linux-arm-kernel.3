Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF984C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJq56dJU39DFehvtgnhOtq4RDHwyEOqLxQdWadwXTOY=; b=RK1oTWbbOypoorKA9S3/cAfCQq
	WBbSBxPzPVXSupxp5p7WKmWkH4sdDZgu2tgK7TnRYL1cAp+GCSkNaEnI3pd4EwMItPSEQYGZJV78N
	HGBzYHmdjJRuYPFhvMNFdlYpYytLrnnRfNbtQCN7dfLnx3JfnN4O8GvLx0wPuH0jjQsguwLA+TOdc
	XPzvUeo1VJxyLSrcq5Prd+Sakx/JkGWMachlokaqao77aWMp7n1N9xEZRCT58hpFULWYDAOpJaMrX
	4/Iq8sSIwuIlGjArEiS2J/zLBFcxVROvgIVLWlGstNaMk6m6YTuaJRokrdR3od/Yu569p9Ij9sEq3
	1Qvr9Xlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsScn-00000009QA0-0QwW;
	Wed, 12 Mar 2025 20:24:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsSaC-00000009Pyz-0zh7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 20:21:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2ECD3A471C0;
	Wed, 12 Mar 2025 20:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86521C4CEDD;
	Wed, 12 Mar 2025 20:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741810898;
	bh=eZn3M9mlWfZG7ziWvPoqQ68DoQzsS5rAy2tHFPgSILA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwW7OVW36sV8XQpcekGwjWUAKZLABPhGuMylzhTZiktBd3awgZ8au4CoUwbL4uSeh
	 877BnH6qV+pN6RN6/86qYDdHcnDBMWCyNnzejm4Kw3wUmVY/M2BUmxwP8LRzLATHJO
	 Y+bD5YmoJc6/EdLNIq3s73S3xeGTdKq8ujVFjOUqJ2OIQGHxJC0MfIaxMU6w7w9MqU
	 1KAMC7c7VCOI23sJ54sOfcYN/iEqOGfFwKFdPkuQHF3cmPWynJzZj7GS3TpWfTvZuF
	 EnRmUWGp+LZAD1W2d/7xLQramMsP23g4Kqa2CCMqlCSzKCnA25vwN4tjElVTw3/ssh
	 VFuKlz/yTi6Hg==
Date: Wed, 12 Mar 2025 21:21:32 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: patrick@stwcx.xyz, andrew@codeconstruct.com.au, linux@roeck-us.net,
	wim@linux-watchdog.org, joel@jms.id.au,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Peter.Yin@quantatw.com,
	Patrick_NC_Lin@wiwynn.com, BMC-SW@aspeedtech.com,
	chnguyen@amperecomputing.com, aaron_lee@aspeedtech.com
Subject: Re: [PATCH v7 1/1] watchdog: aspeed: Update bootstatus handling
Message-ID: <20250312202132.GA1072616@ax162>
References: <20250113093737.845097-1-chin-ting_kuo@aspeedtech.com>
 <20250113093737.845097-2-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113093737.845097-2-chin-ting_kuo@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_132140_409209_C47A0D88 
X-CRM114-Status: GOOD (  21.22  )
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

On Mon, Jan 13, 2025 at 05:37:37PM +0800, Chin-Ting Kuo wrote:
> The boot status in the watchdog device struct is updated during
> controller probe stage. Application layer can get the boot status
> through the command, cat /sys/class/watchdog/watchdogX/bootstatus.
> The bootstatus can be,
> WDIOF_CARDRESET => System is reset due to WDT timeout occurs.
> Others          => Other reset events, e.g., power on reset.
> 
> On ASPEED platforms, boot status is recorded in the SCU registers.
> - AST2400: Only a bit is used to represent system reset triggered by
>            any WDT controller.
> - AST2500/AST2600: System reset triggered by different WDT controllers
>                    can be distinguished by different SCU bits.
> 
> Besides, on AST2400 and AST2500, since alternating boot event is
> also triggered by using WDT timeout mechanism, it is classified
> as WDIOF_CARDRESET.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 81 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
...
> +static void aspeed_wdt_update_bootstatus(struct platform_device *pdev,
> +					 struct aspeed_wdt *wdt)
> +{
> +	const struct resource *res;
> +	struct aspeed_wdt_scu scu = wdt->cfg->scu;
> +	struct regmap *scu_base;
> +	u32 reset_mask_width;
> +	u32 reset_mask_shift;
> +	u32 idx = 0;
> +	u32 status;
> +	int ret;
> +
> +	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);

This division breaks the build when CONFIG_ARM_LPAE is enabled, which
selects CONFIG_PHYS_ADDR_T_64BIT, turning resource_size_t into a 64-bit
type.

$ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- mrproper multi_v7_lpae_defconfig all
arm-linux-gnueabi-ld: drivers/watchdog/aspeed_wdt.o: in function `aspeed_wdt_update_bootstatus':
drivers/watchdog/aspeed_wdt.c:257:(.text+0x80c): undefined reference to `__aeabi_uldivmod'

> +	}
> +
> +	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
> +	if (IS_ERR(scu_base)) {
> +		wdt->wdd.bootstatus = WDIOS_UNKNOWN;
> +		return;
> +	}
> +
> +	ret = regmap_read(scu_base, scu.reset_status_reg, &status);
> +	if (ret) {
> +		wdt->wdd.bootstatus = WDIOS_UNKNOWN;
> +		return;
> +	}
> +
> +	reset_mask_width = hweight32(scu.wdt_reset_mask);
> +	reset_mask_shift = scu.wdt_reset_mask_shift +
> +			   reset_mask_width * idx;
> +
> +	if (status & (scu.wdt_reset_mask << reset_mask_shift))
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +	/* clear wdt reset event flag */
> +	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt") ||
> +	    of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2500-wdt")) {
> +		ret = regmap_read(scu_base, scu.reset_status_reg, &status);
> +		if (!ret) {
> +			status &= ~(scu.wdt_reset_mask << reset_mask_shift);
> +			regmap_write(scu_base, scu.reset_status_reg, status);
> +		}
> +	} else {
> +		regmap_write(scu_base, scu.reset_status_reg,
> +			     scu.wdt_reset_mask << reset_mask_shift);
> +	}
> +}
> +

Cheers,
Nathan

