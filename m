Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED11CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 21:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lafGBJ0VQ4ZmQeQQdWVZa8RBcapI9UnE8qzTzoRje3I=; b=2OKDFq5nTPP+gsLxLqm/nikC6p
	5hmgYVes0WWXgpEtHPIuDrFw1fmL4byprmTEMqhVP5PaO6vI64jCI3dyPuCUidsAcE5TVzQfBf70c
	jxl21TCJmclYoImI0mjQcB4wH25S9wJruYXiSEAcnz1GfqtG1/kgghO9m+61nTSPWtuMpVTu14Wf9
	vSvCz7nRkUOEsGI34rUYeEMPWtPUmHl0q2ChdQHUMIOgAmZmsFpVi032drnrNyaEk4uBXF4Lsm2OB
	6idy2Z1q8tF4wusAEk9nA4MCdBM7byRl6cmDfJcJQqQL8xTVTiaPcMc8cnJL6BQT27Phaig9psrxI
	h3zPbvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Alq-0000000EtXI-08sf;
	Tue, 23 Sep 2025 21:41:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Aln-0000000EtWQ-3JDw;
	Tue, 23 Sep 2025 21:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 215BA43F56;
	Tue, 23 Sep 2025 21:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED8DC4CEF5;
	Tue, 23 Sep 2025 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758663715;
	bh=K2AFaAphLag2Ez54TqgVqGYTS8Wuz1j2Ec7u9TglbZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKYPkq+6h1XJ9wGM5liz75OrgDFlseHe0NHVyy5OBATAdDhhLl6qIsBVWjON4BALj
	 ZiHkfUV3SznpvQb59DBKHUnG/7++D0QXpoIOXfpvH7QezalbMYSeoGjXFKOxgaywz0
	 nIYp+j4Ub6fj5zAQCJ08Vm89NHxlyz7qvS2+EQ/6PfQ2f8DwJJT/U4CkD9mtjvmRzK
	 ZM6hAohKtD19lHeS1AuMB+7dcsJilH5exq1kO3XGXUxBy8Sy7CaLCvQvBInusXcZf+
	 IVsk/ng0JtXK7e+lIXpL2Dn4aVXjW6WzNM0XW6TwDOQTeE2BImZXhdHzCM3OM3SRUW
	 BKY5R566k+9SA==
Date: Tue, 23 Sep 2025 16:41:52 -0500
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
Subject: Re: [PATCH v3 3/6] dt-bindings: arm: mediatek: Support
 mt8183-audiosys variant
Message-ID: <20250923214152.GB91441-robh@kernel.org>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
 <20250826-mtk-dtb-warnings-v3-3-20e89886a20e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-mtk-dtb-warnings-v3-3-20e89886a20e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_144155_848005_62764EF0 
X-CRM114-Status: GOOD (  11.88  )
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

On Tue, Aug 26, 2025 at 09:39:36AM +0200, Julien Massot wrote:
> Update the mediatek,audsys binding to support the mt8183-audiosys
> compatible, which uses a different audio controller
> (mediatek,mt8183-audio.yaml) compared to the legacy mt2701-audio
> controller.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,audsys.yaml           | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

As this hasn't been picked up, I've applied it.

Rob

