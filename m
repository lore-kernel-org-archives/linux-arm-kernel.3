Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B89CDDE5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn+zF09KPNYa3iXtf4zTqB+9MiKB/XGy0KKTzUMaa8M=; b=5ClGW9zqlQALLWvm+SO4WNQAzV
	QTZoGfmsJVYGMw53m8SzmPY4gO2vXBTzQGH3yHK9vjm9OhsqabrTKNKzuQEsXDmLaziOdb+nCEWd4
	giuN+7jIl0RF+34PtSfLRsOdPMk1K+o1nNn7gBwtdd/CCCc7dFBu7ueXH+VWQXdeaj5kaVTp9uAjx
	YupR3aBifrp3ZEEUcMKu/JVwSSp+7HIj2LNBYCeCSRznGfY971V580P5JBc6LRdrujpuMSJEqNx+w
	cfzeY3OdJ9VAftdKN/hFRI6Ja6o4Nq9e52lHujZdMYRfg9XxNMTUTdbrmEKKbhRyLSep5Y8aqFJMo
	GozSGPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YgG-0000000E0I2-1SGc;
	Wed, 23 Oct 2024 10:33:32 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YVp-0000000Dy8z-20Sl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:22:47 +0000
Message-ID: <3fe8183a-08d3-47d3-b1a1-0d84f7bf58b7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729678960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bn+zF09KPNYa3iXtf4zTqB+9MiKB/XGy0KKTzUMaa8M=;
	b=POCLNRf+fxsROF6+a4fgY3UQqUVnbn0P73g/39VpVcNVfPXWKpOaFFgJbCJ09td4dWQujb
	1PdGR2v7QmYvwFOr+jhWtpG/o+n8q38oyakHvAQJUX3J/piYXxeKL2HnIcsVpBCMIzaf53
	PGo1gPjySqNn8jxyt79IeprT7Vhs5AI=
Date: Wed, 23 Oct 2024 11:22:36 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net] net: ti: iccsg-prueth: Fix 1 PPS sync
To: Meghana Malladi <m-malladi@ti.com>, vigneshr@ti.com, horms@kernel.org,
 jan.kiszka@siemens.com, diogo.ivo@siemens.com, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
References: <20241023091213.593351-1-m-malladi@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20241023091213.593351-1-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_032246_073408_B270D879 
X-CRM114-Status: GOOD (  18.65  )
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

On 23/10/2024 10:12, Meghana Malladi wrote:
> The first PPS latch time needs to be calculated by the driver
> (in rounded off seconds) and configured as the start time
> offset for the cycle. After synchronizing two PTP clocks
> running as master/slave, missing this would cause master
> and slave to start immediately with some milliseconds
> drift which causes the PPS signal to never synchronize with
> the PTP master.
> 
> Fixes: 186734c15886 ("net: ti: icssg-prueth: add packet timestamping and ptp support")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
>   drivers/net/ethernet/ti/icssg/icssg_prueth.c | 12 ++++++++++--
>   drivers/net/ethernet/ti/icssg/icssg_prueth.h | 11 +++++++++++
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 0556910938fa..6b2cd7c898d0 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -411,6 +411,8 @@ static int prueth_perout_enable(void *clockops_data,
>   	struct prueth_emac *emac = clockops_data;
>   	u32 reduction_factor = 0, offset = 0;
>   	struct timespec64 ts;
> +	u64 current_cycle;
> +	u64 start_offset;
>   	u64 ns_period;
>   
>   	if (!on)
> @@ -449,8 +451,14 @@ static int prueth_perout_enable(void *clockops_data,
>   	writel(reduction_factor, emac->prueth->shram.va +
>   		TIMESYNC_FW_WC_SYNCOUT_REDUCTION_FACTOR_OFFSET);
>   
> -	writel(0, emac->prueth->shram.va +
> -		TIMESYNC_FW_WC_SYNCOUT_START_TIME_CYCLECOUNT_OFFSET);
> +	current_cycle = icssg_readq(emac->prueth->shram.va +
> +				    TIMESYNC_FW_WC_CYCLECOUNT_OFFSET);
> +
> +	/* Rounding of current_cycle count to next second */
> +	start_offset = ((current_cycle / MSEC_PER_SEC) + 1) * MSEC_PER_SEC;

This looks more like roundup(current_cycle, MSEC_PER_SEC), let's use it
instead of open coding.

> +
> +	icssg_writeq(start_offset, emac->prueth->shram.va +
> +		     TIMESYNC_FW_WC_SYNCOUT_START_TIME_CYCLECOUNT_OFFSET);
>   
>   	return 0;
>   }
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> index 8722bb4a268a..a4af2dbcca31 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> @@ -330,6 +330,17 @@ static inline int prueth_emac_slice(struct prueth_emac *emac)
>   extern const struct ethtool_ops icssg_ethtool_ops;
>   extern const struct dev_pm_ops prueth_dev_pm_ops;
>   
> +static inline u64 icssg_readq(const void __iomem *addr)
> +{
> +	return readl(addr) + ((u64)readl(addr + 4) << 32);
> +}
> +
> +static inline void icssg_writeq(u64 val, void __iomem *addr)
> +{
> +	writel(lower_32_bits(val), addr);
> +	writel(upper_32_bits(val), addr + 4);
> +}
> +
>   /* Classifier helpers */
>   void icssg_class_set_mac_addr(struct regmap *miig_rt, int slice, u8 *mac);
>   void icssg_class_set_host_mac_addr(struct regmap *miig_rt, const u8 *mac);
> 
> base-commit: 73840ca5ef361f143b89edd5368a1aa8c2979241


