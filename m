Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D34CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0o0LqIeARHGVNWJRSz7OmbFxoiBCC04C/bpvJasunoc=; b=DCaXKO8eVVKyS/amuBFwZFJMCH
	T8/TAtS0oOuE0n4rJFKZmWdUM6y0OxFCAonVmOMwh4MGi3kPPZYpaCbB5XZeOm/9d39FHFHYlrX0T
	yV/Jks5UojPhqnE7PPpFI/J3naoeSiS2wgajqDy96DI6yAtC1Do72GYGwcvDoK1usQ5ZxVT8zwOC4
	tu9VxBlYcgCZcHwLSiABkeb6EgGedZKCI8d9yPkx31sBnln1dp8RYpsPV7IT4VscczOTEfN4Eqtjq
	lc3wqHz6+Hks6G/X08q7T/Ya+ODiD7EpNmzOyQ2I+ts2JF+UqDwdLPPvan7kHRTtfT0l0PR6MlIPQ
	eI6NYG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsYL-00000005B8k-2WPT;
	Tue, 09 Jun 2026 09:15:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsYL-00000005B8U-08si
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 09:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0o0LqIeARHGVNWJRSz7OmbFxoiBCC04C/bpvJasunoc=; b=FG6SPtlxxoDxVl/mZl7X+cyriw
	W+jIOJX0GvlFsu1DADJRQBxMKWR88VXttkh/fLHrwqsKQ3FsIdb/q0Js/Mr7Soqbn4BnU2v9dxCru
	r90rFysaKvKc8ZF//GyWSUpA1soBtw0xadR5jXbTenlWGRh2RG+8cz7NE7MCk4MO49Tqr+qv1T0yT
	1McskKy0RLMs3bhar6rk7jC27Btbo6NHVFmD70wGx547X9t9FFzcngCgKfzvbT4M0IN1qQsxpwmHI
	MBfve6Dnto/8TsburDyfaRkG/L1VooKqY8dnEO57jMUSAU/RlrIlKw5AoXxc4hlkN+xQspayR2Ina
	WCHYA8tg==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsYE-00000002ESL-1dqE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:15:18 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37474afe908so690956a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780996511; x=1781601311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0o0LqIeARHGVNWJRSz7OmbFxoiBCC04C/bpvJasunoc=;
        b=YpGosZRvN+HqeafjurwMqYnwrh1lPEnG0gj/vvTleNRB6OAvXw6HGB7LAfJIaJo3od
         DJhQlj871l2vwPkPi9eJ+OeWCrtMl1POwq7bjdh78ZxdttlGzWnNBmNpYptw8kq6CfpE
         8vq1Z7Kirj+Z26StjUGd1uQgBZA2vKiK+Ezhz7RO8STOyPq/UAScR+MEDqHBmG9IfRP1
         i7GlFzTZ891ts/i9ze+SzacU9jlwGp2VQ6/PYxG3GZdhdvp/Amlm5Clbse15+OLf9xG8
         khaXF7Ul3MbLHBcv/qznvVQ9zNM0wDnjBzWqNYVZI+Qm5Yr4Rmx2yicNVqzV5mYU714x
         GJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996511; x=1781601311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0o0LqIeARHGVNWJRSz7OmbFxoiBCC04C/bpvJasunoc=;
        b=djgLCILKc22G5dXSqFWwghxwgSN40Pko91sHE38VhaoyXIxrLSbEg0nwFzYcJ97a8/
         5LzWdW9rEPCHXI+HIFojvzbzJ0FspPgiS/ieQ4dYVyk2qoUuAlwGbHTa59DUuB7QL5GH
         YXWl9FgFMe2iriCtvn+QQIV2fixeZBkJfaUBj6XGiasXwMX+cFn/prn9gfA5fbUxQ4HS
         5CiVzkYFyUyJ+MTlAzExeDba0RP49mYzgoUZIsEVelqzprqmkD00SachDNbxO/yYS7pl
         JkLnkQ3ccPYiZct8+/lo8ce2qShv621HKH3DVkGD85U84iSnkQuXLG8zH6bcsEeIj54x
         nRrA==
X-Forwarded-Encrypted: i=1; AFNElJ9CEbgc9eNv8CVYLIHbinHtj1sR2tEosyck1fSo22MIF4rJm4SAJD9IUgXJ30xNhdkPJavdT28GE+IzxpKv+iLj@lists.infradead.org
X-Gm-Message-State: AOJu0YyaQkeEEPu1X/Od1qajW+cq9laHYLx5mECjF1thxx8rr3btvpYI
	faQ3kzVV9j/NWsKlbSMV4waIofLTUUvbEc+B4k/6M9TzZSSAFGK2m0LK
