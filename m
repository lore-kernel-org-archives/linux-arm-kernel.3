Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF26C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dcRKhSRsVwELbsESZ1zSkDCur9CbbQAALUHZJbjmMcg=; b=R+n1IgzKJklB1d
	ij8nGtpvbai6fzkyx18OcCtAEkaKL7QnW/qxb/0KVVfcDkHRDNCIAOv57C4SISD6Z0duoJNguSN8h
	zTphIqOJLfM8FaW90dUGY/y0GIEMTIYenNzk74eOYqoZCuC1d2UFtsccZA45xYd2MImVMvpH+PK+b
	H9Zpf1tE3WvNROHDP9YOAcINDQc04Sm08JsF7vDVnc0At5Ipjp8JZkR3z15TKJ6pg96sAfJF2Cx5A
	O7iSmXAGAClWBAQZBMx/9hDjHZ736T22DZHrYpzsqwNgsvNqsXxJLLWAHa2UNjT4rjGmkX1ejZDX5
	ALOvFoFRZ373HqOhTc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUv9g-0000000CweR-2mqr;
	Thu, 26 Jun 2025 22:33:17 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsyn-0000000CilR-0DWi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:13:54 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BB56125EA4;
	Thu, 26 Jun 2025 22:13:51 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-5a0IuCrGJc; Thu, 26 Jun 2025 22:13:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968830; bh=FFjnLZMfPZBAJbL96oCQnyDn/YOdEMR7wa+IGJNDeck=;
	h=From:Subject:Date:To:Cc;
	b=IFRi2KNLmhx6brjIkFKF5BTjf55gGs5uaCXsLzKmMHR4U0/ZLHZy6X0pCuDb+Q3Ki
	 nYPxEhVmeEHUBXDVvG9Z5JyegHbu2YPUBPaNMicMUAMrQI8IeQQvhVRoeiLBp1TC76
	 9xQ6VppZz6vB443tf7ZeWtm3ixpXwBHPmEzxY0JsyY3ASo/D48wDjuP001LyhmdKgD
	 pJQ+h52XN+gd17utEJJuH+22lZoM1o4c4+PFiVe3fj9akpwXnw+6oqC5dI79V1hAjC
	 RLB6yl/JoIE9N23FzsHTuVKn/3imwpmv8TkUntBTaTMssx6856KaYV5dzH5kgyHWK6
	 l5/1xVQbLAZBA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
Date: Fri, 27 Jun 2025 01:43:23 +0530
Message-Id: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOOpXWgC/22NQQ6DIBBFr2Jm3WkAo2BX3qNxgYDKotLMGKMx3
 r3Ubrt8L/nvH8CBYmB4FAdQWCPHNGdQtwLcZOcxYPSZQQlViUqVGLZ9TqyNFujphX5hNNo52+t
 S9raBPHxTGOJ2RZ9d5inykmi/Plb5tb9cLdW/3CpRoDFOaN3YoXZ96yNTSss90QjdeZ4fQc9z/
 LYAAAA=
X-Change-ID: 20250523-exynos7870-drm-dts-87ccab731ba9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=3190;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=FFjnLZMfPZBAJbL96oCQnyDn/YOdEMR7wa+IGJNDeck=;
 b=c+FFNHhhOUGGsSszBnm+LZ5iHuosmtfhJ1rBmbim5EUu0xrny1B+zxCcEMsy5e1EZO6BP3Fuj
 m5Zcm/o1wULC9QJ8vFqqom+xflF4fmC+9/iu7liBuOXXnBdp2GwW1ji
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_131353_225787_808AB72D 
X-CRM114-Status: GOOD (  10.04  )
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

exynosdrm-decon            - https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org
exynos7870-mipi-phy        A https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
exynos7870-mipi-phy-fix    - https://lore.kernel.org/r/20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org
exynos7870-dsim            - https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org
panel-samsung-s6e8aa5x01   - https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org
panel-synaptics-tddi       - https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
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
      dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode
      arm64: dts: exynos7870: add DSI support
      arm64: dts: exynos7870-on7xelte: enable display panel support
      arm64: dts: exynos7870-a2corelte: enable display panel support
      arm64: dts: exynos7870-j6lte: enable display panel support

 .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |  2 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 52 +++++++++----
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 49 ++++++++----
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 51 ++++++++----
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 90 ++++++++++++++++++++++
 6 files changed, 206 insertions(+), 39 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250523-exynos7870-drm-dts-87ccab731ba9

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


