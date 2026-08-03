Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2687FC55822
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eQVck/8/EmRztvhd8Uz87RWfrINzUZUMP2w+5sPTpA=; b=luLVbl+E+MLvjKUFYhRqrne14p
	dWtCp21tnPY+0i6OR9cK91TouwOCXDsAEOGsIx0Kxn9jXpA4vYo3A29Y6WvnwoXOA5kYKqtAGoxIy
	zCgMr067wist430wZtf5Qs7Wn+yUOue2/R2OjoSURciG8ZWQqynsc9TcyLPP44Q6XU+RfYjMDHTfq
	t2A/bzr2IR8iPYkbYZOSRrTDwh48bavrRvlvSb9u+mKjsYgBbCrHSha80j9JPfbKeA0QWmTrtvJBM
	RTb48RhpjLqp0sg6iyapBe2+cKg97pt8IN4HnGFNQvzaP/OTRete2RvR4Cjo4YbjCm7DuoZuU76ra
	ZajSWyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx56-00000000KO9-1hBw;
	Mon, 03 Aug 2026 18:08:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx54-00000000KLk-0AlN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:08:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47fdcdfceb6so1160934f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 11:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780484; x=1786385284; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+eQVck/8/EmRztvhd8Uz87RWfrINzUZUMP2w+5sPTpA=;
        b=YLpcSq8ecj3mNpOzYCsrJmQ7VTWAQw/djr7Ou0sJ8WrQ2JTQJWZxrSNd9svyu/V/yl
         XYOZj70copcMM8F5A1JsIyT/mTJh8EKwSuPVKdNOsl5SpICdMMuccuKPjzkjDrx1uZ7V
         kUdQ81hhz8gy26/RWPC4MUxss5rERdutK8NjHZW+edBJsMCRRjMptLEUQh1dfid0KRdC
         VZ4T7CHqQwOAXF8S1v/6p5UdtXd/vfbM44JZp6vNIN109MMwuo0/OhUGJNc2O07gwfE/
         /319lRg2D2xgDOAy43U4VTCZqagBq+c47NPyuczy512uKLldt7yF1G5k9YtjiByUE5n8
         YmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780484; x=1786385284;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eQVck/8/EmRztvhd8Uz87RWfrINzUZUMP2w+5sPTpA=;
        b=awLe6Ol0FyZhlWah8I9+mfk9pG2xV3bJLmbrGDz0TSYOC2Qi4QUlmxLvx5jYhuX245
         NSWuzOqM0/xp5LEbXbyP30DgYAZsh3ZCAAMjT+t1ZzKa++69WmThLfkt6xlmgwxEqoAH
         11b47ojLzKFVYVV9SqoKdALgVkoUf7JCNIANrQbMnT/2qlZWFJ0CgGv8uSDsoQiPM+yy
         TmXCaf8ensjvSBv4grnz99M1btXxyu0UKCaeBUHq1SHoxZcy7Brit+o0Pf005J4aTWF1
         59WzmRW4MsxjBCOMoegfh1/xPLCMKBPMwsM0TwFrQ2DLSNDnpzvDI4VBkOOwetBtK9OE
         IoOg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/DNMW72QEIU830JiY4PLtTLhWzmRTTSwQQR4qyz5/Y6L0pAtHxQiHIrpZf0oS+1BxkVIUlTPQ01jyo2YqoewQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzBVZSTvd20jNEEs3oxDn2fuhKXPfdu3LHT2JkZVE3/2KXSYwUy
	N5wTyyvyBTCuUHmkgZOOffYd+TwYLCKxggrwFdJdXwgP3gPKzKBMrwEx
X-Gm-Gg: AR+sD11UE6gNL4YTXRD+hBIMcjFAvISkbnXWLxceHNJcKFScm3aTGYmdFGHfC9a2n0J
	F73sLYNpk/bpIt40BBbb2gMHwI11EEGq3XaRe8tp+yrzS3NiZmA77oySoJTJvezgQOaK3o2Tlls
	OXfQMU1+j//LFIQch5kK8pjXYby2U4/dP0oumI5v/rnd1fwlbd8Sg8ZruzLxtAF3tTC25e7AFys
	FQVorAqq7st1GmtUb5OLXF2uNvqyyVXKP9V7eAuEFNTPdb6Grpt2R5UMss3cUxNgf3UR8p3VxgK
	799b/0HL7oY1UBXdhDcbi7/8P6Rf01lPr+ZZMnNXPry+G7FffOxBvkArPQhT3HrTKpYUlrHcZqX
	p2EIcfucUfADz8XWw6JM7l2aSiUZIJ4P4LnqJZdt68Fxsevx3CQZR+3GLVGK0P9r5W+Qn/2kU9K
	vr9OtRSwiNpNUYcoTs6WCdS/z1iRtPdRofVIdWIdX34vn8pJ1veV1aYKITBTGQCVScU99NdEWf7
	yRiE5k0DgNOsRMkFDy4WaHs
