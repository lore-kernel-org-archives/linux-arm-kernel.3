Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA4DCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lN5YbmxbG/JdV5+gZzIcdJo4H8J9c8mF3XBOEa05S8=; b=KrNx92AHOs/e2r0r55DXijhKM8
	/WQvelvfCnZ4eGRUFPtj8rUOPPOhvZY+SdHjEkPQsWu3BeGfjD3vkM7JKQMU4kyWs57vaFOTmcVoP
	kzZhg5jl/rlj6d/dlHeEASUPnHrlgXnOC2X1uUpMm2ALatsG08EM241qmWf+bC+oypK8YRNhR1bS2
	quj5Ye0vnxUvV9/lFghacBKTnJNqiOQFq5cyjwu3aEQGpZoToV3m3Ran6woO5eAIACsXeKTcG5Au7
	2BuwGCqHYBlQ0bZNDr8vJMstqLopCY/MHUpbExof7ZZFTz6C+Yl64utfr1D4ZEr77aJ1aOOqIptX2
	1JUSi4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc5B-00000008zom-0Jxy;
	Tue, 16 Sep 2025 20:15:21 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc58-00000008znY-49Nv;
	Tue, 16 Sep 2025 20:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053329; bh=6lN5YbmxbG/JdV5+gZzIcdJ
	o4H8J9c8mF3XBOEa05S8=; b=hLpu4gSl1jUGXNE9Jtq/BksnXL/x6+ICzqiMfsphzYiXfHyPb9
	FzXgbXb1KMk2HpiDx3H/GxNX+O+zylMx6B1er3bfaQ8poLbnrDUXnJRdyXNrULoKEwIkaCflr06
	eW0PU1YS9x05pJS7Tb/lX5/Pkuua6NSoCfNZvpyGh3Na54OWH2lgrcDgN98BKPcqM1nnoil80Tc
	dfChPmiDEQVQ0ZKR2TYDSuYNN1RsUoc2Znc4EQf40XEwa5tXHL4IZJl42j68daIjtnodTmq5gCR
	GxM8UHMpv6qKv5iKMmESGTPRXAR7Ro7ekduH4NyreNgECjUK/PL4GI1Upc5lI+ugqHQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053329; bh=6lN5YbmxbG/JdV5+gZzIcdJ
	o4H8J9c8mF3XBOEa05S8=; b=WW2JIo0sHtcyCBqdqSLDMcibs+YiyPBXlFihkQKr/CHOHUIjFb
	LMMxuDRvcSYaNmZhccDXN5Cfo6aHj8e+TSCg==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Wed, 17 Sep 2025 03:07:25 +0700
Subject: [PATCH 08/25] ARM: dts: unisoc: rda8810pl: Enable ARM PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-8-74866def1fe3@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_131519_167120_05784472 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

The SoC uses a standard ARM PMU, enable it.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index 609359aa91537168435934077e736b216adf50f4..45a2fd3e04cea5aac4fb6b40a6b332ce3eee4f2c 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -6,6 +6,7 @@
  * Copyright (c) 2018 Manivannan Sadhasivam
  */
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
@@ -25,6 +26,11 @@ cpu@0 {
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a5-pmu";
+		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	sram@100000 {
 		compatible = "mmio-sram";
 		reg = <0x100000 0x10000>;

-- 
2.51.0

