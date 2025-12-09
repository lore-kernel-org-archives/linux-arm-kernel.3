Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC5DD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1VHTUXl3gc+91mo15pIRbZ3NIRKVtsGczrD/Bl81o6k=; b=QLvh9XJqMoOxJtVK7cJK46mgJE
	iByDzZHtqAyLZB3U1p5Mh/8N0whMTmb/acaGiWaIFuIyeu/wC9aeuZTS1uJ3jPwlvlhzJaMsYGX6J
	Z7oxwyCMW2Q9FYXboCX0f3OlRrR0JG4byQQ4hpZxhxhnsceql685DyFOXGaKpX5GG5e8u5O9ZV6cL
	8jSs3R7qtnIfXUeh5K+1JilKG+xGYU+6rM/B5+0voLq6Cax4qxkTGThA2XI+tQO3S/DL6ViR9bBBU
	nChbHaGG8r00Z5MAjg6FyLxuiZKpX6ZuoH+HXsbukuXoZPcW2CK7/aELRRKEaNViTqrA8vjqvjsms
	ybIAYyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStI0-0000000E0Kh-2AbA;
	Tue, 09 Dec 2025 08:41:44 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStHw-0000000E0KG-113j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 08:41:43 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 8C1191FD35;
	Tue,  9 Dec 2025 09:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765269694;
	bh=1VHTUXl3gc+91mo15pIRbZ3NIRKVtsGczrD/Bl81o6k=; h=From:To:Subject;
	b=tsOl2uc9wCitwZsMNcL9p38pZW303QuaAHYLlQ8kCvOi7+sDaKM5czd9qH1GoqGeX
	 nr0QqhB4E6lCrxxzV767GRSL6iUnGPedZOzoipX+Qt/5xzSz1fcFQP6nBHHbWJjDho
	 iFMoPA6taDB4O9ye1dON//V7eaXDUJuzzJWiA3H3A1uMVLhUSAIWeRmkkFId5WUoHA
	 wNrr5QZ14e4CT8wDCKOg25rqt97EyO5LT2l2TuMfsDlEYwxy7GxYRJXFaLDUz02rPp
	 A8NGeI/xj7MRI99pF2m70kXvvMe/oPIDvGXiP/Y2KAUMek8JLvX0JFMJd4m0YAiMC7
	 rKuZJh5lqTg5g==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: am62p-verdin: Fix SD regulator startup delay
Date: Tue,  9 Dec 2025 09:41:25 +0100
Message-ID: <20251209084126.33282-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_004141_183981_91014653 
X-CRM114-Status: GOOD (  10.43  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The power switch used to power the SD card interface might have
more than 2ms turn-on time, increase the startup delay to 20ms to
prevent failures.

Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Cc: stable@vger.kernel.org
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 5e050cbb9eaf..ec9dd931fe92 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -112,7 +112,7 @@ reg_sd1_vmmc: regulator-sdhci1-vmmc {
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "+V3.3_SD";
-		startup-delay-us = <2000>;
+		startup-delay-us = <20000>;
 	};
 
 	reg_sd1_vqmmc: regulator-sdhci1-vqmmc {
-- 
2.47.3


