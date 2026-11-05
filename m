Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71299606EE86
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xo4ZTc0b;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwHYYMQA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QUHMmcOW+XDbVYGagQbDFPA+A/AMi6QA2veHRlPHrFw=; b=xo4ZTc0bvEJPcb
	RIXqzEe4kIn9osLI/FQcQnAac4ZS/5Epm9y9Yy8kYesXElpV0wupLOZVC2yJDvN+p/nmKtDR8/yJk
	qunNWWzDduRjp4qowalpAohhL5Z9xohd6O5AbYEQ7Mhk4uGaLy1uGnR73RoK7TD6W5wx0+0EQiFkM
	yGjQrwDAmJs1JHbS3kx+qkSolcQbPpn4yWGFtpPQlSgqeZvmOvcE5FpXdo2+ZrhzP2j0me393wH45
	LOeAJY5QMxuKnAYfccTcJHivJapCFEqhR7pMqpNyQFjKWHuOaHwUs5owABRHqFNrPeCU2VQ37Qgt3
	ND+FhUfiM4oTrh9W+YlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPQ-00000008tYA-1NlF;
	Thu, 05 Nov 2026 12:17:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPM-00000008tRv-0Mo9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 850CF60F4D;
	Thu,  5 Nov 2026 12:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AAD1F00A1B;
	Thu,  5 Nov 2026 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881051;
	bh=QUHMmcOW+XDbVYGagQbDFPA+A/AMi6QA2veHRlPHrFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IwHYYMQAUcTz0BPOF9YL5ylp7tRiBQ8L2QBWhjH8B6Z8wvbhFgukxk2ghxPFhbpDw
	 Wp15i9YaLCSBRaU4WGZy5xUFlUL4hnJoSU4N/2OPH84eQ1h58AXcL1mLtJPdwFYCRl
	 aRKZ6lbbcXnsF2HUrBzXe3ae04kFs7Qzz+erHrmK+NWe5D2qflKw17GNh5eK5uaBgq
	 fvBCXF0KFCmclAtOAC5ptxN5MfinwC7mHv1v7T7HnoMVDv+fBVaKwPJQ5mJn2+2/tj
	 tokI2+Ah2o+OGIfE7U7Kr5lsMZeJmYJy5VbDXWL4Y0YKiatf6jWDWW7R1mxshyGkP2
	 s58VwXVwx0XVA==
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
Subject: [PATCH 10/10] iio: magnetometer: bmc150_magn: remove redundant pm_runtime_dont_use_autosuspend() call
Date: Thu,  5 Nov 2026 12:16:35 +0000
Message-ID: <20261105121635.1612-11-crofts@kernel.org>
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
 drivers/iio/magnetometer/bmc150_magn.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/magnetometer/bmc150_magn.c b/drivers/iio/magnetometer/bmc150_magn.c
index 32dff9cdd0f7..16b5c2451728 100644
--- a/drivers/iio/magnetometer/bmc150_magn.c
+++ b/drivers/iio/magnetometer/bmc150_magn.c
@@ -934,7 +934,6 @@ int bmc150_magn_probe(struct device *dev, struct regmap *regmap,
 	return 0;
 
 err_pm_cleanup:
-	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 err_buffer_cleanup:
 	iio_triggered_buffer_cleanup(indio_dev);
-- 
2.47.3


