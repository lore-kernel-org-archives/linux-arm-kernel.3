Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690B2CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwyDMGKhrQUUcZw1khziLYF4shBI37cIxufrD9bOvf4=; b=QXeOL2KCOQd/HelF3OJhgcNbDE
	zzzEeAYa5w78JvBIE1hxL3GXw+4vQgkudsY5T6NFKi1C1fUaqWN60Yvmav/dNXej+mbXY9q2fbAIM
	XXL6fD+4mu7XYJ+VdYJGt3oYwrhikeUPSl1u33113L/IZMipuNoCOB2fdpG7yaP7w33GhxM+V1i4p
	t+m100X1NPyTSbwawTEaPz7PwzmemMoJfLvr6boH/L+TP1P7+lwgmqQSi7HaPGNdORUJt1ScNXBtu
	ztPz3pSmIjlG4WVE4mbXE6ybZ9h+X93B9O9KpO4zCzJflP2uDNOXRNoZe3GkQObxThM+5dcrMUTLw
	C4b9Fu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDOFQ-0000000Ezzz-3xH2;
	Sun, 04 Oct 2026 15:35:32 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDOFN-0000000Ezz1-2csL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 15:35:31 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1728d8dfcso212755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 08:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128127; x=1791732927;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwyDMGKhrQUUcZw1khziLYF4shBI37cIxufrD9bOvf4=;
        b=lBd05v71vmXERYouolWCJsH7tlgJJxfqNrBGeueDC//VMgKwMUTC82IFOQktnm9JPF
         Ke9j5YXKv9toZRfwBUTANIvoFT+4MRgiOkTX9Bb9Syk2LGzNLpzTI4GubpRW4zAyLsJG
         fVxz5wc7f/0Qe4xWunUw2yGVrYxJOeX+EjXZ1R7geN8kNSqn0DJ2D6np/o1DRFRGkLy8
         +kQk7mLbwC/o1UcPae1WpURSGLbdDfsfUmitphGnX8MqbGXYMegcjb/4Ziwj5oty0AO+
         zxTkmWU1p3+KA+zEEUo1DWnuzrRGbJT+gwGgKdBwkorwyND1miF2tGOiQ13BUCts8/xJ
         m25A==
X-Forwarded-Encrypted: i=1; AKwUvByN3QRbEMa450XTsu3ec5gDxmKyL0ORPirhC5NwwYOxDEB8+YCuqcmNzLgtezcPoRcmY5eUtra3edcCzDVb824N@lists.infradead.org
X-Gm-Message-State: AFuF++kCD/krkyAbRUsoIxzsSRa10Omv9/VOIILdl7RuCOEAQ/l1DWxZ
	jMFwB3dv0JaCucBsjCbF1RU5xsViBsv7+de6XTWEIFfypdukbjzUeV7W
X-Gm-Gg: AYBFou2YZp9dpIU9/xLXrCfzcKTTUO4ANIy8vDUQWySYvY2eFoiafle0Tcc+29hiA7x
	cvYTG08Yz/j40tCKsHw9CYW6WT2nH1XmbRPUmT+hlAKXapcN3xP6uJafJBRYXZmMwPVkiUHKnrI
	GsOxTZ2CKI3jenV3x2nmDM1sAfmYcdA+dnqIiw/mrCIV7FGhwuNAZP1+bxNIwWyFK0OZTxkC1w7
	LJ1b1N/mTL/5QX1LfBKUQPNvmeQF3Wv4V1hGc1BQhZAMnXLt9kjRF/299Hnvowbl1McRUbocVBw
	O/4tZRGskdB+bBkLtwNPnj9ldzZ1AOdFenBY/UNiCwZid465+/y42YyqyaSCRVUcHnm/RkRzVQE
	4VfutPNw62+mJon85kFPcC44dFd4O66bmi3Jwkn+vMaE8jPUtU7alOd4YPlH9CCClpDSpsx0n68
	bunt36gzh562i8Ztg9KcJd4rJkfdq2uqahXcwh1EVSGyhOpGaCADt7e1TbSCeIy4db+7U5h4Uq9
	JeO3E7uXOJxJRXgJiAeO9wrpr+O
X-Received: by 2002:a05:600c:348d:b0:4a0:c02:938c with SMTP id 5b1f17b1804b1-4a1680f405fmr76449125e9.25.1791128127431;
        Sun, 04 Oct 2026 08:35:27 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm310617265e9.1.2026.10.04.08.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:35:26 -0700 (PDT)
Message-ID: <54b064f8-8e01-44da-be40-4125620ff9d0@linux.com>
Date: Sun, 4 Oct 2026 16:35:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: net: meson-dwmac: add T7 support
From: Lucas Tanure <tanure@linux.com>
To: Conor Dooley <conor@kernel.org>, xianwei.zhao@amlogic.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-2-319d3c19b4b2@amlogic.com>
 <20260924-stinger-stoplight-7c327c3225fa@spud>
 <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
