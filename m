Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8635606D826
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WzbXIgwJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bm3rUBsv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A76kbWEYMEb2TumRomVF4HcjLv8I1DTgmrx99YMnpQc=; b=WzbXIgwJ/kkzdu
	7mPK1TxSsuIQ4Jfmzi2W9c3eNiSeSLN9OkCoDtVBrZeOkC441mte4peO61eB51ah7B5Rntl1t+7W+
	/x3fOFhwBBN5M7jBTWPzaNxGzZiXRUp/qvb61rBpbFq09kA3NEaTLNSeC5Pxlispehnyht+rA8pG1
	nx3b9r36TO5NMNVhLRVOtFv4VmlO9bdIMPwV3j4FCPe4So6XTtbp3oz1xY8Dv6yS7AxqbUSw7JafX
	GYHzV0vzs/lt66bF3ElJ2SD7+SlXN+JNzMaPEvJ+X5QjGdJoAqBYuJp440n/7Gd6IgHaRdqm45HQJ
	xirScY9SY5TsMPHRadPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwOw-00000008t4J-380z;
	Thu, 05 Nov 2026 12:17:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwOu-00000008t30-2jFy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29C5543DF4;
	Thu,  5 Nov 2026 12:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6297D1F00A21;
	Thu,  5 Nov 2026 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881024;
	bh=A76kbWEYMEb2TumRomVF4HcjLv8I1DTgmrx99YMnpQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bm3rUBsvFPBuIMHPjlu+04EArvjSDHF3OUCcrDgbdO8nu+agGF8RxE29uqKES+j6c
	 VciAWXxbDS5KWhzZpyEqQSfLzLKUPLu77oA+fevIJH+XN21+YA5EDhScM0S1JCCEP5
	 EIBLTxpnWWB1TPnS66Cr2pMMQW8giAtMG1kE4vw64sLJk2fAq5sd8b1XdLRjmq22K9
	 6W9tyDNL5lKHnut2m+QERIgatNOLncOZJLIJ76A/Y9VHfaE5+TrsHS6xbTmnJnPVc3
	 VfRYGAGpUDRYaVROTwETCxH35Cq/MaKYUBUOJ4eopargUr8XkqPA4LNNXBOI3MABtY
	 jc/iNVxY0coKg==
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
Subject: [PATCH 01/10] iio: accel: bmc150: remove redundant pm_runtime_dont_use_autosuspend() call
Date: Thu,  5 Nov 2026 12:16:26 +0000
Message-ID: <20261105121635.1612-2-crofts@kernel.org>
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
 drivers/iio/accel/bmc150-accel-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index 46bb36d9366e..754607d1f38a 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -1751,7 +1751,6 @@ int bmc150_accel_core_probe(struct device *dev, struct regmap *regmap, int irq,
 	return 0;
 
 err_pm_cleanup:
-	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 err_trigger_unregister:
 	bmc150_accel_unregister_triggers(data, BMC150_ACCEL_TRIGGERS - 1);
-- 
2.47.3


