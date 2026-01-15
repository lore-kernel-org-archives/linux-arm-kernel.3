Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FB0D44C4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASevxqxMwARuQYFajLlVPpJafYog+lGJPcZ7jKogYrs=; b=lZagp7pPfEZLkQYdTAKo1HfQyr
	OkEDkQD1c+/pBOkzLH/5jqe84xX3elPRyAHE318bblnnl5B14NLkx69KfCAGcXv7odkvQL2ChJ3RA
	pk3dpMZSkjWt1g7fAH/p2YR1cs43urMMHkJf+ThW9gAYzC6x8jM83wC0qgq2totGgQQrMG54mmqlM
	a+uaoZu84l30tablNSG1tLNyO7tUfGvbNuo7gMasUkkyzXLz3qO1YN6CzujnBwMEjxL9I3KY/gqUv
	lAyTJT3N88KOJx2fJWrqC1Rbqf25BMWH2QlBusN56hxhEac59QOU4nUXwvlPmv8ozLiS1+/y/BAhZ
	Gxh7lUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNWA-0000000CQim-1DbI;
	Thu, 15 Jan 2026 13:36:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNW8-0000000CQiD-45f5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ECD360195;
	Thu, 15 Jan 2026 13:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC40C16AAE;
	Thu, 15 Jan 2026 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768484163;
	bh=0W6V9fyTShLK7ULIIxW8FNo5OfRF3NXJTodFVN9ZRdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UvNex5q2V6dpcWncjXAuZswFgvOfUKB9y8VJ+T9KyiTvWPfqGe20p26fqk/KPKdCy
	 fC2w61TTrdGLFSrazUHLDWG8EIQf2mYn5yZfbB8r93Ln8Fxp3SwJE8NiFPHReq8BWZ
	 HuKz33cfCWzSTQLUjcBZW90t3pL5F1DXCVoka3Hwei35ATDkkqP6WnCLur1V6F+wnX
	 gEgU/xfdqJTaX/u9Tba9WHGjKOvHk32N3c2VEGD+OrwZHN5QV2hMhnQAuvzciZXDk8
	 9v3lzyqXTA4/OKcWVkYmldl+k7Ndb+ApMLf0hzt4zLmrvsgDjM7obnvfZgS9qVbLYx
	 Gpp78xR32pXiA==
Date: Thu, 15 Jan 2026 14:36:01 +0100
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
Subject: Re: [PATCH 3/8] dt-bindings: mfd: Add Google GS101 TMU Syscon
Message-ID: <20260115-slim-denim-potoo-cad9cb@quoll>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-3-cfe56d93e90f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114-acpm-tmu-v1-3-cfe56d93e90f@linaro.org>
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

On Wed, Jan 14, 2026 at 02:16:31PM +0000, Tudor Ambarus wrote:
> Document the bindings for the Thermal Management Unit (TMU) System
> Controller found on Google GS101 SoCs.
> 
> This memory-mapped block exposes the registers required for reading
> thermal interrupt status bits. It functions as a syscon provider,

I don't think this is syscon, but the actual TMU. Syscon is various,
unrelated system configuration registers.

> allowing the main thermal driver to access these registers while
> the firmware manages the core thermal logic.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/mfd/google,gs101-tmu-syscon.yaml      | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml b/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6a11e43abeaa23ee473be2153478436856277714
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/google,gs101-tmu-syscon.yaml

Not MFD either, but soc.

> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/google,gs101-tmu-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 TMU System Controller
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description: |

Drop |

> +  The TMU System Controller provides a memory-mapped interface for
> +  accessing the interrupt status registers of the Thermal Management
> +  Unit. It is used as a syscon provider for the main TMU driver.

No, it is not a syscon provider. Entire last sentence is incorrect. You
must describe here hardware and this hardware does not provide any sort
of syscon to any sort of driver.

Best regards,
Krzysztof


