Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71307C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QczvT2LifjsE/O62L6D1yL7Md/W7SFCqArkkkjFYFBA=; b=jufz7CnyeNXUIl
	MQK+kdcmEY7setVLhTw0JN6QAco2oTy2fmY/qs8mY5hlYcQZ39q7ALuBYnk9xBnFoybCdlpVjnFvO
	ifilVehusQuQIjvIevWwKSFGluSyLBiR/COm4OKLs9X0xJQtRDOTh9roW9cLsX3HPCVmEk0y6AP+F
	9T86rswxz56cyYarnx9i7t66F6D/G33UzeDdgbv3JGSJcQLbGIEorPut/ZJoy2qC3sav3WRCOqgVg
	PdoSJGXokkYUQ+6FK2CGNt6u7l3Vkvcp6bgasQ4IVwGZY3sVNeIEpUVw7BxkKRYMW5qcMQbfOxTLM
	WaA+4K7aiKSeqLeUHEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJl-0000000Efvw-2xyL;
	Fri, 18 Sep 2026 14:11:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJU-0000000EfmC-1Cup
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:11:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8132168F;
	Fri, 18 Sep 2026 07:11:35 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2F433F86C;
	Fri, 18 Sep 2026 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740699; bh=6+DNaJ0KhfXvVkfpY/J73/5RJw4ENnx4YQhzelT1LV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zty74dQbT+PosZ6ET2SfcR33YteCFQ/iKYSCG4AGzza7UyEqBp0YvhTH8XbYYxSqD
	 w+2WQEsMiTlkphsaIZS7xK7y6lCdjT/UtOa2RHV9/t+Ega1MUUNmFqTUc3bkCzt/P5
	 b5c4NAQV0uS9E2kY9UL558fZTIxSUbvceq70wcgI=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v4 5/8] firmware: smccc: lfa: Add auto_activate sysfs file
Date: Fri, 18 Sep 2026 16:11:08 +0200
Message-ID: <20260918141112.2115555-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918141112.2115555-1-andre.przywara@arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_071140_397124_568C4463 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Arm LFA spec places control over the actual activation process in
the hands of the non-secure host OS. An platform initiated interrupt or
notification signals the availability of an updateable firmware image,
but does not necessarily need to trigger it automatically.

Add a sysfs control file that guards such automatic activation. If an
administrator wants to allow automatic platform initiated updates, they
can activate that by echoing a "1" into the auto_activate file in the
respective sysfs directory. Any incoming notification would then result
in the activation triggered.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 34 ++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index bb89fffde6856..7a55b4a6785d8 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -120,6 +120,7 @@ enum image_attr_names {
 	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
 	LFA_ATTR_ACTIVATE,
 	LFA_ATTR_CANCEL,
+	LFA_ATTR_AUTO_ACTIVATE,
 	LFA_ATTR_NR_IMAGES
 };
 
@@ -135,6 +136,7 @@ struct fw_image {
 	bool cpu_rendezvous;
 	bool cpu_rendezvous_forced;
 	bool use_cpu_rendezvous;
+	bool auto_activate;
 	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
 };
 
@@ -589,6 +591,28 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return count;
 }
 
+static ssize_t auto_activate_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+	int ret;
+
+	ret = kstrtobool(buf, &image->auto_activate);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t auto_activate_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct fw_image *image = kobj_to_fw_image(kobj);
+
+	return sysfs_emit(buf, "%d\n", image->auto_activate);
+}
+
 static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_NAME]			= __ATTR_RO(name),
 	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
@@ -599,7 +623,8 @@ static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
 	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
 	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
-	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
+	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel),
+	[LFA_ATTR_AUTO_ACTIVATE]	= __ATTR_RW(auto_activate),
 };
 
 static void init_image_default_attrs(void)
@@ -670,6 +695,7 @@ static int update_fw_image_node(char *fw_uuid, int seq_id,
 	image->kobj.kset = lfa_kset;
 	image->image_name = image_name;
 	image->cpu_rendezvous_forced = true;
+	image->auto_activate = false;
 	set_image_flags(image, seq_id, image_flags, reg_current_ver,
 			reg_pending_ver);
 	if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,
@@ -739,7 +765,8 @@ static int update_fw_images_tree(void)
 
 /*
  * Go through all FW images in a loop and trigger activation
- * of all activatible and pending images.
+ * of all activatible and pending images, but only if automatic
+ * activation for that image is allowed.
  * We have to restart enumeration after every triggered activation,
  * since the firmware images might have changed during the activation.
  */
@@ -758,7 +785,8 @@ static int activate_pending_image(void)
 			continue; /* Invalid FW component */
 
 		update_fw_image_pending(image);
-		if (image->activation_capable && image->activation_pending) {
+		if (image->activation_capable && image->activation_pending &&
+		    image->auto_activate) {
 			found_pending = true;
 			break;
 		}
-- 
2.43.0


