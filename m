Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63755CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBCZJnmRy44Qkm8OCtY1azPU3Y+AQHz098J5KMU6PS8=; b=IgdxdcTyibXi63QwMSQ9ndwcnk
	OTZfup7y9kTT5G8HbFj1oQ2HUoFKkNKYSbIOi/mlHHNDuEoIuT9CtDmosnFRIrEXZMuxoRPSyqdoL
	LlEfAp24+bE8WzEonxVJg1Wr2ybzzNrNRLd+X7i8bzqiyEW9Y2R27ugLy+6ME8NGn3ltenMvZ1moB
	rSnm2WZwKqpxadw+XZ296NjkG23Cu/Gv5DYqGtQtfcwGZutf8gVyQkBYB6CpuEDDUBh8WiYVreTJO
	yZm3YilfyirP1JC7BlLyhQs9ppppvQ5nNKI34Xk0LKgigKffgwO4ryDuPGDU7qvIeob3GsdnpGEuE
	ovoux/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgwd-0000000BSGz-1Q2L;
	Sat, 25 Oct 2025 16:16:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgwa-0000000BSFC-2h4P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:16:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D0B945082;
	Sat, 25 Oct 2025 16:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB9AC4CEFB;
	Sat, 25 Oct 2025 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409000;
	bh=BJNj1AKX4x8khA3V2BuAeQsKGL0gnc5G62vc3d98SzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CPIYGQitIuGVOHLExI6hVPNjCjoZxtNmL067vCxYnarugMoytfXI2cTRALvaAG3Yd
	 w12SYStShAxlvt0WeIlPhhFmowsu3/b8WsSLG+IEUjibgU44RnhrfLXtumemy9PMtN
	 n9AW0cP4ExuXYrYPAsNBiUVmh3n1xD2T0o2X25GqpFogkvK9OyguXYGfTjSistyawa
	 8hALd0rcZEi2gRhZdaqVroO6F9e6XGmc8p+ZClKLVw0EVTVE7RW4i1CGOVpr63ZSww
	 2BYDz83IWHUBGlIt5Jzb7qNvmCI33qv9v9KWfmeZDxjXbZ4HDpArL7v9TeFk6b9ckN
	 EzGH4o7tC2aRw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	rmfrfs@gmail.com,
	shawnguo@kernel.org,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17] media: imx-mipi-csis: Only set clock rate when specified in DT
Date: Sat, 25 Oct 2025 11:56:40 -0400
Message-ID: <20251025160905.3857885-169-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_091640_733209_454D2DCD 
X-CRM114-Status: GOOD (  23.56  )
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 65673c6e33cf46f220cc5774166b373b3c087739 ]

The imx-mipi-csis driver sets the rate of the wrap clock to the value
specified in the device tree's "clock-frequency" property, and defaults
to 166 MHz otherwise. This is a historical mistake, as clock rate
selection should have been left to the assigned-clock-rates property.

Honouring the clock-frequency property can't be removed without breaking
backwards compatibility, and the corresponding code isn't very
intrusive. The 166 MHz default, on the other hand, prevents
configuration of the clock rate through assigned-clock-rates, as the
driver immediately overwrites the rate. This behaviour is confusing and
has cost debugging time.

There is little value in a 166 MHz default. All mainline device tree
sources that enable the CSIS specify a clock-frequency explicitly, and
the default wrap clock configuration on supported platforms is at least
as high as 166 MHz. Drop the default, and only set the clock rate
manually when the clock-frequency property is specified.

Link: https://lore.kernel.org/r/20250822002734.23516-10-laurent.pinchart@ideasonboard.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Why this is a bug fix
- The driver unconditionally forced the wrap clock to 166 MHz when the
  DT lacked a clock-frequency property, which overrides DT-assigned
  clock rates. That breaks the expected DT model where `assigned-clock-
  rates` controls rates, leading to misconfiguration and hard-to-debug
  behavior.
