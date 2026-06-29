Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84B8C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTD44WdJSK3FZpGp1YBqkIsU4pLxtym31A5/dbuPSIk=; b=a4mEHW6DbkL1pAIAWl9ni62MIs
	NPsrla2pBs08cTv9+JybziaSEVIFudekUn26rueFsG0weS3YH1UjILYTI6+A4SVdt58wn1aSQvbeh
	0sr+GhlgRUWO1jwvtnWZCwpyNVudOAiAiesL8I/IdNvxli5OBOmeptyAR1WPhQ8IBIVr0npAhhvgt
	tLxebfmUdLs7brAPpBzopsq8lvpUINMZwZ7IFuReSovjpZg3/BQbAOvUzmJpoRbomwRBoDZz23qW8
	EDJIB9YsauC0vGXVLS8Nd3y24v1hm57RHCJ4Hqr80WbTLeeLVWxi+d5V6k7uYUacJGUQ4PeXgvd2n
	FBUYEtLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8bO-0000000EEz3-2mgL;
	Mon, 29 Jun 2026 09:48:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8bL-0000000EEt7-29C0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:48:29 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ca15944645so1575185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782726506; x=1783331306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zTD44WdJSK3FZpGp1YBqkIsU4pLxtym31A5/dbuPSIk=;
        b=geNeZl7nJZ4deAMpho6SJBmBIZDEa/5JpEiV6UhkCwZM81oxnWDyRL7Ny3+9Ox9Opb
         vx7YhkPSXaj6WgONnYwNyCbEfP+ejpHskQ7p9QtYnT03qLx3m4/4rcyiBMe1KYYQASYk
         OYcopmPJ4zuNwN86YA5D3A5JXGTHihMUnn6wWJXsdLQMIgZMlhyVrOpIVWVJjum0dr8F
         Jf9FEFzz+BTOD1Oe7sccdobADCmUjyKIgrY3Mxxn97tlG8f0/MeYjCU8EAGiFvOxSkho
         XyjHXX5f47SlPkSuSuRLhWBxFOyTbXZehyktSzp75vyD4yEmgVfPV0tQNbT+XL/Zm6gj
         +miQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726506; x=1783331306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTD44WdJSK3FZpGp1YBqkIsU4pLxtym31A5/dbuPSIk=;
        b=izmiIQqIL+3sZ8ewVBj8evYbnKkBGOI09JEtMoTpNgKVosRQsH1/Q0nhxCSUrXpeGJ
         udViQaXXvLc/paT7uM1xgrZBlj55DG1L1KLVLyWO+UsdcKl662DE3S4TstTTG0E390g6
         +l76LaPvYdUVhk7rzw2cdmCnjGy8cOZPhcO3KFf1YW0t4rUBGsWuJFJQFdCs+f2vq/Te
         l6cuHLJw31I4le3vP4S4NESNtWVBufy+QLIUG2Ty096L22odu4fn2uLvdx5j0DsLMk/s
         oxZF3twtntGZ2tYfT3coP7NLe+mknYixVnNV7VURH1qGCfj7nKZyg2FLUz6S6J2bl8pr
         VsDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqszDhPk/RGCoNIa1FzO9SacpHO8nC9KjTHeUL+WoOlbh55vGyNPxmpt+SW/KvoWZltLNFcyWvGdMthUfqD/k8p@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv4Jqp5XKNTExQv8t62UE7INjd4B8qkyBhLQ4otlSZpTsHtrt1
	Caws6YED3tnXGb5XI3kRSfIK38hNvxomTNLZRHsrTk8S4t1Q3M0ntgcS
