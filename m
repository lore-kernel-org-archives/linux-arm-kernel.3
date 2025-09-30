Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C81DCAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 00:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=9ogVqn3pQ7TBJXc/xpq6DvXIo0NamG6SUGhoitEXyNA=; b=1dsQnJ1sI9jvcB8QBRthL2jlDw
	ll+ipE5DRk19fPLrQNXQFvgWGAg7/XuHFRK3ijYfUE9a13+/sdMDOUzdopQz+U62mAiBW8bIaG6T0
	dwuSxU7U79avr/pSd/CXqsYd5Y2NUBM6iqpWqWd+n4sHecAl+xntPX9ac06stxUbo+Tj/x7I6A11f
	kM2XO+XUMyNgVPFMJ1Vs+9h6x31jaw8EMjno9ubXKNbP7/qbb/8258+Ay1Cm4EMm0b/AmFy3KhIIi
	8lcj9rLx444PqSktJbaSAfH0AqqwYHXkARENo2vTUg2jTFWfbr8Ey49M4ClvtuHqRwp2jx6mMWNC8
	0wggBtzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ObA-00000003jI3-16B9;
	Tue, 30 Sep 2025 00:52:08 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ob1-00000003jDA-2JOw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 00:52:04 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250930005149epoutp0280c428d2d5a1fb26416a31e4fabceef0~p6S0OVgZI2947529475epoutp02m
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:51:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250930005149epoutp0280c428d2d5a1fb26416a31e4fabceef0~p6S0OVgZI2947529475epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759193509;
	bh=9ogVqn3pQ7TBJXc/xpq6DvXIo0NamG6SUGhoitEXyNA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=F08kBBKZTdXZ9frtXPIw35melJSGt3EdS/fa2bTIZV3d0L8+rC/TtsmGffSmqtajL
	 SX+SyzGb1zTlJ4rcYGtMf1pDCGxi0ghsemeJpmafDw4E/Q9eV0mAa5POVxUMx/A3yb
	 Lg5tflLii6PnNpiMaEIICsnaTUqb1EknegRPJgN4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250930005148epcas2p13b5b5974d6039ca2c2edd6afbffeda4c~p6Sz0KEbz0653306533epcas2p1q;
	Tue, 30 Sep 2025 00:51:48 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.210]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cbKJN2W9nz6B9m9; Tue, 30 Sep
	2025 00:51:48 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250930005147epcas2p36e57d022e5c2df908550b920aafd41c0~p6Sy5o6091112811128epcas2p3r;
	Tue, 30 Sep 2025 00:51:47 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250930005147epsmtip25ee377061c0f74467dad29514b78c7f2~p6SyzpvRW1168411684epsmtip2C;
	Tue, 30 Sep 2025 00:51:47 +0000 (GMT)
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
Subject: [PATCH v6 0/3] Add exynosautov920 thermal support
Date: Tue, 30 Sep 2025 09:51:36 +0900
Message-ID: <20250930005139.1424963-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930005147epcas2p36e57d022e5c2df908550b920aafd41c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930005147epcas2p36e57d022e5c2df908550b920aafd41c0
References: <CGME20250930005147epcas2p36e57d022e5c2df908550b920aafd41c0@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_175159_906730_6C592973 
X-CRM114-Status: GOOD (  18.50  )
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

 .../thermal/samsung,exynos-thermal.yaml       |  32 +-
 .../boot/dts/exynos/exynosautov920-tmu.dtsi   | 377 ++++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  31 ++
 drivers/thermal/samsung/exynos_tmu.c          | 322 +++++++++++++--
 4 files changed, 724 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi

-- 
2.50.1