- This change stops overriding the clock unless the DT explicitly
  requests it, restoring correct DT semantics.

What changed (code references)
- Set rate only when explicitly requested:
  - `drivers/media/platform/nxp/imx-mipi-csis.c:744` now guards
    `clk_set_rate()` with `if (csis->clk_frequency) { ... }`, meaning
    the driver only sets the rate when the DT provided `clock-
    frequency`.
- Drop the 166 MHz fallback:
  - `drivers/media/platform/nxp/imx-mipi-csis.c:1483` now reads `clock-
    frequency` without assigning a default if the property is absent,
    removing the prior implicit 166 MHz default.
- The removal of the default macro and fallback behavior eliminates the
  unconditional override while preserving backward compatibility for DTs
  that do specify `clock-frequency`.

Why it matters (user impact)
- Systems using `assigned-clock-rates` in DT were previously ignored by
  the driver due to the unconditional 166 MHz set, causing unexpected
  clock rates and potential functional issues.
- With this patch, DT-provided assigned rates take effect unless a
  legacy DT explicitly uses `clock-frequency`, which is retained for
  compatibility.

Risk and compatibility
- Scope is small and contained to one driver; no core or architectural
  changes.
- Backward compatibility is preserved for legacy DTs that specify
  `clock-frequency` (the driver still sets the rate in that case).
- For DTs without `clock-frequency`, the driver no longer forces 166 MHz
  and leaves the rate to the clock framework/DT assignments. The commit
  rationale notes that all mainline DTs enabling CSIS already specify
  `clock-frequency`, and default platform wrap clock configurations are
  at least as high as 166 MHz, reducing regression risk.
- The only functional behavior change is the removal of an incorrect
  default that masked DT configuration.

Stable criteria assessment
- Fixes a real misbehavior that affects users (DT `assigned-clock-rates`
  ignored).
- Minimal, well-contained change in a single driver file.
- No new features or architectural changes.
- Low regression risk with explicit consideration for legacy DT
  compatibility.
- No explicit “Cc: stable” or “Fixes” tag, but technically aligns with
  stable policy as a correctness fix that removes a problematic default
  override.

Conclusion
- This is a clear, low-risk bug fix that restores proper DT semantics
  and prevents the driver from clobbering assigned clock rates. It
  should be backported to stable.

 drivers/media/platform/nxp/imx-mipi-csis.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c01..cea017a2b14ec 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -228,8 +228,6 @@
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
 #define MIPI_CSIS_PKTDATA_SIZE			SZ_4K
 
-#define DEFAULT_SCLK_CSIS_FREQ			166000000UL
-
 struct mipi_csis_event {
 	bool debug;
 	u32 mask;
@@ -704,12 +702,17 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
 	if (ret < 0)
 		return ret;
 
-	/* Set clock rate */
-	ret = clk_set_rate(csis->clks[MIPI_CSIS_CLK_WRAP].clk,
-			   csis->clk_frequency);
-	if (ret < 0)
-		dev_err(csis->dev, "set rate=%d failed: %d\n",
-			csis->clk_frequency, ret);
+	if (csis->clk_frequency) {
+		/*
+		 * Set the clock rate. This is deprecated, for backward
+		 * compatibility with old device trees.
+		 */
+		ret = clk_set_rate(csis->clks[MIPI_CSIS_CLK_WRAP].clk,
+				   csis->clk_frequency);
+		if (ret < 0)
+			dev_err(csis->dev, "set rate=%d failed: %d\n",
+				csis->clk_frequency, ret);
+	}
 
 	return ret;
 }
@@ -1413,9 +1416,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
 {
 	struct device_node *node = csis->dev->of_node;
 
-	if (of_property_read_u32(node, "clock-frequency",
-				 &csis->clk_frequency))
-		csis->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
+	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
 
 	return 0;
 }
-- 
2.51.0


