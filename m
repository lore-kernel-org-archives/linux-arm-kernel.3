Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CF3C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w3iW6XCnagkl8ydBjJlX6/xdnSI9S+R4wnkQUupTYRQ=; b=Oc7nmuEj7AFH3F
	Q85nMf0xqyi2gOpGM6ulxcqy3LJfCQ5HXVuZGjmYIojf/Anw5bTXhsF51H0XRRC8/HkM20wjPw3HY
	Jfx85VkQEbr84h+bSgXmJEg+uzTUFYSDWWpHAG8HebNu8jeZnaZA45NjWKlB5BzQhrP82QykCHV4V
	A4FYskzpnONRJU28EZAp9bZ32mh/oqo3kyldK2Qxo//ACUzmw8EvsbSn1erCe1lVrtVji3Js80pIj
	Pwxw+1KhttRyL2GAsSWEabvMrm5olEg4XSIhzk7ikQDCZLI5V7vzQ94dN+5VWWiv8c8ednzfqrXL4
	TM3RymwKzhxso+u4wgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzIo-0000000Eykl-0bnR;
	Thu, 23 Jul 2026 19:41:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzIk-0000000Eyif-2j1q;
	Thu, 23 Jul 2026 19:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784835706;
	bh=CVgepNtrE3nYdIXJRW7JJoS4g/eOsGCVCVNybVfjzzo=;
	h=From:Subject:Date:To:Cc:From;
	b=Z3u3IYgKdCRUtpTOiqSGIUiRpiJ0qW6/eagZXylC8FIlENwUTXoHZ9rpiuDEclmKQ
	 JujJzzjjIS7OblA/YFnBOxESbS4FjwprUoJl0qHbCJlBe1Zh3hnxf0aJLiCZiKEmDc
	 1/FeRfvCyhmo+t+pG1tDNY/POsYFvj5h6hwbJZvSO9xmYoZ7tX0cMa4UQ8k037YLDR
	 qvYR78lt89RBqwTIrDC+7IM6S/O9L0vKX+Y2L5fxc+UYp3wfx2R8wCL88lLoon5PCW
	 mDM2Yp1VYQI72FpCQfMctIrYiJnr4T1k42myjM4IVpeSDyFPOrfHxgZ9PO4EgPWDH5
	 m/bHoowMFaxAQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5AB0717E09A3;
	Thu, 23 Jul 2026 21:41:46 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v5 00/10] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
Date: Thu, 23 Jul 2026 22:41:43 +0300
Message-Id: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ7CIBAF0KsY1mJgSgfrynsYFxQGS6xiwDQa0
 7tL3Wi0Lv+f/DcPlikFymyzeLBEQ8ghnkuolwtmO3M+EA+uZAYCUABo3rnL9cZtf+Q+3ChzpRU
 gVuDXCKysLolehzLa7UvuQr7GdH89GOTU/rcGyQX3TbP2oBGc8Fsb+960MZmVjSc2eQO8jVrKX
 wOKgahIyUo31rRzRvU2cM6oJkO3shVWCJI4Z6hPA34NVQxLNUmnarTOfBvjOD4Bw9sagn4BAAA
 =
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
 Sashiko <sashiko-bot@kernel.org>, Andy Yan <andy.yan@rock-chips.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_124150_849045_5132DAA1 
X-CRM114-Status: GOOD (  11.51  )
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

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 276 +++++++++++-----------
 1 file changed, 138 insertions(+), 138 deletions(-)
---
base-commit: ee6aa0f01d4e8eddf1c7fda49d65c7ef12444e78
change-id: 20260227-hdptx-clk-fixes-47426632f862


