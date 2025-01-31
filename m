Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C98C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0+k3ZM3JtMWXlLNUUxvrkkZLMXDXhX+hu570K0txQk=; b=TBjPK/hgmtvjI/1cCUFyJkbopI
	9ln0XVQ9vAQbscJ/6cbm8/2uNswKunUvGWxG7Zf1FH6gNc24g3hPJCw9zqexSSWa0CaAMSeWbIeQt
	8ijYlULi9lYNPPxJpA/7Q1dzTAGRlQn0sfyIFts1u8/vuXc4oj6EGMkDgwbCkp5nXcovcWxM2JXD3
	YsvHVDCt+ibcYLnyfww4TF24QgxuBQit9BHVnxGV182l2K5wJcQGZGIvQ24HVji6lUqGxqBKCNfbG
	CsMR8Tk5LGCSFWChfgvwjhCt5eJBDDuy3Z8Iew2SX3irQlr1zqnpZQ6j2T6JUSwVOk9M+cdN5Ey1m
	8peXHEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpCv-0000000AV2Q-2NLT;
	Fri, 31 Jan 2025 11:29:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp93-0000000ATnp-2kSr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9BCFFEC;
	Fri, 31 Jan 2025 03:25:32 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A52C23F63F;
	Fri, 31 Jan 2025 03:25:06 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:01 +0000
Subject: [PATCH v2 01/18] firmware: arm_ffa: Replace SCMI by FF-A in the
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-1-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=F0mUi+DToOzDCZQ+Cn7ewDbLcZibROUf9A/AQezLWS0=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMPHU0BHBADhcUbjEDO5bElZzu4c8yq1eRlV
 dx2WhQzW1yJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzDwAKCRAAQbq8MX7i
 mB8YD/4kyPIAVsx80cJp2NPKX7f5qxVzLjzZzMNN++CP1xKfIOW+r44nTZTgLy4UdBUg5q1pPdX
 X6nz1YIlZ8mD2YcY5tYSdg8NrTaFXf80oPI4ikreyqpaCPHYh3u9od44kesatM8JrlqeEQvKRg3
 NXW/5J/wxil2TK7VY4dLNgOOujsgH9E3LrbIRYYFKx3/CWTSzpkprItloXO4VNq2PGuVCvdGQeT
 71lacqAfSQM7BEc/kNy744L2yEnRY05I/laQo+k04IdjtMhs8I30eozX1BkjDq0eFYLwCB6ZD9p
 istKdpa/DzqTr5GwS/CN2vcbNABilzXS3kFwLT0Vr81iuvfxAal1+oYNIsAA7F73y6wKz3ac6BX
 1vlpNN68jF/1yw71n70jUEzvz7HbBxWgpaePtuyoZGjJs5ha28T31GO20XZwn6wrWWXg5KMHHzB
 XwTzMmH74zpd9qx77x3vgoIV+6M+mjA1hzXN3QsSs3tOHGEPJ3mExUCBzuh2n3Y/YPR2CS5J17v
 2VWArp6Yt+6l0XSxQLQVlGCuW9FP7VL2yqSuFytJ+jt7C3bxh/83PYv/skPj9MIwzUMKWOBdBc4
 yWRcawxarc3kd9kYiX7BjnSe0c1cKVWPB2LCPxKyYCv9Ip1TwAfkQMaXd9zDUrLtzGl0NXcrYCe
 Jnf4nLuX/kPRVkg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032509_743678_DFC3A6F1 
X-CRM114-Status: GOOD (  10.39  )
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


