Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A80EB7EA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VF2q2iw+ZiKGJt45rPpIgu/gs74haGCfE/ZxGBpnps=; b=bqTXMFoxJ6IKURa+hLobTlCzaR
	RzzHkBrOjQEpMkEiFZozwQlw5PTUYLbWpJDEqv3G5hfubecns0s6zaiXMMxhL7MRnbv9GImqQwLU1
	zrIZQfZiPhgS3Gk07d1U8DTpWkVxiWj4OkFtUDTiPpgXLmkAGmdjbfkZaF94IJpWk7YL9s26CByDR
	yRZZiXrqivddDkSPLLhnEWNJh/Hg5knbrq8MwxNMwiL7auxzlTNmxJfFXxjHpX4w7qQ9AFahBOyf6
	UPN9WXupDQvm9VnwI5AahxQVdXWCx5/mX/xIVF/am7xNJn0zpBWvg+Jhi++iybUkZ7wpp0ci2fcyN
	Aehp7N2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhWX-0000000GjlT-1C2B;
	Wed, 04 Mar 2026 08:24:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhWW-0000000Gjl6-2cZJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 08:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1VF2q2iw+ZiKGJt45rPpIgu/gs74haGCfE/ZxGBpnps=; b=ht3VbnANAZDTQbwLHHd3U7PbgK
	Bk4Je5Mm6jBOhdNr6me8UQeqW2IiMaEyFIf+2rK6M4An7dKrugHlfGB6RWAFdbNJdBZOte3LnR54w
	mdz6PleEGjfhHKL3dOhEC9yiacBZYZqsJq5hF2yzk9gdaL7tY6MEC53qBIPi3p6DMnm4MDnUFsXo6
	W9VneRfvz7DNTXNe+je7sm8mAH1eX94AEGjtWdM0EjHBUP9sfeLlXYCQOVfOkZcsV2qDW+pB7t8wD
	ZfJGABSk2+cGi5gYJX8XIu9M9Z6Tax6GNJ7XRpvYiWDAcZ7JTx73uegcTTSi7IOorIDusFYK8fn2g
	Y4QVWEYQ==;
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhWS-000000047Ws-06gD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:24:01 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-89a1d7cc7f0so587046d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 00:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772612638; x=1773217438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1VF2q2iw+ZiKGJt45rPpIgu/gs74haGCfE/ZxGBpnps=;
        b=dIbjVZBnslPNHpXamFt0EnMLAm43/qm6Hf+JvfF5x7wkhD8ADjXISrHjFJAcW0PliS
         3M0G2xP+XxgGLDXw8PWRYRXqp6umpFzLvkUagXTacBd8OII434r5wdo1sK+7HcWHVG9w
         6RybX/ss6Fd10RghTYwR0G3UrbBlAWc0XJ9MkiONJpHvR7wBiYdcieefMTrj+HIKCCs4
         MHEgGU45ALYJrGIDZ9zYlQpBTUy1PYmjTk6dXrKxO5yRVomqoEhbVNzaMCqwgToBE6x5
         LKTYY6wbY6MFGo45g3f6Tqy2jwwXfCYQl4bhjBKxMlohx2z5PgXK/+E9x8tx1vAhJH8m
         slDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612638; x=1773217438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VF2q2iw+ZiKGJt45rPpIgu/gs74haGCfE/ZxGBpnps=;
        b=mGsRCWUWHOU/0oQIlbF86zDOzYR5tJ6kHaZH7KNnS5R9NttHscso2eItmXCb+d/m8G
         Y79vEk4AXw+pzI5J3nZUMAbuehMqoEgxiBU/YPHH3DQFqcZhxhHOzg2W2r2Cwq+LVGZI
         5A67EMyd+vQqyGb0uSZ1hVzTfVyZWHbxA58BpqwKvcpJc7KsztCsDBmTPxvPCCOyxJLB
         cIYyGwy/vz94H0ipbcUtW0axOfo55cZ0VjpnvoDoNE86bQczIgXjM40ZHAPUtqIrOXkQ
         xfOxt6cBQYugcbTsreZTvA6sot5Jzv4a8dlEVTGNhKNqBLzlqcRgn9/hx8+YSkPtyj4y
         zaRw==
