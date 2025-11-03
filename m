Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D17CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=lmfqm4p6hve5nb067nCbxNINQ2VONSKT/aJ/8PHczkQ=; b=3xL9GxEKOuS8XLBVqnJoyLmA38
	bWljvy9flmnQgN55uS9jmAW92CCtWRZm16EckyOQmGAyBJ+FgXNJ3HHstc/ctZ7CvNHoj3NtCl/OO
	9WSrQhPresIszQOs/eTrEuM0gALO6INO7rOMj8BRqYLFi6paPcDHaAd/JCSeD3TbN87BG7jSz/ecv
	B8m0fVum06a9FWDiQcIHleTofJqnly4Dqk7ae3qUXAVEjD0CBGy2YhoVno4+12av0jg8F3nEV/7Lo
	pyJrpy86egLMdCxKjUJqfA9rwf3EujV1aB+mORUDb4tAa98eHL7h4mXO6UIoyOqsoyvTfyQBuH45M
	qRZUtTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvC5-00000009zKx-1lJq;
	Mon, 03 Nov 2025 14:06:01 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvC2-00000009zKS-3m8l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:06:00 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251103140555euoutp015bdd9179e590c5f3f30f72931476454b~0hD3j16bL2480024800euoutp01F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 14:05:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251103140555euoutp015bdd9179e590c5f3f30f72931476454b~0hD3j16bL2480024800euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762178755;
	bh=lmfqm4p6hve5nb067nCbxNINQ2VONSKT/aJ/8PHczkQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Ee2+AzGKirWqXfLhLlRvvDRfWL9zZNEFK38nw+B8Q0otvWPCXH7SraX1wb6WvKNDm
	 hWkIop1IQ2cj+C2gzvQI8sLVOy0SlDhj6YiBI9Mal2/XU2YSy2d2MV7xpT92NgbYyC
	 Q8WkXlm14nuvU5CuChsn6wxcmK4zARF9p1Kk9MdY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251103140555eucas1p16d2f5ab4ed02527da37afd1bd48553a2~0hD3Hr2Va3009630096eucas1p1d;
	Mon,  3 Nov 2025 14:05:55 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251103140554eusmtip1cce2acebc7e24368b9f482f72b6c2d37~0hD2vdxVK0180901809eusmtip1B;
	Mon,  3 Nov 2025 14:05:54 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Russell King
	<linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd
	Bergmann <arnd@arndb.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] ARM: multi_v7_defconfig: Enable RESET_GPIO driver
Date: Mon,  3 Nov 2025 15:05:15 +0100
Message-Id: <20251103140515.2350619-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251103140555eucas1p16d2f5ab4ed02527da37afd1bd48553a2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251103140555eucas1p16d2f5ab4ed02527da37afd1bd48553a2
X-EPHeader: CA
X-CMS-RootMailID: 20251103140555eucas1p16d2f5ab4ed02527da37afd1bd48553a2
References: <CGME20251103140555eucas1p16d2f5ab4ed02527da37afd1bd48553a2@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_060559_072458_84485CEA 
X-CRM114-Status: GOOD (  11.08  )
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

Commit 25d4d4604d01 ("reset: always bail out on missing RESET_GPIO
driver") reworked GPIO-based reset controller initialization, so now
RESET_GPIO driver is required to properly instantiate MMC device for
most of WLAN and SDIO chips.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 12f706e2ded5..5c6c4cecc54f 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1200,6 +1200,7 @@ CONFIG_PWM_TEGRA=y
 CONFIG_PWM_TIECAP=m
 CONFIG_PWM_VT8500=y
 CONFIG_KEYSTONE_IRQ=y
+CONFIG_RESET_GPIO=y
 CONFIG_RESET_MCHP_SPARX5=y
 CONFIG_RESET_SCMI=y
 CONFIG_RESET_TI_SCI=m
-- 
2.34.1

