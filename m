Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF3FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 17:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bmh+M+hQ8TbCJMwsU3KCo3H2fbDSmNc5FcltHVaSJjo=; b=RCb/eW0Kp9QliozcZdMNE2bgb+
	VXqC52JvLvve2lLm1axmsEa1OlhJ9Sl8UZsBhqrjVT07hBdLjEHQGEOhhrdjUUwRqON9N8D6Id6m2
	WZCsQYzP2zKoRtZaPd8WI05x1g+zmJOJVrZAJh+9oeK+3lcoP7Z2J/lwJjZqX2RBC56p7YnLL54hg
	eMsqWS5lEpGgZLYbGvuicfgOD2EwcIEBEvXYKB3dCs5fbMlxmQUzNOyn2dvf+ZuMJRT/x/dppXkNh
	3HrIE73lTm7P4ViNFU+TtaWi2Dx/usEaAgqTkOhKc4HsJB+5j0JqRAdKbc9rhT9/ONVgTEM6vLaKL
	yH1+yiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhth6-00000006YsN-1A8L;
	Fri, 01 Aug 2025 17:37:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtQ6-00000006Wdx-3Z9W;
	Fri, 01 Aug 2025 17:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 291CDA558EB;
	Fri,  1 Aug 2025 17:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE16DC4CEE7;
	Fri,  1 Aug 2025 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754068789;
	bh=1QG/YY4VsuAP8+Akf6wF4d+CfQtLKEQkwrhF47hA3wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2dMCxiimBSUE/8WTlPRDbvOBBZCznp3sp60fZU+araGvGgnr/MYRFcTDn2LQEJba
	 Wh1bhzUZCVX83V1V50KV6aqulpcALSH2jz1f7GgHw//sTRi4gdpM/EzB9qjdZDXf2j
	 SJb0n2quFKyx0JhNsbcFmL2QzwD9hTq1zw8RKpCYVLmn+1ofpMVFxS38DKIWbwGpz6
	 t0dGbHfDjQXh9ekZcHU0Mcjrwqdsnyb0INgjnG9/v7YmChD7a1mHuO0AmxHpr/8nYR
	 5/pH1dvh9f94ywi9s2SLGvELGBViUkl5vRSQ7psjMZuqK8WKZyWbL9PKvV1nAJ3wwx
	 MeBHHeF8YnBNQ==
Date: Fri, 1 Aug 2025 12:19:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: Ikjoon Jang <ikjn@chromium.org>, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Julien Massot <jmassot@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-sound@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: clock: mediatek: Add power-domains
 property
Message-ID: <175406878860.3104776.852136364391160797.robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-1-6ba4e432427b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_101950_953396_4E10304E 
X-CRM114-Status: GOOD (  11.21  )
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


On Fri, 01 Aug 2025 13:18:03 +0200, Julien Massot wrote:
> The mt8183-mfgcfg node uses a power domain in its device tree node.
> To prevent schema validation warnings, add the optional `power-domains`
> property to the binding schema for mediatek syscon clocks.
> 
> Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains property to mfgcfg")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  Documentation/devicetree/bindings/clock/mediatek,syscon.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


