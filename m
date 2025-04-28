Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3EDC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=ZQy/46a1r4WAvJCApFWSuqNU0UpVfcMsny2biIWuzIE=; b=tEkw3wb8v0CBP9vm1NoGMD6evu
	PVaZWxByboj7c/uVjLVFcWcpWBVje5/ivdZkFqhbcwDHjXU9sYg4+gWSnMr8JGA/KqwaVmItRDguT
	mL27mvecBplDZbCpDrLkr1xBtiwW1EOINRyFCQWT0xEiNiV0J7iMBbBPdsPgQhDthRgrQdVqUJCR1
	xoHVd5ZhTdgVA9TZ2cjygvusCZnuB0oBJ9N5WxNUsJ7LnerJLpzPHn6h7ZhQB1fgqsJphs5vycweB
	QfuhUzDMTb20sStDrWiYPgWYyr4yv0owO90IQsF1GHAgP/08PCgsnvRhx5H4WfJjA0CXwbl9cB5hx
	t1WAp+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NBE-000000065Dl-366I;
	Mon, 28 Apr 2025 12:01:50 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mgo-00000005xgn-2aCZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:30:24 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250428113010epoutp049a6e99bf69f7203ef9753758a8bd9bb8~6eA62Ivwg1743817438epoutp04n
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 11:30:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250428113010epoutp049a6e99bf69f7203ef9753758a8bd9bb8~6eA62Ivwg1743817438epoutp04n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745839810;
	bh=ZQy/46a1r4WAvJCApFWSuqNU0UpVfcMsny2biIWuzIE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OFdW8aC1+zv0YZ0OsW6E0VMV3Yl7wSORCpL/RC+6+jYEVPAWwHdurf5XYBfSmEGSN
	 l1b4qH0jRPa1p8wIysBhd1XiYtwvLFfCmGUX+al6fEXs53sX4eJFBzr3id8ACFs+dS
	 YLa6BpaWr/qBAl5vavOiXO76sAlkvCZuvM+LLbSs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250428113009epcas2p2f7a8cb332fc766d0a47a30fa93c12268~6eA6Ntvek0100801008epcas2p2N;
	Mon, 28 Apr 2025 11:30:09 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmLpT0y8pz3hhT7; Mon, 28 Apr
	2025 11:30:09 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250428113008epcas2p327275651c8869ee5a113eda2f2ec1d30~6eA5Q6Qmo2967129671epcas2p3F;
	Mon, 28 Apr 2025 11:30:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250428113008epsmtrp125683d16bb59170d7f0ca1f815620940~6eA5PPu1n2934329343epsmtrp1S;
	Mon, 28 Apr 2025 11:30:08 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-4c-680f66c05646
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6D.81.08766.0C66F086; Mon, 28 Apr 2025 20:30:08 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250428113008epsmtip2cb6934ace77da911c6152dedc507572a~6eA4-N9DR1092810928epsmtip2R;
	Mon, 28 Apr 2025 11:30:08 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Fix CPUCL0 add CPUCL1/2 clock support for exynosauto
 v920 SoC
Date: Mon, 28 Apr 2025 20:28:54 +0900
Message-ID: <20250428112858.82434-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSvO6BNP4Mg1nThC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CVsXrRBcaCnWwVr34/Y25gnMfaxcjJISFgIvHj93PGLkYuDiGB3YwS626vYIdISEgcnjGB
	EcIWlrjfcgSsQUjgPaPEifllXYwcHGwCqhKbfsuD9IoIvGWSWP7/ABNIDbPAaUaJnWdkQGxh
	gVCJf7vesIHYLED1rbv/gs3hFbCUOLDgECPIHAkBeYn+DgmIsKDEyZlPWCDGyEs0b53NPIGR
	bxaS1CwkqQWMTKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYLDXUtzB+P2VR/0DjEy
	cTAeYpTgYFYS4a0y4M8Q4k1JrKxKLcqPLyrNSS0+xCjNwaIkziv+ojdFSCA9sSQ1OzW1ILUI
	JsvEwSnVwBQ1c9eN5POvXd8vOtfXrLpCqnAp14mv9uockzzn7FefupYxW2zO6gs2m84942vM
	+jqjveP1sQW1nu2T/sgtElu2fdKmusI5/UV+a6I+2fXMm7XEYBvLLfFfwYJNfZO5Fk94r5om
	nrSdZbf9lG2TftVeuCujMuWtsAt3wm+JKxxRjA+8qnednz8pOFDR9kTOBsULST4tH21DfSZP
	fFLg5topfpfbK1PbI7CJgeW+wO+JchFTp8nY/3haInf23EST1Xd143m4WpTPPWS/WlbPI3Pp
	e/xrBXve2N13315rbp23b75tYJfdO7aI+exfvma4xYlI8b18qlCvYLr4V0FR/nNN9SMnQ9nU
	pct/rLLJdVBiKc5INNRiLipOBACoSUGg5gIAAA==
X-CMS-MailID: 20250428113008epcas2p327275651c8869ee5a113eda2f2ec1d30
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113008epcas2p327275651c8869ee5a113eda2f2ec1d30
References: <CGME20250428113008epcas2p327275651c8869ee5a113eda2f2ec1d30@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_043022_960492_E04B7239 
X-CRM114-Status: GOOD (  14.06  )
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


