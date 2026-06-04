Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ED9CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 01:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9gEJWImTswB6lvU2PvICsMgm37R+YYrTrc943vxPQA=; b=rabP+6OEgGy9k9zKPjPmNymCv5
	6no69o99iNNMxptFuV8qZRZgBux+d48szfgwocw1hJQeNbhI5Db/4q87RkKqYH8CUAjtK6JA5fzlz
	KmDwjhlVbRNrKQt3AfCyUakiFxak6j3IBmzfFQtMvZe4MD5ze7jMPhVW2e3+acCLCIajSiKVAQpOX
	jRD41OihywUk1oBQhxFiDOeBU62J+Fsw0P1/4znQ6QPx8l0JwRf9dvXU74slMSVHCAgt6Oy1rXpmJ
	097SxF9digODTrYdvSKJhv/sOFIJAlMC86JUia/62l5SmMeCNBb5Lp0JLzlEj5SHpDF0Cp0AZsxPM
	mbhip51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUwXA-0000000Fz2t-1ae3;
	Thu, 04 Jun 2026 01:06:08 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUwX6-0000000Fz1Y-2IzM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 01:06:06 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso60860a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 18:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780535164; x=1781139964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9gEJWImTswB6lvU2PvICsMgm37R+YYrTrc943vxPQA=;
        b=T1Ib/b1Hi5ejyUVW4HTYdbbCMDPqHtt5ycYIe/++x+b9aK79ywz20WnlEENb2PJecx
         2aII7TWpJe3ksbtfHwMyslz6uBoBTGOXCZb9VlR4S/kzojEeMlY1GNR2tNujM7mMKW7H
         fRCgS3+L3z8G/cKe/e1WLGt2348qsahIEvyJTmcn0hOa5dOveLQZt43xZ47DkuG/y/Hb
         I8u4wWi4bcMlX8Ni76LWwnJ0m7bR35M8lSg1v/1FfjIwwko0uzt5CpXoQFVqysYIwBTP
         XyKGV5ufrW/37p/2nVqUhETYbu11hv/ujK5Hj2fBZFehoRM/312Q6qExIg+wxf6IhZjd
         3rWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780535164; x=1781139964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n9gEJWImTswB6lvU2PvICsMgm37R+YYrTrc943vxPQA=;
        b=nPJPQ00I2gMaRL8N9mxtWF3TZ15nVwyFIT9LB5Z+HRdMvieZf7/hmWZX7GeTHcS6eB
         lUQaB/NKFY8RQwAAt2Sokirl/8ixEZuZ7sXhraUvrGH16zvi9Kl2/oo0DdfFpRCpkqdk
         19mqauw+g0sK6DhNvH54tqYlHOheFZHYBZI3o4VpkkLF9MH4B+vOeMrJ+aXngZJCfcML
         etZwhSQd7uK5MiuL4zP948JrPVOdDsA/rQMJvYwhf/Qw/0gZnwj/NPgGFgo28hYCl824
         n38GjHa5/Fye/bN1cMTSR6m3enunnEmGp9aV4VlrGQpMEQlvMhUw2k/9XTN9sQJPRfhS
         Pv0A==
X-Forwarded-Encrypted: i=1; AFNElJ858aEcPbZpKbHNECiRpd1vGtHuHXj5R+cmBU7aS+hbapnhPc5KjSQdfENFQMTg49WSOg9YAB0Qu5iB1iQs7YFd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8RK5ph7wD4/IoVl8yp0AXTfQNd8WfkBy2iFEx8tV6pRUcWmWL
	FRdWUsz4qKZEtFu9nzviFnAnWgGsKRoC0tM11TweEFX8SwEF49fzNzNW
X-Gm-Gg: Acq92OH1AgaXgxeYh3hFcoErZUXcr8p2MK1evCh/rK5MZfv9u4BNUF67gEo45zV/Aly
	Rk8VZBV183feoHRr/EZH4Dgci+4JyPrZC/1KNfXYL2ey6b/kwoNwNvj5q8kGK52etx/+Bh3vsrs
	Ytee0hKAvYtZp8UH0hBwWcV3k6roz3V9xNkvB8ElynwjH8k+eQfP7KzqomKnuD8f59jODTIQxja
	BnQLOORIFQapmai0guKhNXdGnc+MqSKaCExEKAb+evwD136oa5/oDJebccsRQXqdb381Zh4LZ+B
	Tch1js+JFlYcGfOQlDwvaA4F9BwQc3S5d73nNgraK41iAKEMr0YYFcvfGWkiP/t0TVdvyqScOgV
	kQojKPvD6wsSG5PilYSCgyZIsJktXWeJF9PgEB16A5A4RvABEvnwrKvR3ZzTQvdsyxlr5LZxTPq
	VRmBuL8vgL4cAbooZ6SEMvF1ilNgYcBv7yCWNGGI9OeT6mywjUQHtKU9ovts775eEIqsCs/fDxr
	N51FK6IAH4/y3FYzXWEIdGOtHyet0R39swhM/UCRVjLUQ==
X-Received: by 2002:a17:90b:3b49:b0:35b:9894:f6f9 with SMTP id 98e67ed59e1d1-36e3228676emr5020525a91.18.1780535163699;
        Wed, 03 Jun 2026 18:06:03 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6d169abdsm2366747a91.0.2026.06.03.18.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:06:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] watchdog: sama5d4: use platform_get_irq_optional()
Date: Wed,  3 Jun 2026 18:05:42 -0700
Message-ID: <20260604010542.23177-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604010542.23177-1-rosenp@gmail.com>
References: <20260604010542.23177-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_180605_067855_645E7032 
X-CRM114-Status: GOOD (  13.99  )
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

irq_of_parse_and_map() requires irq_dispose_mapping() on failure. Don't
bother with it as platform_get_irq_optional() doesn't need it.

Also handle EPROBE_DEFER.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/watchdog/sama5d4_wdt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index b7a8cfed335d..030029d50257 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -11,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/watchdog.h>
@@ -245,7 +244,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 	struct watchdog_device *wdd;
 	struct sama5d4_wdt *wdt;
 	void __iomem *regs;
-	u32 irq = 0;
+	int irq = 0;
 	u32 reg;
 	int ret;
 
@@ -281,8 +280,11 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	if (wdt->need_irq) {
-		irq = irq_of_parse_and_map(dev->of_node, 0);
-		if (!irq) {
+		irq = platform_get_irq_optional(pdev, 0);
+		if (irq == -EPROBE_DEFER)
+			return irq;
+
+		if (irq < 0) {
 			dev_warn(dev, "failed to get IRQ from DT\n");
 			wdt->need_irq = false;
 		}
-- 
2.54.0


