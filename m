Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680C2CDDE6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IB3mGWP/MB/mhIwDnna/Ib8F4OMAAgNQRJozpZxR3gU=; b=KryA8EeRLn40Z/zuzQwFNQRMTN
	xP+S95umJ0Olk6G4xmzNcFcyORjMEm6Da6Kzbug/PkMo8UokJ8w1K9VzzD82jfr3JGHLOnQdKmNEm
	sG5T13X3y8Zlt77gAuGV4e0803l6zYiNQKiKuBotFKdEpgVR6rt4OSrSNYOJz2Yslln85sTE2RPYP
	pdar1FVSjT98jNsuERrWXxAjhOx064mOUllYstF1kJPHSt+Pw0UE4eHiqLk3rN9TdIxTdv5rVFFZm
	/CXFGfgUXAFzeKkaxU/fWlnyXKqVcSDONSTxMqzkLbBgOTYh7T+oxer2sKR6bqSlMSFscOdy1p20f
	yb1dFPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zqp-0000000EDRh-3a3T;
	Wed, 23 Oct 2024 11:48:31 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zh6-0000000EA7d-2MiG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:38:30 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NBcDAx013929;
	Wed, 23 Oct 2024 06:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729683493;
	bh=IB3mGWP/MB/mhIwDnna/Ib8F4OMAAgNQRJozpZxR3gU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=L5XJ12654bbqzmEM0U+Yabb+VykPEYVA+YOOi9rbTRsw/kKMNMHa0q0eX+A7EDO4Y
	 vLkibs1wMmzaYeajgLpnI3IQnmiWjty0hKtBU5nnNqUmwQzk9jvmVvHoRQ/yZsc5Di
	 9JckUmFE2WCUqtlswjTLGZEOGhkXU5PmEmstoovI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NBcDfQ028124
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 06:38:13 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 06:38:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 06:38:12 -0500
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NBc8B6071380;
	Wed, 23 Oct 2024 06:38:08 -0500
Message-ID: <4c529e08-084c-43b3-ba70-982ba2555b5b@ti.com>
Date: Wed, 23 Oct 2024 17:08:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ti: iccsg-prueth: Fix 1 PPS sync
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>, <vigneshr@ti.com>,
        <horms@kernel.org>, <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
References: <20241023091213.593351-1-m-malladi@ti.com>
 <3fe8183a-08d3-47d3-b1a1-0d84f7bf58b7@linux.dev>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <3fe8183a-08d3-47d3-b1a1-0d84f7bf58b7@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_043828_732117_D68932C9 
X-CRM114-Status: GOOD (  15.46  )
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



On 23/10/24 15:52, Vadim Fedorenko wrote:


> On 23/10/2024 10:12, Meghana Malladi wrote:
>> The first PPS latch time needs to be calculated by the driver
>> (in rounded off seconds) and configured as the start time
>> offset for the cycle. After synchronizing two PTP clocks
>> running as master/slave, missing this would cause master
>> and slave to start immediately with some milliseconds
>> drift which causes the PPS signal to never synchronize with
>> the PTP master.
>> 
>> Fixes: 186734c15886 ("net: ti: icssg-prueth: add packet timestamping and ptp support")
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> ---
>>   drivers/net/ethernet/ti/icssg/icssg_prueth.c | 12 ++++++++++--
>>   drivers/net/ethernet/ti/icssg/icssg_prueth.h | 11 +++++++++++
>>   2 files changed, 21 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> index 0556910938fa..6b2cd7c898d0 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> @@ -411,6 +411,8 @@ static int prueth_perout_enable(void *clockops_data,
>>   	struct prueth_emac *emac = clockops_data;
>>   	u32 reduction_factor = 0, offset = 0;
>>   	struct timespec64 ts;
>> +	u64 current_cycle;
>> +	u64 start_offset;
>>   	u64 ns_period;
>>   
>>   	if (!on)
>> @@ -449,8 +451,14 @@ static int prueth_perout_enable(void *clockops_data,
>>   	writel(reduction_factor, emac->prueth->shram.va +
>>   		TIMESYNC_FW_WC_SYNCOUT_REDUCTION_FACTOR_OFFSET);
>>   
>> -	writel(0, emac->prueth->shram.va +
>> -		TIMESYNC_FW_WC_SYNCOUT_START_TIME_CYCLECOUNT_OFFSET);
>> +	current_cycle = icssg_readq(emac->prueth->shram.va +
>> +				    TIMESYNC_FW_WC_CYCLECOUNT_OFFSET);
>> +
>> +	/* Rounding of current_cycle count to next second */
>> +	start_offset = ((current_cycle / MSEC_PER_SEC) + 1) * MSEC_PER_SEC;
> 
> This looks more like roundup(current_cycle, MSEC_PER_SEC), let's use it
> instead of open coding.
> 

Ok sure, I will update it.

>> +
>> +	icssg_writeq(start_offset, emac->prueth->shram.va +
>> +		     TIMESYNC_FW_WC_SYNCOUT_START_TIME_CYCLECOUNT_OFFSET);
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>> index 8722bb4a268a..a4af2dbcca31 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
>> @@ -330,6 +330,17 @@ static inline int prueth_emac_slice(struct prueth_emac *emac)
>>   extern const struct ethtool_ops icssg_ethtool_ops;
>>   extern const struct dev_pm_ops prueth_dev_pm_ops;
>>   
>> +static inline u64 icssg_readq(const void __iomem *addr)
>> +{
>> +	return readl(addr) + ((u64)readl(addr + 4) << 32);
>> +}
>> +
>> +static inline void icssg_writeq(u64 val, void __iomem *addr)
>> +{
>> +	writel(lower_32_bits(val), addr);
>> +	writel(upper_32_bits(val), addr + 4);
>> +}
>> +
>>   /* Classifier helpers */
>>   void icssg_class_set_mac_addr(struct regmap *miig_rt, int slice, u8 *mac);
>>   void icssg_class_set_host_mac_addr(struct regmap *miig_rt, const u8 *mac);
>> 
>> base-commit: 73840ca5ef361f143b89edd5368a1aa8c2979241
> 

