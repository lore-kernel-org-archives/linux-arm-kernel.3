Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D10C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=fS6WP64nxk5RGLAeXo0j9rsjSAjpHA9bB1CIdrtYv24=; b=euKhrry5PLGnpN4CW4Sm1WdMOF
	kt/HyM0nvJu1+Zl5r6t1clsTCCOOY7Ht6xjZEj8iA07e+uw8aHSc5lrYEqawRPNh70IqmX0Ltb4Ly
	hPuV/zodAYaKvjUkJ7OSaojpZeTMBgLPPocyqPQYrDywmfrR6jOxcxzqj6EFMBSokCyTBg2z1rFZJ
	vWbsO4+8rwf3gJs6eiZ+RJzroqvJSINVQD4o1xog1GHwabHYESHfIwckn8Cq6qVcCISeH0DC9ssjs
	RxMKzDW+WGsKptTmPvFLYBXeUvk8GlBGE6qdNenEjSaowgwsmJAqAIKDFvAhHaJuz00nyZg+zajVe
	gTq7kfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDIK-0000000FRwc-0lxN;
	Wed, 14 May 2025 14:41:16 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXK-0000000FGhX-2VVw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 13:52:46 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250514135234epoutp03c5f3cc9bd5b68584e0343f2f0eee1f00~-aR06H1NA2537625376epoutp03V
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 13:52:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250514135234epoutp03c5f3cc9bd5b68584e0343f2f0eee1f00~-aR06H1NA2537625376epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747230754;
	bh=fS6WP64nxk5RGLAeXo0j9rsjSAjpHA9bB1CIdrtYv24=;
	h=From:To:Cc:Subject:Date:References:From;
	b=lLkhrenpf4Ang8OJcMujjFvGUsmln4m5a0oWv9u2tKHHC8Q+egyTspbQWDmdF0+iX
	 ZG2sijOPbFyVC0MAD4gfvJG5qqJrnqOBvgggrIh+RQSVkoGt3q2lN9Xrx1vsecUSwd
	 qJLNgnGpZgebvt0EJedbmnQecu88JePj0s30AGEU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250514135233epcas5p2cd9c912a0768e52b0bb584a54b97caca~-aR0NkYDl1501215012epcas5p2p;
	Wed, 14 May 2025 13:52:33 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.178]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZyFCN0GBvz3hhT3; Wed, 14 May
	2025 13:52:32 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250514095233epcas5p3f51037e71e60a1e690709f8497606385~-XAQ6OqjD2612726127epcas5p3Q;
	Wed, 14 May 2025 09:52:33 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095233epsmtrp1fbfec6ef430e6f4547e13f7a873b93dd~-XAQ3FzyG1927519275epsmtrp1D;
	Wed, 14 May 2025 09:52:33 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-01-682467e1cbba
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	5E.35.19478.1E764286; Wed, 14 May 2025 18:52:33 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514095230epsmtip2a60aed22479ca7753f78aa377417c155~-XAOEOn-v1808418084epsmtip2i;
	Wed, 14 May 2025 09:52:30 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	sunyeal.hong@samsung.com, shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	dev.tailor@samsung.com, chandan.vn@samsung.com, karthik.sun@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v2 0/3] Add clock support for CMU_HSI2
Date: Wed, 14 May 2025 15:32:11 +0530
Message-Id: <20250514100214.2479552-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSvO7DdJUMgztrFC0ezNvGZjHhS4TF
	mr3nmCyuf3nOanFvxzJ2i/lHzrFaNM54w2Rx/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlc
	POVqcWyBmMX3lXcYLY6cecFs8X/PDnaLw2/aWS3+XdvIYjH5+FpWi6Zl65kcRD3e32hl99g5
	6y67x6ZVnWwem5fUe/RtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfGu8ehBW/4Kv6v2MzewLie
	p4uRk0NCwESib/Vi1i5GLg4hge2MEl8+HWSBSEhI7Pv/mxHCFpZY+e85O0TRW0aJ9xMPMoMk
	2AS0JK5sf8cGkhAR6GKSOPfvFVg3s8BOJomV6yVAbGEBM4llV9aCxVkEVCV6zs9kArF5Bawl
	blzvhdomL7H/4FlmiLigxMmZT6DmyEs0b53NPIGRbxaS1CwkqQWMTKsYRVMLinPTc5MLDPWK
	E3OLS/PS9ZLzczcxgqNFK2gH47L1f/UOMTJxMB5ilOBgVhLhvZ6lnCHEm5JYWZValB9fVJqT
	WnyIUZqDRUmcVzmnM0VIID2xJDU7NbUgtQgmy8TBKdXANN8ieoat3X+PUqv5T9+yX46yWOGQ
	HnJvxnfP13qP5IzEJe/kK+f3/F///LV+1ifVnjIPhzCxxTLMK9SX9TXuvsniW7i4ckb8HKfE
	Td86dlj5++1SFDu6+a/woY5o3qppWdyC0u81d2gvYZSza7n7jnH/qbSjniEbeZ7f35G7YF/7
	p2/PL+kuedCfdav5q/LXxqdVj/YWdeY0fWnxEDEXFYv3ndwz4+LiymKez22RUyNr/I13rutf
	1MDjXnJD59acx2p/9l2ds+f+kbNq9SLOZj6vGdxv5jkk7xVpqNRpU2Y+nbFso6zfW3aZFrb9
	LAl/XhxrrO29qHsj3n5DiczR48tvRj4ofSe7yYJp9dY5SizFGYmGWsxFxYkAP1DrSAUDAAA=
X-CMS-MailID: 20250514095233epcas5p3f51037e71e60a1e690709f8497606385
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095233epcas5p3f51037e71e60a1e690709f8497606385
References: <CGME20250514095233epcas5p3f51037e71e60a1e690709f8497606385@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_065243_529358_2AFBDE42 
X-CRM114-Status: GOOD (  17.19  )
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

This series adds clock support for the CMU_HSI2 block.

Patch[1/3]: dt-bindings: clock: exynosautov920: add hsi2 clock definitions
        - Adds DT binding for CMU_HSI2 and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block hsi2 clock support
        - Adds CMU_HSI2 clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_HSI2 clock DT nodes
        - Adds dt node for CMU_HSI2

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
Changes in v2:
- Added cover letter with the patches
- Submit the patches as a series as they are inter-dependent
  as pointed by Krzysztof Kozlowski

Links to v1:
[1/3]: https://lore.kernel.org/all/20250509132414.3752159-1-raghav.s@samsung.com/
[2/3]: https://lore.kernel.org/all/20250509131210.3192208-1-raghav.s@samsung.com/
[3/3]: https://lore.kernel.org/all/20250509125646.2727393-1-raghav.s@samsung.com/

I also got warning about build failure from robot
Link: https://lore.kernel.org/all/202505100814.gnMY3LoZ-lkp@intel.com/ 

As the fix is  just a new version of
the same patch/commit, there is NO need to add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100814.gnMY3LoZ-lkp@intel.com/

So for now, not adding Reported-by: tag

Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add hsi2 clock definitions
  clk: samsung: exynosautov920: add block hsi2 clock support
  arm64: dts: exynosautov920: add cmu_hsi2 clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 29 +++++++-
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 17 +++++
 drivers/clk/samsung/clk-exynosautov920.c      | 72 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  9 +++
 4 files changed, 125 insertions(+), 2 deletions(-)


base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
-- 
2.34.1


