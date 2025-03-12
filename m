Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E66C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bzvtd/vhZp03AeLcq3w4TqXtf5We5BXq0EDS3aEITVY=; b=0eZ1kdQtxW0K2LJ3LL36Ac+BNy
	y0NhUqXUdCLt+/KhadI2XQXAFIJub/O4TRTBXwB6xEfKqqYKetbNqNKAhLdXDwNSxDooK2qb7Hv/8
	7D24MzingDVC0l/YWiKmonwXfGaZOROaHnL4Xb9ROySst2pYjCyuGV6V+siCyltBC0wIaopIAvnwI
	X9fNU3UBUbK3LZxM3afBiTf2SfNmF7f9KRl73e0Ptwrx4Tad9/hhFnBj+GyzMU7TrjL9wCQ5XM9uO
	rT2MtSBTTm54odlzueVtWj0kTlnAsmtuE7J6cv1J9J2lZLJQQgbzXvXOVba0FaEwbMSHLSTbfIbuw
	tj4/gjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKfh-00000008KH3-1KFL;
	Wed, 12 Mar 2025 11:54:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK38-00000008E5z-44Qr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:15:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 696E31682;
	Wed, 12 Mar 2025 04:15:09 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 177E03F694;
	Wed, 12 Mar 2025 04:14:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 12 Mar 2025 11:14:33 +0000
Subject: [PATCH 2/3] firmware: arm_scmi: Refactor device matching logic to
 eliminate duplication
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-scmi_minor_cleanup-v1-2-51a514282794@arm.com>
References: <20250312-b4-scmi_minor_cleanup-v1-0-51a514282794@arm.com>
In-Reply-To: <20250312-b4-scmi_minor_cleanup-v1-0-51a514282794@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=das9EqDKBZfkwRTCcRMlY6ZRJ43jXpNz8KtuySsJ6qI=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0Wyvr6uyOPMtIYfBSRGvUA09ueeThVmrNeqKM
 736CKQfx/eJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9FsrwAKCRAAQbq8MX7i
 mBfUEADEm3dlUPsPOmlKnq41RIg6xX7lNVp2cLw+hZwaBOmDExX/zT/GOhFeHpRy90unFFMTFnD
 wyzaDrvbNlTKOBWRPA3sKHyVJY7QMA2TZlP6iaJORYHSUD0esXVYMrOilXeQZBqZ54tdmuOOcsI
 8kv6XXosuzpH36DmdaGFyUQKvzpqJcPjN6j8f9CYiiekZL0MxyV3Hury/oRGHvPoUDKo9CI8AI+
 4vom6MmAup/b9m8IqmErJMETpg3h3QM2UOGS0bQw00D5xyDtYw0wR2MeWxqGNqgXfPY6DG32QbL
 9SsHqsiVyfsfPwqk0f/RShKDeRCi/b4dsHy6OQXIoHgPkTT8edqUg/wlVqoZ8ICljzIfnSs2h+h
 vciJ4Xg7zsuGmF2wKKbs+F/KhTfO21/H0JKiVHgBKtZbblf7E/rxRvxfiWkGeEmBPCnGnLEiq0T
 jJoGQ192bfF0/lpuexh3hNQTPBLKJPHPKDFbJpMJfNZNIuEjnjZfjXQlSL9qZjlo2tD5570VZv3
 FWLQT+MlBHRrsXbvAgU6Fg23oPq/guplGL2q1PHg9k5ewK0MSOJAMCIE3YsshOn24pOT3RxFrEO
 ZGP5oHwrBB1968lv6BRehEMyK9upB7WUeJ0yxEEiLvz+xIqYAHClbAybUu+wasRQ4Di+M6Fmt+B
 PJSjCX8QscSz9VQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041459_106325_A56BA943 
X-CRM114-Status: GOOD (  14.20  )
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

Currently, the device matching logic is duplicated in two functions:
  - scmi_dev_match() used by the scmi_bus to match scmi_devices with
    scmi_drivers.
  - scmi_child_dev_find() used to check for the presence of a device
    with the same name and protocol_id to avoid adding duplicates to
    the bus.

Refactor the code to eliminate the redundant matching logic and
consolidates the functionality for better maintainability and efficiency.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 43 +++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 050a5ff5dc96a7df58edff5faeb8c1ec6228b97d..a30fd8e05e423e226a63833f309d8d30c400fabd 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -206,52 +206,49 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 		scmi_protocol_device_unrequest(entry);
 }
 
-static const struct scmi_device_id *
-scmi_dev_match_id(struct scmi_device *scmi_dev, const struct scmi_driver *scmi_drv)
+static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
+				      const struct scmi_device_id *id_table)
 {
-	const struct scmi_device_id *id = scmi_drv->id_table;
+	if (!id_table || !id_table->name)
+		return 0;
 
-	if (!id)
-		return NULL;
-
-	for (; id->protocol_id && id->name; id++)
-		if (id->protocol_id == scmi_dev->protocol_id &&
-		    !strcmp(id->name, scmi_dev->name))
-			return id;
+	for (; id_table->protocol_id && id_table->name; id_table++)
+		if (id_table->protocol_id == scmi_dev->protocol_id &&
+		    !strcmp(id_table->name, scmi_dev->name))
+			return 1;
+	return 0;
+}
 
-	return NULL;
+static int scmi_dev_match_id(struct scmi_device *scmi_dev,
+			     const struct scmi_driver *scmi_drv)
+{
+	return scmi_dev_match_by_id_table(scmi_dev, scmi_drv->id_table);
 }
 
 static int scmi_dev_match(struct device *dev, const struct device_driver *drv)
 {
 	const struct scmi_driver *scmi_drv = to_scmi_driver(drv);
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
-	const struct scmi_device_id *id;
-
-	id = scmi_dev_match_id(scmi_dev, scmi_drv);
-	if (id)
-		return 1;
 
-	return 0;
+	return scmi_dev_match_id(scmi_dev, scmi_drv);
 }
 
 static int scmi_match_by_id_table(struct device *dev, const void *data)
 {
-	struct scmi_device *sdev = to_scmi_dev(dev);
+	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 	const struct scmi_device_id *id_table = data;
 
-	return sdev->protocol_id == id_table->protocol_id &&
-		(id_table->name && !strcmp(sdev->name, id_table->name));
+	return scmi_dev_match_by_id_table(scmi_dev, id_table);
 }
 
 static struct scmi_device *scmi_child_dev_find(struct device *parent,
 					       int prot_id, const char *name)
 {
-	struct scmi_device_id id_table;
+	struct scmi_device_id id_table[2] = { 0 };
 	struct device *dev;
 
-	id_table.protocol_id = prot_id;
-	id_table.name = name;
+	id_table[0].protocol_id = prot_id;
+	id_table[0].name = name;
 
 	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
 	if (!dev)

-- 
2.34.1


