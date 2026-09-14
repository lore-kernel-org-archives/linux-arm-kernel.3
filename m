Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4402C88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jpybStDGbbNHrDDc/2IxtWLaKWeHTiq+GGk/oRFvyXE=; b=2hd2L9sDUm9/iE
	CzbeEhTilfShGJxVNs4FDr0i4xsQEHH4+hrl04vpScRVADDNnHbQDfKYqJjPesNN+4HVaRg/wqblU
	sWebyaI++0SkitmKl5hOM3rH04tuJxAf6N3RYMN9HlILteYj81tMG0xT6Ft47OOixfuNK9shOPJNd
	YFd9hS9Gen+MTbAMYajagMdNopvnwLdy3j8Eu0Exyc7aHlOgRHHYVTgV7kPQXHzDGoRL1wwh1VIHK
	ugG+fvlPWSBXoBoTccb829nT/qN6Vz2NPU5Kh5HnGNVbfs6h++oMO5Wquco70P+FkwelT3+JzCc2q
	Jhq5JHZrbZ2xBUoD+/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x651j-00000003IIN-1QqS;
	Mon, 14 Sep 2026 11:39:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x651f-00000003IHB-43mf;
	Mon, 14 Sep 2026 11:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789385945;
	bh=1RX3n7+XuYGGVnvw8leddVJPF1iwA0v3Mtkfltoefd0=;
	h=From:Subject:Date:To:Cc:From;
	b=nbmURkOvQ1OvMGoVxP1EpbaNilzg9SNl8TXbagvUmXJCykHONSEN/Lu4W9uhzV4ES
	 B8f/qQbJdjXx8W/cePXnRaQAFNtQx6Xw9CtW7c6hYbzfvOhnQqj1tfuZZQE3/4qjrN
	 p+VCEOwzcHpR2sPkJphS15frDbT13RR5WipygsOBvVRzOA4VV3ZDEEhF/8UUNW6gUo
	 6gN/JBiVF0jrmcD4BL0vzosc0gLbJrLfuL4pyG3dcBP+EVlyNxKDcT6aUDoJR5ZVqZ
	 nLLHpPbRb2e9B1S1bPNBcOSSpsT8ljV6ZZNn8Uw2oYkfypp02UuCF8pGvrRcQn5ZNy
	 MxfbwwDIU5m9w==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9170117E07DC;
	Mon, 14 Sep 2026 13:39:03 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH v12 00/24] MediaTek UFS Cleanup and MT8196 Enablement
Date: Mon, 14 Sep 2026 13:38:46 +0200
Message-Id: <20260914-mt8196-ufs-v12-0-9279d7ef814d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Sy07DMBAF0F+pvCZoxs+4K/4DsfBjTCPRBpI0K
 qr67zipUGrw0pbPndGVr2ykoaOR7XdXNtDcjV1/ygfkTzsWDu70Tk0X8wXjwBUCyuY4tWh1c05
 jEyhIb501pATL4HOg1F3WtNe3+3mgr3MOne6XzLuRmtAfj920353oMjU5V4NFZAs4dOPUD9/rN
 jOuojZ3xgYatCoG8q3woX0J/ceH8/3gnnP4GjXzR64LzjMPwohWyCDJuBoXD5yLgovMIYH00hm
 rUqpxuXGObcFl5jFSME5oGyOvcfXLNSCUXGUuLUeFyuT+scb1A+dldTpzMgFAeQ3Aq9WZjfM/1
 ZnMvUrcggk6OlPj7cYFlNPbzJUHcoELgbJanX3k5XS78OyNSMa1AmocYfNGQPlvYFk/KAqU8oM
 YqgG4BVjAMmD5edFHAGNASvtvg9vt9gOW6CgYVAMAAA==
X-Change-ID: 20251014-mt8196-ufs-cec4b9a97e53
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789385943; l=12338;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=1RX3n7+XuYGGVnvw8leddVJPF1iwA0v3Mtkfltoefd0=;
 b=vOYXOnEjQKVs19CFE9mp5tDx1j2Z3oPC3/6WB+zyyocp2kqKAu8NsiFG4eaIQxFI8BvbSUR5o
 m2z4VyTJuE8Dy1vwgkvyv5oK/1hx+oPplFkE7Tldv2THf6InS+R8wWZ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043908_316422_9668BC8E 
