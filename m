Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98DBD2E9C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgzDV6XTYtXT/ZAEBGBUP7h48Bysqg7RCg25yVB5U/k=; b=h+Z5SCgDpLhr4ApuHVIu3PSJOx
	qr9c1R+mzclh0WGCf5hK91UMPR44eBTG5+NBQWXBgW6iC1AnydM0zpBARCNvq9o6fME9mA5MAndJc
	co/7w5jkK1xWR8dGOSHOxW6qexkiV3vmtXBeZUqC5GEqE3HIos7PWC01XTIoUGZBENr7TMUT7Ioh7
	5rKkoBK35FKcX/z3dZyzZ7py7/yo3LZsdrmdxhRfzLtGiyoGt17XtVnl54hpEQCFwgdmUNjyRJo+0
	Limj4lHYSk8mVCJzqaB0AHvdjL4/Ea8KoRCsp3JMY8qeRW9wWbAm9GzqGeEg+wiC8yxxD5RwSFb33
	CcBTc+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQaK-0000000H4oR-2gX2;
	Mon, 11 Nov 2024 09:19:48 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQYX-0000000H4Sz-3J2U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:17:58 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3e60d3adecbso2342564b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731316676; x=1731921476; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgzDV6XTYtXT/ZAEBGBUP7h48Bysqg7RCg25yVB5U/k=;
        b=a39qcVZHCt0VpLxj6RSp+LBYe3Ag6AP/CZkzS1O81FZHx9ce0YrVseTO5Aj30LB99t
         hb54oJOiZuxWVX+WC3215nGgHBa25E8qtkEKuQf5n1V6rHl2U02Rf+9sVWS4BWLnrvkQ
         W1MMdwgLTtAynmnIyDQAcfpQ7ofcAxjl3FnCyyoYC0z3T32hNFdyTHj5mHbPMpXGgpX6
         kyNGYlELFbmJ3KjdYSaligtf6d5Z6gVLbLnxuWGhm3JgfpGLDEyNKeYtUAnNdPjsef74
         3ygJu/AMGQG2mQD62LbmdR6bxaEkBOPD+Ots0BFjc/gvI4cl8+GCN9JnAmZYgCRIYMdb
         lJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316676; x=1731921476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgzDV6XTYtXT/ZAEBGBUP7h48Bysqg7RCg25yVB5U/k=;
        b=mfn44LXasE/c4JYgjNbdF4c7ojlPMQpuo40EiAwI7hgTq+TkxHaV+hoJNwlLrM+X9L
         1s/10KXDTkaxsfdF1ONCPVXRy6MfMNzvm4jT9OBlL4nQFeyX28Y3baKJXKFq5V/vxzFV
         TH137m32fXrw98wTx1X1TYsqYj0FLcNwZcxSFuB32gY0Ly721cheMytCNDj3d++uzEVj
         /9Vz8/sNBKxpLG6sfQtsH8gcErfJo0+e5i6gHs5XSEdgfDcOxW7l5g0RZK1o2ev45GTF
         zfGNxFAVCD1sVyTAygqD+tbWfS0s7yDqvaFa0auly6T7+fTEs1WQN/5fZWJWfwtPhV+y
         3jEg==
X-Forwarded-Encrypted: i=1; AJvYcCUxvS0tYSeCdbSZj17ikdRmXaW+k/7qabjD5NTrVToSOxNyK8SNthxAT38LuNTc85piGwWihRY1TDvwONurdgFi@lists.infradead.org
X-Gm-Message-State: AOJu0YzCIJZyCQlySPUjpZew6SKDWQ3pK8NTYlLEX6PFxjdWkMfvB22z
	lVJQIP305aXn3M4Hku0p9XDNcqCMXPJS7nnSg27F8yQLv5CQu4oJ
X-Google-Smtp-Source: AGHT+IH5XF4fHujuj+ksffR1RtxhphO0REZBT78S9uIbUEfLxCgT7hRETIpEKjykIRYtuUK5CY8I6Q==
X-Received: by 2002:a05:6808:16ab:b0:3e7:5af4:f8e7 with SMTP id 5614622812f47-3e794680de1mr10057389b6e.1.1731316676277;
        Mon, 11 Nov 2024 01:17:56 -0800 (PST)
Received: from [192.168.0.101] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5bab50sm6863158a12.25.2024.11.11.01.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:17:55 -0800 (PST)
Message-ID: <cb718d0f-75a5-4720-b0c1-d8fb1f1c653b@gmail.com>
Date: Mon, 11 Nov 2024 17:17:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
 <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
 <9455e2f6-b41d-476e-bda9-fc01958e48d5@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <9455e2f6-b41d-476e-bda9-fc01958e48d5@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_011757_849229_548CFE19 
X-CRM114-Status: GOOD (  13.00  )
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


On 11/7/24 21:18, Andrew Lunn wrote:
> On Thu, Nov 07, 2024 at 06:31:26PM +0800, Joey Lu wrote:
>> Dear Andrew,
>>
>> Thank you for your reply.
>>
>> Andrew Lunn 於 11/7/2024 2:13 AM 寫道:
>>>> +  phy-mode:
>>>> +    enum:
>>>> +      - rmii
>>>> +      - rgmii-id
>>> The phy-mode deepened on the board design. All four rgmii values are
>>> valid.
>> I will add them.
>>>> +
>>>> +  tx_delay:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Control transmit clock path delay in nanoseconds.
>>>> +
>>>> +  rx_delay:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Control receive clock path delay in nanoseconds.
>>> If you absolutely really need these, keep them, but i suggest you drop
>>> them. They just cause confusion, when ideally we want the PHY to be
>>> adding RGMII delays, not the MAC.
>>>
>>> If you do need them, then they should be in pS.
>> I will fix it.
>>
>> We have customers who use a fixed link instead of a PHY, so these properties
>> may be necessary.
> That is a legitimate use case which can require the MAC to add delays,
> but i generally try to get the switch on the other end to add the
> delays, just to keep with the uniform setup.
>
> Also, please take a look at ethernet-controller.yaml, these should be
> called rx-internal-delay-ps & tx-internal-delay-ps.
>
> 	Andrew

Thank you, sir. I will use rx-internal-delay-ps and tx-internal-delay-ps 
instead.

                 Joey


