Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FDAC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnfQ/rgJq+X5eXPdcVN4P/DFtdKfhy9EWQtuGZ5h25M=; b=Unsr9Zi8WLQd+R6FlivY9lWEKK
	ynTiK0jHDh+JxR7jwawfstbaiaeViTei1v5tS5su8x/l9SBv/1/pMm50fJ8qvv4OvM2af/LiW/x9V
	c2R0C64MGJxaBlQfv1AkbEmoTXFM9Z8cSynrTyOljNzLT8pqAjjEaeCpd+Eb1DI8YuOmWNoGYZ9GF
	dwGGPUdQQhH0JcaJwkRjjslOe9IRYYLwGfBQ2XojaRzCxm1Q7g3MoEnfySC8HTCwC7dUZ0D6Yb/si
	N7B7Tr535TbYk6ElSK8XV1/KrVOmkFZpwm5i0T9x1qZIHFcJbp2ldHrlAWCvAQYIR6ZTwQFrgfWTM
	zKMCi8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUsg-000000006wp-3prD;
	Fri, 06 Jun 2025 11:05:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUlt-0000000061c-3Kkk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 10:58:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40E4A1BD0;
	Fri,  6 Jun 2025 03:57:43 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA4313F59E;
	Fri,  6 Jun 2025 03:57:59 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sudeep.holla@arm.com,
	peterhuewe@gmx.de,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	stuart.yoder@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 2/2] tpm: tpm_crb_ffa: maunally register tpm_crb_ffa driver when it's built-in
Date: Fri,  6 Jun 2025 11:57:54 +0100
Message-Id: <20250606105754.1202649-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606105754.1202649-1-yeoreum.yun@arm.com>
References: <20250606105754.1202649-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_035801_873381_14140968 
X-CRM114-Status: GOOD (  14.00  )
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

To integrate tpm_event_log with IMA subsystem,
tpm_crb and tpm_crb_ffa driver should be built as built-in
(CONFIG_TCG_CRB=y && CONFIG_TCG_CRB_FFA=y).

However, this could make failure for ima_init() gets tpm chip when
each initcall function deployed like:

0000000000000888 l       .initcall6.init	0000000000000000 crb_acpi_driver_init
000000000000088c l       .initcall6.init	0000000000000000 tpm_crb_ffa_driver_init

If crb_api_driver_init() is called first, probing tpm device using CRB over
FFA method is deferred since tpm_crb_ffa_driver_init() isn't called yet.

Deferred probe of the tpm device will be probed by system workqueue
in proper time after deferred_probe_initcall() registers the work.
However, ima_init() could be called first if they're deployed like:

000000000000012c l       .initcall7.init	0000000000000000 init_ima
000000000000016c l       .initcall7.init	0000000000000000 deferred_probe_initcall7

In this situation, ima_init() failed to find tpm device and it failed to
generate boot_aggregate with PCR values.

That's why kernel prints log this situation though tpm device exists:
   [    3.080786] ima: No TPM chip found, activating TPM-bypass!

To resolve this, call ffa_register() in tpm_crb_ffa_init() when it was
built with built-in so that ima can generate boot_aggregate log with
PCR values properly.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/char/tpm/tpm_crb_ffa.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
index 4ead61f01299..2ef29b66fa5d 100644
--- a/drivers/char/tpm/tpm_crb_ffa.c
+++ b/drivers/char/tpm/tpm_crb_ffa.c
@@ -115,6 +115,7 @@ struct tpm_crb_ffa {
 };
 
 static struct tpm_crb_ffa *tpm_crb_ffa;
+static struct ffa_driver tpm_crb_ffa_driver;
 
 static int tpm_crb_ffa_to_linux_errno(int errno)
 {
@@ -168,13 +169,22 @@ static int tpm_crb_ffa_to_linux_errno(int errno)
  */
 int tpm_crb_ffa_init(void)
 {
-	if (!tpm_crb_ffa)
-		return -ENOENT;
+	int ret = 0;
 
-	if (IS_ERR_VALUE(tpm_crb_ffa))
-		return -ENODEV;
+	if (IS_MODULE(CONFIG_TCG_ARM_CRB_FFA)) {
+		if (!tpm_crb_ffa)
+			ret = -ENOENT;
 
-	return 0;
+		if (IS_ERR_VALUE(tpm_crb_ffa))
+			ret = -ENODEV;
+
+		return ret;
+	}
+
+	ret = ffa_register(&tpm_crb_ffa_driver);
+	BUG_ON(!ret && !tpm_crb_ffa);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(tpm_crb_ffa_init);
 
@@ -369,7 +379,9 @@ static struct ffa_driver tpm_crb_ffa_driver = {
 	.id_table = tpm_crb_ffa_device_id,
 };
 
+#ifdef MODULE
 module_ffa_driver(tpm_crb_ffa_driver);
+#endif
 
 MODULE_AUTHOR("Arm");
 MODULE_DESCRIPTION("TPM CRB FFA driver");
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


