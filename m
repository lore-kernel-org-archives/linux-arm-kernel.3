Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19919CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHBMjVaNDx0AjQf77xnDkkNwQpdnyvaB5gGTmqfJNxU=; b=1Unq3/lnJrZxfys43eZEhtt0Ih
	P7qX7sENM0ejASNpYPBfCEOK6NNp9ODoQFIBUt1PAKXMwzKoi4XoI6Tqr9tfMQ0LlBPabjESS8V2Y
	+KQ571pci5s+3NE/jwPqI8sqTm0YBesv66++2nnJouflzdaL4rigkz9t4GCJUfEsI7LdMn6EzIobX
	YyT+3QTUXJ8T91oVyp6YL4iHskG6VM6L1SporB/m3La+l6wwWh/xbxtYYX9/bxlJXKypDfmB6zlm6
	hNMfXNTccIHtGziURCfpwhhTxw/rK+nCNffJ/41SzCFYupjnXMumVSZPhvr3HMwVsZANPg1Q4gbFZ
	XPDMFn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Ws-00000003fM5-1USY;
	Mon, 15 Sep 2025 10:33:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Wm-00000003fHk-1gkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:33:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3BA71BF7;
	Mon, 15 Sep 2025 03:33:35 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 596E73F66E;
	Mon, 15 Sep 2025 03:33:42 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:24 +0100
Subject: [PATCH v3 01/31] coresight: Change device mode to atomic type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-1-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=3351;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=SwkrVRkHnWTgCjpGo0xU2o1h0Is+jAZXk9cFvCcK8oY=;
 b=UaSAp4vvYFBjsd46Y2EZtBFHsTr6O4Vdl22Js906h7hZ0JxiStCWY2WH/5K/pJf46dj8t3XGk
 04lDBL6iW5uBsXDoVPtE5y8yuFaWhW1s6RVltVE5W233sCjA1CbOX81
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033344_563324_9EC3C57D 
X-CRM114-Status: GOOD (  15.05  )
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

The device mode is defined as local type. This type cannot promise
SMP-safe access.

Change to atomic type and impose relax ordering, which ensures the
SMP-safe synchronisation and the ordering between the mode setting and
relevant operations.

Fixes: 22fd532eaa0c ("coresight: etm3x: adding operation mode for etm_enable()")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 include/linux/coresight.h | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 6de59ce8ef8ca45c29e2f09c1b979eb7686b685f..3e5e5acd0c7fcde7d312d440da4355faaf682c7b 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -251,15 +251,11 @@ struct coresight_trace_id_map {
  *		by @coresight_ops.
  * @access:	Device i/o access abstraction for this device.
  * @dev:	The device entity associated to this component.
- * @mode:	This tracer's mode, i.e sysFS, Perf or disabled. This is
- *		actually an 'enum cs_mode', but is stored in an atomic type.
- *		This is always accessed through local_read() and local_set(),
- *		but wherever it's done from within the Coresight device's lock,
- *		a non-atomic read would also work. This is the main point of
- *		synchronisation between code happening inside the sysfs mode's
- *		coresight_mutex and outside when running in Perf mode. A compare
- *		and exchange swap is done to atomically claim one mode or the
- *		other.
+ * @mode:	The device mode, i.e sysFS, Perf or disabled. This is actually
+ *		an 'enum cs_mode' but stored in an atomic type. Access is always
+ *		through atomic APIs, ensuring SMP-safe synchronisation between
+ *		racing from sysFS and Perf mode. A compare-and-exchange
+ *		operation is done to atomically claim one mode or the other.
  * @refcnt:	keep track of what is in use. Only access this outside of the
  *		device's spinlock when the coresight_mutex held and mode ==
  *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
@@ -288,7 +284,7 @@ struct coresight_device {
 	const struct coresight_ops *ops;
 	struct csdev_access access;
 	struct device dev;
-	local_t	mode;
+	atomic_t mode;
 	int refcnt;
 	bool orphan;
 	/* sink specific fields */
@@ -621,13 +617,14 @@ static inline bool coresight_is_percpu_sink(struct coresight_device *csdev)
 static inline bool coresight_take_mode(struct coresight_device *csdev,
 				       enum cs_mode new_mode)
 {
-	return local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, new_mode) ==
-	       CS_MODE_DISABLED;
+	int curr = CS_MODE_DISABLED;
+
+	return atomic_try_cmpxchg_acquire(&csdev->mode, &curr, new_mode);
 }
 
 static inline enum cs_mode coresight_get_mode(struct coresight_device *csdev)
 {
-	return local_read(&csdev->mode);
+	return atomic_read_acquire(&csdev->mode);
 }
 
 static inline void coresight_set_mode(struct coresight_device *csdev,
@@ -643,7 +640,7 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
 	WARN(new_mode != CS_MODE_DISABLED && current_mode != CS_MODE_DISABLED &&
 	     current_mode != new_mode, "Device already in use\n");
 
-	local_set(&csdev->mode, new_mode);
+	atomic_set_release(&csdev->mode, new_mode);
 }
 
 struct coresight_device *coresight_register(struct coresight_desc *desc);

-- 
2.34.1


