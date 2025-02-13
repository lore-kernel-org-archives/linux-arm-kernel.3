Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42303C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NCwTb9jesJVsXmI2NnqkFZSV9FF1FN/iH6vQkwR4/w=; b=eH7bVAC4mQkEUGcbDJirZf4qJR
	AcZCRUqD8sBEUZ79x6Ik3QGueDgoU7xjBL3GOuYQwKuZHFFbTk0BEZy4HjxHO+CNVcsp3iJiGfBbw
	BQ6DWYX8F7dKzHH0dviWiw/9GeEoPRAh6d40v0Hfc66zsbgJwvMJXW/30Wb0Gg4fFhXea7tqyDCFE
	ghrBh0EDi7zUB9QKj+MhIoxoMt8J91oRxftlGzvakUZJTE7IPKe+FgrqQgEs5WgNR6V1GPqEH7AwL
	Nk+6o+zJCiiy0N3DQ+uMKYsuYOtMiowOavyAL6/6fQ5OsV61/NmBuVgdqaUfS+R3NxcqCxcMomZle
	E2iL/KUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tie9q-0000000CHVv-3YuV;
	Thu, 13 Feb 2025 18:41:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidYj-0000000C7xA-3q5R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:03:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E51B26AC;
	Thu, 13 Feb 2025 10:03:54 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B3543F5A1;
	Thu, 13 Feb 2025 10:03:31 -0800 (PST)
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
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v5 4/8] perf: arm_pmuv3: Add support for ARM Rainier PMU
Date: Thu, 13 Feb 2025 18:03:05 +0000
Message-ID: <20250213180309.485528-5-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213180309.485528-1-vincenzo.frascino@arm.com>
References: <20250213180309.485528-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_100333_997486_E946C499 
X-CRM114-Status: UNSURE (   9.40  )
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

Note: Coherently, add dt bindings for the same PMU.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
 drivers/perf/arm_pmuv3.c                       | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index a148ff54f2b8..295963a3cae7 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -67,6 +67,7 @@ properties:
           - arm,neoverse-v2-pmu
           - arm,neoverse-v3-pmu
           - arm,neoverse-v3ae-pmu
+          - arm,rainier-pmu
           - brcm,vulcan-pmu
           - cavium,thunder-pmu
           - nvidia,denver-pmu
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


