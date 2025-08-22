Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B6ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SW7v0GvvSwBC0Kw7yL0pRinfOhhZcSD/06I2qrEKC1c=; b=Ta8kvtoz2ylDmH/j+YyJwpp2RU
	N0J1tJxumYXPqmOGS26L6PYs+h6OpbpfXHw/nY8uWrIPtDzK5bSnMidE8+G4ARb7KVFRJjSSQi8RO
	k0XISsGZYluNkaGt/+PmUoeGB9TUWghSN7PpClfFfx9DnO+OQSptTR4CtR+4J6yx+ED8MjaoapAgj
	FnlcThyPhqlOs+yUwW0v4NTlMTeqvxZYWfl3XFJdN1kwjk6cgbTwJ9XGAASWd5oA5Um3TT2QEjzvq
	AxB0H1HV8RQAhk14Z9IEFOfeLtEBMZ4/hehJjsEcJgP1a+KUCn3Hz/S4sbeg8k9s8lrsx/i/VM/w3
	grJb4LMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphnZ-000000041XU-2jU1;
	Sat, 23 Aug 2025 06:32:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSwc-00000002ric-35p2;
	Fri, 22 Aug 2025 14:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7391740B74;
	Fri, 22 Aug 2025 14:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1942C4CEED;
	Fri, 22 Aug 2025 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755873642;
	bh=bhSe5dlYJAdq6mjCeG2oMHDgFoB39cQ6nyMGPbyEMp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/84M/IjqLSUe0+HMVanzoXlDpTCK+nKqW9JtOBOWuLgU7/06OXafn7g3HKLAGHrR
	 6Gy6En5shwo8oZlNxTddq8gaz0m80j55IqHfKG+w8X5eHTOl1RzD7GJUTSTOJf2PlW
	 n0ttSArSzWQ40eIDMLf8+nMbwN3ZXe0/e3JjrBzYY5ZW8vKgzuFnTuXwA1Ru1iS3kk
	 KP3HblmM7yMjRbIkTinI9AouRLWqlrwnUwb7ub/dB8m95/jMEUp2Mzr3WZpYkXoF32
	 kZjuMW1TzyfNZku3dVYyTpgTjKQWjn+qxWfuSmq3O4ae6Kj8/uWIuOOtsyaEc2Fa3N
	 73QoCyUUCVYzg==
Date: Fri, 22 Aug 2025 09:40:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	Mark Brown <broonie@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Ikjoon Jang <ikjn@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Julien Massot <jmassot@collabora.com>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: arm: mediatek: Support
 mt8183-audiosys binding variant
Message-ID: <175587364044.3744053.7111449158430262490.robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
 <20250820-mtk-dtb-warnings-v2-3-cf4721e58f4e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-3-cf4721e58f4e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_074042_807933_3FEAAC7F 
X-CRM114-Status: GOOD (  11.26  )
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


On Wed, 20 Aug 2025 15:44:54 +0200, Julien Massot wrote:
> Update the mediatek,audsys binding to support the mt8183-audiosys
> compatible, which uses a different audio controller binding
> (mediatek,mt8183-audio.yaml) compared to the legacy mt2701-audio
> controller.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,audsys.yaml           | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