X-Gm-Gg: Acq92OHhCfkPbmOlnS807hUuCjkQkXoeej9prxlUYhBEuqLC+Pzo6CY0VUzsXi2JV+6
	zwcteeKXOr/8G1H+qkD8jEAVB+zYuemElo9/vjxyC8O28RCDzyzT+SSZ9Db41HsTXPvbUkOTnGU
	sTbgSYEZQXEFZV89tyYaIrnrK0LF2HTUgN/g4jKW7jKxjs76Mqp+d5FUrM3mCsf8d4N/yEROw63
	y1lrfnyUxBFCWPBoVVuaZ2QEWJZVfV1AaBcbIeE8EGaOHhq+ZC2uuq2wlbCeDsKoyC61sxqB+Ha
	74lhTxrJ2lT4GYZdy7SU1lx/uCQjTB1tgWzRatOdyppHbiq4ER/NjFPqmg620dy3Cvg3gXZ9tsy
	WLrjm8xXHbNZqEJioVrLOzWMdTI5LV1hR3UycCluzm0YHEwpxGs+b9y2rqr8iJdIlrLjWPi+mBB
	p1lcYd/+vezwhJrrqGWi0oMi6AKOQvjy7HEVqokScU8JDmE3UTpe4x4H4SMXKA6xnx164elz2RK
	wPEKDIeF8vaSTo=
X-Received: by 2002:a17:90b:6c3:b0:36d:6308:12fa with SMTP id 98e67ed59e1d1-370f0386f18mr21294469a91.18.1780996511281;
        Tue, 09 Jun 2026 02:15:11 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c76f55asm18560817a91.7.2026.06.09.02.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:15:09 -0700 (PDT)
Message-ID: <c480d9a9-9489-4801-ad7d-33ec4ffc3242@gmail.com>
Date: Tue, 9 Jun 2026 17:15:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: nuvoton: Add MA35D1 USB2 OTG PHY
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260604101220.1092822-1-a0987203069@gmail.com>
 <20260604101220.1092822-2-a0987203069@gmail.com>
 <20260608-demonic-horned-honeybee-4f6bb7@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260608-demonic-horned-honeybee-4f6bb7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_101514_977523_F291495F 
X-CRM114-Status: GOOD (  15.65  )
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


On 6/8/2026 6:45 PM, Krzysztof Kozlowski wrote:
> On Thu, Jun 04, 2026 at 06:12:19PM +0800, Joey Lu wrote:
>
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Understood. The trailing "binding" will be dropped from the patch 
subject line in the next submission.
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-usb2-phy-otg
>> +
> Where is reg? MMIO is expressed with reg, not via custom phandle.
Understood. The PHY node will be restructured as a child of the syscon 
node, with a `reg = <0x60 0x14>` property covering the writable PHY 
control registers (USBPMISCR, MISCFCR0) within the parent's address 
space. The `nuvoton,sys` custom phandle will be removed; the driver will 
obtain the parent's regmap via 
`syscon_node_to_regmap(dev->parent->of_node)`, which looks up the global 
syscon list by `of_node`. PHY instance selection will be expressed via 
`#phy-cells = <1>`, with 0 for the OTG port (USB0) and 1 for the 
host-only port (USB1).
>
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  nuvoton,sys:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to the system management syscon.
>> +          - description: PHY instance index.
>> +            enum:
>> +              - 0   # USB0, OTG port (shared with DWC2 gadget controller)
>> +              - 1   # USB1, host-only port
>> +    description:
>> +      A phandle to the syscon node covering the SYS register block, with
>> +      one argument selecting the PHY instance. Index 0 selects the OTG
>> +      port PHY (USB0) and index 1 selects the host-only PHY (USB1).
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +  nuvoton,rcalcode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 15
>> +    description:
>> +      Resistor calibration trim code written to the RCALCODE field in
>> +      USBPMISCR. The 4-bit value adjusts the PHY's internal termination
>> +      resistance. When absent the hardware reset default is used.
>> +
>> +  nuvoton,oc-active-high:
>> +    type: boolean
>> +    description:
>> +      When present, the over-current detect input from the VBUS power
>> +      switch is treated as active-high. The default (property absent) is
>> +      active-low. This setting is shared by both USB host ports.
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - nuvoton,sys
>> +  - "#phy-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +
>> +    usb_hphy0: usb-host-phy {
> usb-phy
>
> And drop unused label.

Understood. The node name will be changed to `usb-phy` and the unused 
label `usb_hphy0:` will be removed.

Thanks for the review!

>> +        compatible = "nuvoton,ma35d1-usb2-phy-otg";
>> +        clocks = <&clk HUSBH0_GATE>;
>> +        nuvoton,sys = <&sys 0>;
>> +        #phy-cells = <0>;
>> +    };
>> -- 
>> 2.43.0
>>

