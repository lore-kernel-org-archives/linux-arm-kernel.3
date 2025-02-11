Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C43C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/56BFQCA/x0+5Zxz4AvQg+9pW1+xObkEyrqUGNwQiI=; b=CBGfBFOCJ5SeWHD1/4JkEtGXbx
	M3Dr7vF8p5moJPVioeDkuo3XKsAg107FSoEpPWJ0qqp7saIp2qDupvkeqPTbb0p6RHevWOjMCukiR
	rge2ZPdMSXtX9w9Iwo85602dYDfjF16yiyNRNEI4/yC9Sznk0TOJrfHAT0CC6E95YPy3B1/szjQ0n
	VxJ6sKe98RCigx/AZ6v84HaqAGCWTNtaNsAYAZdo7FiasUbAC6JJXCTz4UCKlZkauSTYhS6ag3QgG
	xlxhXD7J7HZr49EOofEDxW0Im5yCOYQ0AJguTT7qjc+KbySncvFrA9AOqxi7wpPq5NnqsOy7EkugM
	rFuRU9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtji-00000004cwP-3s92;
	Tue, 11 Feb 2025 17:07:50 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thtes-00000004c5s-2tpT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:02:52 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab7ca64da5dso361599966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1739293369; x=1739898169; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/56BFQCA/x0+5Zxz4AvQg+9pW1+xObkEyrqUGNwQiI=;
        b=opnXNsUBJagtxrgbBLsVT0mkAQOEV5qkEXooAfxheSTZ3Be1FekM9ClfUaSbAvAWCJ
         dzBT/0PLlgiIdm9J2l8aX18cVPZtN1wfXiodGNlxHAhVoHY47/csoSXjDBFEH6LfftEy
         G07w7Oke36WwaBbCQXQziOOxEFLiF+xQW6Cw23qMUNvID2P2+vC+4iQKdMxD6Ebejzff
         xN7Zu/rZ+3sumuQej4cGemysQ2hF0EdQ+vLfttB+hA2La8Ci5Yab5tQCmtd3xBLqnaEk
         nNCPEQ6vrol2CFITIkObHnm2KlFm7BvueI5qmgTWpczj4tTXdTUQ98WF+jXsbiRqilF+
         v3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739293369; x=1739898169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/56BFQCA/x0+5Zxz4AvQg+9pW1+xObkEyrqUGNwQiI=;
        b=AqGvOeGabMMUUzBJgEd4yxHJpfsBsU5SRlD2JuCyOe4Dr8ubO+gTrEPzaexe5PfMT0
         0rruth2CnUZ0TT22VTQaBmIMZQb82ZoqMS1lil5GsYXEKEf1YE9aPUpat8qrYdUY6nSK
         bg1jYfswfli8hUep6tbwtPyLEzDhH6oo9hUGwi1ni9IuS0e/mW5fGntxuDQ3qNZNmwQi
         FewoBPHe7moGhWRfXp3szvGtrLlK8Wz4Gbuot19UQySu90HNWBdK75HgwOu9yIgMa0+C
         +ro8o0UZAAssFM0O3P6vEY4UUBKn2yeU5anxReyfBmNiIUt6UGvpe+DrrfEXL39BaKot
         XeDg==
X-Forwarded-Encrypted: i=1; AJvYcCUt9XQlVVYchuSGSKd5jQeEraDP++F6NMfHySQ48PpFZCXki70WrwctpT9okEUBZI466jB1cp3M9v1PUA4zTFM1@lists.infradead.org
X-Gm-Message-State: AOJu0YzgENZVZRw9ShdcSVhStOyJfUvYjdULu/uLmz8vyUFgLoHfnoBT
	EGtMJGmpMWlCjZsmaPzzP1Pb7WoVOyQgw2g1FIN76gNN6R7XF8fea0SppDsQDu0=
X-Gm-Gg: ASbGncvMI834DqZ4ZQo3Yvk3ev8JwRMjbSjQLniHXV1k+nVmqSf28Iegofbei9Ry6B8
	666erI71ib8XVF3A9TDX41DyQ5u9MoHQpNT5+CjQ602QbsKHeWDiMyl83p+9idnh5454OzpHoK2
	CCbchI3rTWVLd/zILR9l7bb5L9peUqKJctHJbhfKBIU8mGwJehFYgKpUjlFLOQjIXwnFM5AmJ//
	aBATQRssZoCgnxzDf/+eyk+GYxpjYotCFM62YMzhRFdquN2pogXtVNAsGyt+yQ5nHqQ8EEKjipm
	Ttx1txBkWvc9hLCmBsHevWFgJ1gFlpocwP0XPMwMDAd9xTU=
X-Google-Smtp-Source: AGHT+IGAPbzjetBMyKn9xpkEx6mNiLaz6Iu+7FJStrC2CQYkHtGpuLCTUuKU+eMJA/ubyZG+xRvimw==
X-Received: by 2002:a17:907:7fac:b0:ab7:cd14:2472 with SMTP id a640c23a62f3a-ab7dafca27emr340636066b.23.1739293367291;
        Tue, 11 Feb 2025 09:02:47 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4e96185sm543848166b.86.2025.02.11.09.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:02:46 -0800 (PST)
Message-ID: <2609939e-fce9-42ff-93ee-890598437f25@blackwall.org>
Date: Tue, 11 Feb 2025 19:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 05/14] bridge: Add filling forward path from
 port to port
To: Eric Woudstra <ericwouds@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250209111034.241571-1-ericwouds@gmail.com>
 <20250209111034.241571-6-ericwouds@gmail.com>
 <20250211132832.aiy6ocvqppoqkd65@skbuf>
 <91d709aa-2414-4fb4-b3e1-94e0e330d33c@blackwall.org>
 <1aa60578-ba4c-458b-b020-cff59b119bdc@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <1aa60578-ba4c-458b-b020-cff59b119bdc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_090250_808510_85678AA7 
X-CRM114-Status: GOOD (  13.49  )
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

On 2/11/25 18:35, Eric Woudstra wrote:
> 
> 
> On 2/11/25 5:00 PM, Nikolay Aleksandrov wrote:
>> On 2/11/25 15:28, Vladimir Oltean wrote:
>>> On Sun, Feb 09, 2025 at 12:10:25PM +0100, Eric Woudstra wrote:
>>>> @@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
>>>>  	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
>>>>  		return;
>>>>  
>>>> -	vg = br_vlan_group(br);
>>>> +	if (p)
>>>> +		vg = nbp_vlan_group(p);
>>>> +	else
>>>> +		vg = br_vlan_group(br);
>>>>  
>>>>  	if (idx >= 0 &&
>>>>  	    ctx->vlan[idx].proto == br->vlan_proto) {
>>>
>>> I think the original usage of br_vlan_group() here was incorrect, and so
>>> is the new usage of nbp_vlan_group(). They should be br_vlan_group_rcu()
>>> and nbp_vlan_group_rcu().
>>>
>>
>> Oops, right. Nice catch!
>>
> 
> Hi Nikolay,
> 
> I gather that I can include your Acked-by also in the corrected patch.
> 

Yes, thanks.