X-Forwarded-Encrypted: i=1; AJvYcCWWfJ1BpCSANzhW7m5R5pKP6g1fcUWwKEpZvY7KUNAwyCv7zw/OCGEWkJZH4HZPAIuRHqh3jJWJAP4N9Rd01Urm@lists.infradead.org
X-Gm-Message-State: AOJu0YwfLPLnPipR/QFrvw83SHfVyP5GB4aPwsk9+cy5Fh4zRLehrrn0
	GDH9vdAw9TI8Z5D6+usGJ+K8D1QOQg/LxnX6ZAWpM3oJMnoUggnlvlxa
X-Gm-Gg: ATEYQzxsnJbuCUXozwXM4RiikdLvF1f4vCX9tSXyXrxMAwUQ6FLH8UWUsskSLYgIydO
	pj/oAiBONjp3vBZgH6I01aAO1tJLleOAmRodnYowI7yLgTOEDXgOMTNrA+vtW0s5WRJuewK0EJc
	z82JZwcuxWExT+dT7YShHuBdR9tojw5fElx57l1QeFk8tHdWuzzSEsuUUu6k/vEAq8T1HtvjmcM
	goOjFIqYmfYGuxIRuj13LIPyHBLpbZYCBEfkj0lWcGSPmf9IqJ7nGkOXGpQoBwTFCYBPv1nDQFm
	Cvu+gJ58dpoxvIcum45KrmtqKCCxZzoHA6Bxer7aq1QKtOGRaqPK90ndzcW3/jqnAeI/LI7IhQJ
	EkMofJy5trjt/fkwni6ClA4WnusWF70xQgEgXeknKZBN/Xf6H7C6i52ywkmKY7I/WugJdWEkD1m
	0n/8X3WDxsTt/5ENKzmGeBHqJZ
X-Received: by 2002:a05:6214:252f:b0:899:bc85:7b68 with SMTP id 6a1803df08f44-89a199a8921mr12167536d6.16.1772612637696;
        Wed, 04 Mar 2026 00:23:57 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a0fbdbcb0sm31329776d6.45.2026.03.04.00.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:23:57 -0800 (PST)
Message-ID: <3aba626d-7b5b-4d5b-9c91-07f6a2d7c244@gmail.com>
Date: Wed, 4 Mar 2026 00:22:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: ethernet: eswin: add clock
 sampling control
To: Krzysztof Kozlowski <krzk@kernel.org>, lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 weishangjuan@eswincomputing.com
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260304-hot-sponge-of-emphasis-6864db@quoll>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260304-hot-sponge-of-emphasis-6864db@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_082400_216250_0EFB7B81 
X-CRM114-Status: GOOD (  29.97  )
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

Hi Krzysztof,

On 3/3/26 23:44, Krzysztof Kozlowski wrote:
> On Tue, Mar 03, 2026 at 02:16:37PM +0800, lizhi2@eswincomputing.com wrote:
>> From: Zhi Li <lizhi2@eswincomputing.com>
>>
>> The second Ethernet controller (eth1) on the EIC7700 SoC may experience
>> RX data sampling issues at high speed due to EIC7700-specific receive
>> clock to data skew at the MAC input.
>>
>> On the EIC7700 SoC, the second Ethernet controller (eth1) requires
>> inversion of the internal RGMII receive clock in order to meet RX data
>> sampling timing at high speed.
>>
>> Describe this SoC-specific difference by introducing a distinct compatible
>> string for MAC instances that require internal clock inversion, allowing the
>> driver to select the appropriate configuration without relying on per-board
>> vendor-specific properties.
> 
> Pointless description/paragrapgh. Your explanation why adding a
> compatible is "because I need compatible". That's completely redundant.
> 
> Explain what is special about this MAC instance, what's different in its
> programming model or other characteristics that you claim it is a
> different device.
> 

I think ESWIN should improve the description/paragraph and properly doc
the timing issues discussed here:
https://lore.kernel.org/lkml/32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com/

I do feel the need of using a different compatible, though. I think we
discussed in depth in that thread (link above), and advice from Andrew

https://lore.kernel.org/lkml/59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch/

https://lore.kernel.org/lkml/bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch/