X-CRM114-Status: GOOD (  36.12  )
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

This series is a continuation of Nicolas Frattaroli's series, that does
major cleanups in the Mediatek UFS driver code and dt-bindings and adds
the support for the MT8196 SoC and its variants (MT8894 SoC).
The new revisions of the series (v10 and later) take into account the
remaining peer reviews and issues reports for v9.

First, it fixes several build and check issues: kernel test report build
report [1], patch per patch compilations.

Second, regarding the opened issues in v9 on the dt-bindings patches
2 ("dt-bindings: ufs: mediatek,ufs: Complete the binding") and 3
("dt-bindings: ufs: mediatek,ufs: Add mt8196 variant") [2],
this revision has two major changes to address them:
1) It renames all the clock names starting with ufs_ prefix and the one
that was named "ufs". No driver changes is needed for those because
they are not explicitely used by their names. The ufs_sel and ufs_fde
clocks in the driver were not renamed because they are not present 
in the dt-bindings (not anymore for the ufs_sel).
The devicetree patches for MT8195 SoC dtsi and the Mediatek Genio
1200-EVK and Radxa NIO-12L boards will be sent in a separate series to
address the dtbs_check warnings caused by the changes.
2) It drops the addition of all crypto and ufs_sel clocks, as it seems the
most likely and best solution to [2] after investigating on them and
what they are used for ([3]).

The Reviewed-by and Acked-by trailers, got by the patches 2 and 3 in
previous series revisions (v9 and earlier), were dropped so these
changes can be reviewed again. 

This new revision is based on linux-next kernel tree (tag:
next-20260911) and has been tested on Mediatek Genio 5100 Pro board
that integrates a MT8894 SoC (MT8196 variant).

[1]: https://lore.kernel.org/linux-mediatek/202603081809.R9OrrITa-lkp@intel.com/
[2]: https://lore.kernel.org/linux-mediatek/20260306163305.GA2680515-robh@kernel.org/
[3]: https://lore.kernel.org/linux-mediatek/8b013876c591f80ec4af86d69bf2f38f9ac481ad.camel@collabora.com/

Original Nicolas Frattaroli's cover letter:

In this series, the existing MediaTek UFS binding is expanded and
completed to correctly describe not just the existing compatibles, but
also to introduce a new compatible in the from of the MT8196 SoC.

The resets, which until now were completely absent from both the UFS
host controller binding and the UFS PHY binding, are introduced to both.
This also means the driver's undocumented and, in mainline, unused reset
logic is reworked. In particular, the PHY reset is no longer a reset of
the host controller node, but of the PHY node.

This means the host controller can reset the PHY through the common PHY
framework.

The resets remain optional.

Additionally, a massive number of driver cleanups are introduced. These
were prompted by me inspecting the driver more closely as I was
adjusting it to correspond to the binding.

The driver still implements vendor properties that are undocumented in
the binding. I did not touch most of those, as I neither want to
convince the bindings maintainers that they are needed without knowing
precisely what they're for, nor do I want to argue with the driver
authors when removing them.

Due to the "Marie Kondo with a chainsaw" nature of the driver cleanup
patches, I humbly request that reviewers do not comment on displeasing
code they see in the context portion of a patch before they've read the
whole patch series, as that displeasing code may in fact be reworked in
a subsequent patch of this series. Please keep comments focused on the
changed lines of the diff; I know there's more that can be done, but it
doesn't necessarily need to be part of this series.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v12:
- Rebased onto next-20260911
- Fixed incorrect reset error check in null PHY case in patch 6 (Sashiko)
- patch 8:
  - Reworked in patch 8 the ufs_mtk_09v_off/on error paths to disable
    or enable the first regulator if a failure occurs while powering on
    or off the second one (Sashiko)
  - Fixed in ufs_mtk_get_supplies the incorrect variable used for error
    logging (Sashiko)
- Fixed error logging in patch 11 (Sashiko)
- Added explicit string_choices.h header inclusion in patch 17 (Sashiko)
- Link to v11: https://lore.kernel.org/r/20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com

