Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7783EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 10:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8AmUS6TNrYkLRwZxzaG8NF3Ct7s6HtxqfyDKxPFrLc=; b=wVubOZuwEKb175rHwD1+lMdGrk
	wPwjZUBX2Tdcl4BdIKHQUParosykRyQ70qi9SuqUgjLJ72J6pS+2pD+WBoSCMca+179RtTuvaYQFA
	fm7QwuSSA0bcR/hElqd1w6XlqYI007NsCTkCvnmt08oBqkeRjOPBopyvfxcKucoza1uFNOXg6nXr0
	JTqdNJsVxqjIgwEtnV+PW4RlB4/xyrvkftioNVqyeXEEOxHu8eOqE7CcPn+ecpEQI17DbCTi1kLSH
	t9e9bQcEEbITEoLeGq/0ySzLVjm8ojZ/70LV7hAC9mHnMGEr6+wCDYqs4xKo1SZu4apJeJegR4BlQ
	4YTmjHuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKE4V-0000000Cqsv-36A1;
	Wed, 28 May 2025 10:31:43 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKE2L-0000000Cqgs-0b26
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 10:29:31 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54SATMNi3236486;
	Wed, 28 May 2025 05:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748428162;
	bh=m8AmUS6TNrYkLRwZxzaG8NF3Ct7s6HtxqfyDKxPFrLc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=xLWfTKqKreLX83E7Sv7bJ60G/xqoWyLC028ZcbJwEzPTY9A76Glyl+04Mo3u9HbH1
	 fhFr4Ics7qmR+WKvc3GD3NzfP8/b04tuoFeKvVIaqXCTx6TYm1Wc656bquRb5CSVwS
	 29Mvkih+z9J4SHMT9dejzfRlcG3y6UKghjkSb89g=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54SATM8Q3369282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 28 May 2025 05:29:22 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 May 2025 05:29:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 May 2025 05:29:22 -0500
