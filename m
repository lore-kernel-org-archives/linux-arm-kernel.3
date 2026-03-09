Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48DBEF36F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q/d+PubUJJgEQnQuB6s6hs0XHW992roQ6Kpop01fimU=; b=uJn+EM4iej1Utn+M32A7LEYo0q
	mrLQHCX6ehaTfgQj9+p8hFM1H2atwAaVJNm+1hcFfgdAB3wX29XvQEr6jMSDut/9MCZdbhA5omG6S
	k5VJtK2BisQ9PbRKsVM1d1HzQAs0xEzHJFuIKxjjVBG2jLwiBZphQmpaTaYZFTB0QHPxiEF2MiOVX
	I+DBGaSxgRnHXbyd/2dRc7+G9wtIkLKip6tfGSaX2iEsyq5bSYvj4ecfUhEmHYcHq3rjw+68hWEFV
	8uK6SRKubj7blefRCovNBMO518CEGra8D6m34C8cSHBV3NSgYcdOkTYWMvRDS0wKCPner73fgdbFX
	PtHC/Apg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVG1-00000006p3P-1bG3;
	Mon, 09 Mar 2026 07:42:29 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVFw-00000006p2b-3JrX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 07:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=q/d+PubUJJgEQn
	QuB6s6hs0XHW992roQ6Kpop01fimU=; b=bYVfChgSsYZZkfABSlbgLaAeIVlgRg
	ThOO34tnNRD0XaJoWrBZpmsLlNWvpsnrijWABsml/Hr1bB3qkMJjimHJ3CH01+xo
	KqVdInUu0TFeEcQuLTO5qhsUCn8n228U8Z1eHzl4K4ANAEHrDyhU95PzueWUcaOh
	dVZGHfnz7Qziun11V376dXlteOH6Lhii0y3wpYJakIYDXH44oroumW1HJ/J0iF77
	mFtXoqca9oYtSmWH8HPb6zn0YUpoiwBjg1+KHF7hXUrmmHxf7yL7NAIhJpoNeH9m
	/Dhz5W1Z/tLxt557jtjOkD6emhSIQiWJSBq1DrMRCiBdoam6leGF53iQ==
Received: (qmail 2669355 invoked from network); 9 Mar 2026 08:42:21 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2026 08:42:21 +0100
X-UD-Smtp-Session: l3s3148p1@K4v7ipJM+LQujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFT] mailbox: exynos: drop superfluous mbox setting per channel
Date: Mon,  9 Mar 2026 08:39:20 +0100
Message-ID: <20260309074210.2279-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_004225_109925_AD438F4F 
X-CRM114-Status: GOOD (  11.52  )
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

The core initializes the 'mbox' field exactly like this, so don't
duplicate it in the driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Only build-tested. Found because I made the same mistake in my
to-be-upstreamed driver and then looked for that pattern. Testing would
be still much appreciated!

 drivers/mailbox/exynos-mailbox.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 5f2d3b81c1db..d2355b128ba4 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -99,7 +99,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	struct mbox_controller *mbox;
 	struct mbox_chan *chans;
 	struct clk *pclk;
-	int i;
 
 	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
 	if (!exynos_mbox)
@@ -129,9 +128,6 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	mbox->ops = &exynos_mbox_chan_ops;
 	mbox->of_xlate = exynos_mbox_of_xlate;
 
-	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
-		chans[i].mbox = mbox;
-
 	exynos_mbox->mbox = mbox;
 
 	platform_set_drvdata(pdev, exynos_mbox);
-- 
2.47.3


