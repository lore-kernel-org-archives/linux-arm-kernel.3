Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6636606C90A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4jqJxF6S;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZcO9pAiw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kpp5+50BfXdZ4MsPgczvkT7J6pbEoXoazOv6sr/VEPQ=; b=4jqJxF6SON3thV
	4hSVyaUYEGM5x3FoKLxzzqj+IXtSlTdYfVLEHB5vjywGu2v2f2H2RTY23G51B42Y3fuFgigDa0g/x
	lxVKOO5JpAK70aqRd48FdCfPmAGlaI+M6FDQa7mRoe9i3Zxl3vrzRPMFGBnEysm6YZjTTQy4sYPGc
	5PHG5KYO16PRNXYrZMIsR7P3Oxu0p8pvAE39mqCfExUHNaeK+1lYkThct+tkNXtuku0FJWg3KTetE
	ZfrOMhl0NIUhv8IH+3Y1vgbURfDRV7snZJK5XHj1qpDMUPpJY7bBnvFrin5pNoegaJkcIJX19IJa0
	eII1kAsKl84KV2eZGWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOib5-000000072jk-3NsA;
	Wed, 04 Nov 2026 21:32:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiay-000000072Yu-24GR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED18660F19;
	Wed,  4 Nov 2026 21:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF1C1F000C1;
	Wed,  4 Nov 2026 21:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827955;
	bh=Kpp5+50BfXdZ4MsPgczvkT7J6pbEoXoazOv6sr/VEPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZcO9pAiwfspwPRWmBRhD38VoUjfP5epRH2XhXQ3RgEDBl2p2ahW9G8tW6I+bS2ZLg
	 VybTbs+NKjBQWzaVLZoA8knmF2t/bWDLm2DmyNhyonWNecD7RENb1pCh/QVTXArr1N
	 6jiv6Fv2mhEz8Os4W5xhS5+WyZKh6va7v6cQnUcusC+buZScqn6eJYMxrSZdcur4NW
	 sDmEzXGJMHieoW5ZNlI7BxMUjpvXTARqkIjs6DjCocSl3eDBtDNidlvTAKbIdg+TLP
	 EDciPlg5vcXskDh/zqeHuxmkmoTASMqBwhuSXGhdYQBJWrn0DrefreHUHlw74I3gBE
	 OY8aScOHXEtLA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:27 +0100
Subject: [PATCH 11/16] ARM: configs: u8500: Build IIO sensors as modules
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-11-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Build the accelerometer, gyroscope, light, magnetometer and pressure
sensor drivers as modules. Enable triggered buffers for sensors which
need buffered acquisition.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index b2900b7f9f3c..ad65c4b2ec70 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -215,25 +215,26 @@ CONFIG_HWSPINLOCK=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXTCON_FSA9480=y
 CONFIG_IIO=y
+CONFIG_IIO_TRIGGERED_BUFFER=y
 CONFIG_IIO_SW_TRIGGER=y
-CONFIG_BMA180=y
-CONFIG_BMC150_ACCEL=y
-CONFIG_IIO_ST_ACCEL_3AXIS=y
+CONFIG_BMA180=m
+CONFIG_BMC150_ACCEL=m
+CONFIG_IIO_ST_ACCEL_3AXIS=m
 # CONFIG_IIO_ST_ACCEL_SPI_3AXIS is not set
 CONFIG_IIO_RESCALE=y
-CONFIG_MPU3050_I2C=y
-CONFIG_IIO_ST_GYRO_3AXIS=y
+CONFIG_MPU3050_I2C=m
+CONFIG_IIO_ST_GYRO_3AXIS=m
 # CONFIG_IIO_ST_GYRO_SPI_3AXIS is not set
-CONFIG_INV_MPU6050_I2C=y
-CONFIG_BH1780=y
-CONFIG_GP2AP002=y
-CONFIG_TSL2772=y
-CONFIG_AK8974=y
-CONFIG_IIO_ST_MAGN_3AXIS=y
+CONFIG_INV_MPU6050_I2C=m
+CONFIG_BH1780=m
+CONFIG_GP2AP002=m
+CONFIG_TSL2772=m
+CONFIG_AK8974=m
+CONFIG_IIO_ST_MAGN_3AXIS=m
 # CONFIG_IIO_ST_MAGN_SPI_3AXIS is not set
-CONFIG_YAMAHA_YAS530=y
+CONFIG_YAMAHA_YAS530=m
 CONFIG_IIO_HRTIMER_TRIGGER=y
-CONFIG_IIO_ST_PRESS=y
+CONFIG_IIO_ST_PRESS=m
 # CONFIG_IIO_ST_PRESS_SPI is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y

-- 
2.56.0


