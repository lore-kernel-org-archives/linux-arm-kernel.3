Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F11C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nYZ3r2oT5vRVa63+v+t17bQvSt6BIko2qLFnDicFIcE=; b=yhgnPCUF6BWdgk67JBHBv5cjqf
	InTX0LbA3bJKZnCJm8gpuVVc8gTJxlJGsaY5ya/vcZlEjJoZdMWpFlf/7AeIUp8EjSYtUJXteWw4c
	HWHIjWd1Q5vy4vcf1nU5en8tRKbO6hwV+nHcYXE/Fvnmdsf5PvjcLdpgnn9864QSSHJIZ5Zb7WZg3
	GC+27xholbQHjPur6bA32VESGPkKklpd0kIcYabAXQxLvS1n5slMakGZLe0UucE/vEvmLuhXdMYaL
	vJwoZYD8zoZ+6PAez64Nq7WmlsCwDRJXr758O/wp9Bu86T1MGTydzJ40qUnDaKYCwsdNGEe+Kp5Ua
	QX1b5Rrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7wk-0000000FLyD-1kow;
	Tue, 07 Jul 2026 15:42:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7wi-0000000FLwd-0awi;
	Tue, 07 Jul 2026 15:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783438969;
	bh=q69Efgu8X5NGbOCMTzwUNrYXN34SM6vI0sNv573sxkM=;
	h=From:To:Cc:Subject:Date:From;
	b=qEr99uQGkcf3jMnENadozcdWbn/QYxn9I9gMh+n4RN2pEgM6gPMBFTSWJCTX1lPjD
	 pHbLSezVjJ9i/7HuFrKbcVitlpR3K2NtMxrl5y4AlhQGeAPSGxbw/9rcwjxU8ml4dA
	 PgqFfvz5iyIZBv/ouPOLZfcNu6MSZjrsJs3h4L6hfWItfLT4ziJhWFdrbQBNf/mhaL
	 0FJ8Xy9gJQsHCovUT0vUD9y6R+ncnOI5YyVkVzpDn7FwYkVpvN1xfN5Ejq6QLjSIeo
	 GXtYd1RV366To/3hy52H1GAsgGrxsHJdNoKmqCYcEJy3dqPEHZjylBRb50pYWimPfd
	 49UBEPYIi5J6w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BBFC17E013E;
	Tue, 07 Jul 2026 17:42:48 +0200 (CEST)
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
Subject: [PATCH v3 00/12] PHY: MediaTek DP PHY refactor and MT8196 eDP
Date: Tue,  7 Jul 2026 17:42:33 +0200
Message-ID: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_084252_341779_D4865A57 
X-CRM114-Status: GOOD (  17.60  )
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

Changes in v3:
 - Added missing bitfield.h, pm_runtime.h includes (Sashiko)
 - Set calibration data before registering PHY (Sashiko)
 - Enable PM Runtime before creating PHY device (Sashiko)
 - Continue poweroff if some write fails, but still return failure
   as that would be a partial poweroff anyway (Sashiko)
 - Added zero driving params to fix default calibration data setting (Sashiko)
 - Added NULL check on device_Get_match_data (Sashiko)

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
 drivers/phy/mediatek/phy-mtk-dp.c             | 882 ++++++++++++++++--
 2 files changed, 862 insertions(+), 97 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml

-- 
2.54.0


