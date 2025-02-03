Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB5BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=49g7WSyYR8+Wt6OcEq9kBBhsJOIcfmFAb/kxBSWoTsw=; b=WQbfQUva0FM8F11Xq+qIbSAoZE
	Qrb8Ty9vAypw2Ia108BeNlFyn5wGOcdQnCQEXVgGa9zODBAZSq5fp0fGrBUY+OcO+ivYTVXv5hngm
	o7v7Q1ed+/jnkIBOhO+S36MM8FtPGvIU9/8/Ew4NpHynWO6O1AnI7jHWe2cZe3mPCKhxZAT34ENtK
	7/FAO0OxlaQCP/6bif218+QsN61vHemzZfL6KuwdkN9HLJ+RRuzSclrfK7S+rue4ABPVlwHCflWJ2
	lRHnExDCirnbplzQeYoqvMU+HBznW/17OIhuTne3M/6PyaW3syswk3hVMibwjGXBJJRKJcnlZhYul
	Uhmq9QRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuh8-0000000FFJ1-0vR9;
	Mon, 03 Feb 2025 11:32:50 +0000
Received: from mail-gw01.astralinux.ru ([37.230.196.243])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teuei-0000000FEyq-0ewC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:30:22 +0000
Received: from gca-sc-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw01.astralinux.ru (Postfix) with ESMTP id 630DD24D3A;
	Mon,  3 Feb 2025 14:30:12 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail04.astralinux.ru [10.177.185.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw01.astralinux.ru (Postfix) with ESMTPS;
	Mon,  3 Feb 2025 14:30:05 +0300 (MSK)
Received: from localhost.localdomain (unknown [10.198.57.103])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4Ymkn30cV8zkWyl;
	Mon,  3 Feb 2025 14:29:58 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	David Laight <david.laight.linux@gmail.com>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] clk: sunxi: clean up rate counting
Date: Mon,  3 Feb 2025 14:29:28 +0300
Message-ID: <20250203112930.650813-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Tracking_from_domain_doesnt_match_to}, astralinux.ru:7.1.1;new-mail.astralinux.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190748 [Feb 03 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2025/02/03 07:33:00 #27201296
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_033020_357632_23023F01 
X-CRM114-Status: GOOD (  11.29  )
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

If n = 255, the result of multiplication of n and 24000000
may not fit int type. Swap division and shift with multiplication.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 drivers/clk/sunxi/clk-sun9i-core.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
index d93c7a53c6c0..639c83ed63b8 100644
--- a/drivers/clk/sunxi/clk-sun9i-core.c
+++ b/drivers/clk/sunxi/clk-sun9i-core.c
@@ -25,12 +25,12 @@
 
 static void sun9i_a80_get_pll4_factors(struct factors_request *req)
 {
-	int n;
-	int m = 1;
-	int p = 1;
+	unsigned int n;
+	unsigned int m = 1;
+	unsigned int p = 1;
 
 	/* Normalize value to a 6 MHz multiple (24 MHz / 4) */
-	n = DIV_ROUND_UP(req->rate, 6000000);
+	n = DIV_ROUND_UP(req->rate, 6000000ul);
 
 	/* If n is too large switch to steps of 12 MHz */
 	if (n > 255) {
@@ -50,7 +50,11 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
 	else if (n < 12)
 		n = 12;
 
-	req->rate = ((24000000 * n) >> p) / (m + 1);
+	/* Division and shift should be done before multiplication to
+	 * avoid overflow. The result will be correct because '>> p' and
+	 * '/ (m + 1)' are both just conditional 'divide by 2'
+	 */
+	req->rate = ((24000000ul >> p) / (m + 1)) * n;
 	req->n = n;
 	req->m = m;
 	req->p = p;
-- 
2.43.0


