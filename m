Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EB7C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 01:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCSzBHMbHHnFW1mTkdmt1jLp/FU4zweovnV5syUXTeY=; b=lS4deTi5px+Of+GexNMNxl2PlO
	+s/Ab5wvctkaKYCmpClwsdjzT2Il2Bf0//ixs+KWItxGTWJv/yWjjUkjBStDXK7CrC+c0qwwY2BsE
	lx5pB7CViA5AagdUbBnYS1TvfZi3V77Oo5OQrmH+1Qs8aiD2wEKE4hEf4d5LVdcUFx2q52xxm4pta
	2FFT7Y3ngvmKKqPGga7g9Gi9A2jcZOYvd3Yog94I1fzjAoLc7HnzD4LG2zqipAheiEo3DFpYoh5W6
	n51z+x/VWpQtratCtTJVbp/4xwbPay3qxpVAVAF3ZfGORThtaCXBzBI8872p7cmKTNiya1mKmw9VJ
	SzXPTX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u339Y-0000000CEwX-1dhf;
	Fri, 11 Apr 2025 01:25:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3350-0000000CEKo-1h3Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 01:21:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8ECA4382E;
	Fri, 11 Apr 2025 01:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D109C4CEDD;
	Fri, 11 Apr 2025 01:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744334473;
	bh=o046V02WtqlkkRSSA2YGh7WNKcRkrZEbNpFokx1S5W0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JTlPmKyPES5VA7ZmxJLYX1Msxt/oigWQD0OYiLRLmvQ4k5N4T8xhUdZ5xzhOfWfuU
	 2QirmG6s7SD3uYGjXNTWWb45j1z9JkqnBu7gopdKbjSvx9rbMggpw5ony3HE8patxh
	 UqDtEJx0igTWcE0PJwIO1gX2qY9tq4pWjs2IxBRyBg+4a42zX1PngeGYx+LOBBsXHw
	 J1NZwi8Z8/HI45/GGHSFJWQcYdavbZJDJl5zz3gu3UIqCLLyTtC59/DeNxPHEJ1+So
	 4yKPPFKWwyvqnuCfRaxSFcTsAecRigu1p04AelE1h1NBItayGmFO3F3QY0YCYUFDxr
	 stsTG6NEuqFRg==
Date: Thu, 10 Apr 2025 20:21:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, 
 "Rafael J . Wysocki" <rafael@kernel.org>
To: iuncuim <iuncuim@gmail.com>
In-Reply-To: <20250411003827.782544-7-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
 <20250411003827.782544-7-iuncuim@gmail.com>
Message-Id: <174433447237.1635065.9681378963946489764.robh@kernel.org>
Subject: Re: [PATCH 6/6] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_182114_466740_0B1276A5 
X-CRM114-Status: GOOD (  10.27  )
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


On Fri, 11 Apr 2025 08:38:26 +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Add dt-bindings description of the thermal sensors in the A523 processor.
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.example.dtb: thermal-sensor@1c25000 (allwinner,sun8i-h3-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250411003827.782544-7-iuncuim@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


