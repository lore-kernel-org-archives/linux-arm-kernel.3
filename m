Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C7ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHfbo0BKomkvlXOhBVfB/0eAcoO1X0ualN2+zvtl7Uc=; b=ZFIoxuJ0FMDdBlJDsuNUBlldjL
	w3c7LsI2pB1KTdjUdS+cHQL5uv9Jg5yWohellF3Fn5QXKNJzdVDExAxqgSbio8Eddkdd/PhGLv9p7
	EzNxsU7ik12hzoYwXYPPv8yKeE+SVjPvMqFrlLrBMN+6N93M6ybkoy4v7BSc3O3iv7xNhZ1VXg2do
	x1H3qtVGrsl/WzXV3K/NHK6SFIYH1ESgIid3/3PHD0WPqscTvtK96qMDPUz9w1ZslLXDlJI/0/4kL
	0OdFJUirewcXEIxWS/dnjuULd2cK4RHNbpOw54XcXAZdR0ZOH+QWZINBbQzFjHgE0+hcgy8NcX6/Y
	C2Zw4YKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGGw-0000000Cx7j-0TS3;
	Wed, 10 Sep 2025 08:33:46 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGGt-0000000Cx4y-2Hea
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:33:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso40460435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757493222; x=1758098022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EHfbo0BKomkvlXOhBVfB/0eAcoO1X0ualN2+zvtl7Uc=;
        b=HCt30+eKBJS72VJ4VgzIeA3W5/6AYF2Abc6XUv1WrTSKE1WJ19SHCjpqCsyildWfms
         hk7CgaHoDinSz73CSvNUklvoeO/9UEwcnAl1RLugV1A7U86W125K1a9QiLj7DgJugXVo
         tosCWwyBHZDJ3kDYthbIqIwzwTO6mdXiTdYzJs+IZOAQt/6+f42k/f6goa0rYroMPFUm
         92LwQoxKR2aUx1GfShfwf/kWH+m3Xc4NZB6bjGVoWNYegA5h+xa/s6D2H2jgW7AVhRMV
         hWUKf2nEk2VrPomXAlcbXWM+5pj3LqMCK30XpU/dQh1OerCYFd0TWyZkOXyNAL0w9xDb
         rn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493222; x=1758098022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EHfbo0BKomkvlXOhBVfB/0eAcoO1X0ualN2+zvtl7Uc=;
        b=p9gmjAi52blNGh4HtI7gtg9dcprXAytsjRfO+eQU9vwfIRsceI+NYPcHL/dDrkv2c5
         KbgsCbJ47EpSKvkhl9f4Z6ahwIoqSljfjDzy35w6ElUz8Hu71YThO7z5l+kIzGB+BA27
         xxLu60Hb6PoDgHoXz01KWPUGCToJfRlHmQWtIJpnKs2NQr19O0Z7lD+o63SMxz4sMMtK
         9vB2KE6rinfTgyKReIcLDehz+k+tKA2OxKHeKbgXxxXnFcu6wOBwxd1LtPnrFcpjkYv6
         mBgSNeB9Z4OE0urN/UqK5IDBCmWkrYVE3a7JOyKThRrEyR9Tv+btmY1+2MKyUPCClz6e
         Tb0w==
X-Forwarded-Encrypted: i=1; AJvYcCUnIO54Jbmz8/duN4OcF5wF5LxCc3NN/oUx/yCprICtAiOj6F+UJ+UAdUhu+6d/4qx3DPpYgvaMUtjB2ANlbQHK@lists.infradead.org
X-Gm-Message-State: AOJu0YwxIAKsEcKlWKjUAkPuQBUZnj+BcJP0OmQRXrOdNlW6VB77R8H5
	vejDlrt7ASyyP4kLGJ7DI56F6cG/B95lsKLamHZxCE8I0Yq5pGE8SylE
X-Gm-Gg: ASbGncuoBlwos/ad2VytN9AfdMLKAE4VMVoranaZv7WRemsbXt6YDu4b5iTdlDPI1uN
	bKbKrEhku2FmYRqZCWwePNdljGRtPC6dk3oRespWROKv1pY4GeS8ReTlGT5jsOG2LXWmjRl328C
	bcyAz7qof9FWYH8uUD+qKyZAkZVibnepbenOw7azd2D5V+Iypc3yI8wTF8sE2E3yVcv0glb2i65
	9/etfYrPw6is/Zbb641dgqf5zOVGFjHeNHBjrwUBFOfhR1vOunF8SfQR/F1Pl0INpLxXRZo/aJG
	8QH0E17N+61qaRU726RD+6iGb16XrIsooFjRGnSi0+Ent+RRycdVuPg25hQ0DVWdwJAPQ6DsR0F
	JtLwrI3lyHRNUYtQbAW9WaoN8MuJkbEGyl1Exi6A+xmVBS9M2UX1p+kj3dh6m1+SgYK8V/ep4Dj
	gwoQJzbpa+iV2dOWwBi40KP/3pJOuV3kNvjxau9rsoABnSXCfoxAawBr34agoKcRU=
X-Google-Smtp-Source: AGHT+IERWBLoDJYJTftiCvvL8rJvicVn7K1El1ceydxmfro3VBEiw0JoaM94eFug5LOT1WRGb+/cOg==
X-Received: by 2002:a05:600c:a05:b0:45d:d5c6:97b4 with SMTP id 5b1f17b1804b1-45ded2fb475mr46947715e9.9.1757493221488;
        Wed, 10 Sep 2025 01:33:41 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:9000:7072:695b:3ef? (2a02-8440-7135-4f4c-9000-7072-695b-03ef.rev.sfr.net. [2a02:8440:7135:4f4c:9000:7072:695b:3ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9a2esm6376513f8f.14.2025.09.10.01.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:33:41 -0700 (PDT)
Message-ID: <7c9eadf3-6b71-48ba-99ad-bca5b8bc40e6@gmail.com>
Date: Wed, 10 Sep 2025 10:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/20] dt-bindings: perf: stm32: introduce DDRPERFM
 dt-bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Julius Werner <jwerner@chromium.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
 <20250910-adamant-hospitable-firefly-ae30c5@kuoka>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250910-adamant-hospitable-firefly-ae30c5@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013343_605919_47F1370C 
X-CRM114-Status: GOOD (  15.33  )
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

On 10/09/2025 09:57, Krzysztof Kozlowski wrote:
> On Tue, Sep 09, 2025 at 12:12:19PM +0200, Clément Le Goffic wrote:
>> From: Clément Le Goffic <clement.legoffic@foss.st.com>
>>
>> DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
>> It allows to monitor DDR events that come from the DDR Controller
>> such as read or write events.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
>> ---
>>   .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml | 94 ++++++++++++++++++++++
>>   1 file changed, 94 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
>> new file mode 100644
>> index 000000000000..1d97861e3d44
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
>> @@ -0,0 +1,94 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +maintainers:
>> +  - Clément Le Goffic <legoffic.clement@gmail.com>
>> +
>> +title: STMicroelectronics STM32 DDR Performance Monitor (DDRPERFM)
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - const: st,stm32mp131-ddr-pmu
>> +      - items:
>> +          - enum:
>> +              - st,stm32mp151-ddr-pmu
>> +          - const: st,stm32mp131-ddr-pmu
>> +      - items:
>> +          - const: st,stm32mp251-ddr-pmu
> 
> You did not implement Rob's comment.

Indeed I miss it. Will fix it for the next version.

Best regards,
Clément

