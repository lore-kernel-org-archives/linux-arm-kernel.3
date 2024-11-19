Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEADD4415C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hIUID8xieOV5SK3rECKHKQCWffQtbOG8ZqTfYVraUjY=; b=noYPjyhQR1H3PEd+s2YuKNI9q4
	LK59hm+Donu1gOBLsuF6jYehv/z3Quys3MVgN+Bk/ASks8WTv64RS858i9YCGj3afVnoOktsL7rrG
	eQGE+xnRzoViF2Utwey3Hmyz0Lt2c5Q7r0Dbvj1bhf+fNJ8VwK79w5mCqWz648JJAum1AexG9XZEA
	GDhNauITi1gguyDIQvno2/1R2J89dgU00anZ+DQrjO5eShQ6SVUTNRjQ0TMOPVX/X21znp1bkuNXM
	KJAOn4U7aMgqDvnfysrgKwinglyKAqD3pIqM2GVYtLmnE1cV/Frk+1Ge3DEY/IsRXWeJvIfVLT97g
	5SDJx0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOBH-0000000CUkx-2Keb;
	Tue, 19 Nov 2024 13:22:11 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOAJ-0000000CUcP-2m4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:21:14 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJD45DY028148;
	Tue, 19 Nov 2024 14:21:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=hIUID8xieOV5SK3rECKHKQ
	CWffQtbOG8ZqTfYVraUjY=; b=r30K5B7QBbqWKOJ75bQublHGRF6DvENG6pUKWT
	y7tP8+/s4f4Tl6a060p3Yw5tUQ6feEY7peIk5fGiTU43u0e6p35cH362MAUwTeSX
	nUdxmu0B6ys+zt//xq1XokqgU+MS604NZx7ZUWk7nVnvHNXzovAdmmvGU9iSgYEo
	CUlKPLWhEiVJn2ylEZ/Mg3vu98kxqvTdMGhfhB5l6ajaw24oLlJpzxbGxSLcjGCQ
	+GGlJ2SVt9MHMnqWcdWSVrL+lF/WmLEbQ5Lt/EEn9UXQUdr0p+gALDOGF3cRpzeY
	3kFrBBw4Cu99jAa9FD/lffQSVe4QHBwJaF4a4JyKGt/BnTVg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y77n9x7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 14:21:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D7E8C40047;
	Tue, 19 Nov 2024 14:20:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E873270D6C;
	Tue, 19 Nov 2024 14:19:43 +0100 (CET)
Received: from localhost (10.48.86.243) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 19 Nov
 2024 14:19:42 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel
 Lezcano <daniel.lezcano@linaro.org>
CC: Patrick Delaunay <patrick.delaunay@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>
Subject: [PATCH] cpuidle: psci: Activate GENPD_FLAG_ACTIVE_WAKEUP with OSI
Date: Tue, 19 Nov 2024 14:18:34 +0100
Message-ID: <20241119141827.1.I6129b16ec6b558efc1707861db87e55bf7022f62@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_052112_137659_4B724E8B 
X-CRM114-Status: GOOD (  13.04  )
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

Set GENPD_FLAG_ACTIVE_WAKEUP flag for domain psci cpuidle when OSI
is activated, then when a device is set as the wake-up source using
device_set_wakeup_path, the PSCI power domain could be retained to allow
so that the associated device can wake up the system.

With this flag, for S2IDLE system-wide suspend, the wake-up path is
managed in each device driver and is tested in the power framework:
a PSCI domain is only turned off when GENPD_FLAG_ACTIVE_WAKEUP is enabled
and the associated device is not in the wake-up path, so PSCI CPUIdle
selects the lowest level in the PSCI topology according to the wake-up
path.

This patch is a preliminary step to support PSCI OSI on the STM32MP25
platform with the D1 domain (power-domain-cluster) for the A35 cortex
cluster and for the associated peripherals including EXTI1 which manages
the wake-up interrupts for domain D1.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/cpuidle/cpuidle-psci-domain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 146f97068022..5fb5228f6bf1 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -72,6 +72,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	 */
 	if (use_osi) {
 		pd->power_off = psci_pd_power_off;
+		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
 		if (IS_ENABLED(CONFIG_PREEMPT_RT))
 			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
 	} else {
-- 
2.25.1


