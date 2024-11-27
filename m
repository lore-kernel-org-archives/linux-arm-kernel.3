Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907F4D6D246
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 22:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bAaGJRZ0g9DxQwNRnNCwpJcLgLXBebqPKhJ3x1Tn6Jw=; b=1+adACDoXvRVR6SsUgjM930lmM
	1Rv2sY+Qj3aTcvXGQkWTA3wKtIsLQk1Kj026a/avwaVW+nr0KegY2LpfEGoUbzjeuj/mryaCOXggC
	HHc4v7ALKDfF8wYDa98zNvMOr/UPJXSxSdyZB0CZliwwiDYy9cWioYkBg5t+mTPLBTEkwl7JhvU6T
	xAsEcYuwm0t7GUSlGPk9BOr/R3kb7rcEOUUI7Beo1zqnAWLBoNf1U+cV6UUNpU936Swc938Cc8Hca
	Hl9HZr7tZBZP6cn/Y9AwYWKhcQZJtZuvLcnTPoo6cF2I3hBJxWgQL215Pqdy09UBdgdn977YuZbZK
	jgfbxBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGQOC-0000000EBfd-06un;
	Wed, 27 Nov 2024 22:20:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGQND-0000000EBZg-0UcP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 22:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D11445C5A15;
	Wed, 27 Nov 2024 22:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7495AC4CECC;
	Wed, 27 Nov 2024 22:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732745940;
	bh=WZnU28JF4oFrvTkupZqUD8b1N8FTJzSk9hnwMjxi+Ms=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Y8yswWud1mYBNDzqaQAwLvfUZ9fosBRLAU7j8a0q2WxQPFPrh7DASYWCrBn6ol2ko
	 t/UysSPBVtmxkw8GlSDX4+CWE6zAyHdC1Pr7tGoxpON+OBzeF10pnqMCKGEv5kahWR
	 l9CujQNJ9hS0MOHglwTbXNF9Z8fQhRewmqj4mYlZPlR8t3jYaryu6eNjuGYUwXuebA
	 WDECnMozD0JC7IPoHxRAaLDx+jahwqMmQ7/Z6eGqhkB2HZWvX7Gq7wLq5cUV2NVaFs
	 qhWsE1pBaD2q2ovFpcYsQ8fplKDmxRlrEZdsi0PFrJdYC+1XSMf4no/FUpVBM8zjfa
	 FnuksC1xEGheg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC8AD6D246;
	Wed, 27 Nov 2024 22:19:00 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 27 Nov 2024 23:18:29 +0100
Subject: [PATCH] spi: apple: Set use_gpio_descriptors to true
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-gpio-descs-v1-1-c586b518a7d5@gmail.com>
X-B4-Tracking: v=1; b=H4sIALSaR2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyNz3fSCzHzdlNTi5GJdU4u05DTLRAOTZJNkJaCGgqLUtMwKsGHRsbW
 1AJl8XwxcAAAA
X-Change-ID: 20241127-gpio-descs-58fcf9a04c4c
To: Mark Brown <broonie@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-spi@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732745939; l=929;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=I6RiQB/DHHaeohSxMjebLzpsTxP8yPVRu7SXWDHE5HI=;
 b=/c8gIuS+kh48ubs1Hq95yjV5JOPYIofMQzBlghiIjcZ++7rwW+QsSWZFb/XN5GWexuYZSF5OA
 sWKRxaSe7FrA7BQwIUEQI917LkvvL0yiRlsr6455o2So3QzqAhT9nIK
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_141903_200979_FA26149A 
X-CRM114-Status: UNSURE (   9.84  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

There is at least one peripheral that is attached to this
controller and can not use native CS. Make it possible to use
a GPIO instead.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/spi/spi-apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-apple.c b/drivers/spi/spi-apple.c
index d4b126c8701a67083e7247d1c82fb56f1725d9cb..6273352a2b2861c9da0976a46ec2adbc4c71d3d2 100644
--- a/drivers/spi/spi-apple.c
+++ b/drivers/spi/spi-apple.c
@@ -493,6 +493,7 @@ static int apple_spi_probe(struct platform_device *pdev)
 	ctlr->prepare_message = apple_spi_prepare_message;
 	ctlr->set_cs = apple_spi_set_cs;
 	ctlr->transfer_one = apple_spi_transfer_one;
+	ctlr->use_gpio_descriptors = true;
 	ctlr->auto_runtime_pm = true;
 
 	pm_runtime_set_active(&pdev->dev);

---
base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
change-id: 20241127-gpio-descs-58fcf9a04c4c



