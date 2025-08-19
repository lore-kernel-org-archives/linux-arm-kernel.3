Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EF2CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 07:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c1BxtWxFSzVI01nWbBEkqZ/G2VNra/FxRh8DQNAAobM=; b=J7FZfUkc/1wofQckBWfciInhQ9
	JjkSyks7dg4NHcaR+5xacZMP6jCL1EJdci9dOWHL343JAM2IccJz5GybF3+NbLOU8mjCzVe1E0uLH
	D3TAoi3V0WTbd5AVSIHPQjnaRVBaVRYIXQ3mCyoS3FrBk4dMN6aLOt3kcx6G2EjAhDbTk875cMnna
	9f9xnPp+qUBmpKu2Fky0VLO5mm93zoaEokyF6e4aZjm+JnnKVoPs4wob9RDgBrJd1mUyCwKPecQjY
	tJLSWeXgq1lPaDj37vIKib8l7MSQ2o+99zEw+iuRthbFRtkD7op3c0Cgj1Opj/Wpz6Kll4umIF2tD
	292QCcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGvO-00000009hLW-25gU;
	Tue, 19 Aug 2025 07:38:30 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGPN-00000009cFI-1H5a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1755587125; x=1787123125;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c1BxtWxFSzVI01nWbBEkqZ/G2VNra/FxRh8DQNAAobM=;
  b=MXnzRaE/OCQbo2BstXRdcUhOuNa1ZX5VMxkl4AxIv/5HSmSydE6AxGRN
   6UVhp066c7vNRRIlu9a6d9sEQZ3Z/drDjLv2SR8105OYhApdLJTwv2kIA
   yGdcMYryBbDWCyQJRmnOu40RsaayTn0fFoCqADKka7f1UIf7+2nzwlN4Q
   MQu3caL8hoRz3NMwxWpZxYjv+NKCJMD6oc7WBee67mEZFJgvXM3mhokYY
   GB7oLkADs1xTBTFgSJlKoB/bYANfYFnLFHKEoVeMwUdDqNVhRX0ebJjYK
   +95OrTHN1I1GpE5Zzx6u60KFzp+pzm2ULqmr76JZEssy+c5xjAW27/BI6
   Q==;
X-CSE-ConnectionGUID: fIwxeDp0R6+2sZww5NY2GQ==
X-CSE-MsgGUID: t4fCMBi3Tzi/l0NmZyvFkA==
X-IronPort-AV: E=Sophos;i="6.17,300,1747692000"; 
   d="scan'208";a="45796382"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Aug 2025 09:05:22 +0200
X-CheckPoint: {68A42232-45-299FBAB0-EF52EDE7}
X-MAIL-CPID: 6C09F7E41B71AA5AEA1F17DECCEFAC1D_5
X-Control-Analysis: str=0001.0A00211B.68A421CD.001A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B2211632DA;
	Tue, 19 Aug 2025 09:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1755587118; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=c1BxtWxFSzVI01nWbBEkqZ/G2VNra/FxRh8DQNAAobM=;
	b=ewMRqAntA6oODBtgjE7i+UeOXcV8RT4OzCEikUxqiOoxv+/bpnomoQdCUUxUY4KFKJ8M4o
	muMrUY8YljVX8QI2yYLeFGZ+WfFoBfQXomWuZkm8Wrk0BmrIgjq4qkU+ghN/cNiL5YY6yH
	Q3CGnkDkWFiaG1kvds1i0ECODJy6njRjd65s1Id0fhiLsZTplAf093SncXYwFtVtIIwIcB
	gQMLO1QuNibHEw7KbwdA5EQZmY4deRvS8JRjqFzQErlBTeRNHQn+VkYCHtobxK7yV0IlOi
	d93+CBxrUwfRYDzCUYfphrGX0OcGNSp1epe0CQ/B83RWGfk+vwFdgmqNr6aEtw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/1] mfd: stmpe: Allow building as module
Date: Tue, 19 Aug 2025 09:04:57 +0200
Message-ID: <20250819070458.1027883-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_000525_849106_1051AC69 
X-CRM114-Status: GOOD (  11.90  )
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

Export the core probe and remove function to be used by i2c and spi
drivers. Also add necessary module information so the drivers can be built
as modules. This reduces footprint of the driver is enabled but unused.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improved commit message
* Remove superfluous text from module description
* Patch 1/3 and 2/3 already applied in next-20250819

v1: https://lore.kernel.org/all/20250725071153.338912-1-alexander.stein@ew.tq-group.com/

 drivers/mfd/Kconfig | 10 +++++-----
 drivers/mfd/stmpe.c |  6 ++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a403a3daedd52..874fee5681658 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1539,8 +1539,8 @@ config MFD_DB8500_PRCMU
 	  through a register map.
 
 config MFD_STMPE
-	bool "STMicroelectronics STMPE"
-	depends on I2C=y || SPI_MASTER=y
+	tristate "STMicroelectronics STMPE"
+	depends on I2C || SPI_MASTER
 	depends on OF
 	select MFD_CORE
 	help
@@ -1568,14 +1568,14 @@ menu "STMicroelectronics STMPE Interface Drivers"
 depends on MFD_STMPE
 
 config STMPE_I2C
-	bool "STMicroelectronics STMPE I2C Interface"
-	depends on I2C=y
+	tristate "STMicroelectronics STMPE I2C Interface"
+	depends on I2C
 	default y
 	help
 	  This is used to enable I2C interface of STMPE
 
 config STMPE_SPI
-	bool "STMicroelectronics STMPE SPI Interface"
+	tristate "STMicroelectronics STMPE SPI Interface"
 	depends on SPI_MASTER
 	help
 	  This is used to enable SPI interface of STMPE
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index e1165f63aedae..3c5c2f157f529 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1482,6 +1482,7 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(stmpe_probe);
 
 void stmpe_remove(struct stmpe *stmpe)
 {
@@ -1497,6 +1498,7 @@ void stmpe_remove(struct stmpe *stmpe)
 
 	mfd_remove_devices(stmpe->dev);
 }
+EXPORT_SYMBOL_GPL(stmpe_remove);
 
 static int stmpe_suspend(struct device *dev)
 {
@@ -1520,3 +1522,7 @@ static int stmpe_resume(struct device *dev)
 
 EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmpe_dev_pm_ops,
 			     stmpe_suspend, stmpe_resume);
+
+MODULE_DESCRIPTION("STMPE Core driver");
+MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


