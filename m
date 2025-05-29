Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBAAC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 16:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgchDy6+ENMwqS/G43COtFv0WHKtbEpVBzFuObLQORs=; b=vSIGqsFY3AngUxbv77Hrpnm/MH
	IC67A5vKZwOR4eN0y4Ya0Rnao+z61CxQfR3z3J/LN7gzAVTU6K6UMDO7cZmP/4ERLlw7/2pBNN0sg
	cBKgCoYIEmz10G3iwTaWSOnpuWRCjcAyUo33pk7Pgow2cP8NqDV3ymzk43voPwKsCPf8SD3K1z6H0
	tFVo0nU1OTWGJOCIG/CTAKKH0xJsIswm1zDbM4EA1vhSLuL1Ks+2JaUMmhKrOYpio8Y+TPk52lZ7b
	htqi7YS8cflvVo6h+QSvFDY+ZN/vfgmCIXnWxjyVzsDQor/FIusI/bzAMbAdzvNXumv7nXG/6FXDi
	+uragOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgG2-0000000GCR1-2ded;
	Thu, 29 May 2025 16:37:30 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgDt-0000000GCFr-4ATM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 16:35:19 +0000
Message-ID: <f445b132-98c5-4f38-bd3e-172bc8645a03@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748536513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgchDy6+ENMwqS/G43COtFv0WHKtbEpVBzFuObLQORs=;
	b=hqLZDpOWSYQ2FckvbhD5AL4P/5BzRpqjbhLUkGbGbVjsd4GxGVI2nKradu011PJcE3efzT
	VQi7WkK/+LrbhVboZKk9NzMSWHnauDVyZz3HkGFKQD4Fy/xbTNNrc0TMuLvtbBjK8Yf/NP
	E9xhQ00BqTYAH6m9BUGtxaWj3Ih+YQA=
Date: Thu, 29 May 2025 12:35:09 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: xilinx: axienet: Configure and report
 coalesce parameters in DMAengine flow
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Gupta, Suraj" <Suraj.Gupta2@amd.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "horms@kernel.org" <horms@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>, "Katakam, Harini" <harini.katakam@amd.com>
References: <20250525102217.1181104-1-suraj.gupta2@amd.com>
 <679d6810-9e76-425c-9d4e-d4b372928cc3@linux.dev>
 <BL3PR12MB6571ABA490895FDB8225CAEBC967A@BL3PR12MB6571.namprd12.prod.outlook.com>
 <d5be7218-8ec1-4208-ac24-94d4831bfdb6@linux.dev>
 <6c99b7f5-b529-4efd-a065-1e0ebf01468e@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <6c99b7f5-b529-4efd-a065-1e0ebf01468e@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_093518_249468_2AEAC836 
X-CRM114-Status: GOOD (  11.01  )
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

On 5/29/25 12:29, Andrew Lunn wrote:
>> Yeah, but the reason is that you are trading latency for throughput.
>> There is only one queue, so when the interface is saturated you will not
>> get good latency anyway (since latency-sensitive packets will get
>> head-of-line blocked). But when activity is sparse you can good latency
>> if there is no coalescing. So I think coalescing should only be used
>> when there is a lot of traffic. Hence why I only adjusted the settings
>> once I implemented DIM. I think you should be able to implement it by
>> calling net_dim from axienet_dma_rx_cb, but it will not be as efficient
>> without NAPI.
>> 
>> Actually, if you are looking into improving performance, I think lack of
>> NAPI is probably the biggest limitation with the dmaengine backend.
> 
> It latency is the goal, especially for mixing high and low priority
> traffic, having BQL implemented is also important. Does this driver
> have that?
> 
> 	Andrew

Yes, see commit c900e49d58eb ("net: xilinx: axienet: Implement BQL").

--Sean

