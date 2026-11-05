Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A54B6083635
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y/wW1RHy;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YUoirBPX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i/6zR46dYGjFw0n/4PpbA5N+Te6DN9VonOFVqLNLWQs=; b=y/wW1RHyT7pYMu
	ztRTfM4YALHtvuPpx6xE5ZrnUgBgVQP9VLX32SbldQbdrNhr5RRqd/DjvWrpnCz6w0t9FoTTK1/ag
	j5RC1lrUTM928IyZbDmwRFIdMFHsZR0vBErMm+ioNj4sK62Yi31huCD7hsaRUCAEvWfqlkl4MyE2B
	nY1E4q6ID5ezIYu8Ac0MAYTa8Nujq7kIET0zlq0fJ0u9OHMHA5Q7jn7RGCNB9sdK2b5IKAHirZGxv
	2Whuoc+HhmqG+Ut4YtnuInq9ja5xuOWsiocO76/BfVNoNdBpActVNKVGrGpmY0jz1g63XEdxR7eVX
	gmEPeTajCCl2Zt7Pl8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPM-00000008tSZ-0fLS;
	Thu, 05 Nov 2026 12:17:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPI-00000008tMw-2TUF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56157439DA;
	Thu,  5 Nov 2026 12:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A3D1F00A15;
	Thu,  5 Nov 2026 12:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881048;
	bh=i/6zR46dYGjFw0n/4PpbA5N+Te6DN9VonOFVqLNLWQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YUoirBPX+0MBci2wP+U5q5aEM9AZBSWaRXbCjqYXEtTEub3LEfepgLooGdhQhI8HB
	 G6KpjHm22BaBjsXyFoPI4NzFlRVn+m2Rj7foza6gC9VXW41puhvwj9f/rJT/SNvy/7
	 I6hlrpqYbqhsmTXsImuMB0hdRL4a4ZIZmvYtMLljiCnweArnarBv6n9tlg8oB7668r
	 GE+sDUN0EEPUQybdh95fxKTQAiwrqbrJlVHXvzwYEgSLZMkc8cyjpJz+HiUAUTILoz
	 UE7sDAUTOmeiO7zMC4WPSMoMaMmldy38v0NUwZjmhaho3ghEv756TW2tV4uJ3kMx1s
	 B562/QtvZ3tIA==
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
Subject: [PATCH 09/10] iio: light: vncl4035: remove redundant pm_runtime_dont_use_autosuspend() call
Date: Thu,  5 Nov 2026 12:16:34 +0000
Message-ID: <20261105121635.1612-10-crofts@kernel.org>
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

Remove the redundant function call.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/iio/light/vcnl4035.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/light/vcnl4035.c b/drivers/iio/light/vcnl4035.c
index 23bd0d42363d..c34a2ab073a1 100644
--- a/drivers/iio/light/vcnl4035.c
+++ b/drivers/iio/light/vcnl4035.c
@@ -607,7 +607,6 @@ static void vcnl4035_remove(struct i2c_client *client)
 	struct iio_dev *indio_dev = i2c_get_clientdata(client);
 	int ret;
 
-	pm_runtime_dont_use_autosuspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 	iio_device_unregister(indio_dev);
 	pm_runtime_set_suspended(&client->dev);
-- 
2.47.3


