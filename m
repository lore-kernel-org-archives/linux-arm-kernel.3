Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A82CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GY39GJdCPvM3cH171BB9k5yHQ1eCoIKMtZb6pSuuJdI=; b=LBeNsK5jY7ZmT2AFIZxtNDAShH
	sxiyZKSFWFKsZs0ucN48eZXl5SQh/AKrJ6z8kKvD7jAeuKp8ZW9k2AjrVqlHFzIN/tkqpKh1iF2AH
	GfU0BbIoyG/uMdG2L6vspFMcCUOLi0OR/h9ahkJaIdxcBIXGk/UAye82vvcy9XOrG76jA/N5aDIGN
	OwsvESmF/tHBbljFbTeB5cVwRE+ixq8Iu1W+6vXPsJLv7SgETFGf1TtkYT5RKvVS/pteVj4iez1Mu
	PD2tRI3HzbeGl24tTn2BMNS5/5xnZq+YZNZNLt1z6EUYO8PBiV0QsJNNkA/8ils9YAbnH4ny4I9rB
	PD3DOBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeyh-0000000CtEV-1d11;
	Wed, 20 Aug 2025 09:19:31 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeH6-0000000ClB0-3uBS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:34:30 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57K8YQOS3154246;
	Wed, 20 Aug 2025 03:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755678866;
	bh=GY39GJdCPvM3cH171BB9k5yHQ1eCoIKMtZb6pSuuJdI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QeXNjW1g28W063AuPqO/PMaJfq6Cc1uTF8IvAGPIT2dxrAXz6EsiwmaFrGOOdR++j
	 btuC2c0D9+vPciRmH1Q/k4YUVLZv1sb2M/qDbliT9AW/1Ma1WoxKxoK/CZqsvwld/o
	 09EfoctzcVddNnMqitcrW+oamC316hWSGH1pLdAc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57K8YPSr1920213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 03:34:25 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 03:34:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 03:34:25 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57K8YOBM228618;
	Wed, 20 Aug 2025 03:34:25 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 4/4] cpufreq: ti: Add support for AM62D2
Date: Wed, 20 Aug 2025 14:03:31 +0530
Message-ID: <20250820083331.3412378-5-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820083331.3412378-1-p-bhagat@ti.com>
References: <20250820083331.3412378-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_013429_056722_969D51EA 
X-CRM114-Status: GOOD (  11.71  )
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

Add support for TI K3 AM62D2 SoC to read speed and revision values
from hardware and pass to OPP layer. AM62D shares the same configuations
as AM62A so use existing am62a7_soc_data.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 drivers/cpufreq/ti-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index 5a5147277cd0..9a912d309315 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -310,6 +310,7 @@ static const struct soc_device_attribute k3_cpufreq_soc[] = {
 	{ .family = "AM62X", .revision = "SR1.0" },
 	{ .family = "AM62AX", .revision = "SR1.0" },
 	{ .family = "AM62PX", .revision = "SR1.0" },
+	{ .family = "AM62DX", .revision = "SR1.0" },
 	{ /* sentinel */ }
 };
 
@@ -457,6 +458,7 @@ static const struct of_device_id ti_cpufreq_of_match[]  __maybe_unused = {
 	{ .compatible = "ti,omap36xx", .data = &omap36xx_soc_data, },
 	{ .compatible = "ti,am625", .data = &am625_soc_data, },
 	{ .compatible = "ti,am62a7", .data = &am62a7_soc_data, },
+	{ .compatible = "ti,am62d2", .data = &am62a7_soc_data, },
 	{ .compatible = "ti,am62p5", .data = &am62p5_soc_data, },
 	/* legacy */
 	{ .compatible = "ti,omap3430", .data = &omap34xx_soc_data, },
-- 
2.34.1


