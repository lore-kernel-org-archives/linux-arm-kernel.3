Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6738ACD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CdARzok5sXxRW0dKtGrt1Afbosk5RLGOnnbTA+BFqQ=; b=HJIGfN11Po7zbCkLEgVVeQbMer
	7GjfTFILlF/jqqkCUP/SYbSS+B8XPDtWawtvhSla7JIIXjW3smVa9O2qa3pdc3qRGZjhLA5e1DbrO
	Y4gAMYjCAPojAS6MmP52aNzcorsXkY9kpenSt3j+XK1vdAxvWFi3D2IsmQhmE8ulnyNUk7EctfqC7
	yGco3cGwLgEwSnRZDXXMowcXH99TwiCN+aCcTLnH7RBbSlaQGexyri4CeeyrmwxMjsSfcq3crg9Q2
	IA1nrxa8H0OWB+TeeXEIPbiHkBgb8iGMGTFQ65R1ONPoaHQOwBtJpqSH7IP6vil95EkhWmPXWE4VJ
	O0ERZstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3C-00000007S0U-0Is3;
	Fri, 01 May 2026 16:49:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3A-00000007RwM-0Oa6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+CdARzok5sXxRW0dKtGrt1Afbosk5RLGOnnbTA+BFqQ=; b=rEkIlbi61BksQgKQFCZ5WA02Mp
	wcWKs7Bi/Y8Z1hVdtNaP9FuihTfRxWDXJAseqQwy3g29zl5KL7HiRq6ZbzzXUEk3LQhbJ2ue3KBg8
	lqPlsU2DO0LUwcpT6W/A8n6BnTAwTEd5zzUvXz6mC9+rGb2FowYT33q04rSt7uTHBamEqeMyNLax3
	0VdkmayHcafkUen4XPPkPCgqnbj53A/kMWu+SJjNYkbBgfZNQIU2/tU81WnCaHAKbv7PX0MurzFVi
	/Obn+kf8SVLGuDPrbNtyfyRgVXI1XHlYh18hmQOFvdmyR1Fvd68g/oUfljzuFWAcbf4wZsg+PNqkw
	Qfu2pTaA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr34-00000009BBV-28tL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:49:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEB56176A;
	Fri,  1 May 2026 09:48:59 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0EDC3F7B4;
	Fri,  1 May 2026 09:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654145; bh=sK/yrfp1bE9tW6anZ/D3wtmwDt+Cld+V2QTsAAtS5ww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l92GyY9gfDSkp3rH7Y+dyadbQN2UiRoTT1ltGDD4awMj9CNIrKq6HcREOAGfFkuBy
	 FwNRVY9l/PIa+gXAIznVvuOg3AVaDzkJBbtPg9s3P5OoZCcw6YK+HD0bevl4+2xSnd
	 R28DHnDHD8M04+vMWo78demy0Os3QXIsNNA3qB/I=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:48:01 +0100
Subject: [PATCH v11 20/27] coresight: etm3x: Set active path on target CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-20-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654086; l=2545;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sK/yrfp1bE9tW6anZ/D3wtmwDt+Cld+V2QTsAAtS5ww=;
 b=N9xtTkkDCeGjvK1ugtKd3WysVlAPZc0d0FCFm1lc/9ZuOgkCo8DDUD9Rqhdb1p9MfHpushE62
 I4akhwSl9TxAfa22lRLngHuEGzt/IrYoeKU3XCqfKFnl9GNEaQiOkdI
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174906_881143_F14E2AD9 
X-CRM114-Status: GOOD (  13.35  )
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
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index aeeb284abdbe4b6a0960da45baa1138e203f3e3c..c6fe8b25b855a4119110fee4162f55c0154c3d05 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -441,6 +441,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 
 struct etm_enable_arg {
 	struct etm_drvdata *drvdata;
+	struct coresight_path *path;
 	int rc;
 };
 
@@ -462,8 +463,12 @@ static void etm_enable_sysfs_smp_call(void *info)
 	arg->rc = etm_enable_hw(arg->drvdata);
 
 	/* The tracer didn't start */
-	if (arg->rc)
+	if (arg->rc) {
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return;
+	}
+
+	csdev->path = arg->path;
 }
 
 void etm_release_trace_id(struct etm_drvdata *drvdata)
@@ -492,10 +497,13 @@ static int etm_enable_perf(struct coresight_device *csdev,
 	ret = etm_enable_hw(drvdata);
 
 	/* Failed to start tracer; roll back to DISABLED mode */
-	if (ret)
+	if (ret) {
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return ret;
+	}
 
-	return ret;
+	csdev->path = path;
+	return 0;
 }
 
 static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
@@ -514,6 +522,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	 */
 	if (cpu_online(drvdata->cpu)) {
 		arg.drvdata = drvdata;
+		arg.path = path;
 		ret = smp_call_function_single(drvdata->cpu,
 					       etm_enable_sysfs_smp_call, &arg, 1);
 		if (!ret)
@@ -583,6 +592,7 @@ static void etm_disable_sysfs_smp_call(void *info)
 
 	etm_disable_hw(drvdata);
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -607,6 +617,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 
 	CS_LOCK(drvdata->csa.base);
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 
 	/*

-- 
2.34.1


