Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FC5C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b475qJWdWcJhY5GMCMnGFNZj5MDXG7GgOtc2xgV1ffc=; b=f5XTwD4yBi5xrIlhKgGpR4SBBH
	eCNNh8lc3TvsLwaeqnylL539hergb0nFovGju3nUGRw773Sb375fcjM+ZZ4hMMLV1LbUfBxIbzmJ/
	nMhG5PU7TXWvrjRIbSr0Lm8BC6yrVeztq6ii1lGij4F6ehpad6+yv23ZcKgMisVm0MUYQPchS/X3y
	rUWe3Y51bYUW5fFZUwmM0eR3IZ6rzhrEd0KJsbpLsa8Ot7dNJ8OCTZi+a8SPLflX615QWqmDDCFJc
	FdKV2D3COpEcOT59RSeNWZAB36F8R1lr7gj96rsERBgZmAHOQveblJWI3mTGjVC48kTWRph9Su868
	4TLkgEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzO-00000006Mkh-0QmO;
	Tue, 01 Jul 2025 18:45:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcNs-00000005n9t-0CMB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55F0112FC;
	Tue,  1 Jul 2025 07:54:40 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B6D13F66E;
	Tue,  1 Jul 2025 07:54:53 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:53 +0100
Subject: [PATCH v2 28/28] coresight: Manage activated path during CPU
 hotplug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-28-23ebb864fcc1@arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=1398;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=VXURT5YNfJCgVDQn9xbHJCyB9NNKk9hTM6afuDo+h18=;
 b=Zt9zzL0IG1nPqpBSgmtqOTMWoR5vbwEPdJd6wVKgUoxZy+PO9o2k4gyjEnPKQgoASLUehaGXt
 /JAt1ZldA1qCNXP3ur8edXP4hkv7C9g1WsSCgvscwvpd9vzdGqIHOAe
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075456_127842_4B5D167F 
X-CRM114-Status: GOOD (  11.94  )
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

This commit handles activated path during the CPU hotplug process.

When a CPU is hotplug off or hotplug in, and if an activated path is
associated with it, the CPU PM notifier disables and enables the path,
including the sink and helpers.

When disabling a path, the sink's disable() callback updates its buffer
in SysFS mode.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index e1659b05738e73fcb6c66c74c8f1ce3a24ab2da4..0f77f4c5464550a28e2dce391e92160a7003c140 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1717,6 +1717,7 @@ static int coresight_starting_cpu(unsigned int cpu)
 	if (path->saved_mode != CS_MODE_SYSFS)
 		return 0;
 
+	_coresight_enable_path(path, path->saved_mode, NULL, false);
 	source_ops(source)->enable(source, NULL, path->saved_mode, path);
 	return 0;
 }
@@ -1743,7 +1744,8 @@ static int coresight_dying_cpu(unsigned int cpu)
 	if (WARN_ON(path->saved_mode != CS_MODE_SYSFS))
 		return 0;
 
-	source_ops(source)->disable(source, NULL);
+	coresight_disable_source(source, NULL);
+	coresight_disable_path_from(path, NULL, false);
 	return 0;
 }
 

-- 
2.34.1


