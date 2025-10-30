Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6720ECCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 07:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=uvPq6Yt+OkoQhl8rEe9LIjf6WFzUTfhhECRiJsOl0Bc=; b=Kjw3UGuulpClZV9C/rX30wGjtt
	tYmNiqI6nPT5A22m2OBXQmCbUylvNGr3bq8/e9HFJmEPhlgxHs5e9vXd3L/pBRVfUr1ZXXYL5sdcn
	jDPaqQqOBRyCTC/jaqiqlN/uTjlcq10g+dIlDcekfYS3yr6JZzeB3CGj9xrPMV3YbRFdr+DsVjbZb
	aat+mt00vFmPGBURyKXOLXP+KC0T+HYQHGlnBboSui/epBYIv17gLC147ah7EBtooPWL+/UrlZfMR
	CVl+MCXSPlLoKKstD6WyvyK4FRY1M/T0G1IV0hLT0W5pQxus0/3QvNqdXPlRhTvEZTIjZ6204YiU5
	RJdDdsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMkq-00000003bt3-1MHe;
	Thu, 30 Oct 2025 07:07:28 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMkn-00000003brb-1gPj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 07:07:27 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251030070718epoutp04addb5905b123b1b60bf1e556bf7f042c~zMxOYcZmr2617326173epoutp04E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 07:07:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251030070718epoutp04addb5905b123b1b60bf1e556bf7f042c~zMxOYcZmr2617326173epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761808038;
	bh=uvPq6Yt+OkoQhl8rEe9LIjf6WFzUTfhhECRiJsOl0Bc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=afV/eJCV+rFh3R/mlQoDAcHLUXn7Z50wN1PSYhOWG8bh1v6iBuNnrRVHJN6g9yaiD
	 95YKa7BVZsF8MLJ3c1FZqU6DddSx9LO18ZI+lgLG//RdAZ6KHN4HkFMc/Eu5o30shU
	 8Iqj6on+zVKEnCc4PN1e0aw6b4w/2mOrcNL9XTfo=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251030070717epcas2p459fa3e037e6be053b30578cd72357cf1~zMxN0FfIx1433014330epcas2p4o;
	Thu, 30 Oct 2025 07:07:17 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.200]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cxwCn2slcz6B9mG; Thu, 30 Oct
	2025 07:07:17 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251030070716epcas2p1e803662e313189f3886af41513cf47cd~zMxMoR2Vy1981519815epcas2p10;
	Thu, 30 Oct 2025 07:07:16 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251030070716epsmtip2f0ad5715c64ff0cffa6db3234f1ff1f6~zMxMihoKo0978709787epsmtip2K;
	Thu, 30 Oct 2025 07:07:16 +0000 (GMT)
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
Subject: [PATCH v7 RESEND 0/3] Add exynosautov920 thermal support
Date: Thu, 30 Oct 2025 16:07:09 +0900
Message-ID: <20251030070712.248065-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251030070716epcas2p1e803662e313189f3886af41513cf47cd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251030070716epcas2p1e803662e313189f3886af41513cf47cd
References: <CGME20251030070716epcas2p1e803662e313189f3886af41513cf47cd@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_000726_098517_56626E9C 
X-CRM114-Status: GOOD (  18.67  )
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


