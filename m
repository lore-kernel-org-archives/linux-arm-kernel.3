Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23088CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 02:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu0ES1O9klC+0ewrJmA1SFEVoTTP2kjyfbea71Glr8c=; b=ADWBzR67H+sVitqs9kQZaYmur2
	wucaSyIcafuklAOxiUupmHqykXpzwKcshEIPohrQ3ePwRApU39tRxveaAbTDYP5RgZzAhbnIIO780
	U5GzNuG6HUFe2Y883J2zGxOUHueBbcx3aU7MYYWYleGLXSSMZL//4GwHF8nZhmu0ckkQedSh3Dn9M
	ppKixyU9B5dtwizjDKVHD1THBQad3BdNtOAFUUO6ggXztA81RQYhV8L1Gpmgzs+VqYY3cg88l1vpz
	6cFcOa2sBTJgdOGYRTyONy9AMqe0LVxmC/0fuc9LVhT5J+4bBzpBvd8SFiGieK0yGol0J8giZgZIG
	m61MB7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUPC-00000004JJ6-2pLQ;
	Mon, 22 Jun 2026 02:28:58 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUPA-00000004JIk-11GI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 02:28:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8453bcf7276so2064543b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782095335; x=1782700135; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gu0ES1O9klC+0ewrJmA1SFEVoTTP2kjyfbea71Glr8c=;
        b=rCPh8lEEnL0MZoeomtfEiNxyk3G80rhEEDiMlniO4VHesTAthpLSyVtZabUpYNGSSr
         VariWua6+fFLwQ8ZGNQsd0xRhykAamGGqkJS7LvSnX7O6rTX83BWnPdyha8J2fkgkOJc
         Z+2FmX7S44JJHfdO/rHidhs4lXyEY8ZnOV79yPY296xmJ2+/LztzWQANKZieS70jDGRj
         u/hhJ90CDDUbbrblREWjSLgH/hORkf4SMp0u9QC4RTvRk4ZHztz7k7z3grfJMguCemgt
         gWIhZTW/U3KR6VNFxbgcqi3UQ2fs+iFxBoznXz1NgX96nZ19sY3cU10wh93eVEQHh2ct
         NbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782095335; x=1782700135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gu0ES1O9klC+0ewrJmA1SFEVoTTP2kjyfbea71Glr8c=;
        b=ckeLt2UQApZsV71zMB1cf6Zo7bX9rjW+Dt82c6GiwwcYNt+tzVCmiv3vOimeLQKkcR
         w2hiYDWb3ubFaf3RHY5HLm7DFSARqDQ1UyoQ2y6ehNuk2GSBPizvXKhvhEbPsKH2Aeu9
         CNRAMmUfnKWOfK+USq49mhaXchexztU4p2WHtJW7jjaE5QEmvGy1c/QE0OGdgTN+pNaz
         Q4D7qwBKvTEzKZb0TvcGNT9RvUvErCcgSf5qTqn/374LTlJJadVUR2uWKvggaMDzO5/d
         fIpPnKt3t6pMOvRAQ+idb/f6aG2u0Ja0src71jUxdMsLFiywV2eMsYg2zzan4XlQEWoH
         bufA==
X-Forwarded-Encrypted: i=1; AFNElJ/JwYDBpnhx+de0UB9Kzg6CkGcWHmwW/KcI3kHhkJGpnRTKtpug/akdFGpzfE0Ht6BlGsEXMuvleU3rCGdvk4t3@lists.infradead.org
X-Gm-Message-State: AOJu0YwPMeuaHSMBNn0pi7S1f2lMTvs5rqhwk4qCBCwbM5SBW/RuwHtU
	uCkDX0kyu9Y+WeGRYFAxzbiAnZPX5+8uv8zqVbhbvy/gCohA93FLC193
X-Gm-Gg: AfdE7ckdUGNnCRCz6F3Ea+9s0DwwUGapdA7M1mYhMAs0CMcMUBn3y9Di25HFCtYXGVB
	/Yx7e7GZpw3cgIAMf0SD9zFhSCN1R2eaTrvlGY/HC6GR1TIxXkQ1xk4G4BiBb23tMWNwUOKCqE4
	f0WYs0Jo12iv1YEpDjIP4RI7wt5a/xPdhSHTg4wjmWspTXbBpPrgdVDaWsflp4PSNVH8llPjAXe
	UxvsRWNWrGbT71vlmgJ2UdOP03LuVDdiDTIE5m6pRD6c99TOYy+6WcjF7vigoy6hIaUbbUP13pb
	RfcqQduqni9B5d4ibxOjD1WB+H3QpRslMilVaaNl2aHKHdf0MCm4C/aUdxjG6ZIJ3CWa5/XOi9a
	r4t684pTWs5CniHvtZ1ggIaIH44sceCP+vshU7D6ZpDV/GWp1IGSKv4FHWaTzXXSVlQ4REXHB76
	AZlO4GCqCi/20wVuMe1joqnqtdAfQ5kNyS+BMWFzXrgzO2rGK6OIz7P3sgMzlMlwunMc26vCT87
	tU4
X-Received: by 2002:a05:6a00:4104:b0:845:33e1:9664 with SMTP id d2e1a72fcca58-845508ff81bmr13600889b3a.40.1782095334770;
        Sun, 21 Jun 2026 19:28:54 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ee3dc2sm5573489b3a.58.2026.06.21.19.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 19:28:54 -0700 (PDT)
