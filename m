Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C75CCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ME8ir36ArdJeQ8VOuoWbknt4FySWcug96E0ZWizlwFA=; b=pvx+/xAZV+lS4Pk5n2Pnq+PE7N
	c65L41Pg/sfLPDUNGxqF4lplAGOLB1S/58HFqgkvXcpR2sAI59pKDueHCS30YZ5Z7j0/7rjrIzkBs
	GbrassVbINe9wADrCwmtGzV1W5vgoS9TfaOfxczqG359HXEWnQp54OfD/JhzmUB5/B3uGqXgXiHCy
	BObWqI2LsyfuqHZJNZGBQIoj3ox9UhDsRora1vsXgXqrwvGEBFhtU5stot4Q5UExt80I23J64eO7b
	NK+rIEEMmsgFeTNZPkriMYmODl7wpfvOIkCH5VrNLIw3cQSQaBCOQf5NVbPNlUDoker5gLWFoXj1O
	LssyWqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HyH-0000000D9lA-2DNQ;
	Mon, 13 Oct 2025 12:48:13 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HyF-0000000D9kf-3AX5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 12:48:13 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-63bc12a5608so625495a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760359690; x=1760964490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ME8ir36ArdJeQ8VOuoWbknt4FySWcug96E0ZWizlwFA=;
        b=W3dxZ4pu6SJRlNZHybBCgLjx109/MYQhjAtwiNjFqo8AYpWNhR2HXg6U6pvHnqdy2K
         5D9Sn2SOWotcEtUQV1mmvPGVMih3KRbUzT2/WUexz+fS3dF95pNxmrxjP8919sJOvY2h
         iw2ho385c22Ia98PvWzY6a5EXIISBer/vS0TTv1S1rye70Oto++Ph+tIDWR7TLDYAYd1
         /yO3dA4ha7vqxFhFbafnz36zafEr70E0OU8D56b8wWcCTg/C/GH7Qefq4LFsxogTLG2B
         0zRophTWmxF48kj0swQMNCQvZXXn4rbP+LuRtO0clI8cnCkpWGK+2owi7Nu31grlStWd
         jxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760359690; x=1760964490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ME8ir36ArdJeQ8VOuoWbknt4FySWcug96E0ZWizlwFA=;
        b=t5Mea8r5J6pHtpqd3qXeEZVhcCPKmRWwsPrglnpxHcc3r5Mbfok5w3CzR3Ff/eiicI
         MoWCh23gFcOKaiEWci13iHp7im26+fr6S7bPar0ziAjMzct1sG55uSsi4LEE4OdTQ5hy
         KIoWTcWWc1rlFER/J6xgGF8RH85J9nQeDb9oazLaz0K3yb0oydVk6t9xjrTNy8Q8KIzM
         /UTdvImunSCf4E/4cjpwG7XYJNfTMnnhBCSfwV5xltixXN7pdPwDA9BasWesOLgQmU5Z
         iGfLdd7QGh0O87zV9ll1zDc33+opSyncYzbG97cEIB2IKMaNMt+S13jldDZt8nKrEFSO
         VEAA==
X-Forwarded-Encrypted: i=1; AJvYcCXd9dUBMM+/gcBMRVSWGLorOMPPUtBBHa6SbRU0NB5OVCMcJ7AKSdUPkL0mNnnPNgY5FQEom8zCkne1H8ICpYrw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+vdbTw1NjbRhzyEmPaD3Y+U1PLQV20YrL8aOtzHMXLSWh+M2u
	d3XsYm4kjR3KEPT1KCrCVtvf/adXJ4Db2KeQO0EHp8qCXgtnT0yaihsC
X-Gm-Gg: ASbGncs0LXnDdqovvx1WyUzvCb5Z3sCdgmMMwej0saQplMKydXhLBuk8BiFo2AIvkbc
	RKprjoVMtSskFhzFWse56oeZsr1eSe7mwO7sHWT/5xGbgHQCouRsauFhW3QMWcnofU6pP0kfMF5
	BFweT2c0fyoEn09E/zdlsThQVqP5WjVeMadXoda+XCtEKlH8qcHvL2bnkqMKn/483wTKzTdL3yl
	9kEHirEsbkVVxRgI6qV9MuVJ+Sggm18cmUgZ8ZoQglOwicqd3U2aQ/Zx/uN+OaTcSdi1sX6ReRI
	A0S3gDNjW6eh64Le8jJpdn0bxJEKPT6uODnmi5VVdxNXGvPAvIsyhb5EItTZ8oLrfC0Fn1eKcwQ
	MLb1O49eRm4ErwSIoXkfi9w/GgbmEHoQuu0GzPjgxHbgMIQUnG8RuT92B4e5iuxoFjdebSYKEU3
	OPXBDB
