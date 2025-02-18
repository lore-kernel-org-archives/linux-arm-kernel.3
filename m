Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC59C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 03:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f3CbPlmh3sHKCr4h2q4NBJY7IFm6y5tBiOCFjrBwvTs=; b=ylW6KjSJwPDwkSLQJCPfcas33Q
	rNOWXMT6z0Hhy2c0e4YBGZApvBSX4PKmwDlsz9Q3vTmz9mXrdK0nlwBb51JJhcMt/Yn2FP7f/Ss6K
	PNqlffbJn0vpnCiSH8XdI3AIO5lyRhX9yuA7ZDnqjWCE1VZ9bOikMPMESMXZhcIYHOY5EfyCxet9v
	iO0spuqYo1JIE5ydmXGWaniTCY6k31PUSHnxpCKe/OpOXEGjfJRn8EMMWpFJt36OHinph2Db7w28C
	Q8VBYHtBfQ6eSzWvI4+QNumt3dLeYuh9WZcJN5jP7KUVgLtDUgdBFs6REJlDzoEUYAj4f782+7/P2
	w6M5015Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkE8c-00000006bY0-3RKl;
	Tue, 18 Feb 2025 03:19:10 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkE78-00000006bN3-3D98
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 03:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739848652; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=f3CbPlmh3sHKCr4h2q4NBJY7IFm6y5tBiOCFjrBwvTs=;
	b=bSafPr+m0l3rw1RgKz8aasL+jcOHBSpTP/x9eGO9izMQYOIAC39Fh4dPKZoMYMnaItkTcOCWC8ai6PBDq387+HIM4nEdNpryUjV/JNPZ9FHmbqY7ZaCFaGxGJmeI3ObVCbz5piHErrGZ8XugPNbI5MrL93OF26TzXOaXkDXZ8yM=
Received: from 03382176d5c3.tbsite.net(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0WPk8NtB_1739848638 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Feb 2025 11:17:28 +0800
From: Heyi Guo <guoheyi@linux.alibaba.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Heyi Guo <guoheyi@linux.alibaba.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting down logic
Date: Tue, 18 Feb 2025 11:16:58 +0800
Message-ID: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_191739_493583_CE451CFF 
X-CRM114-Status: UNSURE (   8.01  )
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

Aspeed watchdog uses counting down logic, so the value set to register
should be the value of subtracting pretimeout from total timeout.

Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")

Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Eddie James <eajames@linux.ibm.com>
---
 drivers/watchdog/aspeed_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b4773a6aaf8c..520d8aba12a5 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -187,6 +187,13 @@ static int aspeed_wdt_set_pretimeout(struct watchdog_device *wdd,
 	u32 actual = pretimeout * WDT_RATE_1MHZ;
 	u32 s = wdt->cfg->irq_shift;
 	u32 m = wdt->cfg->irq_mask;
+	u32 reload = readl(wdt->base + WDT_RELOAD_VALUE);
+
+	if (actual >= reload)
+		return -EINVAL;
+
+	/* watchdog timer is counting down */
+	actual = reload - actual;
 
 	wdd->pretimeout = pretimeout;
 	wdt->ctrl &= ~m;
-- 
2.43.0


