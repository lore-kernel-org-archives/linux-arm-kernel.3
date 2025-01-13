Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363B8C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooWFsB+eKdu1sbtdXlptO9kQd/DQBS8X4SFDPHoCJ30=; b=IAO1wWAJcyakNuFcrj7c5pdE/7
	p4ibItI8zPUF01WcaeI/QaZqNNUmOQf5ZbZxac2UBr1SeD0M/aEI6NNahOgwjjueOHQH3ampg9c6W
	wVnUf14FHNX8jmkBzTiqiNx9owGlLp1eqUg2fuZXKuDwmLZ0TMom2AnMjKSeFWR1QPwYxhpM+sLXD
	X2OoqhocZSydoBU30wzOdehU8Aj28AMlJ97XAJqwHtk7vDwzsa0kYvzQ65jNcVZ7Lw38Bo3Evf7NT
	K6e5LURa8Cdaxb0oCoRBRoHptJr4nSQnu0o5hmyM6LPRRZKsTt5HFmCY7VWi/lFkzArf05Gmk6hkf
	wFkZTdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOWX-000000065eo-3V5A;
	Mon, 13 Jan 2025 17:46:49 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOVH-000000065Tp-2ktD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 17:45:33 +0000
Message-ID: <14d13d7e-ef1d-4dcc-bd18-7a6709616678@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736790328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ooWFsB+eKdu1sbtdXlptO9kQd/DQBS8X4SFDPHoCJ30=;
	b=Dfz1Mfh+rNwiXUS4YRtkTYvcug+evu4trTHmj+o6EdBUgPRjKeAEFc656O4id0vm7uj7/K
	FT2voXbBSL3XnH5twbA+RQk0Z+QmHpXenrblPXhFB0T+aPz/zjThZM01I4d13jDKovDCay
	dkP2hxzJmOGR9ICN8TTYHast6gyYqck=
Date: Mon, 13 Jan 2025 12:45:24 -0500
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 5/6] net: xilinx: axienet: Get coalesce
 parameters from driver state
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Shannon Nelson
 <shannon.nelson@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-kernel@vger.kernel.org
References: <20250110192616.2075055-1-sean.anderson@linux.dev>
 <20250110192616.2075055-6-sean.anderson@linux.dev>
 <20250113173910.GF5497@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250113173910.GF5497@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_094532_541276_218205A6 
X-CRM114-Status: GOOD (  21.54  )
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

Hi Simon,

On 1/13/25 12:39, Simon Horman wrote:
> On Fri, Jan 10, 2025 at 02:26:15PM -0500, Sean Anderson wrote:
>> The cr variables now contain the same values as the control registers
>> themselves. Extract/calculate the values from the variables instead of
>> saving the user-specified values. This allows us to remove some
>> bookeeping, and also lets the user know what the actual coalesce
>> settings are.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> Reviewed by: Shannon Nelson <shannon.nelson@amd.com>
> 
> Hi Sean,
> 
> Unfortunately this series does not appear to apply cleanly to net-next.
> Which is our CI is currently unable to cope with :(
> 
> Please consider rebasing and reposting.

As noted in the cover letter, this series depends on [1] (now [2]). It
will apply cleanly without rebasing once that patch is applied. So maybe
you can re-run the CI at that time.

--Sean

[1] https://lore.kernel.org/netdev/20250110190726.2057790-1-sean.anderson@linux.dev/
[2] https://lore.kernel.org/netdev/20250113163001.2335235-1-sean.anderson@linux.dev

>> ---
>> 
>> (no changes since v2)
>> 
>> Changes in v2:
>> - New
>> 
>>  drivers/net/ethernet/xilinx/xilinx_axienet.h  |  8 ---
>>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 70 +++++++++++++------
>>  2 files changed, 47 insertions(+), 31 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
>> index 6b8e550c2155..45d8d80dbb1a 100644
>> --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
>> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
>> @@ -533,10 +533,6 @@ struct skbuf_dma_descriptor {
>>   *		  supported, the maximum frame size would be 9k. Else it is
>>   *		  1522 bytes (assuming support for basic VLAN)
>>   * @rxmem:	Stores rx memory size for jumbo frame handling.
>> - * @coalesce_count_rx:	Store the irq coalesce on RX side.
>> - * @coalesce_usec_rx:	IRQ coalesce delay for RX
>> - * @coalesce_count_tx:	Store the irq coalesce on TX side.
>> - * @coalesce_usec_tx:	IRQ coalesce delay for TX
>>   * @use_dmaengine: flag to check dmaengine framework usage.
>>   * @tx_chan:	TX DMA channel.
>>   * @rx_chan:	RX DMA channel.
>> @@ -615,10 +611,6 @@ struct axienet_local {
>>  	u32 max_frm_size;
>>  	u32 rxmem;
>>  
>> -	u32 coalesce_count_rx;
>> -	u32 coalesce_usec_rx;
>> -	u32 coalesce_count_tx;
>> -	u32 coalesce_usec_tx;
>>  	u8  use_dmaengine;
>>  	struct dma_chan *tx_chan;
>>  	struct dma_chan *rx_chan;
> 
>> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> 
> ...
> 
>> @@ -260,6 +264,23 @@ static u32 axienet_calc_cr(struct axienet_local *lp, u32 count, u32 usec)
>>  	return cr;
>>  }
>>  
>> +/**
>> + * axienet_cr_params() - Extract coalesce parameters from the CR
> 
> nit: axienet_coalesce_params
> 
>> + * @lp: Device private data
>> + * @cr: The control register to parse
>> + * @count: Number of packets before an interrupt
>> + * @usec: Idle time (in usec) before an interrupt
>> + */
>> +static void axienet_coalesce_params(struct axienet_local *lp, u32 cr,
>> +				    u32 *count, u32 *usec)
>> +{
>> +	u64 clk_rate = axienet_dma_rate(lp);
>> +	u64 timer = FIELD_GET(XAXIDMA_DELAY_MASK, cr);
>> +
>> +	*count = FIELD_GET(XAXIDMA_COALESCE_MASK, cr);
>> +	*usec = DIV64_U64_ROUND_CLOSEST(timer * XAXIDMA_DELAY_SCALE, clk_rate);
>> +}
>> +
>>  /**
>>   * axienet_dma_start - Set up DMA registers and start DMA operation
>>   * @lp:		Pointer to the axienet_local structure

