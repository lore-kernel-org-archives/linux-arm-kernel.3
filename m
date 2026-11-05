Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BA5606EE93
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z8U3E9dG;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpTGiKDR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7VlBoOECwIyEF/oYh2BB6rvaEtQ85D/IgkCWg3P1M34=; b=Z8U3E9dGNzL2yU
	WPRFczI52dyWsm4d8+Ga/6KLZhX0pdtyjU2PbsP1qqD9Ly/wyKzbjA7rhgSVe/8hSEyiggIH82/ju
	ezt7IGIPjTnj8ivezE0Kxx4fgSJcNl0PY1dOHXLE64F3YHjYAFNfntvrx53NU0R5sC8/4bW3qFHTK
	hfJkzqnVdz5Y98m8Rs9mbkNeoB2Ft2NL95AQqCcnwxQd+lMsda7YHYGWdSH2V34E1DeFQ6LYcEFIz
	VVBrnTmgM7kv1pZO+Vg58ZSZ/DFIYxQEGIFWYm8sNACI7FXygm39JIQyKrLz7Ktu9dX68uUUd32ez
	h9trbPqE9g8OHAcJB6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPJ-00000008tNp-09IP;
	Thu, 05 Nov 2026 12:17:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPG-00000008tKA-0lgC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7ACC8605F4;
	Thu,  5 Nov 2026 12:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8501F00A02;
	Thu,  5 Nov 2026 12:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881045;
	bh=7VlBoOECwIyEF/oYh2BB6rvaEtQ85D/IgkCWg3P1M34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VpTGiKDR6bBKAch4lgZlUDWYdY0UC3upO6lVewOG6iaRwuU+h9wSnpgBz958Dcxq5
	 jBlupzi2jLLB2S3uZYGVexzwwiw+cdLAkklosewF2GLcdIFOweAw2mwjLp9XtJ3Dfg
	 XActJH25+5fEva19UOalJF4qSq8EV4eYtq6V/gTGjf97u6dS/r/u4iPnElOqCtyLvt
	 BAipgsX5MtoNytG2kYJEbZ4F/i7TOKU8gwcWmRvR1ORCLxtqkBMgnaNY3mSXbVMGx9
	 xS2vFaq61K/vYw+j0vX5QUufHwioSZAwV5PVAO8DTGhdgTIcHDgzfSpheuqD8yHHDD
	 CWwlTVUHlVC7A==
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
Subject: [PATCH 08/10] iio: imu: kmx61: remove redundant pm_runtime_dont_use_autosuspend() call
Date: Thu,  5 Nov 2026 12:16:33 +0000
Message-ID: <20261105121635.1612-9-crofts@kernel.org>
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
 drivers/iio/imu/kmx61.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/imu/kmx61.c b/drivers/iio/imu/kmx61.c
index 1ca998f44eb2..bc8e88ffe430 100644
--- a/drivers/iio/imu/kmx61.c
+++ b/drivers/iio/imu/kmx61.c
@@ -1388,7 +1388,6 @@ static int kmx61_probe(struct i2c_client *client)
 err_iio_unregister_acc:
 	iio_device_unregister(data->acc_indio_dev);
 err_pm_cleanup:
-	pm_runtime_dont_use_autosuspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 err_buffer_cleanup_mag:
 	if (client->irq > 0)
-- 
2.47.3


