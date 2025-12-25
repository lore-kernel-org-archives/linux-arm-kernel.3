Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AEAE7AD47
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L0uQvSVJbSEQTBW1W1Ohra4CsURQBMjqCsfmMNl/46Y=; b=13LVdeeT8LFYxTJS01P519Ok3t
	SQXBJtmEfEnrUToUFWIrvv2u53KLtpNt+GhgALNK02163zPNKg/RWODc9uccBSEkHu/7Y7frr/yNG
	j9f6sUwqVqnGD+XkLhzBS2EehRcSlBXucGiNZUKru6UBGqEn3z3d6QQuIyDYYP/hD4U08M691wPoM
	7cY4bac3xTllXyLvOdwv3lNIuDbIveUZ1LR2qmO62gC6u3RIbsQDyql4P32wb3CoAKH0kjFnaEq97
	c/b3IkzUeDQq+iTMTHdcg/wqyXxreWmtL2bc/ewxN3YbCv78v0vYdjkxe4hx7MEksmrDYa1NarpaQ
	wDwwHd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYihx-00000000KOl-490x;
	Thu, 25 Dec 2025 10:36:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYihp-00000000KMh-1rEl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 10:36:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBEB260143;
	Thu, 25 Dec 2025 10:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053ADC4AF09;
	Thu, 25 Dec 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766658985;
	bh=hUjiGAUCEtkj7Gi1H/0UYonfjZuOU7AW5JdzHCgDQe0=;
	h=From:To:Cc:Subject:Date:From;
	b=Ja/rtA+4bw+OqEQTsX/xoFbdMOp9T+S9QqDvRK1rNtpM6yZWb1Ywh1s2zj6LDV0uH
	 01CqVcszRJZCqKQkxeKcHb0eXgObpkLck9PHhNz9c1rBJCA0hyXkzkzqN8LZh6S0KT
	 bqdukJ96hfpxeqe/Ruubc2S9B8aub3irjbV3VVVo7J0A0y7Wtyc4DdFm5FawtHNNRE
	 hymEksH+BRXERvnIrpNe01+saDNXIR5jRxUBRvBdhWeE5WOEwPRIaKEje/ryAISMoX
	 DspYTlEoTml2dICU6g/4Y0Syz+6hBkXivHV9qiIkKASY+L7VOszabsKb/wOvs20g45
	 Ms+w6EK225+zA==
Received: by wens.tw (Postfix, from userid 1000)
	id 4AF465FC5C; Thu, 25 Dec 2025 18:36:22 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: allwinner: Fix remaining DT validation errors
Date: Thu, 25 Dec 2025 18:36:11 +0800
Message-ID: <20251225103616.3203473-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
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

Hi folks,

This series gets rid of the remaining DT validation errors for Allwinner
(sunxi) ARM 32-bit device trees. The patches are self explaining.

I plan to take all four patches through the sunxi tree.


ChenYu


Chen-Yu Tsai (4):
  dt-bindings: media: sun4i-a10-video-engine: Add interconnect
    properties
  dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern with leading
    numbers
  ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
  ARM: dts: allwinner: Replace status "failed" with "fail"

 .../media/allwinner,sun4i-a10-video-engine.yaml        | 10 ++++++++++
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  2 +-
 .../boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts  |  2 +-
 .../boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts  |  2 +-
 arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts     |  1 +
 arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts  |  2 +-
 arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts     |  2 +-
 7 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.47.3