X-Google-Smtp-Source: AGHT+IGhsH9Jko1f8FqT4pidOms6fn00pFogStN/Ol9Z3CUMb20PsGcKDB/1u9de4k8QmAJ4VfkJ0A==
X-Received: by 2002:a17:906:4a85:b0:b55:c35e:e533 with SMTP id a640c23a62f3a-b55c35ee5d6mr1063241366b.12.1760359689360;
        Mon, 13 Oct 2025 05:48:09 -0700 (PDT)
Received: from [192.168.4.55] ([92.120.5.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacba7sm916644566b.5.2025.10.13.05.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 05:48:08 -0700 (PDT)
Message-ID: <1ad36baf-83af-4ab7-9f47-dd7f74d4749f@gmail.com>
Date: Mon, 13 Oct 2025 15:48:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: clock: document 8ULP's SIM LPAV
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
 <20250804155407.285353-4-laurentiumihalcea111@gmail.com>
 <20250805-stereotyped-precise-vicugna-1c78ff@kuoka>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250805-stereotyped-precise-vicugna-1c78ff@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_054811_843043_FF039D43 
X-CRM114-Status: GOOD (  21.74  )
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


On 8/5/2025 10:03 AM, Krzysztof Kozlowski wrote:
> On Mon, Aug 04, 2025 at 11:54:03AM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add documentation for i.MX8ULP's SIM LPAV module.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 69 +++++++++++++++++++
>>  1 file changed, 69 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>> new file mode 100644
>> index 000000000000..ef44f50921f8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP i.MX8ULP LPAV System Integration Module (SIM)
>> +
>> +maintainers:
>> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> +
>> +description:
>> +  The i.MX8ULP LPAV subsystem contains a block control module known as
>> +  SIM LPAV, which offers functionalities such as clock gating or reset
>> +  line assertion/de-assertion.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - fsl,imx8ulp-sim-lpav
>> +      - const: syscon
> Why is this syscon?


because of the MUX child's progamming model (i.e. "mmio-mux") which needs a syscon parent.

will get rid of this by using "reg-mux" instead. There shouldn't be a need for syscon anyways.


>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: lpav_bus
>> +      - const: hifi_core
>> +      - const: hifi_plat
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +    description: clock ID
> Drop description, redundant. Look how other bindings write this.


ACK. Very sorry for the easily avoidable mistakes.


>
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +    description: reset ID
> Ditto
>
>> +
>> +  mux-controller:
>> +    $ref: /schemas/mux/reg-mux.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
> reset cells and mux controller.


I'd say the mux-controller child can stay optional since the driver allows it?


As for "#reset-cells": unless CONFIG_RESET_CONTROLLER is enabled, the driver allows

this property to not be specified. The whole idea was to try and make the driver more

flexible in case, for whatever reason, people wouldn't want/need the reset controller bit.

In hindsight, I think this decision makes writing the binding a bit more awkward (since the

optionality of this property depends on the value of CONFIG_RESET_CONTROLLER) so maybe

we'd just be better off with having this property mandatory and modifying the driver to remove

the aforementioned flexibility?


>
>
>
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8ulp-clock.h>
>> +
>> +    clock-controller@2da50000 {
>> +        compatible = "fsl,imx8ulp-sim-lpav", "syscon";
>> +        reg = <0x2da50000 0x10000>;
>> +        clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
>> +                 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
>> +                 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
>> +        clock-names = "lpav_bus", "hifi_core", "hifi_plat";
>> +        #clock-cells = <1>;
>> +        #reset-cells = <1>;
> Incomplete node - missing properties/child. Post complete binding and
> complete example.
>
> Best regards,
> Krzysztof
>

