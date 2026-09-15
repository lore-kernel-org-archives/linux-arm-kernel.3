Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB175C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejZOLWZBqVvE+aJiQH4w7G9Km7AK2Bodk8g1HgypfSM=; b=fHre4CsbPcSucoKu1g95eFWzrd
	MAj1xUzERE0NqKNJBGVxVivR+IsbTykTm20+31OApHaVgc+GGAesGkIWzC7uYhp3nDA54T7BnyRSV
	4pNt4doqK5koRe5UKVf+/ugTYPdeNPK55AVB6aYv4mmkV4feTBz2w+zLjAHE960h5Bp3DkpOlirMQ
	CjYTgH2pKZ7BNvGPh5W6lKzip62Ials0NYoXc8kkXy6UN2alUXjb3ewq6kSSroIi+26TJAEW6aT2t
	jJomnO4kBwmYM1BhcHY7bL2d37zJnAggqYw5yysgao19zSqZodC2TTVskyWysTJRo7OEq1Pm0x8Oo
	NCbK5pJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9F-00000007AuD-1vXb;
	Tue, 15 Sep 2026 15:32:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V8z-00000007AcW-13Qy;
	Tue, 15 Sep 2026 15:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ejZOLWZBqVvE+aJiQH4w7G9Km7AK2Bodk8g1HgypfSM=; b=D+WqOnwHaqVCHqNeh3WeGF5BH1
	DJV62vY+KbZYjW5QieTrmwgKbbhWKsMuwqpFbNYQgd2xVRQx8CSRSK4UO3PC3MHAJrfKMspxa/rNX
	sALMa/PiHDmLFjsauythcA10TTVD/JCSylS86sld4TW4xc/T29u8dxiKVe9f3sWtWW/OY7u15ohUz
	PKxyVVnEeGw1QJ278jaVHPmByYTWrAnXhWcA1MiM9YhUmY4/OtoC0sSzxflSP8aWPsGr8Kq4Ha9VN
	EpGlZLh+aN0zc9dqEVv5TsFWhcXR6k2Oh2c0Z5UjxnWew33FsjRtDcUbXdhVHLryl8Zhct8oZwQ7w
	MYGK3q5w==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6V8v-00000006wXB-46z7;
	Tue, 15 Sep 2026 15:32:24 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260915153220euoutp024b0df39da8d94f57de13bfae694851a3~ViFiQ9n050392803928euoutp02a;
	Tue, 15 Sep 2026 15:32:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260915153220euoutp024b0df39da8d94f57de13bfae694851a3~ViFiQ9n050392803928euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789486340;
	bh=ejZOLWZBqVvE+aJiQH4w7G9Km7AK2Bodk8g1HgypfSM=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Wd08AOwR/A+BGb2Pwf6AeDhBuomsub9VgkDTgu5pVaVWEt2cdiEVfIoHt/tM0mgWC
	 AWxQXzye4LBgqKiXioZxJsIJg+Hi02rW5k96kL+5egu+dDvF4rGkh5nyDEOfaSzOp5
	 DtVldbkoosB+wmtCs3AXo/7L+9N5578bikgqwTGc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153220eucas1p1f5b0e03015500d9d66db8993426c8734~ViFh556ML1215512155eucas1p1O;
	Tue, 15 Sep 2026 15:32:20 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153218eusmtip1a67d7df51779cea51b9ccba9edfd3c9d~ViFgQLW9c0616306163eusmtip1b;
	Tue, 15 Sep 2026 15:32:18 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 15 Sep 2026 17:32:12 +0200
Subject: [PATCH v4 04/20] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-jh7110-clean-send-v4-4-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260915153220eucas1p1f5b0e03015500d9d66db8993426c8734
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153220eucas1p1f5b0e03015500d9d66db8993426c8734
X-EPHeader: CA
X-CMS-RootMailID: 20260915153220eucas1p1f5b0e03015500d9d66db8993426c8734
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153220eucas1p1f5b0e03015500d9d66db8993426c8734@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_163222_098299_0187B8A2 
X-CRM114-Status: GOOD (  10.14  )
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

The video output subsystem has its own system controller, documented as
dom_vout_syscon. Among other things it holds the mux that selects which
DC8200 output drives the HDMI transmitter, so the HDMI controller needs
to reach it.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
index 0039319e91fe6e6aadc4300114626348e4dfb7ce..cf9b657d0e8a3ed5c5688336fee4123e14a2ac58 100644
--- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - starfive,jh7110-aon-syscon
               - starfive,jh7110-stg-syscon
+              - starfive,jh7110-vout-syscon
           - const: syscon
 
   reg:

-- 
2.34.1


