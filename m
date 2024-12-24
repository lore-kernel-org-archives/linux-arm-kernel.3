Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D47AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0+k3ZM3JtMWXlLNUUxvrkkZLMXDXhX+hu570K0txQk=; b=kk15eroAud0/muC7TqDnhU0sFd
	iu3Wgi8PzmireWtjslfc4CUKN9vjAvAqWGW6HoFeDAlY9tha1c/qMidI7V8/bw75QnSYtFuRiuoLy
	EVUHJfGhnacLwwr8Z/YeUA36Lej85xX/DKphCXZj0qO+HU7E8OBZATgm9LTXLyYlIYgf3jwAwq20U
	4OljeS1O4A0xmTrSnG7/S6uZkKkh3KtzxJuMRGpye83HOZyMj+JrBLSdRxQryPD0PgeX06TVeFwRZ
	2QsKwnreeHgvBgMTEOV4+pNeY+Es/nhKnMN9vcuOH/fSg8caZSdk6eSI8twXDxhVHRYNIp/vNgIBP
	i6KoJQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5UV-0000000C69R-2Bte;
	Tue, 24 Dec 2024 14:02:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5TF-0000000C5xa-3noX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 14:01:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28FEB1C2B;
	Tue, 24 Dec 2024 06:01:39 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FB5C3F59E;
	Tue, 24 Dec 2024 06:01:10 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 24 Dec 2024 13:57:48 +0000
Subject: [PATCH 1/5] firmware: arm_ffa: Replace SCMI by FF-A in the macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-ffa_updates-v1-1-01233aba3e1e@arm.com>
References: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
In-Reply-To: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=F0mUi+DToOzDCZQ+Cn7ewDbLcZibROUf9A/AQezLWS0=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnar6lsBYaGgauK2/XjgFfso/PxaQaIrjb7IGW9
 1FFiZFKnIWJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ2q+pQAKCRAAQbq8MX7i
 mDiyEACJv6w3bvhfP5nsQ6fAoa+6aDeJSEMdWv4K72GoC4HyqsZbeDQe9yVa8KJ99FmLha27W68
 aVy/eKGuqMUaUdeKEM9Cnou4KSpmfrVhxkU18w2R3Z5GQiEJpdX9aY9yDE/nG3FejyVMVC0+3Jl
 EdraLdx9jvTP4JNj1sR2yjoH5uNq3AnCXVLFK3DHDcQRE4FIesb7Q2PuDNW+d5I9ZjPW1QbKwjR
 di5rb/UrKeIEomMn107PvqABz38Y0knj+oyIrvLO7DSb+9JcruHJsJIUH298f0ur6p6DYU3Hylg
 IONN2Q7uRZYdCDN3lSmg+qinXF2NXpCu5HsO2qA1qcPMo6k3jAbNKHPJFDv9MdVADokFBHkiacm
 5d5JC0KXY2UKj/mvdt2gALxQdNn2TxE7nlflNNrqLNVNw6rT2n5snaw7CKM6VIKTPX3MdAtBQ2B
 eLm951fV3g1FGZwZ2rsdcuhEJmgE/AD/A3VnSAfXiKGRCPoI1ry+iFSz01Zm5ZJxXTwI6LPY57x
 AjXuKrhAxcPZa6frb0wXu3JnnmeEJE002mD1bRY2S6PgieyC+Y/31SyF781/7PX/QtYKKNDDCxB
 a5DHpBn672gdOB6OP6oBdMjR+zvTwOAVfzoikmyMk2jQ08D6y3JIkDcmSIjVhhH3qjEACsAhcrp
 hBPzZyV7oUuAOtQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_060114_005924_E595716C 
X-CRM114-Status: GOOD (  10.32  )
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


