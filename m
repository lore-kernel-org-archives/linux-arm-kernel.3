Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0A1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyLQLQryK7/S92ya5PLfuOu/W+JvCTVmwNrWVc0CbCI=; b=sePxXVzqZXevE+8vs+7zMYhKGN
	DDCmCdNWFp1Axn/Z/nSnHoCCApXQh/NtpbZ8pXA2Lj09uFMXMSLpdSWA9sY0tKnfBKA+PsCVnV164
	l7QuLXFrMh6hNks3wjLO30b6zYfRvZMjayEfRoI5y60loraNpq52sVxOwwA2K4dwHeEalO/S/1gLg
	tH84mFJVmlHHmZBD+zzfjL4weGPHp4MsFr+famYVMs5YMLLVtDaAmX5YaQGsniNkHvrz8OW6zSXp7
	lkqbCkyvlVJxj1FpLMkG0m7FhlXliJ1EwVQoa1ReEUsI4p2YKCpadYy/eic4sqYRl6tn6bci+pzD3
	P/rXn4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSZs-0000000G4Mt-1Wqu;
	Tue, 30 Jun 2026 07:08:16 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSZq-0000000G4MX-2dXB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:08:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-37fc01881f2so2520929a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782803293; x=1783408093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tyLQLQryK7/S92ya5PLfuOu/W+JvCTVmwNrWVc0CbCI=;
        b=EALjCVYcZqd4XSAmfBSFmOCWHhQJ73+8IpLQ7RNGysAQnbMDRUvaNBemhRNNjMRU+P
         vDFOHSLOXn6zZRU7OIYCqI8iglolxFi2KuytjUEBRLqHYtn0hMZl8VrNDb+X+T8jxFGA
         f1A6p0w3MIHgOvvIMxPCxjQlb1stip24a39+yo/OhkkO8tYOqCvyWRzqmC0O2QvopBDq
         FisyWO8QOT+uceP2xks5rXBKRxHtQIXYjecZ1UhrCcX7rxF0RMsSYihq5nhqrsPyvmyA
         m8T36Odzq5ehALEYhIR5FYzlAVdQQ1Si9dZ9wF3Uu2QE6imxFwsC0/oDl0XlUAPdCs8D
         U5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803293; x=1783408093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyLQLQryK7/S92ya5PLfuOu/W+JvCTVmwNrWVc0CbCI=;
        b=qP9127cOdbfLPeY3da7z5TVcdSpy+52F6rs2BnFLxra3DI8iTs+xVgSvt2PKmrm0qB
         /fS6W/FGSC3PxYpYCd4DlzfqGMG7mk6lxGo3hyAp556/DwUHjR4HFXP3iG1tnwXo0B+a
         Ll4RHF+u5PCeS644FjBv6QgRPZKSyPszIx35eMOOtPLzz3aYniFGvnrAkDUUxf9uxb9I
         rQQza+79QOgrvQWUBiolxFf1fqBP+VMWoT4KbfiY/OmRp8E8IoH0nTDpDOxQ8eqr+FKT
         D5eyfbHjujmDB+nWg5q+cnSQLPpO/aNGI5JV33bqg9Sx7vwfjObsbrEyiN4ECwkCRXEa
         pnmg==
X-Forwarded-Encrypted: i=1; AFNElJ//VXNCruVbtaBka3mYHvavh0GN1s4t8SwZRCHzScJx9ZmiIZx5ID+n6pYhtHE09J/fCOeboAqBAlvX+piSoH1o@lists.infradead.org
X-Gm-Message-State: AOJu0YxqVCGgLrDEVcPv3px7f1U5ADx00+yXitXu9NzJHPR4BdMoXJyb
	x5KCkfMFpN0hF5GPefzi1OKW5+OR6bXq/SpJZiFPy29Xup/doglTK90Z
X-Gm-Gg: AfdE7cm3xXHVrtVtrp1y48xfzYEMGcvRNlhQKxoadA3mqDX9xaj5/Jri0QZmJEFUvGN
	oLn1RVv0UkBbGFCZ0lhMJ64IY33hAktDRswz2YoFtl3BGmto++Tz2SFuKfzNo4Wi/8wCIJtHyky
	T8F3L/KV7jT/QHWLGmk4jA7o9KoHNN0LNfwXUm5GtwBR9U5oeIeff5aRDC+reNGvrBdw6FBJIt3
	xFrreIMhW/1glQKkzq7JxovTHYEyWGL+BIyae7W2VTnqTsPadKo3ZRkvnTD6YS2ouLHR5mgAtJ5
	34TWz9oLklpB5N7kYByI+WhGN3p8N0r86TQjoGtVZZwUjvhenwAbQ26p/Pic7e4Z6HxXgDzQmEv
	z7vN/t33rxVLTkdrSvdwhbmsqwLB7c8uGcej5EPnmb79oWOtOlJUPjEBEKyTd1kM9iUX+Qu2NQg
	8H7ypR3+y6KMqLWBf6JtApDrxl9yPqHhW9oKv6y3KYaJsP3VtekFoYoCClqtZBiGNlhw==
X-Received: by 2002:a05:6a20:4393:b0:3bf:c28f:8afd with SMTP id adf61e73a8af0-3bfc5275c9cmr2386643637.31.1782803293270;
        Tue, 30 Jun 2026 00:08:13 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bb9fdbe64sm996296a12.0.2026.06.30.00.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 00:08:12 -0700 (PDT)
