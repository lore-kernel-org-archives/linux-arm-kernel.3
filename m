Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96210D3E787
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkraiRUrks+s5pcHcVdDbNI0v0htZdI4Vc5A2KCgS+Q=; b=bnz96v02ytFAGD3jCazD/XyRBj
	vWHO5D+mQ/xRzem6MBorb/6xhoQe8OD7gcvpCExnwKyBCfT7LJIDLmE/X9tcGrP1uuLYLnp4ogu8u
	PVHssbInqq0AmUg1QVQfhDhId4dXBzxAcG26Uiq5j1CikuScYS/0CRc5PQ/0mPecjsFne0Qa9/lGl
	ruFPZvwg8oHNxEiAGCqeUh2lU7aP/XFiNPHL5U9kX2YtKI80VWylqFMEKqeg5tzZJd9vWqrzDBD6Y
	kXCO4tkzK5sYd/IYZDb9unrZt3kowo8d2iVaNwk8vCUvgH0dsBb8JSJ9giCKL+N5+FxaefSfcFPKA
	/IyBvGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zts-00000006Vcg-37mL;
	Thu, 07 Nov 2024 10:38:04 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8znX-00000006Tvn-3L96
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:31:32 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e681bc315so604354b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730975491; x=1731580291; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YkraiRUrks+s5pcHcVdDbNI0v0htZdI4Vc5A2KCgS+Q=;
        b=XTkMVf/dufCHDo8K8OmNb04GyzIlDFUeeBAIlrg7gZ2/6VSj3no9MctrQoJOdZy0Kl
         jds2/sQw0OksX6monKP2HC47/p+fSZvlj1jLayXo4VZKepXTcScv7JJ77d/1DgEgJBB8
         VDcTOFKxl3gmeuSelks9PbN4Z8YznDaiO4y9L/PYyhoLp9EoqhuNJyMCV2SEKKvSE0T9
         HZJD/oKoZLC3ZZS4rF56ajma4SBqqc1buK18IyeMIoD5gweIV/2SlpPp3cf1zaG99kl2
         +4Q5fmxRTW4UhBcWBWPlkzL/kX82pyST21PNsf8tFTsBRzTcu1XWyjC8EBM5yMApRsRf
         +oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975491; x=1731580291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkraiRUrks+s5pcHcVdDbNI0v0htZdI4Vc5A2KCgS+Q=;
        b=pMXOiACVnYTfvUWOAtH80zUpi+qEAMPbjTtecow1lA5OWi8UAv8a8meDEA8kklILzi
         Mo6cC1uGAi/eI9puwyZwQQa9VdwPqTXEDRbjpODYqn1xWGuR1GXwa/LrXBxpVSyHjedH
         2bQVM5BikHkgIe0x4HutCkp7qSiopVdFvpTqBfORffl+tTvCAN+9ORjNu2KFAf1OKh9j
         chuaajVbAz+s0S2MQ0r6MvqEI3eTGMjYkTjzrwkKc+H+VvgVyQ9/gB5+Z1neQj8tUvhL
         Mo1SLZsn5cVmxvyxFjnyYxb5rO+29TNMZM58jfbtlpBXj4VTPQGdYb/BWpmuUpLKQLWL
         zRRg==
X-Forwarded-Encrypted: i=1; AJvYcCX1cgibywmhgWGukb2Z4zDspX0U3ciIgf41K4nYFqJRrHRuJVgFDn+XAPfitfZxQ8A43lHT5FZnpi3iNbf957PN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7BCUQPiz7LChdOUCprwLONvevHsuLCbQosBom5G45/RCusqrY
	SXW6w62OA3X2CY3czMlGosdMDEATCQnyKM50n+j5EBoh1EbmkPyl
X-Google-Smtp-Source: AGHT+IGNwXAlJHaBXrnsGeXwGA4utGjnJr02l8IicuB7Vk/ooEjnqYAWwWmqFY6U2v0+nQynuABSkQ==
X-Received: by 2002:a05:6a00:3ccf:b0:71e:60d9:910d with SMTP id d2e1a72fcca58-7240c8b7bbemr916513b3a.6.1730975490635;
        Thu, 07 Nov 2024 02:31:30 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078609ddsm1196578b3a.22.2024.11.07.02.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 02:31:30 -0800 (PST)
Message-ID: <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
Date: Thu, 7 Nov 2024 18:31:26 +0800
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
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_023131_855775_BB3A5EA1 
X-CRM114-Status: GOOD (  10.39  )
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

Dear Andrew,

Thank you for your reply.

Andrew Lunn 於 11/7/2024 2:13 AM 寫道:
>> +  phy-mode:
>> +    enum:
>> +      - rmii
>> +      - rgmii-id
> The phy-mode deepened on the board design. All four rgmii values are
> valid.
I will add them.
>> +
>> +  tx_delay:
>> +    maxItems: 1
>> +    description:
>> +      Control transmit clock path delay in nanoseconds.
>> +
>> +  rx_delay:
>> +    maxItems: 1
>> +    description:
>> +      Control receive clock path delay in nanoseconds.
> If you absolutely really need these, keep them, but i suggest you drop
> them. They just cause confusion, when ideally we want the PHY to be
> adding RGMII delays, not the MAC.
>
> If you do need them, then they should be in pS.

I will fix it.

We have customers who use a fixed link instead of a PHY, so these 
properties may be necessary.

> 	Andrew

Thanks!

BR,

Joey