is to basically apply different parameters to MAC based on eth0/eth1. The
compatible string approach is a clean solution to achieve that. The reason
being that for eth1, there's no way to meet the standard without clock
inversion, given the vast internal clock skew. I don't think claiming it
as a different device than eth0 is that far-fetched. Hence, no need for an
additional property and the driver code to check for that.

>>
>> The rx-internal-delay-ps and tx-internal-delay-ps properties now use
>> minimum and maximum constraints to reflect the actual hardware delay
>> range (0-2540 ps) applied in 20 ps steps. This relaxes the binding
>> validation compared to the previous enum-based definition and avoids
>> regressions for existing DTBs while keeping the same hardware limits.
>>
>> Treat the RX/TX internal delay properties as optional, board-specific
>> tuning knobs and remove them from the example to avoid encouraging
>> their use.
>>
>> In addition, the binding now includes additional background information
>> about the HSP CSR registers accessed by the MAC. The TXD and RXD delay
>> control registers are included so the driver can explicitly clear any
>> residual configuration left by the bootloader. Background reference for
>> the High-Speed Subsystem and HSP CSR block is available in Chapter 10
>> ("High-Speed Interface") of the EIC7700X SoC Technical Reference Manual,
>> Part 4 (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf):
>> https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
>>
>> There are currently no in-tree users of the EIC7700 Ethernet driver, so
>> these changes are safe.
>>
>> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
>> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
>> ---
>>   .../bindings/net/eswin,eic7700-eth.yaml       | 75 +++++++++++++++----
>>   1 file changed, 59 insertions(+), 16 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>> index 91e8cd1db67b..22d1cecea07e 100644
>> --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>> @@ -20,6 +20,7 @@ select:
>>         contains:
>>           enum:
>>             - eswin,eic7700-qos-eth
>> +          - eswin,eic7700-qos-eth-clk-inversion
>>     required:
>>       - compatible
>>   
>> @@ -28,9 +29,13 @@ allOf:
>>   
>>   properties:
>>     compatible:
>> -    items:
>> -      - const: eswin,eic7700-qos-eth
>> -      - const: snps,dwmac-5.20
>> +    oneOf:
>> +      - items:
>> +          - const: eswin,eic7700-qos-eth
>> +          - const: snps,dwmac-5.20
>> +      - items:
>> +          - const: eswin,eic7700-qos-eth-clk-inversion
> 
> So just enum for both entries?
> 
> Anyway, that's the same device, so you do not get two compatibles. This
> should be a property. Which property not sure, maybe all this was
> discussed already.
> 
> 
>> +          - const: snps,dwmac-5.20
>>   
>>     reg:
>>       maxItems: 1
>> @@ -63,16 +68,29 @@ properties:
>>         - const: stmmaceth
>>   
>>     rx-internal-delay-ps:
>> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
>> +    minimum: 0
>> +    maximum: 2540
>> +    multipleOf: 20
>>   
>>     tx-internal-delay-ps:
>> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
>> +    minimum: 0
>> +    maximum: 2540
>> +    multipleOf: 20
>>   
>>     eswin,hsp-sp-csr:
>>       description:
>>         HSP CSR is to control and get status of different high-speed peripherals
>>         (such as Ethernet, USB, SATA, etc.) via register, which can tune
>>         board-level's parameters of PHY, etc.
>> +
>> +      Additional background information about the High-Speed Subsystem
>> +      and the HSP CSR block is available in Chapter 10 ("High-Speed Interface")
>> +      of the EIC7700X SoC Technical Reference Manual, Part 4
>> +      (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf). The manual is
>> +      publicly available at
>> +      https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
>> +
>> +      This reference is provided for background information only.
>>       $ref: /schemas/types.yaml#/definitions/phandle-array
>>       items:
>>         - items:
>> @@ -81,7 +99,9 @@ properties:
>>                            or external clock selection
>>             - description: Offset of AXI clock controller Low-Power request
>>                            register
>> +          - description: Offset of register controlling TXD delay
>>             - description: Offset of register controlling TX/RX clock delay
>> +          - description: Offset of register controlling RXD delay
> 
> As pointed out, you cannot change the order and there is no reason for
> doing this explained in commit msg.
> 
> Best regards,
> Krzysztof
> 

Bo


