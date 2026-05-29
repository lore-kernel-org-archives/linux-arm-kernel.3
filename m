Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB69CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 04:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WkkJotVpft6x/vARkqnh9oEixNmMN2cX8O5U+VJWqdM=; b=XiEUycjfT/WcxSI8ipTQsHz5a1
	L7V6S97Oq3Um5SalTGqISplsLvhSu9OQUqF8stAypqe8tCmKm3GaoohbV+Wqgw/xLPqD/oJErMCCa
	WzwrwzGwv5vX06QS6t3zStKb6UEuV+8Fygb9FxVxXz3d4YZAasc5sDOQNAi+9ChxdEJq68DfMxRE9
	gihBSstbySxZiJDac3Yo6TEvu02wXZJO25byb22wpV3MEpUlmLpXrkNmMHJo7YKqysxX51PZmpMnl
	ufo0Mo1GmZF0FmK33H/uT8ToIVfMsxVl/x7zf62uZ7yvbVxScuL57K+l+AxxCVaR2QHB2Z6PiCmDx
	cAwaRlSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSoiS-00000006jLn-17M5;
	Fri, 29 May 2026 04:21:00 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSoiP-00000006jLI-2rlg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 04:20:59 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-914bf787977so538524785a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 21:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780028456; x=1780633256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WkkJotVpft6x/vARkqnh9oEixNmMN2cX8O5U+VJWqdM=;
        b=jevcN2U8CX1ARfFUZ4kdioPt+MWmRkBLld4t7kx4wcmoR3Fpf/KplTLcKO6DiBwwo6
         gVZYi5mJdXzXm19dRPvOz5iOjAEgMbdL7oQ3HNbGaMhKajoxaVVek9uo11iqFqxhb8q0
         8IBjIz33jfc+Rl25zjGH3vB3Pt2OmAgyvNoIIvGP1XJTi+kDvWXA1edd3FdPwvxnK4Of
         xf4ZS5g1gCW06FolgdNLNTzS4E5bxkAyQvTZqe9hEr9jks5yzGfXjrIWdf3EIIcHcFDa
         ly5JqA83Te7tStoWy+mnf8mS7WNI5gJ6EAnx1DVxHkVZ5SEowpkWJxKzyFNwBWKlneP9
         tlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780028456; x=1780633256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkkJotVpft6x/vARkqnh9oEixNmMN2cX8O5U+VJWqdM=;
        b=PlZYSvmcCKaMG5gYR14vc2PI3zXAKYXM4WEnOZwKR0HebqRt1GWkGEknKW+M+QLVKa
         VBhHaJlaDx2Hqq6iDX926Ajrx38d0ip6dyNuVziQII/74n92LqhE+yBjGs7GoF45htFS
         c4ufI3sMR1FhCX6AxWXRGZR3HNzOyuvNvu9wyjwR0JC5xTa4fIYoY/yMhESUSxQvoK7H
         vUTh51FLLcYwj1KMBP7eLCys2aKamjd/dDySG/UWQSu5bzeWvV1sAD+LRGLcLQoYkNwj
         OzMAEzZAuX2uGqUXkDWZAnmytyKmXv7sLb5jNFKZ2f5KTeD7BEPkyVL4EBXFKRUwddkn
         7lsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dR40CRyd8JdLAK6RvbgN1AQWyxbDOflJrnvCMTlTl6nYMXZ2nGEjToaeEgpK6z16aNIO04ixkFdBzffPV6RxY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz98DLjsHznHEw8Jc9UM8kyYHBZWYjI2mR/ybMAVPH/uCNQTh+F
	LIapM3N0Odkp5Oo+opTbOvwLVcjpwJ0+BGDpgzGqmFF7U3KYJa+YJyQc
X-Gm-Gg: Acq92OFh9ivuxEafmc7M23nDPy8A/krkf1kpEQycOf7VTPHFcJRS/qO/mNMnDzhyIKQ
	oykN8+j3gpk2VnoeJjUsXZg6gymlcynbqvZPITRUcLYuNFOOhKFhdO65CfG98fGpAWHLZcadc+c
	+0Hlu/QcJGVRLpAl+M4PIt9hTQh/jw1mDeaF7yMsz22XK01vs2C061Cah6gk8+NlMwByXV1M44B
	HC+4Zeu5n4aLLqNvuYgEQAHOKIeIPQ1s3hkrmkr4rjnLOwtTOWhi/CNGSpN6bQo9UCTnFU4LaM8
	zXzgvBxWNk74x8KfHXvfdyNrC0v8yOpAyCcLKNwzXSG/xwnWEa414fOpWJSFHfTVUOWlZc3lQdW
	9FAp3f1jmq7I6vK7Sj9UMzhqNUWAYX/ETOiP8PvD3Ze+/puzpAeKKpEdP4Mv/lCmibrzxbhoocd
	oRqQi0FWQuqIlIRVBRMrNTvP01WpyGbdO6v74Kf/5B7kudzNAdxMA=
X-Received: by 2002:a05:620a:6494:b0:914:c38a:4e72 with SMTP id af79cd13be357-9152fe13a9fmr153575385a.50.1780028455830;
        Thu, 28 May 2026 21:20:55 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532480ed6sm55661885a.15.2026.05.28.21.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 21:20:55 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] clk: at91: keep securam node alive while mapping it
Date: Fri, 29 May 2026 00:20:51 -0400
Message-ID: <20260529042051.1626978-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_212057_722844_BB66DC9C 
X-CRM114-Status: GOOD (  12.13  )
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

pmc_register_ops() gets an owned reference to the
"atmel,sama5d2-securam" node with of_find_compatible_node().  The
success path dropped that reference before passing the node to
of_iomap(), leaving of_iomap() to consume a node pointer after the caller
had released its reference.

Move of_node_put() after of_iomap() so the node remains referenced for
the mapping operation.  The unavailable-node error path already releases
the reference.

Fixes: 4d21be864092 ("clk: at91: pmc: execute suspend/resume only for backup mode")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/clk/at91/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index b618a5e00b00..03a6c31d6aa8 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -180,9 +180,9 @@ static int __init pmc_register_ops(void)
 		of_node_put(np);
 		return -ENODEV;
 	}
-	of_node_put(np);
 
 	at91_pmc_backup_suspend = of_iomap(np, 0);
+	of_node_put(np);
 	if (!at91_pmc_backup_suspend) {
 		pr_warn("%s(): unable to map securam\n", __func__);
 		return -ENOMEM;
-- 
2.43.0


