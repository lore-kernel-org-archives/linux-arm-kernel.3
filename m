Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA1DFD7076
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N++MIBsVD/24vSwoeg6cG3XnK0h04ivsBUE3ZbK3sVw=; b=uxYJYjUp19KPpx
	t6Chq5HifsZD6u0BhI2yWjppio1MPaIzlLi19LpnFFmtmd0XOzyF76MgDDtqFQja/sCHvTO0R1yKj
	9OIiL7sEpdLvuaB5MSKBwOY9I+U6Ks6PRN+1aR9Olbz++mMOCEsI6BTjY0YRMAqLeA/IBseJ3BQ5s
	qknobyqXdsynHQp15+7D9A3lzZ98guNLqsMXfSskh0TMbtAZjBcDZkpUlQZk/+Ifo8OLAA/WcO2kZ
	BjyubaYfZzH0CQZm86dLLz0Ii3WFyULhf7tt0acqm1tl5PzGNff/oPvc3zCJP0/32A9gxO58OOywm
	HUy7weHtJrwbCSNqU5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RkK-0000000624N-4AJm;
	Tue, 17 Mar 2026 10:33:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RkG-0000000620P-25GS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:33:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90EF31476;
	Tue, 17 Mar 2026 03:33:45 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C60593F7BD;
	Tue, 17 Mar 2026 03:33:49 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 3/8] firmware: smccc: lfa: Move image rescanning
Date: Tue, 17 Mar 2026 11:33:29 +0100
Message-ID: <20260317103336.1273582-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317103336.1273582-1-andre.przywara@arm.com>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_033352_676353_F1AA87A9 
X-CRM114-Status: GOOD (  15.80  )
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
Cc: vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vedashree Vidwans <vvidwans@nvidia.com>

After an image activation, the list of firmware images might change, so
we have to re-iterate them through the SMC interface.
Move the corresponding code from the activate_fw_image() function into
update_fw_images_tree(), where it could be reused more easily, for
instance when triggered by an interrupt.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
[Andre: split off from another patch, rebased]
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 46 ++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 284b7c18d3d0..4831abf2b60e 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -310,7 +310,6 @@ static int call_lfa_activate(void *data)
 
 static int activate_fw_image(struct fw_image *image)
 {
-	struct kobject *kobj;
 	int ret;
 
 retry:
@@ -320,31 +319,8 @@ static int activate_fw_image(struct fw_image *image)
 		ret = call_lfa_activate(image);
 
 	if (!ret) {
-		/*
-		 * Invalidate fw_seq_ids (-1) for all images as the seq_ids
-		 * and the number of firmware images in the LFA agent may
-		 * change after a successful activation attempt.
-		 * Negate all image flags as well.
-		 */
-		spin_lock(&lfa_kset->list_lock);
-		list_for_each_entry(kobj, &lfa_kset->list, entry) {
-			struct fw_image *image = kobj_to_fw_image(kobj);
-
-			set_image_flags(image, -1, 0b1000, 0, 0);
-		}
-		spin_unlock(&lfa_kset->list_lock);
-
 		update_fw_images_tree();
 
-		/*
-		 * Removing non-valid image directories at the end of an
-		 * activation.
-		 * We can't remove the sysfs attributes while in the respective
-		 * _store() handler, so have to postpone the list removal to a
-		 * workqueue.
-		 */
-		queue_work(fw_images_update_wq, &fw_images_update_work);
-
 		return 0;
 	}
 
@@ -640,6 +616,7 @@ static int update_fw_images_tree(void)
 {
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
 	struct uuid_regs image_uuid;
+	struct kobject *kobj;
 	char image_id_str[40];
 	int ret, num_of_components;
 
@@ -649,6 +626,19 @@ static int update_fw_images_tree(void)
 		return -ENODEV;
 	}
 
+	/*
+	 * Invalidate fw_seq_ids (-1) for all images as the seq_ids and the
+	 * number of firmware images in the LFA agent may change after a
+	 * successful activation attempt. Negate all image flags as well.
+	 */
+	spin_lock(&lfa_kset->list_lock);
+	list_for_each_entry(kobj, &lfa_kset->list, entry) {
+		struct fw_image *image = kobj_to_fw_image(kobj);
+
+		set_image_flags(image, -1, 0b1000, 0, 0);
+	}
+	spin_unlock(&lfa_kset->list_lock);
+
 	reg.a0 = LFA_1_0_FN_GET_INVENTORY;
 	for (int i = 0; i < num_of_components; i++) {
 		reg.a1 = i; /* fw_seq_id to be queried */
@@ -666,6 +656,14 @@ static int update_fw_images_tree(void)
 		}
 	}
 
+	/*
+	 * Removing non-valid image directories at the end of an activation.
+	 * We can't remove the sysfs attributes while in the respective
+	 * _store() handler, so have to postpone the list removal to a
+	 * workqueue.
+	 */
+	queue_work(fw_images_update_wq, &fw_images_update_work);
+
 	return 0;
 }
 
-- 
2.43.0


