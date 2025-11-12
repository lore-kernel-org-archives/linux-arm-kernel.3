Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C16CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYDL5J9A/ANXEyJbiUkEOJ1Yc/rz7DY32MTlHJbF/eQ=; b=YPnfGwGSZIr+o0VjTdWfy0sEjD
	PuIizHSpQQDP4SW8UCniosVo4fbutBsmyWnnceX91iP5mbnpLt6FMdJaShJcXtPu89ux3vjA/Jlin
	fFw9XqdwqBckxJEamCiGIiOfv74BDQ8XKLMcFvZt64sU3Fl7XMSs3eS4mqr4nFOlvjhTK3CxICaI2
	Oo4VxnuZYqQuhjHut/ahoIZU9euUdIADhP/4Bdj0Ln+IgoTNCxitiSx+4wpLOqnMHvWc3wRBnJJKu
	9IIFuRzrLLgPPMAPmWYjSc/jestVDImcy3ZhppljPuc88bjjrVaan2DFTs1frQwhLSHN644JR/k0p
	JF+p7vKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9V9-00000008jJx-0zOe;
	Wed, 12 Nov 2025 11:59:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9V6-00000008jIi-3GIx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:59:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CFF61596;
	Wed, 12 Nov 2025 03:58:52 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A72F63F5A1;
	Wed, 12 Nov 2025 03:58:58 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 11:58:37 +0000
Subject: [PATCH v7 01/11] coresight: Change device mode to atomic type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-arm_coresight_power_management_fix-v7-1-33e0b6f995f7@arm.com>
References: <20251112-arm_coresight_power_management_fix-v7-0-33e0b6f995f7@arm.com>
In-Reply-To: <20251112-arm_coresight_power_management_fix-v7-0-33e0b6f995f7@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762948736; l=3449;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=pLxqWuydwPklQj1aZsabheY40cGu5r1flojLbUo+NGQ=;
 b=NYIDt/RnAAQjiOK5Uv0HgveFLmNduhhuADZm0JXH3vuJoi+63h2bRnJuEdJTkQPNzBYbYW66o
 5IrKVlbeBZUBesnbYnlvSHbZAuu1Llva+5NdF0TMtDWKsLIJCPiU/OO
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_035900_955250_8E8680B1 
X-CRM114-Status: GOOD (  14.15  )
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
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 include/linux/coresight.h | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 56d0108658db34b8f2d184cd3214ca172a3ce808..2b48be97fcd0d7ea2692206692bd33f35ba4ec79 100644
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
@@ -624,13 +620,14 @@ static inline bool coresight_is_percpu_sink(struct coresight_device *csdev)
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
@@ -646,7 +643,7 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
 	WARN(new_mode != CS_MODE_DISABLED && current_mode != CS_MODE_DISABLED &&
 	     current_mode != new_mode, "Device already in use\n");
 
-	local_set(&csdev->mode, new_mode);
+	atomic_set_release(&csdev->mode, new_mode);
 }
 
 struct coresight_device *coresight_register(struct coresight_desc *desc);

-- 
2.34.1


