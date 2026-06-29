Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C27C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 03:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4glFEoTlSdEvWgu5Qz9SrofqHmqDCDT1GO9md08oew=; b=usFhBS1tbAczu7Y13xWAhFLF3p
	NCSh6egLR0ckmGYLJwAF8IyiCza6f4mwUXyR2BkdVDPBo1zU5BXZ1bX3OZi1rB+lFAi64GkRYdKh0
	hO/oE6eo0wt8gX66GF687qL2F/+xiRQudMbho9V2VDsDf9Ng5ltWK/4UVnnmrMx1wLrK0SNi+knGR
	wrDnvcmY4hom6tMj5BtjrQhTh2D93sgH9cpnm72NV+l3sWzCbkC8d7KePgqLcOl+R2LecSmjJ60vL
	7prLzID41iK7XxRkASc47a2bgYPGFhGiG08eh3E64fCuUhX1EBox5ZdV/X+p1rP5k0eFnTrCHN0be
	iKbGgd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2xo-0000000Ddzc-1r8X;
	Mon, 29 Jun 2026 03:47:16 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2xm-0000000DdzE-09gM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 03:47:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso881255a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 20:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782704833; x=1783309633; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4glFEoTlSdEvWgu5Qz9SrofqHmqDCDT1GO9md08oew=;
        b=OYBwo2iS4yuy9qsYqBSzkFoO/YCNKc8iK28d0XWLYSXOBW2neOIfnTZf7dqtUiMWUj
         YKrOnfgvBq00MYcbv0B+cnfWJkbmTAXibuxK0eapTfYpbbghEy889jMslExf/sMTcqZZ
         qkUoSRtq+/EABIBVOUr340mmLRcyyzDi2via0d1VOqAxwmHHSbSJl1anqfBlvek3JO7j
         3RiS+ZgiCdUSZOE02RovYer7L6AFDGTqOlXksL0fUqSOVGUFwVY6OWXtlPr2a2a8R2aR
         03Ljpx9QhIOSuytlQ28YOlpmrxX+c+NQ9ZYmrjhxgEsAqafUs3R8na1f6BlGQCercKf2
         6wmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782704833; x=1783309633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4glFEoTlSdEvWgu5Qz9SrofqHmqDCDT1GO9md08oew=;
        b=CngJsk6r4yibBIXKQyWQXWXRXAVftMz2NZ/To+qszASOupWYomF5qXAG3GFJiBQ/O8
         gqkLqif8sIEFUZ4wfCn59c9dpwY2V+ALz5OWBxgrid5hJ4La5mMlvznWKt/CzV37RPfq
         39JvpXP2EBaLcTGZ+W0w62l+FUMN8rLkxZXNVxAZx1iHfAakbpQp5S8hUfA8SBjqz05Y
         SwPqVESpqRobU4oIuMhmWRLgPwJbriFhMF10lfri+laBNzfdCFmpa4zv15YVrz/x6u4M
         w0UNf/CYLpdEb5ahED5qJwhwxXqFQHWylkKlOiuKX4aNv5tvrsEClmQxF2KRAYMmXl9Z
         zW0A==
X-Forwarded-Encrypted: i=1; AHgh+RrN9R6VNYHV69YHDcjS9gkkWrdCvgqTxH6W8tSwocOoreun4A3pGDV+uuDqlihbd71kvjEuFNY5gJOJL49v42ng@lists.infradead.org
X-Gm-Message-State: AOJu0YySX1GSR6W1dfRE5R389hnq45OCBhi+MddJCmNVOV1gvViTECS7
	ty4ahCf8BxTlwlj30afi/a8Zr9GLXkGZuzYHYUQLhFEx6UrQ0K1y9u2Y
