Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F7C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AE3nh4ODpzdE32S4a1u47ayZwtoJfIx0Tjgv3s79pig=; b=lElkui5H4eBMinIrWOPIao/4SM
	TCK7JCBOEukeOpSCfjSqXjeBkh5LWWNorNySGrIFT+lf/gL2uMyPlxYi8WBSKXAz1UTWPm6uc1rNV
	jQoX6BCH5E2XMABD9Q9xc/puEDfCphSSMFPPUhvd/fy+5CibEve7OpV0w5Ye0mTgSPzJe79bMs+JI
	RsQpvNGSdpkfHZwCjeA8YRB5PYtWdaXnb7UkKr0+8gMH2VCty+MePwr2bCh2MXjvtiI40dgL8z/tp
	1Q1RdOstQoJ0hT8FDSzbmCrcu05Y5pPf/Wz0YOCNPQLL6azb/Vc8j926ixHp24vAw0+mVqB5u2sib
	LCZxeHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMB6-0000000D2Hd-29tL;
	Fri, 21 Aug 2026 10:08:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMB4-0000000D2Fw-2DOm;
	Fri, 21 Aug 2026 10:08:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D83AB60A71;
	Fri, 21 Aug 2026 10:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52361F000E9;
	Fri, 21 Aug 2026 10:08:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] phy: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:08:38 +0200
Message-ID: <cover.1787240165.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

	Hi all,

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Hence this series aims to make sure all members are fully initialized,
to avoid such bugs, and to prevent future breakage when converting
drivers to a different method for specifying the parents.

Part One[1] fixed all cases that I identified to be real bugs, in
response to a crash I saw on BeagleBone Black.

This series is the PHY subpart of Part Two, which fixes remaining cases
that are currently harmless.  These are still fragile, and may cause
future breakage when converting drivers to a different method for
specifying the parents.

Thanks for your comments!

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  phy: freescale: fsl-samsung-hdmi: Make sure clk_init_data is fully
    initialized
  phy: rockchip: Make sure clk_init_data is fully initialized

 drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 2 +-
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 2 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 2 +-
 drivers/phy/rockchip/phy-rockchip-usb.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