Content-Language: en-US
In-Reply-To: <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_083529_697675_BB49F098 
X-CRM114-Status: GOOD (  21.90  )
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

On 04/10/2026 15:06, Lucas Tanure wrote:
> On 24/09/2026 18:21, Conor Dooley wrote:
>> On Thu, Sep 24, 2026 at 05:51:09AM +0000, Xianwei Zhao via B4 Relay 
>> wrote:
>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>
>>> Add the T7 compatible to the Meson DWMAC binding.
>>>
>>> The T7 DWMAC controller requires the following compatible combination:
>>>
>>> amlogic,t7-dwmac
>>> amlogic,meson-axg-dwmac
>>> snps,dwmac-4.00
>>>
>>> Add a conditional schema check to enforce this compatible combination
>>> when amlogic,t7-dwmac is used.
>>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>>   .../devicetree/bindings/net/amlogic,meson-dwmac.yaml    | 17 ++++++ 
>>> +++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson- 
>>> dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson- 
>>> dwmac.yaml
>>> index 5c91716d1f21..b529ca5577a9 100644
>>> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>>> @@ -23,11 +23,24 @@ select:
>>>             - amlogic,meson-gxbb-dwmac
>>>             - amlogic,meson-axg-dwmac
>>>             - amlogic,meson-g12a-dwmac
>>> +          - amlogic,t7-dwmac
>>>     required:
>>>       - compatible
>>>   allOf:
>>>     - $ref: snps,dwmac.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: amlogic,t7-dwmac
>>> +    then:
>>> +      properties:
>>> +        compatible:
>>> +          items:
>>> +            - const: amlogic,t7-dwmac
>>> +            - const: amlogic,meson-axg-dwmac
>>> +            - const: snps,dwmac-4.00
>>
>> This is not how fallback compatibles are described.
>>
>> Instead of doing this, which affects all other compatibles in the file
>> by allowing dwmac-4.00 for all devices, please do this the normal way.
>> dwmac isn't special, it's just this binding that's weird!
>> Can whats currently in the binding (before this patch) be largely
>> replaced by just doing:
>>    compatible:
>>      oneOf:
>>        - items:
>>            - enum:
>>                - amlogic,meson8b-dwmac
>>                - amlogic,meson-gxbb-dwmac
>>                - amlogic,meson-axg-dwmac
>>                - amlogic,meson-g12a-dwmac
>>            - const: snps,dwmac-3.70a
>>            - const: snps,dwmac
>>        - items:
>>            - enum:
>>                - amlogic,meson6-dwmac
>>                - amlogic,meson8m2-dwmac
>>            - const: snps,dwmac
>>
>> You'll have to check this yourself against the amlogic devicetrees and
>> see if this is correct, but with this you should be able to add your new
>> device without doing anything special.
> 
> I have the same patch in my T7 work and checked it against the amlogic 
> device trees: meson6 and meson8m2 use the two entry form, the rest add 
> snps,dwmac-3.70a. dt_binding_check and dtbs_check are clean. The example 
> needs fixing.
> 
> Xianwei, from my VIM4: the MAC reports Synopsys ID 0x51, DWMAC_CORE_5_10
> in common.h, so the core is 5.10a, not 4.00. And the controller reaches
> DRAM through a pipeline stage. Nothing claims its gate, sys_ampipe_eth,
> so clk_disable_unused switches it off. My node lists it as a fourth
> clock. Does the AN400 differ?
> 
> I will send my series today so the code is on the list. Not a race: I
> will drop or rebase whatever overlaps once you tell me.
> 
> Thanks,
> Lucas
My Ethernet patches 
https://lore.kernel.org/linux-amlogic/20261004144046.391444-1-tanure@linux.com 


> 
>>
>> pw-bot: changes-requested
>>
>> Thanks,
>> Conor.
>>
>>>     - if:
>>>         properties:
>>>           compatible:
>>> @@ -38,6 +51,7 @@ allOf:
>>>                 - amlogic,meson-gxbb-dwmac
>>>                 - amlogic,meson-axg-dwmac
>>>                 - amlogic,meson-g12a-dwmac
>>> +              - amlogic,t7-dwmac
>>>       then:
>>>         properties:
>>> @@ -93,6 +107,7 @@ allOf:
>>>                 - amlogic,meson8m2-dwmac
>>>                 - amlogic,meson-gxbb-dwmac
>>>                 - amlogic,meson-axg-dwmac
>>> +              - amlogic,t7-dwmac
>>>       then:
>>>         properties:
>>>           rx-internal-delay-ps:
>>> @@ -139,8 +154,10 @@ properties:
>>>             - amlogic,meson-gxbb-dwmac
>>>             - amlogic,meson-axg-dwmac
>>>             - amlogic,meson-g12a-dwmac
>>> +          - amlogic,t7-dwmac
>>>       contains:
>>>         enum:
>>> +        - snps,dwmac-4.00
>>>           - snps,dwmac-3.70a
>>>           - snps,dwmac
>>>
>>> -- 
>>> 2.52.0
>>>
>>>


