Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA82D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFd92mrT4vT9LbEkl123rvklE/FQdMhVq9EhkKWamEM=; b=tpJkCJHY6/T8u5WrmcQded5hno
	Becwz3u+67FwrkPeGkGky2UT6CWYD0+Ayou7AJ+m+Jhk7KKeYPBmzlK04HSfAF5fxjQvn8uGrHHH1
	Pa7DerprQN5up7xRyppGVS9BvBfSPCQDJqGhtqANncgReMid4Jc7XTKtWEeWysrZkB5e5Bx0bM5Yj
	0sVh/KHOuZXxbR0hAD2OAzsfnsWiIVwh+v3LnkpQauqdg+qnRrnuW7AVRvx8zi9PxLQbMeselUfXm
	35uT49SRVsoiSsc+JuNDanFS9D7k722ff1ySNa+jzks6hN8FzcLcjmri8yQkjUMOSWLwpqaUEaymz
	Denpke5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OCK-0000000AXlC-1Adb;
	Fri, 08 Nov 2024 12:34:44 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O6J-0000000AWdx-35qO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 12:28:33 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-5c9ff17eddbso337970a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 04:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731068910; x=1731673710; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFd92mrT4vT9LbEkl123rvklE/FQdMhVq9EhkKWamEM=;
        b=mBvX063dCQCax+vWnq47LYpXKY+pm2ObeoYbLce5N9UmDDewm6NmeP5rOtBaOWhTZX
         9ZHKuf7S7bySrPnYfxwllCAbvDFG334t4hteD9/4hPCAXQnwNan6aUXNYCxGb6slwAQG
         0fRrbzEw1QgqOcgmvqqsqjbBEyeLhlBLh0jskflCWttKPQXuBTkNv69WzMbFwzhPA/rl
         WdEBXv+v45dXbPubvrRAKo3AHjT9NPvV+0L3l0nUSeRw9XP5GD6ncxKTP72hXV9bbsBp
         w2CN7GGuDJlncEAsvmolJV/y48zxJ8dUj7tQ9Un4IZlc1zBnW3uV3fm5SiU8efkoeGeb
         A2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731068910; x=1731673710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFd92mrT4vT9LbEkl123rvklE/FQdMhVq9EhkKWamEM=;
        b=ri9fpY/0dfoTmOqLWQpB6EgUYzRG+2BFxY3xC71ObSuncJ37VYFoCFOsB1k91X+Qbk
         R3uVgIcFJele7Fk0uYS3F52T+P4Rdk9nSa/KKwcmOVWQMjeGnMLHSuBaq54qd9Wvunvl
         ukbwCBeSSr1j9vbA6GGP0qGzIs70DXBa05LpYfvBcXOx3RqcqK2QVCHER5vWGVNgmciv
         pGXqyJZYucepszbFqk3Z5IaJrzpXHydrM6S1l8jgVhaHfDWilhzzdNvcRCPqmjv3Vgw6
         PGsyIzmi7cN/oU2zlkLU3wv/vT1ZUFC4/dKRfDroB9qHQYrknI+p5PQejso24SVQnJyX
         LjDg==
X-Forwarded-Encrypted: i=1; AJvYcCX+mUxDGbf/gpDuassYYt05CJqBGrcKdVhPfsKm3trRoJ30CDJfqRt/LHHJtmJ5D1phdY79PmvLF+5LhaXBGkzA@lists.infradead.org
X-Gm-Message-State: AOJu0YyDPomK1/rMbGHj03ANZ7iO/Yt+x161ryDS6E+JyWK2XUuu4g5L
	bhLtDW3Va2cKgI7VwdFWxOVo7P5uBipzrhetHoPNC4X9eJY/gkN1daT43M0J4Ec=
X-Google-Smtp-Source: AGHT+IGIMhp4vgQ0XK+8VV24sRm5sbYfxtPQ1MHg6R9lN8hVCGdLYosibCDtNjbQ8V9/MfUtaIBfxg==
X-Received: by 2002:a05:6402:270d:b0:5c9:879e:6998 with SMTP id 4fb4d7f45d1cf-5cf0a307a13mr889515a12.1.1731068909802;
        Fri, 08 Nov 2024 04:28:29 -0800 (PST)
Received: from [172.20.144.41] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03bb72a7sm1912384a12.45.2024.11.08.04.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 04:28:29 -0800 (PST)
Message-ID: <a6926e47-0344-4996-b330-cfcf3e7b5f31@linaro.org>
Date: Fri, 8 Nov 2024 12:28:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Content-Language: en-US
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-3-7d3b2d235fdf@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-3-7d3b2d235fdf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_042831_825221_EE3BD9F0 
X-CRM114-Status: GOOD (  16.82  )
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

Hello Taniya,

On 11/8/24 06:09, Taniya Das wrote:
> Add DT bindings for the Camera clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   .../bindings/clock/qcom,qcs615-camcc.yaml          |  60 +++++++++++
>   include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>   2 files changed, 170 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0abd277aa3ddd2e1384d0af59699dc1deda5575b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,qcs615-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller on QCS615
> +
> +maintainers:
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm camera clock control module provides the clocks, resets and power
> +  domains on QCS615
> +
> +  See also: include/dt-bindings/clock/qcom,qcs615-camcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs615-camcc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@ad00000 {
> +      compatible = "qcom,qcs615-camcc";
> +      reg = <0xad00000 0x10000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>;
> +
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...

would you find it possible to merge this binding into the existing one
qcom,sdm845-camcc.yaml?

Those two are very similar, sdm845-camcc requires clock-names though.

--
Best wishes,
Vladimir

