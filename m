Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED14C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 15:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ua0MFYmmJwgIqN6yZsCwPYOXI20biJTE8N4JNQBlDw=; b=cISTCts4t+gaBiQ5IEua6lhsgY
	00csC/tL2/NBIpv4p/mtCuZWLUDgjM/3fpOxksgQjcTJ1h+Mw/rWgfKIaYEA/06qqh0ivjVkTVVdq
	VKIUBuqzLMFluGbjJzFhYP0IOqAGjntGCo2h9JuxA+2hrknZ90wW3FN8qGq6W2SY30AdSkFG6+6HL
	HQu23LiyOMiB7L3R9yeWTbXe5EgHUqa+6UvzSDKHHpxzvsaenLyiEgO0nexyRbquunX3bU8t6mCu8
	15+fUKzU9zxzOw8aEjQNihUT88g2lAouy8RZkYnRwBxsmHYG6ssIB/oLPTjm6kt6HnlLiFHcbFfGq
	kVYKR8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8ZJ-00000001pWz-2qC2;
	Wed, 30 Jul 2025 15:18:13 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8WE-00000001pJ4-0hiF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 15:15:03 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56UFEGSR2817950;
	Wed, 30 Jul 2025 10:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753888457;
	bh=7ua0MFYmmJwgIqN6yZsCwPYOXI20biJTE8N4JNQBlDw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OHY6gjjN8f48a5pFEOih/K5sacIY6GHdPtjlSHyoUV9MFCdjpxyGn2bJFzV7DLSw5
	 9H4L57FBpaKmKf7gPe4dV2kBEa0SCFo6cc2t2Wc1VyBr3WQcAYw+y7o6DcoN1EPjPo
	 3HWB+1d6IWNAeH/SmYllNdtSSMHaSPFttWlARtLA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56UFEGJf2644967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 30 Jul 2025 10:14:16 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 30
 Jul 2025 10:14:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 30 Jul 2025 10:14:16 -0500
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56UFEAqb1134002;
	Wed, 30 Jul 2025 10:14:11 -0500
Message-ID: <daee58ee-2d20-4cb0-b5bb-2e4dc1ff7b20@ti.com>
Date: Wed, 30 Jul 2025 20:44:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix skb handling for XDP_PASS
To: Jakub Kicinski <kuba@kernel.org>
CC: <namcao@linutronix.de>, <jacob.e.keller@intel.com>, <sdf@fomichev.me>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <pabeni@redhat.com>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250721124918.3347679-1-m-malladi@ti.com>
 <20250723171947.76995990@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <20250723171947.76995990@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_081502_301796_C15F6BA8 
X-CRM114-Status: GOOD (  20.93  )
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

On 7/24/25 05:49, Jakub Kicinski wrote:
> On Mon, 21 Jul 2025 18:19:18 +0530 Meghana Malladi wrote:
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
>> index 12f25cec6255..a0e7def33e8e 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_common.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
>> @@ -757,15 +757,12 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
>>   		xdp_prepare_buff(&xdp, pa, PRUETH_HEADROOM, pkt_len, false);
>>   
>>   		*xdp_state = emac_run_xdp(emac, &xdp, page, &pkt_len);
>> -		if (*xdp_state == ICSSG_XDP_PASS)
>> -			skb = xdp_build_skb_from_buff(&xdp);
>> -		else
>> +		if (*xdp_state != ICSSG_XDP_PASS)
>>   			goto requeue;
>> -	} else {
>> -		/* prepare skb and send to n/w stack */
>> -		skb = napi_build_skb(pa, PAGE_SIZE);
>>   	}
>>   
>> +	/* prepare skb and send to n/w stack */
>> +	skb = napi_build_skb(pa, PAGE_SIZE);
>>   	if (!skb) {
>>   		ndev->stats.rx_dropped++;
>>   		page_pool_recycle_direct(pool, page);
> 
> I'm not sure this is correct. We seem to hardcode headroom to
> PRUETH_HEADROOM lower in this function. If XDP adds or removes
> network headers and then returns XDP_PASS we'll look for the packet
> at the wrong offset.
> 

Yes that makes sense. Thanks for pointing it out. I think I have the 
right fix in mind. Will post it shortly as v2.

> We just merged some XDP tests, could you try running
> tools/testing/selftests/drivers/net/xdp.py ?
> Some general instructions can be found here:
> https://github.com/linux-netdev/nipa/wiki/Running-driver-tests
> 
> Not sure how stable the test is for all NICs but I think the
>   xdp.test_xdp_native_adjst_head_grow_data
> test case will exercise what I'm suspecting will fail.

It took me some time to install all the dependencies and get this tool 
running with the fix I mentioned above [1]. But I am not sure the error 
logs I got [2] are the one which you were expecting or some stability 
issue with the test. Can you please take a look at it.

[1]: 
https://gist.github.com/MeghanaMalladiTI/ce6a440f05fbdfb2d4363f672296d7d8
[2]:https://gist.github.com/MeghanaMalladiTI/52fe9d06c114562be08105d73f91ba62 


If the fix I attached here [1] makes sense, I will go ahead and post 
this as v2.

Thanks.

