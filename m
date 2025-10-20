Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE86CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Uy03Wns3+azC2ulcA/z8gfaoHoosxjUlbn65J7+0Zc=; b=TyFxta164k2SYchhaw254EwF/8
	zd/1n0meaeVWvAjxFFMafNBp5hagn6VhozVfM3pQg32ttkL8Md4K+7IHGzBHmPg+0hObaFiH+59SP
	qA9BFzi8BtFXxI9kCLZTf2mhJjUZrMRyLi6MWY70vIJ/oWi/a9uMw2lV5nvb1yu/TTnx13kwqUn4C
	34QizNVn8F9sAOtu/DKQcssoc0fzi3zpAIiKORKxRpheD0iIUh5LkjR9UEcXpoe0yuoyIqYzm/g4m
	MRuYx74HpWGzPn38xE2dXn7R2e/6bEAvCsDF5OfkJxUyCAerCq4PQqPrPCqwwbf99DneammpgI6UM
	eaU2zP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtPm-0000000EQh8-0Rep;
	Mon, 20 Oct 2025 17:11:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtPl-0000000EQh1-2SkL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE11F620BF;
	Mon, 20 Oct 2025 17:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482EEC113D0;
	Mon, 20 Oct 2025 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980280;
	bh=scg+/vO8bFxkmmzsBeRqdeZzJ1dGRrmJ/AeHk9Ng2s0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gy4iVDXJWPC5L6y6UGyZNPo1lTkIFG+bSMJ3dmQuCn4YSDVdoZO6n7pLVV7CmH4RA
	 K2IdzWv4HUJdz6a7QyNz6Fkz3s5IEm22PF1bQQo+GXfG6rW2u6ADBT9Kd5tEPIyA9I
	 SAqqzGT62WZfYIC8H87SqEnyyJT7Qep5vR9wvouCiHE6gJqodbcrY/OpOlMCInb5G6
	 PNW9S6EsKppFRgFGqBHMMN4dT/HmB8AjB9bWiufu+0VZJj2QatzvL2TlHqtN2DvAo+
	 zcxZK5zdadGd2C6f75ZqiasnwzAwdr7mNjrqcUJJqHkXOB/QTFmFy821qOGMn/v3TW
	 lriRxPotYO48g==
Received: by wens.tw (Postfix, from userid 1000)
	id 344895FE2C; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] ASoC: dt-bindings: allwinner,sun4i-a10-i2s: Add compatible for A523
Date: Tue, 21 Oct 2025 01:10:48 +0800
Message-ID: <20251020171059.2786070-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As far as the author can tell, based on their respective manuals,
the I2S interface controllers found in the Allwinner A523 SoC is the
same as ones in the R329 SoC.

Add a SoC-specific compatible for it, with a fallback to the R329's
compatible.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 739114fb6549..ae86cb5f0a74 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -33,7 +33,9 @@ properties:
       - const: allwinner,sun50i-h6-i2s
       - const: allwinner,sun50i-r329-i2s
       - items:
-          - const: allwinner,sun20i-d1-i2s
+          - enum:
+              - allwinner,sun20i-d1-i2s
+              - allwinner,sun55i-a523-i2s
           - const: allwinner,sun50i-r329-i2s
 
   reg:
-- 
2.47.3


