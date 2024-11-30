Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69426D73604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JF6yjc39rJ5XBnEa0R5RAylDA0QvbSpQxpszZDvFQUo=; b=3AjfDcdfWs5++MkEnLG3gATxYt
	KUaYz3v33uJyKtZ118TdBzlgXYCY29JipqL5UCtAj0LrFhflIvOhbe6yRdZOECwpfHgyReglzpKiE
	R/GOHLCyoODr38XcUu9yeZMTPwW0l6+XqcXlBXib0Plo0R7O6+XvnH/zd16LFVK5a83MC6QWLGT+i
	QzAD8UZHNfG+LD51wySniT35QsWembnrnoX2fgx6IGWqYEHGB/yQPFnzkEvkt3WBB1VQirwyQHTmm
	NYpRYxJRofzHZn5gQ9jRdP5OOSxQLuXSdIXwDRdRyoH8r1BQn/dhM0RtW8sjlJM+MChjqf/HapGTF
	Cm8jXFkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHP3V-00000002CDo-0FOV;
	Sat, 30 Nov 2024 15:06:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHP2W-00000002CBa-0TBi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 15:05:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4349f160d62so24531115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732979141; x=1733583941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JF6yjc39rJ5XBnEa0R5RAylDA0QvbSpQxpszZDvFQUo=;
        b=snoYpPjzxK6cLKEWcQoeIYzjkUtcx3TdD2TjCXWBXh6frlU/IvGjGCe8ULN03ThkLQ
         7go5+j5H+9+o7vi/XT82apHUC6Rqn6haodls8egvI/k0c7QgKUJNfGH0G1NbEdRukJt2
         5OWQ2UdvTx2qfzQgEtofsqplmzTYCJWycWvECbH6SdZaeoBaauZZrtVbgXB+i3NczQ/1
         73kjPkdxzJZlkn2SIedEUj9qCxcoH4ycuPCGNhiZ3uko076vNPUR+wW9yLg2Thl5tVa6
         AiIHfDP975DA3IStuuUNTx3TWJNGqFquOBYc/rs8w4HfViMqtI+ra+eob6pipWYbup9L
         50Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732979141; x=1733583941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JF6yjc39rJ5XBnEa0R5RAylDA0QvbSpQxpszZDvFQUo=;
        b=K+ydyJJEN1i2e7oPfbkbPRTtXorXXhsz4KOukQs26IO4Cr40X5csKO7aK+Z3WpITLf
         pHPo0aEnbuwnGAP9hG/q0bQMnhpQrXEF3V+V4BlhcJNEkCtpl0myaUyoqAJTeOVI+KN6
         kH3mn4vm+FFAaloPobsuGQYLXyWl0tZopsbG2AYLv/vIvmDtIjG5F6Jpo5cPC7m/OCug
         X+37P9XBgHRPKwBGgkRl3efW6QLtseImPjt9QQCHQrUZQr+CyMrxeiY5Z++7yOLftfVI
         fHdePOxV01amaVasNbzf5r+jxCCzIy4uGB+xb3LOs+nHvXncwh9v+HjbqbuVDYuUVeCL
         0RcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7hkptKSfARsnm8Kv+KahCBuXibO/tXs2FsEaXJVMSQwZQg76Kl5VvymWh4WC4MbsdxEwsZ1bDym7lLTSX0JgF@lists.infradead.org
X-Gm-Message-State: AOJu0YziVfxrPuHPvUCTG/VEolTJrU/+yrOaY7Ym0EO/qzoFwj6jWJ9v
	ZZz42KtLN/lDgEVqEnDV/YXDoH76lsTREJ4Y2QviceGlMyMfzVa3hjjbKndg2bg=
X-Gm-Gg: ASbGnctetEuu9DBb+QRLUobpZXL77C17Qy3DUQ/j5LSOElfbxyiBXLByi1pHZdZ5F2S
	1HLigk0UTvQi5WjuX7SUA3F1xB83Ga8pFskJ7CqlsJe/di6zFe2EHQPG5Wbib7n7cIwHYU9vJiB
	lNfsQawMdnubCLcTglzEiq8vdrC8vV9+M/ekQ9GTpxDYjKKwLavuW81dZxaAZ5AjRsjNtmMal2a
	/vM2SnrslyJb3ng02FG+tW+0k1H/n1HLZVvY5rgTl4MOq3edw==
X-Google-Smtp-Source: AGHT+IHPAbDMIQ6/yGIOrcIvqQw8kjU4AFu9Ct5KwJyENoLNJtjiPMzmsiWMpgqZkWtqd9lHwvUiFA==
X-Received: by 2002:a5d:5f49:0:b0:382:5088:9360 with SMTP id ffacd0b85a97d-385c6ec10cbmr13474091f8f.27.1732979141250;
        Sat, 30 Nov 2024 07:05:41 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:7ca4:5604:f5:65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e3cbe250sm1821506f8f.94.2024.11.30.07.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 07:05:40 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jeremy Kerr <jk@ozlabs.org>,
	Joel Stanley <joel@jms.id.au>
