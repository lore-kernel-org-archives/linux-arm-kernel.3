Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224A76093D59
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MM9bK/Jh;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VP01+2dU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+J2NYd8ay0QrXgi9qYBw+MMENP6C1nyqElknyPaZSdo=; b=MM9bK/Jh6rie94rt/3XMpa13o8
	Gy6/Wd7ak6y4xN+CUucv/5ch4Gh1Bqsz4MLIfjOVZvvtdLflPUNSdyjawF7pxhyGyqJ0hWvIHhhwf
	ow661erXkq7dx+LcEy47Om2RLGn5fG7QZ4ZXQdT1cbQ1asqk+dCSbGPeXHgbelFKxdvNJ11id8s0r
	lC6opY5YOJfhCwo5L19i/BAog8DN4nku/uXWAIqSX0JvMXOBDguXrDE5AiWO7AVAzgqUR9uRsqS0H
	dzeiJPAaQ91zzpL8glk4wQAzrAP2Idc19HMgpC8eopILhNtfO0l0vuvSK92DmrqI3Ma/79NsaizDM
	6SUPEb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvIx-0000000HLkY-0AIH;
	Mon, 02 Nov 2026 16:54:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvIu-0000000HLhn-32BV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:54:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7839416F3;
	Mon,  2 Nov 2026 08:54:36 -0800 (PST)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A662E3F59E;
	Mon,  2 Nov 2026 08:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638479; bh=TTQVKzHFqone59X5Z0GG6n5IMSWDCJV3150KBk/mdwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VP01+2dUP91YuMVH+dmlvlEtYde1uJbEmlN85JBu3P2xflCk3tNBhN2iM6BsG7DA7
	 75fhDBfs2PanvziITaqsW2jo0+7Sdo4NYRajv2ET60wviP3jn7l/aqaBWtCyACrasi
	 mPWolg9UHYQ6MFGS9jb3jVvw30tsKKGpwm1n/LxY=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 RESEND 3/6] firmware: smccc: lfa: Register ACPI notification
Date: Mon,  2 Nov 2026 17:54:17 +0100
Message-ID: <20261102165421.3651202-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102165421.3651202-1-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_085440_869179_D7856BDE 
X-CRM114-Status: GOOD (  22.90  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vedashree Vidwans <vvidwans@nvidia.com>

The Arm LFA spec describes an ACPI notification mechanism, where the
platform (firmware) can notify an LFA client about newly available
firmware imag updates ("pending images" in LFA terms).

Add a faux device after discovering the existence of an LFA agent via
the SMCCC discovery mechnism, and use that device to check for the ACPI
notification description. Register this when one is provided.

The notification just conveys the fact that at least one firmware image
has now a pending update, it doesn't say which, also there could be more
than one pending. Loop through all images to find every which needs to
be activated, and trigger the activation. We need to do this is a loop,
since an activation might change the number and the status of available
images.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
[Andre: convert from platform driver to smccc bus]
Signed-off-by: Andre Przywara <andre.przywar@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 154 +++++++++++++++++++++++++++++++-
 1 file changed, 153 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index db2a7fe344d5d..4b4daf79611bb 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -33,12 +33,14 @@
  * skipped by setting the force_cpu_rendezvous sysfs file to false.
  */
 
+#include <linux/acpi.h>
 #include <linux/arm-smccc.h>
 #include <linux/arm-smccc-bus.h>
 #include <linux/array_size.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/kobject.h>
 #include <linux/ktime.h>
 #include <linux/list.h>
@@ -49,11 +51,13 @@
 #include <linux/stop_machine.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
+#include <linux/types.h>
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
 
 #include <uapi/linux/psci.h>
 
+#define DRIVER_NAME	"ARM_LFA"
 #undef pr_fmt
 #define pr_fmt(fmt) "Arm LFA: " fmt
 
@@ -753,6 +757,135 @@ static void clean_fw_components_tree(void)
 	}
 }
 
