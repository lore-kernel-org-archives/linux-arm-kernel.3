Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34B5606EEBA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EIAs718J;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QdL/JfEY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UVkIIXb/q2/cPaHeiRUhrvGFwLmJPG5MCpguu9J85vE=; b=EIAs718J0fraPsLMBdAoziQkjN
	o6knxhy3YtXBndRF9VDI25/5VrJqLhJsCsVik9ouImQtVEhoULYxC2hj/xyuzYfSmwwY6Yi0dy7Q2
	MgEgjWqW5t8Au7Dzkry3rRhxwOCFLG/NYTa3BSC/z5hpLatJzIQwpu3fOV1ifK5SqfvF3y1zd8Ft/
	8SURsj1LJEmLeqUuDqWf/+2ahGuF5rzIHDVBTuVAgR/256C8Y3UJ6K4bF96iRe53J9TjX4H5SW/+A
	+RSmTOsYml1arxDT+emfU5irMfIg398rvQ5Yl6Lsqre4SH59/BrA6WUSNO7zv81H4YGI0P+bOaLjm
	HscV+lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwOs-00000008t1Q-1Zt2;
	Thu, 05 Nov 2026 12:17:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwOr-00000008t0Y-2G11
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21260436F1;
	Thu,  5 Nov 2026 12:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585AB1F00A15;
	Thu,  5 Nov 2026 12:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881021;
	bh=UVkIIXb/q2/cPaHeiRUhrvGFwLmJPG5MCpguu9J85vE=;
	h=From:To:Cc:Subject:Date;
	b=QdL/JfEYDKLa6NzBkN61MKh9VJbLFc1qgwKkrgJhPHH4mjmH2lUxQLh9Yk/AQhAac
	 dNIs7RgRRk74I3rt7AlKwYN+eYOUSKM/vDcox8jDm70LVmPsVsKAH+ENRsbqtDV0/1
	 CPb++Qylbu5JKhVxI0vQrq90JqMavGtnMOM3oXkS1Joi09wNcQxweUStVOugW7VYm4
	 cLN6dWhU8TVkBMCGk6ySAXUEBAQ8t8qtfeqzTFx6+xSbjSH483ojnkusS2EavJ4RsC
	 J/6IHsmPtNo2aXvmR6yehbtLvVN79i26k2xXprOOCh10yeMnKW0DWyr04cESwQ4ZCS
	 Epby4mCiPf6LA==
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
Subject: [PATCH 00/10] iio: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Thu,  5 Nov 2026 12:16:25 +0000
Message-ID: <20261105121635.1612-1-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Joshua Crofts (10):
  iio: accel: bmc150: remove redundant pm_runtime_dont_use_autosuspend()
    call
  iio: accel: kxcjk-1013: remove redundant
    pm_runtime_dont_use_autosuspend() calls
  iio: accel: mma9551: remove redundant
    pm_runtime_dont_use_autosuspend() calls
  iio: accel: mma9553: remove redundant
    pm_runtime_dont_use_autosuspend() calls
  iio: adc: at91-sama5d2_adc: remove reduntant
    pm_runtime_dont_use_autosuspend() calls
  iio: adc: imx93_adc: remove redundant
    pm_runtime_dont_use_autosuspend() call
  iio: gyro: bmg160: remove redundant pm_runtime_dont_use_autosuspend()
    call
  iio: imu: kmx61: remove redundant pm_runtime_dont_use_autosuspend()
    call
  iio: light: vncl4035: remove redundant
    pm_runtime_dont_use_autosuspend() call
  iio: magnetometer: bmc150_magn: remove redundant
    pm_runtime_dont_use_autosuspend() call

 drivers/iio/accel/bmc150-accel-core.c  | 1 -
 drivers/iio/accel/kxcjk-1013.c         | 2 --
 drivers/iio/accel/mma9551.c            | 2 --
 drivers/iio/accel/mma9553.c            | 2 --
 drivers/iio/adc/at91-sama5d2_adc.c     | 2 --
 drivers/iio/adc/imx93_adc.c            | 1 -
 drivers/iio/gyro/bmg160_core.c         | 1 -
 drivers/iio/imu/kmx61.c                | 1 -
 drivers/iio/light/vcnl4035.c           | 1 -
 drivers/iio/magnetometer/bmc150_magn.c | 1 -
 10 files changed, 14 deletions(-)


base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
-- 
2.47.3


