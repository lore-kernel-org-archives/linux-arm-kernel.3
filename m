Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A4BC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XRtS3sKa/OV7EpmyTBNHlfUAZ3aaGLZDvu2pXvYbAPY=; b=B3VJOLRJsU2L5G
	grN9G02j+f7P4col3DVMEsAIu/OJVy1s/w/g3CE3ebkRPVltz06tMSVPlBjK3VZ2NKAyVppcb1RWn
	IJ52KsUplw2UIADft6jkM46bxLOZkcpQZkLayoMGyKNZONJX37Gno0kkl82sXqXEfAKrMGh86JZu8
	m1+Mu4SyxPnoDMNlcShl2Sp9b2Ib2qXSyutaT6UTplM7o/1RwgHYgF3N+GOR2T877J3c9QlxLwb4K
	ROjyanzavPtRLoXJ5p1qlt17VGCmYyYTC066NqV1xBokYEDfa5dZfdv79Nwl8aC80pWxTse/JPLEh
	N2l3DXCQHK6I+MgOwsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofM-0000000EMyz-20GZ;
	Tue, 11 Aug 2026 15:45:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofG-0000000EMu4-0wDr;
	Tue, 11 Aug 2026 15:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786463113;
	bh=zAiLET68OY8HdgI59XTkQe7bAKXLLTHOl72QpYx4CWc=;
	h=From:Subject:Date:To:Cc:From;
	b=Nnh6SiXscuZjV29WkE6SddA6YiiW065wS36+v3Xe4LPAOV+cuzcURJ2GSu+RARa1D
	 OeSX2EXoxaX7NMkl5W1aACNVIeEbKSMyVylx/iYKFHpeP0uGo1R7U/qaqg01xC5QGM
	 hiFXi72EgI4PSQldl9O3Y7+HjWRGJDt9HXJJJpYQXAfHz6DIJE0cDP/NPOa00bkPgy
	 z4kJ2PCRxYzET7K89wbJejXSwKe+EmAGRYDXDtoP92HeNvYdoxVoyekCGSFdOfYCQg
	 heD3rpoNKdwo8Nhr8JUTr9NPQXSPxiieZhel8YFeeDaQOm/020IFL3pZ8J7Lhw7Mhz
	 iv9Y110n74DAQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D3DC17E0048;
	Tue, 11 Aug 2026 17:45:13 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v6 00/10] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
Date: Tue, 11 Aug 2026 18:44:41 +0300
Message-Id: <20260811-hdptx-clk-fixes-v6-0-75bca0ee5753@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQwW7DIAwG4FepOI8JDJikp73HtAMBs6BlpYIq6
 lTl3Ud6yaRkF0u/LX+W/GCVSqLKzqcHKzSnmvKlBXw5MT+6yyfxFFpmIAAFgOVjuN7u3E9fPKY
 7Va6tBkQFsUNgbeta6DloS+8fLY+p3nL5eR6Y5dr935olFzz2fRfBIgQR33yeJjfk4l59/marN
 8NmGCn3BjQDUZOWyvbeDUeG2gw8MtRq2EEOwgtBEo8M/deAvaGb4cmQDNqgD+7IMJthQe0N04y
 ObNdOtGJ2/1iW5Rexn6pNwgEAAA==
X-Change-ID: 20260227-hdptx-clk-fixes-47426632f862
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>, Diederik de Haas <diederik@cknow-tech.com>, 
 Andy Yan <andyshrk@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Sashiko <sashiko-bot@kernel.org>, Andy Yan <andy.yan@rock-chips.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_084519_313799_F18B6B93 
X-CRM114-Status: GOOD (  12.14  )
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

This series provides a set of bug fixes and cleanups for the Rockchip
Samsung HDPTX PHY driver.

The first part of the series addresses clock rate calculation and
synchronization issues.  Specifically, it fixes edge cases where the PHY
PLL is pre-programmed by an external component (like a bootloader) or
when changing the color depth (bpc) while keeping the modeline constant.
Because the Common Clock Framework .set_rate() callback might not be
invoked if the pixel clock remains unchanged, this previously led to
out-of-sync states between CCF and the actual HDMI PHY configuration.

The second part focuses on code cleanups and modernizing the register
access.  Now that dw_hdmi_qp driver has fully switched to using
phy_configure(), we can drop the deprecated TMDS rate setup workarounds
and the restrict_rate_change flag logic.  Finally, it refactors the
driver to consistently use standard bitfield macros.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v6:
- Collected R-b tags from Mani
- Documented the expected recovery from invalid PLL hardware state in
  patches 2 & 3 (Vinod)
- Updated patch 5 description to avoid mentioning 'patches' (Mani)
- Rebased series onto latest phy/next
- Link to v5: https://patch.msgid.link/20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com

Changes in v5:
- Collected R-b/T-b tags from Dmitry, Andy & Diederik
- Added new patch to guard against clk rate integer underflow (Sashiko)
- Updated debug message in "Prevent divide-by-zero when computing clk
  rate" to be consistent with the one introduced in the "underflow"
  patch above
- Added separate patch to consolidate consumer_put in
  rk_hdptx_phy_power_on() error path (Dmitry)
- Rebased series onto latest phy/next
- Link to v4: https://patch.msgid.link/20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com

Changes in v4:
- Added new patches to address new findings from Sashiko:
  * Prevent divide-by-zero when computing clk rate
  * Fix rate recalculation for 3.2GHz FRL
- Updated patch "Consistently use bitfield macros" to handle a few more
  bit operations
- Link to v3: https://patch.msgid.link/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com

Changes in v3:
- Replaced div_u64() with DIV_ROUND_CLOSEST_ULL() in Patch 1 (Sashiko)
- Fixed theoretical usage_count unbalanced issue in Patch 2 (Sashiko)
- Rebased series onto latest phy/next
- Link to v2: https://patch.msgid.link/20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com

Changes in v2:
- Collected Tested-by tags from Thomas and Simon
- Fixed a typo in commit description of patch 1
- Added a comment in patch 2 explaining why PLL config errors are
  ignored for rk_hdptx_phy_consumer_get()
- Added a missed FIELD_GET conversion for lcpll_hw.pms_sdiv in patch 6
- Rebased onto latest phy/fixes
- Link to v1: https://lore.kernel.org/r/20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com

---
Cristian Ciocaltea (10):
      phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
      phy: rockchip: samsung-hdptx: Prevent divide-by-zero when computing clk rate
      phy: rockchip: samsung-hdptx: Guard against clk rate integer underflow
      phy: rockchip: samsung-hdptx: Fix rate recalculation for 3.2GHz FRL
      phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
      phy: rockchip: samsung-hdptx: Drop TMDS rate setup workaround
      phy: rockchip: samsung-hdptx: Consolidate consumer_put on error path
      phy: rockchip: samsung-hdptx: Drop restrict_rate_change handling
      phy: rockchip: samsung-hdptx: Simplify GRF access with FIELD_PREP_WM16()
      phy: rockchip: samsung-hdptx: Consistently use bitfield macros

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 285 +++++++++++-----------
 1 file changed, 147 insertions(+), 138 deletions(-)
---
base-commit: 9e953732c3ed02b19698bf4af05396a3573681e1
change-id: 20260227-hdptx-clk-fixes-47426632f862


