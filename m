Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29D2CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7hEiB4pbPGecnZFTyqesWBwgJZ0Xx1Iz7ukH44DFi0=; b=X2ZEKwnnBrSQvvhEN5azd7dVQD
	y7/BKaKvU3geK5QeNcQjhWCHLysLWdLn0cep6e3qMVlUPod9aUDqNEYmzJjIGE70yfsZ+7z/w9S2X
	agoMNAC2Y8LVlqqbLuvQWc5yUyHxt0ilDbsHuQ0wEsmxmk8K25Y07I36+0OgQ2hHwkZ8xFsmom/JS
	C2ZLruYkNYYV7yeceH3+Ywm3upRnGH18EcdXYBil+ylwfG4BPD2PfVBfzfHkjmbzLfdO8nfPcGJ5+
	0XGwoAQjFwm84lroz7XpMUeUdS997Lz1W0mQdtK0hccbK427VD/ZSx8CJ0bgWvxKnINnFwlT+YbzP
	qHhv7n+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYs-0000000DGVw-0TxU;
	Mon, 11 May 2026 11:12:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYh-0000000DGFS-1by1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g7hEiB4pbPGecnZFTyqesWBwgJZ0Xx1Iz7ukH44DFi0=; b=kGR+D1i1WajymJmrQrBjkyBQZ5
	F0jLfav/4YlhFp1zV9ETf1X2weoM7STuekawRPL31kweGZCSCzzeXGKsplkAGELabuJuvBhQdD68x
	OfwXb1OVUs7cIZh9UzlkUCg7V4nBx0IE2A9uWpDR77OZBpCsTvcJoDC5ncboQAnQKh3LiN0+LKfb2
	gVapDHXAQQZfiEJDKI+u7pWDPLJPSwzslZJmiKA9/Kkuqo0jsHundME0R3DWt0Sshzk4Zqd9Ll9HI
	fZTarXyeqha6Brz3YICgRphnOiRItLn6kbEQnS493XGzF498dDqSNORhulYoQqh4Z1PSQsni7z3Vn
	gPHxn7qQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYK-0000000BQv9-3lEj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:12:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B2DA1713;
	Mon, 11 May 2026 04:11:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 271313F85F;
	Mon, 11 May 2026 04:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497920; bh=x6Qxrdzs8yU6+2ecIQkvtzr+/P/7hUZqsMY9HVrj+HM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f8TGVwDElwexR27nhye3lxmcITEa2hW2N8fB4xLd/ZuQmO2NZQUFjEGDAqtyQ0THe
	 oKNjRx2FR3AwfjNBvYKZGbBCntMy8CmgUs+QwgH1a7kQbBsFU5O2A0GTKwOzClyTl9
	 FthPeKWh7ER20/mZerhAN2N8zsm2rccRmPlRZMaI=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:11:04 +0100
Subject: [PATCH v12 20/28] coresight: etm4x: Set active path on target CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-20-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=2600;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=x6Qxrdzs8yU6+2ecIQkvtzr+/P/7hUZqsMY9HVrj+HM=;
 b=4k3N88E/M1hwzqByL41e0vRLYISbXuxeoAXtywgouaPibD+6iEsyi1lIzdAliLA5PiqF76Wyy
 aqfYS0AnSs+CUnea0rsMBlWrlRmOJDb791jG8+JO5C/3LCz6f8cy3qE
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121201_965516_92FF2597 
X-CRM114-Status: GOOD (  13.83  )
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


