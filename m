Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B42DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkyt0LQ6+PWNMydY4CY0uDodtVkrVIBAaQP66/+/Z98=; b=ph628BQu8F7KuHMjQGTuC9pVHe
	96JgCxYXfVGLj0OofaWyinAAIEZr8MO4f3Leq1Kgi9Z9CM1BmyRzrVMBfGphCKf356V5gThlwfJQ8
	F1JZJkiufeqb/cJWkdlE9nCyMiIqxjxqbkGHW4QhfL1SUP93O2eprc/Y51yO9a1cZkgYWmMQAA+WR
	dSR8mf0VwW0rFD2IDiEb2PWKo944yNGULd3rm64NxJqvLvphw4qgG+bZhALV5PHWtyLMSJrIYJr9C
	XygpKcFzjm4ztEqt7IvHbeCBh4Cdpm8gdJb8OoXYOyDMl37Buqs4RvbeVFDghIGyZNQwCzaYjQNlR
	IDUICITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7vZ-00000002Dbg-4984;
	Mon, 17 Mar 2025 10:42:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7lF-00000002AVK-1aGS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:31:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E854F2576;
	Mon, 17 Mar 2025 03:32:05 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4982B3F673;
	Mon, 17 Mar 2025 03:31:56 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Mar 2025 10:31:24 +0000
Subject: [PATCH v2 4/5] firmware: arm_scmi: Assign correct parent to
 arm-scmi platform device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-scmi_minor_cleanup-v2-4-f4be99bd9864@arm.com>
References: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
In-Reply-To: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=mZZiNnV+dVw+v9KoptYJu4F6GYbaOFq2eVdf689ZBD4=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn1/oXyNMrXg9MnZVuIKmNMGEYZ4lnH674QgePH
 UGbz08fcQmJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9f6FwAKCRAAQbq8MX7i
 mGU1D/sHfBvDC7UistySWK57S4vengY/pgahfQwNwjYmXCgjIqLNZPi4MQfhiA+gsTy2cR+ZjAN
 jcJa1FxtzTUZvuGli502xsMomnHpcPaLUwptgXxxOfwy3dsxK9fxUTNodN0Cw/iq/+JTr1zfV9T
 0MMMWgODB2KcuSfBR/BjgXZAuDfgSTZmqPYDtH2MB7N3dim8tSI1gC/zKvphLusxCGglkOVQTDH
 5axyAgB84u4ZFyRZn1h7/epyWEE9MUzrf/3M2gkOQreGCcWPJyyxPYWRZ66vauw0gfmtL42wTuG
 HDoEcs8gk6XKdRfof7iXLT4HdHqWkYtv52sOPT78xzcZ/ZkXdZODHozJe1Ac6VhUK9Hwx+rnSgQ
 OzzWBjfYvn4LRGLuoilv0PTSjEiQWnsRvdQmkjQ9U+oSgZBloSDLc8iRq8RgEsyquere6sn3laq
 +zjD35IOARKxj0m2gwhZuVylyecbr8C1H+cr5kTHt4HSFGWCFzYF3LoenEJjRKWnP5tu/T2xJU/
 ehFrT/11fF4l3cZ1G26IZy9ZSlnavPJDPWrCJcstv6Pl1nTtZqm5a22t+TFo78SS5ncZqfbA3TF
 wvyX37/oy3UXj4fyFZgSycCwww3a6IP5QdG4lKjxPEXT/Hz82M36MJ2pvmlTTx8OFiRoTcX6DJS
 wSUhgD5WxGJMeLQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_033157_548126_2133EDAE 
X-CRM114-Status: UNSURE (   9.87  )
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

With the decoupling of transport drivers from the SCMI core, the
"arm-scmi" platform device is now created dynamically from the probed
transport driver.

Currently, this "arm-scmi" platform device is added to the root of
the platform bus since no parent is assigned. However, the transport
platform device, created from the "firmware:scmi" node in the device
tree, should be considered its parent.

Ensure that the parent device is correctly set for the "arm-scmi"
platform device, aligning it with the correct transport hierarchy.
This will be more useful on systems with multiple transport and/or
SCMI firmware instances as the hierarchy is maintained correctly.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 10ea7962323e43e03e7c5636c56d707803d4ea55..dab758c5fdea3aa34188ef7d424ba8a43ada46d8 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -475,6 +475,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 	if (ret)							       \
 		goto err;						       \
 									       \
+	spdev->dev.parent = dev;					       \
 	ret = platform_device_add(spdev);				       \
 	if (ret)							       \
 		goto err;						       \

-- 
2.34.1