Message-ID: <98725dea-9bfd-43bb-8bce-e314f821d081@gmail.com>
Date: Mon, 22 Jun 2026 10:28:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: display: verisilicon, dc: generalize
 for single-output variants
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-2-a0987203069@gmail.com>
 <3683c5c617324f5835529617325745ef48fa1943.camel@iscas.ac.cn>
 <6d3e3121-22f2-4c59-9678-df2f57ff4d31@gmail.com>
 <b08277e8a9350f6c68c9774b1b6185b1eb71cd1e.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <b08277e8a9350f6c68c9774b1b6185b1eb71cd1e.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_192856_311015_159455A7 
X-CRM114-Status: GOOD (  19.17  )
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


On 6/18/2026 6:24 PM, Icenowy Zheng wrote:
> 在 2026-06-17三的 18:25 +0800，Joey Lu写道：
>> On 6/15/2026 4:19 PM, Icenowy Zheng wrote:
>>> 在 2026-06-15一的 14:49 +0800，Joey Lu写道：
>>>> The existing schema hard-codes the five-clock/three-reset/dual-
>>>> port
>>>> topology of the DC8200 IP block, preventing reuse for single-
>>>> output
>>>> variants such as the Verisilicon DCUltraLite used in the Nuvoton
>>>> MA35D1
>>>> SoC.
>>>>
>>>> Rework the schema so that variant-specific constraints are
>>>> expressed
>>>> via
>>>> allOf/if blocks:
>>>>
>>>> - Add nuvoton,ma35d1-dcu to the SoC-specific compatible enum.
>>>> The
>>>>     generic verisilicon,dc fallback remains the driver-binding
>>>> string.
>>>> - Move clock and reset items descriptions into the per-variant
>>>> allOf/if
>>>>     blocks; keep only minItems/maxItems at the top level so the
>>>> base
>>>> schema
>>>>     accepts all variants.
>>>> - Restore full items lists for clock-names and reset-names at the
>>>> top
>>>>     level with minItems so the names are validated against the
>>>> descriptions.
>>>> - Keep ports in the global required list and keep
>>>> additionalProperties: false.
>>>> - Add an allOf/if block for thead,th1520-dc8200: five-clock
>>>> (core,
>>>> axi,
>>>>     ahb, pix0, pix1), three-reset (core, axi, ahb), required
>>>> resets.
>>>> - Add an allOf/if block for nuvoton,ma35d1-dcu: two-clock (core,
>>>> pix0),
>>>>     one-reset (core), required resets.
>>>>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>> ---
>>>>    .../bindings/display/verisilicon,dc.yaml      | 80
>>>> +++++++++++++++++--
>>>>    1 file changed, 73 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> index 9dc35ab973f2..0c41286b8223 100644
>>>> ---
>>>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> +++
>>>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>>>> @@ -17,6 +17,7 @@ properties:
>>>>        items:
>>>>          - enum:
>>>>              - thead,th1520-dc8200
>>>> +          - nuvoton,ma35d1-dcu
>>>>          - const: verisilicon,dc # DC IPs have discoverable
>>>> ID/revision
>>>> registers
>>>>    
>>>>      reg:
>>>> @@ -26,14 +27,12 @@ properties:
>>>>        maxItems: 1
>>>>    
>>>>      clocks:
>>>> -    items:
>>>> -      - description: DC Core clock
>>>> -      - description: DMA AXI bus clock
>>>> -      - description: Configuration AHB bus clock
>>>> -      - description: Pixel clock of output 0
>>>> -      - description: Pixel clock of output 1
>>> Clock descriptions should still be in the global part instead of
>>> the
>>> per-compatible part.
>>>
>>> In the per-compatible part, clock-names should be constraint for
>>> SoCs.
>> I will move the `items:` clock descriptions back into the global
>> `clocks:` property, covering all five possible clocks. In the
>> per-compatible sections I will remove the description items and only
>> constrain `clocks: minItems/maxItems` and `clock-names:
>> minItems/maxItems`; for nuvoton,ma35d1-dcu I will additionally
>> override
>> `clock-names: items:` to the two names actually used (core, pix0).
> Yes, this should be the correct practice, although I wonder whether the
> minItems and maxItems properties are needed globally (because these two
> seem to have default implicit value).
>
> BTW the MA35D1 manual in fact shows 4 clocks for "DCUltra" in the clock
> tree, maybe the DT binding needs to be reconsidered?
>
> Thanks,
> Icenowy
I will drop the global `minItems`/`maxItems` on `clocks` and 
`clock-names` in v5, as they are redundant with the implicit defaults.

Regarding the 4-clock question: the TRM clock tree diagram does show 
four paths reaching DCUltra (display core mux/gate, AXI ACLK, AHB HCLK, 
and the pixel clock divider). However, the MA35D1 hardware provides only 
one software-controllable enable bit (SYSCLK0[26]) that gates the core 
clock together with the AXI and AHB bus clocks through shared ICG cells; 
there are no separate register bits for the bus clocks alone. Due to 
this hardware design constraint, the `clk-ma35d1` driver is 
intentionally designed to register only three DCU-related CCF nodes: 
`dcu_mux` (ID 61, an internal routing mux), `dcu_gate` (ID 62, the 
single gate at SYSCLK0 bit 26), and `dcup_div` (ID 63, the pixel divider 
from VPLL at CLKDIV0[18:16]), with no independent AXI or AHB gate 
entries for DCU. Since the DT binding can only reference clock handles 
that the platform clock driver actually provides, the MA35D1 binding 
will remain at two clock entries: "core" mapped to `DCU_GATE` and "pix0" 
mapped to `DCUP_DIV`.

Thanks.

>
>>>> +    minItems: 2
>>>> +    maxItems: 5
>>>>    
>>>>      clock-names:
>>>> +    minItems: 2
>>>> +    maxItems: 5
>>>>        items:
>>>>          - const: core
>>>>          - const: axi

