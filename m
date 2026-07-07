Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD75C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tloVg2Aaw8Y3KQHI7A7bfES+Qd3tOWSZufAREWX/SmA=; b=o5WMeJxq/1wP4U7O1pq33uy5dO
	Y67wxeT4KgWa/SDpumijrY3xeHAWjb9oyIHNl1dvA8QC16ID6AKe0NmrEn2hK6gcYiKo0X4WpU4D7
	Rq1QwKFy8r+PwHG4RYBkrV0VSoPuMiMVbWhbWzgphyuF2NTTDVeqNu8tcZkpbYVgKW3l1dwYItTPv
	8hZv1cWABHFn6cbKlJiVQ5M5FYtLniWkAkdDhHaG10XQazh2Nx/282k2MrYyNqypLp0oHSZ0NoiQG
	OErMA/XgbCbtys+VwBVtuF7L9ukFcPuwe3XZXYLXTr3ZDcYX0dakS8R7B8DRP5S6YRpw+YubeTAWc
	fhBE4Bng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh59Q-0000000Eym7-01Iq;
	Tue, 07 Jul 2026 12:43:48 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh59L-0000000Eyji-3nhX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:43:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so6100281a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783428221; x=1784033021; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tloVg2Aaw8Y3KQHI7A7bfES+Qd3tOWSZufAREWX/SmA=;
        b=Pf7+FQOO7FmN4VUniBoQUqPoguqvduj5TFN/rrVwdXMdh98n29r0vX3+M3xdx+Cnen
         y7Lf+5sA+MpMaEg6rkoeQDdIbAsUAuJ9aYkoTLjgqH+j5jVcwyNS3bNBgUBizqirXo4m
         la9d9L3t8qvrK/lRA+xS/lRGr9NT1fZe9fIFJ/K+fsAOCkKmUHNCFO8KyTrJgoPDdGdC
         q1prSRyuWsVRF8l0T+UoeWm6F/JQOGhGRcEz3iQfs7MBJ9oe7RQ+GDF7Xi2SGiNZJ4cH
         PDid6sl8Iz5yWI00bZzMBKMwLjEvgEpqlanJL1KqjhhW6lQ7Q696T0zcXQxeRD2aQlFZ
         KJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428221; x=1784033021;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tloVg2Aaw8Y3KQHI7A7bfES+Qd3tOWSZufAREWX/SmA=;
        b=AXWWPbDovNXLDyTBguyhII+W/ZeSvrKH/k6Bj4DlDoTGsBqIXKNDoQTOSd7V69uEcF
         g2oEcX5Ok0cdBaM4KefCJZyn7erRWqLyZF4qFro9mub31XscGs/k1nd32qFcAcswp93M
         bgXN3WgE/6E/V3BaTNNj8CcUu95zGyfZNXOYy3ijSOHHByp/qHwbtEKiaMuc+7PcIt8r
         XLKNWCduxOvX9ZRmMQia9faY0klooAjSzkmMdH3BC/j8eU8oBJ1yFp36f9yGxDVx0nY+
         76EG46Ccd3xx6SdS+6uNToSJQRpove8h9AUgW31rSUxWtPVJxEzYstYZXvDmLcpGTo+V
         5uUQ==
X-Forwarded-Encrypted: i=1; AHgh+RptFtAdYjkCStl1NWxXAc8QxTlygLKQYa804OeeqEbojPsDvfdcu3fj5F8WWCxz5mtdYl9uhdswud8cz6tXslcA@lists.infradead.org
X-Gm-Message-State: AOJu0YywIQcWE4Dq64aShD9Gem+FBIehUYbPG6JGktoLN4Rr4HN7YhVM
	mHfQHUKjOodeqi8DCd4YFTlHEyoXVmV9MPyTMWUY8d+ppG1a2TlzvYA+Z+lXwLUYjzY=
X-Gm-Gg: AfdE7ckd/EKde0xwXhL8nkSAcL7vueTKfYfxe+J3qeR0ixBArE1GawEZHF4M1hbn41x
	MiS3Upgelze9DM4SVTmoLVAZ1JdoobQ6q+6tuAwR7f8cBJ1wgCoVpz/xSOVL0ERE4eeNgwLk+wx
	dFx+DycSNHFOBh7GLOx9GKrwVGctRMhEefJJruKYJml8QhkTvk6fhNX8f3sjnFM9s8GhA8oVoba
	qbvfT0t+uGVeUUAkIILDd1kCBCJJPY7HrXgDqZ31AKnXmChlSOZ+gI0eM/BBscTTcMqS/R02MOI
	BxIw5gLYIemDrIEklXKRdkOO9npvyq30pMh67MYiCtkuPK5i2JmdCALts3oIXXA7Bo0OD0MdV3w
	qnej91RqA7TYQ67XSrZu7xIN99wLsy1hs0l3Z2ULsLtyZT6NjFNCFspY1nCZbpY0WM3bY1RkjWn
	mxwlHFn5nDtzqPTUAUTo5ecuGynUK7XS6j8MdcWIQLuT+pAFL/ah4GzazNPXz0
X-Received: by 2002:a17:907:706:b0:c12:9eb4:48bc with SMTP id a640c23a62f3a-c15a68e577fmr284656466b.51.1783428221058;
        Tue, 07 Jul 2026 05:43:41 -0700 (PDT)
Received: from [192.168.2.177] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82311fsm131994866b.8.2026.07.07.05.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:43:40 -0700 (PDT)
Message-ID: <f5e3ea50-5f52-4a4a-aa8d-827b14f87faf@suse.com>
Date: Tue, 7 Jul 2026 14:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM
 controller
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, Sean Young <sean@mess.org>,
 Julian Braha <julianbraha@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <cover.1783097764.git.andrea.porta@suse.com>
 <67d51a7210f0d7410dbe34e3d93813db1fecd622.1783097764.git.andrea.porta@suse.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <67d51a7210f0d7410dbe34e3d93813db1fecd622.1783097764.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_054343_976700_C608F194 
X-CRM114-Status: GOOD (  18.72  )
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



On 03/07/2026 19:05, Andrea della Porta wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> Add the devicetree binding documentation for the PWM
> controller found in the Raspberry Pi RP1 chipset.
> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
>   1 file changed, 66 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> new file mode 100644
> index 0000000000000..970d0f3b33bbb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raspberry Pi RP1 PWM controller
> +
> +maintainers:
> +  - Naushir Patuck <naush@raspberrypi.com>
> +  - Andrea della Porta <andrea.porta@suse.com>
> +  - Stanimir Varbanov <svarbanov@suse.de>
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +description: |
> +  The PWM peripheral is a flexible waveform generator with a
> +  variety of operational modes. It has the following features:
> +   - four independent output channels
> +   - 32-bit counter widths
> +   - Seven output generation modes
> +   - Optional per-channel output inversion
> +   - Optional duty-cycle data FIFO with DMA support
> +   - Optional sigma-delta noise shaping engine
> +  Serves as a fan speed provider to other nodes for a PWM-connected
> +  fan using shared registers (syscon).
> +
> +properties:
> +  compatible:
> +    const: raspberrypi,rp1-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +  dmas:
> +    maxItems: 1
> +    description: |
> +      Phandle to the DMA controller and the channel specifier for
> +      the duty-cycle FIFO.
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pwm@98000 {
> +      compatible = "raspberrypi,rp1-pwm";
> +      reg = <0x98000 0x100>;
> +      clocks = <&rp1_clocks 17>;
> +      #pwm-cells = <3>;
> +    };


