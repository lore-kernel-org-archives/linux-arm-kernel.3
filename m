Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F408CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GJEoBlS/FDGmCszmF85IMpGIY2VK0IkQn8AcG1hX5b4=; b=Yw490AcwP/rt9GHk6jVOuy/Uso
	l50+ktoEfNZZTe+vPgvc6brSjcMXnMvCsjYrgQkN3gKfNL9y2B1y27avaGayx090EnVja6YMWiMO5
	VMe9cGBkfkXN34Run1FJ3xDZ9eY0FKrH3S1nVAgX6PYdUsTf23naaaEUjjONeBFZDTZ/bLk148hvT
	wyW0WjCshcUfzdQAiITuY3gv1F4bQ0/lt6+HpocgO5oHmWngKuKeNcFroKcmLf9sdiQkQlEkEoPGY
	wPPptzRMakwgfpnxI5N+NcxeXSFgHxP3cK1xkxNfpvjjZ0MmU2vRNeOVRzfh7NCOyrp0P9oaX/m71
	+I8T9png==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhQ9-00000000Bsj-3wOJ;
	Thu, 12 Dec 2024 11:31:53 +0000
Received: from zankapfel.net ([2a03:4000:6:113f:0:1ce:1ce:babe])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhP4-00000000BfQ-1AyV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 11:30:47 +0000
Received: from zankapfel.net by zankapfel.net ([5.45.106.173]) via tcp with
	ESMTPSA id 6rlJ0Kh87LDhBzgHayDNZQ (TLS1.3 TLS_AES_128_GCM_SHA256)
	12 Dec 2024 12:30:35 +0100
DKIM-Signature: v=1; d=zankapfel.net; s=2024a; i=phil@zankapfel.net;
	a=ed25519-sha256; t=1734003035; x=1734262235; h=From:To:Cc:Bcc:Reply-To:
	References:In-Reply-To:Subject:Date:Message-Id:Content-Type:From:To:Cc:
	Subject:Date:Message-Id; bh=4u5q3iNWiKTEWb5hmFX2ihyKWr/q1tuP/iJ7YDhn8ds=; b=v
	BBy0MlwkxEer7jbyODcWDO37TYsb95V6uDlHbG39t/MFcyDxX4cSJOmlKItQtguqi5tbW3AY7fXiO
	ciNvpQBQ==
DKIM-Signature: v=1; d=zankapfel.net; s=2024b; i=phil@zankapfel.net;
	a=rsa-sha256; t=1734003035; x=1734262235; h=From:To:Cc:Bcc:Reply-To:
	References:In-Reply-To:Subject:Date:Message-Id:Content-Type:From:To:Cc:
	Subject:Date:Message-Id; bh=4u5q3iNWiKTEWb5hmFX2ihyKWr/q1tuP/iJ7YDhn8ds=; b=m
	yhTvdnVd3Nzn9vAxlGnAfYZy8CHNi0b8OPSKjYNDqZim/p2alcP0QuMuxIMpDUX8Sm0wolDYrh0Gh
	/pvT4LU/9SQKqJMCnK7E1JO2CkCF99Qhm/nd985FOec3zMPHcmaiXZS99GKYn7BebLrYlUpPrlw/i
	arfSPUDplXMGUYfJ/v6/n4rOPHEgE0gb0OkEaMJR33spu8XbMP3HRt9FTelbf6X/QXux04pf0Pw+D
	fH9GUHGMyHuTXekYBZqhhsfVO90u2PfAruqi6R2afumO7eIiBUm/8C9yEHN1UjYN89DUHCUcAOsV5
	hECNuxe+c5E1G03s6iwpg4e+aQ1rMPkuw==
Authentication-Results: zankapfel.net;
	auth=pass smtp.mailfrom=phil@zankapfel.net
From: Phil Eichinger <phil@zankapfel.net>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Phil Eichinger <phil@zankapfel.net>
Subject: [PATCH] watchdog: aspeed: replace mdelay with msleep
Date: Thu, 12 Dec 2024 12:30:14 +0100
Message-Id: <20241212113014.1075414-1-phil@zankapfel.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_033046_470053_A3BDB472 
X-CRM114-Status: UNSURE (   9.47  )
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

Since it is not called in an atomic context the mdelay function
can be replaced with msleep to avoid busy wait.

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 drivers/watchdog/aspeed_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..98ef341408f7 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -208,7 +208,7 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
 	wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
 	aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
 
-	mdelay(1000);
+	msleep(1000);
 
 	return 0;
 }
-- 
2.39.5


