Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3762E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xImzGzANXk5DxjlwcfseHJU01hxo/jjlwQJDD52qyl0=; b=1lG+hOKhGLA3nwvNjobif+bOjW
	BzPEAzuosYYq8SHjKfzpoXAyC5Kf0LTxhY1AXS4SOTPhRHa91dsRzA/GVNZdOOKiLIw5xOo8LuNVB
	8Gx61LIzACcU9ftQ6gI8v0S4EqZgL7HlfTr5Vk1uHXdaJKuX55nm9M+0+xZxB61fyl20fGaLV4/zW
	AH8CGjgT/nM7N0XTYeseoC5/1TXTXYn4SOSp/6ih9pQ45uWBofopj3Cby90sSeT7dtQ8qJnDtie9d
	AuVqq4lfYiZLVDpCqWfRLLzGooebAKyyTtDANKcF2gEirv09+Ito4/8jrghIsWblQFd71YIXDeAGr
	j7oDmGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQT0-0000000Faym-2G4h;
	Wed, 11 Dec 2024 17:25:42 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQRJ-0000000FaMH-2aqg;
	Wed, 11 Dec 2024 17:23:58 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so4729545a12.1;
        Wed, 11 Dec 2024 09:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733937835; x=1734542635; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xImzGzANXk5DxjlwcfseHJU01hxo/jjlwQJDD52qyl0=;
        b=bnGaG3KejsKThKKeEv/62785hCzLsx7ZODikn7FzjaH3oFkXfGoIRyETJCQutl/+il
         Mo4yrGCw+dlWwO7dt+S3LouezpdGrfVwDEMsekIKa/bDS1QMjcnbH0I7WMlnCKd/FQdd
         r6RITb+7g3ASDqbXmT17sis6ZYxTBURHMBfhDHSe+5eddjFQpPvOmIgLnVCTBWrHq6ui
         EfGspM/CYF+ErzCeJp+Olyq8Z5pA1rA3WF5gE+ySvD1ywmN3BJovnjD8vPxYRF1Wj3Gc
         z3WYcmc41tlW8IEw0e2mF4aGIdM5Tm2IICPWKhKg49Z0cBMEGcB5rNA1NBLcbGK8MFLX
         OnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733937835; x=1734542635;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xImzGzANXk5DxjlwcfseHJU01hxo/jjlwQJDD52qyl0=;
        b=KBn4A8LtDHE/rkoiImNR33QSxO/LAwQV1zezO2uZ7wy27BY496ccYNLDdwtwDqFdtI
         zfHX+AIDlm6Ns77n7ix10VzeNKq35b1ShQ53cNTR+mcbpEoOnd1HeYtZwa871e8wvRUz
         plscn0m+Qq2qU3lBrBs/Q8MwhIdj8UspqdEZtzFsfqxwm048l7skm341rpyi7CVmGEoV
         PzgCAFv+lVxtflTBh5jDkKfM9kVfHAmTAeqsIvpHuHr6YJqZHb5M7kamRWEa20GFNnHz
         V1u1Jm9+7a/+uwq5CO6luK7nMkcmqwv/LXJddjzw8WoqNRUvLOwgHwENk5qruntAn9Bu
         PZSA==
X-Forwarded-Encrypted: i=1; AJvYcCUOeM7jdI9Mvoez655rHgaSCZ/Gvw4B//I3dN6B6mPcKFlv07dMH+9SVuqVKkSBgJU3WHn+XY4VU2hwAlFbKBai@lists.infradead.org
X-Gm-Message-State: AOJu0YxdiKcM7zQrfJMUNMzl0TF5i39yKp9UOlEgU1g/7ftytP96NaUW
	edehNynoTrnXLR0+P4Tn7fXz6OpLvDHjCnk7NxxMpckk1yuZ7M4K
X-Gm-Gg: ASbGnctvxNhnGZaB5iUHxFJymXP7KNb3jBl5FFehcpIITrukziJhe1THISybHqQn04+
	koq3ByPAfYVDIwjgatvUTIz5qgGTzFswxR210f12t87wnpn8wAVJf9UslA4vd4MXbO7Cv3xL9Z4
	1+gnn0o++x5PiqWxxebhcibIM94fzbnKwyedsxHQ9wo+D469pTT97IhKIn+6oykTVVSpMTQKtFE
	DVaKGeVzXC+eHhCP1caG7I1UHEx9HJKMJUqnXH8WxY1GQFUFDb3aWFYNdxvdCkJEyt7uMXETbSv
	9Wlpi8gp81TD53qIFCqaNKxi0p6tubW/
