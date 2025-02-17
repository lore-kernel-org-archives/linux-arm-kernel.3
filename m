Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A84EC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSFDjESCF0e4nMJZ2/RT2u9Nm4d866jIp7I72zpFvYw=; b=Fe97cUmB9Vl455JyNBPzvVlA6w
	MmOkq8jmegbp5k0TGfVR2iYLchsEBjq1Cuyf6zIUQgkYE+ZvOmcPTEe+jOOM1GhkBP+QTft9g2YLY
	qA+lmCqwsvrg9UhKSpPKzHFksR45W0ELWZHIfUckZOcVq3DeV7iHOgQwCzKSBUdjY2oZIY6q3OniG
	0aHkptuZjXUWlOnV0kxzHnjImd58qFfZ4VGNPn49pRTvRlp823jV1WkI56IUYjOvo+InzkjCVLEXS
	55WMK54dngYSdfhmiZrTD/1R2LhAHeBcMqkFItPtrJL0EmZvUjHFQG9zbSFLXh4F1Jl9Kl1QLxWVy
	BER7FkyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Mu-000000057u9-0RMj;
	Mon, 17 Feb 2025 15:49:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3DW-000000055WF-3Jbr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A3EC1692;
	Mon, 17 Feb 2025 07:39:49 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25D243F6A8;
	Mon, 17 Feb 2025 07:39:29 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:42 +0000
Subject: [PATCH v3 01/19] firmware: arm_ffa: Replace SCMI by FF-A in the
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-1-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=tJtJ+iZ/RH0kV6E8FVz8GWyFPWw0X5nxEmvPF+pyVpA=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1gtXHWnKMr9WB5CJdIm1VEcTqqQjHoG8va+Y
 X+57qiPKpOJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLQAKCRAAQbq8MX7i
 mC22EACTJ1oYJdI/jH3Mk8BIbelop4SG8s08yql/bZfcv1x+PDI8uqU+FBC/c//aJVpOaNmDPXf
 BKFVqR3r5o9svjC82IAsKRD6ZW4JjGrUsn6QGJxHKS4eW+LGaNEduPnr+mb8GHT1YzDju2ZLDDh
 97OQ/j4mVz5CVJdtlmcgAXHjVY/W15F2iE/PkRfVgVlsVeLdKuNGH5TSIyLZGSempxZvHHukxIT
 fPSopQAPDGFWZchtSzzA4TW50gevDU46kEYa54iqa2uVw2H+ne9qvXuXzesc+ddUGLFfqeF6oCD
 pjPw8F544ZDRfw3zMiqprjyD+bIE4WWpOfpu/iUJZ+rUMkUiMJdCYZbed6QMswj9r5iNTL2pCcO
 /t0jRtiUWkGaAjONSI2j2KJDWaFuqNNTkBXCnkniam5UQe85P9xfVPMHlbSMQo9pCl8/igVHNS9
 23sfDJt0Qjw79Cdw6Rgzqu1Ps5KyO9o++c5QlvrYrUz7+jGim5GuLX5LtduNWUtAG4Dc3wzruFE
 qFhD9LokcPbKVyMTErbDonSV07AwRli6OFuAvYhMoZ/bkgpSN8onj2HbjGWJTrDk+D7fXcBgraY
 RLACo93enHMMfIutecbjQ8q7c5jIGTeZGlDtGAGqY/K90z3qI6yt1OA6DXlYOc4b94ASxJ4u8bR
 OB0SxNn84EAe9BQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073930_892862_D4906173 
X-CRM114-Status: GOOD (  10.48  )
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

Commit 22779149e93d ("firmware: arm_ffa: Emit modalias for FF-A devices")
added modalias for FF-A devices. However the macro added used SCMI
incorrectly. Replace the reference to SCMI by FF-A and update the macro.
(i.e. s/SCMI/FFA/)

No functional change.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index dfda5ffc14db7208e8b622cdd648194c9cb1ef34..52b1f09209a0e51e321cd23a69aa7e4c4daa8dd1 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -15,7 +15,7 @@
 
 #include "common.h"
 
-#define SCMI_UEVENT_MODALIAS_FMT	"arm_ffa:%04x:%pUb"
+#define FFA_UEVENT_MODALIAS_FMT	"arm_ffa:%04x:%pUb"
 
 static DEFINE_IDA(ffa_bus_id);
 
@@ -68,7 +68,7 @@ static int ffa_device_uevent(const struct device *dev, struct kobj_uevent_env *e
 {
 	const struct ffa_device *ffa_dev = to_ffa_dev(dev);
 
-	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
+	return add_uevent_var(env, "MODALIAS=" FFA_UEVENT_MODALIAS_FMT,
 			      ffa_dev->vm_id, &ffa_dev->uuid);
 }
 
@@ -77,7 +77,7 @@ static ssize_t modalias_show(struct device *dev,
 {
 	struct ffa_device *ffa_dev = to_ffa_dev(dev);
 
-	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT, ffa_dev->vm_id,
+	return sysfs_emit(buf, FFA_UEVENT_MODALIAS_FMT, ffa_dev->vm_id,
 			  &ffa_dev->uuid);
 }
 static DEVICE_ATTR_RO(modalias);

-- 
2.34.1


