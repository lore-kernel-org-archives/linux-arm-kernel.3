Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15F6D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 19:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:CC:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lUfJmY42OH2PUrDiI8F//OrwjdKp72tHGexwEnE5ouQ=; b=Q806D/wXIHSCYh8xc5euaQIBI+
	1zTsgvMZhujYOfYhQ6z2CImWHCWTbFLKU+ZqkQmLCaEA5/FrqCPUCg20VIluaoYHnFJnHI1XXhKym
	G1irQqbYxh+9BWU4aT3YvF7+X+J8V+hNp2qfhEPsgpgvGUp3CXdbOqtEc+kPfrcztKGkeCCWs/MfL
	BRDD69/WyYPiT2MTMGEW5HNxr4ZSGpP5aYI+A/OrydqsnXbrEB9edbGFR47OA5FLkynNJROSP+8OU
	ac3cWmOHirTsAFKTKFJ79tuEr/NBKEyzn1WlTzjPi+6STjtviiKLlnwptspvp1jq4ihTit6Pa5hOr
	EyktpCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfkNq-00000007eGg-2MoK;
	Tue, 13 Jan 2026 19:48:54 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfkNm-00000007eFU-41kC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 19:48:52 +0000
Received: from [192.168.2.104] (213.87.161.90) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 13 Jan
 2026 22:33:29 +0300
Message-ID: <e6c2e7af-ad87-4d38-9dbb-f9d6ae81fe83@auroraos.dev>
Date: Tue, 13 Jan 2026 22:33:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh
 Kumar <viresh.kumar@linaro.org>, <arm-scmi@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Sergey Shtylyov
	<s.shtylyov@auroraos.dev>
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH] cpufreq: scmi: correct SCMI explanation
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.161.90]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_114851_015975_A8201265 
X-CRM114-Status: UNSURE (   7.82  )
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

SCMI stands for System Control and Management Interface, not System Control
and Power Interface -- apparently, Sudeep Holla copied this line from his
SCPI driver and then just forgot to update the acronym explanation... :-)

Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
The patch is against the cpufreq/arm/linux-next branch of Viresh Kumar's pm.git
repo...

 drivers/cpufreq/scmi-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index d2a110079f5f..e0e1756180b0 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * System Control and Power Interface (SCMI) based CPUFreq Interface driver
+ * System Control and Management Interface (SCMI) based CPUFreq Interface driver
  *
  * Copyright (C) 2018-2021 ARM Ltd.
  * Sudeep Holla <sudeep.holla@arm.com>
-- 
2.52.0

