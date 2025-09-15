Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBCECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 04:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=btKaJBlrNnrUR0+zJOQEy3Co8PN8ii1OF5xNJWEYFBk=; b=Zr3uMmL0lXjhj5wSFhvsCeMjEn
	iaxuDtz4migYKs33Wn7GoFFS7V/GAG4B8btsW5GdWwVk/EmcpP6ltpeaTYwdV3mSQYJt3AhHuYeCs
	CF0P5btqU+o6CdcqDU3/gqio0OxX7l4SEYvX6gDRoFyAjkSYSDMCOMwxcEFXt+sDa1IqoLR6/LqeH
	YAJ6888GiQD6mFfp+/oFw4Yt0XmtX195bh3VpLdpYVgAXe52mQg5szqQbRcaCl0MV2cyn9biwu5K8
	AFoqkEQ6iZkARVmbIhawim2GxKK8DKMnnSRy0XY2x2DqqQDvn+cxRswsm7FCI1F33+DXmQ2gLrP5G
	j/j0VWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy0VH-00000002jGJ-19dW;
	Mon, 15 Sep 2025 04:07:47 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy0VC-00000002jFT-1t5s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 04:07:45 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250915040736epoutp0484de184e448487ffdae9b514d923da0b~lWSe-yrEm0443504435epoutp04c
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 04:07:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250915040736epoutp0484de184e448487ffdae9b514d923da0b~lWSe-yrEm0443504435epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757909256;
	bh=btKaJBlrNnrUR0+zJOQEy3Co8PN8ii1OF5xNJWEYFBk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=hfFuUruAsZlkr8fXb8kb9pJVMcYmXdiNY1oIwltR5cC3S4YGpWpgxYy+Yx1zbEFyz
	 Db5qw/hCacPEyetWWnNOq6jV4Hc3bEhDVG57+utO3eL1tO/Cw+Ah/sfI5RRpa529Vg
	 khrGGNUGKzQni0MI3YodvNLyZ4reL/OJwVysoeko=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250915040736epcas2p118d7925c640c42f3435e05266b26f931~lWSeUBN5m2098120981epcas2p1b;
	Mon, 15 Sep 2025 04:07:36 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.102]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cQBMC3Qbdz2SSKg; Mon, 15 Sep
	2025 04:07:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250915040734epcas2p4746a8f668f570e362f65ae39cc9e11ef~lWSdKAssU0669406694epcas2p4K;
	Mon, 15 Sep 2025 04:07:34 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250915040734epsmtip10b64002befbd74060737ba3518b84b22~lWSdFILZ73237632376epsmtip1O;
	Mon, 15 Sep 2025 04:07:34 +0000 (GMT)
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
Subject: [PATCH v3 0/3] Add exynosautov920 thermal support
Date: Mon, 15 Sep 2025 13:07:12 +0900
Message-ID: <20250915040715.486733-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915040734epcas2p4746a8f668f570e362f65ae39cc9e11ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915040734epcas2p4746a8f668f570e362f65ae39cc9e11ef
References: <CGME20250915040734epcas2p4746a8f668f570e362f65ae39cc9e11ef@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_210742_811110_4C3AC57B 
X-CRM114-Status: GOOD (  15.40  )
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

This change merges the new exynosautov920-specific register definitions and
timing parameters into the exynos-tmu driver, ensuring consistent behavior
across all Exynos series. All new code paths have been tested on a
exynosautov920 board and verified to correctly read temperatures and
emulate behavior.

Changes in v3:
- Removed redundant commit message.
- Rephrased the sentences to describe the hardware clearly.
- Restricted sensor indices to V920.
- Set #thermal-sensor-celss per variant.
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
  dt-bindings: thermal: samsung: Add a hw-sensor-indices property
  thermal: exynos_tmu: Support new hardware and update TMU interface
  arm64: dts: exynosautov920: Add tmu hardware binding

 .../thermal/samsung,exynos-thermal.yaml       |  40 ++-
 .../boot/dts/exynos/exynosautov920-tmu.dtsi   |  97 ++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  31 ++
 drivers/thermal/samsung/exynos_tmu.c          | 324 ++++++++++++++++--
 4 files changed, 453 insertions(+), 39 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi

-- 
2.50.1


