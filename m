Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2997CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8q6wvM0q3RSSVwfq9DHRT2Z/mmz80urXquxKq0rRn4=; b=v12mALv1ETx09C3XpzidrZC/61
	y/MyTrPR9OJ4NeoIArE8HIC8uVC+yIJBXUHk4qrGN8DNWlsQiIytrjvGECvuwAHICK1YdI/foXXRG
	imK76wtoo+7n+rURaM2hIbOExUkXOXfFZcGcgXFza7yC3OxPbHNjxxJ5FVNIE7btZU1u5MNfwqvnx
	scA5fuPb6BW0/9o+ZHSpLy9HpJAU0j4EV1jQdMaXn902MKpSyGUEPdayht06Gjuy92fAK5CuAmbi7
	eOwd2pImKq15ML1EG/hC6b3H3eKA9jhIhqjBJ9eJ+17p+Ujxh/GOOuzEIvYolkb2R9KxkpB3RXNF7
	DODq8oeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1ln-0000000GQDr-2eYR;
	Thu, 21 Aug 2025 09:39:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozXZ-0000000G4hO-2ubq;
	Thu, 21 Aug 2025 07:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F96543B8A;
	Thu, 21 Aug 2025 07:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C277C2BC86;
	Thu, 21 Aug 2025 07:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755760613;
	bh=Up9g/vI3BHwIi+2MZpJPHWZDdmmaSTnrlf6OaSDp48E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4HgHHSW26FlK4PTq5Po5duNBcyGsieoINkWA0JLtgZFu0Za+g3yXAzJogDq3TOHN
	 muD88A6G1NLSRF1QtrshCP+o3FBA5xRw5rxGFlTtajuLG93TJyuM03PwX+6xbvHyX5
	 Ar31qrHmZ1T+zTHSCVRKheegezxxIdck5GESemAchjeSFbg6dq9W004RgkRJJ/76rY
	 XtksCiXETk0d8P/q4fBEH9r4ivd3ZoFdwhQ8WLzuua/zNrQSOaOZerABC4MoFgCZLY
	 oR7oCCSHTFO4En8VwwcCUn9YaXdCFO0tHS9wsu8m5P4yE+GtHowh+9J+Bab8Os4Vd8
	 75AvpDAmni6+Q==
Date: Thu, 21 Aug 2025 09:16:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: mediatek: Add power-domains
 property
Message-ID: <20250821-whimsical-mustang-of-champagne-ca7a7d@kuoka>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
 <20250820-mtk-dtb-warnings-v2-1-cf4721e58f4e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-1-cf4721e58f4e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_001653_751075_1DF86965 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Wed, Aug 20, 2025 at 03:44:52PM +0200, Julien Massot wrote:
> The mt8183-mfgcfg node uses a power domain in its device tree node.
> To prevent schema validation warnings, add the optional `power-domains`
> property to the binding schema for mediatek syscon clocks.
> 
> Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains property to mfgcfg")

Checkpatch complains here, but more important - where is explanation of
dropped tag?

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

But this tag appeared? It wasn't even given!

You remove public tags and add tags never given on the lists.

Best regards,
Krzysztof


