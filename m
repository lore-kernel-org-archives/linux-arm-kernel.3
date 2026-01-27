Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E96CD2FED9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 19:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wSUKMCHTpZwLETU4Jdy8sHSuPWnpdwNzxeIRQAp/NO0=; b=f2Y3rdFHip7fbgp7K+ks4i5n0i
	Be/Mi9PGdlasiMo+A2a9DDbk/FCGHOG6aJhS71ZNzNQnadyqT/BTjJYpOnQpnCYbQhbUWzWXxtZfv
	qY5wrS4oz/yY6mGULe/xuFp2sSwZZlJEuPHBnqcO3WWh1HzF3Of7J0mI7sE1rVyshVu25cd80lrn1
	fDPgPdR6lKzXpXUqVjr+7DRF32lgXe+vVEzQniEkcbDpke9eiiR/SwdUfVd95a/KYbIwiLO6XfAyx
	k0EgOMYrzoVUIQxl5g2l8uTBS6dsDY4s8qOGTG+Fa3o+21wN6xefx4yfJ8s8U5UBw3gZ0RDEPXTyt
	oxdE8XBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoUc-0000000EtWh-1T4e;
	Tue, 27 Jan 2026 19:12:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoUZ-0000000EtVc-1UzV;
	Tue, 27 Jan 2026 19:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B1F740980;
	Tue, 27 Jan 2026 19:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FE3C116C6;
	Tue, 27 Jan 2026 19:12:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Naveen Kumar <mnkumar@google.com>,
	Roy Luo <royluo@google.com>,
	Joy Chakraborty <joychakr@google.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
Date: Tue, 27 Jan 2026 20:12:36 +0100
Message-ID: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_111247_414759_A9E06AC5 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

The Google Tensor SoC USB PHY is only present on Google Tensor G5
(Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent asking
the user about this driver when configuring a kernel without Google
Tensor SoC support.

Fixes: cbce66669c82ee9a ("phy: Add Google Tensor SoC USB PHY driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
ARCH_GOOGLE is not yet upstream, but that doesn't hurt.
---
 drivers/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 142e7b0ef2efb920..3ceda9a20d571038 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
 
 config PHY_GOOGLE_USB
 	tristate "Google Tensor SoC USB PHY driver"
+	depends on ARCH_GOOGLE || COMPILE_TEST
 	select GENERIC_PHY
 	help
 	  Enable support for the USB PHY on Google Tensor SoCs, starting with
-- 
2.43.0


