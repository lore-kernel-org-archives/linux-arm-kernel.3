Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1596C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 21:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P704jdG4dY1gYMag6CkafUUs1KoIwLh9colggYiL2Zk=; b=aCx+OPFApwIuHT9UgqFOiNfCoW
	5UuJI2T2zSaLJjtWKnfid0BGrAI9S4CnG5Lyo6M3MHcVUvG9oE3c0OmpwmucT7qf17Y6ynICP36WV
	MqLigdYV/cZS2vFD2e3kxdlmPD48jDbhCj6Fw/fbvVzrtPis9pXHeRQGDVW3iwt8LPspWIruMSB9Z
	ndwvhJ9Ep1dUNjV1EX8bk9WUqDAokYAmsn+0ETvJuRSAYYr3TdChfDHWiPQDouHdqKeO3UoZ4+fBG
	6ZeuaQqrJYQFpI4uuvwDOv3oj5v/ShRFcuBi63X/w9/pn6U3qAmgVibnsbJ8ZR1LerxHrCn2/L32s
	EwrHS9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYpb-00000005MqZ-3WOk;
	Sun, 19 Jul 2026 21:13:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYpZ-00000005Mow-2IXf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 21:13:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so12463835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 14:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495628; x=1785100428; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P704jdG4dY1gYMag6CkafUUs1KoIwLh9colggYiL2Zk=;
        b=qWp7owzf6bITPu/92ts8/TEP43SjiZWS4Uyuh1wEA969oKO1zmfBK45tlZyyGYYmof
         OgY3mxgn1qgD1zwYGOKx8yIIkhAGj8V077R1XF/u6S8X+Yc77XVavOVYBkLVSm/Hey1+
         b3QGQTEe+xYAYy2xHZBsfbC48zZD2EXYP64Fm6xbBU2+/4ARcGEi2axAQxOugpbUUsEn
         6Fdd9ZYe2Tf7cH5IS/NFrSWcH5cVbCVL2B+LSqJ18fYzEZzDmQ0avpf1rI37nnAwULAZ
         AoF7RGHn9vNo3pLBXIJa/Aggssl2r6imRuiEPLKVLYq5+SSwpDMwPG8d7/4KSqIs2cp3
         T0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495628; x=1785100428;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P704jdG4dY1gYMag6CkafUUs1KoIwLh9colggYiL2Zk=;
        b=UVv/lCF1l+JY9P0QhXYMDb5H2tJnF6lkkvrp1AZIPvPSs+zMge6jwoC702IFoEzLcE
         4DYEbmKIZ2YMNlaiNfJ7X7SJFffYNchjXSTNjvRCL5dsdZUaMO4qIVgYv7TrM6UCKT1O
         5PCj0ATHG118puIqHL/3sMg++IFSZxERjSx6jEOffbPfByEvf2HkooPkL9ZfMjnksPuw
         Ls+c5yNdCWIBSAbeVvEWPkYqYHoLHz8l9KqCkMteViTGmOYFAgwNezsY7NVt+n4gXg8X
         h8rW0fNs9CfIXfgJmdeX2XY0qEmu7IinWvJqZ/Jj5Q9PQwYeVlcpeze3ftrWJBMaGKtM
         11vQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMYS9xAEWiwvlSBp07q/86t2KTO4Fhg1I2CDZLjTOxWKHkPqFOnkpOEWo3hNkXzczr9GJxTUI1VLLC1KDhx76F@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Y7qXGIgMuLm/PUg44whWorWJ4TBitkzbXmauaGDhxBtCT0z4
	s8x8WKZZ5e+j6GXt9PygVs13cSR96Yh7uo9168R43E8D15evgafhRl/Q
X-Gm-Gg: AfdE7ckRQOWVR+od/4FRnl/CPc6pYESBR7VyEfTdPEjEVpnPHHGRI6g6kXpjOQYJNSP
	cpAubgYx/KtPAAjwsUqBedUQIKruhwHznkq6sqc+7wZic6dja5PK1lEy/BTrAH9FKqvBR0aitBv
	leGOi4w6uoynYVf25PteAVbngSp1/8c96KQHRZHpVu7hjU1+ottii56xxSAgJhnEQ8+A9oGlCTL
	/+Kb1tSt/ArgxgeOnIAcq8jq/21SWV2GDtqCpBzU0DBLERX0n6nDqbnNiM6lnv3pc5WMy5DGbRj
	8qxJLmxv/5IJbLrG3YAE3Mk1syICe/zhNyXVpBatGoYplPymwGNU5PGmbcgBsZ5rP3yGQ5iZO87
	QgeC0EF8IWDt46yOUOg9nCDBUvK+/cMKNS9+5O5zNPrNqNtWzwflb0Z1Jl3Pff/NIJeylwc76cM
	jCS214tW/Rscuhv1amUFmu37czwiDlcSeH9x75Obaylx4h4N8=
X-Received: by 2002:a05:600c:3b8e:b0:495:4bf3:2150 with SMTP id 5b1f17b1804b1-4954bf3216amr129364555e9.8.1784495627377;
        Sun, 19 Jul 2026 14:13:47 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:46 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 2/4] clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not linear
Date: Sun, 19 Jul 2026 23:13:17 +0200
Message-ID: <20260719211319.982285-3-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_141349_612817_50BB485C 
X-CRM114-Status: GOOD (  18.07  )
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
index 20dad06b3..979e53e63 100644
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


