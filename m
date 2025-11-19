Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1BDCF34B5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1S7tTJAGx8X1EU34gb6ZrEUZYE/FdslFurqubAmzMPs=; b=4KT4ft2J4ooQ3Qd8qplARt66Sa
	ohSSgPZ+Uc2hP1QWIrKqmubBq+m3BmNW6s5AHA80W4XTgBKHXl1/dHWQ2b1o5ExTBxFUBWBtHNZDe
	8fu5zc1SWEzMb4HM+TDGQmDyIO6Iqy07gGkjT4VKnjc84viVGzVil18i68bnUrlr6vpHZwKPxcGx2
	pZP2zyjtznqAh1QlQw0bAY70mzKSMj24oqX/77NzN1poPcaTrg//N18RO1JmMWhrq5NbP0+IO5hNK
	ZvRalDXdUYdqebcTnbZMA+NKQVHPJDH5KVzt2sRZuKFQEmpKVIMlLxH9ngHj7Xsf0ZZ+yHz/8L+U6
	h3LXg13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiwO-00000003M0p-34Oa;
	Wed, 19 Nov 2025 14:13:48 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiwL-00000003Lzw-2xzL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:13:47 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251119141339epoutp0216d4062f01ee5b108c44e326c76dd5d4~5bfMVCkw71213912139epoutp02j
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 14:13:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251119141339epoutp0216d4062f01ee5b108c44e326c76dd5d4~5bfMVCkw71213912139epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763561619;
	bh=1S7tTJAGx8X1EU34gb6ZrEUZYE/FdslFurqubAmzMPs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=JQjfe2qGkL6exHWlU2EeFzu3tnLxZc3SCExfEHPptu6yh3Pv2QovgHi5Exv+wcqIn
	 UufyXhJUi6O0iAUOouyJustlEaYiL/9ZsbhtjWpwnu5WPxA9AmFJCRJkqQfdDyFNiS
	 xw24ThVIzhzEMRM175+FmVpBfjjCsEfNKRJv8uaI=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251119141339epcas5p24b187482617982dd3b7f9612e2bcae08~5bfLqcXcF3126631266epcas5p2q;
	Wed, 19 Nov 2025 14:13:39 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dBNkV1bksz6B9m7; Wed, 19 Nov
	2025 14:13:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251119141337epcas5p2d2164b21347c47f951bf0a1fa13f4fb7~5bfKAfLHK3126631266epcas5p2m;
	Wed, 19 Nov 2025 14:13:37 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251119141329epsmtip256bd93a175b81fa594cd342d022c26fc~5bfCatMzG3230632306epsmtip2Q;
	Wed, 19 Nov 2025 14:13:29 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<jesper.nilsson@axis.com>, <lars.persson@axis.com>,
	<alim.akhtar@samsung.com>
Cc: <ksk4725@coasia.com>, <smn1196@coasia.com>, <linux-arm-kernel@axis.com>,
	<krzk@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <bread@coasia.com>, <jspark@coasia.com>,
	<limjh0823@coasia.com>, <lightwise@coasia.com>, <hgkim05@coasia.com>,
	<mingyoungbo@coasia.com>, <shradha.t@samsung.com>, <swathi.ks@samsung.com>,
	<kenkim@coasia.com>, <kitak81.kim@samsung.com>
In-Reply-To: <20251119131302.79088-1-ravi.patel@samsung.com>
Subject: RE: [PATCH v2 0/3] Add basic device tree support for the Axis
 ARTPEC-9 SoC
Date: Wed, 19 Nov 2025 19:43:26 +0530
Message-ID: <03ee01dc595e$b2a3cf30$17eb6d90$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFoEMcjarJV4Z6YO4Zds6s0TR8sjQFTOXLytdgBLzA=
Content-Language: en-in
X-CMS-MailID: 20251119141337epcas5p2d2164b21347c47f951bf0a1fa13f4fb7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714
References: <CGME20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714@epcas5p4.samsung.com>
	<20251119131302.79088-1-ravi.patel@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_061346_063194_8AE44522 
X-CRM114-Status: GOOD (  22.38  )
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

Forgot to add clock and pmu bindings which are listed below:
- https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=for-next&id=11cfb42e9e1a3fb641137e0033f10a5263d3d751
- https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=for-next&id=dfb59d7319915926a5606ffbccdb924b09f08cdb 

Thanks,
Ravi

> -----Original Message-----
> From: Ravi Patel <ravi.patel@samsung.com>
> Sent: 19 November 2025 18:43
...
> Subject: [PATCH v2 0/3] Add basic device tree support for the Axis ARTPEC-9 SoC
> 
> Add basic device tree support for the Axis ARTPEC-9 SoC
> which contains 6-core Cortex-A55 CPU and other several IPs.
> This SoC is an Axis-designed chipset used in surveillance camera products.
> 
> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> 
> This patch series includes below changes:
> - Bindings document update for ARTPEC-9 board (patch #1)
> - Device tree for ARTPEC-9 board (patch #2 and #3)
> 
> The patch series has been tested on the ARTPEC-9 EVB with
> Linux Samsung SoC tree (for-next branch) and intended
> to be merged via the `arm-soc` tree.
> 
> Pinctrl and UART DT-bindings are present in another patches which are listed below:
> - https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git/commit/?id=e671a1bb5d1cf9ca4dbab61b9a3e1e77579f99ba
> - https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=85f17e130dc7189acf03eb0f8e2455c4ea2c4f9e
> 
> ---
> Changes in v2:
> - Decouple the device tree related patches which was present in v1 (Patch #5 to #7)
>   Device tree related patches will be sent in separate series.
> 
> Link to v1: https://lore.kernel.org/linux-samsung-soc/20250917085005.89819-1-ravi.patel@samsung.com/
> ---
> 
> Ravi Patel (2):
>   dt-bindings: arm: axis: Add ARTPEC-9 alfred board
>   arm64: dts: axis: Add ARTPEC-9 Alfred board support
> 
> SungMin Park (1):
>   arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support
> 
>  .../devicetree/bindings/arm/axis.yaml         |   6 +
>  arch/arm64/boot/dts/exynos/axis/Makefile      |   3 +-
>  .../boot/dts/exynos/axis/artpec9-alfred.dts   |  36 +++
>  .../boot/dts/exynos/axis/artpec9-pinctrl.dtsi | 115 ++++++++
>  arch/arm64/boot/dts/exynos/axis/artpec9.dtsi  | 277 ++++++++++++++++++
>  5 files changed, 436 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
> 
> --
> 2.17.1



