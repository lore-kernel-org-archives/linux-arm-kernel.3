Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A40CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 05:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Qtqck/gpVB4ju4zZiFzaFJ+MV8r04EU/eAiQG9DA2kU=; b=HsivK8swtPkoVXVNFJBv0FNGcp
	v7HAtnEA3Ljl17Ubz5d5Tkm2KtlqtGbukfkTYFTk/SpZRp6EIUeuPRPaBInk5ScZbUZWJDoEPxdI8
	kTdAB0GwSL02HK8vuFGwt4lFAliyCMKhBv8fBn2kXBC3BCogUjvUWuTpIY9/t8Tzp/azEx6Lfdv7Q
	udnZ6O+UX9MVn38EIkLEui6dU7UIf5UzglXLtycERGaxM0ET38lzoTobsVVmgGd4GqNlbMhW5hu8y
	k9SS+HiLu2PZi6olPakowM9sgRoihmlXYVOXoRF61bzZij9f9KXPiDJjkRuv7nJbzeuatT6KHZ3Op
	iHBjlXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1Un-00000002p5p-06rm;
	Mon, 15 Sep 2025 05:11:21 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1Ui-00000002p3J-2cUB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 05:11:20 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250915051108epoutp04f6688df35a8b8987cb44c26037f0d0be~lXJ8lMmg30528905289epoutp04U
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 05:11:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250915051108epoutp04f6688df35a8b8987cb44c26037f0d0be~lXJ8lMmg30528905289epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757913068;
	bh=Qtqck/gpVB4ju4zZiFzaFJ+MV8r04EU/eAiQG9DA2kU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=sTSJagWLuoMvhkRIfGldifYu9jDDkxC1rDeol/b51PkWJSkoL46xYVJH2iiZlDDCp
	 eiGVsulECiPJMRcZ1BkHLDzFR5NHQ74m4+xPJQjWrp43bly0Dulc1HjYMqAaxK2y0y
	 tNxp8g4pQ9gYLaoe8lOjZoO/16QwKLUlqfCaTMeM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250915051107epcas2p1b2da98d21c1af3159b3be2e7cd1d33ab~lXJ76u2CS3200232002epcas2p1L;
	Mon, 15 Sep 2025 05:11:07 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.102]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cQCmW08qJz2SSKv; Mon, 15 Sep
	2025 05:11:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250915051106epcas2p19c54f69c993621430aac622c6865919b~lXJ6xOlrR3117831178epcas2p1e;
	Mon, 15 Sep 2025 05:11:06 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250915051106epsmtip1ea10842bfde3976dc3dc3e1101d27762~lXJ6p1qNv0859208592epsmtip1G;
	Mon, 15 Sep 2025 05:11:06 +0000 (GMT)
From: "myunggeun.ji" <myunggeun.ji@samsung.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Jongho Park <jongho0910.park@samsung.com>, kiisung lee
	<kiisung.lee@samsung.com>, "myunggeun.ji" <myunggeun.ji@samsung.com>
Subject: [PATCH 0/2] update exynos-iommu code and device tree for v9
Date: Mon, 15 Sep 2025 14:13:18 +0900
Message-ID: <20250915051320.3378957-1-myunggeun.ji@samsung.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915051106epcas2p19c54f69c993621430aac622c6865919b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915051106epcas2p19c54f69c993621430aac622c6865919b
References: <CGME20250915051106epcas2p19c54f69c993621430aac622c6865919b@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_221117_156170_7072DE32 
X-CRM114-Status: GOOD (  10.25  )
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

Series updates exynos-iommu code and device tree to support
for ExynosAuto sysMMU version v9.
It provides initial driver code and register information the sysMMU device.

myunggeun.ji (2):
  iommu/exynos: Implement register set and fault handling on SysMMU v9
  arm64: dts: exynosautov920: Add DT node for sysMMU

 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 21 ++++++
 drivers/iommu/exynos-iommu.c                  | 73 ++++++++++++++++---
 2 files changed, 85 insertions(+), 9 deletions(-)

-- 
2.50.1


