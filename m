Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305CACA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 00:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87mkF7nQ5pyZgpsI4TiOUzY3uIesi+wDvjKtbC8J2lk=; b=p+ysOYLG8p8QOL8kdg+iF+OFEa
	tp4rMGTBz3ma81KcFP8zc122gD1iv612MLfGg805STv5Ak1INpiTJKZ98MyafQ9bmjo2l9vKS4Hu9
	bOJr+OL7I/NrpWX29+w5H9/jPPNvhRHpIHU9iR0FQ1ZNU+L47fqamnPkAeR3pIKNJ+TCT1u9Wkmbn
	Sp6cXTqF6VwHIc6eULfdjr1lOCrYQqUeNDtObss02dIa8jqReYOjZFqJwTadB9ke6x6ziafnwcAWA
	l8gxcfWHmVwZ0IbVRn41qV1n6KH+T6PBhxiQc9az97Qt0I0k3VPg+XLHSbZ1P4fTl64yZv0sRfFNJ
	QHGR23Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4C4-00000009XAH-3c17;
	Mon, 12 Oct 2026 00:47:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4C2-00000009X9t-3zqI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 00:47:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7840E444F0;
	Mon, 12 Oct 2026 00:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 569FDC2BCFB;
	Mon, 12 Oct 2026 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791766026;
	bh=dZk5fmXgsz+r5VIo/VmzrOjb6rsRx0hZ8V/toBGnvCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MErjxKuljRPpVF1FwC4skFlgBZb2m8ObU1gSy8u04zoBPPbgSgPsZyn9nssFNvZJ8
	 lN2GRjADqL7tzWO60/OYJwm3dMwU6B2YTM5NuWuYsvosDMB0IwuJEWwjL8slyOExvq
	 kTBCaEj0jA2PW7CPkD8ZgFUZdfGz2M4C5/AN9P/1Zrzemwc8r6xtvRyV1fNlwsUeGk
	 c3++p+TSHLc7qenjYuVSN59UhGDyZu2s+G9TIGcOLuB8VYYWNEQDFuZwoBsyXelc6v
	 QCb92C1fpEzYY1G5GT70Neehy7GVt9EZcEdy7va6EQmHy8KZXTGRMQcp6bwyx4ZIID
	 86KFmJb5u6f/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4594DCA9ECF;
	Mon, 12 Oct 2026 00:47:06 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 12 Oct 2026 03:46:57 +0300
Subject: [PATCH v2 2/2] watchdog: orion_wdt: stop the watchdog during
 system suspend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-orion-wdt-suspend-v2-2-f13cf71443ba@iav.lv>
References: <20261012-orion-wdt-suspend-v2-0-f13cf71443ba@iav.lv>
In-Reply-To: <20261012-orion-wdt-suspend-v2-0-f13cf71443ba@iav.lv>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=m0WVQELV++t0yRnZ+K7WZ1EmeGKm+T8Z3+Ko29NWjxU=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFln9Dj8o4y27ZLirOXWYRE658n9V6DD4MUXfdOdGfxT9
 f8Uy1t2lLIwiHExyIopskw4pHErY8nVv/4e5g9g5rAygQxh4OIUgImsCmf4n11+iK0naaZnYdxd
 lvrjOee/W3FYnQzyvSZwf+OarB3ZcQz/k2ODV3Os3uX6q9XbT2/Gh17hDlmXXIHrRvff/X7r+qu
 eDwA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

The watchdog timer keeps counting across system suspend while the
userspace that pings it is frozen, so it expires and resets the system.
On a Kobol Helios4 (Armada 388) with a 60 s timeout the board resets
47-61 s into s2idle, whether the watchdog daemon or systemd's
RuntimeWatchdogSec holds the device.

Stop the timer on suspend and restart it on resume when it is active or
running in hardware, as sp805_wdt does. orion_wdt_start() reloads the
counter, so userspace gets a full timeout after resume.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/watchdog/orion_wdt.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index ef64e3730001..c65042dc2329 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -671,6 +671,29 @@ static void orion_wdt_shutdown(struct platform_device *pdev)
 	orion_wdt_stop(wdt_dev);
 }
 
+static int orion_wdt_suspend(struct device *dev)
+{
+	struct watchdog_device *wdt_dev = dev_get_drvdata(dev);
+
+	if (watchdog_active(wdt_dev) || watchdog_hw_running(wdt_dev))
+		return orion_wdt_stop(wdt_dev);
+
+	return 0;
+}
+
+static int orion_wdt_resume(struct device *dev)
+{
+	struct watchdog_device *wdt_dev = dev_get_drvdata(dev);
+
+	if (watchdog_active(wdt_dev) || watchdog_hw_running(wdt_dev))
+		return orion_wdt_start(wdt_dev);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(orion_wdt_pm_ops, orion_wdt_suspend,
+				orion_wdt_resume);
+
 static struct platform_driver orion_wdt_driver = {
 	.probe		= orion_wdt_probe,
 	.remove		= orion_wdt_remove,
@@ -678,6 +701,7 @@ static struct platform_driver orion_wdt_driver = {
 	.driver		= {
 		.name	= "orion_wdt",
 		.of_match_table = orion_wdt_of_match_table,
+		.pm	= pm_sleep_ptr(&orion_wdt_pm_ops),
 	},
 };
 

-- 
2.43.0