Cc: Alistar Popple <alistair@popple.id.au>,
	Eddie James <eajames@linux.ibm.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-fsi@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] fsc: Switch back to struct platform_driver::remove()
Date: Sat, 30 Nov 2024 16:05:30 +0100
Message-ID: <20241130150530.901263-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3773; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Bqas92zwF99z3ReliNfJNCc/In/DD6ZsHo3T+NcHYfw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnSym7jgNEnZEjMjc6En77+mlJuIUWVmDjtkOae NdFhPpXBCaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0spuwAKCRCPgPtYfRL+ TvJ/B/sFqmNksRCXM3qY5nBnzX555X3gvXXjqtmF0VgmPtSn8qLWhbQ2G+yV34VVuTJy4dkqJLK ttZSQlFlBN8YX/ObmZsh+2Y1U0LgN0toW9IyJF/qgtGy3ygimznTF5RIJawRvn8OYF4sSlhq+6w tmmVbddzq1XWl64FQFCwkubITE29MmdN+EFqliAVmV1KdKxsfvUVyPGIzf2se8zrjYrdo4qhV8y Ouktn7ab16cQimk4Mfbsyv8C49hEvzmwaeG8vC5ETak+TMal50cdN4V3s+LDOq2vGuA3gQOaw10 xlDpsM4n1GCQ/C4q0SnXO1JYZFkY2IgLPAekjZr6FkMhiLmP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_070544_152838_B0634BE9 
X-CRM114-Status: GOOD (  16.66  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/fsi to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

While touching these drivers, make the alignment of the touched
initializers consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on Friday's next, feel free to drop changes that result in
a conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

This is merge window material.

Best regards
Uwe

 drivers/fsi/fsi-master-aspeed.c | 4 ++--
 drivers/fsi/fsi-master-ast-cf.c | 4 ++--
 drivers/fsi/fsi-master-gpio.c   | 4 ++--
 drivers/fsi/fsi-occ.c           | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 6f5e1bdf7e40..0f66bc8ac2de 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -661,12 +661,12 @@ static const struct of_device_id fsi_master_aspeed_match[] = {
 MODULE_DEVICE_TABLE(of, fsi_master_aspeed_match);
 
 static struct platform_driver fsi_master_aspeed_driver = {
-	.driver = {
+	.driver	= {
 		.name		= "fsi-master-aspeed",
 		.of_match_table	= fsi_master_aspeed_match,
 	},
 	.probe	= fsi_master_aspeed_probe,
-	.remove_new = fsi_master_aspeed_remove,
+	.remove	= fsi_master_aspeed_remove,
 };
 
 module_platform_driver(fsi_master_aspeed_driver);
diff --git a/drivers/fsi/fsi-master-ast-cf.c b/drivers/fsi/fsi-master-ast-cf.c
index a4c37ff8edd6..4ed2f33284cf 100644
--- a/drivers/fsi/fsi-master-ast-cf.c
+++ b/drivers/fsi/fsi-master-ast-cf.c
@@ -1429,12 +1429,12 @@ static const struct of_device_id fsi_master_acf_match[] = {
 MODULE_DEVICE_TABLE(of, fsi_master_acf_match);
 
 static struct platform_driver fsi_master_acf = {
-	.driver = {
+	.driver	= {
 		.name		= "fsi-master-acf",
 		.of_match_table	= fsi_master_acf_match,
 	},
 	.probe	= fsi_master_acf_probe,
-	.remove_new = fsi_master_acf_remove,
+	.remove	= fsi_master_acf_remove,
 };
 
 module_platform_driver(fsi_master_acf);
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index f761344f4873..9f8bfc43ad93 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -883,12 +883,12 @@ static const struct of_device_id fsi_master_gpio_match[] = {
 MODULE_DEVICE_TABLE(of, fsi_master_gpio_match);
 
 static struct platform_driver fsi_master_gpio_driver = {
-	.driver = {
+	.driver	= {
 		.name		= "fsi-master-gpio",
 		.of_match_table	= fsi_master_gpio_match,
 	},
 	.probe	= fsi_master_gpio_probe,
-	.remove_new = fsi_master_gpio_remove,
+	.remove	= fsi_master_gpio_remove,
 };
 
 module_platform_driver(fsi_master_gpio_driver);
diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index a6d4c8f123a5..b5a7372a680c 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -737,10 +737,10 @@ MODULE_DEVICE_TABLE(of, occ_match);
 static struct platform_driver occ_driver = {
 	.driver = {
 		.name = "occ",
-		.of_match_table	= occ_match,
+		.of_match_table = occ_match,
 	},
-	.probe	= occ_probe,
-	.remove_new = occ_remove,
+	.probe = occ_probe,
+	.remove = occ_remove,
 };
 
 static int occ_init(void)

base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
-- 
2.45.2


