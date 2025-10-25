Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29DCCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1stEsnuPCS68w+zweNa5i8/J795Jz5IjnFU2CcZghw=; b=d3TI+oaW+RQFTm5yxRMhhqLE0q
	qcAy7jKGdxv3deEagBjYo1sClHg7g1cAr8T68rS0wARmDirgW9LwXM2FPiGtlEqF87cHPZRhVBfav
	8IPOltj9mm8hgWU/vnozAUfv/r3RLtkmJ9sLVEKO257swXSiLYiL6CAw4y9Krfk7F3Wl0YYGIKo2J
	5AtCE8aaHvyeZbybnnI9tzu0ouZZJ0ElU/4V9Hmgh+lVx1ZUJq9hq/oz/zTtcdauLqvwPpyXnXPFI
	dGGmE9vUwIQ9ROFlO8aAINIvVUXs5xtPKsVx5kqb8RBzIE0LzIbGoMbz5eHRxdrZwcBflPaOxBkrS
	w6eDTGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh09-0000000BTU5-493g;
	Sat, 25 Oct 2025 16:20:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh08-0000000BTTi-0xsQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:20:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 935FD6111C;
	Sat, 25 Oct 2025 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA43CC116C6;
	Sat, 25 Oct 2025 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409219;
	bh=36PUBBTO/OOmdCTWhl24pff229qR+QMDPdU7ahtPRKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oy1hkwN4g9ji0ALsUnYI52sjZZJCwOvs+aaY7DvHLiwDF9YWRBdOaNpqFzcE3aM0M
	 Ywvl85Ir3TtfZzLlikFdfE2S5fpporhSLr7FjCW++1YKlY6SEzMCWNA33Sc3yMiCIw
	 InLHRU5VTLVOVTs/tgquT/yOm7CdtXJPr882napCB//5Q4nWvZsUWvnTtI3StaeIZy
	 DrqfY278dKN7Ueubty7bcCOmDrP08Nsb6QZeUBXokEsdaI4A7OZ18GgZtC8TG02sQy
	 4dOBlyMntrb8crGjeh4/6q+TxpNoEs+v0Q0pwERdXG9SazEwRW8sXWtSYLZPmTSyu9
	 CeGrGVw/hz+Mg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bharat Uppal <bharat.uppal@samsung.com>,
	Nimesh Sati <nimesh.sati@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	alim.akhtar@samsung.com,
	krzk@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.12] scsi: ufs: exynos: fsd: Gate ref_clk and put UFS device in reset on suspend
Date: Sat, 25 Oct 2025 11:57:58 -0400
Message-ID: <20251025160905.3857885-247-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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

From: Bharat Uppal <bharat.uppal@samsung.com>

[ Upstream commit 6d55af0f0740bf3d77943425fdafb77dc0fa6bb9 ]

On FSD platform, gating the reference clock (ref_clk) and putting the
UFS device in reset by asserting the reset signal during UFS suspend,
improves the power savings and ensures the PHY is fully turned off.

These operations are added as FSD specific suspend hook to avoid
unintended side effects on other SoCs supported by this driver.

Co-developed-by: Nimesh Sati <nimesh.sati@samsung.com>
Signed-off-by: Nimesh Sati <nimesh.sati@samsung.com>
Signed-off-by: Bharat Uppal <bharat.uppal@samsung.com>
Link: https://lore.kernel.org/r/20250821053923.69411-1-bharat.uppal@samsung.com
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- Adds FSD-only suspend hook: defines `fsd_ufs_suspend(struct exynos_ufs
  *ufs)` that gates the controller clocks and asserts the device reset
  line on suspend (`drivers/ufs/host/ufs-exynos.c:1899`).
  - Gates clocks via `exynos_ufs_gate_clks(ufs)` (`drivers/ufs/host/ufs-
    exynos.c:1901`), which calls `exynos_ufs_ctrl_clkstop(ufs, true)`
    (`drivers/ufs/host/ufs-exynos.c:202,204`).
  - `exynos_ufs_ctrl_clkstop()` sets the clock-stop enables and applies
    `CLK_STOP_MASK` to `HCI_CLKSTOP_CTRL` (`drivers/ufs/host/ufs-
    exynos.c:436-448`).
  - The `CLK_STOP_MASK` includes `REFCLK_STOP` and `REFCLKOUT_STOP`,
    ensuring the reference clock to the PHY is gated
    (`drivers/ufs/host/ufs-exynos.c:61-69`).
