Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A84D12695
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 12:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8Ot+L92FMNzAT/dVawQMY/gWiO3L4DG4uE/gA9uMU4=; b=JlxGwzxr6h/1eMHBe6XoXOIzLY
	bUGRB3HvIpzhDS7d1E7Vu6NBsP2FcsVfuO2thNbcgSRLALMQzNxIg6b5n38kus2HaYW1LqCQIgZ0Y
	aBRoImihY//Xi4pod7ruGoaYySYUcpzvPByIyjpOWXiifFJZrukoPHVMYO8PtY9/6NJavgDqOGU9n
	QXamu9e06bt8rYDp0xa8qT94asbE4ORClsVLNsEkz1Dnm6VqhN6L3yPt7vugsSiFv5SQiB2GnfSgq
	RrEeXrKrfOa+AKPLFY8APfEMOPN1C7DJuhfx2TzMVi2SVvQD6asHrwbb3IB6MrXqIGtOy/hKWzDJs
	vYecApQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8IHQ-0000000Gvy5-0mQ7;
	Tue, 05 Nov 2024 12:03:28 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8IFi-0000000Gvkp-1FTN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 12:01:43 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A5C1KxR073177;
	Tue, 5 Nov 2024 06:01:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730808080;
	bh=I8Ot+L92FMNzAT/dVawQMY/gWiO3L4DG4uE/gA9uMU4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YJcOmrSqnbVxJv3RZnS+O4a2zYBk1oirNEMArSbhYG+TopXlv7wUrfxEt2RI6JGKx
	 OfLuH6P6fQ61TMuaGeuytiWNFJV0jOQlE1FZ7DlIwOgeUhcjacN1VKLJDl+AcI3rIB
	 mEhgAIeNhybc3XEWtCGMyuTG/e6n3xW8GjFhIpvQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A5C1KA1076249
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 06:01:20 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 06:01:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 06:01:20 -0600
Received: from [10.249.139.24] ([10.249.139.24])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A5C1DuV010566;
	Tue, 5 Nov 2024 06:01:14 -0600
Message-ID: <e5c5c9ba-fca1-4fa3-a416-1fc972ebd258@ti.com>
Date: Tue, 5 Nov 2024 17:31:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix 1 PPS sync
To: Jakub Kicinski <kuba@kernel.org>
CC: <vigneshr@ti.com>, <horms@kernel.org>, <jan.kiszka@siemens.com>,
        <diogo.ivo@siemens.com>, <pabeni@redhat.com>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>,
        Vadim Fedorenko
	<vadim.fedorenko@linux.dev>
References: <20241028111051.1546143-1-m-malladi@ti.com>
 <20241031185905.610c982f@kernel.org>
 <7c3318f4-a2d4-4cbf-8a93-33c6a8afd6c4@ti.com>
 <20241104185031.0c843951@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20241104185031.0c843951@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_040142_466489_6764B4FD 
X-CRM114-Status: GOOD (  17.48  )
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



On 11/5/2024 8:20 AM, Jakub Kicinski wrote:
> On Mon, 4 Nov 2024 16:55:46 +0530 Malladi, Meghana wrote:
>> On 11/1/2024 7:29 AM, Jakub Kicinski wrote:
>>> On Mon, 28 Oct 2024 16:40:52 +0530 Meghana Malladi wrote:
>>>> The first PPS latch time needs to be calculated by the driver
>>>> (in rounded off seconds) and configured as the start time
>>>> offset for the cycle. After synchronizing two PTP clocks
>>>> running as master/slave, missing this would cause master
>>>> and slave to start immediately with some milliseconds
>>>> drift which causes the PPS signal to never synchronize with
>>>> the PTP master.
>>>
>>> You're reading a 64b value in chunks, is it not possible that it'd wrap
>>> in between reads? This can be usually detected by reading high twice and
>>> making sure it didn't change.
>>>
>>> Please fix or explain in the commit message why this is not a problem..
>> Yes I agree that there might be a wrap if the read isn't atomic. As
>> suggested by Andrew I am currently not using custom read where I can
>> implement the logic you suggested
> 
> Right but I think Andrew was commenting on a patch which contained pure
> re-implementation of read low / hi with no extra bells or whistles.
> 
>> (reading high twice and making sure if
>> didn't change). Can you share me some references where this logic is
>> implemented in the kernel, so I can directly use that instead of writing
>> custom functions.
> 
> I think you need to write a custom one. Example:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/meta/fbnic/fbnic_time.c#n40
Ok thank you. I will add custom function for this and update the patch.

