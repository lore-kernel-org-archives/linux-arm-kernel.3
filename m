Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094BBC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3Zcprdv1SvQj0eiycKQXI51YCMEuANQ9KWCXytXxLs=; b=Vyw2oarx4Wd6DPCf4xuv3P249m
	25d44lAqkrPCol/Kjg/vEO+N8ahQHIKWLrbA+41e/JycOm3c4Oc5JeSZs/uIX6TEBq2G86OHS26nv
	T503Pl9duFTPnLxagCA1T69gAmbXdp3pzSJ8/jnv0qtYrTyPqbOWjv6Gm2kCFFPOLWhf/h0m8i8IG
	XWBo8y0P+6lvYRiS0xjw0YJETpmi0FwOKjk1VYI9ZpOBSkmpL/Dq9X2sVgxQZVWFqua/hNrLMw8ac
	x3jCOtqPoR1eEH6WAJGkK7vd8uOaIM2MHQX/VXwlwjpDM9+mPr26jXlNtunlw5Ll2OQl2gPYfW7Qg
	nxY8ktEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vd-00000001Mpb-1yCH;
	Thu, 08 May 2025 17:21:01 +0000
Received: from smtp-75.smtpout.orange.fr ([80.12.242.75] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3kZ-00000001EYX-39Yc;
	Thu, 08 May 2025 16:05:32 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D3kUuhiTn5oOhD3kUuQpGk; Thu, 08 May 2025 18:05:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746720329;
	bh=i3Zcprdv1SvQj0eiycKQXI51YCMEuANQ9KWCXytXxLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ATwY6ABMjL9h2bymt7e78pl9aKcyh+EW5/LzWCMpLnKdY3A2MnCK2IfN54Cblz188
	 frUSBSmFo3Mlo+ZWoWEk6Gk6woIflGmSyUb+BEg9JuLGXjzvWEzbQnuhtX9xd8xDN3
	 1HcGPT8iZJNsZH964+0wBxoS09nQ7HOhHtgS4XMixHUiF8qDVtN16RE8zjFEUeMmve
	 l9oD4xuiMRY97u+tI1uWtlIPxAgUeGkX1KFYAfUQmJNZp/7IAeCnt6EPJpwUU34YfO
	 /xiXGagHB/5+fIGOLgaCdeSONbXd0FhUslqS+faTY2gQ/df8VyzjbAtPlQZ4qoOPXS
	 1G/utI/oMG2Kg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 08 May 2025 18:05:29 +0200
X-ME-IP: 90.11.132.44
Message-ID: <68149c51-ba75-4f0f-a86a-bd810d47d684@wanadoo.fr>
Date: Thu, 8 May 2025 18:05:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] net: airoha: Fix an error handling path in
 airoha_alloc_gdm_port()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
 <aBzOaiU6Ac3ZTU-4@lore-desk>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aBzOaiU6Ac3ZTU-4@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_090531_925465_80298989 
X-CRM114-Status: GOOD (  21.95  )
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

Le 08/05/2025 à 17:31, Lorenzo Bianconi a écrit :
>> If register_netdev() fails, the error handling path of the probe will not
>> free the memory allocated by the previous airoha_metadata_dst_alloc() call
>> because port->dev->reg_state will not be NETREG_REGISTERED.
>>
>> So, an explicit airoha_metadata_dst_free() call is needed in this case to
>> avoid a memory leak.
>>
>> Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Changes in v2:
>>    - New patch
>>
>> Compile tested only.
>> ---
>>   drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
>> index 16c7896f931f..af8c4015938c 100644
>> --- a/drivers/net/ethernet/airoha/airoha_eth.c
>> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
>> @@ -2873,7 +2873,15 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
>>   	if (err)
>>   		return err;
>>   
>> -	return register_netdev(dev);
>> +	err = register_netdev(dev);
>> +	if (err)
>> +		goto free_metadata_dst;
>> +
>> +	return 0;
>> +
>> +free_metadata_dst:
>> +	airoha_metadata_dst_free(port);
>> +	return err;
>>   }
>>   
>>   static int airoha_probe(struct platform_device *pdev)
>> -- 
>> 2.49.0
>>
> 
> I have not tested it but I think the right fix here would be something like:
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index b1ca8322d4eb..33f8926bba25 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2996,10 +2996,12 @@ static int airoha_probe(struct platform_device *pdev)
>   	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
>   		struct airoha_gdm_port *port = eth->ports[i];
>   
> -		if (port && port->dev->reg_state == NETREG_REGISTERED) {
> +		if (!port)
> +			continue;

I think it works.

We can still have port non NULL and airoha_metadata_dst_alloc() which 
fails, but airoha_metadata_dst_free() seems to handle it correctly.

CJ


> +
> +		if (port->dev->reg_state == NETREG_REGISTERED)
>   			unregister_netdev(port->dev);
> -			airoha_metadata_dst_free(port);
> -		}
> +		airoha_metadata_dst_free(port);
>   	}
>   	free_netdev(eth->napi_dev);
>   	platform_set_drvdata(pdev, NULL);
> 
> Regards,
> Lorenzo