Changes in v11:
- Rebased onto next-20260831 and fix conflicts
- Fixed property typo in patch 2 ("clocks-names" -> "clock-names")
  (Sashiko)
- Patch 3:
  - Added new avdd09-1-supply property to describe the second 0.9V
    supply pin for MT8196 SoC (K. Kozlowski, Sashiko) and modify
    bindings accordingly
  - Reworded commit message to match patch modifications
- Patch 6:
  - Fixed ufs reset array order (Sashiko)
  - Fixed missing sleep call for null mphy case in ufs_mtk_crypto_enable
    (Sashiko)
- Fixed error logging in patch 7 (Sashiko)
- Added patch 8 to support a second 0.9V regulator in ufs_mediatek
  driver
- Patch 10:
  - Fixed missing new line in error log (Sashiko)
  - Fixed possible pointer type mismatch in ufs_mtk_boost_crypt
    (Sashiko)
- Replaced devm_phy_get use by devm_phy_optional_get in patch 14
  (Sashiko)
_ Removed additional dead code in patch 23 (Sashiko)
- Patch 24:
  - Fixed copyright date
  - Added new has_avdd09_1 flag in mt8196 platform data
- Added new Reviewed-by trailers
- Dropped devicetree-related patches as requested (to be sent in
  a separate series)
- Updated cover letter
- Link to v10: https://lore.kernel.org/r/20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com

Changes in v10:
- Rebased onto next-20260729 and fix conflicts
- Added Signed-off-by for all patches 
- Patch 2: 
  - Removed "ufs" prefix from clock names
  - Renamed "ufs" clock to "main"
  - Removed all crypto clock additions
  - Aligned example to patch changes
  - Reworded commit message to drop crypto clocks references
    and add clock names renaming
  - Dropped Reviewed-by/Acked-by trailers due to changes
- Patch 3:
  - Removed all ufs_sel clock additions
  - Aligned example to patch changes
  - Reworded commit message to drop ufs_sel clocks references
  - Dropped Reviewed-by/Acked-by trailers due to changes
- Fixed build failure on patch 9 due to ufs_mtk_of_match symbol being
  declared in the ufs-mediatek.c file after use.
- Moved ufs_mtk_of_match symbol at original place in patch 8
- Fixed build failure reported by Kernel Test Robot on patch 19 by
  fixing the incorrect FIELD_MODIFY val argument and using GENMASK
  for MTK_UFS_VER_PREFIX_M definition
- Added patch 24, 25, 26 devicetree patches for MT8195 SoC, Mediatek
  Genio 1200-EVK and Radxa NIO-12L boards to match the dt-bindings
  changes introduced by this series
- Added reviewed-by tag for patch 21
- Link to v9: https://lore.kernel.org/r/20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com

Changes in v9:
- Eliminate build failure in "Remove undocumented downstream reset
  cruft", including the of_node_put of the reset node that wasn't caught
- Pointlessly rename per-instance hibernate timer backup member to
  "ahit"
- Link to v8: https://lore.kernel.org/r/20260304-mt8196-ufs-v8-0-5b0eac23314f@collabora.com

Changes in v8:
- Split "Rework probe function" into two, turn the reset removal into
  its own patch and squash the PHY changes into the common PHY framework
  patch.
- Leave "device reset done" logging print at INFO level
- Remove redundant falsy check for reg_vcore in "Don't acquire
  dvfsrc-vcore twice".
- Change ufs_mtk_wait_idle_state to early-exit on all non-HIB states,
  and poll for VS_HCE_BASE instead.
- Link to v7: https://lore.kernel.org/r/20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com

Changes in v7:
- Rebase onto next-20260205, which drops "scsi: ufs: mediatek: Switch to
  newer PM ops helpers" as Arnd sent an equivalent patch that also fixes
  the PM-less build failure.
- Link to v6: https://lore.kernel.org/r/20260124-mt8196-ufs-v6-0-e7c005b60028@collabora.com

Changes in v6:
- Reword "Rework probe function" commit to better justify the changes
  being made.
- Drop "Add vendor prefix to clk-scale-up-vcore-min"
- Add patch to remove clk-scale-up-vcore-min entirely, describing the
  process for bringing it back (in a different form) in the commit
  message.
