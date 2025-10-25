Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A34CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZY3DbZHVIw0INsWL2v5k8E9alR+E5YxtH/AfD11KmQ=; b=hK7fduw/CCQAvv7zbvB3rCafUv
	4WcZnm8CkN0cAOzvTkwzLERRLu8+OGANZcr9A8ind/andvrDmKe7elc+DiiaJv9cYd4w9ntg4d4YE
	J2CB4lJ7V0zxmjGXBW+/YULOJuQRK/PW8Jw+huwP8uSG9CXFZ6TxKlrIN1RomWbmG0xqJ+O3O4doO
	qELdIyRcBHeWIGvXy8iL0c3tHhg5EXkgz7Q8WQd6TkQIqVuoTewe5m1GJeSgH49k7qsctamp9j0TG
	5lc7Lkjk8OZl1kvbp29OibrZ3ZpTzLQt4knPvFsPiDZSuhWZinXTqGkehsYRMb1cm+GtcS8HsXpBK
	OeMaFjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh6P-0000000BV35-0QhQ;
	Sat, 25 Oct 2025 16:26:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh6N-0000000BV2u-3Brj;
	Sat, 25 Oct 2025 16:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 670EA611EC;
	Sat, 25 Oct 2025 16:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7427C4CEFB;
	Sat, 25 Oct 2025 16:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409605;
	bh=toGPQ+wiGt2AhGw6TSwK9UndEc09/HsXQqY6zUqc3Zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GWxaHVJDqws1fKcNHFQIh+XfxAzPws22I8ziZAeW1N3XSMxO8U3/qIxrTi88A0d+S
	 oLJaPhYt9PByd5L8KrKp536yfcY9wk/Fej9WGRAlJvxubs/PK1nfl7xaZGYw6TnSHN
	 K67EOZfbQk9/x36m4Wx5QHp/GfGb0BuGtjsE6ntL300ebtDpoUL2WEXzVjFOrOK+tF
	 +vnP1yYsUu6VwHmLKQ9A268IHiiG+/a/UPUettjcETcuXQ4KNT3jK6j31tyHV6td/P
	 wE0QaZAZYaziMCLdeF6oMTyZiiCsSC9ZEMREFhuxvsGM41pUL0v9Bht9kmNR9o/qkM
	 JO9RkjDzw+z8w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Peter Wang <peter.wang@mediatek.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.6] scsi: ufs: host: mediatek: Fix auto-hibern8 timer configuration
Date: Sat, 25 Oct 2025 12:00:19 -0400
Message-ID: <20251025160905.3857885-388-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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

From: Peter Wang <peter.wang@mediatek.com>

[ Upstream commit aa86602a483ba48f51044fbaefa1ebbf6da194a4 ]

Move the configuration of the Auto-Hibern8 (AHIT) timer from the
post-link stage to the 'fixup_dev_quirks' function. This change allows
setting the AHIT based on the vendor requirements:

   (a) Samsung: 3.5 ms
   (b) Micron: 2 ms
   (c) Others: 1 ms

Additionally, the clock gating timer is adjusted based on the AHIT
scale, with a maximum setting of 10 ms. This ensures that the clock
gating delay is appropriately configured to match the AHIT settings.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Link: https://lore.kernel.org/r/20250811131423.3444014-3-peter.wang@mediatek.com
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- Fixes a real bug affecting users. Today the driver unconditionally
  programs AH8 to 10 ms during link bring-up and derives the clock-
  gating delay from only the AHIT timer field, ignoring the scale. That
  yields incorrect behavior when a device needs a vendor-specific AH8
  value or when the AHIT scale is not 1 ms. The patch:
  - Removes the hardcoded AH8 value from `ufs_mtk_post_link()` in
    `drivers/ufs/host/ufs-mediatek.c` and defers programming until
    device info is known.
  - Adds `ufs_mtk_fix_ahit()` to set `hba->ahit` based on the UFS
    vendor: Samsung 3.5 ms, Micron 2 ms, others 1 ms.
  - Introduces `ufs_mtk_us_to_ahit()` so the AHIT encoding matches the
    HCI (same logic as the core sysfs helper).
  - Reworks `ufs_mtk_setup_clk_gating()` to derive the delay from the
    full AHIT value (timer + scale), avoiding the previous scale bug.

