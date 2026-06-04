Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550DECD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSZAPul0pXkxx09T12pErJ7HwDU4RDxf16+6acHgaAM=; b=0nza74QYFYvBO1Sfzb3EzAzs4t
	gu5uIS35FTO89McKy11Ykkgj26Ui0HiR3GsBptusElNL+vwdCqm51wRxxFLcDbUfuM9hVlK8w8pVY
	DhK1RW8DcroCqsKkEzTw6/ZnPLzX9FoAA0Ookc6eb92CBo+Ink7ScTvwwf1W5z9X213GpmDypUglf
	Mj8fZX604EQFspovwQpApd77GbxtUKUn6Ca3jFvzlP6b3RXdEfocRo7NAZEcUrIGYD+BA7bjk/jGB
	5hRxFxTeTwWtgGF4RSe2+YK5SuwRUtyV+sTFABKMdrlpog582j380YgnPpe/GE5ExYQTQ69F1mlPQ
	LKI55Sdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6AU-0000000GdoR-46cg;
	Thu, 04 Jun 2026 11:23:22 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6AS-0000000Gdn0-1U4l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 11:23:21 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so798206a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 04:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780572198; cv=none;
        d=google.com; s=arc-20240605;
        b=JScmGbpbR080WjJ1nhbu8nfomU9s3tmR0ldAmdhWnPcbRowYkAVOEXnMA0OG1YSE5Z
         1UokIF2gST6kc8jd7dvbZFajL3MmCu/GFV38n1yLNY1jkDgF+NSDcD/FvZRZVnGpVOGY
         R2QY3utr0KuRhcD6azwllkRREBuhWygm2dNKytgIDsQvOYEy33sbu50cfAR5KiEPdpZE
         zUjIRY7OVrv6TRH7HZrjIfxASURH+vWKyd7XCJk3tppaSY4UXb14xaLoZQ7BxjBNHyTc
         U7GPs7T51i1AoPfF0Ng0R9wiS7UaWs1wVqkwMDa1TVnBCSUrLG5eIDWRPf+iHm/WWduc
         Nj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zSZAPul0pXkxx09T12pErJ7HwDU4RDxf16+6acHgaAM=;
        fh=ufLWm069CpANybkz0S4neoXhTlvtftRflIkR9zfeLLY=;
        b=WHPvjg0TJK0fOcRx5XxuUmmh//d6KODDIG9O66kZpcMmU7Dilxp0yaTflou65IXJWD
         iYHwD1E67nmK4V4Su62ylR81KwS4DVUv2f5ibCEvJfwhI5cHk964s9ml+kpBAkXhQi+A
         oK3/E+8nHnoosvb2mxzrFMatb3TR4mrVtbEfr+XdJwm8GIcw4TBBCvAi6GzHIYw8f1l+
         7T+OFyea0Fyi2NpCeW0jA9io3KonjBdgd1oN6dk9w9Yvw9To7OyzDjGtpTPGcG9vql0s
         51keQJsJiIuKfGjt8xj8GHy53/EZAqMCTiYtywfQOuijhpSkdqaHfhOx/3AUMNJoWxkY
         wb0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780572198; x=1781176998; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zSZAPul0pXkxx09T12pErJ7HwDU4RDxf16+6acHgaAM=;
        b=PTY3zAO3JCFA9V2/rmxmiJP1wjCBSxh3OMxwF8zYE4SuLK+AfcWFs+82BAM+aiN1yr
         NrgqBIwl8KFYTxTbU1lr2czlFE+mm8Ybx5sqZuabblnJmdZOMs6L0a2iHCRza9eU//9r
         4Cxjh2wEu8BEr7fGAoCfX5gcoQUTEm5x3ZZ2EFdPVtnP6u6eP9EZemp3Er+I0bcu7e7H
         6R+vk4srGq6F6U/0yqvo3OdKrbcd7v+9NIzkoSnXoiYt4DWDbGmGs0LghC7HXgT55hez
         tbO2tujRVYCkH2LuLbrKI0eGE+QtY4u0bAb8S/fxTzD8gl5pbj64mB3zRRFY1ukgqD99
         JzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780572198; x=1781176998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSZAPul0pXkxx09T12pErJ7HwDU4RDxf16+6acHgaAM=;
        b=qV+X6Ha0SKLsKp5KwTMc+HFJSFPyyJxklOpyzHeaSRi5FQgp6y4Ofhtk+pa+56iU3E
         keMjX7QeijxuXp6VnrA0ppgCA3nypBIgvKsfKrFDzoLR2wAFOxT33Qtw0OgCXuiVeWf2
         AhFaJiGsRMTfxxUvNjIoiXxFsXbfY5iq7bNPoq7k//2gmzNWOV4krgF6CSuH/aTMKRij
         CjRqqvfH6k5TF/989J+yIIl9X1BFRg2BqAvguJJsdMH0Yqj4FIREzliqPI/f4gAFJGDK
         N9AeyTTiPXoVf9Gt9i+zOtltsZYkK6Bs+m2cqbJBRfwyY1TeVEsx7tbNHGAYgScEXuRG
         smmA==
