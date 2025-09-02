Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD6CCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VsBq3/9AZEru8W4KCelb+z5GqymkH0CAytNS/b4U49w=; b=4PF/dH8LVbtWOh
	U2FZhWHnjvtaWxXPLNtMv8oTIsiH/vjQHdGbhCav6EVC0dNA3Xh58QVwUGakkiOa6JbL2LjjGBbHZ
	4yGQAPkvAHTL3ze3mLCFfTBPiukw1aJ7wXfeZU/B8Nwy4+XjKs2WvT2j9sajrLXZALXJOiVOCVFo6
	ZgKS2BROve+1Y7sjVpgkauh/CQb+7VfZ4k3pZ5D7wS4LSSN1nernAY3vAD2XHHPA85jx5TBMWcBdC
	EkcD7UIHe0cIRJklOuK2G9lE7PPjPbq/79H5gCAvHDP5A0sxA/4/3at7/CBIxelrl9Tto9IdNrHX8
	S2bTzrIVXrNSjgwi8+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbcS-00000002pkP-1Us4;
	Wed, 03 Sep 2025 00:45:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utXs6-00000001xj5-2Hk7;
	Tue, 02 Sep 2025 20:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756845892;
	bh=ZypK9sMAZJbpWzGN+Hx+ArMc+6LRYinYdlHAozWT/T0=;
	h=From:Subject:Date:To:Cc:From;
	b=WiX8xbMS5sifpaf0AnuCiedgBGH7eFIJvGN9COeD5kgHEkmLZHobzCH0hTTAq3VhC
	 Po3u7Qy5JcPDNq3jIvIVzc4WswryWZ+ashU6JFXuBpNDybQhnXp/v9KR70X/tF8Is4
	 i9+99KHCN+bwy9EBBjpV8OdbLenvPuKJtYG0aqf8SlPxw6kniVf0GDdDm2S7rE7DZ3
	 iFYmrvQs6r0yLN8Q4xF24kOL/t6nbAzTYn1oO/5Cppu5Z4y9Ji3zHC+fEFF6TvrDB4
	 R4HPjp3RHpvGCZ+WixnLKc541fvy9DoyqDanXLUbOfkivTLgfaEgZLRofjnUXL7vS9
	 qmnBTWHbSwuDA==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 430F817E0456;
	Tue,  2 Sep 2025 22:44:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v4 00/11] Add HDMI 2.1 FRL support to
 phy-rockchip-samsung-hdptx
Date: Tue, 02 Sep 2025 23:44:35 +0300
Message-Id: <20250902-phy-hdptx-frl-v4-0-7d69176373ce@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADNXt2gC/3XQy27DIBAF0F+xWJeKV4zxqv9RdcFjqJEc4wC1H
 EX592KnUqKmXV6kOczcC8qQAmTUNxeUYAk5xKkG8dIgO+jpE3BwNSNG2IFI0uF5OOPBzWXFPo3
 YW86ldEZ5BqjOzAl8WHfv/aPmIeQS03nnF7q9/ictFBNsPRDVAmPCizcbx1GbmPSrjUe0aQu7C
 x05/BZYFRylnXHCtEDMXwJ/EOjTDnzbQSqlpOuMYU/C9XZigtNXbarc7rwX1Tc7rAh7hLc+sOS
 k8x60sK3uaxMVMjoDruwxlL6ZYC34Z5rWj67fiMLVuJoBAAA=
X-Change-ID: 20250708-phy-hdptx-frl-fc3377db9f2e
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_134454_744789_9A077807 
X-CRM114-Status: GOOD (  10.38  )
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

Also note that since v4 the series depends on the fixes provided by [1].
Please see the changelog below for more details.

[1] https://lore.kernel.org/r/20250902-phy-hdptx-fixes-v1-0-e8d9ef9748d6@collabora.com

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
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

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 684 ++++++++++++++++++----
 include/linux/phy/phy-hdmi.h                      |  19 +-
 2 files changed, 603 insertions(+), 100 deletions(-)
---
base-commit: 58f59f0f890f0a80b28743261bd8800f5a1ed7fb
change-id: 20250708-phy-hdptx-frl-fc3377db9f2e
prerequisite-change-id: 20250902-phy-hdptx-fixes-7308ffea4c6a:v1
prerequisite-patch-id: 777b4d364feed432f604f87d58a6474cf8457431
prerequisite-patch-id: 7dafe85f5c9ac1291fd1b141a0e0fe68a4a837a9
prerequisite-patch-id: f4446206cbc7ceb41315085322fec45c72ec734c