- Correct stage for AHIT programming. Moving the AHIT setup from link
  POST_CHANGE to the device-quirk fixup stage is correct because the
  vendor ID isn’t known at `POST_CHANGE`. The fix happens in
  `ufs_mtk_fixup_dev_quirks()` which runs after reading device
  descriptors (see core flow in `drivers/ufs/core/ufshcd.c:8380` calling
  `ufs_fixup_device_setup(hba)`), and before the core writes AHIT to
  hardware (`ufshcd_configure_auto_hibern8()` at
  `drivers/ufs/core/ufshcd.c:8967`). Hence the right AHIT gets
  programmed without extra transitions.

- Fixes a concrete correctness issue in clock-gating. Previously
  `ufs_mtk_setup_clk_gating()` computed the delay as `ah_ms =
  FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK, hba->ahit)` and then
  `ufshcd_clkgate_delay_set(..., ah_ms + 5)`. That ignores the AHIT
  scale and is only correct if the scale is 1 ms (which the driver
  forcibly set earlier). The patch:
  - Parses both AHIT scale and timer and converts to milliseconds via a
    `scale_us[]` table before setting the gating delay. This fixes
    gating delay when vendors require non-ms scales.
  - Sets a minimum gating delay of 10 ms (`delay_ms = max(ah_ms, 10U)`)
    to avoid overly aggressive gating when AHIT is small (1–3.5 ms).
    This is a conservative, low-risk change that reduces churn.

- Small, contained change with minimal regression risk.
  - Scope: one driver file (`drivers/ufs/host/ufs-mediatek.c`), no API
    or architectural changes.
  - Behavior: only affects Mediatek UFS host behavior and only when AH8
    is supported and enabled.
  - The vendor-based AHIT values are bounded and modest (1–3.5 ms), and
    the gating floor of 10 ms is conservative.
  - The patch respects `ufshcd_is_auto_hibern8_supported()` and won’t
    alter systems where AH8 is disabled (driver already handles
    disabling AH8; see `drivers/ufs/host/ufs-mediatek.c:258`).

- Alignment with core defaults and flow. The core sets a default AHIT
  (150 ms) only if none is set earlier
  (`drivers/ufs/core/ufshcd.c:10679`). The mediatek driver previously
  overwrote this to 10 ms unconditionally at `POST_CHANGE`. The new
  approach correctly overrides the default with vendor-specific AHIT at
  quirk-fixup time and before the core writes the register, making the
  effective setting both correct and deterministic.

- Backport notes and considerations.
  - The quirk-fixup hook must be present in the target stable branch
    (`ufshcd_vops_fixup_dev_quirks()` and call site exist in current
    stable series; see `drivers/ufs/core/ufshcd-priv.h:195` and
    `drivers/ufs/core/ufshcd.c:8380`).
  - The helper macros and fields used (e.g., `UFSHCI_AHIBERN8_*`,
    `UFS_VENDOR_*`, `hba->clk_gating.delay_ms`) are present in
    maintained stable branches.
  - Minor nits: the patch updates `hba->clk_gating.delay_ms` under
    `host->host_lock` instead of using `ufshcd_clkgate_delay_set()`,
    which in core protects the assignment with `clk_gating.lock`.
    Functionally it’s fine for a single-word store, but for consistency
    you may prefer `ufshcd_clkgate_delay_set(hba->dev, max(ah_ms, 10U))`
    when backporting to preserve locking semantics.
  - The commit message says “maximum setting of 10 ms,” but the code
    enforces a minimum of 10 ms via `max(ah_ms, 10U)`. The
    implementation is the safer choice and aligns with the intent to
    avoid too-aggressive gating.

Conclusion: This is a targeted bug fix that corrects AHIT configuration
timing, applies vendor requirements, and fixes the gating-delay
calculation to account for AHIT scale. It’s small, self-contained, and
low risk. It is suitable for backporting to stable kernel trees.

 drivers/ufs/host/ufs-mediatek.c | 86 ++++++++++++++++++++++++---------
 1 file changed, 64 insertions(+), 22 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index f902ce08c95a6..8dd124835151a 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1075,6 +1075,69 @@ static void ufs_mtk_vreg_fix_vccqx(struct ufs_hba *hba)
 	}
 }
 
