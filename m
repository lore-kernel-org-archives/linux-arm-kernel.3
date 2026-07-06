Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73331C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tuRuzQOT0T09CzpPaVV8nOKGRc5yeYMghMrWPU6r+Kc=; b=bLY9WgG6f+zy0cSdOPAnjwpWBI
	hznVAwNnP7ugi7c+kJeo7PeJuS4yo6dfQpj5PKFCyHLP9t4+CWtPMkLSzfIh2mpAhizUL+U6NfoZ8
	UHoRM722NzRp9fU0Czl/ghj0BRf0pVkYpy4mFQEcBGdWy3VSCPf3z3yupTUoUb9pn3V2fAThijhGB
	z2WxB1GT9WS9i4rkZ4EuXWHAkfAlWWb8l6Cl7yEbnOiHEj172ZeLST47yQGrb3+mj8XqfFEAHIa4v
	MY7iQs0NuI/AZLuRpNMzWMGN9R0AdJCbaN48oAbG6U0U8RXON7sJr8s/EIk+7B1P/a6gjp6yqG+ZY
	yVJurdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkn7-0000000ConL-2FSG;
	Mon, 06 Jul 2026 14:59:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkn6-0000000Con8-09RP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:59:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 562E460098;
	Mon,  6 Jul 2026 14:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A60D1F000E9;
	Mon,  6 Jul 2026 14:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783349963;
	bh=tuRuzQOT0T09CzpPaVV8nOKGRc5yeYMghMrWPU6r+Kc=;
	h=From:To:Cc:Subject:Date;
	b=u5iU4odY9fcPkxunqFmDb8zd8zumV9C9aLca8TizOI7I2cD4/C5jBfXFqoxx7xWcj
	 f3VpX5bXBQHtB8mHmFKY+cIiFZSvzmoi6C9iIBGbEyGi62Fxtzx8ElYpjEed5nTaZP
	 JSiP/E2zI05046c5l/n08a4uA87hxG1e9U4cPghw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] drivers/perf: thunderx2_pmu: add error handling
Date: Mon,  6 Jul 2026 16:59:36 +0200
Message-ID: <2026070635-feel-joyride-6d5b@gregkh>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=donjYxC2W+iexmioBwX8kzeazja0D4jOJp6CmR6H3MI=; b=owGbwMvMwCRo6H6F97bub03G02pJDFneh6738FQvPHH7YPS5L2ddOIy1rHjOijhpPD765Xjls 9MhW9Zd64hlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJTPZnmKfFKT7BOGOthKfu RGfGoKz8W6t48xnmp8wuP/eI84/FFAnd01zf00+tZdk1BwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
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

From: Griffin Kroah-Hartman <griffin@kroah.com>

Add error handling for devm_kasprintf functions in
tx2_uncore_pmu_register() and tx2_uncore_pmu_init_dev().

Regarding the latter function, I am unsure whether or not
PMU_TYPE_INVALID should be the default case.

Assisted-by: gkh_clanker_2000
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/perf/thunderx2_pmu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 6ed4707bd6bb..1a6aa94a3efb 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -738,6 +738,8 @@ static int tx2_uncore_pmu_register(
 
 	tx2_pmu->pmu.name = devm_kasprintf(dev, GFP_KERNEL,
 			"%s", name);
+	if (!tx2_pmu->pmu.name)
+		return -ENOMEM;
 
 	return perf_pmu_register(&tx2_pmu->pmu, tx2_pmu->pmu.name, -1);
 }
@@ -837,6 +839,8 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev(struct device *dev,
 		tx2_pmu->attr_groups = l3c_pmu_attr_groups;
 		tx2_pmu->name = devm_kasprintf(dev, GFP_KERNEL,
 				"uncore_l3c_%d", tx2_pmu->node);
+		if (!tx2_pmu->name)
+			goto err;
 		tx2_pmu->init_cntr_base = init_cntr_base_l3c;
 		tx2_pmu->start_event = uncore_start_event_l3c;
 		tx2_pmu->stop_event = uncore_stop_event_l3c;
@@ -852,6 +856,8 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev(struct device *dev,
 		tx2_pmu->attr_groups = dmc_pmu_attr_groups;
 		tx2_pmu->name = devm_kasprintf(dev, GFP_KERNEL,
 				"uncore_dmc_%d", tx2_pmu->node);
+		if (!tx2_pmu->name)
+			goto err;
 		tx2_pmu->init_cntr_base = init_cntr_base_dmc;
 		tx2_pmu->start_event = uncore_start_event_dmc;
 		tx2_pmu->stop_event = uncore_stop_event_dmc;
@@ -866,17 +872,21 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev(struct device *dev,
 		tx2_pmu->attr_groups = ccpi2_pmu_attr_groups;
 		tx2_pmu->name = devm_kasprintf(dev, GFP_KERNEL,
 				"uncore_ccpi2_%d", tx2_pmu->node);
+		if (!tx2_pmu->name)
+			goto err;
 		tx2_pmu->init_cntr_base = init_cntr_base_ccpi2;
 		tx2_pmu->start_event = uncore_start_event_ccpi2;
 		tx2_pmu->stop_event = uncore_stop_event_ccpi2;
 		tx2_pmu->hrtimer_callback = NULL;
 		break;
 	case PMU_TYPE_INVALID:
-		devm_kfree(dev, tx2_pmu);
-		return NULL;
+		goto err;
 	}
 
 	return tx2_pmu;
+err:
+	devm_kfree(dev, tx2_pmu);
+	return NULL;
 }
 
 static acpi_status tx2_uncore_pmu_add(acpi_handle handle, u32 level,
-- 
2.55.0