X-Gm-Gg: AfdE7cll12dph1pdBBzz/D8ZNKnBHbPav/yeC0VghzAJnRX+FjZ/0fJaRGuTK8aGK1G
	r0JVZ362SyfFaFQpamCldS/fYDnD13RQ/pHvryZGqbSBf4UnME6dyWjs3qQFjSdf9pFilnAzKyK
	+k34yo8WZlS+b5SkSdmUdsUhit8PpK1lyr/oi6sNQ8pGGU4GCmVWCDVy1MwMv6+aW6+UsCSh+z9
	My518Z78T0VbKgkdyZzrLgKGx11N8YoZBQdb8RvyE8DOOfnmjMDKqf3n3P60r5Y4iU4ofuhad9y
	T2n60j1MaX/zXoeB0Lfkmj3rAhqB9A4Cx3j8s7USaoBCRbMWmfGWeqV+eEycedICkmZuhkoGXHe
	pPzRuoweK39ah++9NXcaJISPDrwNsqNRQ+B/dz8O2ULWeAm2Lu37qVu+kTVJKzIQ5cBoelNBYiX
	pVxnBP67VBdRidcseSCENmT4u42vuXiHa+3XjCvJIJ8EtLfjvssS9G4FvKqnE8A5vyTg==
X-Received: by 2002:a17:902:f612:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2c98549d2a7mr85863555ad.4.1782726506210;
        Mon, 29 Jun 2026 02:48:26 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5af8a07sm88963245ad.25.2026.06.29.02.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:48:25 -0700 (PDT)
Message-ID: <df86d371-2994-4f33-80fe-36509054fee3@gmail.com>
Date: Mon, 29 Jun 2026 17:48:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: nuvoton,ma35d1-reset: add
 simple-mfd and child node support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-2-a0987203069@gmail.com>
 <20260625-striped-demonic-jerboa-502afb@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260625-striped-demonic-jerboa-502afb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_024827_692327_B4D46043 
X-CRM114-Status: GOOD (  19.57  )
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


On 6/25/2026 3:51 PM, Krzysztof Kozlowski wrote:
> On Thu, Jun 25, 2026 at 10:39:55AM +0800, Joey Lu wrote:
>> The MA35D1 system-management syscon node hosts the USB PHY register
>> block at offset 0x60.  To model usb-phy@60 as a DT child of the syscon
>> node the binding must allow:
> Explain why do you need child node. If you have fixed device @0x60, you do
> not need DT child node at all. Compatible implies that child existence.
The commit message will be rewritten to state the motivation: the USB PHY
register block at offset 0x60 needs a referenceable DT node because consumer
drivers (dwc2, ehci0/ohci0, ehci1/ohci1) look it up via `phys = 
<&usb_phy N>`,
which requires an explicit node with a phandle. Optional per-board 
calibration
properties (`nuvoton,rcalcode`, `nuvoton,oc-active-high`) also need to be
expressed in DT.
>
>>    - simple-mfd as an optional third compatible so the MFD core can
>>      instantiate child platform devices.
>>
>>    - #address-cells and #size-cells (each const: 1) so child nodes can
>>      carry a reg property.
>>
>>    - An open child-node pattern (patternProperties "^.*@[0-9a-f]+$")
>>      to pass dt-schema validation.
> No. Do not explain what you did - we can read the diff. You must explain
> WHY you are doing that.
Addressed above.
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/reset/nuvoton,ma35d1-reset.yaml        | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
>> index 3ce7dcecd87a..1fda7e8f4b5d 100644
>> --- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
>> +++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
>> @@ -19,6 +19,8 @@ properties:
>>       items:
>>         - const: nuvoton,ma35d1-reset
>>         - const: syscon
>> +      - const: simple-mfd
>> +    minItems: 2
>>   
>>     reg:
>>       maxItems: 1
>> @@ -26,6 +28,16 @@ properties:
>>     '#reset-cells':
>>       const: 1
>>   
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 1
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
> This must be specific.
The `patternProperties` key will be changed from `"^.*@[0-9a-f]+$"` to
`"^usb-phy@[0-9a-f]+$"` so it matches only USB PHY child nodes, 
following the
naming convention used by existing vendor bindings.
>> +    type: object
> Missing ref and additionalProps. Please look at other simple-mfd.
`$ref: /schemas/phy/nuvoton,ma35d1-usb2-phy.yaml#` will be added under the
patternProperties entry, alongside `type: object`, so the child node will be
validated against the PHY binding schema. This follows the pattern used by
existing vendor bindings.

Thanks for review.
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -43,4 +55,3 @@ examples:
>>           #reset-cells = <1>;
>>       };
>>   ...
>> -
>> -- 
>> 2.43.0
>>

