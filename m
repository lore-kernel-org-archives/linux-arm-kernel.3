Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A414510F9313
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wXn2fwiwO+nXuL2xwGhCP6nSBIjl47NbvU+EVa3fkM=; b=Nb4lfOF/BDc6z1Nlpj4nQPAFs8
	vlu9h20S5jpuV9QOwag0GIkZy7imwqCsQw6YeH+rEeHoAFjGdulHokkYwoCWPRRR2+qrmMLPxGU5N
	AvxN6P3CLfKFjKqTEEJtL2mmNG6ElavJ+hBLSQzpo0tip8T/o1KP6PWavh7zdRsmFs8oxEh3VGxbf
	YcizCWXIJAUzqZRZa8txdDlkwG2SsE6TnMNK4EV/IU+XaSxqkmOSeQvLsutgtOTRKAO/VmyP1f4XE
	qyTlMavfw6V3/w3CcoItaZlDkQcWECFtC/biVwxMHyOowPy5Sz2nCQnmU42MZVNzuR32DPvzesQ9v
	nBsUNT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxG-0000000FukD-0g0R;
	Wed, 01 Apr 2026 18:06:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxC-0000000Fueq-23vI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 18:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5wXn2fwiwO+nXuL2xwGhCP6nSBIjl47NbvU+EVa3fkM=; b=a/masJrTRhyIYQZjl3d1g2WYzg
	F78/ABkyUx3DtojufzdapdCFpgO5twZ2OxuAe8M9oYVTGr3CxAGR0JFRI9PqkcpUgmZp3d1K5zTsP
	S502jncVhQXfYe+PgEaNdmKtHlH9K444N6HJ231cVlHmiFh+L5vvepEOf0SxBFZ5JDEhR0ZG4v2HX
	hUWHj3nkR/8577f+LfJ+Onuuk9b8ulwa42qvKegE/0J4Jr5R4ROB9JCaDpPMeg85NTzit6omq7lLF
	ey/h7vKTa9u36c7UU8g5bXQzJxxD06u5995uOZEPYNfaBw3XDBXQ1aT37fq8cgGYJjInutIIM+hT1
	8iQ8Xt/g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zx9-000000014Vp-1AN9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:06:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D928316F2;
	Wed,  1 Apr 2026 11:05:59 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3C9C3F7D8;
	Wed,  1 Apr 2026 11:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066765; bh=ZbeXOIdKvrOUtRGFaAsDKQijLpHlLketYqKOkJprbvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cEyZHcSZnis0JP2YzNlnptICJo5aYgR8AXOekSGXmO36qvsjWWSbajS+pIMeEOWkS
	 GmqoIUwR65ljrjHTVxEogV9hkriX8wVpfkvukjGgYebujSAaU91Z15J6/fUU0kSoI+
	 Vjafeq0qWNBvTlCCI8BA8BQDB3EM2MY8xHhOAQEs=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:38 +0100
Subject: [PATCH v9 09/20] coresight: etm4x: Remove redundant condition
 checks in save and restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-9-091d73e44072@arm.com>
References: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
In-Reply-To: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=2965;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ZbeXOIdKvrOUtRGFaAsDKQijLpHlLketYqKOkJprbvQ=;
 b=V8qD98Cta8RYV1Jlp/XQir9uhSkq/qwyEKBmP8NLIWpK/rGP2s8Td1W9FjTVsuVIBBC55xaEM
 ztnQ/JLYaywC7F+K53blrAvccEui/wNCsZ6k0Pi/36tBimOz3qKietD
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_190607_719566_6F955935 
X-CRM114-Status: GOOD (  14.55  )
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

Since the core layer determines whether context save and restore
operations are needed, performing the same check within the save and
restore callbacks is redundant.

The save and restore flows currently use two-level functions: the first
level handles the condition check, while the second level performs the
low level operations. As the checks are no longer necessary, simplify
the logic into single-level functions.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 35 +++-------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 6d13fa29d178627e3f0918d265634ab63e24803d..087a32fe34890528c6fa6ada601aeb742f04c41b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1861,11 +1861,11 @@ static int etm4_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
 	int i, ret = 0;
 	struct etmv4_save_state *state;
-	struct coresight_device *csdev = drvdata->csdev;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct csdev_access *csa;
 	struct device *etm_dev;
 
@@ -2003,26 +2003,10 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int ret = 0;
-
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
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
 
@@ -2121,17 +2105,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
-		return;
-
-	if (coresight_get_mode(drvdata->csdev))
-		__etm4_cpu_restore(drvdata);
-}
-
 /* Setup PM. Deals with error conditions and counts */
 static int __init etm4_pm_setup(void)
 {

-- 
2.34.1


