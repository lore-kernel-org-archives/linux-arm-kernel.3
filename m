Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB75BCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=4MiJ+uy+WW1fJ9ZLuo2A9d/Q1LZuPXcBGuooHhjDd94=; b=Xi6UwQmNK3GShom/GPjmlGZaeC
	b1PDyEomC/OPcM9+BeVLMCVR7Ip9uUL7K5P2B4Mlm3eE4qqXwSlzBpLWs7PYKx6d+cnXuXc8A8ddy
	dVxNUhnLwsrdKD/rPgXZd+k+EPQNMdEL6SPAbhcBs7XakcRlLNQRwweIn9eu2zCUDbOtpDeEu6krW
	d3Gq3B/BLY/rp3zUj932pKtAEHkCzX2SBVQ4CEN+h6JP4JeaY4LXTdjUI9s4iLgMecRlWWFuiWQVY
	ntQoMOLFMuO8b//FZGEt/u/F8NN/KEm0GEjhYHhvNpjn1khd9xA3Ey2t5mrmx4rK0zl7EpB28jWGc
	W2BBkiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvCK-00000009zN8-3ByD;
	Mon, 03 Nov 2025 14:06:16 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvCI-00000009zM8-1n08
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:06:15 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251103140610euoutp029ac924cdb318aaf74c9cfc80839890e3~0hEFxIzZV2440124401euoutp02_
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 14:06:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251103140610euoutp029ac924cdb318aaf74c9cfc80839890e3~0hEFxIzZV2440124401euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762178770;
	bh=4MiJ+uy+WW1fJ9ZLuo2A9d/Q1LZuPXcBGuooHhjDd94=;
	h=From:To:Cc:Subject:Date:References:From;
	b=NWC0P7xUOh9tJE6Y9eTwgDZNPpqmK+LqgT4QgzfCajM+KVM6nRDGAto1MV6u9K+08
	 B3CkIz1fLlNGYhO5fX6msXowHOPlylsILZTU18Dz8K1NEwtMm55dqWaWr/T6BXQbpW
	 Tz/jZvbVsq/UGTamH2w8TBJmrIfcnhH6XxQCLuCQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251103140610eucas1p2ddb79e5a3cb47af66713e61a246f9f14~0hEFaEb1A1895618956eucas1p23;
	Mon,  3 Nov 2025 14:06:10 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251103140609eusmtip1ac49a7f18256bfb2c28aefa578567e59~0hEE_iGSn0790907909eusmtip1R;
	Mon,  3 Nov 2025 14:06:09 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Alim Akhtar
	<alim.akhtar@samsung.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] ARM: exynos_defconfig: Enable RESET_GPIO driver
Date: Mon,  3 Nov 2025 15:06:02 +0100
Message-Id: <20251103140602.2359058-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251103140610eucas1p2ddb79e5a3cb47af66713e61a246f9f14
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251103140610eucas1p2ddb79e5a3cb47af66713e61a246f9f14
X-EPHeader: CA
X-CMS-RootMailID: 20251103140610eucas1p2ddb79e5a3cb47af66713e61a246f9f14
References: <CGME20251103140610eucas1p2ddb79e5a3cb47af66713e61a246f9f14@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_060614_599997_307879B6 
X-CRM114-Status: GOOD (  10.76  )
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
 arch/arm/configs/exynos_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 84070e9698e8..75e84958c279 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -328,6 +328,8 @@ CONFIG_AK8975=y
 CONFIG_SENSORS_ISL29018=y
 CONFIG_PWM=y
 CONFIG_PWM_SAMSUNG=y
+CONFIG_RESET_CONTROLLER=y
+CONFIG_RESET_GPIO=y
 CONFIG_PHY_EXYNOS5250_SATA=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
-- 
2.34.1


