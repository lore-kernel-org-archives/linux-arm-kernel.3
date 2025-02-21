Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61B7C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5m1RuY+RQqkMNIBFAigrCxI4TYa5mNvA2VrOSqkPxXM=; b=OiKWqYD+zV+J7v0BDuZ8GMx64w
	H7K7gx0+bB6fIHQKdbfC+zdljzwR8Nm037eE4pS9FZ8p3Ika0xvaCPXwC8WRpOWzN6EubR736hgyP
	Cobg8vSS0i8LZ2UjaPiO53uxADOqFT68CHuFSWKvdhw66dnBtEP/S5aoDKrjSQ128Dmswkzug7SjN
	Ey6XSDtCBhiJjUN6FNkSwyUPDdAEEQDmpQzXuLc/Rb1Xh9Ntv8W3JQwEQjDvPFlKopkim1vRMzCt1
	hmiNiIo0+M93zYC0cIzwVyk5jhWHEtPKa4DWF5sVFp0tML7hV9D9CIQTDUGW8U8EUEuhkWf7aafz8
	ZlZHErRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXXw-00000006UaG-3YwX;
	Fri, 21 Feb 2025 18:14:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXNj-00000006SFS-49ED
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:04:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E37EC169C;
	Fri, 21 Feb 2025 10:04:28 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A6A63F59E;
	Fri, 21 Feb 2025 10:04:08 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v7 06/10] perf: arm_pmuv3: Add support for ARM Rainier PMU
Date: Fri, 21 Feb 2025 18:03:45 +0000
Message-ID: <20250221180349.1413089-7-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_100412_096939_67D007B3 
X-CRM114-Status: UNSURE (   9.66  )
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

Add support for the ARM Rainier CPU core PMU.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 drivers/perf/arm_pmuv3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 0e360feb3432..3785522a08e7 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1369,6 +1369,7 @@ PMUV3_INIT_SIMPLE(armv8_neoverse_v1)
 PMUV3_INIT_SIMPLE(armv8_neoverse_v2)
 PMUV3_INIT_SIMPLE(armv8_neoverse_v3)
 PMUV3_INIT_SIMPLE(armv8_neoverse_v3ae)
+PMUV3_INIT_SIMPLE(armv8_rainier)
 
 PMUV3_INIT_SIMPLE(armv8_nvidia_carmel)
 PMUV3_INIT_SIMPLE(armv8_nvidia_denver)
@@ -1416,6 +1417,7 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "arm,neoverse-v2-pmu",	.data = armv8_neoverse_v2_pmu_init},
 	{.compatible = "arm,neoverse-v3-pmu",	.data = armv8_neoverse_v3_pmu_init},
 	{.compatible = "arm,neoverse-v3ae-pmu",	.data = armv8_neoverse_v3ae_pmu_init},
+	{.compatible = "arm,rainier-pmu",	.data = armv8_rainier_pmu_init},
 	{.compatible = "cavium,thunder-pmu",	.data = armv8_cavium_thunder_pmu_init},
 	{.compatible = "brcm,vulcan-pmu",	.data = armv8_brcm_vulcan_pmu_init},
 	{.compatible = "nvidia,carmel-pmu",	.data = armv8_nvidia_carmel_pmu_init},
-- 
2.43.0


