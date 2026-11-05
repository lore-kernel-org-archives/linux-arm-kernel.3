Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C90A606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ml2Z3jHZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W03p2Rq5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x0ny1hflXgtAOuLHGShrT2M6OxxVHd/PDiWsnRTWcjY=; b=Ml2Z3jHZ4K/svK
	2mJBcD69wddkY/A8XwMpCYfsVxJQqeEmpPiDZNXxeUS7kghkNmtGZl3VhxGs6Li5/nPZaOatM0vb5
	tqvClvSAOzvpR25AqCXWMzbKoEJrDnrXVNW4CBheWCPaSV8hAddyLtOtytDq4XELjhvAy0MmbDT8W
	bl7omdflqJ6jeBT82tkxz8rWH9VPS81+ClrhDu44XKGGjHrcccOQf4saNqMrk+LCY3LMKaqB6gVl4
	nHzKjVYqOWVmDkAxMWbX1/K2DCDfA53prp+iCjNly4byT6NUQGbNwiQo5oLreNygbffWfuuzooBfT
	z4pVmixANYzTMIdY8Q+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwP8-00000008tCQ-14fY;
	Thu, 05 Nov 2026 12:17:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwP6-00000008tB2-24Xw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41D1343D98;
	Thu,  5 Nov 2026 12:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCCC1F0093A;
	Thu,  5 Nov 2026 12:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881036;
	bh=x0ny1hflXgtAOuLHGShrT2M6OxxVHd/PDiWsnRTWcjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W03p2Rq5CL81QfWCncZH9oAde0lsNirH2YQJvZDq39dSiNjT7JvzmaaGegLiBqhW1
	 82lMIe6ZE3uTxSITrfbOCSrbDorNRjTVXol9PGQcbS6RXAEV5TdwbigOSMokFgG3es
	 IxSHnYtxOrMSWgm/+qMBJM4qPuYTFY+FMH+DmsZdAqAsZh3bZ/KR6ljXnhDn/81r1D
	 M3aVV07GMM6+bVh1caEtBz8xK+1euELNIkHFbFh0pwVvfZeRAiXpFmITyjtjh7Psgu
	 Reghd7D0THinh6rNAe74h71mG+vl0AVjU3YyohuiXjUze6/UwBNr+11+0wHxr4ovfh
	 0+1Dekjchv7EQ==
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
Subject: [PATCH 05/10] iio: adc: at91-sama5d2_adc: remove reduntant pm_runtime_dont_use_autosuspend() calls
Date: Thu,  5 Nov 2026 12:16:30 +0000
Message-ID: <20261105121635.1612-6-crofts@kernel.org>
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
 drivers/iio/adc/at91-sama5d2_adc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 78081cbfde5e..2f7d2cee81f9 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -2469,7 +2469,6 @@ static int at91_adc_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(st->dev);
 	pm_runtime_disable(st->dev);
 	pm_runtime_set_suspended(st->dev);
-	pm_runtime_dont_use_autosuspend(st->dev);
 	clk_disable_unprepare(st->per_clk);
 vref_disable:
 	regulator_disable(st->vref);
@@ -2490,7 +2489,6 @@ static void at91_adc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(st->dev);
 	pm_runtime_set_suspended(st->dev);
-	pm_runtime_dont_use_autosuspend(st->dev);
 	clk_disable_unprepare(st->per_clk);
 
 	regulator_disable(st->vref);
-- 
2.47.3


