Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE25C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 04:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwnKkZvZhkX1RtkJBhO4reJAws7TqPxb+7QzLl+JFuI=; b=k109zyA2Etf1E6KqXxUCoaJX/F
	CUWIe8I9N9Sijm7n9dioB//HXnBzphm6gEJGLxUp+UcvK4pT99fjF/UkXWWCGfmeKq7K+K9p5Xx19
	3hh+uQMy9cLkcWzpD2uPikSlK7txjK3jNi6PAPtUOkEE1lnNnE/vAvNzO3qoYNfKuFG2b8qKDsE/6
	1v51bMR4UXQd2UCZzS3UybdbxH1B2p7LVi7b9+QvO7JDGMUVhOz+3WJvzd9uGuAMRpFCZghI9QJ54
	dXXnbo9uiEPYCGXO6HziKtXso3preMccuQ+xBPXynrTeJSqhCtsPl4PhbstndzLUtvmGlcXUbMvTn
	1feZrLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um3OW-0000000CboI-3mR6;
	Wed, 13 Aug 2025 04:47:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um3Lz-0000000CbXL-0HfU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 04:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B849601F3;
	Wed, 13 Aug 2025 04:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBC4C4CEEB;
	Wed, 13 Aug 2025 04:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755060283;
	bh=mLumtAp+bbBtgP7qUvg6ku56O+DpRiPGVHcqO7y1glo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WffvXXt28pnoVIhHLjWzUtfZCMtH4qYK5bBaPX4HWz5kB7T3MoapSkhW4wH40s4bG
	 QJ/2350vbeL82pY0E5uF1s4YkpTE02LxibIdv/cecRDVWgnv/Xl9z553rzzD9/BtPP
	 JEzZYZOxeXxVfFug9meWaJSPUOswUcrfseuM0oYrDOhSESMb//mpQMczfRBQQSt1hh
	 ogJv1wv6YOXYHfoBWB7VvG/kLWHRdhZL8ZkmH967yBMxZ2X7scDnAOGp2nVTA3sQT2
	 W0XPT6Wjcl1Ml4trN4AmYBqLWA/5kSy8oBiYjrmsJ4zxrbdNDhVd1j79DLTU6rjQAa
	 0Pze0RK9bFLQQ==
Date: Tue, 12 Aug 2025 23:44:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Todor Tomov <todor.too@gmail.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
 <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
Message-Id: <175506028291.2605875.11473205221167147078.robh@kernel.org>
Subject: Re: [PATCH v2 01/72] dt-bindings: media: Deprecate clock-frequency
 property for camera sensors
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


On Wed, 13 Aug 2025 00:45:09 +0300, Laurent Pinchart wrote:
> Usage of the clock-frequency property for camera sensors is discouraged
> in favour of using assigned-clock-rates (and assigned-clock-parents
> where needed). Mark the property as deprecated.
> 
> Update the examples accordingly. In DT examples where the sensor input
> clock appears to come from a programmable clock generator, replace
> clock-frequency by the assigned-clocks and assigned-clock-rates
> properties. Otherwise, just drop clock-frequency.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Changes since v1:
> 
> - Adapt examples in bindings that reference sensors
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml  | 7 +++++--
>  .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml        | 3 +--
>  .../devicetree/bindings/media/i2c/ovti,ov5645.yaml         | 6 +++++-
>  .../devicetree/bindings/media/i2c/ovti,ov7251.yaml         | 6 +++++-
>  .../devicetree/bindings/media/i2c/ovti,ov8856.yaml         | 3 +--
>  .../devicetree/bindings/media/i2c/samsung,s5k5baf.yaml     | 6 +++++-
>  .../devicetree/bindings/media/i2c/samsung,s5k6a3.yaml      | 6 +++++-
>  .../devicetree/bindings/media/i2c/sony,imx290.yaml         | 5 +++--
>  .../bindings/media/samsung,exynos4212-fimc-is.yaml         | 4 ++--
>  Documentation/devicetree/bindings/media/samsung,fimc.yaml  | 3 ++-
>  11 files changed, 38 insertions(+), 17 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/media/i2c/samsung,s5k6a3.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'clocks' is a dependency of 'clock-names'
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250812214620.30425-2-laurent.pinchart@ideasonboard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


