Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC196CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 20:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3/sHc/G1KRAp2QXxaZEGGMH4x6amZemWV2D+UnI2uM=; b=hFWOt1+zSC2UIijw8WnmT7Nn5v
	jWL+5JwjfLbzkpkZUmtu/1y0t0X+ibZjjeK1urL5760BTkbdEcbnBglnBW8QP9nAErycpnQYg4FOL
	kU4izWtBDM1ZcX0ThXtYzkNem9ul786z+NN1IEJFGqPL+1WtN1g3WTqiZAbPbkijgK1OAWA9T4PW+
	wWd1HOUOFywpNwNSmsK7E9838E6yKscCUhotnJj8ZvwfeVLBRULAlEnQaocP9shucPVSW/2v9sx8b
	WOCpPvPgf3LDWJyxCXJd1D06JFnJdjaM3lUb1yTjs1HV5ow06tcgHqmuVw854elvPqspuIlwFXPwl
	ijjv5W9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzuv-0000000D4ko-3t5A;
	Tue, 26 Aug 2025 20:05:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqznZ-0000000D3XH-05s3;
	Tue, 26 Aug 2025 19:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B67660226;
	Tue, 26 Aug 2025 19:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893E8C4CEF1;
	Tue, 26 Aug 2025 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756238259;
	bh=PfGpNnSfzrRB5yk7v6MA0cOlYzyufLWVDl3AitbdL+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haM0ExZYVTBYYmBTE971s991OEWhOJlPyK/JTrK9+nRHHQ056CNNfeMX7p8bsAvWU
	 Ww5A+PmsDPZpNN+9wmmN5sxOMr3WbF9KLsdexP4FNYNYtAbPe40kehVKiRwIXkRjAq
	 pKUG/VsyWevXj7d9ZeZlPyBaOJe5cjzPrTVSHe+qEXpNVVseel+eyqqZE3CEkj7gxF
	 AIOtoZbS523TGZmA+vvNSWMIGhohdBbygU3ZsM9uVK4qSHBWf1CU65V+5hKmbzpLNI
	 O6OPZ1cf1yW8KG55Onq1xBhdzQcwrIn9/wCOhvwHtn52QNv0lvGcte8Vz4GzoxBZfh
	 PuhFlfSzscjLw==
Date: Tue, 26 Aug 2025 14:57:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>, kernel@collabora.com,
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Julien Massot <jmassot@collabora.com>, linux-gpio@vger.kernel.org,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Ikjoon Jang <ikjn@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
	linux-sound@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: mediatek: Add power-domains
 property
Message-ID: <175623822456.370694.11801087152503772115.robh@kernel.org>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
 <20250826-mtk-dtb-warnings-v3-1-20e89886a20e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-mtk-dtb-warnings-v3-1-20e89886a20e@collabora.com>
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


On Tue, 26 Aug 2025 09:39:34 +0200, Julien Massot wrote:
> The mt8183-mfgcfg node uses a power domain in its device tree node.
> To prevent schema validation warnings, add the optional `power-domains`
> property to the binding schema for mediatek syscon clocks.
> 
> Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains properity to mfgcfg")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../devicetree/bindings/clock/mediatek,syscon.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>




