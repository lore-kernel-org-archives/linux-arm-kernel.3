Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54032CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KDZx/vCS48sLXBAmTvWsc1FTAonlONISspYCxOlOWko=; b=0YvnOObK58LNMy
	fmu+qB6TUfGIHzqTFoKeHJoQyirKWLAPI/m87VhVD7/XF0+ZMH63DR1W3FUCMnOv9REFJPYiYIyFG
	Em4gGnepdpgHq3Gk+hL8BwzeUtiMXV8pF4Xb2wgg+9ePeki7F4RoqszKg6Z/gS/jUST96PVrUrQ4Y
	poT1pQzW1lVbWwFgxr1ZjHD4mOCHl8GGTpg9oK8y+94Oc5OnmOZo07vCjoXv5YRVcethwLvYynynF
	JHuEJBaPG6I5nlgFpPZNMW5oi5d7f4wO3fIHhx3JJsysRZD2RccIC/ToV8/mqJLQk84R3G8Zasinx
	VFs0ske5sd/QxaJ93B3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXp5p-0000000ABLI-1Rq6;
	Thu, 11 Jun 2026 23:45:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXp5m-0000000ABJn-2R7X;
	Thu, 11 Jun 2026 23:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781221543;
	bh=wy+5kI0dveBACR23utkY1IqEQo7BkKlp9zuSxmhVWxY=;
	h=From:Subject:Date:To:Cc:From;
	b=CF46rZbX76KJmTbFU3cuopRVOvxjTnkPXftdfiTaarMmyx3NT/UNn/CQ6+quU1+Gc
	 omcyp3tXmOFDhcdWTJyZSltnGH8dmmIyDxj7bbLdj9zIXFwS4dr34WfwIkGiFo4jG1
	 ro3wY6HhHGSR0n60yok3CzPGjiKvEKel/9Xvw7f9QXjCsl0Na5Jym6QVFDgnf3Im4l
	 N6vo60omXHcFGUF4yYaiAhLWFFahbZdBbUeKj8XpW0cmmhv7Tk+TORQ7KoYmOTf9ME
	 n8D/zxtjZcgcJ3q0tDXOw/R+/LvyzMhAJfQaKJDfbkK5Pnax1l1lczWoVXJ5bQLWh2
	 udpdxsGhCoabg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C53617E0615;
	Fri, 12 Jun 2026 01:45:43 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v4 0/8] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
Date: Fri, 12 Jun 2026 02:45:19 +0300
Message-Id: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ6CMBAF0KuYrq1phzoFV97DuIDSSiNS0pIGQ
 7i7hQ2J4vL/yX8zkaC91YFcDhPxOtpgXZeCOB6IasruoamtUybAABmApE3dDyNV7ZMaO+pAhRS
 AmIHJEUha9V6vhzS63VNubBicf68PIl/a/1bklFFTFLkBiVAzc1WubcvK+fKk3IssXoTNOHP+a
 0AyEIUWPJOFKqs9I9sM3DOyxZAVr5hiTHP8NuZ5/gB0k7zcOgEAAA==
X-Change-ID: 20260227-hdptx-clk-fixes-47426632f862
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_164546_791136_5F721E1C 
X-CRM114-Status: GOOD (  11.04  )
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
Cristian Ciocaltea (8):
      phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
      phy: rockchip: samsung-hdptx: Prevent divide-by-zero when computing clk rate
      phy: rockchip: samsung-hdptx: Fix rate recalculation for 3.2GHz FRL
      phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
      phy: rockchip: samsung-hdptx: Drop TMDS rate setup workaround
      phy: rockchip: samsung-hdptx: Drop restrict_rate_change handling
      phy: rockchip: samsung-hdptx: Simplify GRF access with FIELD_PREP_WM16()
      phy: rockchip: samsung-hdptx: Consistently use bitfield macros

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 266 +++++++++++-----------
 1 file changed, 130 insertions(+), 136 deletions(-)
---
base-commit: 293e19f416fa3f233a2fb013258f7abcb39ad6ed
change-id: 20260227-hdptx-clk-fixes-47426632f862


