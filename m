Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46914C369DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CC8QXc9LsvxTqtPlPIyO29AB2sQN6RDFy5sekBxfX70=; b=Lpuia2VEkoGnBwXrZqgo2/JHAY
	sQc9ncqugQuRKHTeDbxIqVA/xgpwqN8fYSSHQ9x1FJKrUGIrdsIRNXaE+4Ve9LUw19I3LaeHC+iAb
	r+Bd7acA5Fv0nOMNF9W8cJWcGFRjuMAnc3omoy0LszqeiYNA2YPSxIQ/cy513nTAU7UeQ3OKcB7nL
	4QFdhFQ/NtkbMTBC/2fAH34FM3T1Tyc8vZe0jO/p/tlVk0ppR8ww92oofIwqB17/0aLEP72e/cUou
	qHJ5M44T0nMR6LPPO3ogYtmvaY5xEiV3pSSxZ/JlnYNGs8sXU6ddPtXSAz1BsDrvAWuXzvCmv5Vlv
	kq1yj1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807f-0000000Er9K-2GfM;
	Thu, 24 Apr 2025 17:12:27 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ztf-0000000EpVH-0Zx3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 16:58:00 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e728cd7150dso922021276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513878; x=1746118678; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CC8QXc9LsvxTqtPlPIyO29AB2sQN6RDFy5sekBxfX70=;
        b=H3Kvu+oE4evkqoJjqoXmRsyJ1bBjsWtMTAli9VG0RcZpxxX7psO/oe3QNP12kTSM/A
         51V8c2FPKTDWsam3NSMkDDiG6SetjaidlGetsSbnHBT1tuPp8LDZ2MVYHihz8bLUPKjZ
         +4RBqyYCNXxivfJr8Szs97/UZMCP5/C5LEjng2uvIMLmc7SmApTdri00vbvq27FEILpJ
         WMjsGWS/R37Gb7pbaH1hZ/RVla+5m4CT2GWiGA49bpm2+O15DEKsE39LJ+DOfXhwjAt0
         NabSGTT/WPzuNT+DPmhXQy5FvYSrFQ20vWQsPdCEqjgb9Xd11q0HCLQiTdK50omML2Ho
         2DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513878; x=1746118678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CC8QXc9LsvxTqtPlPIyO29AB2sQN6RDFy5sekBxfX70=;
        b=GBMq4aopni8T+xmBMhgh5NHYDmSBdr2ce6EY0YdZ/5tXAZaWVrzExgawM9hzrCByva
         UW83ET056aaGLuNvCiDV5ZVmaSOTsemfNZZT4zYytUX3tTR8TEt6Sx8RiLXE9+roHadv
         wj64JenhgLlS9YLK8cGPhibm+aX9rIjJUL7GkombOd1V5KuSChT/A7oimtJoWzrQ+BWR
         O4kLlzPMAmga1YUuQVMS2h+qPLeTu6nFZgrSpY7yaoRonRpy1ERx4aSj5mAsOr2XnBRm
         xuVy4NFfr/MVJW1gRt87YozJLusFu5AInxuMO10oAxvV6E+o7brYM8efJx8iTtFZdnU/
         TcLw==
X-Forwarded-Encrypted: i=1; AJvYcCW0DPDRK1TSuCfIr79uzamjNy/8LrFsgbeBrFKP32Hml7YyW7hymJwxpQPhvSgAlpLYEM25g1kthHYm95btwnsw@lists.infradead.org
X-Gm-Message-State: AOJu0YwUwco1TzTlmQpZisrVAluK996A46MRbEfQE8m2zrVn7Jz41bfX
	9yL/llzjqet7pI6UlBIOxdxPL7ztgSTdxW1UUyR4ePmrhyePtOk2Oeaso9LVxFrGfFuJuty5FI5
	i2YDRnW4TabwVAz4Thnm8G8iel3Kv5huFDXX1cQ==
X-Gm-Gg: ASbGnctfOoGQZVaULE3lJ+C6G6bS17WD2IPukU2PUgGif+RdUYiLQmrNSBol+5umNWS
	hUTILl+vDcKpAI8+PCbsPD/glj9G0PEtKG5oojJDm56pQZet5bB2kPmv8Wowfjsa/fGFr2UmvnI
	JwbtcsQsJU1ZqV9sSeaEa13r8=
X-Google-Smtp-Source: AGHT+IGUSO5FK4cTNY1s8aCOE0QjJA5+ZdVnwWYHpoNAMpE1vPT98E65H3GN3XHKq0FMUPOvfV/2uwmg/47o7Q3uAQg=
X-Received: by 2002:a05:6902:1b12:b0:e72:d449:72ed with SMTP id
 3f1490d57ef6-e7312d6905emr175202276.24.1745513878058; Thu, 24 Apr 2025
 09:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250416224839.9840-1-andre.przywara@arm.com> <20250416224839.9840-2-andre.przywara@arm.com>
In-Reply-To: <20250416224839.9840-2-andre.przywara@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:22 +0200
X-Gm-Features: ATxdqUFsZ4jKzTVE_MqQW5hWNU9yilyI4trLvJSpUG2toFoex3HtMd6XPhqZ5bI
Message-ID: <CAPDyKFop9gAUq3kG4-hs358y=N48rLQSvJaRveXo_ebVTf8gEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_095759_173101_966F585E 
X-CRM114-Status: GOOD (  18.46  )
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

On Thu, 17 Apr 2025 at 00:49, Andre Przywara <andre.przywara@arm.com> wrote:
>
> The Allwinner H6 and some later SoCs contain some bits in the PRCM (Power
> Reset Clock Management) block that control some power domains.
> Those power domains include the one for the GPU, the PLLs and some
> analogue circuits.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied for next by amending the example according to ChenYu's comment, thanks!

Note this patch is also available on the immutable dt branch, for SoC
maintainers to pull.

Kind regards
Uffe



> ---
>  .../power/allwinner,sun50i-h6-prcm-ppu.yaml   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
>
> diff --git a/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
> new file mode 100644
> index 0000000000000..7eaff9baf7268
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/allwinner,sun50i-h6-prcm-ppu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner SoCs PRCM power domain controller
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +
> +description:
> +  The Allwinner Power Reset Clock Management (PRCM) unit contains bits to
> +  control a few power domains.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun50i-h6-prcm-ppu
> +      - allwinner,sun50i-h616-prcm-ppu
> +      - allwinner,sun55i-a523-prcm-ppu
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    prcm_ppu: power-controller@7010210 {
> +        compatible = "allwinner,sun50i-h616-prcm-ppu";
> +        reg = <0x07010250 0x10>;
> +        #power-domain-cells = <1>;
> +    };
> --
> 2.46.3
>

