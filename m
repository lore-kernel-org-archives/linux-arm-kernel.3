Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D8BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7hEiB4pbPGecnZFTyqesWBwgJZ0Xx1Iz7ukH44DFi0=; b=tpg+fnnV9O/Ci2y7oOMhpaTY70
	GDsRVFXIAaIXNLwiPzTinYtH5mMl7TRKt0asKO4MMPsU8bDCp4fxW6dLbPN1wPtHdjErNU3Y2TRzT
	6ZCuNwqQ598b8fAN9wGFUm6K65MHTtkzc8aIEp4ddb7E0S9y4uw92LkUjlzga8uFYodvuG5IUgrAB
	xcUkd1JlHnjLSBijoTDhlKo0EuqzgMVjuJazspW9UOv6N2KsZ16wfUNAtUv7cb+PxNLA5adV6LE89
	pLGW7wNv5Y/2QyJQfwZFbN05d1CDYk7spzjPF0y14rfMHSbdHEk85cvlMpYHN9bgM4trnxvxx76Bk
	/sF6mYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyrL-00000009K7B-0s4U;
	Fri, 15 May 2026 20:10:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyrD-00000009JzT-267c
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 20:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g7hEiB4pbPGecnZFTyqesWBwgJZ0Xx1Iz7ukH44DFi0=; b=neCTfUm1SsZUr6Oqv1upnxktm/
	ks/1+DTERPW8Agobaj6v0fit/1Rda52QEzD/M4qZW4waXhuImG+RpdEggIvrxe8g8NpFUB2C1r1o4
	ZKqQ4Y0svou9eAd4FEzXu8rs3QxlrqahZypSoPKgiDPQYz27ijl9aaPe7gXWghHadj8VD2BX9H0Y1
	dTOtWcWiFlZt9gD0NEhFqItffyJPMoP6yjRGj9IjPO9Y4Rrgpl0/6OyVE5VGMGe41NyKZdXYg8nBM
	9FBYDJknALtfe7aNgMygNQHsSVVij78zr7dinHBdADnmqJeycVswSp+T0Tc2hOWy4WZqpDCf3m/AP
	fr5QTBDQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqe-00000006A2f-1CqZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8163035E4;
	Fri, 15 May 2026 13:09:22 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3A9F3F836;
	Fri, 15 May 2026 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875767; bh=x6Qxrdzs8yU6+2ecIQkvtzr+/P/7hUZqsMY9HVrj+HM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vBtSWx4OyhDotX3E//gNuD30imq2Xp6MBgSCdOhGsUYUm80GSaRk/IZUyrsSfx3Rm
	 27hdHlf5MVZjQ4yArW++9Z2Pm+1oUgRUZUn84BU+L/vPvbXNzIzVDmL+wlj1+i5/Qz
	 fEhzBNI/4Mf2bWUGXF7sbpttexNUzvQkyW9ots70=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:27 +0100
Subject: [PATCH v14 20/28] coresight: etm4x: Set active path on target CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-20-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=2600;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=x6Qxrdzs8yU6+2ecIQkvtzr+/P/7hUZqsMY9HVrj+HM=;
 b=9xDMJkHrC+2tusZ1oxjAOE4ltsznBMlFvQYf/AIe51pDG22QRg2JbF+d/TrwMy85pD8QwyuBE
 lC5WwSwxaBpDguHDIfq4ItmVJtgvRdPSis+yqOxsogn80DTc5qlfqh0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_210941_490903_12340DA0 
X-CRM114-Status: GOOD (  13.97  )
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

Set the path pointer on the target CPU during ETM enable and disable.

This ensures the device mode and path pointer are updated together and
observed atomically by the CPU PM notifier.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index fef1270439e9d770fc0459e9ab8cab7cb40827ee..343ba9ce946a7ea3776c06d43364cdce823e2c80 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -238,6 +238,7 @@ void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
 
 struct etm4_enable_arg {
 	struct etmv4_drvdata *drvdata;
+	struct coresight_path *path;
 	int rc;
 };
 
@@ -625,8 +626,12 @@ static void etm4_enable_sysfs_smp_call(void *info)
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
@@ -894,9 +899,13 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 
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
@@ -926,6 +935,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 	 * ensures that register writes occur when cpu is powered.
 	 */
 	arg.drvdata = drvdata;
+	arg.path = path;
 	ret = smp_call_function_single(drvdata->cpu,
 				       etm4_enable_sysfs_smp_call, &arg, 1);
 	if (!ret)
@@ -1067,6 +1077,7 @@ static void etm4_disable_sysfs_smp_call(void *info)
 
 	etm4_disable_hw(drvdata);
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -1096,6 +1107,7 @@ static int etm4_disable_perf(struct coresight_device *csdev,
 	/* TRCVICTLR::SSSTATUS, bit[9] */
 	filters->ssstatus = (control & BIT(9));
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 
 	/*

-- 
2.34.1


