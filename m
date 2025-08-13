Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96318C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oIO6DXz+fTrVcY/k0heIpTBXqUv5vw8f/KeSfHLKLQ=; b=01trhrZVC9wcfI3TkRKAQryBjr
	JtQSB5U0RPxub0wfFyX109EFHCN0Mq3AxeEGFSJStfrQJurq93W862L23LHAKibXfMN2kTJVX/Nwv
	edXAeIB+1gG79bXPMj2Hr4pOt8LdZnP3GVDvL+sPDihW5FTBQxPROSRd5rJvrIyX7k5nehf44RAYn
	CiqOJzwJ4ZGG4T+RtbSvLiyfuOWe7GBHEmpLjW/lEoyUpHFSgvqWdBr1Vx1Kv4fc6Z0EGM6vr9DBM
	dHN8MwuIjTusJP/wWzxk11ZKmD2D63ShOSo+cCGcVuPwrASzOcrI7wbcq6ZqPiMt3j1QsOFt9aEHu
	AlGVl2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIb1-0000000EyWp-3k6R;
	Wed, 13 Aug 2025 21:01:21 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGnD-0000000ElNK-2dcj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 19:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1oIO6DXz+fTrVcY/k0heIpTBXqUv5vw8f/KeSfHLKLQ=; b=BEJ/kb
	U3eUsMf3CEx0T2tm2blwGgW2LxqEG5Z6+p0r/awH7eGYy/m1IP7VLQMycFBBeaZf
	i+IBrg5XTyjr6cj5h3TTCi7VyoVIdujTOLyWYkzNuT0Oiy/2nnGxhkXkn3ez8ce3
	Ty/7c4+1LzvwxTcFh/RVmqycbP/Cilvx3uRHz3SkL+hhKhtA36og+gqC9AT1KBxa
	3elMd9+qZQuTaBad4nHvxximRnMyxS906XN+7jYbRsj5R6SJGEoAN7GLISuvy4Xq
	pc8vOeuEArXIzORhspb9j91sRJ/oWotARq2U6wL4fqt0I5xmQCXUyJMceMY7yl+a
	kDk9AEROdohpYcEg==
Received: (qmail 732770 invoked from network); 13 Aug 2025 21:05:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 21:05:45 +0200
X-UD-Smtp-Session: l3s3148p1@DA4G2EM8tqJtKDDX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-watchdog@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] watchdog: visconti: don't print superfluous errors
Date: Wed, 13 Aug 2025 21:05:11 +0200
Message-ID: <20250813190507.3408-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
References: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_120547_940652_85E04DEF 
X-CRM114-Status: GOOD (  11.14  )
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

The watchdog core will handle error messages already.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/visconti_wdt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/watchdog/visconti_wdt.c b/drivers/watchdog/visconti_wdt.c
index cef0794708e7..7795e7fbf67e 100644
--- a/drivers/watchdog/visconti_wdt.c
+++ b/drivers/watchdog/visconti_wdt.c
@@ -118,7 +118,6 @@ static int visconti_wdt_probe(struct platform_device *pdev)
 	struct visconti_wdt_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct clk *clk;
-	int ret;
 	unsigned long clk_freq;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -153,9 +152,7 @@ static int visconti_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_unregister(wdev);
 
 	/* This overrides the default timeout only if DT configuration was found */
-	ret = watchdog_init_timeout(wdev, 0, dev);
-	if (ret)
-		dev_warn(dev, "Specified timeout value invalid, using default\n");
+	watchdog_init_timeout(wdev, 0, dev);
 
 	return devm_watchdog_register_device(dev, wdev);
 }
-- 
2.47.2


