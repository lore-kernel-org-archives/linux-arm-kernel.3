Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88390C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoB2/iVlKaKGeio/FHAuWA9mz1o0gTZXFPAhxud1wyc=; b=xMqBnHyZgr9L3B5BQ/jkjhv4U9
	/AKxNtnWZ2k7WWKXPpBsWFzKAgIydbYTqxym+AYMS7CSZ0Se8jczenAWmOoUUWOIcG27GH0WV/EiM
	q9ITGrHdenEaxW/Skc93gmtSeBsry89DZcaeUWT6cpVSg3nnfaslBNly0TVUCB53yEvPcEP4nEFrV
	3vVfkL0xhE9KjI3D7qDj0MWOSdIQchRGLOwt+IoDEUFI4+Jasq9Dlq6npfDIuQPL9hXzcB3BhauWe
	3zIDkqXafPNO/TSBleUKGrpCLr1TMjIBWewf+mO7DXZ4MtZC4riTjwln/i2HlVHwtfdyafLQqKADl
	8xi71Edw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUt9-0000000GN3J-0NkT;
	Sat, 12 Jul 2025 07:43:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUql-0000000GMle-1Nva
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 07:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6DF54682E;
	Sat, 12 Jul 2025 07:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CECC4CEF6;
	Sat, 12 Jul 2025 07:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752306045;
	bh=6uHbo6HUenPSIvGsm+OeKmKy0pXsvQeHi/n/do9ag0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yn3HgoY6eLTvQY6S6cDuf2aghwU79S3PZ0Tbv+hkCb9apGhxhd9IPYR6M/x3f/7My
	 idhO6DhRZ8OU/2/HpBZvK3EhRiffItHCh7iZp/hsFB9g/qQlW/4PV1OpvekDx9WRyr
	 wV83uWA0Pvl8w3KB1OQXu4M/GNh6OdWtyy8iCRl30oqWoeAQMW6dZEiRDOokIpANTq
	 uabHlUeX5EHOyBuyRHFhOfft6Wb/nqEL00L4hpOp88XkxN6nb4H7O2q6Sy3j/Rj+Bj
	 JeKxPqbovPxGs/T72Wa1XrISH3Dhj7Wf/SwPqNeexFgVZ2X61SW7iGXpj6/PRVpqz3
	 37tNPWINycrDg==
Received: by wens.tw (Postfix, from userid 1000)
	id A3B8A5FFD1; Sat, 12 Jul 2025 15:40:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 4/5] pmdomain: sunxi: sun20i-ppu: change to tristate and enable for ARCH_SUNXI
Date: Sat, 12 Jul 2025 15:40:20 +0800
Message-Id: <20250712074021.805953-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250712074021.805953-1-wens@kernel.org>
References: <20250712074021.805953-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_004047_394526_E1A17200 
X-CRM114-Status: GOOD (  12.94  )
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

From: Chen-Yu Tsai <wens@csie.org>

There is no reason why the sun20i-ppu cannot be built as a module. So
change it to tristate.

Also enable it by default for ARCH_SUNXI since this driver is required
for some peripherals to work, and update the help text to reflect this
requirement.

This aligns it with the new PCK-600 driver.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v2:
- New patch
---
 drivers/pmdomain/sunxi/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/sunxi/Kconfig b/drivers/pmdomain/sunxi/Kconfig
index eb1ce2dd8e53..858446594c88 100644
--- a/drivers/pmdomain/sunxi/Kconfig
+++ b/drivers/pmdomain/sunxi/Kconfig
@@ -1,13 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config SUN20I_PPU
-	bool "Allwinner D1 PPU power domain driver"
+	tristate "Allwinner D1 PPU power domain driver"
 	depends on ARCH_SUNXI || COMPILE_TEST
 	depends on PM
+	default ARCH_SUNXI
 	select PM_GENERIC_DOMAINS
 	help
-	  Say y to enable the PPU power domain driver. This saves power
-	  when certain peripherals, such as the video engine, are idle.
+	  Say y to enable the PPU power domain driver. This is required
+	  to enable power to certain peripherals, such as the display
+	  engine.
 
 config SUN50I_H6_PRCM_PPU
 	tristate "Allwinner H6 PRCM power domain driver"
-- 
2.39.5


