Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E551C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tObTLoBeN2CnE4Xxv7FNpSNs5jg5Z1CGWaVpXt6sHw=; b=Cb448MKp7Y4bmShMrEkhfalfdk
	/n/AbVWtOl7uVAV7Vb/KuY6mPjqBfYTxkdEBOVUr50Ca+TLvmoXW6LlgVnM+I1eH1dZuwz5TUTkov
	bDy1PyicyJClwYTl6GGWEA7NRhXYYQoQJlgFMy1PhCNdopQKCqmB7T95v3E0n4RbrlJd1eEew42TI
	ZFQdn4YMkoU/eh1JDUhnCc0oTuhDox/pe5k3vw3p1nJ6FIMKpQR1hKCNNC2uSAPMjygaVfUVXPWi4
	1eLcEdSRTlRLY9WZQvqBB23OPHX1acSNhZQNBx5MMzNykEcT/k5N1xhiqgdomthu8Pzf1nh6wKILl
	AxupQhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtpJ-0000000AREF-1pkm;
	Wed, 18 Jun 2025 14:31:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpwj-00000009lgM-3IQi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:23:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E16731D13;
	Wed, 18 Jun 2025 03:22:48 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 24DD93F66E;
	Wed, 18 Jun 2025 03:23:08 -0700 (PDT)
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
Subject: [PATCH v4 2/2] tpm: tpm_crb_ffa: try to probe tpm_crb_ffa when it's built-in
Date: Wed, 18 Jun 2025 11:23:02 +0100
Message-Id: <20250618102302.2379029-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618102302.2379029-1-yeoreum.yun@arm.com>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_032309_866852_D520F0B7 
X-CRM114-Status: GOOD (  19.27  )
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

To generate the boot_aggregate log in the IMA subsystem using TPM PCR values,
the TPM driver must be built as built-in and must be probed before
the IMA subsystem is initialized.

However, when the TPM device operates over the FF-A protocol using the CRB interface,
probing fails and returns -EPROBE_DEFER
if the tpm_crb_ffa device — an FF-A device that provides
the communication interface to the tpm_crb driver — has not yet been probed.

This issue occurs because both crb_acpi_driver_init() and
tpm_crb_ffa_driver_init() are registered with device_initcall.
As a result, crb_acpi_driver_init() may be invoked before
tpm_crb_ffa_driver_init(), which is responsible for probing the tpm_crb_ffa device.

When this happens, IMA fails to detect the TPM device and
logs the following message:

  | ima: No TPM chip found, activating TPM-bypass!

Consequently, it cannot generate the boot_aggregate log with
the PCR values provided by the TPM.

To resolve this issue, the tpm_crb_ffa_init() function explicitly attempts to
probe the tpm_crb_ffa by register tpm_crb_ffa driver so that
when tpm_crb_ffa device is created before tpm_crb_ffa_init(),
probe the tpm_crb_ffa device in tpm_crb_ffa_init() to finish probe the
TPM device completely.

This ensures that the TPM device using CRB over FF-A
can be successfully probed, even if crb_acpi_driver_init() is called first.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/char/tpm/tpm_crb_ffa.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
index 4ead61f01299..462fcf610020 100644
--- a/drivers/char/tpm/tpm_crb_ffa.c
+++ b/drivers/char/tpm/tpm_crb_ffa.c
@@ -115,6 +115,7 @@ struct tpm_crb_ffa {
 };
 
 static struct tpm_crb_ffa *tpm_crb_ffa;
+static struct ffa_driver tpm_crb_ffa_driver;
 
 static int tpm_crb_ffa_to_linux_errno(int errno)
 {
@@ -168,13 +169,23 @@ static int tpm_crb_ffa_to_linux_errno(int errno)
  */
 int tpm_crb_ffa_init(void)
 {
+	int ret = 0;
+
+	if (!IS_MODULE(CONFIG_TCG_ARM_CRB_FFA)) {
+		ret = ffa_register(&tpm_crb_ffa_driver);
+		if (ret) {
+			tpm_crb_ffa = ERR_PTR(-ENODEV);
+			return ret;
+		}
+	}
+
 	if (!tpm_crb_ffa)
-		return -ENOENT;
+		ret = -ENOENT;
 
 	if (IS_ERR_VALUE(tpm_crb_ffa))
-		return -ENODEV;
+		ret = -ENODEV;
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(tpm_crb_ffa_init);
 
@@ -369,7 +380,9 @@ static struct ffa_driver tpm_crb_ffa_driver = {
 	.id_table = tpm_crb_ffa_device_id,
 };
 
+#ifdef MODULE
 module_ffa_driver(tpm_crb_ffa_driver);
+#endif
 
 MODULE_AUTHOR("Arm");
 MODULE_DESCRIPTION("TPM CRB FFA driver");
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


