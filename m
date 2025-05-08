Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6B1C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aqOR78xCKbgwFiDVPw/MgZTZLn+uIVqWHT4kXJ4tLc=; b=IBxUwcLTii5RdfQ3X8DjOlkd3E
	KkCy4nh0t/2k2lJ53WYjHrJRfgxMSEgltqdPTgYWU7+Z2XRJLrrLBq8M9+D2VrQn5BeF4W1AHiEiu
	8PvT5aivOAv90aZqbpNJ+CHNFwoHgn18F5yrf/hfCdidyE7re4DVn9EEciuhHph5SmyT+ZlMWv6oH
	EJ7TkJQ1FeuUL8jp0Gwytf4tLOxjAeAH0gIrSQXHwgr/5Xg7u/LlqfQ8KAsKwhbCWWutQFdnnrSBQ
	17xmvHZ8yFC6wSJiZNNvQFx4rfS7Oi3VkEx2EjIGMSPVqJS5gtTfdUovTa0q6Bm+Bgqw5GThEOaR+
	9R1cfjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD47C-00000001Hw2-0KIE;
	Thu, 08 May 2025 16:28:54 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD33i-000000017EO-2jT7;
	Thu, 08 May 2025 15:21:15 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D33cuMejiCaH2D33cu8B4q; Thu, 08 May 2025 17:21:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746717671;
	bh=/aqOR78xCKbgwFiDVPw/MgZTZLn+uIVqWHT4kXJ4tLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=J8CnUdJwFn5FHAXlFR8ZkPazq64kfzu6rxQfO3bp4oYWlJR9yw7QZga+jkcHw8Lj3
	 59DlKyXiWVDflM4F3pjSXbdRl8J3n4nmEYwk6cij3i9lBC2dXOv4jHAUS2x2ZLZ4At
	 J4p289z8w3uB1RTTguqgEIONbMC3RwaVIU9BF5f6yRT56eUo4yOpO14QaYnwU4YTkX
	 xPEanpuM6dKRpcweXAnz5a4iL6lmWQQtAowORrji8ha6QsrSzbCgwdJ3PXv+Nhbahj
	 xG+HeZ7o5pMxM3CKoEseHRZwwSATlEKc2RmRq3qwY1HcWszZvxZkLh8zuz9rMTfdU5
	 R0AYedfcV2qqQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 08 May 2025 17:21:11 +0200
X-ME-IP: 90.11.132.44
Message-ID: <23517507-bf1a-47fa-9a96-b27922e1e05f@wanadoo.fr>
Date: Thu, 8 May 2025 17:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] net: airoha: Fix an error handling path in
 airoha_probe()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
 <3791c95da3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr>
 <aBzJZCIvE9u_IAM-@lore-desk>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aBzJZCIvE9u_IAM-@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_082114_826056_739C3883 
X-CRM114-Status: GOOD (  15.31  )
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


Le 08/05/2025 à 17:10, Lorenzo Bianconi a écrit :
>> If an error occurs after a successful airoha_hw_init() call,
>> airoha_ppe_deinit() needs to be called as already done in the remove
>> function.
>>
>> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Changes in v2:
>>    - Call airoha_ppe_init() at the right place in the error handling path
>>      of the probe   [Lorenzo Bianconi]
>>
>> Compile tested only.
>> ---
>>   drivers/net/ethernet/airoha/airoha_eth.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
>> index af8c4015938c..d435179875df 100644
>> --- a/drivers/net/ethernet/airoha/airoha_eth.c
>> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>> @@ -2967,6 +2967,7 @@ static int airoha_probe(struct platform_device *pdev)
>>   error_napi_stop:
>>   	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
>>   		airoha_qdma_stop_napi(&eth->qdma[i]);
>> +	airoha_ppe_init(eth);
> it was actually a typo in my previous email but this should be clearly
> airoha_ppe_deinit().

My bad!
Sorry for not spotting myself it.

We can really trust no one, nowadays ! :)

The good news is that my cocci script would have spotted it the next 
time I would have run it, because it would still find a 
airoha_ppe_deinit() in the remove function, but none in the probe.

I give you some time to review the other patches, and I'll a v3 later.

CJ

>
> Regards,
> Lorenzo
>
>>   error_hw_cleanup:
>>   	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
>>   		airoha_hw_cleanup(&eth->qdma[i]);
>> -- 
>> 2.49.0
>>

