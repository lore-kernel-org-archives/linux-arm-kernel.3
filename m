Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879B0C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVdb8TcZcGiLA11zLQgwOEi2kMI+zynrBhvgvBD5Jyg=; b=E1e6jW3NIWqudRVrcxeCgftki5
	oYp1NdaW26upzgdtA9zvRg+UCKdK5pNEHNpC9Ups8otBf/T7CoB4u59U0Px/elWYuUirz0H8oXTmC
	RnfSoVxhwbrdD6OICWuxdCxRBIMEFMLIrHpPXShp0CZ5NX/4j3NJBzo/S8SXEgxR4GurkH2/2b4gA
	++foKP3MwqdkCSLHzaXJ8X9rzIrOQIleVpny1XAiL9RyMRGQxgivBZ+3LqGFsZlFFiXtGUpmJMBNY
	cr/xt1IYxgEnpSpcJs+7h4zflaTiXAfdd0tuEfB93RUo9NY1PSskSkSqZVN80qnrVY43e+8bgbjAk
	0qeVOHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLNV-00000008Qee-3hMi;
	Wed, 12 Mar 2025 12:40:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKS6-00000008ILt-1z2d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:40:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D78D51595;
	Wed, 12 Mar 2025 04:40:54 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6377E3F694;
	Wed, 12 Mar 2025 04:40:43 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 12 Mar 2025 11:40:24 +0000
Subject: [PATCH 1/3] firmware: arm_scmi: Ensure scmi_devices are always
 matched by name as well
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-scmi_minor_cleanup-v1-1-c62c6cb4111a@arm.com>
References: <20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com>
In-Reply-To: <20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=WbYcwPFa1V2cCGxOBvupgDD2HrO3B51Gf6RHdYRG7bU=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0XK5a49E9ckMH5JeP7jTH0gvShMQEq4jn82J4
 ec11jSt4ACJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9FyuQAKCRAAQbq8MX7i
 mMMsEAC+cqTkFyWVy5IMGOTm2WMfFGHZvA7sGj8pbABqiG5Lvjg/4UFrDlzYtavxi2QUdtrRxPM
 AqadNtOWIncN8IFopCUza4A6Bi/W3uL0kht7JRL0DEFPpmFSsGUVkz1Zflz+A6cIuLbgtjXekXv
 qmAKqgMh/O091e+pJGdg9zC0T+TBG7jWklDCrag4n6LO9BnXZAUBmK59QsoUoGD/usLpzcf082u
 ve9a0oof56G0k4IYfNDQ9zgVTKdV4uEEkHr37GMJPxPgJQr0Bk2E24E5qKM/C6YTrl3Xi2kYu3Q
 XUmR/2y13zlONP1F7vl66rsd5aNLe3S5QsEZn90+2zZC5hrecxnl0rb/q9/REo7zvsMsXNWjP3a
 LYHT7sdy4VfTLHwR1L6zuussCGxCF+AGxidsTAtKrERgjwX9YH/24cCHZAS1T/jV9xSWUvNc0tP
 9yc1m7qJYOBwUMkZElYcIfzHUUXifG+s96SddJGXv3G2c421aCydaVf+nFDpcY9kR0tqXpvqfbb
 WzIUAAow1R6ubZcE1x6RM6qh+QIOEpNteExuKcpmb7k+XweYSUDmMVc4x55uTSee+X3E9hJm0na
 5wEq/FdnkaYQ8+JZxUpZqnPe0aQOzFV1RVGR4Q6/CSHM220A9xGG5PxVMgbHc8Kf/gCDyDGbEZL
 McUDlSDtp2nK2yA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_044046_549978_06DA7218 
X-CRM114-Status: UNSURE (   8.68  )
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