- Asserts reset: writes `0` to `HCI_GPIO_OUT` on suspend
  (`drivers/ufs/host/ufs-exynos.c:1902`), matching how a device reset is
  asserted (see `exynos_ufs_dev_hw_reset()` which pulses 0 then 1 on
  `HCI_GPIO_OUT`; `drivers/ufs/host/ufs-exynos.c:1558-1565`). This
  ensures the device and PHY are fully quiesced for maximal power
  savings.
- Scoped to FSD only: the new hook is wired into the FSD driver data via
  `.suspend = fsd_ufs_suspend` (`drivers/ufs/host/ufs-
  exynos.c:2158-2173`). Other SoCs use their own hooks (e.g., GS101:
  `.suspend = gs101_ufs_suspend`; `drivers/ufs/host/ufs-
  exynos.c:2175-2191`), avoiding unintended side effects on non-FSD
  systems.
- Integrates correctly with UFS core PM:
  - The vendor suspend callback is invoked by the UFS core at the
    POST_CHANGE phase of suspend (`ufshcd_vops_suspend(hba, pm_op,
    POST_CHANGE)`), which happens after link/device PM state transitions
    but before clocks are fully managed by the core
    (`drivers/ufs/core/ufshcd.c:9943-9951`).
  - On resume, the vendor resume callback runs before link transitions
    (`ufshcd_vops_resume()`; `drivers/ufs/core/ufshcd.c:10006-10013`),
    and the core will either exit HIBERN8 or, if the link is off,
    perform a full `ufshcd_reset_and_restore()`
    (`drivers/ufs/core/ufshcd.c:10018-10041`). During host (re)init, the
    Exynos driver pulses the device reset line high in
    `exynos_ufs_hce_enable_notify(PRE_CHANGE)` (`drivers/ufs/host/ufs-
    exynos.c:1612-1638`), matching the asserted reset in suspend.
- Mirrors proven pattern: GS101 already asserts the reset line during
  suspend (`gs101_ufs_suspend()` writes `0` to `HCI_GPIO_OUT`;
  `drivers/ufs/host/ufs-exynos.c:1704-1707`). This change extends a
  similar, already-accepted approach to FSD while additionally gating
  ref_clk.
- Fix nature and impact:
  - Addresses a real-world issue: excessive power usage and PHY not
    fully turning off on FSD during suspend. Gating `ref_clk` and
    asserting reset directly target these symptoms, aligning with the
    commit message intent.
  - Minimal, contained change (one new static function + one driver-data
    hook). No API/ABI or architectural changes; no feature additions.
  - Low regression risk for non-FSD platforms since behavior is
    explicitly guarded by the FSD driver-data wiring.
- Stable criteria alignment:
  - Fixes a platform-specific power management defect that affects users
    (improper power savings and PHY not fully off).
  - Small, self-contained change in a single driver file with explicit
    platform scoping.
  - No broad subsystem risk; integrates with existing suspend/resume
    flows and uses established helpers (`exynos_ufs_gate_clks`,
    `HCI_GPIO_OUT` semantics).

Given the above, this is a good stable backport candidate for trees that
include the Exynos UFS driver with FSD support.

 drivers/ufs/host/ufs-exynos.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index f0adcd9dd553d..513cbcfa10acd 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1896,6 +1896,13 @@ static int fsd_ufs_pre_pwr_change(struct exynos_ufs *ufs,
 	return 0;
 }
 
+static int fsd_ufs_suspend(struct exynos_ufs *ufs)
+{
+	exynos_ufs_gate_clks(ufs);
+	hci_writel(ufs, 0, HCI_GPIO_OUT);
+	return 0;
+}
+
 static inline u32 get_mclk_period_unipro_18(struct exynos_ufs *ufs)
 {
 	return (16 * 1000 * 1000000UL / ufs->mclk_rate);
@@ -2162,6 +2169,7 @@ static const struct exynos_ufs_drv_data fsd_ufs_drvs = {
 	.pre_link               = fsd_ufs_pre_link,
 	.post_link              = fsd_ufs_post_link,
 	.pre_pwr_change         = fsd_ufs_pre_pwr_change,
+	.suspend                = fsd_ufs_suspend,
 };
 
 static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
-- 
2.51.0


