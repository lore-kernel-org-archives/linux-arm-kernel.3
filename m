Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894EAD44C46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IfOxXhxhg4RI/LWYRyXDH5frP3XuVWiAsIJx80MpyU=; b=T0h6YlJh5/sA1stmTbQM89DNIT
	LevnBhg7aZc81azfMAqpkv9MbEtWVDfp6WxHLYPCjTPsTmZy3mb9rjTvhdsR1GEUz/HkhS/AqBizG
	dAkfYk6uNcYx6IukUOTsZkFxfn1URo+Od73gUJ8BSk64C5l9Z/yhfh/hgMnKt0gatetyrBCl5/DLC
	jdPOxJK05tLtuVtyWzwKT3wwfnaU4Zv9A+y2qXmbPAkgUKXx2x1GyEqytTUNtKG3NjPAlrQwxV5Fx
	queNnGdre62qk10njE3sXKC+M76QI6LcgN3+cnHLE/9vlI6fSPe/Xfknj0cPmgQPV3vpAcOCbj9oP
	nJhbbWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNSr-0000000CQZ8-2x0I;
	Thu, 15 Jan 2026 13:32:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNSp-0000000CQYO-1VzQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:32:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADBEC423CD;
	Thu, 15 Jan 2026 13:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F833C116D0;
	Thu, 15 Jan 2026 13:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483958;
	bh=VHYL1nkOzjGIBxU6anuNNYGVykvMwehpUoJm26Swras=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YUVFT4Pv+GbNch5ybevpHXCZtTqQsFPxF/zCQoI92R853eUEEkPraTqmDBf8PFues
	 PBAT0N7DIFFZI+2V38qolM+jE95dcVW1dtt8Zi3RufdjUNm4249uwuoVAvPOWT32om
	 ElCvSXlvlCunrL+UGjScZyA3Kqyh1whgxN6RBVdU9sUR6ZiRAsG4UZyIWUJRtmiq9r
	 sSG6SiKXsem7/4gozdb/ihcZC9ZXMk8jxgOhwZMcpArGmXAP6ZMNycnSGaPFVbLV5o
	 pfl8Sk7Zd0mWyAJI8Od3SCrrgYTQ9thn096k7gyAkwE4Ixfhtq8T2zWSgps3bA/1/3
	 dt5tNSV+5L8iQ==
Date: Thu, 15 Jan 2026 14:32:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: thermal: Add Google GS101 TMU
Message-ID: <20260115-ultramarine-wildebeest-of-completion-ea1bc0@quoll>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-1-cfe56d93e90f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114-acpm-tmu-v1-1-cfe56d93e90f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_053239_436406_FAFDAADC 
X-CRM114-Status: GOOD (  20.83  )
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

On Wed, Jan 14, 2026 at 02:16:29PM +0000, Tudor Ambarus wrote:
> Add device tree bindings for the Google GS101 Thermal Management Unit
> (TMU).
> 
> The GS101 TMU is a hybrid thermal solution:
> 1. Configuration (thresholds, hysteresis) is handled via the Alive
>    Clock and Power Manager (ACPM) firmware protocol.
> 2. Interrupt handling is handled by the kernel via direct register
>    access.
> 
> This binding documents the required resources, including the APB clock
> for register access and the phandle to the associated syscon node.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ecf4a315ecf1ea0649c4e96a207d531c696282f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 Thermal Management Unit (TMU)
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description: |
> +  The Google GS101 TMU is a thermal sensor block managed via the ACPM
> +  (Active Core Power Management) firmware. While the firmware handles
> +  the thermal algorithm and thresholds, the kernel requires direct
> +  access to the interrupt pending registers via a syscon interface to
> +  acknowledge and clear thermal interrupts.
> +
> +properties:
> +  compatible:
> +    const: google,gs101-tmu-top
> +
> +  clocks:
> +    maxItems: 1
> +    description: |
> +      Phandle to the APB peripheral clock (PCLK) required to access
> +      the TMU registers.

Drop all the redundancies, so:
items:
 - description: APB peripheral clock (PCLK) for TMU register access


> +
> +  interrupts:
> +    maxItems: 1
> +    description: |
> +      The combined thermal interrupt signal (Level High).

Drop description

> +
> +  syscon:

I feel like suddenly you sent something completely different than what
have you been working for the past 4 years.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Phandle to the device node representing the TMU System Controller
> +      (compatible with "google,gs101-tmu-syscon"). This node provides the
> +      regmap for INTPEND and INTCLEAR registers.
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +

No supply?

Best regards,
Krzysztof


