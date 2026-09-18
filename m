Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5A9C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPArZUqqB353rHy4QKLaGuKuBspay5gmps9/H6dZ24E=; b=duwXzGl65dRCnLtwrrU5tMwqQ8
	JlRzuvVbVF51gV5nqAd0agaK4OMiVzkEy3bEuwkhs0KrWtoPfM+TysyXk4VEAMF3S63EDDV3qek4g
	9GyISnAmWNVAos7GhOcwaOHuJej0ViuNhF45TJ91eXv6USxM0mrwqgaOBFIDd0a2nZriHRmBIZlNK
	dRHYdF1AFIBLEJ7YjAsmi2J+h+ii1vkcbucSed16YMP2NehCm+AFMXF1Z3DwnSyUGiBtiqygQyVYB
	rP+LP5e9Kky+Vt5heuBYWYdBEgTQE4RY2J4WUE6v0ia5nxKSxnAGI5HUJPn0dToaDhbc415oIKFIR
	2rfXiYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7beM-0000000F3lO-0otI;
	Fri, 18 Sep 2026 16:41:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7beL-0000000F3kz-1JdP;
	Fri, 18 Sep 2026 16:41:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A449601EF;
	Fri, 18 Sep 2026 16:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92771F000FF;
	Fri, 18 Sep 2026 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749680;
	bh=LPArZUqqB353rHy4QKLaGuKuBspay5gmps9/H6dZ24E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=lLLNwwwJiE5/2cU6UHhp/fjL3PKGf72K/YZ6rzfn/unLjMVnMa8IHZRfCnJsgR8j9
	 4kPw2kqclFT0xeZvvl+N1lhn+1qDk2xxcsKKDFNKHytEzGY4NK8Vfv1n2i2Kcjs1Sb
	 dmG5pNpsUGoo2xONeCiRLf9VAz1Miv7nwg9fCaJsumBL3AekoTnYZECJlegh/fzjvH
	 S7FUg/TvBwSVs6oCghNBU6NUn3dCU4iCHzWHUbGUw7xWmls4m0O/jdNBsUS6tWIXFy
	 vPQJjJEKgZiki1Vwkn5fYIs8l52aP6SgIpMyBjbI1dKusS4I6VDmY3PEEgJt1Up5OD
	 /5K2YW7WAHfnQ==
Date: Fri, 18 Sep 2026 11:41:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, 
 linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, 
 linux-clk@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 kernel@collabora.com, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
In-Reply-To: <20260917-rockchip-dfi-cleanup-v1-2-4f00a97a69a6@collabora.com>
References: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
 <20260917-rockchip-dfi-cleanup-v1-2-4f00a97a69a6@collabora.com>
Message-Id: <178974864508.290014.10595821680814130371.robh@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: devfreq: event: rockchip,dfi: add
 clocks to rk3588
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


On Thu, 17 Sep 2026 15:49:14 +0200, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> RK3588's DFI has pclks for each channel. They just weren't noticed as
> missing until now because nothing ever gates them, and they're ungated
> by default on power-on.
> 
> The RK3399 clock situation needs no changes, as there the hardware
> really just has one monitoring unit for both channels.
> 
> Add these clocks to the binding, so that drivers for this device can
> properly know about their existence.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/devfreq/event/rockchip,dfi.yaml       | 84 ++++++++++++++++++----
>  1 file changed, 72 insertions(+), 12 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml: properties:clock-names: {'minItems': 1, 'maxItems': 4, 'items': [{'enum': ['pclk_ddr_mon', 'pclk_ddr_mon_ch0']}, {'const': 'pclk_ddr_mon_ch1'}, {'const': 'pclk_ddr_mon_ch2'}, {'const': 'pclk_ddr_mon_ch3'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260917-rockchip-dfi-cleanup-v1-2-4f00a97a69a6@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


