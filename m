Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D95E67495
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 10:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fT3eVGkS16lSkgoMVO9DA2cHxpYOMXVzqpE6ZvEFJd4=; b=Egj8cxmfIf6hFY
	8gs4MKMU/0prKR+DoksAwsxyVfQoTkS+M8wUffoM37e+lZAqlWHREY+Z/pAuVnqYHOXKF9yHuINXz
	zzk0E0X0JyVeHjqdDfSIwbpy3dAHK+vSBNVN5SrxxRPXljK1sK6fdnq23OCjIQgdqzCh1DAHqv4gu
	EsrL1Cr2wRztDBSIFoThWRGJiTo6shIciR3UYsWHrPKOoS66vwUBjo4bUDJFKTTt9sPIeUV2FrNWj
	N6ExMyY4ivOnRYwo/43hOyR4o/dfcvrxmQVhjxfT5npWr9boz4UJNJGwZ+oOTPCJ4OCa2zwpzCS/M
	t8D169/96JHhzZj1Ix+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGxv-0000000CKvD-3Cl0;
	Sun, 21 Dec 2025 10:47:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXGxt-0000000CKtv-1vNj;
	Sun, 21 Dec 2025 10:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766314021;
	bh=9LA2ZOjE1MM2HFgQPaMB79qBZSoN5v2lgsrIFF6ELp4=;
	h=From:Subject:Date:To:Cc:From;
	b=hXcV6gXvRR0wCcxQS3pP+uVfjX0bweL1ROLW777DSUuwnxGvF3QSvdu+5ePZyTjWs
	 mfO2QoWWw3oyOHdwYkyKLvkDmpOXewkap0Y8MOFSBFiqkXQCi51moPqPykvXHqMSbt
	 UE5umO30AYbwQ/p/nu1wqkptUyk8nmA0AXFIuGdgb9IUWkq9R90wDToeHJJfZM6ppu
	 /cvtExUNhEWertVrKIEQ5BxSSMLxmWx63zrvYFCOG0Gw7dJ7czCm7rPXyA3/u4y8g/
	 e7zLUp6fm5Cx8nwUDPsRzUki7sLzuMEHm+0kAboAyOkEPMlHgq0Lxmwsi6/glz1AQr
	 O2SSI0Xn9Fjpg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 961BC17E0463;
	Sun, 21 Dec 2025 11:47:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v5 00/11] Add HDMI 2.1 FRL support to
 phy-rockchip-samsung-hdptx
Date: Sun, 21 Dec 2025 12:46:47 +0200
Message-Id: <20251221-phy-hdptx-frl-v5-0-dac390a780be@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABfQR2kC/3XQwW7DIAyA4VeJOI8KDAkhp73HtEMAsyClTUayK
 FXVd5/THlJ13dFIfLb+C5swJ5xYU1xYxiVNaTjRUL4VzHft6Qt5CjQzEFAKI2o+dmfehXFeecw
 9j14pY4KzEZDRnzFjTOvN+/ikuUvTPOTzjV/k9vqftEguuI8obIUAOup3P/R964bcHvxwZJu2w
 C7UonwWgIQgZe2CdhUK90pQD4L8c4PabjDWWhNq5+CloHfBCngWNAkmVFaaShnl8Vm43iNl/P6
 h1vO91J66KTZYgtAP8NhT6LRyYWrjLaCgTA21IMq1E3KCj2luiqU6SMuzl7Tm+gsKU6gP2gEAA
 A==
X-Change-ID: 20250708-phy-hdptx-frl-fc3377db9f2e
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_024705_657213_2066D0DB 
X-CRM114-Status: UNSURE (   9.11  )
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

The Samsung HDMI/eDP Transmitter Combo PHY is capable of handling four
HDMI 2.1 Fixed Rate Link (FRL) lanes, while each lane can operate at
3Gbps, 6Gbps, 8Gbps, 10Gbps or 12Gbps.

