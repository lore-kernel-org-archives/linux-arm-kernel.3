Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC39CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 20:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OlRmerDczBtVKdmYX7cAgt7WmfjW8lN4p19pTeZUlNA=; b=mGK5f+FUtyW4Cj
	HrZNRXWsazWW0SwK6eK0cqK580dsdqfnOWluFNkc6lstOJ6gjd1zf7742cVAFk9VDNpzxgILN61ik
	Kmh58Y91FcP17d5+K4Of29Vs8vr5/zOhZszEsLybFFJ6abOCoDx4FBFdZkw9FhOpeVn4JPVCjialH
	wSp1I1cf343S/diXwb+XhnkRgYLY6bj68+GK6IK2Qg4VS6dy9Mta7IqYwsXSqLKSfefzs8R28Fgo5
	wiPTlEJNc/AXInCKI1wTgV4ETVV0Ba7U1erfPrBdDB12MJTqVtz2pPIDSIiZHuP7gnPhnqJiLywIU
	v8xD8YockOPWldlyknVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6AR-00000008afg-1VFi;
	Mon, 18 Aug 2025 20:09:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo54j-00000008QyR-41Oe;
	Mon, 18 Aug 2025 18:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755543560;
	bh=dA6CmxAjeubePqXgKHgNtxM4uimRCuHxo6FmeeBJggo=;
	h=From:Subject:Date:To:Cc:From;
	b=Hh4drvqMVlQ3osL+Iq2QEN2dRP6J4Wlpa1R2jAhbvzaj4PzUQPi6ezdckGMiIhaBr
	 NLkv3VsKiotjsCXsW/7SmkB4UGZXl01uHaNS0jf1ps+A/hNEDmsiZsEFtsyPTKY2Hz
	 I7fRm88oVgrEGJbEayMMQKWkV4gCcbDgjnHgE8hYxmZH39NpSR62eyt3CxsRfkFC1x
	 gkrEFWSj0OdmgRar73ydgqQgdtmo7ur2FTkwSFNeumRVmyiZUaXpWjGVy7ZNMXyKt6
	 xMR6XLp7tdjUWpLBWAN3msQMteFHZn1621jwf9mf/wRXA6UvQWqGEGX418/UP75RKM
	 5zQJ5rC6+Exig==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C183C17E0154;
	Mon, 18 Aug 2025 20:59:19 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 00/14] Add HDMI 2.1 FRL support to
 phy-rockchip-samsung-hdptx
Date: Mon, 18 Aug 2025 21:59:00 +0300
Message-Id: <20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPR3o2gC/3XMSwrDIBSF4a0Ex7XozTuj7qN0EPVahTQGDZIQs
 veaTAqBDv8D59tIQG8xkC7biMdog3VjivyWEWn68Y3UqtQEGJSsZg2dzEqNmuaFaj9QLfO8rpV
 oNSBJn8mjtsvpPV+pjQ2z8+vJR36s/6TIKaNSI2srBCh08ZBuGHrhfH+X7kMOLcJPaFh5FSAJi
 vNGqEJUyMRV2Pf9C33tKHDwAAAA
X-Change-ID: 20250708-phy-hdptx-frl-fc3377db9f2e
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115922_153184_670415BA 
X-CRM114-Status: UNSURE (   9.13  )
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

The series also contains a few driver fixes/improvements that are not
directly related, but are not deemed critical enough to warrant separate
submission.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
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
Cristian Ciocaltea (14):
      phy: hdmi: Add HDMI 2.1 FRL configuration options
      phy: rockchip: samsung-hdptx: Fix reported clock rate in high bpc mode
      phy: rockchip: samsung-hdptx: Reduce ROPLL loop bandwidth
      phy: rockchip: samsung-hdptx: Prevent Inter-Pair Skew from exceeding the limits
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

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 697 ++++++++++++++++++----
 include/linux/phy/phy-hdmi.h                      |  19 +-
 2 files changed, 611 insertions(+), 105 deletions(-)
---
base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
change-id: 20250708-phy-hdptx-frl-fc3377db9f2e