X-Gm-Gg: AfdE7cnfzcFXttr96AXxJe1iMP82KckqFkdPEHhNsS20jLbFaNWZ0aOTumMbL/MjDkL
	48mCsexWyvkpfvzzlvzjffCoAKjUui6bRViQiynYcTLDGYZH3u+9ALZN242pNmK7gu7IGSMpiUm
	+Qf8nfZ7GvVE9M8t1yCSp0Wc0Fy1EZnF2Mxbo+pWhzDFCax9VHl2XrAA9iuxQfryJWCyyNj9Gzb
	h7uyF5Q2YCN+fTU+F6yN22f6p8QpC9KOpmMSNKn1oGWsRkCy7XCZ6VPx882X6/B1/FYTBMTaqHW
	8yR7Ib1KfsYvKd3tawP/eZjNk158r05r5DSbLIu0fq7MAPPB+cuvr/ZkqXSmEtgTH6KUjiIuTAu
	tgIO3TLNz6XdbnoamnLJHH8Dd9NhNF0ypjisMDxsSKhgCg+RP+QyZkLmj1mO37e0b1mIbaQCV0O
	gzJyVlXk7BbcHglGuYvuHJeFUCZ/5kBXKKQ2+zhv8uRSJgK7ffX0ybWNb2rpC4iKN3AA==
X-Received: by 2002:a17:90b:28d0:b0:37f:9ce3:ca92 with SMTP id 98e67ed59e1d1-37f9ce3cb4emr6630306a91.27.1782704832538;
        Sun, 28 Jun 2026 20:47:12 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37eaff87f61sm4687705a91.17.2026.06.28.20.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 20:47:11 -0700 (PDT)
Message-ID: <b3b7a0f8-93a8-4965-a2f3-3ca1552a25d6@gmail.com>
Date: Mon, 29 Jun 2026 11:47:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-2-a0987203069@gmail.com>
 <20260625-bobbing-annotate-d1c4d6874ee2@spud>
 <e3fe23ddbc504879bd797bbaa595d3653fa139ff.camel@iscas.ac.cn>
 <20260626-astrology-mural-853d3860e048@wendy>
 <c0731801729713d35f97bec40ebc21cef31b72b5.camel@iscas.ac.cn>
 <20260626-everybody-epilogue-8fb298a54981@wendy>
 <9456bde5059bea3aac1ed64355e3f017dd9bd3e5.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <9456bde5059bea3aac1ed64355e3f017dd9bd3e5.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_204714_081837_EC586B73 
X-CRM114-Status: GOOD (  29.37  )
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


