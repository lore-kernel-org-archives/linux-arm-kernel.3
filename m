Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36785C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 02:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+O5egBgvsUIuHoGJAoHI3ORXx+xU1etkOpoJliWaQik=; b=jciVbWi+/fpQR/yO6HgnKtgYBZ
	dRPUDoXbFAylFhdKWxfUryRIhxAo2nWW9xgjhigN+mhVP7Dm2VblTwqYbf39e3/KwkyjhPRk98Vu2
	7R5xtooS2GZTPHlKuVek8WGOSZh09Wo9kglIu+yiD0TZ/kFIJJQRmhUGsZHstIEbB+AkeC6QVmE1j
	WBp0uxqm+6SoicBw/ZMJnmFq9/23ECtUILCHL0XBZmMMwR7Yz7Zrh1X22vjZoG25L0+AtziasLtwJ
	Ibu5vAEGYZzFDepgqDli0LLxWRfWZqX+fwCzHj48Ve9KGaSlSrjxeH3N2nMfFTQpAOenkUONhciXC
	aEH87nyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8U44-00000000kAK-0vZL;
	Mon, 21 Sep 2026 02:47:32 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8U42-00000000k9r-0UVa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 02:47:31 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db18fe433fso21530755ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 19:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789958849; x=1790563649; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+O5egBgvsUIuHoGJAoHI3ORXx+xU1etkOpoJliWaQik=;
        b=kq361BEw9znYqB7gDRre5V2TeqJ0du3KVwfFdkYGeGZRQfusI3skYBKo2MkT5yxMz1
         ZRn2CE5qbeydH+ErWE2KuxOY5us+LaZKCSw07Uw4NgmvWEzuVHghcEfI8CoW+O9Z51b5
         qN2WObLnwKcQjoiAK6tIBmXUjBfueysHGCA0reiME7LjPzkN6qhLVgg3Ir09Hn8gjkOv
         6Grdv4jooOFlf4V37jwYgYwn9Q4+ySSMf5mdzqYT7qwgbfvIt6rTwp74ObjxVwven4D9
         S+5IwLBq5W19gLBKYC0Nv8TAgLMEvYduU+/Z2AEtxgBm6Wy2HWfT4Ca05naKNckWZzth
         fxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789958849; x=1790563649;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+O5egBgvsUIuHoGJAoHI3ORXx+xU1etkOpoJliWaQik=;
        b=m6nHYs3QVCAPLxOzsN1Yu/LGFWr/nE3nrX88OEj7Loz2SyY8uOMvDPqd/e0yOlWnbb
         ypGDyUCoGF62aRSyfG/j0HApc/BaAor+N+PmvLIV0l/TU83C6pOOMOY5ZWphvxP/mIq1
         kzMS2u26wdpzG+LSBeOuJGFlMbU/FhUN2IlZAixCVC6Dc3dBxT+EhLjtLkCMpItvWtby
         GAo5LZxkEFFHaTcQsloji+y9+8F3BMR/0sMd6CcNbWK4khzNkg9gGYwb0dWrUE3ImHLQ
         vGd8VXR4E8H9DZTXs+z+Ksqoo17ZRa7MBWyuZRee1MVBdUciP+cn0mTApJyz9k17bYRy
         by/A==
X-Forwarded-Encrypted: i=1; AKwUvBzbnVfthPEC1ggQBYxfk2xeWrS3ZkN0fFjokFw7PG5hUfj5DwwyUJzKhgPvPK6xC7Im4wQV0kGluBhBKk5EZ6BP@lists.infradead.org
X-Gm-Message-State: AFuF++nCPGi9WG41R+x5xSnlgF24BlPFkgEsWniSUnKCNeqlrjS/eUcK
	jUSfv3D4I85y3tlgAkW25YuA5Hi6Nt/bCul7fDeZGMBM/Ywxhywnt/le
X-Gm-Gg: AYBFou2PbxCRUZsXbFMDZ1LWrzjFvaasqds1+iYVIj4hVHSj0gPiIhmMjiUmupTOCTz
	BXRqDwF1jikJbGYr7H3J+r7v73xv9Ccy6PSFYFUvrABBwBluC+Vmzkv2WCejdXu/zxmhgyd8CEW
	9VPqqOYoP9g2RubV7Nr1kkep91caZO+he117SFYdFOiUx0iWGBC68w8aOdBDpInwStHStJXZ0+j
	PfXiK9bmJN6/WBvqP/De9bypqYTDyhblBYqzAoWFXSI9jaTNvwXzsHeODavZJ8jZjKOIXKQEjQz
	UI3PwxYpTBdUbjD9+2uOUD0QUDqV+aLKFhQtLWvCHeiu8gbb4hFpj3/UNHPvtcFDyRe3+2zNno8
	m3zvawoooNtTFNMekcKWFMIgOGuhlmZPTlnV5NCb4nQh8rZM6U6sAVBIJDb0G+RIJCvAs/8U6Fn
	ymyDvFCl1MwBJpE7ovXIjLYzunFAW5/KvX3USZ/T9dR8Tl3aYGo5yu5felyyo8r9C0lrYLaFSFV
	i+ZGjwNjPoBX9sQqggtItBhK5NQO26On5q0GTzIIGP6ZnmrH0MrB1w=
