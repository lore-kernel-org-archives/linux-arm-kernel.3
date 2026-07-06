Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5888AC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDYK1XbSPZRQYrATl0ZFpWXfE5pDBaGR0GqZfBm+9lQ=; b=BrcWs5D3YSrP+J
	+QlE/acGxVNoijuym4Hu545xRcNjzS1CySGb+Q+XtXMxL1VeZXROOBuVwBDxsWXlYJDlfG99dSWR1
	19t1sIG8pGFjbiGOGleoSne1Idm5kqhKGIW/hccFgc7b9aoLNlPd87KXFYmr96wwUGfaojI0HzTVs
	/nYg25VIxxHgxgSMIopie/W6F30tU8Osz3p4PHC8frna7pGdB8Fg/lkeXlfncRgXcL3XpP8dVBj+p
	ylDlrFfq1Rze5jooeS8GrSAlXuStQah3FIsNnvXcsfpjekPaX6U3Tlh4IEgTYCPK2tA7kui5ro1Qs
	vEnoOpkiFdcbP5MEybtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjdW-0000000CeBi-0QvN;
	Mon, 06 Jul 2026 13:45:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjdR-0000000Ce8U-435Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:45:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 895182BCB;
	Mon,  6 Jul 2026 06:45:16 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C4783F7B4;
	Mon,  6 Jul 2026 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783345520; bh=6gkXQMH+/eYsyYxQKGNXQtav7+eIM6KQT7OHu8bpPUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r223KV2bRh5guJF09ZO4Lo9dZJRqLg6eEx4KvF6j75qFPdoStXW805XILlBvFYomB
	 GL5u4zg9ajbdHec0Y4GXjfHZoRAHjzsMnSUEvt+GIdH5WynHTrZfXIOTReFlH9aRTu
	 wHyJjdv9RAvhMbXt9L6rYB4pMvETiRoppJFPW9cc=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v3 5/8] firmware: smccc: lfa: Add auto_activate sysfs file
Date: Mon,  6 Jul 2026 15:44:45 +0200
Message-ID: <20260706134455.132091-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-1-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_064522_083555_20E82C62 
X-CRM114-Status: GOOD (  17.52  )
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
index 5b7f9b07f6c8..ce4f966db475 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -89,6 +89,7 @@ enum image_attr_names {
 	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
 	LFA_ATTR_ACTIVATE,
 	LFA_ATTR_CANCEL,
+	LFA_ATTR_AUTO_ACTIVATE,
 	LFA_ATTR_NR_IMAGES
 };
 
@@ -103,6 +104,7 @@ struct fw_image {
 	bool may_reset_cpu;
 	bool cpu_rendezvous;
 	bool cpu_rendezvous_forced;
+	bool auto_activate;
 	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
 };
 
@@ -550,6 +552,28 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
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
@@ -560,7 +584,8 @@ static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
 	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
 	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
-	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
+	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel),
+	[LFA_ATTR_AUTO_ACTIVATE]	= __ATTR_RW(auto_activate),
 };
 
 static void init_image_default_attrs(void)
@@ -631,6 +656,7 @@ static int update_fw_image_node(char *fw_uuid, int seq_id,
 	image->kobj.kset = lfa_kset;
 	image->image_name = image_name;
 	image->cpu_rendezvous_forced = true;
+	image->auto_activate = false;
 	set_image_flags(image, seq_id, image_flags, reg_current_ver,
 			reg_pending_ver);
 	if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,
@@ -700,7 +726,8 @@ static int update_fw_images_tree(void)
 
 /*
  * Go through all FW images in a loop and trigger activation
- * of all activatible and pending images.
+ * of all activatible and pending images, but only if automatic
+ * activation for that image is allowed.
  * We have to restart enumeration after every triggered activation,
  * since the firmware images might have changed during the activation.
  */
@@ -719,7 +746,8 @@ static int activate_pending_image(void)
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


