Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A90CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7tSlmUzP/+kMjz4UWTv33Na1EZIMENpQIPz+v37oAQ=; b=DlhDpGlLBhUxxqk2PaMpDOQgGl
	Yvu7UqJXx/vwL6TrWT417PGPWzz7xVOLep10FDElLMCpGSTGP5xgHjcpaXSB4tLMGJqabXua00E/9
	93DmmHIUBzW0t6ba3+OUuJH6gzfmRzxEgmDrVQ39OuBqSdyiXEIUzRmFMHBjpOtFPLN5CJvcS4+vF
	sQTsWar7kkeh8xLY0wrZnT3/Wjf70LLckshHFKV1MyaqCAnIRJn5XUHGyFH9uqPqfXla2yihRz2KZ
	PvxZx+Jtq4ufvfQHU0/ABtRAWjePUfSKj86gIToj1wL113pLySvkZzy8HgAHKHYLPMMA/+ylj8rhF
	9n5/YIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bv0-00000009iCM-09WJ;
	Mon, 22 Sep 2025 08:29:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buj-00000009hkK-1TNr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E52144EDE;
	Mon, 22 Sep 2025 08:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4131C4CEF0;
	Mon, 22 Sep 2025 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529728;
	bh=vkAmqpzgzzyialfvIFVGsoNQTnUld9ORrMfSrzt92bQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bSM/9iwPkLJM65GDM45VWPIDMXeDnTV/vJq9/4ahR582wZs+Lqh4k2V1n4LEfB0jV
	 9VEWgcvUTsKzqxvToOu5NtASX/OMDhQsrpZf/t0ApnmIDYdUuNTO5ZkD3V8Y1+N2WV
	 nqS/lOZ744AZlgla1UB9VaPOO9g/iLuS9A/F6bECZkHK8d7MhWQARZRCHDQdbzC5K5
	 o0I/Mlh/4mo8yNcw/Mq3cj/rR+Kwkb1Nkk4E8n3BAW7Cm1MMi9dnRR6e9Co/Z4vn29
	 3AfpxSh5RLmEK/fxDHkIfHfZnpX3xWk/Z0SASpHySZXhtR3OPsDr3f0pkrhOWomo/k
	 SIpqn5Tf1w9vw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0buh-00000008Kds-0Utw;
	Mon, 22 Sep 2025 08:28:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 19/26] perf: arm_spe_pmu: Request specific affinities for percpu IRQ
Date: Mon, 22 Sep 2025 09:28:26 +0100
Message-ID: <20250922082833.2038905-20-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922082833.2038905-1-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012849_420445_D2DBC850 
X-CRM114-Status: GOOD (  14.48  )
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

Let the SPE driver request IRQs with an affinity mask matching
the SPE implementation affinity.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_spe_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index a1c86a1f21427..f8763f0771776 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1183,8 +1183,8 @@ static int arm_spe_pmu_dev_init(struct arm_spe_pmu *spe_pmu)
 		return -ENXIO;
 
 	/* Request our PPIs (note that the IRQ is still disabled) */
-	ret = request_percpu_irq(spe_pmu->irq, arm_spe_pmu_irq_handler, DRVNAME,
-				 spe_pmu->handle);
+	ret = request_percpu_irq_affinity(spe_pmu->irq, arm_spe_pmu_irq_handler,
+					  DRVNAME, mask, spe_pmu->handle);
 	if (ret)
 		return ret;
 
-- 
2.47.3