This patchset extends the HDMI PHY configuration API to manage the FRL
mode and provides all the required HDMI driver changes to enable FRL in
addition to the already supported TMDS mode.

Also note that since v5 the series depends on the fixes provided by [2].

[1] https://lore.kernel.org/r/20250902-phy-hdptx-fixes-v1-0-e8d9ef9748d6@collabora.com
[2] https://lore.kernel.org/r/20251221-phy-hdptx-pll-fix-v2-0-ae4abf7f75a1@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v5:
- Dropped all unused members from struct lcpll_config and improved the
  readability of the rk_hdptx_frl_lcpll_cfg table
- Rebased series onto v6.19-rc1 and replaced dependency [1] with [2]
  (the former got merged)
- Link to v4: https://lore.kernel.org/r/20250902-phy-hdptx-frl-v4-0-7d69176373ce@collabora.com

Changes in v4:
- Moved the following fixup patches into a separate series [1]:
  * Fix reported clock rate in high bpc mode
  * Reduce ROPLL loop bandwidth
  * Prevent Inter-Pair Skew from exceeding the limits
- Renamed enum phy_mode_hdmi to phy_hdmi_mode and
  PHY_MODE_HDMI_{TMDS|FRL} to PHY_HDMI_MODE_{TMDS|FRL} (Dmitry)
- Rebased remaining patches onto next-20250901
- Link to v3: https://lore.kernel.org/r/20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com

Changes in v3:
- Reworked patch "phy: hdmi: Add HDMI 2.1 FRL configuration options"
  according to Dmitry's feedback
  * Updated commit message providing a brief description of FRL mode
  * Kept PHY_MODE_HDMI in enum phy_mode and introduced enum
    phy_mode_hdmi defining the TMDS and FRL submodes
- Updated "phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support"
  * Implemented .set_mode() callback in rk_hdptx_phy_ops
  * Introduced .mode member in struct rk_hdptx_hdmi_cfg and used it
    instead of phy_get_mode() to verify PHY_MODE_HDMI_FRL
- Rebased series onto next-20250818
- Link to v2: https://lore.kernel.org/r/20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com

Changes in v2:
- Added a couple of new patches:
  * Fix reported clock rate in high bpc mode
  * Drop hw_rate driver data
- Applied several tweaks to the following patches:
  * Compute clk rate from PLL config
  * Switch to driver specific HDMI config
  * Add HDMI 2.1 FRL support
- Rebased series onto next-20250804
- Link to v1: https://lore.kernel.org/r/20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com

---
Cristian Ciocaltea (11):
      phy: hdmi: Add HDMI 2.1 FRL configuration options
      phy: rockchip: samsung-hdptx: Use usleep_range() instead of udelay()
      phy: rockchip: samsung-hdptx: Fix coding style alignment
      phy: rockchip: samsung-hdptx: Consistently use [rk_]hdptx_[tmds_] prefixes
      phy: rockchip: samsung-hdptx: Enable lane output in common helper
      phy: rockchip: samsung-hdptx: Cleanup *_cmn_init_seq lists
      phy: rockchip: samsung-hdptx: Compute clk rate from PLL config
      phy: rockchip: samsung-hdptx: Drop hw_rate driver data
      phy: rockchip: samsung-hdptx: Switch to driver specific HDMI config
      phy: rockchip: samsung-hdptx: Extend rk_hdptx_phy_verify_hdmi_config() helper
      phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 666 ++++++++++++++++++----
 include/linux/phy/phy-hdmi.h                      |  19 +-
 2 files changed, 585 insertions(+), 100 deletions(-)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20250708-phy-hdptx-frl-fc3377db9f2e
prerequisite-change-id: 20251204-phy-hdptx-pll-fix-0787c92e0cfe:v2
prerequisite-patch-id: 957a51ef580cfd4ae6d9e431a1d7a29c9f87ecc7
prerequisite-patch-id: 0e5e89b08b36a5dc0b204ec4eb654f434b842ec6


