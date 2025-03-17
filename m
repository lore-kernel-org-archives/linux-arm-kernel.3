Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C90C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTLAF0tIpFzXbv7BL0TTLvyumrvT+IHuJUXwb+Jj2tI=; b=u6coAm+xOaQO6OHlbGUholBENQ
	qgHUOtolFAnLdfMoO/huFfVtZRt00No180B2MlU9CQ0M28Kf+eagQiNu5z4F/ALMao0MKnNNEa5T7
	V9EqtWUlV98m7Q3a3ELmqWwva7lw1Q2Y6EWra7CbvilICfE32/+2seLh5esm0KITkIwN/TXINy6lD
	L5jG/x5QYnZHPuRZfgPCtehJD9fyLTzZ1T7SDuGoxo1Hl7zeH2gpS4LZt1CAkloFrm2St0wEqrxan
	fhFL5cVAzlJ3zgG308FaDDm7rgqx2lNV4k11r1SHh/OjZ7QxmClcyCj8TbZgkveF2SmLrF8ip6zOw
	dOQfTB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7sJ-00000002Cf0-1Ygg;
	Mon, 17 Mar 2025 10:39:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7lE-00000002AUL-1lrn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:31:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E15D42573;
	Mon, 17 Mar 2025 03:32:04 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42A9A3F673;
	Mon, 17 Mar 2025 03:31:55 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Mar 2025 10:31:23 +0000
Subject: [PATCH v2 3/5] firmware: arm_scmi: Refactor error logging from
 SCMI device creation to single helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-scmi_minor_cleanup-v2-3-f4be99bd9864@arm.com>
References: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
In-Reply-To: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3348; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=0VunvKId+eIYxYj8ySEheQ8DibsTe7qSHuPUkpqsZwU=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn1/oXGXo6nMyBXZwcB8PiBW//97hd3w0Y4eLpj
 OODF0LBRDKJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9f6FwAKCRAAQbq8MX7i
 mMEhEACwMbFPuziNNpyehwRtN3ACLpifBgRPCfhGpDGXyaBp+mfbHySNr74yMDxG8Gjy3tao/k8
 aAg1Eq75qKeN1BkYxLMAmgdWu1zZ5QPanx4F2f5TjkMR98j9Tl8ecGU10SgvSUKv1OY8UG6n3tn
 Lcw9hW2U/M5lLNwESg36UK3EP3IGEkv2hyxFIOnD+bnVGx3i6k5UkKYmEvJioIvVjvu1lj35Svu
 YLkjbms/SaVe69/+2PtZlwr79kK86Bv1gdZUSU2rUvwLiejNZodQTns3HbKJGlJUTO6BsIHbGJF
 cp2Bf8RG0Gz3U2YLObpWmFTCUYJ2Zz4HzNmzhUlgdI1QYyaVACyOCKgQeXfCBUabq42n2npBgHy
 tHlC0qaMAejiznWvXj6HH5sFzDH13EPRtyDXxP7HPf0EySE41Y+ldkpUtY/w7aHrrddzOo/UiEG
 PSL6B4Xe5hARTtGYPdMEY8m+WIlhon4JF6qMXQiLQ+BRxDLLZt/saL418yqQb4McuPdPX4sSHvS
 BKUMuPZnqxnrMfWVcEaEeQPqt2oyiDKSrH0P2/Zf1wztrvyTUzRbZ+rjcVc9uUM+SEw1ml9rhT4
 AVQNSb1D72QleBfEm5QZOl/yutVX7q1kX3M0DXwrx3SoAq5z0ju7wrcIeS9FP5D9wQ7JFY7OLDM
 chBzVQgZI4M+F7g==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_033156_555440_124DDDF8 
X-CRM114-Status: GOOD (  12.59  )
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

Refactors the error logging related to SCMI device creation. The goal
is to remove duplicated error-handling code and centralize it into a
single helper function: _scmi_device_create().

By doing so, any code redundancy around error logging is avoided, as
error logging during device creation will now be handled by a unified
helper function.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c    | 29 +++++++++++++++++++----------
 drivers/firmware/arm_scmi/driver.c |  8 +-------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index a30fd8e05e423e226a63833f309d8d30c400fabd..493e2c63b107fd9063f11034b71d65f567bb0778 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -411,6 +411,20 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	return NULL;
 }
 
+static struct scmi_device *
+_scmi_device_create(struct device_node *np, struct device *parent,
+		    int protocol, const char *name)
+{
+	struct scmi_device *sdev;
+
+	sdev = __scmi_device_create(np, parent, protocol, name);
+	if (!sdev)
+		pr_err("(%s) Failed to create device for protocol 0x%x (%s)\n",
+		       of_node_full_name(parent->of_node), protocol, name);
+
+	return sdev;
+}
+
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
@@ -443,7 +457,7 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 	struct scmi_device *scmi_dev = NULL;
 
 	if (name)
-		return __scmi_device_create(np, parent, protocol, name);
+		return _scmi_device_create(np, parent, protocol, name);
 
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
@@ -457,18 +471,13 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 	list_for_each_entry(rdev, phead, node) {
 		struct scmi_device *sdev;
 
-		sdev = __scmi_device_create(np, parent,
-					    rdev->id_table->protocol_id,
-					    rdev->id_table->name);
-		/* Report errors and carry on... */
+		sdev = _scmi_device_create(np, parent,
+					   rdev->id_table->protocol_id,
+					   rdev->id_table->name);
 		if (sdev)
 			scmi_dev = sdev;
-		else
-			pr_err("(%s) Failed to create device for protocol 0x%x (%s)\n",
-			       of_node_full_name(parent->of_node),
-			       rdev->id_table->protocol_id,
-			       rdev->id_table->name);
 	}
+
 	mutex_unlock(&scmi_requested_devices_mtx);
 
 	return scmi_dev;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 60050da54bf24c0245290e846f91aea62392855b..b80c574cb3bb2f12b2980fc844ea3da10abdc9f1 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -439,14 +439,8 @@ static void scmi_create_protocol_devices(struct device_node *np,
 					 struct scmi_info *info,
 					 int prot_id, const char *name)
 {
-	struct scmi_device *sdev;
-
 	mutex_lock(&info->devreq_mtx);
-	sdev = scmi_device_create(np, info->dev, prot_id, name);
-	if (name && !sdev)
-		dev_err(info->dev,
-			"failed to create device for protocol 0x%X (%s)\n",
-			prot_id, name);
+	scmi_device_create(np, info->dev, prot_id, name);
 	mutex_unlock(&info->devreq_mtx);
 }
 

-- 
2.34.1


