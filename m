Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3E2CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 22:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6PKgLLI7TefDQT14Ajrvl8LP/1kQRl3r43SfiCExqQ=; b=ZuWGdgugd53X9fs5DSXs5vLvu8
	Sf9kbWMzSWXwPe7AdwfKjG8xxZ50ap9e7UjeAXSEJmC9NhiP7EDt4Rob6gCmFP6vkYQ1QDwrCSxzW
	IU+Tu8I6Dg7LXn+xVfE4sR4YzCChEDlrxCYDYRU/JjQ5ENt26v5dPzxWmhxnUn5iIdH8VlXTM9Dvf
	VgSdBe61eH6g6DwIDyaUiRcYddnov5mLJ/t76NYJJtjHVaJk0cjyK66dOgeQFNqC7c/JmV0iOm3nm
	mfRNmCQHTkPPvRw444U7DuAUKsOGLw+4nqRBzh0lkxiV8mP4NPuowA4wlXe8qA4zlKjYb4F6jrbOd
	oKgc1Rfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIZnv-00000006HF8-32fV;
	Sun, 18 Oct 2026 22:56:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIZns-00000006HF0-22kr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 22:56:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B85F60D9E;
	Sun, 18 Oct 2026 22:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94BB1F000C4;
	Sun, 18 Oct 2026 22:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792364190;
	bh=Y6PKgLLI7TefDQT14Ajrvl8LP/1kQRl3r43SfiCExqQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TtGpYrAFqcbZ0pKFCk8NwjmeWlyWnKfefXtL6nQv+n3n8k7S770Vs/W2w4qGM4RUC
	 yQKfaVeip20bAMTIiDWXo06Z3r/7OoraHUedwcQFOBMnaM+CdI78nmg2eUOZbMNN3B
	 V0OxKd3vEAdQHq5jO+ZlnQajWfTKtFedG+RL6PKimu5FoiK0Q5VHI22aqlKiSTiq3k
	 /3RHVBRQRxCBPEJ5/vnyyKAXMJRJy/224G3AggpckyhGIiGJarQYG09ZASrGVU5FKp
	 +ugfgpbMTlIa5YQY588JyvdjPi5Have9pZ2hGZkVsC4YccZO/E+YuqCSlkJG1S7uYF
	 VtGDMm2d1GfVQ==
Date: Sun, 18 Oct 2026 23:56:24 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, "Ryan Chen" <ryan_chen@aspeedtech.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] iio: adc: aspeed: Fix SCU lookup for multi-SCU
 AST2700
Message-ID: <20261018235624.1971e7ff@jic23-hlaptop>
In-Reply-To: <20261005-ast27xx-adc-upstream-v3-0-ef25552d3a59@aspeedtech.com>
References: <20261005-ast27xx-adc-upstream-v3-0-ef25552d3a59@aspeedtech.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 5 Oct 2026 18:22:52 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> The ADC's reference-voltage trimming data lives in a SCU register. The
> driver has always located that SCU with a global, name-based
> device-tree search, which works as long as a platform only has a
> single node named "syscon". AST2700 splits its SCU into two
> instances, syscon0 and syscon1, that share that same node name and
> differ only by label and unit address, so the lookup always resolves
> to syscon0 even when the ADC's trimming data lives in syscon1.

For now I've applied 1 and 2 to the testing branch of iio.git.
Whilst it is a fix, there is little point in rushing it unless
patch 3 also goes and that one isn't tagged as a fix..

If you want me to move it over to the fixes-togreg branch and
get it in asap, then reply to this to say so.

Thanks,

Jonathan

> 
> This series adds an explicit "aspeed,trim-syscon" phandle property so multi-SCU
> platforms can point the ADC at the right SCU, keeps the existing
> global lookup as a fallback for single-SCU platforms and already
> deployed device trees, and wires the new property up on AST2700.
> 
> Patch summary:
> 1. dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
> 2. iio: adc: aspeed: Use syscon phandle for trimming data when available
> 3. arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes
> 
> Assisted-by: LLM
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> Changes in v3:
> - Switch the LLM attribution trailer to "Assisted-by: LLM", the format
>   required by Documentation/process/coding-assistants.rst, instead of
>   naming the specific tool/model
> - Move each patch's Signed-off-by to be the last trailer, after
>   Assisted-by
> - In patch 2, use dev_of_node() instead of dereferencing
>   data->dev->of_node, and check the new property with
>   of_property_present() before calling the non-optional
>   syscon_regmap_lookup_by_phandle()
> - Link to v2: https://lore.kernel.org/r/20261001-ast27xx-adc-upstream-v2-0-2f9c15cc0064@aspeedtech.com
> 
> Changes in v2:
> - Rename the new property to "aspeed,trim-syscon": a bare "syscon" is
>   not a generic property per writing-bindings.rst, so follow its
>   vendor,type-syscon convention
> - Reword the property's description to state its purpose instead of
>   restating the schema's required condition in prose
> - Drop the extra AST2700 example added for the one new property
> - Link to v1: https://lore.kernel.org/r/20261001-ast27xx-adc-upstream-v1-0-5ace57533418@aspeedtech.com
> 
> ---
> Billy Tsai (3):
>       dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
>       iio: adc: aspeed: Use syscon phandle for trimming data when available
>       arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes
> 
>  .../bindings/iio/adc/aspeed,ast2600-adc.yaml       | 17 +++++++++++++++
>  arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi     |  2 ++
>  drivers/iio/adc/aspeed_adc.c                       | 25 ++++++++++++++++------
>  3 files changed, 37 insertions(+), 7 deletions(-)
> ---
> base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
> change-id: 20261001-ast27xx-adc-upstream-34b3d9e8e27b
> 
> Best regards,


