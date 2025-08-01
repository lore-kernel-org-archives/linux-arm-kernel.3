Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAE0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dUZmtADBN3x1tCeMJaPcLRRToObb0jfGO4/4nSFc3U=; b=RHIVPXgJ3jTTOGiHNJ1Zp41qv0
	KAxvLG7ofo5LiJJXd0GwuthAr40jAxG/Cr61SfC0meBhYz5yxV4xc2KkJ3DQFhkTRtpbLf/EdA1MQ
	H8QUNDb+SozbEmdhBr4uLN9B229eB9ilke3JxlID5shLw+OeaI0oIp6rgHdccgC/+kBuYjBQ3flZX
	XL157yCdMv7S1zjQMr3Y20HQVhxtf4qSaZJEgnJuYQk8IY40zgNyvc6vNojQ4RFL/cnQn7KZw26cz
	NGHND5nbp37O3tptg6GxixMFxGyCrwtrD6q0phXy4rWnbnnRkKyN49sfCtBLTseKxJhYQj5nRnu1p
	boL1JPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhton-00000006Zp0-2lH3;
	Fri, 01 Aug 2025 17:45:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtYN-00000006XuZ-2TZ1;
	Fri, 01 Aug 2025 17:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C90E4A54612;
	Fri,  1 Aug 2025 17:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588B6C4CEE7;
	Fri,  1 Aug 2025 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754069302;
	bh=Hw1MV3oclXxapTMMH7EOZwKLaNES+dV1oG87CCkwVTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZNua/2SbzwcTMoQr8Rk/2gn3Vpnvc8gVJ/P3eGtwrBhIxMBoSEUtbah6/q2JTk+Z
	 eUOwcoEENsK/CeHNVAXEop7YPru0d4IMJP6VC13XZc4jZu4v58EHXJcUTdaY6wFpCH
	 C50kwD+180UzsuIrKwyQ7ttUU2EBZgvPojm1ushfRW/xJiUhmRvOocNevpbeFwxP41
	 xmbFq8B+nb+wauuegjGlxTiCWe2z09wORH0Ir4vNrH4ggMWcKB1KfjDjaNvB4ivPo6
	 sf1A5Ya6T0EtCRE6FO/owW3EgyaErvxKTZyYRDxuAMeuc1dEx9+N33drBiQ3W9VNj2
	 uR+/1MIvAq8JA==
Date: Fri, 1 Aug 2025 12:28:21 -0500
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
Subject: Re: [PATCH 5/9] dt-bindings: sound: Convert MT8183 DA7219 sound card
 bindings to YAML
Message-ID: <20250801172821.GA3111733-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-5-6ba4e432427b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-5-6ba4e432427b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_102823_694567_1F2A1EDC 
X-CRM114-Status: GOOD (  12.77  )
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

On Fri, Aug 01, 2025 at 01:18:07PM +0200, Julien Massot wrote:
> Convert the Device Tree binding for MT8183-based boards using the
> DA7219 headset codec and optional MAX98357, RT1015 or RT1015P speaker
> amplifiers from the legacy .txt format to YAML schema.
> 
> This improves binding validation and removes DT schema warnings
> for boards using these audio components.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/sound/mt8183-da7219-max98357.txt      | 21 ----------
>  .../devicetree/bindings/sound/mt8183-da7219.yaml   | 49 ++++++++++++++++++++++

mediatek,mt8183_da7219.yaml

>  2 files changed, 49 insertions(+), 21 deletions(-)

