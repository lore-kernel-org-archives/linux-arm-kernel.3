Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C009CFD64E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SR2gLuU1H5541mPq9C4V04vstpLOPeBOnMkn3dWO/g=; b=zH9oCidPneFM2FfEolzlDAuql+
	RHP6zeLs13yvJvhp9Mbf1X0MC/3x34mM/IDbCvRr9+Ieq/NO+Wi7d0bVQGKPdL62vupfBg8EMJS9l
	RBZ1ht/NAEXDkScYiPb56xqn1Ba0tF9EFgvTS2FIEDCx3Qw1YRTp+3Ot8IU43DfhZo9ATl9XINUSH
	NnSLgctA+QltCx1miYJd7oURtUBKAU+ksxZOzXVhQs/ltLLoQZ13XFJ6KYfSdtNB5i7ilGkUXY2GM
	P6j5EQZkln9ln3RGaT0bWpu/q3JBckhPpTaMrgSkurCUUviTTqUBlglUHPe7jwtijekN6QHvE8IfB
	an/BGIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVZc-0000000FBEm-2xpp;
	Wed, 07 Jan 2026 15:35:53 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVZW-0000000FBEB-0TgR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 15:35:47 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0a95200e8so14373325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 07:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767800141; x=1768404941; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/SR2gLuU1H5541mPq9C4V04vstpLOPeBOnMkn3dWO/g=;
        b=lix0ou2nUg/xVrrZry2/3VB/Vqc4wnruMvlWWU02BdDQo09CdZEXjfJGyRHNIfo6jt
         vH9uW09UE2viGehGqYwoPDIA+jKskV5Asz6yknCbiMvtVCDodwsOqQk7J5AUarGF+lF9
         YDFnwHriLvTyHCfEKw6GHYbzQa98krxLSUOPVsL/HJCSwH/QXHjNfYEILqRkicWSNEKM
         TxGBRh8B2wdAguyJJNE87V7nyod74GR0Aw/tgzog8yM4iO014ncqifEOnzyRMDXiz6ss
         DNxEakGk80TJJD/PbSbBzs5zR8ok33kghna1YXvx0rO5zzoBuRt6vSTf1fwm/zsuJsMx
         a1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800141; x=1768404941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SR2gLuU1H5541mPq9C4V04vstpLOPeBOnMkn3dWO/g=;
        b=YCO14xc5QBBAC5tpNEPFFyR45xV/IjzZsYg09PidL+6q8kYaO6awJbrFYGsbj24Hzp
         TNtOQoNuRAJcoHSO3T72WOsSM/FuEgUykupMLxEw3Z45x8VfubE/TMdAwmCIPG7KvP3O
         pJkY7Ej/GSw7lSdpNn/7/6Crwdv7NJiJ/7OH1t7bUyM2hhZqA9frMS/WPaQpWkcsb7Xs
         zwLP3g/vW35Ior9xVv4dO+NoqAoTBdEfP2tr+2mBMMEHYh+8GR4EznRq1GaValfIebm9
         Os18frPnpQw+PBYdAuwSC4KXsbTHp59bAM+0SJfItXW+m4EFtnDPwbHDtvY/lw21dmNB
         2aUA==
X-Forwarded-Encrypted: i=1; AJvYcCV9nPpHSh2lNApC1j0YqKPzNw+c9mJUu8mfouFEcUO8e9Bj/I/Joy7VP5lHPrP9AG9CUEiT3jSpcHeSvApgCxQA@lists.infradead.org
X-Gm-Message-State: AOJu0YwflDo+5rU68bHRN5iJ/OZvg5/A07Ke24K7wnAA24eEwDX4J4jH
	DjNxR1VPWHnMK8SacbUsBZJQq9+5DRdj0WDDowXz643DMqxYnrdZ++g/wcFuTKTN+mA=
X-Gm-Gg: AY/fxX62qctZRO+85W5zZLJ/MP1g+ugXwfAfqAKQWUZLbkxFTvlde9dACVEtPXFX43R
	vEgNBwR2tBVbweRobOtlQRHHizr8Q95mPmpM4hcUsexfkFxIwAv2rdPuqj0M1d8SEOaPp+9+U+t
	maiJGS+u3pCJ3lwALUA0XIEPVKaZjoMpeNBAiWJLApEOSezoRK/c8vMMUdYizaDxBbMWwL1uWAe
	OuphUs+Yx9yxP+BnF31cCsbBhbfsrRIDFjJRY65rmaaoJFKr/ItFFHeiu2ZYtpXW9Tqv97xhPN9
	peKnKidTFbx65yopT5gVi38Vv+/s6HDH3uy4m7rSlJrQTNohI6PQ2exe7Z1FTkq7g/H+qxQVQkw
	B3gA4iTCE9ibEk0s+ZYg2pXrYJFHYJMrzpb6pmFiYKOmwQylSQoIHQuWtaspbvO4QTLJwDTo0Eu
	vCrjaDZJDfpipHuQ==
