Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAF8CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fs+vPKGM9euFPbmuig/kk7Y6Q16/AWU1bovoyR6PvLA=; b=cg7jO0aIG2ZbePZpCWsKnVjazc
	PHlNJHY0fnE1A7Pbcpp8R7BrTB+y90qbPTvcxhh5wrw9DeVY69zsaQSOrVV0E+l5iNbYZnxxbs/mQ
	VeE6OfHPAjJAHfxmVKaEd0L6TscyNpITkT8qkCirh6TyQw4K6MTktedD3JsrruaWyx/NIRwjTWgdm
	oq6afoBQEPFu8RT0FAHnVhasvjcpAmq+eurRSBC41jRo6fwtVUuAx3YVJemFTGH54Nc6hCYGEywFO
	v/p2fxy+mPIFAj2R6a4LxrDG2Yznzb06B9oy8OIGnub1isR0wC8MVJnl3JB0XO5bi5s3tEp6sTbdl
	kJo/uhSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfoX-0000000G9fE-2Mpa;
	Mon, 05 Oct 2026 10:20:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfoW-0000000G9dt-0EER;
	Mon, 05 Oct 2026 10:20:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70DD360A7F;
	Mon,  5 Oct 2026 10:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552301F00893;
	Mon,  5 Oct 2026 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195655;
	bh=fs+vPKGM9euFPbmuig/kk7Y6Q16/AWU1bovoyR6PvLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bx1ru7FUxUOa8za+jHJc18vTvLSX0rGMjYYZQPSfq/jyKsKUa7bZaaGGUva8/CfTp
	 WMdg/G++C81yk6gAFR3I/6NfoohQO81VTmyJhdUvgpHl2uq7oES27vbdPul7Gg/ycR
	 8ahPijtcC+M5tH33Nfw/9dR1u5U0cimYXpI8rG+4T5Sq9bvKPkC5xC1w6OplhFZ/pc
	 XLACWo7KRYFVaNrB6q8VDfoc0b8heJahjdluTXnjV31T5YWumh5k9jFg53gseGOWjc
	 Oyqzl+xkSTbBZL52hshd/MO5n45nFRAZiZgl6bsY3Q9RzZrNMw9P6d65IV36uGpAws
	 P6enf4OhHtvkw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
Subject: Re: [PATCH v2 0/4] phy: rockchip: add support for the RK3576 MIPI
 CSI-2 DPHYs
Message-Id: <179119565198.316652.7051689992732505012.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 12:20:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 15 Sep 2026 12:42:45 +0200, Amin Gattout wrote:
> The Rockchip RK3576 features two MIPI CSI-2 DPHYs. The CSI-2 DPHYs can be
> supported using the existing phy-rockchip-inno-csidphy driver.
> 
> This patch series adds support for this variant.
> 
> As you may have guessed, this is part of the efforts to bring the
> support for the RK3576 camera pipeline (VICAP) mainline.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      (no commit info)
[2/4] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576 variant
      commit: 40c95f05093129e75f0180938de53dac65ce7e75
[3/4] phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3576 variant
      commit: 47de65075563915363ed25affff41b9b4d004d4f
[4/4] arm64: dts: rockchip: add csi dphy nodes to rk3576
      (no commit info)

Best regards,
-- 
~Vinod



