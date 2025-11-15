Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C1DCEBF86
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 23:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2QaOkO8NjOGntm2KfoOJ04f8p6YfbVqlV+eGAe/YQo=; b=Vueobki7iKmIJp0u4J2N2Ct7N/
	dUcC1jN5cZ+utqcpErvOOyZFpZNkrKhAkJCL8lrT6/uWdERQlt+/0LPSUz76JGLdoeyfEzvOCKwjy
	6vLWe2Kqrjphd5iK0U3mBGMho1zybB83a9dM3LL47uGAN1ojgvI30NH8L/i4qZJNCH2QXm2S5e+14
	F14eM7npOLrX/LcovhflKdumI9VcQCi0e+VUmeinaxZm9Jhul2ziaBu66o95pGEjdQhuyAGGbSkAN
	Tw47Po92bqk5j7sPbC4hGYlWmyORFGapJgaJKbI215Mjjk1aAk1VbeNqCyajt5mDHuVsJGKmkEjTo
	ghwoMg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKPvq-0000000EDdx-1SzP;
	Sat, 15 Nov 2025 23:43:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKPvo-0000000EDdW-0XRh;
	Sat, 15 Nov 2025 23:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=p2QaOkO8NjOGntm2KfoOJ04f8p6YfbVqlV+eGAe/YQo=; b=T7W1X8/VKMuVlBltXAxej69Ttz
	RuhoComjszRwtfM2WRLudijqxYx8+iDpYVKRkjzAOeJ2+dzp/hIgsO4ouvdKVfdGyFNXNp/m6voi8
	y712OG3Hn2bhgRTkA3m/P+ycUcJYGV3Z6f3S1VKon4otCRK35wNF7STP5wQTTx3aJETYob8/p8rOc
	8++Wjxfe0mDHh/kpUpJd3V+HDyNTNZcB7h9xuTpi4weeY7h6j7ilSzsyEscPgANMx9D2hnoRotmfV
	lAyrMTxiua92KOdCj7nX41M+MAE994s8pN348Eocq9pi3S48mS+rJeSjDKpbDmadqS+/+x77ZvwzF
	5XyTT/Tw==;
Received: from i53875bd0.versanet.de ([83.135.91.208] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vKPvO-00022c-4Q; Sun, 16 Nov 2025 00:43:22 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v15 00/14] media: rockchip: add a driver for the rockchip camera interface
Date: Sun, 16 Nov 2025 00:43:19 +0100
Message-ID: <176325011672.721648.2323929668705434904.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
References: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_154348_194541_0D5F32C3 
X-CRM114-Status: GOOD (  15.17  )
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


On Fri, 14 Nov 2025 16:20:11 +0100, Michael Riesch wrote:
> Habidere,
> 
> This series introduces support for the Rockchip Camera Interface (CIF),
> which is featured in many Rockchip SoCs in different variations.
> The series has now been around for a while and has received many comments
> and reviews. Thus, it should be ready for mainline by now.
> 
> [...]

Applied, thanks!

[11/14] arm64: defconfig: enable rockchip camera interface
        commit: 60705b039f960378bb2a0a844f9378646bc0c6c8
[12/14] arm64: dts: rockchip: add the vip node to px30
        commit: d2da7e98c0bf7f75433809ad875c6e1ae57f0cea
[13/14] arm64: dts: rockchip: add vicap node to rk356x
        commit: 78f316e90906d54c8aa6029e5c19ae83e420e56a


Not applied 
    arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander

because of
Lexical error: ../arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso:149.18-45 Unexpected 'MEDIA_PCLK_SAMPLE_DUAL_EDGE'
FATAL ERROR: Syntax error parsing input tree

This likely will only work after the next merge window.

So if you can live with that please resubmit that last patch individually.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