X-Received: by 2002:adf:e90f:0:b0:47f:9d0e:f8f with SMTP id ffacd0b85a97d-47fd72e6079mr24242189f8f.26.1785780483886;
        Mon, 03 Aug 2026 11:08:03 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm37950955f8f.14.2026.08.03.11.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:08:03 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andre.przywara@arm.com,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v2 2/3] clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not linear
Date: Mon,  3 Aug 2026 20:07:54 +0200
Message-ID: <20260803180755.288793-3-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
References: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_110806_135398_1539C0E8 
X-CRM114-Status: GOOD (  18.10  )
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

The GPU mod clock (0x670) was modelled as a linear M+1 divider, but the
M factor of this register is a cycle-masking divider: GPU_CLK = Clock
Source * ((16-M)/16) (T527 user manual v0.92, section 2.7.6.58).

With the linear model every OPP that needed M > 0 silently ran the GPU
faster than requested.  Measured on an Orange Pi 4A (T527) with the
Mali cycle counter against the programmed register:

	OPP request	programmed	real rate
	150 MHz		600M, M=3	487.5 MHz
	200 MHz		800M, M=3	650   MHz
	300 MHz		600M, M=1	562.5 MHz
	400 MHz		800M, M=1	750   MHz
	600 MHz		600M, M=0	600   MHz

i.e. the "400 MHz" OPP ran the GPU at 750 MHz, 25% above the vendor
ceiling of 600 MHz, at the low-OPP voltage.  Thermal throttling to
"400 MHz" actually overclocked the GPU.

Switch the clock to the maskdiv type.  With least-masking preference
the vendor OPP set now resolves to 600/400/300/200 MHz taken undivided
from their periph outputs and 150 MHz = pll-periph0-200M * 12/16, all
verified exact on hardware with the same cycle-counter method.

Drop pll-periph0-800M from the selectable parents (the mux table skips
hardware index 1): the vendor BSP removed it from its parent list with
the comment "If GPU use pll-peri0-800m, gpu will occur job fault", and
with the masking semantics every vendor OPP matches exactly from the
800M parent first, so it would otherwise always be chosen.

Also drop CLK_SET_RATE_PARENT: every OPP is reachable from the fixed
pll-periph0 outputs, and pll-gpu must never be reprogrammed through this
mux.  Once the GPU moves off pll-gpu the PLL is no longer prepared, so
it loses the rate protection of CLK_SET_RATE_GATE; a propagated rate
request would then reprogram the PLL while its gate is off (the lock
bit never asserts, 70 ms poll timeout per transition) and switch the
running GPU onto it before it locks.

Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 32 +++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 20dad06b37ca..979e53e63522 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -21,6 +21,7 @@
 
 #include "ccu_div.h"
 #include "ccu_gate.h"
+#include "ccu_maskdiv.h"
 #include "ccu_mp.h"
 #include "ccu_mult.h"
 #include "ccu_nk.h"
@@ -442,18 +443,37 @@ static SUNXI_CCU_GATE_HWS(bus_g2d_clk, "bus-g2d", ahb_hws, 0x63c, BIT(0), 0);
 
 static const struct clk_hw *gpu_parents[] = {
 	&pll_gpu_clk.common.hw,
-	&pll_periph0_800M_clk.common.hw,
 	&pll_periph0_600M_clk.hw,
 	&pll_periph0_400M_clk.hw,
 	&pll_periph0_300M_clk.hw,
 	&pll_periph0_200M_clk.hw,
 };
 
-static SUNXI_CCU_M_HW_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
-				    0, 4,	/* M */
-				    24, 3,	/* mux */
-				    BIT(31),	/* gate */
-				    CLK_SET_RATE_PARENT);
+/*
+ * Mux index 1 (pll-periph0-800M) is skipped: the vendor BSP removed it
+ * from the parent list ("If GPU use pll-peri0-800m, gpu will occur job
+ * fault"), and with the masking divider every OPP would match exactly
+ * from it first.
+ */
+static const u8 gpu_mux_table[] = { 0, 2, 3, 4, 5 };
+
+/*
+ * The M factor is a cycle-masking (fractional) divider, not a linear
+ * one: rate = source * (16 - M) / 16 (T527 manual, GPU_CLK_REG).
+ *
+ * No CLK_SET_RATE_PARENT: every GPU OPP is reachable from the fixed
+ * pll-periph0 outputs, and pll-gpu must never be reprogrammed through this mux.
+ * Once the GPU moves off pll-gpu the PLL is no longer prepared, so it loses
+ * the rate protection of CLK_SET_RATE_GATE; a propagated rate request would
+ * then reprogram the PLL while its gate is off (the lock bit never asserts,
+ * 70 ms timeout) and switch the running GPU onto it before it locks.
+ */
+static SUNXI_CCU_MASKDIV_HW_WITH_MUX_TABLE_GATE(gpu_clk, "gpu", gpu_parents,
+						gpu_mux_table, 0x670,
+						0, 4,	/* M */
+						24, 3,	/* mux */
+						BIT(31),	/* gate */
+						0);
 
 static SUNXI_CCU_GATE_HWS(bus_gpu_clk, "bus-gpu", ahb_hws, 0x67c, BIT(0), 0);
 
-- 
2.47.3


