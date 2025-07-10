Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E93C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yh1oZYi5He8u6c75FxBqUjF/P8dsSkx+mSq7uRQnfpY=; b=oRoNOWTHueoHsNQtYmTmK5zUD/
	T2r0/PFMG8aYsb03ykQQwZpJwrkK8ugNH34nmHT6lsuINhumumc+t6beW4HUrX+vvL7J+IN5sV0Ck
	+vD6mgv8uKOK6XC4vIRhaovcTnGp/rFDRJ5T41Mmn2+XfZVPDpCXYB1qBla3AretoYhfrALCfaP5v
	hYWsac3kw9QcD9Kzmnw1Xst+XMT0x6Ps1wF4OGdFf+QZGiZ/tkywrMDTnGG5Icxu0wIrvfYS11YkI
	c6Fb7835C6bQ7ci9F+jIckkrShvTbSM9r88hEmcRv8Bpi5hmMfK89/haWjHdxHSLkZb0T8RJj6Zdi
	zccH0cBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqQB-0000000Bm3b-1bUp;
	Thu, 10 Jul 2025 12:30:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZp28-0000000BZDt-3QSZ;
	Thu, 10 Jul 2025 11:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=yh1oZYi5He8u6c75FxBqUjF/P8dsSkx+mSq7uRQnfpY=; b=TNey+Q/H+gvNrd/vklpz2lSgcz
	zYsU2CFvIdj8g0DjwUaA9LkCsNFvVRJAd0yqfZsM5wwI/hXk58oI2EBTvnu533uvT5XiaqNyRxfrF
	g83m2YF/9AGV5+B05cpsTVrC4kgvpJPHvuDlWPPOH8r+btbDaIDQuVrUgX2UGLWav3NRbxmlT0uW7
	dQTQBNEFCi3yhvQVLAodPh3ku8WmTcVjyZVQq8vMgKY7R7O/nTCBGvRqMZ4ZCZoAakU5Y8Bm8O6+/
	rNnEWIi775SRRakTqEIcqol6mmmSWcUfoQQ10JeuFbj8NQV9Fi6J3p8a0VMLORPwwhZd6uy89wvqJ
	4f+rKPdA==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZp20-0004He-Nb; Thu, 10 Jul 2025 13:01:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	imx@lists.linux.dev,
	~diederik/pine64-discuss@lists.sr.ht,
	Dragan Simic <dsimic@manjaro.org>,
	Ondrej Jirman <megi@xff.cz>
Subject: Re: (subset) [PATCH v4 0/4] Describe the cameras in the PinePhone Pro dts
Date: Thu, 10 Jul 2025 13:01:33 +0200
Message-ID: <175214509884.1901332.11258386296497025238.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_040144_859350_67B0C308 
X-CRM114-Status: GOOD (  14.54  )
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


On Fri, 20 Jun 2025 17:21:31 +0200, Olivier Benjamin wrote:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
      commit: b610dc822f38010508b54c8f556a3de28556d273
[4/4] arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro
      commit: 9259c81a185663c2a7cd6a5301df4b9645980528

So I found the binding-patched from the media-tree in linux-next now,
so picked up the dts patches.

I fixed up some issues, please double check:
- the pinctrl-handle in patch3 did not match the created one
  (which patch 4 fixed) but I adapted patch 3 instead
- sorting of the avdd regulator (alphabetical by node-name please)
- sorting of properties, broadly speaking, alphabetical too
  (caveats apply, see dt documentation)

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

