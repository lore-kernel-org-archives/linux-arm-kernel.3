Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8EECCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLynAwLummNFnWwX4n28DdGVDlN0LC2dmV54+Wl5oe0=; b=dZ50k/pic4RLP/dCd8OwhDLuDY
	lQ2lxoghTQ8XMMfe+c6DbADnBFgTVpD0ZlzkNi1cwOp6hrQeZ5sZTIhp84cF+4EqW/Eg7hP6pfVKP
	/J93YndofhQlJVVRpuC8mM+xJ6nqUDRKJUOvVPsf16H9rNb99+SMQiG+RkLPsmtQbHSqThJ+gh0Ba
	SgsQgBCJxJObfkNGd3WDolvXvHg3ygVTWd2ZhBaSdoI4dD7jBKUkc2gbTg7yHwYG0Vae7ecEmF4f3
	N9t86R2MUiV9Zhbtsvd4e/BnAOYLE6Yk/iUTRQzY7sbqTAObtDoOq9ZmmTK1xapyaGBXD/Nk5shPr
	w92QivSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYFH-00000002pww-2Hvt;
	Wed, 22 Oct 2025 12:47:15 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYFE-00000002pvI-2vl0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:47:14 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b5a8184144dso1119565966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761137231; x=1761742031; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WLynAwLummNFnWwX4n28DdGVDlN0LC2dmV54+Wl5oe0=;
        b=ltKdbXmTFeA6U1XD1EmZHvUWaBKUSwHwKq/YWjFOFFsn3gDfBNKDx8ZyamIlAjnTgJ
         o+a/6CujrgDom11Shn1aIZif7jiLVoz3je6YAgcdxytRCFdnUok/FT+BbBzngz5RwrvG
         zV6FiLXGmukt+ze8XfVpl0SYvWqLiQHauQ53W8+wbMiR+UOjtmVjPf6lt1T8XAb73yng
         ZEZ0hRnRyd8Z9o1NINUXaNhdR1plyjXmZnqe/3LxtjT2tWQGs6mX/WKF6xTTYdWrHlaa
         BymZDxQy4fXjKrVXmYPy/9d+yE/r8hYFK+CZbcvNaFKqsjHdMvUjMKWZ4Xs7MDpAlFuj
         9ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761137231; x=1761742031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLynAwLummNFnWwX4n28DdGVDlN0LC2dmV54+Wl5oe0=;
        b=c35TAxhOlc0/yC9nCO+QU2DVFa7pZp95qyMs5tDLoP6/fYJajhIX0MsgAlL9ihIt5h
         IWLRXkvayH+uTJmXu3zlltBLVEKqSL+jbR+8pyfDbHES7U5k+SlonuqLfkpIHa+EdhPy
         /9dJvb5gXGaxO1deJtFSEScTHtU7FTm+9SekGUWrUYwQtsowuzRz0Us+OhwYHtePwGRO
         BjyKbzVN36591te7pXngVxQEYsde+d7ue7i8tcaJTCy9dGFgEAfuwsJAoGsDXrXPgiRo
         0SwFaV1RdhFjCiMsQktE8SOwSUQfEJO7dhaZyI30qyhOFArf8ucjhFRPO04ShuMl6fhD
         3ypw==
X-Forwarded-Encrypted: i=1; AJvYcCWW2zTp69zA3mbtJ/3+LQq7GOWBarrx9piELq29Ak0nxXtHlCnbk3hxsQK8S2KTteNdYqlxNjm9aOQ6Co7zXMU0@lists.infradead.org
X-Gm-Message-State: AOJu0YzaYS/LOS/jdmPKnaYx+mAfxId8pZHwGAk9+BXPmKaU69fOLt1Z
	4DHAVhZdayY5mNtIk4dHqNM6eYyWcTwtvD9wUsvKBVgvUKvDblfcMkEU
