Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5982BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cxSmnVr07SqsQ7yAJXL9NAKHcm0X1LGWioz18UQybaE=; b=Og478eDZN22uQT
	z56IPH75yuC+3OQqstOc5lMwok36GyafZgXKG7oYVMWw1KcIsVIg4a+xI58hFjxnFt3Flh23dctuC
	vlum1devZAcRSmZ1P+ArUpIuFsuxFYx6CXT9Ykx+3HjdqqZ2PoTvOdYGQlVULjQ8ZAT3ATRGtVbBP
	txCXEI397QpIOOt4+Fwt+xli+gfqHZRiEPQOd2pmu9c6zsYVmkSEozQ1Xekvv1J1mjj8ZJ0JcR3Am
	9K70Tms6k2ze0YKK1Po5agVYmm7NaywmuklEqh5nMdeifTBaYyJVSVeQGAamPJWrtBGnJVBLhRw2O
	5Awsa0yx/cBtrk19fdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWEC-00000005uDH-1sbr;
	Tue, 18 Mar 2025 12:39:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWBm-00000005tdT-48D7;
	Tue, 18 Mar 2025 12:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742301416;
	bh=1EPLFHDewAN8/i4J9+X/KTzzwHH36Tm6ALls+862c64=;
	h=From:Subject:Date:To:Cc:From;
	b=JSY35S6CrgfDm8T6OIWNI8SqPLbGQslb2/CiagAlH3SfZtGgcLlQLsyfqfrMYpHYS
	 NyZSJsB1JXaDD1zKxfHOAEE163b8FTSkewAUrOyU7ybxGOYJa0aPFUq5E/GpsoIum9
	 HpGDEtCPspOhkkSzsQU2dFSaQ53sOaSZ+12kHBkfZzuWlGrF6rH3nWALdZrR7g25eC
	 rddwaZpD/tk9jpFIHlvPKZ6tfmb+zNGwpbGhpdNG7ERVPlNIMi7M417jcsOW6z6TpO
	 43AR56/50lXq9DigW3Cn6Tl/PXoMQJh+6j9XnTLG85+co8YYNjAFjujJADFI714qei
	 qdN9bYkduteWA==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 83E9317E0673;
	Tue, 18 Mar 2025 13:36:56 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v6 00/14] phy: rockchip: samsung-hdptx: Support high color
 depth management
Date: Tue, 18 Mar 2025 14:35:34 +0200
Message-Id: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJZo2WcC/23OwYoDIQwG4FcpnmvRqInd077HsgdHnY7Q1kHL0
 FLm3dcWypYiOf2B/0vurMaSYmVfmzsrcUk15XMLuN0wP7nzIfIUWmYgQEsQyOfpxqs78SnMlys
 fZs/VIIxHIBwDsdabSxzT9Wn+/LY8pXrJ5fY8scjH9qVRR1skF1woD1EHDLSnb5+PRzfk4nY+n
 9hDXOBNkdBToCmGIhJ4aqN7inopRgConqKaguiMtxGtgu4v+l9RQvcU3RSLhqwmL9XYVcy7Ynu
 KaYoywhJYGvdBfirruv4BxfK80s4BAAA=
X-Change-ID: 20241206-phy-sam-hdptx-bpc-3b05c6276fd7
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_053659_212177_3E52EFC8 
X-CRM114-Status: UNSURE (   9.45  )
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

This series relies on the new HDMI PHY configuration options [1] (patch
included here for convenience) to provide high color depth management
for rockchip-samsung-hdptx, and to introduce a proper solution to setup
the TMDS character rate on this PHY.

[1] https://lore.kernel.org/lkml/d1cff6c03ec3732d2244022029245ab2d954d997.1734340233.git.Sandor.yu@nxp.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v6:
- Collected R-b tags from Dmitry
- Updated commit description for "phy: rockchip: samsung-hdptx: Fix
  clock ratio setup"
- Added new patch "phy: rockchip: samsung-hdptx: Do no set
  rk_hdptx_phy->rate in case of errors"
- Replaced some "unsigned long" and "u32" types with "unsigned long
  long" in "phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit conversion
  overhead" to match the tmds_char_rate type (Dmitry)
- Added new patch "phy: rockchip: samsung-hdptx: Rename ambiguous
  rk_hdptx_phy->rate", originally part of "phy: rockchip: samsung-hdptx:
  Optimize internal rate handling" (Dmitry)
- Rebased series onto next-20250317
- Link to v5: https://lore.kernel.org/r/20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com

Changes in v5:
- Moved the patch eliminating the unnecessary and rather confusing
  Hz<->hHz unit conversion before all the others adding new content
- Moved the patch adding high color depth management to the last
  position, so that it follows the internal rate handling optimization
- Amended description for a few patches to improve clarity
- Performed some trivial refactoring in some cases while dealing with
  rebase conflicts
- Link to v4: https://lore.kernel.org/r/20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com

Changes in v4:
- Added patches to drop unnecessary phy_cfg & cfgs driver data
- Embedded struct phy_configure_opts_hdmi in driver data (Dmitry)
- Added new patch to provide config params validation support
- Provided a patch to restrict altering TMDS char rate via CCF (Dmitry)
- Made a bunch of small tweaks here and there
- Link to v3: https://lore.kernel.org/r/20250223-phy-sam-hdptx-bpc-v3-0-66a5c8e68327@collabora.com

Changes in v3:
- Rebased series onto next-20250221 and fixed several conflicts due to
  the recently introduced eDP support
- Link to v2: https://lore.kernel.org/r/20241212-phy-sam-hdptx-bpc-v2-0-57e672c7c7c4@collabora.com

Changes in v2:
- Added new patches providing a bug fix and several driver cleanups and
  improvements
- Link to v1: https://lore.kernel.org/r/20241207-phy-sam-hdptx-bpc-v1-0-03c2e4d6d797@collabora.com

---
Cristian Ciocaltea (13):
      phy: hdmi: Add color depth configuration
      phy: rockchip: samsung-hdptx: Fix clock ratio setup
      phy: rockchip: samsung-hdptx: Do no set rk_hdptx_phy->rate in case of errors
      phy: rockchip: samsung-hdptx: Drop unused struct lcpll_config
      phy: rockchip: samsung-hdptx: Drop unused phy_cfg driver data
      phy: rockchip: samsung-hdptx: Drop superfluous cfgs driver data
      phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit conversion overhead
      phy: rockchip: samsung-hdptx: Setup TMDS char rate via phy_configure_opts_hdmi
      phy: rockchip: samsung-hdptx: Provide config params validation support
      phy: rockchip: samsung-hdptx: Restrict altering TMDS char rate via CCF
      phy: rockchip: samsung-hdptx: Rename ambiguous rk_hdptx_phy->rate
      phy: rockchip: samsung-hdptx: Optimize internal rate handling
      phy: rockchip: samsung-hdptx: Add high color depth management

Sandor Yu (1):
      phy: Add HDMI configuration options

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 292 +++++++++++++---------
 include/linux/phy/phy-hdmi.h                      |  21 ++
 include/linux/phy/phy.h                           |   7 +-
 3 files changed, 202 insertions(+), 118 deletions(-)
---
base-commit: e94bd4ec45ac156616da285a0bf03056cd7430fc
change-id: 20241206-phy-sam-hdptx-bpc-3b05c6276fd7


