Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014A7CE8E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYx7LAyRV3Ucr0XiBCFOAYtv8t2YgLt+/TvO8hjpNtU=; b=UFY2E/K+8mdgTM2s84Ihwa1gIz
	CyrRghwxLENTZ7NAOkyTOc7LEFhNBxxc+wD+Cwe7//RyeG876IU6f7CvsU7+oHIkRV+hej4b0OvJF
	+I1lZgKOZdcpzHbTmodmdkS1UE7h0h2RxHLvFlMbQIXqtbnaszoimsjipjrItkHARpL3qVigj6r5c
	szTUlwCwEMQRZw55459FniJyIB748JiVEcQxbZurjmHuqSvc987gD45qUFiTw/7BdGU3cHT3BxmUy
	crArjVJ6yDrXE93xrRpd0FCIfYWgPEjC5S31uuy27d29Tpixa1CzdLV9/dpO44nQwzgBb0A1C2nk6
	k1/IzS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xjD-00000000TCT-0nPE;
	Thu, 24 Oct 2024 13:18:15 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xhe-00000000SoS-156y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:16:39 +0000
Message-ID: <ff454a9b-5e60-49cb-8590-a2535f851057@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729775795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYx7LAyRV3Ucr0XiBCFOAYtv8t2YgLt+/TvO8hjpNtU=;
	b=IJI5zCBmkMWuSlAC6vNeUKZ/x0HqRyeKkaCRuPkB1OLmXKmyDkre5tUfruHXq1gNMlp7sa
	wAdbkUxXhNgkeBwbbk+ggdjpGjJOe2qPZyFLhIyXnkhY27YXJQ7do5bCWB6f2s/fnsAEEL
	1qpWsIUKTCgqoyPDfwoaovUS3LL604M=
Date: Thu, 24 Oct 2024 14:16:30 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix 1 PPS sync
To: Meghana Malladi <m-malladi@ti.com>, vigneshr@ti.com, horms@kernel.org,
 jan.kiszka@siemens.com, diogo.ivo@siemens.com, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
References: <20241024113140.973928-1-m-malladi@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20241024113140.973928-1-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_061638_485916_EC2B12F1 
X-CRM114-Status: GOOD (  19.59  )
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

On 24/10/2024 12:31, Meghana Malladi wrote:
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
> 
> Hello,
> 
> This patch is based on net-next tagged next-20241023.
> v1:https://lore.kernel.org/all/20241023091213.593351-1-m-malladi@ti.com/
> Changes since v1 (v2-v1):
> - Use roundup() instead of open coding as suggested by Vadim Fedorenko
> 
> Regards,
> Meghana.
> 
>   drivers/net/ethernet/ti/icssg/icssg_prueth.c | 12 ++++++++++--
>   drivers/net/ethernet/ti/icssg/icssg_prueth.h | 11 +++++++++++
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 0556910938fa..6876e8181066 100644
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
> +	start_offset = roundup(current_cycle, MSEC_PER_SEC);
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

Thanks,

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

