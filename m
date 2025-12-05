Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4AFD2E03E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzLAi/vSmLpzjF8X5RTDG4A6Kgug7+6q24DNKOstvN0=; b=MLCOu/yEPGYUsYdJLdVs7Gk0s3
	Ss2yvwm36jBi/kGzhPImEhXHTKCc9eUqJrQZpka1bq8whRMXp0Q3aNqyF/l7hvT0HKSZcpP6fFwFL
	TUUibvMaSYmlh+kVZvw7XS1w5SUnfCir4ax+W6zFW9fP76Wx7yt6tAgcHNJmh+rG/d04gKLb037sJ
	BLsQd4GVydGyCW3YlyUFDDfFgqxqllzgc0kkQ8J3A/aIZLkDXvcAcoq2rDkatwfpw70yk9T+PzUi4
	dxrpTOxgwaJYKXvAdx/qpFUffO7WqBJfEUuKk2hN73H7wr+EKZ7kN2dXjYAfFyC1CXHi70GTbUL7k
	jlLY3JjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRLK-00000009EaL-06u2;
	Fri, 05 Dec 2025 08:39:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRLG-00000009EZv-3oiS;
	Fri, 05 Dec 2025 08:39:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4214844282;
	Fri,  5 Dec 2025 08:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973CCC4CEF1;
	Fri,  5 Dec 2025 08:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764923946;
	bh=9HJ5sgZEsPfwomqdOTPvYrHHBOud2TBPVuz56dCYrqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJ7ngaXI/A9Yxr7OMM/TK12mMBKIkr/0kbXk0ZpSmsVburcI6VuNnbvF8h2Qp8VNt
	 QQFZ3Hbg6V2lAGnGhkf049YGjmQmReQXvRma3ret49QAbl+YQ+HJNZYhE5DnZM5xHh
	 4aesaFfigu/DaUnFrDIK58QUWYacqIxjP2zBd0LfojkmXmXtk620DpBX0GPuW8CBap
	 wd8szEs5t5M8LjomU+vrzCDzijDESm8FAsbOQmgejpJ3CQHO8Omxx0mOlAVi3Lttdy
	 mL8AHgbFva9isRibOgH1vt4lPcMz6kWGq/aGY7pqdhkNpigMRWhIZIPbHYeKJ+9p8H
	 SkesHflqNsANA==
Date: Fri, 5 Dec 2025 09:39:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hanchien Lin <hanchien.lin@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Balsam CHIHI <bchihi@baylibre.com>, Irving-CH.lin@mediatek.com, 
	Jh Hsu <Jh.Hsu@mediatek.com>, WH Wu <vincent.wu@mediatek.com>, 
	Raymond Sun <Raymond.Sun@mediatek.com>, Sirius Wang <Sirius.Wang@mediatek.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: mediatek: Add MT8189 LVTS
 thermal controller bindings
Message-ID: <20251205-nostalgic-just-mussel-5cbf89@quoll>
References: <20251202091056.1761229-1-hanchien.lin@mediatek.com>
 <20251202091056.1761229-2-hanchien.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202091056.1761229-2-hanchien.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_003907_046536_81AF5A64 
X-CRM114-Status: GOOD (  16.75  )
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

On Tue, Dec 02, 2025 at 05:10:55PM +0800, Hanchien Lin wrote:
> Add support for the MediaTek MT8189 LVTS thermal controller to the device tree bindings.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> This includes new compatible strings and required properties for MT8189.

Drop, redundant. Don't explain the obvious. Can you document new device
wihout "new compatible strings"?

Your commit msg should explain non obvious things, e.g. why this is not
compatible with existing devices.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


> 
> Signed-off-by: Hanchien Lin <hanchien.lin@mediatek.com>
> ---
>  .../thermal/mediatek,lvts-thermal.yaml        | 27 +++++++++++++++++--
>  .../thermal/mediatek,lvts-thermal.h           | 20 ++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> index 0259cd3ce9c5..0f7fd69f5fdf 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -22,6 +22,8 @@ properties:
>        - mediatek,mt8186-lvts
>        - mediatek,mt8188-lvts-ap
>        - mediatek,mt8188-lvts-mcu
> +      - mediatek,mt8189-lvts-ap
> +      - mediatek,mt8189-lvts-mcu
>        - mediatek,mt8192-lvts-ap
>        - mediatek,mt8192-lvts-mcu
>        - mediatek,mt8195-lvts-ap
> @@ -58,6 +60,21 @@ properties:
>  allOf:
>    - $ref: thermal-sensor.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8189-lvts-ap
> +              - mediatek,mt8189-lvts-mcu

Why new if:then? Why cannot it be part of existing block? I don't see
differences.

> +    then:
> +      properties:
> +        nvmem-cells:
> +          minItems: 2
> +
> +        nvmem-cell-names:
> +          minItems: 2
> +
>    - if:
>        properties:
>          compatible:
> @@ -75,6 +92,10 @@ allOf:
>          nvmem-cell-names:
>            maxItems: 1
>  
> +      required:
> +        - clocks
> +        - resets
> +
>    - if:
>        properties:
>          compatible:
> @@ -91,12 +112,14 @@ allOf:
>          nvmem-cell-names:
>            minItems: 2
>  
> +      required:
> +        - clocks
> +        - resets
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
> -  - resets


Maybe that's the difference, but commit msg explained nothing. Your
commit is just redundant - tells zero, but all the unexpected things are
totally not explained.

Device cannot work without resets and clocks. If you think otherwise,
prove your point in commit msg (in terms of datasheet, hardware, not
drivers!).

>    - nvmem-cells
>    - nvmem-cell-names

Best regards,
Krzysztof


