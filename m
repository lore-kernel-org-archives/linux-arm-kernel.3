Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EEBC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCXA41Ish/7Jei7o/eseHM2xmg9pFZPuBLzeUlIR67s=; b=IM2SDZ1voWJof8tRii8ZoXh6fw
	6iU+CcU6vgDfW7HAfp498giGO/pggd8vKreo2+dCdfCrbw6JrLyfM2I0Mtc4Jzjx5tJnudd1wVf35
	igITcqdc+3vSj4hYhVqJmANFCArFDTEMH8Gh+jpzVeMn8/WaOxTixKb2lXas2/j6TrZGYju2/Fc1Z
	I5DdeF7wMIU8QgyYvGiCEcxE1kUFqBg7xrGKQnyQNnmr017h8jTgGR1FHY7BawQ71ZyhU1Fa7RYTK
	NXNi93fz/LMpiF9HAvW9BdnzCrez9gqKgxIroDqBGgTldA8XFO5cHWOfbcE9lcpoSW9jXu1o8emVN
	wwwdbeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmaW-00000001KZs-1WHR;
	Fri, 02 May 2025 09:21:44 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmNT-00000001IWQ-0hmX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 09:08:16 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54297thx3827106
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 04:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746176875;
	bh=MCXA41Ish/7Jei7o/eseHM2xmg9pFZPuBLzeUlIR67s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yHhrXQDFMyCoPhhHLWtaWNqza8g8gbzocqHe3jZNQr4zIl5LCrvxpjVAUbxomKH9w
	 C58fcII/WAi7JUFCBV0zhEBEQyKRvw4bqTkhgQQkjgzdhRFW2JMi43DfREvQU0U+WO
	 rqMLMfS6RdmTrGDUTpphESBUVEulV/0e0vPbl1sA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54297t4N021278
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 04:07:55 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 04:07:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 04:07:54 -0500
Received: from [172.24.30.16] (lt9560gk3.dhcp.ti.com [172.24.30.16])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54297nmp052556;
	Fri, 2 May 2025 04:07:50 -0500
Message-ID: <f6434e4a-c37c-41dc-91b4-0cc2d33730ba@ti.com>
Date: Fri, 2 May 2025 14:37:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 4/4] net: ti: icssg-prueth: Fix kernel panic during
 concurrent Tx queue access
To: Jesper Dangaard Brouer <hawk@kernel.org>, <dan.carpenter@linaro.org>,
        <john.fastabend@gmail.com>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250428120459.244525-1-m-malladi@ti.com>
 <20250428120459.244525-5-m-malladi@ti.com>
 <074a9a19-9050-44dd-a0bf-536ae8318da2@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <074a9a19-9050-44dd-a0bf-536ae8318da2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_020815_296648_AF5DA5AD 
X-CRM114-Status: GOOD (  21.80  )
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

Hi Jesper,

On 5/2/2025 12:44 PM, Jesper Dangaard Brouer wrote:
> 
> 
> On 28/04/2025 14.04, Meghana Malladi wrote:
>> Add __netif_tx_lock() to ensure that only one packet is being
>> transmitted at a time to avoid race conditions in the netif_txq
>> struct and prevent packet data corruption. Failing to do so causes
>> kernel panic with the following error:
>>
>> [ 2184.746764] ------------[ cut here ]------------
>> [ 2184.751412] kernel BUG at lib/dynamic_queue_limits.c:99!
>> [ 2184.756728] Internal error: Oops - BUG: 00000000f2000800 [#1] 
>> PREEMPT SMP
>>
>> logs: https://gist.github.com/ 
>> MeghanaMalladiTI/9c7aa5fc3b7fb03f87c74aad487956e9
>>
>> The lock is acquired before calling emac_xmit_xdp_frame() and released 
>> after the
>> call returns. This ensures that the TX queue is protected from 
>> concurrent access
>> during the transmission of XDP frames.
>>
>> Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> ---
>>   drivers/net/ethernet/ti/icssg/icssg_common.c | 7 ++++++-
>>   drivers/net/ethernet/ti/icssg/icssg_prueth.c | 7 ++++++-
>>   2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/ 
>> net/ethernet/ti/icssg/icssg_common.c
>> index a120ff6fec8f..e509b6ff81e7 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_common.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
>> @@ -660,6 +660,8 @@ static u32 emac_run_xdp(struct prueth_emac *emac, 
>> struct xdp_buff *xdp,
>>               struct page *page, u32 *len)
>>   {
>>       struct net_device *ndev = emac->ndev;
>> +    struct netdev_queue *netif_txq;
>> +    int cpu = smp_processor_id();
>>       struct bpf_prog *xdp_prog;
>>       struct xdp_frame *xdpf;
>>       u32 pkt_len = *len;
>> @@ -679,8 +681,11 @@ static u32 emac_run_xdp(struct prueth_emac *emac, 
>> struct xdp_buff *xdp,
>>               goto drop;
>>           }
>> -        q_idx = smp_processor_id() % emac->tx_ch_num;
>> +        q_idx = cpu % emac->tx_ch_num;
>> +        netif_txq = netdev_get_tx_queue(ndev, q_idx);
>> +        __netif_tx_lock(netif_txq, cpu);
>>           result = emac_xmit_xdp_frame(emac, xdpf, page, q_idx);
>> +        __netif_tx_unlock(netif_txq);
>>           if (result == ICSSG_XDP_CONSUMED) {
>>               ndev->stats.tx_dropped++;
>>               goto drop;
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/ 
>> net/ethernet/ti/icssg/icssg_prueth.c
>> index ee35fecf61e7..b31060e7f698 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> @@ -1075,20 +1075,25 @@ static int emac_xdp_xmit(struct net_device 
>> *dev, int n, struct xdp_frame **frame
>>   {
>>       struct prueth_emac *emac = netdev_priv(dev);
>>       struct net_device *ndev = emac->ndev;
>> +    struct netdev_queue *netif_txq;
>> +    int cpu = smp_processor_id();
>>       struct xdp_frame *xdpf;
>>       unsigned int q_idx;
>>       int nxmit = 0;
>>       u32 err;
>>       int i;
>> -    q_idx = smp_processor_id() % emac->tx_ch_num;
>> +    q_idx = cpu % emac->tx_ch_num;
>> +    netif_txq = netdev_get_tx_queue(ndev, q_idx);
>>       if (unlikely(flags & ~XDP_XMIT_FLAGS_MASK))
>>           return -EINVAL;
>>       for (i = 0; i < n; i++) {
>>           xdpf = frames[i];
>> +        __netif_tx_lock(netif_txq, cpu);
>>           err = emac_xmit_xdp_frame(emac, xdpf, NULL, q_idx);
>> +        __netif_tx_unlock(netif_txq);
> 
> Why are you taking and releasing this lock in a loop?
> 
> XDP gain performance by sending a batch of 'n' packets.
> This approach looks like a performance killer.
> 

Yes, I agree with you. This wasn't the intended change. Thank you for 
pointing this out. The lock and unlock should happen outside the loop. 
Will fix this in v2.

> 
>>           if (err != ICSSG_XDP_TX) {
>>               ndev->stats.tx_dropped++;
>>               break;
> 
> 

-- 
Thanks,
Meghana Malladi


