Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263B2CD4843
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om32yXhs+QvBym8qN0KqHr18ySF4002j+nxRXTzSuLo=; b=2MZD5jQ4E58fIAKvBczVDZDyX1
	696S8OwX0o6BDibNhyO8JQY82TZ+LkjhqCz9ZAbAxLoKn2SA93H4IU8pkltiH7eNIChHbGmnHLgxW
	hS58gwFepUaYOrIRNCLwShHUogB8iuQdAtaVRkW1zDgoLvdb369bJXJYoCj/eIZP8KN5+XFQeampc
	JQPxvfO0t3XQZEuJWBslHCWqoCOEPJ19QIRAhZuERj+/JKZEq95J7zNlUcekJCr2JYn1qhjtVafMk
	mXoeVrSunK0FmKXtyyuzIgY2c3cp+PuTOx6fxEU8ZAbn0oxfBCcwLJXthm2arPiyvVQTvSiXuUgBN
	fvcTrMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYO-0000000DFm6-0G0h;
	Mon, 11 May 2026 11:12:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY9-0000000DFRm-2XyY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Om32yXhs+QvBym8qN0KqHr18ySF4002j+nxRXTzSuLo=; b=jvHi5VWyY7E8f1toQCQAFTRLEU
	DiBK3OCSwdPbb3Fa4fvy1StxvHr0oH+nN3wgHUV2liO6b3iRWs6+LdwR712UH5auVV55S3lM/0D47
	BbJz7oL3tEk1Z4j/QyiDKo+2E9jRxGZ114gVBsZq3PZ7OggIIajZ3ksZ++PrYcE1kSr/uSSiwxCPy
	76t1VRNkjQ7ZRfHERuiB1OMP86Sh/q7IrPp/9JLvpLqz9VZzt4ZP+C8PwMnzRQDxm8YS0OXT+kexb
	y4VANrIxRFkfk9643tLU4+Bu96Cc9LgWXH3jtwN4w7wjZyUKK9qCULmzQpkVxDSu32pjoz+DWR9am
	5nKIlg7A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY3-0000000BQiw-0WoY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 986521756;
	Mon, 11 May 2026 04:11:36 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C6DE3F85F;
	Mon, 11 May 2026 04:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497901; bh=qmXnyAfd8XzEF5licnSwSdyXddUMt9j3gcpVUu/ZpmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yqcop1eGr2Duvj7yVsZ1X6s0NneP6ItjLiuRG3D5ybb4x4eD/LZj1PTFxegYc579Z
	 0mjEUNfht6o7sD0hRAyPRyLGWMSdWRGjfflI8MhS8BLyILEqVVZqN0psTss2THVa90
	 O0QCqfBNECMJvrr5AtRPqeGqWTjgFTrNpfAKQLQc=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:57 +0100
Subject: [PATCH v12 13/28] coresight: etm4x: Remove redundant checks in PM
 save and restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-13-1c9dcb1de8c9@arm.com>
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
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=3181;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qmXnyAfd8XzEF5licnSwSdyXddUMt9j3gcpVUu/ZpmA=;
 b=45Ml5alJRarSvjqjMg95ZPDxmLLZu8JIMmn/TU/7YVE7iYnRP8z+bU50c6AMeFZFMFZFlN71B
 vK+4i58TQ+gAaLMw8VoAnYJuoZtoPIapM4TCFfNnWD/IFrrAwa4O7a7
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121146_079165_4DB67E90 
X-CRM114-Status: GOOD (  13.82  )
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

ETMv4 driver save/restore callbacks still re-check conditions that are
already validated by the core layer before the callbacks are invoked.

Remove the duplicated checks and fold the two-level functions into
direct callback implementations.  The obsolete WARN_ON() checks are
removed as well.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 41 +++-------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 5cd70f0f3710a5ec6406a89c034d30230f782b13..fef1270439e9d770fc0459e9ab8cab7cb40827ee 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1853,17 +1853,14 @@ static inline bool etm4_pm_save_needed(struct etmv4_drvdata *drvdata)
 	return !!drvdata->save_state;
 }
 
-static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
 	int i, ret = 0;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etmv4_save_state *state;
-	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa;
 	struct device *etm_dev;
 
-	if (WARN_ON(!csdev))
-		return -ENODEV;
-
 	etm_dev = &csdev->dev;
 	csa = &csdev->access;
 
@@ -1995,32 +1992,13 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int ret = 0;
-
-	if (!etm4_pm_save_needed(drvdata))
-		return 0;
-
-	/*
-	 * Save and restore the ETM Trace registers only if
-	 * the ETM is active.
-	 */
-	if (coresight_get_mode(drvdata->csdev))
-		ret = __etm4_cpu_save(drvdata);
-	return ret;
-}
-
-static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+static void etm4_cpu_restore(struct coresight_device *csdev)
 {
 	int i;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etmv4_save_state *state = drvdata->save_state;
 	struct csdev_access *csa = &drvdata->csdev->access;
 
-	if (WARN_ON(!drvdata->csdev))
-		return;
-
 	etm4_cs_unlock(drvdata, csa);
 	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
 
@@ -2113,17 +2091,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	if (!etm4_pm_save_needed(drvdata))
-		return;
-
-	if (coresight_get_mode(drvdata->csdev))
-		__etm4_cpu_restore(drvdata);
-}
-
 static const struct coresight_ops etm4_cs_ops = {
 	.trace_id	= coresight_etm_get_trace_id,
 	.source_ops	= &etm4_source_ops,

-- 
2.34.1


