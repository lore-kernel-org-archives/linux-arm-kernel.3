Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8E4CF31AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=DFjfFU0/pVrO5ht5F9eEWORDMXGICruazYbhvrUKrXI=; b=hhNjEiOoY6H3bZgZywJSL24QtS
	IMZ8yktZspKFSFR9UudXBaVAj46dysPjsuc+PXlIuJ65m1jyDvxb1vf19wmyUnXCFqz+/NKPf7W8C
	MpnXu7M4LnoFi0fYte8nwACU15IgdU5uFMEqpx1xH9xHkDqSFjs6M7zhTCPa8FlsE0Uk+tpkT5Nll
	+7QE9hhyplbmfZqec37eabYo2jPHChwDQfKKE/NStAkiyqtczsPSjFK/8gtbL/7gIsfA7d0LLK6Fj
	LcAhOTm0LsI7uu6bFEFFFXwDXZ3rWQO1gK7wu6NbEoXA2zrJn8seg4VvXYh5JdYMRgQDkILi97e/i
	GcISCeXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgX8-000000032vl-2Ah2;
	Wed, 19 Nov 2025 11:39:34 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgX5-000000032un-2LCK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:39:33 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251119113924epoutp04f451f24f407ccd6b005071eae9304c57~5ZYgil40b0103701037epoutp04d
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 11:39:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251119113924epoutp04f451f24f407ccd6b005071eae9304c57~5ZYgil40b0103701037epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763552364;
	bh=DFjfFU0/pVrO5ht5F9eEWORDMXGICruazYbhvrUKrXI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=LRT0rFXKQLPEuntx3P1ZpnZYt0p+z3qBBuEmjuXwoKGlZONLwgVU2MssWllTxWlbe
	 ZMRSopoqtS9FVf6WQj4AZuTxoF2baoQlCAdxOzjwD15vXAR0IjrX+RGegH4mbVoaoh
	 4CAJQdlAz+CpgmpDZGpDJWMosADiGoRuFbqjE5Y8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251119113923epcas5p46294f421ab29108220250921d24c418a~5ZYf_5Ym50922909229epcas5p4Z;
	Wed, 19 Nov 2025 11:39:23 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dBKJW1Bwsz6B9m5; Wed, 19 Nov
	2025 11:39:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef~5ZYeth24o0409104091epcas5p1i;
	Wed, 19 Nov 2025 11:39:22 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119113918epsmtip14f510d62705d865d66df7e6c0a679acb~5ZYbOM7zY0198401984epsmtip17;
	Wed, 19 Nov 2025 11:39:18 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH 0/3] Add clock support for CMU_MFD
Date: Wed, 19 Nov 2025 17:17:41 +0530
Message-Id: <20251119114744.1914416-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef
References: <CGME20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_033932_089355_4F54A412 
X-CRM114-Status: GOOD (  11.03  )
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

This series adds clock support for the CMU_MFD block.
MFD stands for Multi-Format Decoder

Patch[1/3]: dt-bindings: clock: exynosautov920: add mfd clock definitions
        - Adds DT binding for CMU_MFD and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block mfd clock support
        - Adds CMU_MFD clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_MFD clock DT nodes
        - Adds dt node for CMU_MFD

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add mfd clock definitions
  clk: samsung: exynosautov920: add block mfd clock support
  arm64: dts: exynosautov920: add cmu_mfd clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 19 +++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 11 +++++
 drivers/clk/samsung/clk-exynosautov920.c      | 40 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  4 ++
 4 files changed, 74 insertions(+)


base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
-- 
2.34.1


