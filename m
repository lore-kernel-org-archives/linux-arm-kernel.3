Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D90D49C9E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bL7VWRVbzv/1ns3vcMzexf+AEseL3f6DgUbURN/e+QA=; b=FVmUVIcNKny1OB44v1WAW2Gbrm
	uHUvurr3ZPj/XY105Hw1EdWgZb583JSRB89C2auoPKLY+K4SRWKYCCR7nBZUG0vyi1P/ZvTRW3Jlr
	g7a7kmeQrliHqgfy+9/dfiao70JyrI9mKM4anOub+tqQQtMudozy6KkIyvBoxYoYE2tAecRk7MexK
	biKVQYst8gj4iTZrPGDqHiXL05gsX9hyoB/uS5oXUZQ1hoRFhX6e4YkplQMY5lUw/3PyVcYBdqoW/
	Ph7NnjmFGdB/owjqxQ2n91OngTIRDA5A/+7HN3M+rhsseH0aq+uFqh49Nt6Cx4UrNtjwtWt6bbADD
	EWAXB2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDBp-00000002loI-30qx;
	Sat, 31 Jan 2026 15:47:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDBm-00000002lng-2Ivn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:47:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4801bc32725so22744655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874428; x=1770479228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bL7VWRVbzv/1ns3vcMzexf+AEseL3f6DgUbURN/e+QA=;
        b=ERYUbe5U+IUW8JrWL5qLFowaRrA7CmrPrQYOIA9Y2kOfSBfpcqbvqnNWUt7xegGqKu
         WUn6Tog1OKuRXv5fy7fxgxUaNVNkE9IhT5tFMeVtGLHlbDIwJBTGMqUmVv0PCscCcC1r
         6gTeq3oQclznMe8HKQrdRsGmbICskxcyortVtHJYAWRENGou8Af7PxaRGUviiOBeeeSr
         SFLRzkQ8Ad/EcWQKtvcrT30JGpfM+g7VjglsjPm9bt6gJs0t+rTlbLfVHkZDLYDli8Og
         b3EFdY6HKJ/9vgy0Py4HlC1yLbH6rUbSQAwoXdt0QnEDS31wim33VXofmqXw037FgCmx
         gGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874428; x=1770479228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bL7VWRVbzv/1ns3vcMzexf+AEseL3f6DgUbURN/e+QA=;
        b=PPtgACIZMMJTJ1lKk6eOpGVwUFI0nJFDkXy9SPzjJepQDohKzt0JzEPbgOBge/4RkZ
         QtCzFdvnODkkcqH0hf/0h+sLH9sCLsu5OBQL99OEeB3VjE0+W/0MHW0OSUsLxni/13fc
         YFpO5YBQagSALMaw0B59qJqKMstHK5dgrE2JbrdNo+k5dhRRVBfw1uSQiXA4eO1KqmvZ
         gr+Y4dDlF4tvrUYLBOJJIK/7jrpuEhrsIV/9YzX9w5OGDslNep0oAibKeLVM7RQxYiBL
         lGV6DFapv4nN8by7zWFEvnCpfpwrJ62uPiKWGUXRBPLSskLV3KrvZyVqv5QPAghe4Y+T
         DB1A==
X-Forwarded-Encrypted: i=1; AJvYcCVdXtS2GG0wfZ9qo/Hw/9ZPYdWq9cmSUsQGzDxrtoExGJz4WNcHJrrfs6rJtxUx/5Ea/yFtk1C8L8olI0rE3XW+@lists.infradead.org
X-Gm-Message-State: AOJu0YwvgT1HW5j2HAmTYsfKSQz7NyPPFw8vDUzEhaMobd4789P65Adq
	wvIbYG1m7zOiLY3DkW2z8dU8U/v8VrGvBxT6aeSbuBvSU2tjNrRnp9m+cDfB0wqEBiw=
X-Gm-Gg: AZuq6aIkvWq1XJ9tG9wtcuazK3oyWPq4ml5CjZii5DxHeTY2S5+h9NJMxlsI6k9cZTa
	HhmBfEeTsU6q9nfV7XRJOmSU6B2eywh8l28M6y+rhWbhTyXO6RW2EE80jBwJa9y+OgvJGdQfjDu
	vfdoPrboit+/AXyb4dO1rEp8HAV3Y7M0HTP2/z9O4dviVO2Q7OsbybcQfHj45dBPAa67kffuebr
	6mkCFzs6bpHNjY8TYsSp1NBqXLebTqGdHwA/VvWfhRpz51YCPQ5sqU4bglu0S3vm4Hnz4P6nJUe
	RiwwjyxwFcTYJKR5TWPZcn4M8GrlT7QuhEI9hGIapYXDHHSUX8xHC05N2bpMbeZ6f4loUhgBuAi
	Wv+l/yd3BD4XHsEYX1X67xL5HXKcApt6tOqW8so3MGzSrCdBAvYCSxJOLP72wCVpMz0PubHRnZe
	AtdOL+6W1DsKUSwpQGBw==
X-Received: by 2002:a05:600c:4443:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-482db4a317bmr78541975e9.32.1769874428509;
        Sat, 31 Jan 2026 07:47:08 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2973d57sm40798865e9.18.2026.01.31.07.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:47:07 -0800 (PST)
Message-ID: <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
Date: Sat, 31 Jan 2026 17:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add required
 clocks
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-3-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_074710_609691_04D55CC0 
X-CRM114-Status: GOOD (  21.16  )
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



On 1/20/26 17:44, Alexander Dahl wrote:
> The OTPC requires both the peripheral clock through PMC and the main RC
> oscillator.  Seemed to work without explicitly enabling those clocks on
> sama7g5 before, but did not on sam9x60.
> 
> Older datasheets were not clear and explicit about this, but recent are,
> e.g. SAMA7G5 series datasheet (DS60001765B),
> section 30.4.1 Power Management:
> 
>> The OTPC is clocked through the Power Management Controller (PMC).
>> The user must power on the main RC oscillator and enable the
>> peripheral clock of the OTPC prior to reading or writing the OTP
>> memory.

As this was not mentioned in the previous datasheet versions, the current driver 
don't handle those clocks, and it probably worked as the clocks were enabled by 
bootloaders, I think the clocks should be marked as required and this patch to 
be propagated as a fix along with fixes on driver and device trees.

I'll let DT binding maintainers for the final decision on this.

> 
> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u

Why this link here?

> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - Removed clock-names (led to confusion, and not used by the driver anyways)
>      - Removed redundant example
>      
>      v2:
>      - new patch, not present in v1
> 
>   .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> index 9a7aaf64eef32..847dfb67c6b72 100644
> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> @@ -29,6 +29,11 @@ properties:
>     reg:
>       maxItems: 1
>   
> +  clocks:
> +    items:
> +      - description: main rc oscillator
> +      - description: otpc peripheral clock
> +
>   required:
>     - compatible
>     - reg
> @@ -37,6 +42,8 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
>       #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
>   
>       otpc: efuse@e8c00000 {
> @@ -44,6 +51,7 @@ examples:
>           reg = <0xe8c00000 0xec>;
>           #address-cells = <1>;
>           #size-cells = <1>;
> +        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
>   
>           temperature_calib: calib@1 {
>               reg = <OTP_PKT(1) 76>;


