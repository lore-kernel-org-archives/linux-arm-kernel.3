Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13314C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 17:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZONO8rJJQ04btiVISruwF8ZFInm3bgC80Gzhde7Tyg=; b=m1VWmy7r8/sqQJN7uYHmMDG4J9
	UnexfHu8pLLh1CDy2IGnHVUN+jCo94OGWV7SG61mBEHmhl/+0/mFffMz5USP+Z42js2Gu6xwdi8Kv
	zHPKtRFwAanbgl8Hk7+qDdjGYYtbz9wAd4Ucg+cLU880KB3IWzdts30bFg/FTAU6JT9l2KG8tr7J6
	+6M775+cMfMBeGbOve4ANnCJpPL5boXY5n+buJrYTg8GSHQprLytQGo3UJ5Dli0tYuNeNb8F7U+Vg
	lXBYDIsrRwjDYGYDokZbeIU7d+2/mHCi/ti6j8aa4P+VRox/mvpZQVVA3yni00DbMPThx/kHU0DPv
	mE+cfoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtjg-00000006ZDr-1oPL;
	Fri, 01 Aug 2025 17:40:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtRp-00000006Ww4-470b;
	Fri, 01 Aug 2025 17:21:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3CAB5A558EB;
	Fri,  1 Aug 2025 17:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06DCC4CEE7;
	Fri,  1 Aug 2025 17:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754068896;
	bh=fNJ9IqGIVZcofYnTe+OXzIj73v49xFAqmgYIqn1aoB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1a0kIiUIUoi+VYvflOJmovtMyhtpl3Ck/DkRhUHGvEeL5j6IOmwUl0ZrQwdHSkgy
	 HNSdfuE9pYsWf6FW4QuLQyxdMF7j/QLmPdhVbbtfYLHErhI4NWmnpxGvfGHhHu5Wyh
	 7Ml+su6GI0icxhm3Quv9kdrc+VDfQdmybHY5LxTOeattzicKnGqhoH4ZY9w/xbxMzo
	 NDjsstw3o366u3bpGp7jThuPLJGZesKF5Q2IUje5WIWkIzE27sFUZiZuA+1uUN9Prj
	 RWKebSRNAPJ5wIdTqvbaq6Hl02YLKzJM1oJSl5otVG17tIKJAAWbj12tDj2VJ70Tnk
	 bpLw151sbcPiA==
Date: Fri, 1 Aug 2025 12:21:36 -0500
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
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
Message-ID: <20250801172136.GA3104927-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_102138_153723_BDA956BD 
X-CRM114-Status: GOOD (  16.66  )
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

On Fri, Aug 01, 2025 at 01:18:04PM +0200, Julien Massot wrote:
> Update the mediatek,audsys binding to support the mt8183-audiosys
> compatible, which uses a different audio controller binding
> (mt8183-afe-pcm.yaml) compared to the legacy mt2701-audio controller.

Looks like this one needs 'memory-region' added?

> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,audsys.yaml          | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> index 45d4a6620041b11cf6e943de49a42f3fcd91e1b9..5d9d91f9c5802240ac7d411c5632ae6663d15f29 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> @@ -23,6 +23,7 @@ properties:
>                - mediatek,mt7622-audsys
>                - mediatek,mt8167-audsys
>                - mediatek,mt8173-audsys
> +              - mediatek,mt8183-audiosys
>                - mediatek,mt8183-audsys
>                - mediatek,mt8186-audsys
>                - mediatek,mt8192-audsys
> @@ -41,7 +42,6 @@ properties:
>      const: 1
>  
>    audio-controller:
> -    $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
>      type: object
>  
>  required:
> @@ -50,6 +50,21 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-audiosys
> +    then:
> +      properties:
> +        audio-controller:
> +          $ref: /schemas/sound/mt8183-afe-pcm.yaml#
> +    else:
> +      properties:
> +        audio-controller:
> +          $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> 
> -- 
> 2.50.1
> 

