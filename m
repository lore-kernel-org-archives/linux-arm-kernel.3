Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C3FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 04:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=/rbB9Qe0PyGkKDgc61OqgDnmcVxYp84SH6KpmgRnDqk=; b=Pz6zUvusLBXqjrHN/iHkVDOyMB
	pOFxp1JP9F3QBgTx1bvYqwTQEKWJ2EC3iEDXehlgbvuSyb2f5uB6oPILRdBUkEW93TsyZVgECYCh/
	qdYOYJ199p6NcCx0U4xCQ+ntWZT5e8uDNtePalyD2EGFZzHKGR/f9DoA5gG4HPJRqGDNvlaI5jy5C
	vfFWzD9OP4ICXUKrk0DhQ5RbaMzNIPlGucqdQTWQv7LnFzZpCChpa2k7FZ1hnfNGiEPMBjf2X60vj
	XmWa/0XvDlNWz/ogkWR8UMTJ+eH6r4nm2JOCuSznGnLcyN5RgdlEXVhzg20lww96SGdPmUrLgEr2l
	pmYX/IWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Y1D-00000008lsC-2bX7;
	Mon, 22 Sep 2025 04:19:15 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Y18-00000008lql-2M5V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 04:19:14 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250922041903epoutp01c15f0c041fc3e3e8db8a5c29dab69285~nf9egY0bo1254112541epoutp01F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 04:19:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250922041903epoutp01c15f0c041fc3e3e8db8a5c29dab69285~nf9egY0bo1254112541epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758514743;
	bh=/rbB9Qe0PyGkKDgc61OqgDnmcVxYp84SH6KpmgRnDqk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=JFg9q5lp2AvZG+s2v9yqSJYiyLRqq5TGmjseJ4vuImH8CIb8ZNXzn5UmPJZ9F2Bru
	 rXLgQdtKScCD/c1Ry5UUKvrselcHHOD+EqC/h51o5zTypIkyrSsQEXRqCRmm7URsUo
	 BDmidaatle3pKocdAQ+O7/nUeluXcvC9lVV0M+hg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250922041903epcas2p26df62412d40a7074b3c1ff6923629832~nf9eF2NSc1765817658epcas2p2D;
	Mon, 22 Sep 2025 04:19:03 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cVVHB3pytz6B9mB; Mon, 22 Sep
	2025 04:19:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250922041901epcas2p2d3d164ea9421e57d9327f29782f955df~nf9c3FJsN1765817658epcas2p2C;
	Mon, 22 Sep 2025 04:19:01 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250922041901epsmtip2d12fca8c5826a6ab1078b93f6091d011~nf9cxel3W0606606066epsmtip2I;
	Mon, 22 Sep 2025 04:19:01 +0000 (GMT)
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
Subject: [PATCH v4 0/3] Add exynosautov920 thermal support
Date: Mon, 22 Sep 2025 13:18:54 +0900
Message-ID: <20250922041857.1107445-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250922041901epcas2p2d3d164ea9421e57d9327f29782f955df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250922041901epcas2p2d3d164ea9421e57d9327f29782f955df
References: <CGME20250922041901epcas2p2d3d164ea9421e57d9327f29782f955df@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_211911_257526_B2E01776 
X-CRM114-Status: GOOD (  18.37  )
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


