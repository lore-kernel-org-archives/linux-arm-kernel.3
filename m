Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE12C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVdb8TcZcGiLA11zLQgwOEi2kMI+zynrBhvgvBD5Jyg=; b=xInay13bpNRSfWPsipWy1OwoA7
	ZssJD5KmTzfva+MarZ1dKH8G7UZ8LChWl+IKd/yDF4fc3tw+scghSRBbAsGwYBpOQ3Leek+Pvq40r
	cQmKvNz9kMA05J9ZhAGpRDUxMyPtwARmVunWgtOs0zh368cxzzIizj3ojP3E2d20exm81yIeOK4o7
	5rCDWlySfsziAzHz76Hx2UEjilLPIxH36E2vihDM36sXLSnr74wuT4ON/q2a+9JOkpZznaKFxrVlD
	gjWNkmPZZN2fcjK0ChhG/3SISfPnXIsBtOsoyXouNtRcew18V0y7O9UrM+RgPWxh+rAOwzwkPN300
	rRdI8fzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7qd-00000002CF5-20TL;
	Mon, 17 Mar 2025 10:37:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7lE-00000002ASN-0jeq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:31:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3A45169E;
	Mon, 17 Mar 2025 03:32:02 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 352E73F673;
	Mon, 17 Mar 2025 03:31:53 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Mar 2025 10:31:21 +0000
Subject: [PATCH v2 1/5] firmware: arm_scmi: Ensure scmi_devices are always
 matched by name as well
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-scmi_minor_cleanup-v2-1-f4be99bd9864@arm.com>
References: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
In-Reply-To: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=WbYcwPFa1V2cCGxOBvupgDD2HrO3B51Gf6RHdYRG7bU=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn1/oXaCG+TDZZOhTJY9TOzNiRDmh/ASClooXQS
 ULvaQc4/RGJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9f6FwAKCRAAQbq8MX7i
 mDlcD/91WvfqsEDo8QCGDSrZP0K5rqejcpFZa1tHSr8VIDVtwcPHu7663QvlQvroM1N2tX+Ktk2
 xBpVmOVwD+fW+hgbPyo6h1DegKGCJtr4LVcZEsWxvNwlCpbQh6QVo3Fa9+d/o+qIf5DaVR17lud
 H3rNbLrzV0h1ZyHZJEPKlBj3HKwtiQLMQVXzsq9isyceXlYhqA06AFE9oDjWsItf0VmAqdPqpHR
 MdaA5VXOweATiNwoONMmE1j67BzBLmW9zg2E/DIxd8/5O0ACOSGFyswqqPHF1A9AiF7ewFxPPpx
 vKHkysRwFMWAMZ9s8wqjqhnyrvSy9xNytGd55d1B8pF9kdc3fZ879z9MkaJHc+09pTEa5azo3zv
 9WyvR9wIPnYKcMkYt+LFoP89jNwKWbr3zzf2osdZ6KfJq/iwk+ie2v+0hzfXrt8Wk9zGoDY6NfU
 whaJa358FDrHscdlDCAiPRM4wsggk/Bs9v4hQVIkgcapBkB2KvXufFo3m3+QvIgrawIg7cZzfT0
 IuMDJFvpAtzDBp9MXdzaZc+WAc3QhFwj4IQDBL+YungCViVlDuAfem6EIzdfzKghNauE2EYoijJ
 Ix5kvOvm/Wzkr8sED/BiMahO+CdKOXUZm9bNjtr+KiWHyQgUkTcSYc/9mROtuTb6xIjt92Wo/af
 LwY/K6iJPZHg3/A==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_033156_269309_E12A36FA 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

Currently, devices without a name in the id_table cannot register drivers,
and no scmi_device is created without a name via scmi_device_create().
However, the function __scmi_device_create() allows devices with no name,
which are then labeled as "unknown."

Removes support for matching scmi_device instances without a name,
ensuring consistency across the driver registration and probing process.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index a3386bf36de508d312e2c4fa2e27ba62ba3776a0..050a5ff5dc96a7df58edff5faeb8c1ec6228b97d 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -214,13 +214,10 @@ scmi_dev_match_id(struct scmi_device *scmi_dev, const struct scmi_driver *scmi_d
 	if (!id)
 		return NULL;
 
-	for (; id->protocol_id; id++)
-		if (id->protocol_id == scmi_dev->protocol_id) {
-			if (!id->name)
-				return id;
-			else if (!strcmp(id->name, scmi_dev->name))
-				return id;
-		}
+	for (; id->protocol_id && id->name; id++)
+		if (id->protocol_id == scmi_dev->protocol_id &&
+		    !strcmp(id->name, scmi_dev->name))
+			return id;
 
 	return NULL;
 }

-- 
2.34.1


