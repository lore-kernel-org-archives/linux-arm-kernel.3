Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032B5CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHSoieWZ3dDzHF0VYZaXPYwfnZAj+lnUqtC3fOLCpM8=; b=F77CPJ1kyqViOrKuKt1MnsS8RL
	sHRyev9aiU2FbPnc6ZzwXo4QHGYSJ3w6NThGECwXd4aAztiYTbUUnNnr3jgwywDcC4T/VPYkAUpXC
	XE7GHzsO7WSM2EEp86boKs6YR0KiPkYPWN62c7l32ryFS5p1EEjGRxiZajefoYNVIJcL8SC+KGsMT
	QWSPtuLAt8YN1sa8iMwrw3p+ERnXcF8M+t81c+OuF9zlktf7ZalP57eml19sxfvAlVYLNveHewGcj
	qKgDDEJXO5asIOsB/HDtSpWPaph8+skyzOlgg+qULXhBVFf5prRCN4kleSbI1e+0G68oiThlgCRJO
	zuG67XcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh81-0000000BVsr-3HWR;
	Sat, 25 Oct 2025 16:28:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh7y-0000000BVsB-38Bq;
	Sat, 25 Oct 2025 16:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4454844DCE;
	Sat, 25 Oct 2025 16:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F57C4CEFF;
	Sat, 25 Oct 2025 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409706;
	bh=puSyWICh4xZTWpltYje/LxrpNqBU11Q4+JjET8EzRII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ts2A83G3VEwlR4wChInP31M2rhV+QAnVEk0rSB1xhBiW+1WkhI1iYUSPX60BgbsDo
	 N2Rdowtl9Nd4UkQ9Apv3INXcyqIF/AqV0zcUppzHQ/EWnbDnmHhccvP4WYGvxKXvan
	 rf0tTOR80fFiNsd1jQTxUxx9ZnhK+2tgMxtNoYzDiw4bvYAFFEJOvPCJ4UF/hFIizD
	 gYyxHOPjnR8BaPI1hjoUc08i/Ijl/qPaJx2Kxi4zT68wMdq9mRBL+R64sfQpUEdPka
	 pxVT11DBpisjlKAIr/tWAQnF9+zk8aED+tYy9yC3sz8ojSemdEL36sJXwJZ8MSkOdC
	 Zc40rmjkuu+9A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-5.15] phy: rockchip: phy-rockchip-inno-csidphy: allow writes to grf register 0
Date: Sat, 25 Oct 2025 12:01:00 -0400
Message-ID: <20251025160905.3857885-429-sashal@kernel.org>
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
X-CRM114-CacheID: sfid-20251025_092826_831058_AC3FBCB7 
X-CRM114-Status: GOOD (  18.57  )
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

From: Michael Riesch <michael.riesch@collabora.com>

[ Upstream commit 8c7c19466c854fa86b82d2148eaa9bf0e6531423 ]

The driver for the Rockchip MIPI CSI-2 DPHY uses GRF register offset
value 0 to sort out undefined registers. However, the RK3588 CSIDPHY GRF
this offset is perfectly fine (in fact, register 0 is the only one in
this register file).
Introduce a boolean variable to indicate valid registers and allow writes
to register 0.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/20250616-rk3588-csi-dphy-v4-4-a4f340a7f0cf@collabora.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes: The driver previously used `offset == 0` as a sentinel
  for “no GRF register”, which silently blocks legitimate writes when a
  hardware register actually lives at offset 0. On RK3588 the CSIDPHY
  GRF uses register 0 as its only register, so the driver would skip
  required GRF writes and fail to properly bring up lanes.

- Exact changes:
  - Adds an explicit validity flag to describe whether an entry is a
    real GRF register:
    - `struct dphy_reg { ... u8 valid; }` in `drivers/phy/rockchip/phy-
      rockchip-inno-csidphy.c:90-95`.
  - Marks all defined register entries as valid via the helper macro:
    - `#define PHY_REG(...){ ... .valid = 1, }` in
      `drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:97-99`.
  - Switches the write guard from “offset non-zero” to “valid is true”:
    - `if (reg->valid) regmap_write(...)` in `drivers/phy/rockchip/phy-
      rockchip-inno-csidphy.c:156-165`.
  - RK3588 explicitly defines its GRF at offset 0:
    - `#define RK3588_CSIDPHY_GRF_CON0 0x0000` in
      `drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:33`.
    - The RK3588 register table uses that offset (and now writes are
      allowed because `.valid = 1`):
      - `rk3588_grf_dphy_regs[]` in `drivers/phy/rockchip/phy-rockchip-
        inno-csidphy.c:122-126`.

- Why it matters: The power-on sequence depends on these GRF writes to
  configure “forcerxmode”, clock-lane enable, and data-lane enable:
  - Calls at `drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:287-309`
    go through `write_grf_reg(...)`. With the old “offset != 0” check,
    RK3588 would never program these bits, breaking CSIDPHY
    initialization.

- Scope and risk:
  - Small, contained change to one driver and its internal
    helper/struct. No API/ABI change outside the driver.
  - Backward-compatible: for entries not defined in a table, the new
    `valid` defaults to 0 (C zero-initialization), so writes remain
    skipped just like before; existing real entries are created via
    `PHY_REG(...)` which now sets `.valid = 1`.
  - Other SoCs (rk1808/rk3326/rk3368/rk3568) have non-zero offsets;
    behavior is unchanged because `.valid = 1` keeps writes enabled as
    before.
  - The only behavior change is to correctly allow writes to offset 0
    when that register is valid, which is the intended fix for RK3588.

- Stable criteria:
  - Fixes a real, user-visible bug (CSI-2 DPHY on RK3588 fails to
    configure), not a feature.
  - Minimal and low risk; no architectural changes; isolated to a PHY
    driver.
  - Clear side effects are positive (enables intended GRF writes) with
    no broader impact.

Recommendation: Backport to stable trees that include this driver and
RK3588 CSIDPHY support (harmless elsewhere, but especially necessary
where RK3588 is present).

 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 2ab99e1d47ebe..75533d0710250 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -87,10 +87,11 @@ struct dphy_reg {
 	u32 offset;
 	u32 mask;
 	u32 shift;
+	u8 valid;
 };
 
 #define PHY_REG(_offset, _width, _shift) \
-	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, }
+	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, .valid = 1, }
 
 static const struct dphy_reg rk1808_grf_dphy_regs[] = {
 	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK1808_GRF_PD_VI_CON_OFFSET, 4, 0),
@@ -145,7 +146,7 @@ static inline void write_grf_reg(struct rockchip_inno_csidphy *priv,
 	const struct dphy_drv_data *drv_data = priv->drv_data;
 	const struct dphy_reg *reg = &drv_data->grf_regs[index];
 
-	if (reg->offset)
+	if (reg->valid)
 		regmap_write(priv->grf, reg->offset,
 			     HIWORD_UPDATE(value, reg->mask, reg->shift));
 }
-- 
2.51.0


