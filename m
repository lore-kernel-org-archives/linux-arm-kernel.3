Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F54CCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYInfgfFjfe/1xUtH817MilW2rq4mIOMWsU4t1+za9o=; b=TFpfyqzf1kaPPCpcH0ZwZVDQgZ
	wgp02A1z+vYU3g4fuUTgH01XvF0au1PKPxy2uENbOJA1bFX6PG5AN8G0sNS82gLzLf+YqWvsVjBf0
	QL0xxoj9oE+mqLUhmdrHXdJkGg3uNIPA8K8qINMzBkFsxjuMFvQSJVBa0Z7z9Kqoq/0qZJi1OUXD3
	xNvcowXcuyRFD/yIWfLllY1E7PT8GLC7pjTQRERDz5VyOoZfnefTG90cPdnM/sDdCy0cdJUnolfTv
	+doWp9W3uUS2GvDbt5Zwgs4BL7ga2A4I9cSB8bYOjiUykh2a38W04k4ZxnbhYpbX1VnFTiaU+EUZR
	dBpBsFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXY-0000000DEkY-32Ek;
	Mon, 11 May 2026 11:11:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXT-0000000DEiq-3WFY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8912C1713;
	Mon, 11 May 2026 04:11:01 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E10123F85F;
	Mon, 11 May 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497866; bh=pv1LJ39y5IzPLbEsxwuSUUT5yw+JNdAhO6M+mPdWuGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KNQY+xQjjFI+cbr41oKM94PSvGto2e4yQ9dJWHupBfL9mWuB8hABRMy65vS1boDkz
	 LEh+pByakKDn4yB90I+68AuYdgQzfi1wwZr4IJQKsU+ZiMJdxnzPgOmQWQvHAjEtN3
	 GFjLtS3GDY9wvda9hpNjTOcff8WTBtN8ScAYrTsQ=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:45 +0100
Subject: [PATCH v12 01/28] coresight: Fix source not disabled on
 idr_alloc_u32 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-1-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=1530;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qFglpTDcOB0M6dZVtge2m742wpRDtAGXLwND3/7xOCg=;
 b=vju8T6X5ZHcVU5t4AqrZrQhgNxz7CrVdNwPyc79GLxeOLM9LSbpXd1QXc4KR+QkdPpx95a58A
 drGwlUKHJE/AhIvFkQ1h/0ZnTouVX60q+/NNR15XgBYnpBywCzvC81z
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041109_148527_222ADA48 
X-CRM114-Status: GOOD (  13.54  )
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
index d2a6ed8bcc74d64dccc735463f14790b4e80d101..a5c08fab97a1b5d14d961e9b8ec6ef2d67b85944 100644
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


