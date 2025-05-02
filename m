Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74845C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkqMSSAZ2mWgrwjBraBF0CvV/vcdXHZByR+N3CA5B7U=; b=gF4pbOmGfzknXurAPE6OMx0puy
	463dJDq3kVkNlIOD9s6zDKs+iqNU7YN8tqIqbUSZ6KnNnae7/3EWmby/z4Y1lMbyXNwvQduM9ZkXk
	yBq2gRKLDWbEecclBjaDDIVGyU3ovxcZyRvGsPbo4hvwjsirNjINtiJz73NR1Jf9HAFM1ijNkv+a0
	C3qA7ju9os+jz1cG4MpmJRW9jLrYAynLyBSRu76NCAQZOcITWH/vPBj2fa6zkVcwRPeDjNEnI3KMZ
	n4gxZwYmp5srNk4ffYv1hs26aVG67pfRH9Sj7vpE9G6VrrNXW1SrtqHxkNNGIfkrIC4TWDSfVCeLv
	5IWcu96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmps-00000001MwL-2Uok;
	Fri, 02 May 2025 09:37:36 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmkn-00000001MHN-1lZe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 09:32:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5429W0Sr3831866
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 04:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746178320;
	bh=PkqMSSAZ2mWgrwjBraBF0CvV/vcdXHZByR+N3CA5B7U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=u1V8An0Eca85G1KbNdjiH+NJt7Acs5JHIvVkI1gWjzkKeg8SixvJFs/y8/1bgwUsF
	 RIzz6Nwif+Ev2S72UjJn9g2moNYfSqAG5n4nyirydyjHo7Wv1zE+4xRWmDzILJS146
	 GeTJPsn5gXUX+EznEjjSy+30ULGC4pY5XWlYu8kA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5429W05f003807
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 04:32:00 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 04:32:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 04:32:00 -0500
Received: from [172.24.30.16] (lt9560gk3.dhcp.ti.com [172.24.30.16])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5429VssE080397;
	Fri, 2 May 2025 04:31:55 -0500
Message-ID: <7e91a1c1-237d-463d-8045-eb7ca9e8c8df@ti.com>
Date: Fri, 2 May 2025 15:01:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 3/4] net: ti: icssg-prueth: Fix race condition for
 traffic from different network sockets
To: Jakub Kicinski <kuba@kernel.org>
CC: <dan.carpenter@linaro.org>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
        <daniel@iogearbox.net>, <ast@kernel.org>, <pabeni@redhat.com>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250428120459.244525-1-m-malladi@ti.com>
 <20250428120459.244525-4-m-malladi@ti.com>
 <20250501075615.34573158@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250501075615.34573158@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_023221_558154_A1C99970 
X-CRM114-Status: GOOD (  20.22  )
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

Hi Jakub,

On 5/1/2025 8:26 PM, Jakub Kicinski wrote:
> On Mon, 28 Apr 2025 17:34:58 +0530 Meghana Malladi wrote:
>> When dealing with transmitting traffic from different network
>> sockets to a single Tx channel, freeing the DMA descriptors can lead
>> to kernel panic with the following error:
>>
>> [  394.602494] ------------[ cut here ]------------
>> [  394.607134] kernel BUG at lib/genalloc.c:508!
>> [  394.611485] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
>>
>> logs: https://gist.github.com/MeghanaMalladiTI/ad1d1da3b6e966bc6962c105c0b1d0b6
>>
>> The above error was reproduced when sending XDP traffic from XSK
>> socket along with network traffic from BSD socket. This causes
>> a race condition leading to corrupted DMA descriptors. Fix this
>> by adding spinlock protection while accessing the DMA descriptors
>> of a Tx ring.
> 
> IDK how XSK vs normal sockets matters after what is now patch 4.
> The only possible race you may be protecting against is pushing
> work vs completion. Please double check this is even needed,
> and if so fix the commit msg.

I can think of race conditions happening in the following cases:
1. Multiport use cases where traffic is being handled on more than one 
interface to a single Tx channel.
2. Having emac_xmit_xdp_frame() and icssg_ndo_start_xmit(), two 
different traffics being transmitted over a single interface to a single 
tx channel.

In both of the above scenarios Tx channel is a common resource which 
needs to be protected from any race conditions, which might happen 
during Tx descriptor push/pop. As suggested by you, I am currently 
excluding this patch and doing some stress testing. Regardless 
conceptually I still think spinlock is needed, please do correct me if I 
am wrong.

> 
>> Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> ---
>>   drivers/net/ethernet/ti/icssg/icssg_common.c | 7 +++++++
>>   drivers/net/ethernet/ti/icssg/icssg_prueth.h | 1 +
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
>> index 4f45f2b6b67f..a120ff6fec8f 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_common.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
>> @@ -157,7 +157,9 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>>   	tx_chn = &emac->tx_chns[chn];
>>   
>>   	while (true) {
>> +		spin_lock(&tx_chn->lock);
>>   		res = k3_udma_glue_pop_tx_chn(tx_chn->tx_chn, &desc_dma);
>> +		spin_unlock(&tx_chn->lock);
>>   		if (res == -ENODATA)
>>   			break;
>>   
>> @@ -325,6 +327,7 @@ int prueth_init_tx_chns(struct prueth_emac *emac)
>>   		snprintf(tx_chn->name, sizeof(tx_chn->name),
>>   			 "tx%d-%d", slice, i);
>>   
>> +		spin_lock_init(&tx_chn->lock);
>>   		tx_chn->emac = emac;
>>   		tx_chn->id = i;
>>   		tx_chn->descs_num = PRUETH_MAX_TX_DESC;
>> @@ -627,7 +630,9 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
>>   	cppi5_hdesc_set_pktlen(first_desc, xdpf->len);
>>   	desc_dma = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool, first_desc);
>>   
>> +	spin_lock_bh(&tx_chn->lock);
>>   	ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn, first_desc, desc_dma);
>> +	spin_unlock_bh(&tx_chn->lock);
> 
> I'm afraid this needs to be some form of spin_lock_irq
> The completions may run from hard irq context when netpoll/netconsole
> is used.

Didn't know system can handle network interrupts in a hard IRQ context. 
Ok I will update to spin_lock_irq() if this patch is necessary.

-- 
Thanks,
Meghana Malladi


