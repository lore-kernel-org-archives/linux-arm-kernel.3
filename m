Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A52C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 06:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMzTwklpBU3wy8+bD821q3bVysjk6E6RgXPyQwoMEUI=; b=YC6ru7DI+TXSaOUAeZQ3hgMjAa
	inCGfPZonmXgRntMdwFMP8TyVfAS1bP+XM1XMl9rfWUKlDhycYtcCJ28GgmQAMub+fKW/7iLGKj90
	Cw8aqGnhPYaHOW06SkQ6R15y8Z/is8Dxbb7tDsdL6FpSrFLkBqGsRR6Kg8tERt+DXcCmPfKZ5x9qK
	Mmt7oiZv4BfjNvE2cGyPBCbFIEiatkFMfjmn8wlyz7iq90wle2cqquQcCGsi7fZsSZGwK8zNtbSoL
	vbYAJykM3U2Ezf5FPAGQp5IMBDtL1wZowfYJLLgJ+ZzciSriJl2O6xnXU++VjcKlYICbCVlEL0qc/
	5QMoDAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVCS-00000003JIf-191J;
	Wed, 05 Aug 2026 06:34:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVCQ-00000003JHT-2XVx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 06:33:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1C1B413CD;
	Wed,  5 Aug 2026 06:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A9F1F00A3A;
	Wed,  5 Aug 2026 06:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785911637;
	bh=cMzTwklpBU3wy8+bD821q3bVysjk6E6RgXPyQwoMEUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c7BC+S65yQ/0cUKCl/iURyQNb6SIteogNCpEn3Z948en19f0J4h+YpG5mio+bKmMH
	 JCpi5SBDAHDp2mONb9lMXvnnfdK8OgaeNHBXwFmLWLtvKG1q0vdZ+AkjUXxmeFxORU
	 Ugo+TMuPBMqjDqI9yJbIq8Yb7v9tSw9UUXDm2XVoYiOx6vDjfdGon1HhAk4IOTDmTV
	 v6+sVvyLWe83TO9HBEQ2e9IdPgnOjY5hLIxhOg+3sHS9+UVb5p9zNo38Lh7V+dGzit
	 fhkW7Ko0F+qwqV7sAb0+p0wGCn+LXCRFbLMGc+On0LV+72d2QRUR8EHaULTT7UA6V0
	 YiJTvxXo4dI1Q==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v9 7/7] coco: guest: arm64: Replace dummy CCA device with sysfs ABI
Date: Wed,  5 Aug 2026 12:02:55 +0530
Message-ID: <20260805063255.1638614-8-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
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

The SMCCC firmware driver now creates the arm-smccc platform device and
instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
The arm64-specific arm-cca-dev platform device stub is therefore no longer
needed.

However, userspace has used the arm-cca-dev platform device to detect Arm
CCA Realm guests [1]. Removing it without a replacement would break that
detection and would also leave userspace depending on kernel device-model
details.

Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
for detecting whether the kernel is running as an Arm CCA Realm guest. The
file returns 1 in Realm world and 0 otherwise, similar to the existing s390
/sys/firmware/uv/prot_virt_guest interface for protected virtualization
guests.

Remove the dummy arm-cca-dev registration now that userspace has a
dedicated CCA Realm guest indicator, and document the new ABI in
Documentation/ABI/testing/sysfs-firmware-cca.

[1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/ABI/testing/sysfs-firmware-cca | 10 +++++
 drivers/firmware/arm_rmm/rsi.c               | 39 +++++++++++++++-----
 2 files changed, 39 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca

diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
new file mode 100644
index 000000000000..bf177d636b92
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-cca
@@ -0,0 +1,10 @@
+What:		/sys/firmware/cca/realm_guest
+Date:		May 2026
+Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
+Description:	Read-only. Indicates whether the kernel is running as an
+		Arm Confidential Compute Architecture (CCA) Realm guest.
+
+		The value is one of:
+
+		0: the kernel is not running as a Realm guest
+		1: the kernel is running as a Realm guest
diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 2dd69febedbd..6bb315faecd7 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -9,12 +9,15 @@
 #include <linux/swiotlb.h>
 #include <linux/platform_device.h>
 #include <linux/arm-rsi-cmds.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
 
 #include <asm/io.h>
 #include <asm/mem_encrypt.h>
 #include <asm/pgtable.h>
 
 static struct realm_config config;
+static struct kobject *cca_kobj;
 
 unsigned long prot_ns_shared;
 EXPORT_SYMBOL(prot_ns_shared);
@@ -182,17 +185,33 @@ void __init arm64_rsi_init(void)
 	static_branch_enable(&rsi_present);
 }
 
-static struct platform_device rsi_dev = {
-	.name = "arm-cca-dev",
-	.id = PLATFORM_DEVID_NONE
+static ssize_t cca_is_realm_guest(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", is_realm_world());
+}
+
+static struct kobj_attribute cca_realm_guest =
+	__ATTR(realm_guest, 0444, cca_is_realm_guest, NULL);
+
+static const struct attribute *cca_realm_attrs[] = {
+	&cca_realm_guest.attr,
+	NULL,
 };
 
-static int __init arm64_create_dummy_rsi_dev(void)
+static int __init realm_sysfs_init(void)
 {
-	if (is_realm_world() &&
-	    platform_device_register(&rsi_dev))
-		pr_err("failed to register rsi platform device\n");
-	return 0;
-}
+	int ret;
+
+	cca_kobj = kobject_create_and_add("cca", firmware_kobj);
+	if (!cca_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_files(cca_kobj, cca_realm_attrs);
+	if (!ret)
+		return 0;
 
-arch_initcall(arm64_create_dummy_rsi_dev)
+	kobject_put(cca_kobj);
+	return ret;
+}
+device_initcall(realm_sysfs_init);
-- 
2.43.0