Received: from [172.24.30.41] (lt2k2yfk3.dhcp.ti.com [172.24.30.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54SATGi7013764;
	Wed, 28 May 2025 05:29:17 -0500
Message-ID: <110b1fb3-da88-4b38-babf-eb0e375100a6@ti.com>
Date: Wed, 28 May 2025 15:59:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drivers: dma: ti: Refactor TI K3 UDMA driver
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
        <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <praneeth@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <a-chavda@ti.com>
References: <20250428072032.946008-1-s-adivi@ti.com>
 <20250428072032.946008-4-s-adivi@ti.com>
 <e823a43e-20a8-4142-875f-a3575cbb0d0b@gmail.com>
Content-Language: en-US
From: "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>
In-Reply-To: <e823a43e-20a8-4142-875f-a3575cbb0d0b@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_032929_269274_8B3E4906 
X-CRM114-Status: GOOD (  20.37  )
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



On 5/9/2025 7:55 PM, Péter Ujfalusi wrote:
> Hi,
> 
> On 28/04/2025 10:20, Sai Sree Kartheek Adivi wrote:
>> Refactors and split the driver into common and device
>> specific parts. There are no functional changes.
>>
>> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>> ---
>>   drivers/dma/ti/Makefile         |    2 +-
>>   drivers/dma/ti/k3-udma-common.c | 2909 ++++++++++++++++++++++++
>>   drivers/dma/ti/k3-udma.c        | 3751 ++-----------------------------
> 
> I'm affraid you do need to break this one up a bit. It might be doing it
> correctly, but it is impossible to check with the churn, like ....
noted. I'm working on splitting this. Will post a v2.

> 
>>   drivers/dma/ti/k3-udma.h        |  548 ++++-
>>   4 files changed, 3700 insertions(+), 3510 deletions(-)
>>   create mode 100644 drivers/dma/ti/k3-udma-common.c
> 
> ...
> 
>> -static bool udma_is_chan_running(struct udma_chan *uc)
>> -{
>> -	u32 trt_ctl = 0;
>> -	u32 rrt_ctl = 0;
>> -
>> -	if (uc->tchan)
>> -		trt_ctl = udma_tchanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
>> -	if (uc->rchan)
>> -		rrt_ctl = udma_rchanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
>> -
>> -	if (trt_ctl & UDMA_CHAN_RT_CTL_EN || rrt_ctl & UDMA_CHAN_RT_CTL_EN)
>> -		return true;
>> -
>> -	return false;
>> -}
>> -
>>   static bool udma_is_chan_paused(struct udma_chan *uc)
>>   {
>>   	u32 val, pause_mask;
>> @@ -643,189 +88,73 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
>>   	return false;
>>   }
>>   
>> -static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
>> +static void udma_decrement_byte_counters(struct udma_chan *uc, u32 val)
> 
> 
> These sort of diffs.
> 
>>   {
>> -	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
>> +	if (uc->desc->dir == DMA_DEV_TO_MEM) {
>> +		udma_rchanrt_write(uc, UDMA_CHAN_RT_BCNT_REG, val);
>> +		udma_rchanrt_write(uc, UDMA_CHAN_RT_SBCNT_REG, val);
>> +		if (uc->config.ep_type != PSIL_EP_NATIVE)
>> +			udma_rchanrt_write(uc, UDMA_CHAN_RT_PEER_BCNT_REG, val);
>> +	} else {
>> +		udma_tchanrt_write(uc, UDMA_CHAN_RT_BCNT_REG, val);
>> +		udma_tchanrt_write(uc, UDMA_CHAN_RT_SBCNT_REG, val);
>> +		if (!uc->bchan && uc->config.ep_type != PSIL_EP_NATIVE)
>> +			udma_tchanrt_write(uc, UDMA_CHAN_RT_PEER_BCNT_REG, val);
>> +	}
>>   }
>>   
>> -static int udma_push_to_ring(struct udma_chan *uc, int idx)
>> +static void udma_reset_counters(struct udma_chan *uc)
>>   {
> 
> ...
> 
>> +struct udma_dev {
>> +	struct dma_device ddev;
>> +	struct device *dev;
>> +	void __iomem *mmrs[MMR_LAST];
>> +	const struct udma_match_data *match_data;
>> +	const struct udma_soc_data *soc_data;
>> +
>> +	struct udma_tpl bchan_tpl;
>> +	struct udma_tpl tchan_tpl;
>> +	struct udma_tpl rchan_tpl;
>> +
>> +	size_t desc_align; /* alignment to use for descriptors */
>> +
>> +	struct udma_tisci_rm tisci_rm;
>> +
>> +	struct k3_ringacc *ringacc;
>> +
>> +	struct work_struct purge_work;
>> +	struct list_head desc_to_purge;
>> +	spinlock_t lock;
>> +
>> +	struct udma_rx_flush rx_flush;
>> +
>> +	int bchan_cnt;
>> +	int tchan_cnt;
>> +	int echan_cnt;
>> +	int rchan_cnt;
>> +	int rflow_cnt;
>> +	int tflow_cnt;
>> +	unsigned long *bchan_map;
>> +	unsigned long *tchan_map;
>> +	unsigned long *rchan_map;
>> +	unsigned long *rflow_gp_map;
>> +	unsigned long *rflow_gp_map_allocated;
>> +	unsigned long *rflow_in_use;
>> +	unsigned long *tflow_map;
>> +
>> +	struct udma_bchan *bchans;
>> +	struct udma_tchan *tchans;
>> +	struct udma_rchan *rchans;
>> +	struct udma_rflow *rflows;
>> +
>> +	struct udma_chan *channels;
>> +	u32 psil_base;
>> +	u32 atype;
>> +	u32 asel;
>> +
>> +	int (*udma_start)(struct udma_chan *uc);
>> +	int (*udma_stop)(struct udma_chan *uc);
>> +	int (*udma_reset_chan)(struct udma_chan *uc, bool hard);
>> +	bool (*udma_is_desc_really_done)(struct udma_chan *uc, struct udma_desc *d);
>> +	void (*udma_decrement_byte_counters)(struct udma_chan *uc, u32 val);
> 
> You can drop the udma_ prefix, it is clear that they are for udma..
> 
>> +};


