Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FA5C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYROmAhNDAwZntl5xCPWULLJnIqdmxmzdZxWQaTdrjE=; b=PbUE0UhqlqOwLW4Hgfj0+Msmz6
	bnod9M2xhwaYlSAdGPDrwUi5/Guh752AwqB9f9uhVEWgS0qpih5pT/Fav5mhWQHooiRUGPnT18JSM
	GkTeAqWNuzwyTdSq0y0c5zvGGh0VgOEUlewqxBZolFDpDE+oyzD6jHESy0RNZbuGxFvbq1K8FGPwd
	wS3dL/4MyDUIJcGWE91kypCjmPw+VLtRrqXEEEzXBPIcz8TgokicOwGF/+qepa7hM72OK1x2UsXBV
	t6NxGej8lnftkHiMlqyIDqYn9prBt5P/76S20iHhoz0OgRREaj43bCa+dW3iee5QPnuqPDJs5YoaP
	FflH47/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7nK-00000009goH-2bmz;
	Tue, 06 May 2025 02:12:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4fF-00000008sxd-1XIe;
	Mon, 05 May 2025 22:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6136B4502D;
	Mon,  5 May 2025 22:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A91C4CEE4;
	Mon,  5 May 2025 22:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485516;
	bh=8Tzr5t+i7b+QkNadODBiccJKXrTWX5gnoQuN05CbYhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OQG9QLLTwv83ss5/YyVzrOyhgFyudhdF/pel4sfc1iqVjIpAIEXb/7S2xEgX5T6w6
	 OtDjF4Wr036xIJGSTlQpagR8BpdUe2H1GZTZhA21xBwha6ueSglZ+1BtGIxdYM9VuR
	 l/1J7VQHheFCqCoRqzRU2m8a5FIXh8TfR/zpn29lzA/XRS4mGRrwQQGRs/B2HdcA13
	 CNlf3+wksMSHt/pP359ClrYoB15I6qvGYDJFbRFksGfDtTuZehxP5NniAeVtT9zfyt
	 JqjxQ453muPgRmwaKbcTOyvsFdlIbkD+qg0iBObnIumudsoo9SOBatITBbG53YMkmx
	 TTu65DqGfwCdg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kishon@kernel.org,
	krzk@kernel.org,
	semen.protsenko@linaro.org,
	dan.carpenter@linaro.org,
	kauschluss@disroot.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 356/486] phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
Date: Mon,  5 May 2025 18:37:12 -0400
Message-Id: <20250505223922.2682012-356-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_155157_425480_F31CDFF2 
X-CRM114-Status: GOOD (  13.04  )
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

From: André Draszik <andre.draszik@linaro.org>

[ Upstream commit 21860f340ba76ee042e5431ff92537f89bc11476 ]

This code's intention is to configure lane0 and lane2 tunings, but for
lane2 there is a typo and it ends up tuning something else.

Fix the typo, as it doesn't appear to make sense to apply different
tunings for lane0 vs lane2.

The same typo appears to exist in the bootloader, hence we restore the
original value in the typo'd registers as well. This can be removed
once / if the bootloader is updated.

Note that this is incorrect in the downstream driver as well - the
values had been copied from there.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
Tested-by: Will McVicker <willmcvicker@google.com>
Link: https://lore.kernel.org/r/20241206-gs101-phy-lanes-orientation-phy-v4-4-f5961268b149@linaro.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 46b8f6987c62c..28d02ae60cc14 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1513,8 +1513,11 @@ static const struct exynos5_usbdrd_phy_tuning gs101_tunes_pipe3_preinit[] = {
 	PHY_TUNING_ENTRY_PMA(0x09e0, -1, 0x00),
 	PHY_TUNING_ENTRY_PMA(0x09e4, -1, 0x36),
 	PHY_TUNING_ENTRY_PMA(0x1e7c, -1, 0x06),
-	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x00),
-	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x36),
+	PHY_TUNING_ENTRY_PMA(0x19e0, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x19e4, -1, 0x36),
+	/* fix bootloader bug */
+	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x02),
+	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x0b),
 	/* improve LVCC */
 	PHY_TUNING_ENTRY_PMA(0x08f0, -1, 0x30),
 	PHY_TUNING_ENTRY_PMA(0x18f0, -1, 0x30),
-- 
2.39.5