On 6/26/2026 5:33 PM, Icenowy Zheng wrote:
> 在 2026-06-26五的 10:26 +0100，Conor Dooley写道：
>> On Fri, Jun 26, 2026 at 05:00:35PM +0800, Icenowy Zheng wrote:
>>> 在 2026-06-26五的 08:19 +0100，Conor Dooley写道：
>>>> On Fri, Jun 26, 2026 at 01:27:21PM +0800, Icenowy Zheng wrote:
>>>>> 在 2026-06-25四的 17:33 +0100，Conor Dooley写道：
>>>>>> On Thu, Jun 25, 2026 at 05:44:43PM +0800, Joey Lu wrote:
>>>>>>> +allOf:
>>>>>>> +  - if:
>>>>>>> +      properties:
>>>>>>> +        compatible:
>>>>>>> +          contains:
>>>>>>> +            const: thead,th1520-dc8200
>>>>>>> +    then:
>>>>>>> +      properties:
>>>>>>> +        clocks:
>>>>>>> +          minItems: 5
>>>>>>> +          maxItems: 5
>>>>>>> +
>>>>>>> +        clock-names:
>>>>>>> +          minItems: 5
>>>>>>> +          maxItems: 5
>>>>>> All the maxItems here repeat the maximum constraint and do
>>>>>> nothing.
>>>>>>
>>>>>> Since you didn't change the minimum constraint at the top
>>>>>> level,
>>>>>> your
>>>>>> minItems also do nothing.
>>>>>>
>>>>>>> +
>>>>>>> +        resets:
>>>>>>> +          minItems: 3
>>>>>>> +          maxItems: 3
>>>>>>> +
>>>>>>> +        reset-names:
>>>>>>> +          minItems: 3
>>>>>>> +          maxItems: 3
>>>>>>> +
>>>>>>> +      required:
>>>>>>> +        - resets
>>>>>>> +        - reset-names
>>>>>> Both conditional sections have this, but the original binding
>>>>>> doesn't
>>>>>> require these for the thead device. This is a functional
>>>>>> change
>>>>>> therefore and shouldn't be in a patch calling itself
>>>>>> "generalise
>>>>>> for
>>>>>> single ended variants".
>>>>> Well yes they're required.
>>>>>
>>>>> Should I send a patch adding the `thead,th1520-dc8200` part of
>>>>> the
>>>>> schema?
>>>> If you mean the code above, no. Adding a conditional section when
>>>> there's only that compatible doesn't make sense.
>>>>
>>>> What you could do is just add it at the top level though, which
>>>> would
>>>> also benefit this patch since it'd not have to be conditionally
>>>> added
>>>> for the new nuvoton device.
>>>> Just note in your commit message about what the ABI impact of the
>>>> change
>>>> to required properties is (effectively nothing because it's
>>>> optional
>>>> in
>>>> the driver and the only user has the properties).
>>> Okay, I will craft such a patch and send it.
>>>
>>>>>>> +
>>>>>>> +        resets:
>>>>>>> +          minItems: 1
>>>>>>> +          maxItems: 1
>>>>>>> +
>>>>>>> +        reset-names:
>>>>>>> +          items:
>>>>>>> +            - const: core
>>>>>> This is just maxItems: 1.
>>>>> Well the implicit rules of DT binding schemas are quite
>>>>> weird...
>>>> I don't think it is that strange, as the binding has
>>>>    reset-names:
>>>>      items:
>>>>        - const: core
>>>>        - const: axi
>>>>        - const: ahb
>>> Ah does the list constraint the order of items? If it constrains
>>> the
>> It does, yes.
>> Alternatively, using an enum permits free ordering.
> Ah in this case this should be converted to an enum, I think.
>
> Should I send a patch for converting it?
>
> Thanks,
> Icenowy
Thank you all for the detailed review and discussion, it really helped
clarify the right approach.

Since I will supply all four clocks with the same phandle for core/axi/ahb,
and only one reset "core" for MA35D1, the ordering constraint in the
`items` list is not a problem, "core" is already the first entry. There
is no need to convert to an enum.

Regarding the clock situation for the MA35D1: I agree with supplying all
four clocks (core, axi, ahb, pix0) in the devicetree, even though the
MA35D1 clock controller gates core/axi/ahb with a single bit. The DT will
use the same clock phandle for core, axi, and ahb:

   clocks = <&clk X>, <&clk X>, <&clk X>, <&pix_clk Y>;
   clock-names = "core", "axi", "ahb", "pix0";

This correctly models the hardware topology. Since all three names resolve
to the same underlying clock node, the CCF's standard enable refcounting
handles the shared gate correctly without any custom implementation needed.
I will also revert the change in patch 4/7 that made axi and ahb clocks
optional, since they will now always be provided in the devicetree.

Regarding moving `resets` and `reset-names` to the top-level `required:`,
I will wait for Icenowy's patch to land before sending v6 to avoid
duplicating the work.

In v6 I will update patch 1/7 with:
- Update the subject to "dt-bindings: display: verisilicon,dc: add
   support for nuvoton,ma35d1-dcu"
- Lower `clocks`/`clock-names` `minItems` to 4 at the top level
- Remove the `thead,th1520-dc8200` conditional block entirely
- Keep only the `nuvoton,ma35d1-dcu` conditional block, using only
   `maxItems: 4` for clocks/clock-names and `maxItems: 1` for
   resets/reset-names to tighten the top-level constraints

BR,
Joey
>>> order, it partly breaks the intention of having names; if it does
>>> not
>>> constrain the order, it needs to be clarified that the required 1
>>> reset
>>> is core instead of the other two.
>> Given the discussion we're having on the clocks, I wonder if this is
>> also an oversimplification and the IP has three resets inputs hooked
>> up
>> to one output of the reset controller (or 3 outputs controlled by one
>> bit..).

