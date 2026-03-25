Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97924109C023
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cu2u4PZBnRUyC/QlxvZJzkfEV2b6VdpUnzC8OOY+EGA=; b=4i3aDVSmDbaYAzwBo7/pCduyeE
	C6XoVyHhy2ErbayVYYR+b2kHc1ZsroIRQun+Bwehs2kFbKEHbOmT4/R+V8FlWzv7DfppAODMhhHfE
	5kp3s0n+/6p2fVh9LuwByfrWuSYFz+whcbbkBiiJZ1AkloSReeNKBZwsQp4Q0nqrmAspstWRvTY6G
	dMZVeSxx9lpoRZfWgMO1pqcQsU5W1GeW+XRgme3r0Q1Q3r+j4NlNRjVgxav9heqIMBhy59SXdgxER
	pWFy32/p9kzbZ9+L5dxhgkewsJ3cBLgQzvha7JNr3L6RGGK8wBwa6wIUZsYQosQulIHN+AMtAyMCD
	2VmmOjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PDk-00000003aj8-21ZP;
	Wed, 25 Mar 2026 14:28:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCm-00000003ZsU-2PPi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 211881F91;
	Wed, 25 Mar 2026 07:27:26 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E44F3F836;
	Wed, 25 Mar 2026 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448852; bh=kTyqnzzkZ3DT/y7x81mdTzgg8GPF56u8FX0U6MNfi/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EZSdh90K2F+bHLMHFwaEiQ8c3z1Qnr0FeBHGMJzZqJc0scw0G8+vdMKGss5fuvXpG
	 q6Qv6thBt4v7GS1debmPbWOrs14Gq7y8fGJ1b/dBm6AZlyCBCiz8KDeD38G7r9AjIH
	 ja/IyYpxFuRzhuqpPfPwEgvuAhEwgAXDp0Bw6+dQ=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:52 +0000
Subject: [PATCH v8 15/23] coresight: etm4x: Set active path on target CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-15-7b1902e18041@arm.com>
References: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
In-Reply-To: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448817; l=2530;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kTyqnzzkZ3DT/y7x81mdTzgg8GPF56u8FX0U6MNfi/g=;
 b=Wwz98eZFs4sT66ufcx0MUkcKzqw5oywrtV/KKltgY8E4jtu+E4sRu6Tfaa+uRSNz5B50m9Tan
 +4hU8AP7aXKAcWaOBRaNaOtyI/htCmrRQhhHGEOAXuVi07CNeq98zxN
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072732_734757_83903F5C 
X-CRM114-Status: GOOD (  13.95  )
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

Set and clear the path pointer on the target CPU during ETM enable
and disable operations to avoid race conditions when retrieving the
pointer in CPU PM callbacks.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 4a9b226781a5c2ab6efcadf08614de58bcd4043a..1f100e8bbcc775a1bdc5f8b27ff15dbcaf030a63 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -234,6 +234,7 @@ void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
 
 struct etm4_enable_arg {
 	struct etmv4_drvdata *drvdata;
+	struct coresight_path *path;
 	int rc;
 };
 
@@ -621,8 +622,12 @@ static void etm4_enable_sysfs_smp_call(void *info)
 	arg->rc = etm4_enable_hw(arg->drvdata);
 
 	/* The tracer didn't start */
-	if (arg->rc)
+	if (arg->rc) {
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return;
+	}
+
+	csdev->path = arg->path;
 }
 
 /*
@@ -890,9 +895,13 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 
 out:
 	/* Failed to start tracer; roll back to DISABLED mode */
-	if (ret)
+	if (ret) {
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
-	return ret;
+		return ret;
+	}
+
+	csdev->path = path;
+	return 0;
 }
 
 static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
@@ -922,6 +931,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 	 * ensures that register writes occur when cpu is powered.
 	 */
 	arg.drvdata = drvdata;
+	arg.path = path;
 	ret = smp_call_function_single(drvdata->cpu,
 				       etm4_enable_sysfs_smp_call, &arg, 1);
 	if (!ret)
@@ -1063,6 +1073,7 @@ static void etm4_disable_sysfs_smp_call(void *info)
 
 	etm4_disable_hw(drvdata);
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -1092,6 +1103,7 @@ static int etm4_disable_perf(struct coresight_device *csdev,
 	/* TRCVICTLR::SSSTATUS, bit[9] */
 	filters->ssstatus = (control & BIT(9));
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 
 	/*

-- 
2.34.1


