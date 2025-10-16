Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C76ACCD1A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 07:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=uvPq6Yt+OkoQhl8rEe9LIjf6WFzUTfhhECRiJsOl0Bc=; b=aQtFAsDIOOB/x1cadOGD1wgC+w
	lnFuxfaBn+mE4QFlI9OGlHvbG4V+qOxArvFOwUtNqi90E++yuT9Wg3oCA3AecR4v7iwTNFhsgz/Bo
	aB3jdzL3F9rXJPkuBdrHk01OUQ4UbpaFLWHkrk2jIcSEtPl/O8L0lAE6sq5WMzYqamS0u8kU39Pui
	m+amukT3Zix5dI30aaPSzvsNM6DmmgDCkgwSjuf6cKMw4VYT23Ezi9hM9gOW3GqIRRS9TV53/Hh0v
	wBiYeUyCkM2bLOxfmL1kCpMVuM2Z63X2D7BFyAdQA/ljY8vCkt/mC9Dm3XDo4JcJYDiPMes0qUDBl
	0ZI39Crw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IM1-00000003kbB-2Y3p;
	Thu, 16 Oct 2025 07:24:53 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ILu-00000003kYV-3fL1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 07:24:49 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251016072440epoutp011383b5e08beaa4451ccdf9a327f73803~u5_ZEk5jg2775127751epoutp01G
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 07:24:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251016072440epoutp011383b5e08beaa4451ccdf9a327f73803~u5_ZEk5jg2775127751epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760599480;
	bh=uvPq6Yt+OkoQhl8rEe9LIjf6WFzUTfhhECRiJsOl0Bc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=tbj63GWZxqzCPC8PYsOY+XfeMnVB0vOuEdTaZJXyo2jCzNkQkO0XOQUVZP/3CSqH/
	 6dCoAN/I+/NyXLfeyzKebRV1eserjrrQcIxzPZiiC7OygmKrNZkpzypobelJF7jOsC
	 IlGr+9k9jqqzKLd0OH584kP7OPTfBFkg7ipGewlM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20251016072439epcas2p263c9131a1e33874315c5c755bc31cbac~u5_Yjl-863251532515epcas2p2I;
	Thu, 16 Oct 2025 07:24:39 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.202]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cnKGH4Tdzz2SSKk; Thu, 16 Oct
	2025 07:24:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20251016072438epcas2p4c090c6e0433452e0ee061b115398dddf~u5_XoFJ9x2416724167epcas2p45;
	Thu, 16 Oct 2025 07:24:38 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251016072438epsmtip14a5e9c18ff706ff09ae7d4bf88c40cf5~u5_XimSB72023420234epsmtip1c;
	Thu, 16 Oct 2025 07:24:38 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Henrik Grimler
	<henrik@grimler.se>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] Add exynosautov920 thermal support
Date: Thu, 16 Oct 2025 16:24:26 +0900
Message-ID: <20251016072429.1933024-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251016072438epcas2p4c090c6e0433452e0ee061b115398dddf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251016072438epcas2p4c090c6e0433452e0ee061b115398dddf
References: <CGME20251016072438epcas2p4c090c6e0433452e0ee061b115398dddf@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_002447_538663_942E1166 
X-CRM114-Status: GOOD (  21.49  )
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

This patch series adds support for exynosautov920, automotive-grade
processor. Although the exynosautov920's TMU hardware differs slightly
from exisiting platform, its read and calibration logic closely follow
our legacy TMU interface. To prevent runtime and build time errors,
it is kept as a single change rather than being split.

This change merges the new exynosautov920-specific register definitions and
timing parameters into the exynos-tmu driver, ensuring consistent behavior
across all Exynos series. All new code paths have been tested on a
exynosautov920 board and verified to correctly read temperatures and
emulate behavior.

Changes in v7:
- Use lowercase hex for register address
- Dropped unnecessary 'minItems' from properties.
- Added restriction for 'clock-names'

Changes in v6:
- Add a reviewer for the thermal driver patch.

Changes in v5:
- Changed the maximum number of thermal sensors to 15.

Changes in v4:
- Kept 'addtionalProperties: false'.
- Removed the 'samsung,hw-sensor-indices' property in the binding.
- Added the 'samsung,sensors' property in the binding.
- Dropped code-like formatting and rewrote the description in plain,
  hardware-focused language in the commit message.
- Removed the bitmap and replaced the tz_count to sensor_count.

Changes in v3:
- Removed redundant commit message.
- Rephrased the sentences to describe the hardware clearly.
- Restricted sensor indices to V920.
- Set #thermal-sensor-cells per variant.
- Replaced 'additionalProperties' with 'unevaluatedProperties'.
- Removed the duplicate #define and use the original.
- Used lowercase hex in #define.
- Simplified 'temp_to_code' and 'code_to_temp' to one computation
  path by normalizing calib_temp.

Changes in v2:
- Replace the generic property with a vendor-specific one.
- Added an indices property instead of ranges.
- Shortened thermal node name and made them more generic.
- Updated the indices logic accordingly after removing the ranges property.

Shin Son (3):
  dt-bindings: thermal: samsung: Adjust '#thermal-sensor-cells' to 1
  thermal: exynos_tmu: Support new hardware and update TMU interface
  arm64: dts: exynosautov920: Add multiple sensors

 .../thermal/samsung,exynos-thermal.yaml       |  33 +-
 .../boot/dts/exynos/exynosautov920-tmu.dtsi   | 377 ++++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  31 ++
 drivers/thermal/samsung/exynos_tmu.c          | 322 +++++++++++++--
 4 files changed, 725 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi

-- 
2.50.1


