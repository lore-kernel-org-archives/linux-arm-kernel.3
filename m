Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A738ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AbPelCfaCppufecbb4jO2PrWSc+xFeVMvqVbKUJbxG0=; b=oItPykmZlEIIm34emH9PoScK/f
	K0eBMhKjf3+TWuSCQYj6mLqYf84wVwKzG1fc1WSzyCh6zJBNbpQjKsoZ4ID/r4Lkj40GQGfvfEa6p
	rTt9uMatlmzDnXczXPALh0gd6Tv0F3D2SAJIzk+RhBNfbCgHNIatNhHGlhPZdz6N6liWnvDgyZ7AG
	eSrmUxER8ibXS+9nTdBPs5Kw5go1Qf/D2PIZh9JYVcvymDXgDceioQlgs1RTEgesMM8QqhYSoTy9H
	Lo8IXLbhHYWrc7rLopI/t93r+yNJuk8oaIeERK1PbESI9qyirDSu7IHwuP3osrg4RwLtiD1OpzlYO
	PR6UB/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCmf-0000000HDQg-2UD2;
	Tue, 21 Oct 2025 13:52:17 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCmb-0000000HDOP-3luf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 13:52:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761054727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AbPelCfaCppufecbb4jO2PrWSc+xFeVMvqVbKUJbxG0=;
	b=Ocq0RCmcer8ptr29ntOH5jNR0A3phTJh/6MmLlfjd8JW2SRRwr1r6nTvNiFLxuoetLMGPl
	qcA9W+gfB+0IxOqfX5vxNKDlA5p23GRCMWI9fQmZpmnE++Hq3EYpA1MthlqhUs8rB5DcD3
	s8X0AUIURBQ7mNkagBl7P2JgBsqEzDA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] cpuidle: psci: Replace deprecated strcpy in psci_idle_init_cpu
Date: Tue, 21 Oct 2025 15:51:53 +0200
Message-ID: <20251021135155.1409-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_065214_076737_BA37AFEA 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

strcpy() is deprecated; use strscpy() instead.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/cpuidle/cpuidle-psci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index b19bc60cc627..e75d85a8f90d 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -382,8 +382,8 @@ static int psci_idle_init_cpu(struct device *dev, int cpu)
 	drv->states[0].exit_latency = 1;
 	drv->states[0].target_residency = 1;
 	drv->states[0].power_usage = UINT_MAX;
-	strcpy(drv->states[0].name, "WFI");
-	strcpy(drv->states[0].desc, "ARM WFI");
+	strscpy(drv->states[0].name, "WFI");
+	strscpy(drv->states[0].desc, "ARM WFI");
 
 	/*
 	 * If no DT idle states are detected (ret == 0) let the driver
-- 
2.51.0


