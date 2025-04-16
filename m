Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F84C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nfj8ktwxTSwL4bkXkIYJkl6noTbTsbTVvXV1tbIysv0=; b=28J2YPNa4q+W5tdtMKw6A/0ugW
	jZmmdRAOZJF3EYTKpAxu+IXMgSh2NuDpM03M0BiQwMnfhxOwhoj7bSVth9MQKJQYLylxPcykQn0Sm
	oFeLqCsTiXSyRml+Phm0bAdHSw3QHJHmwaQFFXe5ZGc8x2J2f9iqzSTUXrdq4edRRjZbW9tgUewAi
	B0bpeNtTEGLNIaAJgDbyf+7EFq5wf2TntH5OBrjl11BsKVGhM1x3wZqyUY+GfVFOSw7SbcIIU+7qC
	udk8tEtTzdT4+lphuGhOOFAHgk77ZcKOhDvKCUcaUm5PL1ZMhazdHhIHszb41xFbSkGuSl2VOlHs0
	u8jXwjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qWN-00000007dZu-1QQG;
	Wed, 16 Apr 2025 00:20:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qUR-00000007d5q-0tTW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 00:18:59 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2279915e06eso66345525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744762734; x=1745367534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nfj8ktwxTSwL4bkXkIYJkl6noTbTsbTVvXV1tbIysv0=;
        b=d3jhfAeGi3IcKUbpVDbYotvS/ZrrNem+gTyp0dLjnKJHdkVE1kFZ+a7/q6b0tl3vVz
         k2uTJmHPAcc6GcM4KkIMLkQQCF72OyCm5GW4S/3KWz9TqjZULmuNvDKZEdVqXsTVSSYi
         Du1b388rRA9iOczkaGpHCoywnA22nhmRjNdAyu08HRjoPOdxiEnLxiO6cjvFR+qhBg9d
         on1jo5YnhMKs961zBTojS7Zf+0h/XFcYpj7/9U7XZeSGSRdw5LP9VT20LTa5ZbkySrRp
         yPvWR84KxCucqfAp0s+mnZX8Dbst9RW31rEy5ca5JMGDN3TeVtELTgTR+NGrmg/ypzrd
         8kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744762734; x=1745367534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nfj8ktwxTSwL4bkXkIYJkl6noTbTsbTVvXV1tbIysv0=;
        b=h2l/1byUlA5G644c3sYYvlOqFtaM8W/a0k/ISzPnO//Z9Ke8jCCAel8WLYtnp5aPX2
         685MB8XHixApmpS3WTbanu6zJpsCHHsJs6RXzQVVs59sIWSBNZfecsDq5R3Oc01Vf8JG
         FTV+l3dg2Vmjwj+VzgBw6H3FaTlwYjOsUssi5mmR4KRUSNZEbJWAbQ5ETWqZCRUl5f0F
         tFvUFrM44dXJFPPMocKWMJfbHW4Fv9St71EV03AysWYOhUV9jpmyw95fbwCfh6jICQIC
         ZNE2R0xIvKHf9w608+GvHpScgc7mLANF4qqwyklUICwJd2OZfkg3TtokaMit/yC6C5JI
         ctLg==
X-Forwarded-Encrypted: i=1; AJvYcCVEj5SJ+HW4Y5ln0gZWLVEsnBnCxBmOtoC9lxP3yHqkJZRnaVTrHe3vd0sC30Twb4OZ3uuCI5KjfkqIiCXUDPFp@lists.infradead.org
X-Gm-Message-State: AOJu0YxTOaBhiZ0RwHwa9UdbmjmNtKdBLv47/kactjZvVjNuwDDc9Vhy
	E0QwQ9RVIBKHhKRMse0d61g3BBCU3X9NOMYYLYlCrA6RAnWzU2o5yCqA6Q==
X-Gm-Gg: ASbGncv+wmlup8sHcsHlMOhGevWAVLyutQQy/nk9xiyPl38ij/kmxEIwiP6gXmQ3o0N
	hmKCzpJAzs1cCBKolhIYlKg75iXhN6uWoMBccr/3kjtWHgx6Xn7s3jZRxXGNXfQ1ZdzsVWXiBLc
	C/ikLY2pcsDRinn8gk+1Mk+bvmUiyE2qhl0IBEXJiH9ar2dkFV1XDpoMQ6F51ki+GF6zPY5MYRL
	VwAOBsM3KQ6nFkVWG7u7p8F82TCl8RHK6Qs4XnCD8hKIzV4WFYJ/brrYFccT8+SEYnM0g5NLTie
	NNaQSNDjC4ZnXdgsMO0RALraL8qKn7OdwrGbvlTv0yLEzXnEAhPVxemTcKM=
X-Google-Smtp-Source: AGHT+IFrWUVq6l1nS395CfiIcyKNT6DSygmpfiB+tI5u/2+sWwofsKb78LA11Ll+t0ii+Gk1Pil+iQ==
X-Received: by 2002:a17:903:287:b0:223:4c09:20b8 with SMTP id d9443c01a7336-22c31abcebbmr17817755ad.37.1744762733812;
        Tue, 15 Apr 2025 17:18:53 -0700 (PDT)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0e90sm1489655ad.2.2025.04.15.17.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:18:53 -0700 (PDT)
Message-ID: <63957942-173e-4c28-932e-a8ba7c60ee83@gmail.com>
Date: Wed, 16 Apr 2025 08:18:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-1-22067be253cf@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-1-22067be253cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_171855_251850_E3CA9180 
X-CRM114-Status: GOOD (  17.66  )
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


Sasha Finkelstein via B4 Relay 於 2025/4/16 清晨5:52 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add bindings for exposing SPMI registers as NVMEM cells
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 44 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 45 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0041babefc37ed4d82d7d6f68fc67d29eed53d9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/spmi-nvmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic SPMI NVMEM
> +
> +description: Exports a series of SPMI registers as NVMEM cells
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,maverick-pmu
> +          - apple,sera-pmu
> +          - apple,stowe-pmu
> +      - const: spmi-nvmem
Consider using pmic instead of pmu in the compatible names for consistency (see below).
Also, the PMIC definitely has more (mostly independent) functions than just non-volatile
memory, so I am not sure if it is really appropriate to model it as only a nvmem device.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    pmu@f {
> +        compatible = "apple,maverick-pmu", "spmi-nvmem";
> +        reg = <0xf SPMI_USID>;
> +    };

As agreed on the series for SPMI support, this should be pmic@f, not pmu@f.
There should be an nvmem-layout subnode in the example too.


> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b82704950184bd71623ff41fc4df31e4c7fe87..e7b2d0df81b387ba5398957131971588dc7b89dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2277,6 +2277,7 @@ F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
>  F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
>  F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
>  F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> +F:	Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
>  F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:	Documentation/devicetree/bindings/power/apple*
>
Nick Chan