+/*
+ * Iterate over all FW components and trigger activation of all activatible and
+ * pending components.
+ * Since we would need to re-enumerate the list of all components after a
+ * successful activation, and this could trigger infinite loops if a firmware
+ * component still appears as pending, we create an array of update candidates
+ * first, then activate each one of them.
+ */
+static void activate_pending_components(void)
+{
+	struct fw_component **all_comps;
+	struct fw_component *comp;
+	struct kobject *kobj;
+	int nr_comps = 0;
+	int ret, i;
+
+	down_read(&smc_lock);
+	spin_lock(&lfa_kset->list_lock);
+	all_comps = kmalloc_array(list_count_nodes(&lfa_kset->list),
+				  sizeof(*all_comps), GFP_NOWAIT);
+	if (!all_comps) {
+		spin_unlock(&lfa_kset->list_lock);
+		up_read(&smc_lock);
+		pr_warn("LFA: automatic activation failed: -ENOMEM\n");
+		return;
+	}
+
+	list_for_each_entry(kobj, &lfa_kset->list, entry) {
+		comp = kobj_to_fw_component(kobj);
+
+		if (comp->fw_seq_id == -1)
+			continue; /* Invalid FW component */
+
+		_update_fw_component_pending(comp);
+		if (comp->activation_capable && comp->activation_pending) {
+			kobject_get(&comp->kobj);
+			all_comps[nr_comps++] = comp;
+		}
+	}
+	spin_unlock(&lfa_kset->list_lock);
+	up_read(&smc_lock);
+
+	for (i = 0; i < nr_comps; i++) {
+		comp = all_comps[i];
+
+		ret = prime_fw_component(comp);
+		if (ret) {
+			pr_warn("LFA: LFA_PRIME failed for component %s\n",
+				kobject_name(&comp->kobj));
+			kobject_put(&comp->kobj);
+			continue;
+		}
+
+		ret = activate_fw_component(comp);
+		if (ret) {
+			pr_warn("LFA: LFA_ACTIVATE failed for component %s\n",
+				kobject_name(&comp->kobj));
+			kobject_put(&comp->kobj);
+			continue;
+		}
+
+		pr_info("%s: automatic activation succeeded\n",
+			kobject_name(&comp->kobj));
+		kobject_put(&comp->kobj);
+	}
+
+	kfree(all_comps);
+}
+
+#ifdef CONFIG_ACPI
+static void lfa_acpi_notify_handler(acpi_handle handle, u32 event, void *data)
+{
+	/* The spec explicitly mentions 0x80 only for the update event. */
+	if (event != 0x80)
+		return;
+
+	activate_pending_components();
+}
+
+static int lfa_register_acpi(struct device *dev)
+{
+	struct acpi_device *acpi_dev;
+	acpi_handle handle;
+	acpi_status status;
+
+	acpi_dev = acpi_dev_get_first_match_dev("ARML0003", NULL, -1);
+	if (!acpi_dev)
+		return -ENODEV;
+	handle = acpi_device_handle(acpi_dev);
+	if (!handle) {
+		acpi_dev_put(acpi_dev);
+		return -ENODEV;
+	}
+
+	/* Register notify handler that indicates LFA updates are available */
+	status = acpi_install_notify_handler(handle, ACPI_DEVICE_NOTIFY,
+					     lfa_acpi_notify_handler, NULL);
+	if (ACPI_FAILURE(status)) {
+		acpi_dev_put(acpi_dev);
+		return -EIO;
+	}
+
+	ACPI_COMPANION_SET(dev, acpi_dev);
+
+	return 0;
+}
+
+static void lfa_remove_acpi(struct device *dev)
+{
+	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
+	acpi_handle handle = acpi_device_handle(acpi_dev);
+
+	if (handle)
+		acpi_remove_notify_handler(handle,
+					   ACPI_DEVICE_NOTIFY,
+					   lfa_acpi_notify_handler);
+	acpi_dev_put(acpi_dev);
+}
+#else	/* !CONFIG_ACPI */
+static int lfa_register_acpi(struct device *dev)
+{
+	return -ENODEV;
+}
+
+static void lfa_remove_acpi(struct device *dev)
+{
+}
+#endif
+
 static bool lfa_smccc_has_all_functions(void)
 {
 	struct arm_smccc_1_2_regs regs = { 0 }, res;
@@ -813,13 +946,32 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 	if (err != 0) {
 		kset_unregister(lfa_kset);
 		destroy_workqueue(fw_comps_update_wq);
+		return err;
+	}
+
+	if (!acpi_disabled) {
+		err = lfa_register_acpi(&sdev->dev);
+		if (!err)
+			pr_info("registered LFA ACPI notification\n");
+	}
+
+	/*
+	 * An ACPI notification or an interrupt are optional, but we must
+	 * handle errors that occurred during their setup.
+	 */
+	if (err != -ENODEV) {
+		kset_unregister(lfa_kset);
+		destroy_workqueue(fw_comps_update_wq);
+		return err;
 	}
 
-	return err;
+	return 0;
 }
 
 static void lfa_smccc_remove(struct arm_smccc_device *sdev)
 {
+	if (!acpi_disabled)
+		lfa_remove_acpi(&sdev->dev);
 	clean_fw_components_tree();
 	flush_workqueue(fw_comps_update_wq);
 	destroy_workqueue(fw_comps_update_wq);
-- 
2.43.0


