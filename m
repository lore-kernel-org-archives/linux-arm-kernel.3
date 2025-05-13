Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC62C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlsrZWeenyC0/oA4EKHJIWA9A8qOsT7tYCM3MzHXv2U=; b=sZNbCjQfDwQCWArG0cGNn4TZHq
	s4Dn1wyBaOBphpMJjVPrbAauvn+t1XalN+x68FjiY06WP7EYdMOCsXRmOxA0M7UeQsYnyzb2AY3cB
	bWFfVEs+nLPm6EtaFxyUvjlaGlw90mqArvcUzb9aHuKlpcK6AO/e+Y2EePQCT/Vcnep+VAF9l292H
	XScz9BJopZci+b7FJXS9MeX5jFJsthnt2Py6ATbrYUDGQDKuDwO7DbkUapPvdNOmItDjHKvac7lKY
	mpO6O2Ub7uqJYdKyXhMDPOwVljgiE/dW0oNu6zELztOg8FYU46oMBkIeAxxh+1qh7FFSPpZrQlGuw
	8ImhcVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErqL-0000000CpbV-2HaS;
	Tue, 13 May 2025 15:46:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErin-0000000Coel-26k5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:39:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 100571688;
	Tue, 13 May 2025 08:38:58 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE8953F63F;
	Tue, 13 May 2025 08:39:07 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com,
	stable@vger.kernel.org
Subject: [PATCH 1/3] perf/arm-ni: Set initial IRQ affinity
Date: Tue, 13 May 2025 16:38:58 +0100
Message-Id: <614ced9149ee8324e58930862bd82cbf46228d27.1747149165.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1747149165.git.robin.murphy@arm.com>
References: <cover.1747149165.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_083909_609605_E5C25E5A 
X-CRM114-Status: UNSURE (   8.08  )
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

While we do request our IRQs with the right flags to stop their affinity
changing unexpectedly, we forgot to actually set it to start with. Oops.

Cc: stable@vger.kernel.org
Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-ni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index de7b6cce4d68..9396d243415f 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -544,6 +544,8 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 		return err;
 
 	cd->cpu = cpumask_local_spread(0, dev_to_node(ni->dev));
+	irq_set_affinity(cd->irq, cpumask_of(cd->cpu));
+
 	cd->pmu = (struct pmu) {
 		.module = THIS_MODULE,
 		.parent = ni->dev,
-- 
2.39.2.101.g768bb238c484.dirty