Message-ID: <54fd4b86-d978-4f21-8634-292ecbe484ed@gmail.com>
Date: Tue, 30 Jun 2026 15:08:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
To: Conor Dooley <conor@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 yclu4@nuvoton.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-2-a0987203069@gmail.com>
 <20260625-bobbing-annotate-d1c4d6874ee2@spud>
 <e3fe23ddbc504879bd797bbaa595d3653fa139ff.camel@iscas.ac.cn>
 <20260626-astrology-mural-853d3860e048@wendy>
 <c0731801729713d35f97bec40ebc21cef31b72b5.camel@iscas.ac.cn>
 <20260626-everybody-epilogue-8fb298a54981@wendy>
 <9456bde5059bea3aac1ed64355e3f017dd9bd3e5.camel@iscas.ac.cn>
 <b3b7a0f8-93a8-4965-a2f3-3ca1552a25d6@gmail.com>
 <80ae28925a67b7bee3b8873db3c113111437e717.camel@iscas.ac.cn>
 <20260629-chevron-awhile-7cf456a768a0@spud>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260629-chevron-awhile-7cf456a768a0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_000814_676648_580978B3 
X-CRM114-Status: GOOD (  26.66  )
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


On 6/29/2026 11:02 PM, Conor Dooley wrote:
> On Mon, Jun 29, 2026 at 01:31:46PM +0800, Icenowy Zheng wrote:
>>>>>>>>>> +
>>>>>>>>>> +        resets:
>>>>>>>>>> +          minItems: 1
>>>>>>>>>> +          maxItems: 1
>>>>>>>>>> +
>>>>>>>>>> +        reset-names:
>>>>>>>>>> +          items:
>>>>>>>>>> +            - const: core
>>>>>>>>> This is just maxItems: 1.
>>>>>>>> Well the implicit rules of DT binding schemas are quite
>>>>>>>> weird...
>>>>>>> I don't think it is that strange, as the binding has
>>>>>>>     reset-names:
>>>>>>>       items:
>>>>>>>         - const: core
>>>>>>>         - const: axi
>>>>>>>         - const: ahb
>>>>>> Ah does the list constraint the order of items? If it
>>>>>> constrains
>>>>>> the
>>>>> It does, yes.
>>>>> Alternatively, using an enum permits free ordering.
>>>> Ah in this case this should be converted to an enum, I think.
>>>>
>>>> Should I send a patch for converting it?
>>>>
>>>> Thanks,
>>>> Icenowy
>>> Thank you all for the detailed review and discussion, it really
>>> helped
>>> clarify the right approach.
>>>
>>> Since I will supply all four clocks with the same phandle for
>>> core/axi/ahb,
>>> and only one reset "core" for MA35D1, the ordering constraint in the
>>> `items` list is not a problem, "core" is already the first entry.
>>> There
>>> is no need to convert to an enum.
>>>
>>> Regarding the clock situation for the MA35D1: I agree with supplying
>>> all
>>> four clocks (core, axi, ahb, pix0) in the devicetree, even though the
>>> MA35D1 clock controller gates core/axi/ahb with a single bit. The DT
>>> will
>>> use the same clock phandle for core, axi, and ahb:
>>>
>>>     clocks = <&clk X>, <&clk X>, <&clk X>, <&pix_clk Y>;
>>>     clock-names = "core", "axi", "ahb", "pix0";
>>>
>>> This correctly models the hardware topology. Since all three names
>> No, this doesn't correctly model the hardware topology -- this will
>> lead to clk_get_rate() return the rate of DC core clock when checking
>> the AXI clock rate, which is problematic because both clocks are
>> limiting the performance of the DC.
You are right. The current MA35D1 clock driver does not correctly reflect
the real AXI/AHB clock rates, and I think it needs a more comprehensive
review and rework. I will address this in a separate clock driver patch
series in the future.

For this DRM patch series, the AXI and AHB clocks are shared system bus
clocks fixed by the SoC clock tree and are not managed by the display
driver. The driver does not query their frequencies for mode validation
or bandwidth decisions. Therefore, driver correctness is independent of
the reported AXI/AHB clock rates, meaning it will remain unaffected when
the clock driver is later reworked.
>>> resolve
>>> to the same underlying clock node, the CCF's standard enable
>>> refcounting
>>> handles the shared gate correctly without any custom implementation
>>> needed.
>>> I will also revert the change in patch 4/7 that made axi and ahb
>>> clocks
>>> optional, since they will now always be provided in the devicetree.
>>>
>>> Regarding moving `resets` and `reset-names` to the top-level
>>> `required:`,
>>> I will wait for Icenowy's patch to land before sending v6 to avoid
>>> duplicating the work.
>> The patch is sent.
Got it.
>>> In v6 I will update patch 1/7 with:
>>> - Update the subject to "dt-bindings: display: verisilicon,dc: add
>>>     support for nuvoton,ma35d1-dcu"
>>> - Lower `clocks`/`clock-names` `minItems` to 4 at the top level
>>> - Remove the `thead,th1520-dc8200` conditional block entirely
>> I think this conditional block will still be needed, because it will
>> need to constrain the minItems to ensure all clocks / resets are
>> populated.
> Correct. When the outer constraints are relaxed to deal with the new
> device the conditional block for the th1520 becomes required. Or having
> an else, but if all devices are likely to be different in terms of
> configuration specific conditional blocks is better.
Understood. I will keep the `thead,th1520-dc8200` conditional block.

