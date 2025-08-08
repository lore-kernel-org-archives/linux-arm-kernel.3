Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D30C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=0+FDQ3+MGzQg8h5mRrPUliafyK3G6MDAXRWQfJde8Gc=; b=c3jAgpaamnGDx6Y9Nquil+KfhP
	9MDOzgkL2END/Ttjq9O3pjJ//uEIEEOXvsE30Ja9Nj50qHiSHGYTU5vtLvG2U0XkFnaLdJ7slmREx
	IVYAsKNWk+kUbYf1+037YqYekJ/bn8sAuww+ZKcmBg3d1sqtRzi+werQ9abKsgrxcu5BT9rk2kbk2
	QYgBjffUnxPeEMTrFpLPhIBB3elW59iI95WFpCreGeW26pfDDm4bub0H9LEwHVLDnfl8QpLjApbGz
	MQIm1ggZ4lXyq671hI/k9YnzyTu2Ey5APO9JRS4UDWUpR2nwwepZUYPgzgOuTF0xpAJu2WPwwY8hw
	l+JXNSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNux-000000030aR-1Bur;
	Fri, 08 Aug 2025 14:17:59 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNsN-000000030Ec-2xj0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 14:15:22 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250808141513epoutp04b54346716391a18265497fccc3314f70~Z0EJk3Hh72099320993epoutp04E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  8 Aug 2025 14:15:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250808141513epoutp04b54346716391a18265497fccc3314f70~Z0EJk3Hh72099320993epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754662513;
	bh=0+FDQ3+MGzQg8h5mRrPUliafyK3G6MDAXRWQfJde8Gc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=WAZq5hDlyEVJI9YNXcitPsrrl6QLpjmt3Nj+Yf06ScwrhQ0for3oCa1DbXPisSRV+
	 mzRIseXpE9kD6Lr0b9Vg1eXuAlSfJAk4SDFYUbaUWzW8QsHIYIE9cE+s2HNlIQDOM7
	 a/8dalKt+Ww9MbwyREM0bya0V7spsGK+WybAsDIA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250808141512epcas5p25cffc721f85d95f66d802884d8e287a1~Z0EIZGIZz2897228972epcas5p2v;
	Fri,  8 Aug 2025 14:15:12 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bz5dq1Zrmz6B9m5; Fri,  8 Aug
	2025 14:15:11 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c~Z0B5s6nON3267932679epcas5p4q;
	Fri,  8 Aug 2025 14:12:38 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250808141236epsmtip2173602d1d6a8fabf184ef84cb9d8e79d~Z0B3ZH34k1965319653epsmtip2x;
	Fri,  8 Aug 2025 14:12:36 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dev.tailor@samsung.com,
	chandan.vn@samsung.com, karthik.sun@samsung.com, raghav.s@samsung.com
Subject: [PATCH v1 0/3] Add clock support for CMU_M2M
Date: Fri,  8 Aug 2025 19:51:43 +0530
Message-Id: <20250808142146.3181062-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c
References: <CGME20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_071521_036948_1C66DE8D 
X-CRM114-Status: GOOD (  10.72  )
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

Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add m2m clock definitions
  clk: samsung: exynosautov920: add block m2m clock support
  arm64: dts: exynosautov920: add cmu_m2m clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 13 ++++++
 drivers/clk/samsung/clk-exynosautov920.c      | 45 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++
 4 files changed, 84 insertions(+)


base-commit: b7d4e259682caccb51a25283655f2c8f02e32d23
-- 
2.34.1


