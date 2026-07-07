Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0066C44503
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HAeB/Op8nmvOd27gL/buoe+pif44ZJYHQOLqJFWuvo4=; b=qpgrnykraAnKZ36QAfadwSBbHv
	2yPy/98myMbQfRfN4+Rsd7vDxSoy90kcuapz0kI6nDUoujDoY4E2KJPZkcryfqEPIOB2QE+v29WDr
	1jGK0JKn0I7BmaRpRTcBZTi6LXGRei3ftp9lKCfrR/Vw1Z8PWesYV28iZinlU/AwnqyCfFHwtzgaT
	ei7Ujntna29hO/RFmq3SlxOB8NTqKEd4wNALlom9Bqh2WQlKLI5A3Im15cM67zi1mnpQPJCwsjfBw
	RrFnfNaJ4sfcbbq8Q9d2Xby43yynytSOIkJcZDUsMajrkzN00M/JHTlprAlvqbod+iaAUPWPDmUzt
	yPGNacmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6eL-0000000F8eW-0IRb;
	Tue, 07 Jul 2026 14:19:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6eH-0000000F8cU-0IV8;
	Tue, 07 Jul 2026 14:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783433981;
	bh=X99KKDPKDM77EUe/K6IwQ6N3jw1s5gDXs0w54CvjxZ4=;
	h=From:To:Cc:Subject:Date:From;
	b=IpN4sGTRbigL3LEZNRe+mqGHxT8wFbKvRLsqh0ZAz/EyFvhA1cCX/D8gB17qhdB0f
	 l/Iht+L5Y7/EJ81L5B1FTSB6z2CKWtBEBPFa+bZrO9RArYmAmZej7ehEGnRa7dg8kQ
	 ukBwj66jefpWIt30+R9pLxYPW97g1qPKXZqQiDjcS54II2ODPyywBH2fE09XN6oYYJ
	 FejvJSgL5mtEDipmqlie7U3UvCm/t5PgNmGOTdW2HWw2/nuNyAyQueGhI4fYCN4qTd
	 wvoK9IqJYlu4YAh1VSwFc4SFKBon/nWQW3Yd+ZtScB1HXp399HSYfYnpx2otIaTW/+
	 IySYs4MvxWyEA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 270A417E003B;
	Tue, 07 Jul 2026 16:19:41 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 00/12] PHY: MediaTek DP PHY refactor and MT8196 eDP
Date: Tue,  7 Jul 2026 16:19:19 +0200
Message-ID: <20260707141931.191172-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_071945_264847_1CDBDF84 
X-CRM114-Status: GOOD (  16.52  )
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

Changes in v2:
 - Fixed register offsets for ANA phy in MT8196
 - Set/clear FORCE_VOLT_SWING_EN bit when configuring and resetting
   the voltage swing registers
 - Fixed endianness issue in call to nvmem_read_u16 (Sashiko)
 - Added early exit during lanes disablement if none are enabled to
   avoid out-of-bounds bitwise shift (Sashiko)
 - Removed useless call to pm_runtime_get_sync() in probe(), which
   also fixes issues pointed out by Sashiko
 - Fixed wrong dig vs ana register array usage in power_on/off (Sashiko)


This series performs major refactoring on the MediaTek DisplayPort PHY
driver, makes it probe with devicetree instead of getting registered
by the mtk_dp DRM driver, adds power_on/off() callbacks, and honors
the phy configure opts' set_lanes and set_voltages for, respectively,
varying the number of lanes and setting the voltage pre-emphasis and
swing on the PHY, for each lane.

This driver now also properly gets the PHY (EYE) Calibration Data from
NVMEM (eFuse array) if provided, instead of getting it (improperly)
injected by the mtk_dp driver.

Additionally, all of the driving parameters calculations and most of
the other register definitions were refactored to greatly enhance the
human readability of this code.

As a last step, this also transfers the register offsets for both the
digital and analog phy registers in arrays assigned to soc specific
data, in an effort to both introduce support for new minor revisions
of the MediaTek DisplayPort PHY and to have a clearer view of the
register related differences between those (for example, it is easily
understandable that the analog part remained exactly the same between
MT8195 and MT8196, but the digital part gets a slight update).

Speaking of which, as a last step, this also adds support for the
MT8196 SoC (and its derivatives), which uses this PHY only for its
Embedded DisplayPort (eDP) IP (spoiler: the DP one seems to be way
too different and requiring an entirely new PHY driver).

In this state, this driver can also easily support the MT8189 SoC
with a few lines of code: even though I do have clean code to add
support for this one, I was not (*yet*) able to test it on upstream
based kernels, and for this reason I decided to leave that one out
for now (but it's coming later for sure).

NOTE!
Despite all the apparently breaking changes in the refactoring, full
compatibility with older MTK_DP driver and with old devicetrees was
retained and carefully tested on multiple platforms!

P.S.: I am aware of the BUILD_DRIVING_PARAM_0( 0, 2, 4, 7) checkpatch
warning and I didn't fix it in bigger favor of human readability.

AngeloGioacchino Del Regno (12):
  dt-bindings: phy: Document MT8195 and MT8196 DisplayPort PHYs
  phy: phy-mtk-dp: Rename regs to regmap in struct mtk_dp_phy
  phy: phy-mtk-dp: Allow probing with devicetree match
  phy: phy-mtk-dp: Migrate register offsets to SoC specific pdata
  phy: phy-mtk-dp: Implement power_on and power_off PHY callbacks
  phy: phy-mtk-dp: Support set_lanes in configure and properly cleanup
  phy: phy-mtk-dp: Support setting volt swing and preemphasis values
  phy: phy-mtk-dp: Add support for digital and analog calibration
  phy: phy-mtk-dp: Rewrite and document default driving param macros
  phy: phy-mtk-dp: Add bitrate register val definitions to SoC data
  phy: phy-mtk-dp: Add PHYD Lane EN register mask to SoC data
  phy: phy-mtk-dp: Add support for MT8196 eDP PHY

 .../bindings/phy/mediatek,mt8195-dp-phy.yaml  |  77 ++
 drivers/phy/mediatek/phy-mtk-dp.c             | 863 ++++++++++++++++--
 2 files changed, 843 insertions(+), 97 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml

-- 
2.54.0