+static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
+{
+	unsigned long flags;
+	u32 ah_ms = 10;
+	u32 ah_scale, ah_timer;
+	u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
+
+	if (ufshcd_is_clkgating_allowed(hba)) {
+		if (ufshcd_is_auto_hibern8_supported(hba) && hba->ahit) {
+			ah_scale = FIELD_GET(UFSHCI_AHIBERN8_SCALE_MASK,
+					  hba->ahit);
+			ah_timer = FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK,
+					  hba->ahit);
+			if (ah_scale <= 5)
+				ah_ms = ah_timer * scale_us[ah_scale] / 1000;
+		}
+
+		spin_lock_irqsave(hba->host->host_lock, flags);
+		hba->clk_gating.delay_ms = max(ah_ms, 10U);
+		spin_unlock_irqrestore(hba->host->host_lock, flags);
+	}
+}
+
+/* Convert microseconds to Auto-Hibernate Idle Timer register value */
+static u32 ufs_mtk_us_to_ahit(unsigned int timer)
+{
+	unsigned int scale;
+
+	for (scale = 0; timer > UFSHCI_AHIBERN8_TIMER_MASK; ++scale)
+		timer /= UFSHCI_AHIBERN8_SCALE_FACTOR;
+
+	return FIELD_PREP(UFSHCI_AHIBERN8_TIMER_MASK, timer) |
+	       FIELD_PREP(UFSHCI_AHIBERN8_SCALE_MASK, scale);
+}
+
+static void ufs_mtk_fix_ahit(struct ufs_hba *hba)
+{
+	unsigned int us;
+
+	if (ufshcd_is_auto_hibern8_supported(hba)) {
+		switch (hba->dev_info.wmanufacturerid) {
+		case UFS_VENDOR_SAMSUNG:
+			/* configure auto-hibern8 timer to 3.5 ms */
+			us = 3500;
+			break;
+
+		case UFS_VENDOR_MICRON:
+			/* configure auto-hibern8 timer to 2 ms */
+			us = 2000;
+			break;
+
+		default:
+			/* configure auto-hibern8 timer to 1 ms */
+			us = 1000;
+			break;
+		}
+
+		hba->ahit = ufs_mtk_us_to_ahit(us);
+	}
+
+	ufs_mtk_setup_clk_gating(hba);
+}
+
 static void ufs_mtk_init_mcq_irq(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -1369,32 +1432,10 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
 
 	return ret;
 }
-
-static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
-{
-	u32 ah_ms;
-
-	if (ufshcd_is_clkgating_allowed(hba)) {
-		if (ufshcd_is_auto_hibern8_supported(hba) && hba->ahit)
-			ah_ms = FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK,
-					  hba->ahit);
-		else
-			ah_ms = 10;
-		ufshcd_clkgate_delay_set(hba->dev, ah_ms + 5);
-	}
-}
-
 static void ufs_mtk_post_link(struct ufs_hba *hba)
 {
 	/* enable unipro clock gating feature */
 	ufs_mtk_cfg_unipro_cg(hba, true);
-
-	/* will be configured during probe hba */
-	if (ufshcd_is_auto_hibern8_supported(hba))
-		hba->ahit = FIELD_PREP(UFSHCI_AHIBERN8_TIMER_MASK, 10) |
-			FIELD_PREP(UFSHCI_AHIBERN8_SCALE_MASK, 3);
-
-	ufs_mtk_setup_clk_gating(hba);
 }
 
 static int ufs_mtk_link_startup_notify(struct ufs_hba *hba,
@@ -1726,6 +1767,7 @@ static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 
 	ufs_mtk_vreg_fix_vcc(hba);
 	ufs_mtk_vreg_fix_vccqx(hba);
+	ufs_mtk_fix_ahit(hba);
 }
 
 static void ufs_mtk_event_notify(struct ufs_hba *hba,
-- 
2.51.0


