Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2629D64070
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuMsjEWNzhW+6P3eECc9hh/03bxywxtcZPQ/jBAhyYE=; b=2jgipRmyWViEvI0fNtUWoVrMhI
	AKvzdmP0qZnM2krWCG9Vp5c234FJJjeIlesYhR76YBM3kNp4VibSlZynztNxA3f3TJRC+rtpaRIQh
	D5rX+UpQ/MPWBIymI90Zb28ehnGaY7/JXFUQsW6u7V96zH7SqusFxD81HIKIF4BdZb5C+t5cDM8Vd
	MWPYjyv2tr1A/0z8UisFRKMmEryR4Ioe+zcK63o18CvWDtO3KENVZvgirqg1uCAxx3aRLvahNQKd1
	+oXz1twitT3ODON3Bg0fRv15k4fgKGMAjCw+1+X9PKY/SZxjkJtuoFnMRX5du5+bq+xHL8EoR8E7r
	PpchmtTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Siq-0000000BNdF-3Txd;
	Fri, 08 Nov 2024 17:24:36 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Sh4-0000000BNHQ-1GPn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 17:22:47 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f58c68c5so4513895e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 09:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731086564; x=1731691364; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IuMsjEWNzhW+6P3eECc9hh/03bxywxtcZPQ/jBAhyYE=;
        b=WDUm7o3f/pmu7kxGgpkEnvnpiK5MJCDrh+y7x9fCtmQQnzRIDIAiOpuKxq7m8AkG+M
         6C/znM1FMVRVoa0kLCGcve97uqwpTpj46noL17CoBMVOnG1T0PFKQtRD7mQpHZK1iZwW
         VkobcnnQnVwAuVF+qg4J5dPfxx8n7t4A0Bc1CN1JvU7m1+8RlPapSff63NmVyv+DCzud
         aC8WucqZgETuhWdokqTTQZ4+AEmg9/r9U+UCtDUvf7ld45PLAS9S7/Z4sukU0Ahtr9jq
         fOODxOfmfst5lwuor+vYJmqNFrQKL5QnG6MfgPDnSSUaEN33hdmcmpatmOJ0mmWdmAM+
         FFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731086564; x=1731691364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuMsjEWNzhW+6P3eECc9hh/03bxywxtcZPQ/jBAhyYE=;
        b=LDhVD8Ud9Kg9H45IaFUAooj9V/JIKV319ToEL5E5WTLeRcyDuRf2pWof7LscUE24WL
         YrKE9lSjV0RP3SxeXkRfvgL69dm+E2zLCf8zj7DKFtLRmPVw+2FEUkC7tN/kVTHS2MCu
         2gsrvXvTUtbnhhr2XPv2HbsSju7Tri3JtsgF84Wt901zzPO2dr/n4JHaIpD3dQp8taa/
         7RHQONzAnKE6wuW0uSEl3WDzXE+p+YySF/l87V1hERaIShwyZHCaACuLTH8tOpFzGL56
         YifcBzBHOwgDfYc5dNZImqtJf4k5ubcYT4BkFvgSdxF3ff0G9cNFMwuYTOxuR7lpSZAh
         EIjw==
X-Forwarded-Encrypted: i=1; AJvYcCUWxyxmb4qO4cmVtEtzJ88aYO5pMNav2UpVFJrAKP1WVFZXrmoVXRM+11aElzn7T0pw+iqyuqgHxndAksZHwtS7@lists.infradead.org
X-Gm-Message-State: AOJu0YyHrEPt7gGV/HwYhqELKDpA+PJiEN/d191tbBBMITVj/jC5SaeL
	hP8fxTjvllu97wQX9ckuHiYR17TqYH+0X77eMS25AgLh6Ly0NT/TK2NtOFgQuuI=
X-Google-Smtp-Source: AGHT+IG/kHT7uoJA9pS6MJzi5G/TAbHC1g+M286p5WIMFKq0cH1FOM6xU7xjhvQPNXqOerM7diDKNA==
X-Received: by 2002:a05:651c:1551:b0:2fc:9674:60b5 with SMTP id 38308e7fff4ca-2ff2028afd3mr36644341fa.25.1731086563412;
        Fri, 08 Nov 2024 09:22:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179ff9f7sm7271371fa.119.2024.11.08.09.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 09:22:42 -0800 (PST)
Date: Fri, 8 Nov 2024 19:22:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Message-ID: <be4blr2wvnc7b4iubexxnzqevjpgnfhdt7azcuwdtqgp6xbdvh@c3txmpuo5lot>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-3-7d3b2d235fdf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-3-7d3b2d235fdf@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_092246_369756_3788D798 
X-CRM114-Status: GOOD (  17.85  )
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

On Fri, Nov 08, 2024 at 09:39:20AM +0530, Taniya Das wrote:
> Add DT bindings for the Camera clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-camcc.yaml          |  60 +++++++++++
>  include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>  2 files changed, 170 insertions(+)
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

Please use qcom,gcc.yaml instead of copying the same set of properties
over and over.

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

-- 
With best wishes
Dmitry

