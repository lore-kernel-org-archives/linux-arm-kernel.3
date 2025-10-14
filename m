Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9133BCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yJRi0HibOeKtbgfq4iDcVBuMVTWuMio4cjtfayeTuVk=; b=aG0UB3fuLU7a/rFlucMXPVZ2ZT
	uoNB5lIaHEnEK2zNG9tj+io+uLniaHsJgtezoVAOOO30LtWf/QiAJULa1ZD6eh8KiH4IIInNl3Ywh
	Z6YnktnuAEj946oznJiqnhcu/AE+eimHHKVW49olc9umNlHT2+dB5gcYVS5mPcsB0fbLKyLIc43L2
	olB7NmgDyYmSCcVbo6EBQ7eLAwruywIqQmHdB4gZ4Njul014cZkxD9G9y7bFSLwTdMHAHzuvsooW/
	Tf9OFLC4ngTkshuxqY/P+v3xRpoIkqCQJL5WByg8YXAFJFZir1T8U8v/wcwofLIWt2G5aQ54iIdr9
	VEfqSyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aVN-0000000FdHG-2bQy;
	Tue, 14 Oct 2025 08:35:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aVL-0000000FdGh-0vve
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 08:35:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D51834E4108E;
	Tue, 14 Oct 2025 08:35:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC137606EC;
	Tue, 14 Oct 2025 08:35:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D15DB102F224B;
	Tue, 14 Oct 2025 10:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760430931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yJRi0HibOeKtbgfq4iDcVBuMVTWuMio4cjtfayeTuVk=;
	b=zIBBSoBj/QJlk2scYqbB71RnzLWlY5113OOtGVaFYxyk4bdGnYR1o668Xdlf3xvEx9gQyF
	bNGmo82EZuCtSHe5PYbvTX9GiQvU/bgoOgrn+DeciQq7AthyT9XDl4F8SaWUHBUXX6z5E9
	P79Q0oai2nwpPvtI4nRQIvaI/f55wy/OF2Gr4EcfE1y4KmxBTi5CLKZK0HfNHMUiHjYLIz
	mbxyPiNDJmlcocGXIjVrlaS/XC6RaDO1n13oj6lQVIQ2nu72++EBXvNrEYU+jgAki57v5C
	z6BEUDpXkHYTMiWnQ+zeypTatRqw060jLixGeJoHQ3wHyjflGuXL0E5z4mRurQ==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Tue, 14 Oct 2025 10:35:23 +0200
Subject: [PATCH] firmware: ti_sci: replace ifdeffery by pm_sleep_ptr()
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-ti-sci-pm-ops-cleanup-v1-1-70b50b73ac85@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEoL7mgC/x3MSwqAMAwA0atI1gasHwSvIi5sTDWgtTQqgnh3i
 8u3mHlAOQordNkDkS9R2X2CyTOgZfQzo0zJUBZlYwpT4yGoJBg23IMirTz6M6CxLbvK1RVZgtS
 GyE7u/9sP7/sB4QCI1mcAAAA=
X-Change-ID: 20251014-ti-sci-pm-ops-cleanup-1b7ef3f43cbc
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_013535_396509_8658D815 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

Using pm_sleep_ptr() macro allows to remove ifdeffery and '__maybe_unused'
annotations.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 49fd2ae01055d0f425062147422471f0fd49e4bd..99a2e0e2960f463918950fef8829409ec365ce70 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3706,7 +3706,7 @@ static int ti_sci_prepare_system_suspend(struct ti_sci_info *info)
 	}
 }
 
-static int __maybe_unused ti_sci_suspend(struct device *dev)
+static int ti_sci_suspend(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct device *cpu_dev, *cpu_dev_max = NULL;
@@ -3746,7 +3746,7 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ti_sci_suspend_noirq(struct device *dev)
+static int ti_sci_suspend_noirq(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	int ret = 0;
@@ -3758,7 +3758,7 @@ static int __maybe_unused ti_sci_suspend_noirq(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
+static int ti_sci_resume_noirq(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	int ret = 0;
@@ -3780,7 +3780,7 @@ static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
 	return 0;
 }
 
-static void __maybe_unused ti_sci_pm_complete(struct device *dev)
+static void ti_sci_pm_complete(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 
@@ -3791,12 +3791,10 @@ static void __maybe_unused ti_sci_pm_complete(struct device *dev)
 }
 
 static const struct dev_pm_ops ti_sci_pm_ops = {
-#ifdef CONFIG_PM_SLEEP
-	.suspend = ti_sci_suspend,
-	.suspend_noirq = ti_sci_suspend_noirq,
-	.resume_noirq = ti_sci_resume_noirq,
-	.complete = ti_sci_pm_complete,
-#endif
+	.suspend = pm_sleep_ptr(ti_sci_suspend),
+	.suspend_noirq = pm_sleep_ptr(ti_sci_suspend_noirq),
+	.resume_noirq = pm_sleep_ptr(ti_sci_resume_noirq),
+	.complete = pm_sleep_ptr(ti_sci_pm_complete),
 };
 
 /* Description for K2G */

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251014-ti-sci-pm-ops-cleanup-1b7ef3f43cbc

Best regards,
-- 
Thomas Richard (TI.com) <thomas.richard@bootlin.com>


