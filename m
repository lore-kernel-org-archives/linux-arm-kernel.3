Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19537CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 17:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ciR1C/IVnj/vENo8LbPpdYWcLodjsrqqDkSsgSAD4U=; b=3DKXD0vPbn+6mu
	K1vPhxZ5rFs2ioVyE4M9DYruQJKdu3pT9EKCbkn8BISVb1y7Ot/mvVGa2W+bQRtGHCX3s4HG6kd5d
	bRdaEPM9xw9wlzOy4mgVF4CVRiraMToM10MuAlC5OZkvqPLleqAA90GOrm7D3lpcQ+ODv/ZCaZ5EW
	xzbK8OFoQ36t2xkoXbHteonHW4lDeRlCdoD8nvqvLVbpCYyTZssIik5LldhmJ/9JwZX3aXJXrhE2F
	4merkhaB5+mRZr0dE4MZ54QhphOB6p/61JSzHWDqrBAoC3HtCyZJNkUV+KjMq0yFazGyGQkKAtIu4
	bFNg2xjxFr9XIXFjs8sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ve7-0000000GzEX-0ILf;
	Sun, 28 Sep 2025 17:57:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ve2-0000000GzBr-3mqQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 17:57:12 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 516F226173;
	Sun, 28 Sep 2025 19:57:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ivMluFyA8AD; Sun, 28 Sep 2025 19:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082226; bh=8py30CHyigZviZ2rpSpVxQKrO0mgBy5ZGBCf1zEeL8Q=;
	h=From:Subject:Date:To:Cc;
	b=MQT1JnPeQVJhHYBKZrK2Vu0LQRKywq3nBTQ7YhDKQQFbw8PnDou+7xq21v16CZtAu
	 S/hzPa8CWFLFDHuK3PQHX8gySmnybBPenqu8eryyq0bOnUIZ1zljgym1tTKMO1kguc
	 m4Gtl8VHMLG4Pa+zkjui9UiPaQsYewIqA8KVbZdwawUrHXWTOn3yF1qwmuCGfTX073
	 e8q+GS4iyBEv1SOBiHD22WZ5mUBBqQIIlC3Cjj6k6QpUSaR78Ha56UmX+y4VNaK4L2
	 GhkAMflRh87eln7E9THguM9CSs0YnHiaBLhBlbNUaqElMVM+bZx1n63p1hapnBsiVv
	 ZL5LsUby49h2g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
Date: Sun, 28 Sep 2025 23:26:34 +0530
Message-Id: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANV22WgC/23NQQ6DIBCF4as0rEsDQ3Wgq96j6QIBlUWlAUM0x
 rsX7aZNXP4vmW8Wklz0LpHbaSHRZZ98GEqI84mYXg+do96WJsCgYhUI6qZ5CAklMmrji9oxUYn
 G6AYFb7Qi5fAdXeunHX08S/c+jSHO+4/Mt/XL1RyOuMwpo1Iahqh0W5vmbn2KIYyXEDuygRl+E
 MBDBApir7pSwFAoZv+RdV0/5LeXUfsAAAA=
X-Change-ID: 20250523-exynos7870-drm-dts-87ccab731ba9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=3858;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=8py30CHyigZviZ2rpSpVxQKrO0mgBy5ZGBCf1zEeL8Q=;
 b=/q0ya9ZZafrks/RtT4YDPlXOFvihPaELzrwMJYW8FCOpMFEuYSs9f6XwNIPgl0eORsl7boygW
 C2hIKUqanxPCaBSwjnco859JWtfWt8lm+PkMh7j7iaZL3KklOQgHaSk
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_105711_495256_6FDE0507 
X-CRM114-Status: GOOD (  12.06  )
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

Exynos7870 has a IP subsystem in its architecture dedicated to display
management. Notably, this block includes the Display Enhancement
Controller (DECON), and the DSI Master (DSIM).

The following series and its sub-series implement all components for a
functioning display pipeline. All vital information which helped shaping
up the patches have been retrieved from Exynos7870 vendor kernel sources
as provided by Samsung.

Testing has been done on all three devices available upstream, i.e.
Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2 Core
(samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte). Regrettably,
I've only been able to test the functionality on video mode, as none of
the devices have panels working in command mode.

This series implements changes in the SoC subsystem, which includes
devicetree additions. It depends on all sub-series listed below:
(Legend: [R]eviewed, [A]ccepted)

exynos-sysmmu-resv-regions A https://lore.kernel.org/r/20250712-exynos-sysmmu-resv-regions-v1-1-e79681fcab1a@disroot.org
exynos7870-mipi-phy        A https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
exynos7870-mipi-phy-fix    A https://lore.kernel.org/r/20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org
exynos7870-dsim            A https://lore.kernel.org/r/20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org
exynosdrm-decon            A https://lore.kernel.org/r/20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org
panel-samsung-s6e8aa5x01   A https://lore.kernel.org/r/20250721-panel-samsung-s6e8aa5x01-v5-0-1a315aba530b@disroot.org
panel-synaptics-tddi       - https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- fixed minor issues with devicetree in regards to compliance
- added memory-region to framebuffer region for decon device
- added related patchset to list: exynos-sysmmu-resv-regions
- replaced exynos7870-pmu with exynos7-pmu compatible to the list
  allowing a MIPI PHY subnode (krzk)
- updated compatible string and dt node for j6lte's panel
- reorder properties: ${x}, followed by ${x}-names (krzk)
- Link to v2: https://lore.kernel.org/r/20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org

Changes in v2:
- modified compatible hierarchy to use non-deprecated syntax (krzk)
- fixed subject prefixes of [v1 2/5], [v1 3/5], [v1 4/5], [v1 5/5] (krzk)
- removed simplefb nodes instead of disabling it (krzk)
- added dt-bindings patch to allow mipi-phy node under PMU
- changed clock names of dsim node
- Link to v1: https://lore.kernel.org/r/20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org

---
Kaustabh Chakraborty (6):
      dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
      dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7 PMU
      arm64: dts: exynos7870: add DSI support
      arm64: dts: exynos7870-on7xelte: enable display panel support
      arm64: dts: exynos7870-a2corelte: enable display panel support
      arm64: dts: exynos7870-j6lte: enable display panel support

 .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |  2 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 57 +++++++++++----
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 ++++++----
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 57 +++++++++++----
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 84 ++++++++++++++++++++++
 6 files changed, 197 insertions(+), 42 deletions(-)
---
base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
change-id: 20250523-exynos7870-drm-dts-87ccab731ba9

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


