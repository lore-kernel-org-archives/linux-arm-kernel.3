Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85763C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C4xkv1pNBZa0UV592BrXQOSmrAU4LxILMnPoJ5rd3c0=; b=zim+hPemvS/OKyMRBgYwCIAa0q
	EBcb/sUCvkp+f82qKrd0VUbIjWlYpyVkUMnMxnFGW4TGqokg7VaK8KaNl5tGwehRO8dhAEK6USug2
	cDs+Wg4n8Mho7V7yz9SuSlvAifygWqfTMToxet4EN+ueyuwkdBSuiCrk0Qq81k096gD8H1t58ppdh
	liJsNsuZCWgDCcPVaoPbN2riN4Rh8EqQhrYM2mfxehh1otTWx7iSjTEXGThnzp6M4WThSyuBQKWIx
	DGeIAGxPDeO3Mdo4Z42ExS6iAfqWaHvYyYPZDsV3JONYsrJCt6R7xlvl2XW3150+zsCwe08Jym1Mn
	HVkPjung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvp-00000001sQj-1tgf;
	Wed, 01 Jul 2026 12:20:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvZ-00000001rYz-2Vz6;
	Wed, 01 Jul 2026 12:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908427;
	bh=YiQRmpkPEVko95Om7e8QPlfXmNnYeuIzUXWZksvRNHI=;
	h=From:To:Cc:Subject:Date:From;
	b=fuR3pcFcrtxCGetw60V5hrOFXHBqssz0EwaJt0eNfTef0j/pI9L2YJQF4m6RBnZ5n
	 waxpMV5SBeDDKxqrdxOj+u/fC+lvX3P6/IXOshaiyMbR+Q2bSdKDjZQijP00zMp8Th
	 UF4hmdGKHaGSKc86ZKm7N1hFPKI+8fK/SbmKKkB4GezevxY/0Br/f+AJI5F8HH8ryk
	 SMz4rBO1by4gEovc4zzT2Ni+RBBwvWa3+6tY/Lgw8Q64KJ1eQgI6Eq2HQNpRwjGGr1
	 zEiJMZhb8LroQjaODn/tkjVx1bi/PLRTq9FpOG3n/BLhQJATtkM/D+RRLySBTXVR7/
	 BtBuXEPVoACDA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 56F4817E0CF4;
	Wed,  1 Jul 2026 14:20:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 00/11] drm: MediaTek DisplayPort cleanups and MT8196 eDP
Date: Wed,  1 Jul 2026 14:20:13 +0200
Message-ID: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_052029_861357_DAEEF232 
X-CRM114-Status: GOOD (  11.84  )
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

This series performs some very much needed cleanups to the MediaTek
DisplayPort driver, including a fix for the audio codec and PHY driver
unregistration, a refactor to finally correctly use the PHY (!) and
introduces support for the Embedded DisplayPort (eDP) IP in MT8196.

Note that this deprecates the nvmem related properties in this driver
because those are NOT related to the DisplayPort IP, but rather to the
DisplayPort PHY, and were therefore transferred there instead (code in
a different series, updating the PHY driver).

On legacy devices, this driver was carefully tested with both NEW and
OLD devicetrees, so both with the new, proper PHY usage, and with the
old platform device registration strategy and eFuse retrieval from DP
instead of PHY driver.

This was also successfully (manually) tested in a kernel that misses
the PHY driver updates on devices using old devicetrees (mt8195/88)
and no regressions were experienced.

AngeloGioacchino Del Regno (11):
  dt-bindings: display: mediatek: dp: Deprecate nvmem efuse data
  dt-bindings: display: mediatek: dp: Add compatible for MT8196 eDP
  drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
  drm/mediatek: mtk_dp: Clarify SMC eDP/DP video unmute commands
  drm/mediatek: mtk_dp: Rework register offsets for proper PHY usage
  drm/mediatek: mtk_dp: Use PHY API for PHY power sequences
  drm/mediatek: mtk_dp: Add support for PHY from devicetree
  drm/mediatek: mtk_dp: Move max link rate to SoC specific data
  drm/mediatek: mtk_dp: Add support for HotPlug Detection in DP AUX
  drm/mediatek: mtk_dp: Add support for eDP1.5 IPs and MT8196 SoC
  drm/mediatek: mtk_dp: Clarify XTAL freq and Debounce registers

 .../display/mediatek/mediatek,dp.yaml         |   5 +-
 drivers/gpu/drm/mediatek/mtk_dp.c             | 576 +++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         | 328 +++++-----
 3 files changed, 691 insertions(+), 218 deletions(-)

-- 
2.54.0


