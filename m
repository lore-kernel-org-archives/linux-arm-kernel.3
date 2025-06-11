Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927A6C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GB4D0lgi3okYt7b4PK3Znpm8WNQVM17R/8X8edxIWQM=; b=gOt33gPAT29V/p2nVpf38S9/Hd
	L87LuhdMEZeRKfrlnNs68qfJO8PzIXD9nEIYEKYwl57VQ0QV3qtu+R6qnW7hJ81MgLgh3/NprrGhD
	EDpLsv3F2P6mEKmNYhLyOOVckc1YRbGzq/QfL3FX+n5/+L2AFAdFElH2XbYY8WMPn702Xip6M4ZIv
	1ksfbYeIGh7Db+k/dQdbMrM93lgxNqMSncGJTlsdb3BjHeiXpzPTnje+YniXTawsDNxM1w2wvFe+Z
	OEGKcPJzRq8DzBB80oTfQDag/uJ2Y8858XxDZr1kFt+L8S0fYfw+EDwnnsR2+rF24i5TEp2ga+JtV
	MNIrK3+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpg-0000000AHjt-3BQn;
	Wed, 11 Jun 2025 14:53:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJZi-00000009jxc-3iJG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 11:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GB4D0lgi3okYt7b4PK3Znpm8WNQVM17R/8X8edxIWQM=; b=UwpblhlqURJsj8goRC+p9p6COh
	iaFWlcmrrflbayEUqr9pTjJxa7Bh8aj6icgD0exsmZei4N5LnmdLPNIZIQY55+7ymOk2ZC9kqEiEm
	UQmdh9qdQ4omH1ipyWzpbwhUQMU65UG9OI+9RVJK6LYYrVIsfl/Xf5GemSU8jvruyr3H2xqL1APLN
	yRx2+ojIcPQLphTkGXa9pYargyhli9zGYLdJr1jejHzTbq5koz1Ua73DhS/JWh7GuUMBvowKQj8Hy
	/9/MfKTpF9wt3z67vNN6lRf+7H1RZT8QDz8luuiKAt8vp9tWeW/GVvRCBb72sL9ABA1aDJr3Szl0k
	uOneSj0w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJZg-00000002LpJ-3z1c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:24:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFAF82BCD;
	Wed, 11 Jun 2025 04:24:35 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 030553F59E;
	Wed, 11 Jun 2025 04:24:53 -0700 (PDT)
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
Subject: [PATCH v3 2/2] tpm: tpm_crb_ffa: try to probe tpm_crb_ffa when it's built-in
Date: Wed, 11 Jun 2025 12:24:48 +0100
Message-Id: <20250611112448.17751-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611112448.17751-1-yeoreum.yun@arm.com>
References: <20250611112448.17751-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_122457_200398_8F67A3F3 
X-CRM114-Status: GOOD (  18.81  )
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
probe the tpm_crb_ffa. This ensures that the TPM device using CRB over FF-A
can be successfully probed, even if crb_acpi_driver_init() is called first.

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


