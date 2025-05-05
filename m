Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602C6C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uupg95TEkoWXsxdOgQ+3J4EM/An2UdOuPjBjvw/AeDs=; b=QbRDWoWEDyxiXKgXglaf7ww0kP
	IyzshVyc3UdCENtQ6ev8ty4nviCdor6uDhcavL2nFvV3YM9p4dPsaPCOgCOFaynpcXhY6N20yQw2d
	VaEwiOqyElVmJXESAtYbXTitfM6rfdR02gVcIwHZvOvhnBZRHrGk6XwiSe5BfelRgSo3j9QPIfBmg
	eeF/kpT6xitUElJ/Iug54LTWPbhSyEr1pgX5b36zbOABrAw18hhol6tPeFpcg0V9v452TDjTpUtcr
	+1n2aNooYf4IKburN6dB8c0NsmIk2ZQBcuZ/X8bLHXrIBrxfl0AUgcSvQhY0OA8o4llcjgGsT0Kvo
	hc1WiHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6NP-00000009LO8-2rOL;
	Tue, 06 May 2025 00:41:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4SO-00000008orx-2MjI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:38:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F82AA4CF31;
	Mon,  5 May 2025 22:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE4CC4CEE4;
	Mon,  5 May 2025 22:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484719;
	bh=s61Je2PkceIhRzOL/l54+OairdWxRxRQmN5FWDJG8AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dHB2aBZPeYHN7WNgQXX/g0IOKS9l/2k4+aXwSWjvWjTxgVNsm2Q0OQYm7XLVHCAmL
	 tMB6T0ttVwH1ZB51vFb7Y5eqK5rPPCzJrszvn7J31QLMr6ZjQGC5NkZ+LvSX/mv9IR
	 tkNHIatjVns908YquXKvClXK53GXsItrQIqCXdUdb/EMkbkEFuNJ50pCKIoagChMHn
	 ckVzn7JKYX/PBx+MXQlbpUxWk85qHjzeKUxt6Anq63zNcuCVtT2cccjh0dv20rngub
	 2ZikM7xDAhWFMwCbc1Yvu0FTqdLWhla0MmQXpJuD7r1z7Fi0/hycsEfItna0yZenY/
	 S1qJot7r0lIKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	chin-ting_kuo@aspeedtech.com,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.14 626/642] watchdog: aspeed: fix 64-bit division
Date: Mon,  5 May 2025 18:14:02 -0400
Message-Id: <20250505221419.2672473-626-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153840_667200_D4406E14 
X-CRM114-Status: GOOD (  10.80  )
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

[ Upstream commit 48a136639ec233614a61653e19f559977d5da2b5 ]

On 32-bit architectures, the new calculation causes a build failure:

ld.lld-21: error: undefined symbol: __aeabi_uldivmod

Since neither value is ever larger than a register, cast both
sides into a uintptr_t.

Fixes: 5c03f9f4d362 ("watchdog: aspeed: Update bootstatus handling")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250314160248.502324-1-arnd@kernel.org
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/aspeed_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 369635b38ca0e..837e15701c0e2 100644
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


