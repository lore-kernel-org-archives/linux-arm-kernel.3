Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4100B606D837
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZgBOWnzg;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVYaD0st
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wQ5jLWVoPk+bZDBKkEyUn0p6ouIdE66a051s+AWfEdk=; b=ZgBOWnzgjwG/Uo
	EPELArAoGLQEX+PccTVQPwphCqfVtcqJOXMrAyqjrzPdS+Vl8Qz+1P+WmdyvAbXF/WfGRyB8+JNTo
	t/wxmTTDN9orObbYYm+NoqVWtnpRhFxupVfx2w0SgjPWiYiS33xuD6yTHOpyO8c3UN/wQ9+EQTXwP
	DLSG6vqeGi/GKBYs9DkuRDhTRsaN0mfLjMIQb0XVXPd6rF6Hnc5au7865ZAtZGUSXpMERAsrw3aDZ
	H+8UpSD6vib+w3Qq/Y9BDbEXx9iFQJK9DNTjCcRhqxILQQmZXSIuAmPuyhpYg7rkp8KME4PKqrdHg
	dBGdI6bEOsZxUmMakI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwP5-00000008tA6-0bO8;
	Thu, 05 Nov 2026 12:17:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwP3-00000008t93-28mc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3937E44517;
	Thu,  5 Nov 2026 12:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772CA1F0180B;
	Thu,  5 Nov 2026 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881033;
	bh=wQ5jLWVoPk+bZDBKkEyUn0p6ouIdE66a051s+AWfEdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QVYaD0stkBJAL7+LUNRABRwwlbRtG/XafIDfJlTD8/E7Z7kdyI2DtkorRNi4COiJC
	 kbRSg52AAdqgJfrsv79tOEjCzJDnhfewpcAm7K22ZlWnOCgh+nCdu2S9jY5URh8DhK
	 OANsjirk9Uzv+JEsAH9B06YbHS4ZIO1gk++TNnOkxuS3BMRdAcO5Zh4E9iQUtxeTfD
	 sCZZireYV2Re0t3ukMCHCEB6ohYsctpCjQAsa4gpU/QD9HgvfiGop5NS+y1/2hDkRs
	 0cSKyQ4kKAol+RB4QNV5WrzTZeK7X4IR9H3PdoPoD0DYrbcMvuMRlFoCZgbavze/pK
	 QvDFepXb3IsgA==
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
Subject: [PATCH 04/10] iio: accel: mma9553: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Thu,  5 Nov 2026 12:16:29 +0000
Message-ID: <20261105121635.1612-5-crofts@kernel.org>
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
 drivers/iio/accel/mma9553.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/accel/mma9553.c b/drivers/iio/accel/mma9553.c
index f623a0ac6f31..dacea12d702f 100644
--- a/drivers/iio/accel/mma9553.c
+++ b/drivers/iio/accel/mma9553.c
@@ -1122,7 +1122,6 @@ static int mma9553_probe(struct i2c_client *client)
 	return 0;
 
 err_pm_cleanup:
-	pm_runtime_dont_use_autosuspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 out_poweroff:
 	mma9551_set_device_state(client, false);
@@ -1136,7 +1135,6 @@ static void mma9553_remove(struct i2c_client *client)
 
 	iio_device_unregister(indio_dev);
 
-	pm_runtime_dont_use_autosuspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 
-- 
2.47.3


