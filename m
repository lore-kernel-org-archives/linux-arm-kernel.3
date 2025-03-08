Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C7BC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3h10f91xvm+K4WUqhQTIm9z6S1t0/TwMf1jWvx7Ojnk=; b=Qy4jjFH/NgrXDV
	vrrQeHApfiZbJUXvxMOcSHEH0Za7pcQkZT2x4vD/JfHwGONW/W1zYo12m0xhlxfhlPvsUe61Ce1WL
	fVenCa/Aw4hUioltJEbU06zkkLKQPL/GVXQnmE/lz/QEdLQrkqy5ROmEsZ1g2eUq2t+hFvRq2Rplw
	PII8PMRHMHOnHO6bSZ5aSJwdbV3gSkEMhohYQHs6va17fj7UOKHLVA1UuwSm/CNg0T1zNG3B4Ej3e
	XcXkMbmZVLo2JboAwdtIchABEgiFQALPhzCnekH7SBhG49V/3IbW5qOnPB3oQhBXfZko1RBmqcKO2
	xJvg8cJDJn6ieoTuUG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtGD-0000000GaOj-0yCU;
	Sat, 08 Mar 2025 12:26:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtBP-0000000GZb5-0jKb;
	Sat, 08 Mar 2025 12:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741436490;
	bh=A5jKN2t63kBzSii3RgaD0GHXG1gs1uhvXpjEMzL5JxY=;
	h=From:Subject:Date:To:Cc:From;
	b=OijMBpaJj4tCrq8BIoIvxgO1c1OCZo69jGlgYq2CBgXI8qPjdyKO+Pf8kSuxGmEHc
	 zUvm2/TYDK181ZI+HJecCgUg3rtB/iXV3h6UFyqk8QJFMlaezsQau2keYvRZ2Os+Au
	 RWyYRYJIV/6N/ONaGIuL2nilAEOa67mRaspLStz/+gxSFIErsLALASIaz4Y42KBCsk
	 2QyRH9XujlI9SL4lMnzCKIl97FgzmAhn57ay46B49mCN0hwwc/aEa3oIwXilbdg3uu
	 Tt5hm1OqLPMduYX2N2A2dfHBvdf5mn36qdkD1Owrzwo3SVtCkcNp4q3xIX2YRU15kN
	 LsYYPMr6ADZUg==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 150AB17E0657;
	Sat,  8 Mar 2025 13:21:30 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v5 00/12] phy: rockchip: samsung-hdptx: Support high color
 depth management
Date: Sat, 08 Mar 2025 14:21:09 +0200
Message-Id: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADU2zGcC/23OwWoDIRAG4FcJnmvRUWe2PfU9Sg/u6HaFJC4al
 oSw7x4TCClU5vQP/N/MVdRYUqzic3cVJa6ppnxswb3tBM/++BtlCi0LUGA1KJTLfJHVH+QcltN
 ZjgtLMyrHCIRTINF6S4lTOj/M75+W51RPuVweJ1Z93z416mirlkoqwxBtwEAf9MV5v/djLv6d8
 0HcxRX+KBp6CjTFUUQCpja2p5in4hSA6SmmKYje8RBxMND9xb4Uo2xPsU0Z0NFgibWZ/inbtt0
 AByYU1ogBAAA=
X-Change-ID: 20241206-phy-sam-hdptx-bpc-3b05c6276fd7
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_042135_362771_21923EE6 
X-CRM114-Status: UNSURE (   7.94  )
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
Cristian Ciocaltea (11):
      phy: hdmi: Add color depth configuration
      phy: rockchip: samsung-hdptx: Fix clock ratio setup
      phy: rockchip: samsung-hdptx: Drop unused struct lcpll_config
      phy: rockchip: samsung-hdptx: Drop unused phy_cfg driver data
      phy: rockchip: samsung-hdptx: Drop superfluous cfgs driver data
      phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit conversion overhead
      phy: rockchip: samsung-hdptx: Setup TMDS char rate via phy_configure_opts_hdmi
      phy: rockchip: samsung-hdptx: Provide config params validation support
      phy: rockchip: samsung-hdptx: Restrict altering TMDS char rate via CCF
      phy: rockchip: samsung-hdptx: Optimize internal rate handling
      phy: rockchip: samsung-hdptx: Add high color depth management

Sandor Yu (1):
      phy: Add HDMI configuration options

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 292 +++++++++++++---------
 include/linux/phy/phy-hdmi.h                      |  21 ++
 include/linux/phy/phy.h                           |   7 +-
 3 files changed, 202 insertions(+), 118 deletions(-)
---
base-commit: cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
change-id: 20241206-phy-sam-hdptx-bpc-3b05c6276fd7


