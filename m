Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E29CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okKYDLB/6dq+zBpOGTXzZCn1vDDWfN4GHjwM0kMrU8M=; b=MQo84E/yw0JBFN9XwiItdzfxc7
	gvsstPzp06XvrpdpGZA3k2aD8XiLojMK7aWL2RlGLQo1Tzt4KWaNvUvBRSXM6h15LelfUuTuZnmQE
	Uqw3cycQWY12boHOKpaqQi0JIfcq1J6Pr73GfJl27hVGq87oK7C6U+g1dvJVjUl91fi7BHfBvqqQN
	ejtsT9pTJjV/r1YUcidl+aVRvdNdn59U6WLw3lFThj97wMBNIDute9PMw8uhZcZVbeH6V5QuSFkb/
	0UXU5bNZEgLBJoYnqyqVrx/AxFuqK/VnS1mz57dfSPVAwSI6A9ILEI9ZWxPm96Rq6P8DTI4cyjZzK
	ojUtRmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploT-00000004ezf-1ii9;
	Sat, 23 Aug 2025 10:49:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSyM-00000002s2f-3fwo;
	Fri, 22 Aug 2025 14:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=okKYDLB/6dq+zBpOGTXzZCn1vDDWfN4GHjwM0kMrU8M=; b=Hr0McLQdZHR0pz0jvZNU7wFFVX
	D6ojmnDx/2LPSDWpA9geMvXcEzmQz/K2yGXGcCT4evE72a7I4xYsiE1YMDFpQG6E3AOcmZBzJQ6Ke
	0IThUdDcPXNOkBY9kq6ds31AbOluDFeth/ihO22m6h21+DgsWxplD3IAEGaPG/0Ijm5Vn0iXTX7RA
	GBvWQEqdQQ+YtNp6O2bfrfi7WvJHQt+PLScedY39/L76e2ZeBvNVcSho0+P5/h4xX61LccP1PnkRz
	3YlpzN3/OVskbxQkyBrZL1pksiJr1GJJV4yyKKFKpl3Xc2kc0ER+jx0kL85He4Mjf9Mv1Hz6mklNc
	6bW+IfHA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSyJ-00000000xNX-36Vo;
	Fri, 22 Aug 2025 14:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40905A58950;
	Fri, 22 Aug 2025 14:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1097C4CEED;
	Fri, 22 Aug 2025 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755873745;
	bh=HOIMNNW5e2oCIjRIAMTKZXibETeeQjJE5N0fK64fTNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6aTAW7RH03I02SmNJvcSzczG+XkF1OmbOZFfHQjBkBL5CoX3MQvejU2ZVUMDvNIt
	 M5399RAD1sUKpwS3cMDhJTwXo8tIX3YHDr+3aN9DpAdolUNsfu6ubyjr6hwSXcqpbo
	 ugDnoQZATyxUBAdrw+qJxk0WVJq4wdM7G4ZE1ZKD+LDpSP//GfExCtId5oyhEJJEtz
	 faPJ8JpvvvnnJNkrUn5T6g/Wu+Uuj8JumCynArnafYlcePN8Q0pAr03k7Awa0mQlG0
	 iXCjGGEh0FFShsZ/MBhGq/ApmGgdSMA5esRmVoWZz2qb9nq65qTtRSmvpgK3fcKQcR
	 E2R70idYGc4Gw==
Date: Fri, 22 Aug 2025 09:42:24 -0500
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
Subject: Re: [PATCH v2 5/6] dt-bindings: sound: Convert MT8183 DA7219 sound
 card bindings to YAML
Message-ID: <20250822144224.GA3745327-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
 <20250820-mtk-dtb-warnings-v2-5-cf4721e58f4e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-5-cf4721e58f4e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_154228_007705_2768FB43 
X-CRM114-Status: GOOD (  16.39  )
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

On Wed, Aug 20, 2025 at 03:44:56PM +0200, Julien Massot wrote:
> Convert the Device Tree binding for MT8183-based boards using the
> DA7219 headset codec and optional MAX98357, RT1015 or RT1015P speaker
> amplifiers from the legacy .txt format to YAML schema.
> 
> This improves binding validation and removes DT schema warnings
> for boards using these audio components.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/sound/mediatek,mt8183_da7219.yaml     | 49 ++++++++++++++++++++++
>  .../bindings/sound/mt8183-da7219-max98357.txt      | 21 ----------
>  2 files changed, 49 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b6fee3ff3af9a90820ee57efdf8efb3f3d474804
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8183_da7219.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8183_da7219.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8183 sound card with external codecs
> +
> +maintainers:
> +  - Julien Massot <jmassot@collabora.com>
> +
> +description:
> +  Binding for MediaTek MT8183 SoC-based sound cards with DA7219 as headset codec,

Drop 'Binding for '. Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

