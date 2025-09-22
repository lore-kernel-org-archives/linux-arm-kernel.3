Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DE0CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48tUbmnaI6n3pgsOtX4ssjkBSMGmJFxHw4XsAtElQvM=; b=hJwS0mHQD9YRaQoEGZ7NnQkjEW
	LvXt+TmuCFk82XlLCdsXoKVt4PA9tpKsWeBmxqJ/kBKhigV1KCy1ZEs9iLqhkQOqDGnYFWoziHcM7
	HVJsyhrVp5NjB8l/af/WQCc+s+z4h63v24pJkLvvGUUs8cfK5Rlhf6XB7QUpDmkX7nsiryGRxdlQ6
	9iFeEiLPuQKY2B7rBQoxcum8XKckRQFtfdDs8Bt/xIRB8G55Nep5KwokjGEVhAd3rhLKHgA4luiK5
	NW9981b5wLtdCV3lCUpcnfup+0K1BShMqkxf5AZNFbZrujg+9ntBT99zLa1VnJBE8ph6caP4Nz61O
	o3hEdFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ktU-0000000BCst-1mD0;
	Mon, 22 Sep 2025 18:04:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ktT-0000000BCsb-19ms;
	Mon, 22 Sep 2025 18:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B0A6601ED;
	Mon, 22 Sep 2025 18:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C4EC4CEF0;
	Mon, 22 Sep 2025 18:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758564246;
	bh=L9lfSFfAFkIwqNZiT8BuwyifCSThhLnjRTrvPs+IIdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XuO7sf29Gl3ExIVcVZoCotjBNm3sk5GSvahi/cVy0jCmUwsRze6ueZWDob1ye9ecZ
	 Z7y677vHWKpuPqKxHPdGwXBaUnxQtk7nfu+bDD2FMWkSCnDcKXFQTQ6RmMa1GpHtL7
	 hCDqiwntDiMzz9O+fS0+0F03rrkVX1aVsXXM4zSg82k4YFHElOioIXXCAw004tNAj7
	 rCMzM9rPjOIB/rOxuQTiY/IiqnngQk4/GqL+9pBiMnzdxqMvQDmabA55m92HTnOGFO
	 RqBCizGK5IfTUIeDyIguy9vptrroQP7zKvtqUwIC0Mdp11YU+0AKY8f2aFdY/ktorj
	 kGBrcyWquc0YQ==
Date: Mon, 22 Sep 2025 13:04:04 -0500
From: Rob Herring <robh@kernel.org>
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: clock: Add RDA Micro RDA8810PL
 clock/reset controller
Message-ID: <20250922180404.GA542994-robh@kernel.org>
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
 <20250919-rda8810pl-mmc-v1-2-d4f08a05ba4d@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-rda8810pl-mmc-v1-2-d4f08a05ba4d@mainlining.org>
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

On Fri, Sep 19, 2025 at 01:48:42AM +0700, Dang Huynh wrote:
> Add documentation describing the RDA8810PL Clock and Reset
> controller.
> 
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
>  .../bindings/clock/rda,8810pl-apsyscon.yaml        | 43 +++++++++++++
>  include/dt-bindings/clock/rda,8810pl-apclk.h       | 70 ++++++++++++++++++++++
>  2 files changed, 113 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/rda,8810pl-apsyscon.yaml b/Documentation/devicetree/bindings/clock/rda,8810pl-apsyscon.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d90dae8ebaa270aa822e4855d2a4a892168c5eea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rda,8810pl-apsyscon.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rda,8810pl-apsyscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RDA Micro RDA8810PL AP Clock Controller
> +
> +maintainers:
> +  - Dang Huynh <dang.huynh@mainlining.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: rda,8810pl-apsyscon
> +      - const: syscon

What makes this a syscon? (Answer in the commit msg). If your only use 
is so the regmap is automagically created for you, don't. Create a 
regmap yourself in your driver.

Rob