X-Google-Smtp-Source: AGHT+IGBvG5WmQSIVwy8pD5KbvRQIOMKna1wirHJXxpWkWLnZtjO89ZkOS60V0d1bqeYUMlW/GSgnw==
X-Received: by 2002:a17:903:1105:b0:2a0:cb8d:2ed6 with SMTP id d9443c01a7336-2a3ee4d9b4bmr18514405ad.51.1767800140725;
        Wed, 07 Jan 2026 07:35:40 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9510:cc09:7589:5527])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f88casm5317448b3a.34.2026.01.07.07.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:35:40 -0800 (PST)
Date: Wed, 7 Jan 2026 08:35:37 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
	afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: Add HSM M4F core on TI
 K3 SoCs
Message-ID: <aV59SdFU15HpLHeO@p14s>
References: <20260106104755.948086-1-b-padhi@ti.com>
 <20260106104755.948086-2-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106104755.948086-2-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_073544_250885_D3A8EEEC 
X-CRM114-Status: GOOD (  20.70  )
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

On Tue, Jan 06, 2026 at 04:17:53PM +0530, Beleswar Padhi wrote:
> Some of the TI K3 family of SoCs have a HSM (High Security Module) M4F
> core in the Wakeup Voltage Domain which could be used to run secure
> services like Authentication. Add the device tree bindings document for
> this HSM M4F core.
> 
> The added example illustrates the DT node for the HSM core present on K3
> J722S SoC.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> [Krzysztof Kozlowski]:
>  1. Update commit msg to remove redundant "bindings".
>  2. Update filename to match compatible.
>  3. Remove "address-cells" & "size-cells" property. These belong to the
>     device's parent node.
>  4. Drop description from firmware-name property.
>  5. Fix indentation for DT example.
> 
> Link to v1:
> https://lore.kernel.org/all/20251231165102.950644-2-b-padhi@ti.com/
> 
>  .../bindings/remoteproc/ti,hsm-m4fss.yaml     | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml
> 

I have applied this patch- Nishanth and Vignesh should handle the .dsti files.

Thanks,
Mathieu

> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml b/Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml
> new file mode 100644
> index 0000000000000..9244e60acee37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/ti,hsm-m4fss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI K3 HSM M4F processor subsystems
> +
> +maintainers:
> +  - Beleswar Padhi <b-padhi@ti.com>
> +
> +description: |
> +  Some K3 family SoCs have a HSM (High Security Module) M4F core in the
> +  Wakeup Voltage Domain which could be used to run secure services like
> +  Authentication. Some of those are J721S2, J784S4, J722S, AM62X.
> +
> +$ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,hsm-m4fss
> +
> +  reg:
> +    items:
> +      - description: SRAM0_0 internal memory region
> +      - description: SRAM0_1 internal memory region
> +      - description: SRAM1 internal memory region
> +
> +  reg-names:
> +    items:
> +      - const: sram0_0
> +      - const: sram0_1
> +      - const: sram1
> +
> +  resets:
> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - resets
> +  - firmware-name
> +  - ti,sci
> +  - ti,sci-dev-id
> +  - ti,sci-proc-ids
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        remoteproc@43c00000 {
> +            compatible = "ti,hsm-m4fss";
> +            reg = <0x00 0x43c00000 0x00 0x20000>,
> +                  <0x00 0x43c20000 0x00 0x10000>,
> +                  <0x00 0x43c30000 0x00 0x10000>;
> +            reg-names = "sram0_0", "sram0_1", "sram1";
> +            resets = <&k3_reset 225 1>;
> +            firmware-name = "hsm.bin";
> +            ti,sci = <&sms>;
> +            ti,sci-dev-id = <225>;
> +            ti,sci-proc-ids = <0x80 0xff>;
> +        };
> +    };
> -- 
> 2.34.1
> 

