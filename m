Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AF5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lu+QUDsHnKE/Syu77Ecp814Qglbn8gBdxsQityr+Uto=; b=aZi2TftRrlhVFLu49lNb1N+dMQ
	Vavgb7Qy9k/eKFM7Y/o+38DKlzuJXYol/Rv38vTtYlrfHWEAOFCM3JdRwFQq15U4Maty2Cin69YyZ
	ADpmj8Lh9abAck7S6SZg1dOZzvS5e1mgx7xyZuxW/Q/LCMdYWn9/FdL2Q8lXvyBEEsc20p43g3D0j
	eedG3lg6+A91v+B7itgCsDXOECaF2Mw8igvMqGzBOmtKo8e1R3eorw03ASRbSBslvE7ujHv4u6Viy
	1cC4IOoISpJNpFNLh53iPkKIrEogLm8BzOncl9IJi+oidFm4Y5huyBpOg6GQiLgZPCxkkYKFk9/Fm
	c8FJ0AJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7a3-0000000Eg8T-3mc9;
	Fri, 14 Mar 2025 16:08:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Us-0000000EfB0-1Fgq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00C195C1D1E;
	Fri, 14 Mar 2025 16:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803CFC4CEE9;
	Fri, 14 Mar 2025 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741968173;
	bh=2xfK40kbAsq1KvSui06/jpf2SUEyYwHkDTzV9ntlS0E=;
	h=From:To:Cc:Subject:Date:From;
	b=NwAIwXPA5LFcIGfs/bRsgeS29k96CBCEM5nbbzJuvRLWiyQYt3rykJ48fbgDzQ4h+
	 dK5u8r9V4Ee5/y1NQs8aHLSzT00O9fYt03Ryl/fN2Oj3OMa5XNtYYNt9JJ0muwTSdR
	 /MXZloiB9t3j0LdunViaOvQrids/JmMppD1Q9DdA+L7qM1Mr/lKS63K0FZ294Zgg+e
	 n5VWtTs9xkuvnxnxouvylTWiPpD++qr7929bLwS4kxC38MLOgLWTRQPorjIPZjTYY1
	 2dClBdjtIEOBybXRJhhp9zobqDT6wXGMklWdgHYkfaq8adhrbHNM+T+wwGfJIwgk5n
	 /feX1H8EpT2Mw==
From: Arnd Bergmann <arnd@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: aspeed: fix 64-bit division
Date: Fri, 14 Mar 2025 17:02:44 +0100
Message-Id: <20250314160248.502324-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_090254_378962_6A013A41 
X-CRM114-Status: GOOD (  10.00  )
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

From: Arnd Bergmann <arnd@arndb.de>

On 32-bit architectures, the new calculation causes a build failure:

ld.lld-21: error: undefined symbol: __aeabi_uldivmod

Since neither value is ever larger than a register, cast both
sides into a uintptr_t.

Fixes: 5c03f9f4d362 ("watchdog: aspeed: Update bootstatus handling")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/watchdog/aspeed_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 369635b38ca0..837e15701c0e 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -254,7 +254,7 @@ static void aspeed_wdt_update_bootstatus(struct platform_device *pdev,
 
 	if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2400-wdt")) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		idx = ((intptr_t)wdt->base & 0x00000fff) / resource_size(res);
+		idx = ((intptr_t)wdt->base & 0x00000fff) / (uintptr_t)resource_size(res);
 	}
 
 	scu_base = syscon_regmap_lookup_by_compatible(scu.compatible);
-- 
2.39.5


