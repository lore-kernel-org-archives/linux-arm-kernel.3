Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B996082BE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lnLAdk2Q;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OzXB0Lon
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JZWUGcZ5u7WJGAMaT+eTPSh/6aXL9QXO1uj0eqCm/8M=; b=lnLAdk2QzMkTOp
	u2H0MKTpLqcJneCWCI6I3pea9TvJlHQJpRmTq4/GZJDB5FsW0JGzf5ctkpvchsMWgtTAMLLSGCyBm
	QigJ6BSBhzcEAYRRVri5lfDOjY0OdqIYgXOKp/f/BwRGNQ7zM+YnDqdI2LH33IbDEe80FImywapqo
	4ZX7S0gKd0AH6c7VRnpMhvWTnLdHkrlPhFVmyDIVZbFdKkJYjXuDjTnnzGXJw7D47J1x6Zmh4GWkq
	WZSiAWED8EPxTYiBXhZaN9hq6xbsvRV+LOesvKIou/ZzHpGich84aYDPoZQVFaCN1G9AcT/H4mFDL
	drXvz8jm5LsA8VICXqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwOz-00000008t6P-3hyU;
	Thu, 05 Nov 2026 12:17:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwOx-00000008t50-1iwZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F97F40DFF;
	Thu,  5 Nov 2026 12:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4F71F00A20;
	Thu,  5 Nov 2026 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881027;
	bh=JZWUGcZ5u7WJGAMaT+eTPSh/6aXL9QXO1uj0eqCm/8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OzXB0Lon99UCSymj6rvC7HShLWnztmNTotIk344eHS7e8dQhxPcKs7l3Lt6aBMMqE
	 evSwMkEZd8cfQ+CFA7+Vf/eC4Cu0p0QxqA7EbwsmpBZN6z8Vo+KxQld8T5pAMyvvkn
	 FNY7OeBQ51A+zjlSI41SqL1rJ4KT55TlxVy5hrsbyUFQjh0AWQstpO2job2ekJNDbn
	 RdAKowoNfBxJj2g+t39ycGKZbCG2qeXdHONIEjRc18lQO38OWv32X1iyQhgzajLP+1
	 Pz3PRc5ACzjtJi2fGvnRMgUMxMesZreG2m7PCmaDS5A+oEInELMWa0UMJLBzvDPLu8
	 lsjxKjs4S+r0w==
From: Joshua Crofts <crofts@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Eugen Hristev <ehristev@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH 02/10] iio: accel: kxcjk-1013: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Thu,  5 Nov 2026 12:16:27 +0000
Message-ID: <20261105121635.1612-3-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105121635.1612-1-crofts@kernel.org>
References: <20261105121635.1612-1-crofts@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/iio/accel/kxcjk-1013.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
index 336914eb3b3e..18b1ba365f78 100644
--- a/drivers/iio/accel/kxcjk-1013.c
+++ b/drivers/iio/accel/kxcjk-1013.c
@@ -1525,7 +1525,6 @@ static int kxcjk1013_probe(struct i2c_client *client)
 	return 0;
 
 err_pm_cleanup:
-	pm_runtime_dont_use_autosuspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 err_buffer_cleanup:
 	iio_triggered_buffer_cleanup(indio_dev);
@@ -1547,7 +1546,6 @@ static void kxcjk1013_remove(struct i2c_client *client)
 
 	iio_device_unregister(indio_dev);
 
-	pm_runtime_dont_use_autosuspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 
-- 
2.47.3