X-Forwarded-Encrypted: i=1; AFNElJ9NsxO4WeJvlVHYvxP4DmHe4FwRem1i9TvYwKE+B36rFV01x9P8lLesnt9zZM9mkfs4hlqvJdk9EFjWSZ+NZr3K@lists.infradead.org
X-Gm-Message-State: AOJu0YyLws1d/CDOQ5OsdGPJW7VdBX9bJess0PcMB7b6Jg257v7V61IY
	SeJB9KjiPOGGijUfspMP/mDbB/er6EP9KDbPkuUQoaFyjGESiAaeTA2EYVD+1LvBUWKrxdcgL1O
	uXdwO/lsWY6fdo9wLD/35xdE7d16uqDvK7XfOYmQXGg==
X-Gm-Gg: Acq92OEVoYElmJWFR/3mWZ7V4kFHAjm/R3Ry2nf0JEvf+8tmy6KVWLjkXjMywEKq1Pn
	ojV9he1jM+Kbm3isDWQedTHO0SxqzYJtTw202Csf68iAhitUeLcxmv+yDM/6PNxDKVb9yaEKR6d
	Fbr20hBNULyVeicERjUGPm9pxVm6LIK1CLq/VGYsLBeoyWlBk8cfsb5YYImRM/C2YqV8ViUI9PV
	8q0SYrbh30++0LXK6ooOvSCokZ//fAttxe3D/vfajBHVAshn3LNXZeBCoqVjs/cuFFQ6eBAGlmN
	KqKY+e447YM+WMT/LhXntqvDFCWVcgIvx79YTGO/rQA34mzi
X-Received: by 2002:a05:6402:3215:b0:68b:539c:d269 with SMTP id
 4fb4d7f45d1cf-68e710ebc51mr4043117a12.12.1780572197841; Thu, 04 Jun 2026
 04:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-1-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-1-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 12:23:06 +0100
X-Gm-Features: AVHnY4Ia0mw8gm7Hj0ZlJv6TfIxLHonorNGMBp2ITPuIwQPM__6LAPjP3GLorns
Message-ID: <CADrjBPqhrnMv0xoMK+K=rMmd9jKAHYqFkn6y7EKoqm=i9o656A@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] dt-bindings: thermal: Add Google GS101 TMU
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_042320_426405_69829638 
X-CRM114-Status: GOOD (  21.90  )
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

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.
>
> The GS101 TMU utilizes a hybrid control model shared between the
> Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
> firmware. This hybrid ACPM TMU architecture is also present on other
> Samsung Exynos SoCs (e.g., AutoV920, Exynos850).
>
> While the TMU is a standard memory-mapped IP block, on this platform
> the AP's direct register access is restricted to the interrupt pending
> (INTPEND) registers for event identification. High-level functional
> tasks, such as sensor initialization, threshold programming, and
> temperature reads, are delegated to the ACPM firmware.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> new file mode 100644
> index 000000000000..75560ebca48d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos ACPM Thermal Management Unit (TMU)
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description:
> +  The Samsung Exynos ACPM TMU is a thermal sensor block found on Exynos
> +  based platforms (such as Google GS101 and Exynos850). It supports
> +  both direct register-level access and firmware-mediated management
> +  via the ACPM (Alive Clock and Power Manager) firmware.
> +
> +  On these platforms, the hardware is managed in a hybrid fashion. The
> +  Application Processor (AP) maintains direct memory-mapped access
> +  exclusively to the interrupt pending registers to identify thermal
> +  events. All other functional aspects - including sensor
> +  initialization, threshold configuration, and temperature acquisition
> +  - are handled by the ACPM firmware. The AP coordinates these
> +  operations through the ACPM IPC protocol.
> +
> +properties:
> +  compatible:
> +    const: google,gs101-tmu-top
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB peripheral clock (PCLK) for TMU register access.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +  samsung,acpm-ipc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the ACPM IPC node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - "#thermal-sensor-cells"
> +  - samsung,acpm-ipc
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/google,gs101.h>
> +
> +    thermal-sensor@100a0000 {
> +        compatible = "google,gs101-tmu-top";
> +        reg = <0x100a0000 0x800>;
> +        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
> +        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #thermal-sensor-cells = <1>;
> +        samsung,acpm-ipc = <&acpm_ipc>;
> +    };
>
> --
> 2.54.0.1013.g208068f2d8-goog
>

