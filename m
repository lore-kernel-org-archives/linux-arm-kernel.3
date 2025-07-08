Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6D6C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2smh+MGEAduMykSYc/T8j0MbHgd1UjFFL6D4AORaZHU=; b=r2vLzXpmsmM3ld
	jKc4UZuA4+6YY6Q/jopoxsYsQ0BSwlIBIETa9x28MBeSqVjYNLZ/eXJ/Yx3FxTRx0gV6iu8NNxoHK
	Vzc6sF8VLRlxWfIjiSigYNMZICFj3NI+mHLeWIObromMSFQAu3Qa6iUDXJDE4g1HrgZ0S7f+6lxSr
	/7fkwJZ4m/BMuP6e30aZSr5YSMmwpMei7+fYJYmg/eJTpWEV7splLff8xXzT1CVOcbFzT+lTcxXEM
	B4pn11c5qgEaOWyTpu0sGNQxZJdCebRfet5sU+tmmm6QpqZ+PAkw2Tj+vIVqEeTzBxEue8ez1y8Gh
	0mxoce1cyUohstR0d8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEeO-00000006TJs-0n68;
	Tue, 08 Jul 2025 20:10:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZE7b-00000006M5P-246s;
	Tue, 08 Jul 2025 19:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752003412;
	bh=WxZx8t1eh4Wa0/HuXw8eTnTZeEIt+tpqIk0E/1C2NB0=;
	h=From:Subject:Date:To:Cc:From;
	b=AdRtsNSooZH3D7QtkCyl7sMbR1pJf2yfdhxJ2nWyzyXyscHNZIJJ5CFaW0ipHX1G5
	 2emEQFFsrahH5ms/dRUXzPX/m4hYmeqPNHFAvC0MqXoeWRhCslg6M76+WUIwG1tOvV
	 RHdERYXRwTVpTcdsIruoSITwnbfAf6AuMVz/qt1oPqJCXQ6SMkvXSsRJmeAFNJNv2q
	 et5q+lEo/MQHEcX/I+jWIBsLbd5e/xlTMcamDim+39e5I9cnS1dNqvb7kw462dyMIx
	 XegpoGCWfOUz85y40UTe8biEFvFmbWEPg3R3THyNSKvgZQiZ+gJnjH+8gSJotX7Oi3
	 jOjR8lB7W+zlQ==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 834D817E0CF8;
	Tue,  8 Jul 2025 21:36:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 00/12] Add HDMI 2.1 FRL support to
 phy-rockchip-samsung-hdptx
Date: Tue, 08 Jul 2025 22:35:41 +0300
Message-Id: <20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1zbWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwML3YKMSt2MlIKSCt20ohzdtGRjY3PzlCTLNKNUJaCegqLUtMwKsHn
 RsbW1AKDeYUFfAAAA
X-Change-ID: 20250708-phy-hdptx-frl-fc3377db9f2e
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_123655_735165_54515C1C 
X-CRM114-Status: UNSURE (   7.21  )
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
Cristian Ciocaltea (12):
      phy: hdmi: Add HDMI 2.1 FRL configuration options
      phy: rockchip: samsung-hdptx: Reduce ROPLL loop bandwidth
      phy: rockchip: samsung-hdptx: Prevent Inter-Pair Skew from exceeding the limits
      phy: rockchip: samsung-hdptx: Use usleep_range() instead of udelay()
      phy: rockchip: samsung-hdptx: Fix coding style alignment
      phy: rockchip: samsung-hdptx: Consistently use [rk_]hdptx_[tmds_] prefixes
      phy: rockchip: samsung-hdptx: Enable lane output in common helper
      phy: rockchip: samsung-hdptx: Cleanup *_cmn_init_seq lists
      phy: rockchip: samsung-hdptx: Compute clk rate from PLL config
      phy: rockchip: samsung-hdptx: Switch to driver specific HDMI config
      phy: rockchip: samsung-hdptx: Extend rk_hdptx_phy_verify_hdmi_config() helper
      phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 652 ++++++++++++++++++----
 include/linux/phy/phy-hdmi.h                      |  14 +-
 include/linux/phy/phy.h                           |   3 +-
 3 files changed, 570 insertions(+), 99 deletions(-)
---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250708-phy-hdptx-frl-fc3377db9f2e