X-Received: by 2002:a17:903:2349:b0:2dd:c100:b2c6 with SMTP id d9443c01a7336-2ddc100b360mr85279055ad.49.1789958849031;
        Sun, 20 Sep 2026 19:47:29 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b4a99sm25390025ad.5.2026.09.20.19.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 19:47:28 -0700 (PDT)
Message-ID: <7b5c7095-e086-45de-bdc2-9063e8229222@gmail.com>
Date: Mon, 21 Sep 2026 10:47:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] dt-bindings: display: verisilicon,dc: add support
 for nuvoton,ma35d1-dcu
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
 <20260918030125.315978-2-a0987203069@gmail.com>
 <ea18c92ce2af08a65bfd8834ea7f262d1bcb4bf2.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <ea18c92ce2af08a65bfd8834ea7f262d1bcb4bf2.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_194730_164619_DB6A06CE 
X-CRM114-Status: GOOD (  16.37  )
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


Icenowy Zheng 於 2026/9/18 下午 06:50 寫道:
> 在 2026-09-18五的 11:01 +0800，Joey Lu写道：
>> Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the
>> binding.
>> The DCUltraLite uses only four clocks (core, axi, ahb, pix0) and one
>> reset (core), with a single output port.
>>
>> The MA35D1 clock controller gates the core, AXI and AHB clocks with a
>> single bit, but each remains a distinct clock line feeding the IP
>> with
>> its own rate constraints, so all four must still be listed
>> individually
>> in the devicetree; core, axi and ahb happen to share the same clock
>> phandle.
>>
>> Move the clocks/clock-names minItems to 4 and resets/reset-names
>> minItems to 1 at the top level, since that is the lowest count any
>> supported variant needs.  Add an allOf/if block that tightens the
>> constraint back up to the fixed 5-clock/3-reset topology required by
>> the existing thead,th1520-dc8200 compatible, and another one that
>> caps
>> the new nuvoton,ma35d1-dcu compatible at the 4-clock/1-reset count it
>> actually wires up.
>>
>> Restrict the same nuvoton,ma35d1-dcu if block to a single port@0,
>> since the DCUltraLite only has one output port.
> By the way, when will the MA35D1 device tree sources be updated? I saw
> a lot of drivers being merged but w/o corresponding DT nodes: sdhci-of-
> ma35d1, nuvoton-ma35d1-nand-controller, phy-ma35d1-usb2, rtc-ma35d1,
> spi-ma35d1-qspi, ma35d1_wdt.
>
> Thanks,
> Icenowy
We are currently reviewing several peripheral device tree updates, 
including USB/PHY, CAN, and other related blocks.

Once the core driver support is in place, we plan to do a more thorough 
review and update of the MA35D1 device tree
sources to ensure the corresponding DT nodes are properly added and 
aligned with the upstream drivers.

Thanks for your patience and feedback.
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../bindings/display/verisilicon,dc.yaml      | 51
>> +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index 919a900122012..e1e6a3a953646 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -17,6 +17,7 @@ properties:
>>       items:
>>         - enum:
>>             - thead,th1520-dc8200
>> +          - nuvoton,ma35d1-dcu
>>         - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>>   
>>     reg:
>> @@ -26,6 +27,7 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> +    minItems: 4
>>       items:
>>         - description: DC Core clock
>>         - description: DMA AXI bus clock
>> @@ -34,6 +36,7 @@ properties:
>>         - description: Pixel clock of output 1
>>   
>>     clock-names:
>> +    minItems: 4
>>       items:
>>         - const: core
>>         - const: axi
>> @@ -42,12 +45,14 @@ properties:
>>         - const: pix1
>>   
>>     resets:
>> +    minItems: 1
>>       items:
>>         - description: DC Core reset
>>         - description: DMA AXI bus reset
>>         - description: Configuration AHB bus reset
>>   
>>     reset-names:
>> +    minItems: 1
>>       items:
>>         - const: core
>>         - const: axi
>> @@ -79,6 +84,52 @@ required:
>>     - reset-names
>>     - ports
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: thead,th1520-dc8200
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
>> +
>> +        clock-names:
>> +          minItems: 5
>> +
>> +        resets:
>> +          minItems: 3
>> +
>> +        reset-names:
>> +          minItems: 3
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: nuvoton,ma35d1-dcu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 4
>> +
>> +        clock-names:
>> +          maxItems: 4
>> +
>> +        resets:
>> +          maxItems: 1
>> +
>> +        reset-names:
>> +          maxItems: 1
>> +
>> +        ports:
>> +          properties:
>> +            port@1: false
>> +
>> +          required:
>> +            - port@0
>> +
>>   additionalProperties: false
>>   
>>   examples:

