Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65152C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=ZQy/46a1r4WAvJCApFWSuqNU0UpVfcMsny2biIWuzIE=; b=0lwJv0zz7qdZZYg5Xu/+7tW/kk
	mw+0ZsxFHV9kgQiqOqESuS6JtVUVGqr47/avmvv++RmSFbnWe3GIgJnxAjaf1+BvSrrw1iEk24q9T
	tjZ2Kcy0IYypzKangYlT5OUhKWvjEaL5WiPOjpcEO75wmcpk+vomWijySaNWdeR9Hg1FqvAEqAHLi
	fVLSCkIofoSFR7VE5GVbpAVwTgW4i1d2BHFJe78QTbyFHwc1CzAwTLT7wGh75q9hIMfOUtzwoYmXf
	z/2/QylmQWx8EBvTQch+0U7Xj4dhSMBy1OXXBnINDeigQcQbDtqHYc5kC0gYlm3u7rV8Rf3YEq2fG
	+NF8gqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NF7-0000000669F-3DVP;
	Mon, 28 Apr 2025 12:05:49 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mm3-00000005yfx-1312
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:35:49 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250428113542epoutp0266f5caad425d8b55b373ed83e2a3d9b0~6eFwIlo5t3276732767epoutp02K
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 11:35:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250428113542epoutp0266f5caad425d8b55b373ed83e2a3d9b0~6eFwIlo5t3276732767epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745840142;
	bh=ZQy/46a1r4WAvJCApFWSuqNU0UpVfcMsny2biIWuzIE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=qLE+atdfvx+n5SWRn7JsFqmzHNJ//U1CYtZgGz8AAeyVUdy4rHTn3e6s8m3Dmui6f
	 2mI4LYEAXr13RLgOluK7Fw/5L/i3cwDilxEqfbHTKS0QYL9Uq0X7b8pLXspxT2eUvB
	 zGmv1nc3YxCTbGkYIXIB1kwkj90eRJXK0UuiFdxo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250428113541epcas2p331f0e777d96484f7ba564ecefc90b0ee~6eFvcG5kd1257712577epcas2p3A;
	Mon, 28 Apr 2025 11:35:41 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZmLws1F5Hz6B9mD; Mon, 28 Apr
	2025 11:35:41 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250428113540epcas2p4f8a2d6b473bdf6d71bd598e71fbf70c9~6eFumfo862314123141epcas2p4T;
	Mon, 28 Apr 2025 11:35:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428113540epsmtrp10cc9cceaf7072612c17dcaf6e23a395c~6eFukg35O3152331523epsmtrp1S;
	Mon, 28 Apr 2025 11:35:40 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-b4-680f680c2a6f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BF.E1.08766.C086F086; Mon, 28 Apr 2025 20:35:40 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428113540epsmtip180298e4107d75a44133400bde6cb2844~6eFuUJxzT2534225342epsmtip1b;
	Mon, 28 Apr 2025 11:35:40 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Fix CPUCL0 add CPUCL1/2 clock support for exynosauto
 v920 SoC
Date: Mon, 28 Apr 2025 20:35:13 +0900
Message-ID: <20250428113517.426987-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSnC5PBn+GwYNN0hYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYjH5+FpWi6Zl65kc+D3e32hl99i0qpPNY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3
	S+DKWL3oAmPBTraKV7+fMTcwzmPtYuTkkBAwkXh69RWYLSSwm1FiUW8BRFxC4vCMCYwQtrDE
	/ZYjQDVcQDXvGSXe/10ElODgYBNQldj0Wx4kLiLwlkli+f8DTCANzAKnGSV2npEBsYUFQiV+
	nb8DFmcBqr9+bQc7iM0rYCWx5fMPNpA5EgLyEv0dEhBhQYmTM5+wQIyRl2jeOpt5AiPfLCSp
	WUhSCxiZVjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBIe7luYOxu2rPugdYmTiYDzE
	KMHBrCTCW2XAnyHEm5JYWZValB9fVJqTWnyIUZqDRUmcV/xFb4qQQHpiSWp2ampBahFMlomD
	U6qBSVQy7/Ry3+zAsAcBCRazXTPeGSwWiHrO1bf9Q9vDfb/yTC/cutahmF0nd3+/T+utNc/Y
	j561yHRJ6DOUTZXZ+WmZcUirfYH8phitXXbC2bFFqU/Zft83fXXkicL9zGiF35PWlFf55738
	/O3U+l8PhYOf/k23Oekx/Z6o8/z6nxNTWg9u2Ra3/e+OqYm6a9abMio46bl0eXgc8HedErdL
	cj1rzrK0unn1vYczj6ta770Q2rjNkkdD6pRxQMeusi6ngvM79VXaxO6rL/i0/P2UFUkzd7ez
	L/kf8kFnbkm5/IMSv+LcG+sveR1adZGpxOGprt6BBV2P0y9+s+daHb+jPHHKnMDwDSzeXvbN
	/wrjlFiKMxINtZiLihMBRaiOmeYCAAA=
X-CMS-MailID: 20250428113540epcas2p4f8a2d6b473bdf6d71bd598e71fbf70c9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113540epcas2p4f8a2d6b473bdf6d71bd598e71fbf70c9
References: <CGME20250428113540epcas2p4f8a2d6b473bdf6d71bd598e71fbf70c9@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_043547_913413_EF04BC24 
X-CRM114-Status: GOOD (  13.97  )
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

This patchset fixes the incorrect CLKS_NR_CPUCL0 definition and
adds the CMU_CPUCL1 and CMU_CPUCL2 block to support exynosauto v920 SoC.

Changes in v2:
- Separate the fix into its own patch
- Remove the extra blank line

Shin Son (4):
  dt-bindings: clock: exynosautov920: add cpucl1/2 clock definitions
  clk: samsung: exynosautov920: add cpucl1/2 clock support
  clk: samsung: exynosautov920: Fix incorrect CLKS_NR_CPUCL0 definition
  arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   |  44 ++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  26 +++
 drivers/clk/samsung/clk-exynosautov920.c      | 208 +++++++++++++++++-
 .../clock/samsung,exynosautov920.h            |  32 +++
 4 files changed, 309 insertions(+), 1 deletion(-)

-- 
2.49.0


