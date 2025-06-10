Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D4CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 06:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBg4HV9qaeJWcIcILDB6CSnujvPtxgwjP18ZV3I2UVM=; b=pTukOSkrSND280k1ilg+sTaqUP
	LatusGgNz8vWBGtyVC3oGVfKjzlz8eUU6yYlzReGclh2Tql1KzP4UUHkSHQ6P3BvpW8sYZrrt8xs6
	/3ZosO38W3fnYsPoN3gSZaGdwgPqzTSK5Po/JdD+wup9J43Df4x/xqg3UVL5ZJaKYlVAA+IAJ4lsC
	xbR8CvKknGRyDbtC5pqAFXsfQXYLhw50MgKbObNXrWy7s7uIkIlNQHTOdMsQReXjsZjU5hQIE03Tn
	QuH2wvlNT7qQShtvoFQG2zLW6FiNAtYkbirRTJqschCW5Z6yW1sdWZfEo/uJEvvGrG5geFrU/bh/h
	bzmFI5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOs9X-00000005tm0-2nLC;
	Tue, 10 Jun 2025 06:08:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOs5I-00000005tNv-1DCZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 06:03:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9008B16A3;
	Mon,  9 Jun 2025 23:03:24 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 416103F673;
	Mon,  9 Jun 2025 23:03:42 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: jarkko@kernel.org,
	sudeep.holla@arm.com,
	peterhuewe@gmx.de,
	jgg@ziepe.ca,
	stuart.yoder@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 2/2] tpm: tpm_crb_ffa: manually register tpm_crb_ffa driver when it's built-in
Date: Tue, 10 Jun 2025 07:03:34 +0100
Message-Id: <20250610060334.2149041-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610060334.2149041-1-yeoreum.yun@arm.com>
References: <20250610060334.2149041-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_230344_374279_CE277B30 
X-CRM114-Status: GOOD (  16.16  )
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
(CONFIG_TCG_CRB=y && CONFIG_TCG_CRB_FFA=y) and
TPM device using CRB over FF-A should be probed
before ima_init() which is called as late_initcall.

However, we couldn't control the probing order between
crb_acpi_driver_init() and tpm_crb_ffa_driver_init() that's why
crb_acpi_driver_init() could be called before
tpm_crb_ffa_driver_init() when they're deployed like:

0000000000000888 l       .initcall6.init>-0000000000000000 crb_acpi_driver_init
000000000000088c l       .initcall6.init>-0000000000000000 tpm_crb_ffa_driver_init

In this situation, the TPM device is queued deferred probing
and it can be handled later ima_init() caled in init_ima().

000000000000012c l       .initcall7.init>-0000000000000000 init_ima
000000000000016c l       .initcall7.init>-0000000000000000 deferred_probe_initcall7

When this happen, IMA fails to generate boot_aggregate with
TPM's PCR values so it prints below message:

   | ima: No TPM chip found, activating TPM-bypass!

To resolve this issue, the tpm_crb_ffa_init() function
attempts to probe the tpm_crb_ffa device.
This ensures that the TPM device using CRB over FF-A can be
successfully probed even if crb_acpi_driver_init() is called first.

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


