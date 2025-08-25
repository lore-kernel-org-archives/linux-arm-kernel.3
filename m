Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF04FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 06:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=BvCmax7ffb3cXbAcpyJB3pHTDlaFx7rbmUGg3s54BhU=; b=AqhcngPHoWJuaTLuXQ7M6IlA5v
	hAr+RF4b7Kl3k5Jj+N+/ph9FzUIIne0/ShEwZJ29wSYRwVOmgX2y/nu53j5Va3acyfbfE6SjZ595/
	Bh97S3N78UznzjK8VoSggBS1I0j4jgeuOnr+yTGCB/E/vhGBKXS9MRKHYWArNgVdDwyIKpP2QQ+Xu
	HbJ4T7IMBvGiNU6MI6BW858xuRDV26sp/yGOaR5gpxKZmw7DDbOMuyd6XdAK2KNTB9o37O3VcCFM3
	9fEYjnKWKLB0jQaM9nY9Lb5LjBlZrUoeo9UwY1xYuxZgDJBnSx4yxhqhLXSxFqjdyGvelBaf4D+fF
	am1oBjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR6N-0000000758w-1sdd;
	Mon, 25 Aug 2025 06:54:47 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR1S-000000074H2-28Bh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 06:49:45 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250825064935epoutp03e713444abbdc99becfdbd31ff3027eb8~e786q20cR2094220942epoutp03R
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 06:49:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250825064935epoutp03e713444abbdc99becfdbd31ff3027eb8~e786q20cR2094220942epoutp03R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756104575;
	bh=BvCmax7ffb3cXbAcpyJB3pHTDlaFx7rbmUGg3s54BhU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Uz8SK3iKcH3r2j4BEnzA0IjAtagCHegDJNfSIMtrcsiUPHGm7IKSoG5mbdAIY8HQD
	 7zOikww4xXtW1PpGqwAGgTLICJbTksrYKX+FGHIz5qpzfie0fPNObHpu8Z/H5Ot2GB
	 OnV7Vhtp1d63OLe8eYU9fEHT+wFEZYTxLrCtPV2c=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250825064934epcas2p3d2a77215f5e4ca5413e5ae1529090e68~e786FGRi72272422724epcas2p3R;
	Mon, 25 Aug 2025 06:49:34 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.99]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9Lxp2fslz6B9mF; Mon, 25 Aug
	2025 06:49:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250825064933epcas2p37665fae32f51b04a43e5395d76759143~e784xdhu70900609006epcas2p3a;
	Mon, 25 Aug 2025 06:49:33 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825064933epsmtip128240768c19a2d7ff622f42d9a52d82d~e784qqAbX0875908759epsmtip1f;
	Mon, 25 Aug 2025 06:49:33 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add exynosautov920 thermal support
Date: Mon, 25 Aug 2025 15:49:26 +0900
Message-ID: <20250825064929.188101-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250825064933epcas2p37665fae32f51b04a43e5395d76759143
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825064933epcas2p37665fae32f51b04a43e5395d76759143
References: <CGME20250825064933epcas2p37665fae32f51b04a43e5395d76759143@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_234944_013130_B5480CCE 
X-CRM114-Status: GOOD (  15.01  )
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

Shin Son (3):
  dt-bindings: thermal: samsung: Add tmu-name and sensor-index-ranges
    properties
  thermal: exynos_tmu: Support new hardware and update TMU interface
  arm64: dts: exynosautov920: Add tmu hardware binding

 .../thermal/samsung,exynos-thermal.yaml       |  23 +-
 .../boot/dts/exynos/exynosautov920-tmu.dtsi   |  92 +++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  34 ++
 drivers/thermal/samsung/exynos_tmu.c          | 336 ++++++++++++++++--
 4 files changed, 447 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi

-- 
2.50.1