X-Gm-Gg: ASbGncs6QMo3twfCH6g+sg6Wdgg7FBvuQsCyUVGWTMAeXCCWWsDhFSnXaOuJdU2VDc8
	q05pqG0e/IIOzicSF/RORZn9QbAr7RVTp6YFwB53j/D68Y4NRKc9B0BBu7iQlXh2h3xsZ5uY/xT
	+yaVCEk9t8xn4A1SkwH8kz3r0KAxcPE+kHLNiX9CBlvcC5+fSJrf5i5FVcKum3Iv9Y6sf2GCXPi
	o/flqR1O7+522pHf7rzMb+SwKSCAQLp6D5adKTU9rzO5DMw55Gi0QkWSaJDlyjhcT4PqLYwsQ1s
	VWLhcAVJt0tgTpuXgjHPxyd2nZA98+CqF7TStgoPwPtWetU6ASobJ1IOYO3gnU47FYpjfPTR3Fj
	j2DUl/7hBFmwntQ+aO7uWgSaWfwxnJRkvZLcRaITz2cYTJ50qnkmmJrjt/XngyRlD7q6f4PQZCn
	mBHRc34aHrKuWeLCODU9VWNAHXUXTfw+8L
X-Google-Smtp-Source: AGHT+IGCiRZUzBeTTRPZMe41X5ri9BkZhxAmfickbiqaWRlTqLIQgiyG0FTuaEpUWryBaH8SWItowg==
X-Received: by 2002:a17:907:6ea8:b0:b3c:f0a4:b324 with SMTP id a640c23a62f3a-b647463a1a4mr2231638666b.21.1761137230559;
        Wed, 22 Oct 2025 05:47:10 -0700 (PDT)
Received: from [10.25.209.134] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25c9sm1360292166b.11.2025.10.22.05.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:47:10 -0700 (PDT)
Message-ID: <41ab3845-6d6e-44d1-9bb6-b62e58ab6522@gmail.com>
Date: Wed, 22 Oct 2025 05:47:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
 <aPJZ6dDRyyl3Qg4o@lizhi-Precision-Tower-5810>
 <cdecae8a-7fb9-4ac2-a412-1a18c4783ffa@kernel.org>
 <aPZTwf8O8tkqnDhx@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPZTwf8O8tkqnDhx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_054712_799926_0B36CBFE 
X-CRM114-Status: GOOD (  18.99  )
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


On 10/20/2025 8:22 AM, Frank Li wrote:
> On Sun, Oct 19, 2025 at 12:05:27PM +0200, Krzysztof Kozlowski wrote:
>> On 17/10/2025 16:59, Frank Li wrote:
>>> On Fri, Oct 17, 2025 at 04:20:19AM -0700, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Add documentation for i.MX8ULP's SIM LPAV module.
>>>>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 72 +++++++++++++++++++
>>>>  include/dt-bindings/clock/imx8ulp-clock.h     |  5 ++
>>>>  .../dt-bindings/reset/fsl,imx8ulp-sim-lpav.h  | 16 +++++
>>>>  3 files changed, 93 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>>>>  create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>>>> new file mode 100644
>>>> index 000000000000..fb3b9028a4c3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>>>> @@ -0,0 +1,72 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: NXP i.MX8ULP LPAV System Integration Module (SIM)
>>>> +
>>>> +maintainers:
>>>> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> +
>>>> +description:
>>>> +  The i.MX8ULP LPAV subsystem contains a block control module known as
>>>> +  SIM LPAV, which offers functionalities such as clock gating or reset
>>>> +  line assertion/de-assertion.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: fsl,imx8ulp-sim-lpav
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 3
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: lpav_bus
>>>> +      - const: hifi_core
>>>> +      - const: hifi_plat
>>> dt prefer use -
>>
>> I don't think we ever expressed such preference. Where did you find it?
> It should come from review message when submit binding-doc patch.  but I
> can't find it now. But at least, compatible string and node-name use "-".
>
> It'd better to add to writing-bindings.rst. It is hard to search whole
> linux-devicetree mail list or brain may cheat me. It is good to keep
> everything consistent.
>
> like:
>      " vs '
>      VCC-supply vs vcc-supply
>      ...
>
>>
>>> lpav-bus, ...
>> Then just "bus" or "apb".
> core, plat is also better than hifi_core, hifi_plat


sure, let's go with "bus", "core", "plat" then


