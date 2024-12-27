Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C7FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exIHxC6imgzvmqXQLKcNTUSHvq4EuZOKc14GzUjWSpc=; b=BtnTSXjEOYf9LP0eSBb+hSCiIb
	0t5Plvv4JI0qHPMDOZ+sCWRj/PHxGs9Na6VCBBEM39RN3wRT5fJgzzpILcG36zcUPf2eP2OPmKqqH
	/1Vqv9dVyWqDHYWRepbMEo07XUhKOPig72N9MG11G3Z6lGx9MJyyp51rCRknon/bPuMdaZtayLJm9
	Fn8Y1PSP1NNyxD2s2AwzWSCeIBNyXHxaiEiLOfI8aFSFRFeZlE1EpTZ1crrtQ9MBOJqHd0E6geinK
	Qs7Yukc/T/pwSFz60hAywS+5xn6IMU7pj9bsTpgkG8zY4gLjaf9r/X0JeSo6wRLJVW5/WXgSG82ck
	vCpNUoiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAIW-00000000HCj-20r5;
	Fri, 27 Dec 2024 13:22:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRACv-00000000GQT-16Tz;
	Fri, 27 Dec 2024 13:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14583A4189F;
	Fri, 27 Dec 2024 13:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A3BC4CEDD;
	Fri, 27 Dec 2024 13:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735305407;
	bh=Z7yi+afmx/uhCK7HF/9WlkjMbcxfvg7Jvqse7KgInuc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Y8P2gXOnGvjWSR7pppbIn9+uiy3Y9Z0vluLjkcnTQQIn84OguGqJjddlR0L88yLuL
	 6V421rGIxpejqKE1L75webWki/DzFlCQVYLG2EEYZUu5aMg7m/bqDDZBCa+9e0gYRc
	 GQvakfM4lr1cf5OTDgZLfuizLhngqWC04+vFgSChXzU7C2wkSRI+1Y6TOZu5bddOva
	 HpnmhmiemPafHX9z1Btzexlk1nP9OWD4z8Am666h9i+Xn7O6XfbI8llWno+XkcbsLg
	 ufOCrrp0ZZ6Vo/+/3GmhHKoAhS02PuJ3f8CVCDc+tmhHOxbt6Qx7e2+DPzz9eMQkOs
	 OKmBdYqFoXs3w==
Date: Fri, 27 Dec 2024 07:16:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 Chen-Yu Tsai <wens@csie.org>, Joerg Roedel <joro@8bytes.org>, 
 linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 iommu@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 linux-clk@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>
To: Parthiban Nallathambi <parthiban@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-3-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-3-13b52f71fb14@linumiz.com>
Message-Id: <173530540581.3097883.7476966654699325435.robh@kernel.org>
Subject: Re: [PATCH 03/22] dt-bindings: clock: sun8i de2 clock: Add PLL com
 clock
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_051649_439721_05D491B7 
X-CRM114-Status: GOOD (  11.44  )
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


On Fri, 27 Dec 2024 16:37:50 +0530, Parthiban Nallathambi wrote:
> Some platforms like A100/A133 also uses pll-com clock as additional
> clock source for the display clock. This is not documents both in
> user manual and DE 2.0 specification. These changes are mainly from
> vendor BSP.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.example.dtb: clock@1000000: clocks: [[4294967295, 48], [4294967295, 101]] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.example.dtb: clock@1000000: clock-names: ['bus', 'mod'] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.example.dtb: clock@0: clocks: [[4294967295, 52], [4294967295, 99]] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.example.dtb: clock@0: clock-names: ['bus', 'mod'] is too short
	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241227-a133-display-support-v1-3-13b52f71fb14@linumiz.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


