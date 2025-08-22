Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F98CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L5BtZVJoY6cbJVddxrT48vM5l/1F53xO0z7w+QH6pk=; b=rs+kiPHbC2aR0TASmgn93fKcO2
	1eOrV94K/WzTlUyeW0vXOn64uPZ9yR57N8coLNPN8BjbYyo1Tn1ZFQSjL3Gp/VBp0pUxdc/rLih8q
	g78hauZXdm19rzg4sVkFuF0akkhip6cQYVhUeZ6tfXa8YSd4g5ojkUSpJ5bDbW8e2QPZrjVPk9emC
	eZx01XmPIGb2zgXaQoSWcIfoeO2/ewHruqVgNbL2WPixWRQHCyp0mInTt2Ml/5gWHNL7+juaHJwL2
	w0H2/q4lCKeirym2bYieDnkfdARmOc4TuqKEigNUO/wpE2/d9tvKQy4jFtkqb5IJeooOqz9ViprEF
	hJQ06xRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkeF-00000004SnP-0Yc6;
	Sat, 23 Aug 2025 09:34:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upT2c-00000002slX-2rEG;
	Fri, 22 Aug 2025 14:46:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B7BC5C6FE8;
	Fri, 22 Aug 2025 14:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86587C4CEED;
	Fri, 22 Aug 2025 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755874013;
	bh=+LMAKVwOGszxRowkPXPHA9+jKYN9k/xShb+3HOShYDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gIuN8hF9wWDGShDvUOB2QK4Nd/qYdV1baMD1PWWrn0lgPIxFWci5eGIbdnbvjUyz8
	 JCPZE8w7epY/TRHm9LS14Tmux3Pm7TvbCBbPxMskuHdpgKGBiENdgd9l271qVLiuIE
	 lUJK25RtwR4AJPaYuhGy/tSFK7YbGAFnsKlDjrqAfWXnFwHMF8javBuwrQfC2E56MY
	 RVQ4OytbvrMwrKfxwLiIDqvolz2QfoR68/ju5eqQ3YEUMRsM0dEGu/CpaOq9hoH7hK
	 wqzkaTsIqJIdo6xQtm0bziemWvZIE7aDFGOznqFsW/nffenMl8Fz+cRLk6qXCLD4QA
	 q2Ip/9UEuZ3oQ==
Date: Fri, 22 Aug 2025 09:46:52 -0500
From: Rob Herring <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <jmassot@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/6] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
Message-ID: <20250822144652.GA3763665-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
 <20250820-mtk-dtb-warnings-v2-6-cf4721e58f4e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-6-cf4721e58f4e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_074654_794603_170FEFAA 
X-CRM114-Status: GOOD (  16.34  )
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

On Wed, Aug 20, 2025 at 03:44:57PM +0200, Julien Massot wrote:
> Convert the existing text-based DT binding for MT8183 sound cards using
> MT6358 and various other codecs to a YAML schema.

In the subject (on all the patches), avoid saying 'binding' twice and I 
prefer 'DT schema' over YAML. Lot's of things are YAML, but only one 
thing is DT schema.

> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../sound/mediatek,mt8183_mt6358_ts3a227.yaml      | 59 ++++++++++++++++++++++
>  .../sound/mt8183-mt6358-ts3a227-max98357.txt       | 25 ---------
>  2 files changed, 59 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a227.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a227.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..048fe62715d67d44daa08e75a63c782238815689
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a227.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8183_mt6358_ts3a227.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8183 sound card with MT6358, TS3A227, and MAX98357/RT1015 codecs
> +
> +maintainers:
> +  - Julien Massot <julien.massot@collabora.com>
> +
> +description:
> +  Binding for MediaTek MT8183 SoC-based sound cards using the MT6358 codec,

Drop 'Binding for '.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

And thank you for jumping on all these Mediatek bindings.

Rob

