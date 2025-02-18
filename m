Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF03C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGEjmL6AiEaHGdfRsy6AnNrW7FJmxRmggnhRMW4Zow0=; b=REVV6KxK3nU7iirYXYg+RRjVKv
	FCAZC2RY7MsBrk7fkmlq2saKdoXs/F7vZgLCap9cbBGrhPKEXLIuTEwlDFhryNABEoTYXXV+jG+oX
	BaXfGObm7Bt37Wb5p/AoqNIh2gFmj7ySY6cktDwwVYTrY7nA506StzgCZtAO5V4IpZBqkzS076T8D
	b38XLLb3N9DiG0hKiHZdm1MIymAUEqbsRV2UayBcTGAklp8OzRVYg7WYUR2snRoxNkpkl+F7GEc/Y
	tTASfvhnF0R0wa/9c9KUzEiq6WhKe5yNqgq28KGZnejl192/pP3jyRvvAtViVEJdlFJrw9GJQE9UM
	ptq6ACYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMlm-000000089wx-0cQR;
	Tue, 18 Feb 2025 12:32:10 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMii-000000089AE-3G3S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 12:29:02 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51ICSafl1670795
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 06:28:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739881716;
	bh=SGEjmL6AiEaHGdfRsy6AnNrW7FJmxRmggnhRMW4Zow0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EWO1en5zq8n48cQ7K/SNm/cWwkLYpAsYEFSKDuKUnCZqj/sR5zBrFl5R/+ERQ5hYN
	 SY8+qykzvzgQq0iUOjy7WUSJ3azkEvoD+cd4lJgbUW1seHxtZrtAgUc9C7VRoVGJQR
	 NYP0saM4W5NLD+Y2FkRiRjHC5HQZx7wk7GF5d+Jw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51ICSacM070600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 06:28:36 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 06:28:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 06:28:35 -0600
Received: from [172.24.20.199] (lt9560gk3.dhcp.ti.com [172.24.20.199])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51ICSSYE102530;
	Tue, 18 Feb 2025 06:28:28 -0600
Message-ID: <94425bfd-7f2b-4fc4-86f8-a56e56173d22@ti.com>
Date: Tue, 18 Feb 2025 17:58:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net-next v2 1/3] net: ti: icssg-prueth: Use
 page_pool API for RX buffer allocation
To: Diogo Ivo <diogo.ivo@siemens.com>, Roger Quadros <rogerq@kernel.org>,
        <danishanwar@ti.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <u.kleine-koenig@baylibre.com>, <krzysztof.kozlowski@linaro.org>,
        <dan.carpenter@linaro.org>, <schnelle@linux.ibm.com>,
        <glaroque@baylibre.com>, <rdunlap@infradead.org>,
        <jan.kiszka@siemens.com>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250210103352.541052-1-m-malladi@ti.com>
 <20250210103352.541052-2-m-malladi@ti.com>
 <152b032e-fcd9-4d49-8154-92a475c0670c@kernel.org>
 <615a2e1f-5ee5-4d80-a499-8ff06596a2fc@ti.com>
 <c8bdd93d-5690-4b8a-819f-853756b57a71@siemens.com>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <c8bdd93d-5690-4b8a-819f-853756b57a71@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_042900_901215_283BB9BA 
X-CRM114-Status: GOOD (  18.86  )
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

Hi Diogo,

On 2/18/2025 5:54 PM, Diogo Ivo wrote:
> Hi Meghana, On 2/18/25 10: 10 AM, Malladi, Meghana wrote: > On 2/12/2025 
> 7: 26 PM, Roger Quadros wrote: >> Can we get rid of SKB entirely from 
> the management channel code? >> The packet received on this channel is 
> never passed to
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> uvdgfB3F_Ow7QIXEnBKj3ybYT8I9yL0CM5RLkel44YW99zMeqk_TnCBkOwR0q45N5dLjtBz49EalJyUJ1-U1lPk6DIBve_3-$>
> ZjQcmQRYFpfptBannerEnd
> 
> Hi Meghana,
> 
> On 2/18/25 10:10 AM, Malladi, Meghana wrote:
>> On 2/12/2025 7:26 PM, Roger Quadros wrote:
>>> Can we get rid of SKB entirely from the management channel code?
>>> The packet received on this channel is never passed to user space so
>>> I don't see why SKB is required.
>>>
>> 
>> Yes I do agree with you on the fact the SKB here is not passed to the 
>> network stack, hence this is redundant. But honestly I am not sure how 
>> that can be done, because the callers of this function access skb->data
>> from the skb which is returned and the same can't be done with page (how 
>> to pass the same data using page?)
>> Also as you are aware we are not currently supporting SR1 devices 
>> anymore, hence I don't have any SR1 devices handy to test these changes 
>> and ensure nothing is broken if I remove SKB entirely.
> 
> I have some SR1 devices available and would be happy to test these
> proposed changes in case they are feasible.
> 

That's awesome. Once the changes have been aligned with Roger, I will 
share the changes with you for testing before posting v3. Thanks for 
your support.

> Best regards,
> Diogo
> 