X-Google-Smtp-Source: AGHT+IH0RIu4uq5umvRtCi0hsAZI3eC3FhPsXctvlNPCuDi9NspA8MfTgjbIzEfgLbI6zohVlTLE5A==
X-Received: by 2002:a05:6402:5207:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5d4330a49f1mr7965722a12.17.1733937835207;
        Wed, 11 Dec 2024 09:23:55 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6a3537ea9sm285032666b.58.2024.12.11.09.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 09:23:54 -0800 (PST)
Message-ID: <f395a019-800f-49a4-a3cc-28efafc4faa9@gmail.com>
Date: Wed, 11 Dec 2024 19:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: power: actions,owl-sps: convert to YAML
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-actions@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241103123917.2890436-1-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241103123917.2890436-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_092357_655435_6BEE6AC2 
X-CRM114-Status: GOOD (  22.15  )
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

On 11/3/24 14:39, Ivaylo Ivanov wrote:
> Convert the Actions Semi Owl Smart Power System (SPS) bindings to DT
> schema.
>
> Changes during conversion:
>  - Add a description
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> v2: add r-b tag from Krzysztof Kozlowski <krzk@kernel.org>
> v2: update commit message to be accurate (Krzysztof)
> v2: don't preserve formatting in the description (Krzysztof)
> v2: add a blank line after additionalProperties (Krzysztof)
> ---
>  .../bindings/power/actions,owl-sps.txt        | 21 --------
>  .../bindings/power/actions,owl-sps.yaml       | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 52 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/actions,owl-sps.txt
>  create mode 100644 Documentation/devicetree/bindings/power/actions,owl-sps.yaml
>
> diff --git a/Documentation/devicetree/bindings/power/actions,owl-sps.txt b/Documentation/devicetree/bindings/power/actions,owl-sps.txt

BUMP - what happened with the patch? Been a month now and
all the other ones have been applied.

Best regards, Ivo.

> deleted file mode 100644
> index a3571937b..000000000
> --- a/Documentation/devicetree/bindings/power/actions,owl-sps.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Actions Semi Owl Smart Power System (SPS)
> -
> -Required properties:
> -- compatible          :  "actions,s500-sps" for S500
> -                         "actions,s700-sps" for S700
> -                         "actions,s900-sps" for S900
> -- reg                 :  Offset and length of the register set for the device.
> -- #power-domain-cells :  Must be 1.
> -                         See macros in:
> -                          include/dt-bindings/power/owl-s500-powergate.h for S500
> -                          include/dt-bindings/power/owl-s700-powergate.h for S700
> -                          include/dt-bindings/power/owl-s900-powergate.h for S900
> -
> -
> -Example:
> -
> -		sps: power-controller@b01b0100 {
> -			compatible = "actions,s500-sps";
> -			reg = <0xb01b0100 0x100>;
> -			#power-domain-cells = <1>;
> -		};
> diff --git a/Documentation/devicetree/bindings/power/actions,owl-sps.yaml b/Documentation/devicetree/bindings/power/actions,owl-sps.yaml
> new file mode 100644
> index 000000000..0855d82f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/actions,owl-sps.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/actions,owl-sps.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Actions Semi Owl Smart Power System (SPS)
> +
> +maintainers:
> +  - Andreas Färber <afaerber@suse.de>
> +
> +description:
> +  Actions Semi Owl SoCs feature a Smart Power System (SPS) that manages power
> +  domains to optimize power usage across various hardware blocks. Each power
> +  domain corresponds to a specific hardware block and is represented by a bit
> +  in the power control register and an acknowledgment bit, which is then
> +  translated into a corresponding voltage on a rail.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - actions,s500-sps
> +      - actions,s700-sps
> +      - actions,s900-sps
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#power-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/power/owl-s500-powergate.h>
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      sps: power-controller@b01b0100 {
> +        compatible = "actions,s500-sps";
> +        reg = <0xb01b0100 0x100>;
> +        #power-domain-cells = <1>;
> +      };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 76ea65128..420d06d37 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2023,7 +2023,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
>  F:	Documentation/devicetree/bindings/mmc/owl-mmc.yaml
>  F:	Documentation/devicetree/bindings/net/actions,owl-emac.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/actions,*
> -F:	Documentation/devicetree/bindings/power/actions,owl-sps.txt
> +F:	Documentation/devicetree/bindings/power/actions,owl-sps.yaml
>  F:	Documentation/devicetree/bindings/timer/actions,owl-timer.yaml
>  F:	arch/arm/boot/dts/actions/
>  F:	arch/arm/mach-actions/


