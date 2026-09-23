Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783DCC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUPGVnyjXr0wjlDdYgG25EkMyiw+NLBsCbmXTz2cKDw=; b=RbNW+Quw49UV/pEqgxx9wJwhPj
	owU4T9znt5tHhPCW20LQ2XJlTMcS0wvmvlLURfNuG0z+uYmvM+oPNwKBRdHxAVZ/IVv85VSREU3Lc
	a1aFliZxbEjQR0RGVSKwCWiQ3N5hqmYJpGX6ZwcS8Q0puWdu2h+kW9qzQ48DmnHtQ+f6+d4zPIQgw
	2g/s2YIZsFqiEZt98iMyvDlZmx7c/Xvbmnab30MSQo6X+VHBWaoDDGAHNTWbxKDPAroQCLL5xQBbK
	nDwnzkulYsh2nPaGI9N4BYWIdqtS6aRMykid5kmyo24uGSwEn4dlCA+n/9GvDdrdb43a8U3NH1Pea
	fxbIwxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NbD-00000008UMO-0WZx;
	Wed, 23 Sep 2026 14:05:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NbB-00000008ULb-3s4y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:05:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA6F24338B;
	Wed, 23 Sep 2026 14:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC63C1F000FF;
	Wed, 23 Sep 2026 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172325;
	bh=oUPGVnyjXr0wjlDdYgG25EkMyiw+NLBsCbmXTz2cKDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kJ87Z6JktrmAiUp2+7QQl6BKZ94hsEvT1wHHiKmE85QUAUoB14PDatOOhzvnAMR+s
	 qGuEuhi2hPZdroEU9XY1e2E5ZOoydPUtFX14EQ0SO5a0syGJMeKvpT+OrluAD1fq7C
	 q96zXObigPn0IlHGYUhweGzIKT8gPhyU1Y3hBRD599L3T1wD9kcAIIQFNVnR3p2IvU
	 1DDSuecyud3ldDcPPPXS+HfqJm1587vWgquIC0K+Nl8X3RWJ70BwGoNzYXysetel8z
	 suI/leoGces9iR1SoLy2pG5Gs+GAk1BW4kvU4quDHW6MgCU6TOJFxayWIy24ffCc7m
	 ZsvEk+3rnoXeA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v13 7/8] coco: guest: arm64: Add sysfs ABI for CCA Realm guests
Date: Wed, 23 Sep 2026 19:34:04 +0530
Message-ID: <20260923140405.1111554-8-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Userspace has used the arm-cca-dev platform device to detect Arm CCA
Realm guests. Removing it without a replacement would break that
detection and would also leave userspace depending on kernel
device-model details.

Add /sys/firmware/cca/realm_guest as a stable ABI for detecting whether
the kernel is running as an Arm CCA Realm guest. Create the file only in
Realm world, where it reads 1.

Document the new ABI in Documentation/ABI/testing/sysfs-firmware-cca.

Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/ABI/testing/sysfs-firmware-cca |  7 ++++
 MAINTAINERS                                  |  1 +
 drivers/firmware/arm_rmm/rsi.c               | 35 ++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca

diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
new file mode 100644
index 000000000000..d545b7523530
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-cca
@@ -0,0 +1,7 @@
+What:		/sys/firmware/cca/realm_guest
+Date:		September 2026
+Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
+Description:	Read-only. Present only when the kernel is running as an
+		Arm Confidential Compute Architecture (CCA) Realm guest, in
+		which case it reads 1. If the file does not exist, the kernel
+		is not running as a Realm guest.
diff --git a/MAINTAINERS b/MAINTAINERS
index caf2e0235d99..1e543163a8cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3949,6 +3949,7 @@ R:	Mark Rutland <mark.rutland@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
+F:	Documentation/ABI/testing/sysfs-firmware-cca
 F:	Documentation/arch/arm64/
 F:	arch/arm64/
 F:	drivers/firmware/arm_rmm/
diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 2dd69febedbd..29eeb90ffc6b 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -9,6 +9,8 @@
 #include <linux/swiotlb.h>
 #include <linux/platform_device.h>
 #include <linux/arm-rsi-cmds.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
 
 #include <asm/io.h>
 #include <asm/mem_encrypt.h>
@@ -182,6 +184,39 @@ void __init arm64_rsi_init(void)
 	static_branch_enable(&rsi_present);
 }
 
+static ssize_t realm_guest_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "1\n");
+}
+
+static struct kobj_attribute cca_realm_guest = __ATTR_RO(realm_guest);
+static const struct attribute *cca_realm_attrs[] = {
+	&cca_realm_guest.attr,
+	NULL
+};
+
+static int __init realm_sysfs_init(void)
+{
+	int ret;
+	struct kobject *cca_kobj;
+
+	if (!is_realm_world())
+		return 0;
+
+	cca_kobj = kobject_create_and_add("cca", firmware_kobj);
+	if (!cca_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_files(cca_kobj, cca_realm_attrs);
+	if (!ret)
+		return 0;
+
+	kobject_put(cca_kobj);
+	return ret;
+}
+device_initcall(realm_sysfs_init);
+
 static struct platform_device rsi_dev = {
 	.name = "arm-cca-dev",
 	.id = PLATFORM_DEVID_NONE
-- 
2.43.0


