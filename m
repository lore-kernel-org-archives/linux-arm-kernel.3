Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301A8CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=QkNp9D58yMqtTX6qAnEQLm2JGIov8tcrreWJNSP4Fj8=; b=U1GdhAtbAADBmtQuSfBqTU0qCu
	dogUssk5jL1E1r3mP6Wahnn5Z/StTCai8cftsBF5GsyXYf1YWH+mj1N4HHVx/W1tUpoH4ufc7x4VS
	VKiaxt2O1tIkYGpgw06jCAg6VCVdzY8Au2HR8nTfnMapJnVcP6NlmaIQyAEeK+JSCbb10ZRFpT5ws
	CCGh7rwYmxfzkoxJ647KZ+/Q1g3EiSHqwFWSi9J7t6ZPWSqNJkuqG3iGIU4nT6UeUpNNjaNyDb4Mb
	M1ZnCspwHAAGqDkG4rD/ggMHz4GDc2Cw/Wu6jE+K2UbI3UPF13H7jtIfTI7cVX9Bv1IGcBhskw69k
	qyXP+w1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5lz-00000003VnN-1QhK;
	Mon, 15 Sep 2025 09:45:23 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5lt-00000003Vl8-32vr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:45:21 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250915094512epoutp0137106f60d60adf841ba0afa24d94aa7a~la5PWCjfi2301323013epoutp01i
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:45:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250915094512epoutp0137106f60d60adf841ba0afa24d94aa7a~la5PWCjfi2301323013epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757929512;
	bh=QkNp9D58yMqtTX6qAnEQLm2JGIov8tcrreWJNSP4Fj8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=VQuL5rpjpyZIowM8MYwNifukSNfosTYhNSMeVD0np2LNEjCkOm6I7w2EtFp2XyY4q
	 zbnc8tNks2fBQ9wlqvcq988+qLTQc9iYCD/vvQpSoRWfKdVg+fDbc2qYn/+86xE0yW
	 KGIEa2UTXb+qZUvHnUHuN0Yn5zGspo9JLTINlCpo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250915094511epcas5p1ae78bac20f275fe9253e89b3ff86c2c5~la5OwEWup0088700887epcas5p1v;
	Mon, 15 Sep 2025 09:45:11 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cQKrk4pRZz6B9m5; Mon, 15 Sep
	2025 09:45:10 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250915094509epcas5p355b63f77800068afa6b891068080cde7~la5MwJfOc0109001090epcas5p3f;
	Mon, 15 Sep 2025 09:45:09 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250915094506epsmtip273b178251cb71880f5f6d2a6befb0743~la5KWSHiC0834508345epsmtip2O;
	Mon, 15 Sep 2025 09:45:06 +0000 (GMT)
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
Subject: [PATCH v2 0/3] Add clock support for CMU_M2M
Date: Mon, 15 Sep 2025 15:23:58 +0530
Message-Id: <20250915095401.3699849-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915094509epcas5p355b63f77800068afa6b891068080cde7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094509epcas5p355b63f77800068afa6b891068080cde7
References: <CGME20250915094509epcas5p355b63f77800068afa6b891068080cde7@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_024519_216033_8025936E 
X-CRM114-Status: GOOD (  14.76  )
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

This series adds clock support for the CMU_M2M block.

Patch[1/3]: dt-bindings: clock: exynosautov920: add m2m clock definitions
        - Adds DT binding for CMU_M2M and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block m2m clock support
        - Adds CMU_M2M clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
        - Adds dt node for CMU_M2M

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
Changes in v2:
-Fixed the dt binding checks warning

Link to v1:
https://lore.kernel.org/all/20250808142146.3181062-1-raghav.s@samsung.com/

Got a comment from Krzysztof Kozlowski
Link: https://lore.kernel.org/all/f8ad7883-d879-47ce-aafc-7c5f741f3c18@kernel.org/

Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add m2m clock definitions
  clk: samsung: exynosautov920: add block m2m clock support
  arm64: dts: exynosautov920: add cmu_m2m clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 13 ++++++
 drivers/clk/samsung/clk-exynosautov920.c      | 45 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++
 4 files changed, 84 insertions(+)


base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
-- 
2.34.1


