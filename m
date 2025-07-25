Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2610AC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tMj9FLX+UA66nhFkirMdu8Rq5921p22OMdpvQW5B+o=; b=XOGV8YqgztNVZEz4ZWUS3TEWzl
	6TWr6ComCjXt+bapoDC7Nd3vP9XJ/HBbi6kr1mzRuzybc1vsf++9fWbkWx+VtNEFkZSoUZJYnW5TV
	t1n+ZRPCrm+Ly+iuQ+h60Zyl5LVYNVeEC9aLhM/Jlln5hXKtGDTuKDOqNAJ5eCYaw0sS5bpERX6PA
	QaI0xlBFNESpHTErnqA/n1YXlo6ECKuEuq/bYBwZnhxdv/FtpepgGiiaPPTpFRKdl+w1y4Qo7/1FT
	E8/3CZW7Vy+mCmgWLDQsZcKXYqBfvXMaWWPEznvkqN80wc62Wq6h7kJ3yyRVD9FqqlEwnjxsllnov
	EZKfZugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCqg-00000009GAb-3PJ0;
	Fri, 25 Jul 2025 07:28:10 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCbJ-00000009Ecy-30lA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 07:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753427537; x=1784963537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8tMj9FLX+UA66nhFkirMdu8Rq5921p22OMdpvQW5B+o=;
  b=JS3aWOWMdE2P0JJh6R4as0SzmiiNdAhaj3W82ZstLnuhe3c7WAY+2nTn
   ZMjRlBYCwW784cohoigfxZI34rysX3TcvV16ybEAMeJXG4xRxLGMsks5z
   ECpB/t70KhvxlqEFMZ27yQLOGKJFwD8xwN/W+VI9jRSfqNHuGivthFD6U
   /xLdoWZYyIGgOdlJGk1eWNtCgA/nPKF0fU+4XrvGy87lKmdGJsWZ2hCUS
   rF9bjf12jNHW6TUGgrO0LbdpIyG35OvftB5iMT/u+ODEW43TbyBPNaFEV
   w57qh3HyjtcaiCpuRQgesEZYLeQsTcGdhn9EwhGZ2HeOzGEwudg6L98PG
   w==;
X-CSE-ConnectionGUID: R6V/ESMKQaqDsJScWh+wlQ==
X-CSE-MsgGUID: aUmYHp5HSDiBtPnuSqOtjg==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45414813"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:12:15 +0200
X-CheckPoint: {68832E4F-45-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: C5BE8A659E63DAFC652D904DD8B1D1B3_2
X-Control-Analysis: str=0001.0A002107.68832E09.0057,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F21F1682BB;
	Fri, 25 Jul 2025 09:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753427531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8tMj9FLX+UA66nhFkirMdu8Rq5921p22OMdpvQW5B+o=;
	b=M0eLX4Ujutss1qZ8GQTyQpXgDYLsPdryClHkoBp6ctET1b5aG0QJjTJaJyzST5lTXYFvDk
	27hPCyCI3SW1GAEfHt1TxudH9tHkq4kDl2WDDSD0v0h+E8lfxmJnDB7L+SYiewXbU3+8QG
	jFBeG0J7U+YODhXr2m9u+BCKvodyG+PuSXivaQGx1HlYqNgvEfuikGTX5WoJfeaPA5TSsJ
	ArTT+Xaq4qj7LwDTYLu+qFslj5Wa2q7A2ezrX+pvOXFWwPxCf0jN1Ov1kC0oXQPqO5TMl8
	3Dglo4NVkghWd6erYHVY02tJcGIRv3r6vMhKBFzOzqLQmD6OgCYvBGwV4Xwr2A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] mfd: stmpe: Allow building as module
Date: Fri, 25 Jul 2025 09:11:51 +0200
Message-ID: <20250725071153.338912-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
References: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_001218_055627_510F1F8B 
X-CRM114-Status: GOOD (  11.21  )
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

Export the core probe and remove function to be used by modules. Add
necessary module information so the driver can be built as a module.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/Kconfig | 10 +++++-----
 drivers/mfd/stmpe.c |  6 ++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 8f11b2df14704..a58c95e5b8072 100644
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
index e1165f63aedae..5faf13fd6cf83 100644
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
+MODULE_DESCRIPTION("STMPE MFD Core driver");
+MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


