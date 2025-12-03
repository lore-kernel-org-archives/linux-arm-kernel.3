Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780BBD12D69
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13jA8V8frcQh+Kv0METbSRDdSF+gbSTvzPzmiYwzA0c=; b=fulv3aphWHjgQkZhtZykXRItcf
	O5rc05pK5pbQx2oMNcWaT29BH6Kyi/SdTESd/QcscVS71GB8M8kuemsvcGN5/9AdWvajM55OXUXu0
	pT0o4UX5k2xyy6nxIggW1elr+cDARYldYCFjV3CJRHr0tkvJljunDEvtoSVTwsbDF12FB5CuvCrSf
	GG64972UdkmCSJ9rLAQ+CxSQcYuljLqJUI0hmlkOPLz7pDVboxt7ARSzvwoMciMKdn7Em0kZ/jfjE
	UDRVSwiBIimI3eT3TCvXKZzG/8eOy/MfSk4eROlF5lVAWt3j2/fy1iLahdb0WPrLC2W1Xw1mCD+aN
	C+FF6vFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnsL-00000006eT0-3NUZ;
	Wed, 03 Dec 2025 14:30:37 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnsI-00000006eSa-2wMk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 14:30:35 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8b2ed01b95dso652657085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 06:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764772233; x=1765377033; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=13jA8V8frcQh+Kv0METbSRDdSF+gbSTvzPzmiYwzA0c=;
        b=ax6zujGJSxrwbrCy/ynS0vHxvUFKTDL3eUaexEFkOr36qJQk1IHNyikQ/z6W0JYlYi
         QSimMbWCH6f48rkgdX6V0YfQf49u0vssHuuZ0zR4ynfrewNKj8FyejaPf+TKn1/w2SXL
         f2sjwPdAxLFn9AijQZRGkrbb7VG4H1ysvEVGfSxtI6XhS55VlKc6zxRPoGTsymvDiiTZ
         JJtaG9MY/ouq4kRiTW/7dpbheaWSWNtI/k37Bi4mHVtXuJhRcGuZseLak44nWfEwmWW+
         kmJMbc7jNYYVFkRSv2oYuGSg3h1v0jFcXVCKDFrkSOuD7HdLd/DV1i///hnaGcSV+MOb
         mSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764772233; x=1765377033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13jA8V8frcQh+Kv0METbSRDdSF+gbSTvzPzmiYwzA0c=;
        b=MqLP83GUYS+6YxL/mClIn16ZwOkt3YoKezyZsE1YHA5QJX2KaN0y5Nu9827eo3bLL1
         r9/1VU0s9FBnXQLVfSsDTUISBu00ssB3uVaAYcRdJmUwnb3wXeinBVKQumAinFT1StIx
         Y4IDexUtGIvQrAHJkRqf1SHNHpf5lw4dUVTTV7TPm2bl6mWJWgOgSWSfd72waarh2rBK
         MDcZSYLHY3qpr4HMgvnr1+PUYOdbYfnjZIChNmZjeEjTOBTf0GKId0U6aVlhpf7U0g+v
         2GJkkRhGzYJ8wIz+Uuq+tY9GnooPTjL0SL3p6UqwQQLGei/Yqn6nK6WLN68e7LiAEV8A
         3nrw==
X-Forwarded-Encrypted: i=1; AJvYcCWZw7qo7McGS93YZchBndxs23Xw1PGBUurYKAImcseerEUyc559+RLbSQ3JMbhsRYTIrCvwWPv/GCXJJ0pxhRZ4@lists.infradead.org
X-Gm-Message-State: AOJu0YxOL8yiAfCSxLO7DPspn2SYTWyimHOrzAQfHlb4YmFhcZAk1nsv
	HlFzfaR/OXoi8WkvBdXRCf9kRDPlU/iL42BZas6m/xyoQ0Y2jG0m8TO2KGEYji8j6aEW4sYz/fh
	oR8RatybS5U+gtDyX1lj95zdtybOPP3MvwFxsp5E8Ww==
X-Gm-Gg: ASbGncusWGl95uSenox+jvQoEAmOxaXBA7PqP6lOjOar1zbUg+ZNXFNgSRQu424NJNH
	Ju7Frnh39owXjfzc1a0hYg6vw55J/kKK7bLsO+U4NhMaae9xh8dyPHT2LyKid2H16kZtG+L8Dlw
	D49Y1R1ImAN1NLCTzNh+bvIitUWHks2PUqO43bqWEUoruHzRERAIxOeRLwK59j6GlHNQz4/eGyY
	um88DhA+a4yGlyY6m1m3j5TJJAHm3IDo/MmfecG0vyLSCeEa3h6ctFiHH0/gnw34JzHkGGqDyVh
	G3nyuDZuyGFhy+wFnMlnvzsDzVUU
X-Google-Smtp-Source: AGHT+IG+dtM/tA0+7V4eO7aEdSCo29eBvV6UxX/J0OEYRSm8uig5vICwrUHf4L3vwGq/i2bZdmVG47rgb3kSBNUvnZQ=
X-Received: by 2002:a05:620a:2584:b0:8b1:c1d3:8e91 with SMTP id
 af79cd13be357-8b5e5b15b5bmr314414185a.39.1764772232991; Wed, 03 Dec 2025
 06:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 3 Dec 2025 14:30:22 +0000
X-Gm-Features: AWmQ_bnPEN-1MzILBf1Rpw3Tgp2yMP9ShncM3uAGstu8OXc6GMqh6xi_bqmbgKo
Message-ID: <CAJ9a7VitqEix7dumLq2ND=6+PU_eCkm8=YkHB0n7iHdJ8iKeVA@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_063034_761304_DEB4F470 
X-CRM114-Status: GOOD (  17.40  )
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

On Mon, 8 Sept 2025 at 03:02, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshold of the
> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index 843b52eaf872..ea05ad8f3dd3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -39,6 +39,16 @@ properties:
>      items:
>        - const: apb
>
> +  interrupts:
> +    items:
> +      - description: Byte cntr interrupt for etr0
> +      - description: Byte cntr interrupt for etr1
> +
> +  interrupt-names:
> +    items:
> +      - const: etr0
> +      - const: etr1
> +
>    in-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> @@ -56,6 +66,8 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>      ctcu@1001000 {
>          compatible = "qcom,sa8775p-ctcu";
>          reg = <0x1001000 0x1000>;
> @@ -63,6 +75,11 @@ examples:
>          clocks = <&aoss_qmp>;
>          clock-names = "apb";
>
> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "etr0",
> +                          "etr1";
> +
>          in-ports {
>              #address-cells = <1>;
>              #size-cells = <0>;
>
> --
> 2.34.1
>
Not sure if you need me to review this purely DT hardware description
update but...

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

