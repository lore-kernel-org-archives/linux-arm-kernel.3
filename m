Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A47CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssfXasNT05vOn7htmIJsykp3fnMZ9DRToyC5YZenTYo=; b=IyNZY8/LsjzKjqCJcofCgjn4Np
	iWb8YA6q32IaE8dehRzDdM1W3JQFvskhgAatxWubgOzn/HFUjxvZiUz9NCHVGRyPM4CwiQkWvYPbl
	I5af09otVsplPPU2ZkfYM6PZQ5mpapGHxB9sUdhnHtoWG/5ulIBWFG5ch6HEC76wjeCbfMMr2+CAV
	slW6RlFlSFToaBvqTL4lZva2Kpgw56YFuxF0PYPQE/694v56FsCdWiDpB5WEEAC6NH3SIDPbGGcFB
	wQhaVtod6lG3je2sEHGcriCyCW1ynfq0f0s6EbBaWGcybugIaiKTb6+5iEDqDYwn8gUWhsEjf/gHE
	2jtxWOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNypk-00000009Ia9-2sn4;
	Fri, 15 May 2026 20:08:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNypg-00000009IYj-2CNg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:08:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAF7235DE;
	Fri, 15 May 2026 13:08:21 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BB823F836;
	Fri, 15 May 2026 13:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875707; bh=BMRAjj4Qgyon7BMhHKUryWBIKbDxRikVYxxfGqW4VDg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XZIGyHL3r17Ybnu7SMk/zg6vkOBeaAaPLBJNnznZ9B1RElK4rCLtzDaKiG68JDUBW
	 LVUBHkKJWCULkgerfFF0TtbzPd3LZ49lan5u64wfyKKm7waWcwS0JzLku2Uh4OFtN6
	 4nZ08a7a4JL4vj5Ecx3FWFKZSLHYEATSxYaHwUng=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:08 +0100
Subject: [PATCH v14 01/28] coresight: Fix source not disabled on
 idr_alloc_u32 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-1-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=1530;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=54OOfhO0zSlA+lnt3JOv2CncjNEdH8CafL0XY4hCeJE=;
 b=o9NQmLKBPFDJObYyTAaNXMxL+KZ/NXJlCokDItGlEx4N9AKiz1u/M2Tpn/lZfbvPwZ1DnFy0X
 a5tN6TBRadUCvLLCgDLQvH8Yq/iRA84MYrNxpr9FvB2QO7dRJgkI+85
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130828_623410_98D99C0B 
X-CRM114-Status: GOOD (  13.69  )
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

From: Jie Gan <jie.gan@oss.qualcomm.com>

In coresight_enable_sysfs(), for non-CPU sources (SOFTWARE, TPDM,
OTHERS), the source device is enabled via coresight_enable_source_sysfs()
before idr_alloc_u32() maps the path. If idr_alloc_u32() fails, the
original code jumped directly to err_source, which only calls
coresight_disable_path() and coresight_release_path(). The source device
was left enabled with an incremented refcnt but no path tracked for it,
leaving the device in an inconsistent state.

Disable the source before jumping to err_source so the enable and path
operations are fully unwound.

Fixes: 5c0016d7b343 ("coresight: core: Use IDR for non-cpu bound sources' paths.")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index b6a870399e83419dce0552099562fa3ae7b2bd69..da6f22b512c92ab0cff5bb239495a1ab6d2a0dbe 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -244,8 +244,10 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		 */
 		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
 		ret = idr_alloc_u32(&path_idr, path, &hash, hash, GFP_KERNEL);
-		if (ret)
+		if (ret) {
+			coresight_disable_source_sysfs(csdev, NULL);
 			goto err_source;
+		}
 		break;
 	default:
 		/* We can't be here */

-- 
2.34.1


