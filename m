Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78438C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKKKVZItBfHT3+7YvX1+qGAHQotvuTJsvf86filRI5U=; b=EhNXY5+oZqG94x7qz8XzMF92Xh
	qXap5cpUHxOt5/mtzivTND8MoPO1Pz2ci6kuW9WY9wuc87xpOJ1biqF/LHpEaEldFr1ZlApLsvzkl
	tNYGcTqvdcHW41cco8wXija5j6aqT9O4D6kGn0Ni8q7P1HLCCyzWr1oAptB1RIKXNUMyBTPyJcF/m
	36F1Nd1jX6iVFMQKr1wM54XDRV/JMYnJj9HtJ6g7tuZ6JLYNEN0/uL+VKSm/jZJSqjcHLNK2XEvCO
	JJdWRwN4KytBEbzvJT33bpdxZWGEgRv6JEOZkvk9MG0z/1N6IPGgWPXWJEv93toeJef8m8EeUs+Cd
	Xm6r+5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty33b-0000000CiJH-2B4d;
	Fri, 28 Mar 2025 06:19:07 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty31r-0000000ChxN-3bGS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 06:17:21 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52S6Gv5g2081932
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 01:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743142617;
	bh=AKKKVZItBfHT3+7YvX1+qGAHQotvuTJsvf86filRI5U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gaRT3A2ZbMJXsh7hhAmcoeVP2sMA96wL8ENWPDMOivTUGrSJKvFGJ3Oktzsy6hMRY
	 Oj1/1DdBPvR+u2EbiGLPppaaBFlXzBrWWm/n0B5y8tSXa0VJh9Z/1QWyzOxUC+Cw2F
	 8G7xtZQ+rEXiVUI1P2hcGzcuuBRQJ7bDDP4TrBFk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52S6GvA3027969
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 01:16:57 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 01:16:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 01:16:57 -0500
Received: from [10.249.140.156] ([10.249.140.156])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52S6GnDw079192;
	Fri, 28 Mar 2025 01:16:50 -0500
Message-ID: <0799d2f6-3777-45f6-a6b6-9ca3f145d611@ti.com>
Date: Fri, 28 Mar 2025 11:46:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/3] net: ti: icss-iep: Fix possible NULL
 pointer dereference for perout request
To: Jakub Kicinski <kuba@kernel.org>
CC: <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kory.maincent@bootlin.com>,
        <dan.carpenter@linaro.org>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <jacob.e.keller@intel.com>,
        <horms@kernel.org>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
        <daniel@iogearbox.net>, <ast@kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Roger
 Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250321081313.37112-1-m-malladi@ti.com>
 <20250321081313.37112-4-m-malladi@ti.com>
 <20250325104801.632ff98d@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250325104801.632ff98d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_231719_989001_ED603CBA 
X-CRM114-Status: GOOD (  20.06  )
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



On 3/25/2025 11:18 PM, Jakub Kicinski wrote:
> On Fri, 21 Mar 2025 13:43:13 +0530 Meghana Malladi wrote:
>> Whenever there is a perout request from the user application,
>> kernel receives req structure containing the configuration info
>> for that req.
> 
> This doesn't really explain the condition under which the bug triggers.
> Presumably when user request comes in req is never NULL?
> 

You are right, I have looked into what would trigger this bug but seems 
like user request can never be NULL, but the contents inside the req can 
be invalid, but that is already being handled by the kernel. So this bug 
fix makes no sense and I will be dropping this patch for v3. Thanks.

>> Add NULL pointer handling for perout request if
>> that req struct points to NULL.
>>
>> Fixes: e5b456a14215 ("net: ti: icss-iep: Add pwidth configuration for perout signal")
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> Reviewed-by: Simon Horman <horms@kernel.org>
>> ---
>>
>> Changes from v1(v2-v1):
>> - Collected RB tag from Simon Horman <horms@kernel.org>
>>
>>   drivers/net/ethernet/ti/icssg/icss_iep.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> index b4a34c57b7b4..aeebdc4c121e 100644
>> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
>> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> @@ -498,6 +498,10 @@ static int icss_iep_perout_enable(struct icss_iep *iep,
>>   {
>>   	int ret = 0;
>>   
>> +	/* Return error if the req is NULL */
> 
> code is trivial here, explain the 'why' not the 'what'
> Why is this called with NULL?
> 
>> +	if (!req)
>> +		return -EINVAL;


