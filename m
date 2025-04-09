Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE00C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDgv5OvD5LGMx3c6bTQfUYPg40wvMssj6qP2OCvHmL0=; b=dqAgEeZbw+jWHRvawQyXGSt7iK
	VmsepWbDaQCJ8K96X66UsUC5KQ5epgbwf4k+/e17wnKElhDlQEsItpmqWv2cmiJaL8QZyoJlScAIr
	iEYmROSIOYpynnE/slF6Z2jNAiRJ6RO22dOMp/VGcMUWAEAV4csSGPzv9OQtBxJvBmpxTqVUzBIin
	cbLQeBC3QR8hEWWgyinWWuYiDzAgGyYpmscGYlwhVr9pURYdrKe7OZFA3vK8RgKPAFUPZuzVPUlvZ
	zRhMvgHDTzWdx64RODOv/q9/UN7LQxV9/FjJ1Jl1ZQz4Mk78qz1zTgSWQ93Y/5E06Ua1S4phRskbN
	nPrheLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UWQ-000000078fx-3V4C;
	Wed, 09 Apr 2025 12:27:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UT2-000000077yA-05EJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61CA15C2DAE;
	Wed,  9 Apr 2025 12:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC35C4CEE3;
	Wed,  9 Apr 2025 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201423;
	bh=ndAoFBQiFkaWAC8OWaF8W+3qr9/sgyFXOJUizNVSs08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ih9nkr9EK+GvVC1zn1vkzYS6i+GnRJQqGzU+CyioHyp721JLoTfNdARiWF52J7SOx
	 nde/NDMXSJkHQBIgZryWvxl0UEaC2KT1a+DC9lwJwld8f+udb55yF7GldEgTyvpmhS
	 JulpQKa7Oq4EHTuCmz3rqU86y1W52CG01cTcI2cIzdgLF35Jw7LjESz6l/CHlGO5IO
	 OUMFHEiEKeiUVStSxL2xtivilWaWrQ0+3vTzt6esb2NR58/Udha3FPNPmMh6bRUprb
	 ocYTIwL2/JPxNyFjMa9q44+po4nj8RHLaSCefvzEcly9Iv7SU6Zuvzz8/3dGBLVuf0
	 5gAfcUqzyrNWw==
From: Arnd Bergmann <arnd@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] [v2] Input: stmpe-ts - use module alias instead of device table
Date: Wed,  9 Apr 2025 14:22:55 +0200
Message-Id: <20250409122314.2848028-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_052344_115157_1B9D8271 
X-CRM114-Status: GOOD (  15.65  )
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

When compile tested with W=1 on x86_64 with driver as built-in:

  stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]

Ideally this would be referenced from the platform_driver, but since
the compatible string is already matched by the mfd driver for its
parent device, that would break probing.

In this case, the of_device_id table just serves as a module alias
for loading the driver, while the device itself is probed using
the platform device name.

Remove the table and instead use a module alias that reflects how
the driver is actually probed.

Link: https://lore.kernel.org/lkml/20240403080702.3509288-8-arnd@kernel.org/
Link: https://lore.kernel.org/lkml/181dbdb8-c050-4966-8cb4-2f39495ff3f9@app.fastmail.com/
Cc: Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: use a different approach, hopefully this makes more sense.
---
 drivers/input/touchscreen/stmpe-ts.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index a94a1997f96b..af0fb38bcfdc 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -366,12 +366,7 @@ static struct platform_driver stmpe_ts_driver = {
 };
 module_platform_driver(stmpe_ts_driver);
 
-static const struct of_device_id stmpe_ts_ids[] = {
-	{ .compatible = "st,stmpe-ts", },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, stmpe_ts_ids);
-
+MODULE_ALIAS("platform:stmpe-ts");
 MODULE_AUTHOR("Luotao Fu <l.fu@pengutronix.de>");
 MODULE_DESCRIPTION("STMPEXXX touchscreen driver");
 MODULE_LICENSE("GPL");
-- 
2.39.5