- Link to v5: https://lore.kernel.org/r/20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com

Changes in v5:
- Drop "scsi: ufs: mediatek: Make scale_us in setup_clk_gating const" as
  someone else already got a patch in for this into next.
- Make mtk_init_boost_crypt void
- Don't disable/enable misc regulators during suspend/resume, but enable
  them once when acquiring with a devm helper.
- Link to v4: https://lore.kernel.org/r/20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com

Changes in v4:
- bindings: Redo the supply situation, as the avdd pins don't describe
  the vcc(q2) card supplies.
- bindings: format clock in mt8196 example more tersely.
- phy: use devm_reset_control_get_optional_exclusive directly
- driver: get and enable/disable the aforementioned avdd supplies.
- Link to v3: https://lore.kernel.org/r/20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com

Changes in v3:
- Split mediatek,ufs bindings change into two patches, one for
  completing the existing binding, one for the MT8196
- Add over a dozen driver cleanup patches
- Add explicit support for the MT8196 compatible to the driver
- Note: next-20251023, on which I based this, currently has a broken
  build due to an unrelated OPP core change that was merged with no
  build testing. I can't use next-20251022 either, as that lacks the
  recent mediatek UFS changes. It is what it is.
- Link to v2: https://lore.kernel.org/r/20251016-mt8196-ufs-v2-0-c373834c4e7a@collabora.com

Changes in v2:
- Reorder define in mtk_sip_svc.h
- Use bulk reset APIs in UFS host driver
- Link to v1: https://lore.kernel.org/r/20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com

---
Louis-Alexis Eyraud (1):
      scsi: ufs: mediatek: Add dual 0.9V supply support

Nicolas Frattaroli (23):
      dt-bindings: phy: Add mediatek,mt8196-ufsphy variant
      dt-bindings: ufs: mediatek,ufs: Complete the binding
      dt-bindings: ufs: mediatek,ufs: Add mt8196 variant
      scsi: ufs: mediatek: Move MTK_SIP_UFS_CONTROL to mtk_sip_svc.h
      phy: mediatek: ufs: Add support for resets
      scsi: ufs: mediatek: Rework resets
      scsi: ufs: mediatek: Rework 0.9V regulator
      scsi: ufs: mediatek: Rework init function
      scsi: ufs: mediatek: Rework the crypt-boost stuff
      scsi: ufs: mediatek: Handle misc host voltage regulators
      scsi: ufs: mediatek: Remove undocumented downstream reset cruft
      scsi: ufs: mediatek: Remove vendor kernel quirks cruft
      scsi: ufs: mediatek: Use the common PHY framework
      scsi: ufs: mediatek: Remove mediatek,ufs-broken-rtc property
      scsi: ufs: mediatek: Rework _ufs_mtk_clk_scale error paths
      scsi: ufs: mediatek: Clean up logging prints
      scsi: ufs: mediatek: Rework ufs_mtk_wait_idle_state
      scsi: ufs: mediatek: Don't acquire dvfsrc-vcore twice
      scsi: ufs: mediatek: Rework hardware version reading
      scsi: ufs: mediatek: Back up idle timer in per-instance struct
      scsi: ufs: mediatek: Remove ret local from link_startup_notify
      scsi: ufs: mediatek: Remove undocumented "clk-scale-up-vcore-min"
      scsi: ufs: mediatek: Add MT8196 compatible, update copyright

 .../devicetree/bindings/phy/mediatek,ufs-phy.yaml  |   16 +
 .../devicetree/bindings/ufs/mediatek,ufs.yaml      |  136 ++-
 drivers/phy/mediatek/phy-mtk-ufs.c                 |   71 ++
 drivers/ufs/host/ufs-mediatek-sip.h                |    9 -
 drivers/ufs/host/ufs-mediatek.c                    | 1007 +++++++++-----------
 drivers/ufs/host/ufs-mediatek.h                    |   19 +-
 include/linux/soc/mediatek/mtk_sip_svc.h           |    3 +
 7 files changed, 653 insertions(+), 608 deletions(-)
---
base-commit: f1d57ebe64941cf93ec885c9237affa5c817a24b
change-id: 20251014-mt8196-ufs-cec4b9a97e53

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


