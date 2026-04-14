Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3DCF9D0C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lualVDQk+7lpcX1QnW0bNehJvoMHIbEXRCPhmw+9lew=; b=4khaRWQt0ukyxeGC/sscYBzu+3
	tUcVAIw73t7CUW6fWJGf/ZzThOf9biTIRxVKJNIb+Y2rkdXB6naTnm8GuekA9n4Y00nlQJ5eGp5yj
	k1/T4//4d96yB0LLvrHcG/RpHzpVwwzKXK2Sguo4yIKyF8yI9o+QXsLfI6nmPnzBNJDGWd2CdChIR
	1yRZkaMnM9Lf3OakiR/o8+NAekcqHDtk8Bz3RpIHoYdNqD2oXjzhCVp2hN8YXcv9Iok8YqrzPP2Zt
	CjdIS3xkfP/gHMBU8WBBd3+hRP5EMUK80qPRUz4q5coCz0vzxYiO+bgwjgCbApbmaeteB499ITY1J
	d9x+ZxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCc7I-0000000HF4l-3awC;
	Tue, 14 Apr 2026 11:39:40 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCc7G-0000000HF4Q-3P93
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:39:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KB1ctHE129AYHl4AyEIUJAo2QayvsW3FAi6MHPBAAlro/h8TwEfHKm3DhRi7sck+dKZ65hKremPw1l4E3bgEgMBdv8sFgsl/vknpgKmFI4ewIh2bbxAWaq/xO7yJzkuhFHW9bvMn2h6p+DZGiUnO4yBBqIfASqVaFfFkRCYAUbSMyBbMO0+H5bBvW+okoMPOFKB5HcId5I6nlE3zcM6IMNNfJdohvf283iXeing9VCKGl0Awx54wM7loU1UkQm1nq0Ptoc1/tyJVWYey1M40RmSb7dtg3qDWgJUYERiAvWmv6+8bEEhE5gXuvcpBLgGhZ25J3cUOFlRAgsg3k6DqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lualVDQk+7lpcX1QnW0bNehJvoMHIbEXRCPhmw+9lew=;
 b=nxmdWf+jXrY0oRcQ9VcGkiTi2cneTMm0E07dbWRuMlm615pHX831InXIv7CYC5tlD93CPXe92LxqES/yfWNu2G0pMeJMappmm1i2Pcw11cbBSnpg4la/xWLRW+IR2AqfS6Exs5F0et+hVq/a9m2/+7DYVuATaw6+xcAEsGyXv9gJkGKq+EKQlvhYmWpfBq84zPYYYGbktOV4q7MIZf4HchTC83PlPylL804okRZNvgDHViSEyIeRqYBaeOI0i3ybHFVHtiJZlQKfkHmUUBcv8REtJui3sW94ter2tVvLbxnp5TH6upYcGo7zWmj2gqbku2NgMBV961QvtgwaLobjuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lualVDQk+7lpcX1QnW0bNehJvoMHIbEXRCPhmw+9lew=;
 b=yjEKl5yoqijhQmg+gmKamHSD7zIX3QcItH1DeeytHIzJr6MckAD8aqwmTRxf58vuXA6AV4G0iCgw4uh4yM+d1Oz9ol6Ojh4x4xPnzK+VoQ8SMYX1tAsoLkFbrO8SrYBGAqCGGYh6bbWjKX2nhIx7jSX3eFmkvewFVNhw3lGPLrDtfrpGW748p5XIhf0kLGDNbvcqhvK73NKAMdRHwbpGhGTCoXcWSW3eIVnFN1vfgA+JTEJRvf/Gnjjk2hmhL/eV/bi1fNtkcRG2H0H3IlxX2mXQEJuM6jM6PitO72wtEEN/EVxt983TzB6dGPF8UjudiC+PTVLnlxxAUefOAVNeKw==
Received: from BL1PR13CA0160.namprd13.prod.outlook.com (2603:10b6:208:2bd::15)
 by IA2PR22MB5464.namprd22.prod.outlook.com (2603:10b6:208:4b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Tue, 14 Apr
 2026 11:39:29 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::11) by BL1PR13CA0160.outlook.office365.com
 (2603:10b6:208:2bd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 11:39:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 11:39:27 +0000
Received: from zoo11.fihel.lab.ge-healthcare.net (zoo11.fihel.lab.ge-healthcare.net [10.168.174.93])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 5E3A0131E4;
	Tue, 14 Apr 2026 14:39:25 +0300 (EEST)
From: Brian Ruley <brian.ruley@gehealthcare.com>
To: Russell King <linux@armlinux.org.uk>
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	Brian Ruley <brian.ruley@gehealthcare.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: fix race condition on PG_dcache_clean in __sync_icache_dcache()
Date: Tue, 14 Apr 2026 14:39:18 +0300
Message-ID: <20260414113919.782-1-brian.ruley@gehealthcare.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|IA2PR22MB5464:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4ded33c9-5784-4a90-a846-08de9a1a7c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Qink3qM6rNr90st4y9z7t5Vr54z32ykxAdMluFA/mCbUPzbauYvpBzQiJmATzr+qaT+qlcY5CTZCiD14qbSibaTWj4bZ/ynJ4ZNBmK02nXPw9gMOzrUtt7oW9wnehSPnUuKwmOOlSf5LqUXowJzFsYXEfMqanWsZsz5grOGOu8evUJiblDZtbzoviuJJwqLOBDAZEXgYP5iYe2UWmyvXi50pKly4p9qrm4jTA626faNbRk7mxgp+R+kKGoYdQ/C4g9smp/gWEeAmxWY0Xvj2iOaZQ8b4x8jXOXfKckGUYpMY31rbVMiWwoah5ARJ3NRU3Gjmcgti53jjq976LtKsNQbJsQhpWFhmN03dRGrgj78Lt17vJefFUOkTmPPYKzbNmQImU4g8MHFh2REfDeSn+nlxLPuhTnxke4REnfs8A1tDUbLXGxjqOXuOtQ4H+AGYQqAFUqwpXM3xvtZ17RD3mc2Bbifrd/Hn3AxskBOufGkSahlHwldgciUhWE+RlgHAscMyoAmG3silxC5wqlSq2cuBFGf+OoIS3vrfnBQDhYwGWsJ0fNWGiwHGEMIIoPI2JI9RD15NrKCrrUiUePJkrPkDiBOJ00FnGfs8vMpLPcXmiZfJO57sPIjRIt7EWmlrFbcm8SA3gQZ7rBTABfdh8hU+dh0tJittNSTVYOVfOMVaIArO8FW6lG5ZKoqw26tGVFmWUIgX2MEw6f22LJT2Zw/fkCDyzmyEdqGVSEgcJryv963RKw3RL+qbYQZfl8nKgjRlVu/6g6LtFQDCeK0lXw==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TWBTqQssXrU1IgaNWZpCqnM+8lZyckniuM2L0Mgvtp023HFHkDupajM1avcBWjykYUtozFF/vECCg9v5YJBZqNGpU2dKZx2UiMyvROixkLV/d+UyaOjgn3aFHd4Mg73p6612lfwxlyLYhNmREKg9fSKVCjIlVuYprlcYRlLaHx7qiVBMu8M0jXrGq7IoctOl+QbXHApgZetJD54Hld8DlZKkuujKeXlrgBKLNWIfkiAS4E3qpyh9qSMh26v1Md72qBTUW48FIgjC6WybcCDU9nfAUOQj16SmfBxNan4sB/ZlUjDLCtOtuiqONmNcybp4Io0oYQvCT8ZG1wjN1Sku9wA1pXgHs2ecE7rIUjkR/0kMh1blKK7Ve1eYsB6fqAHDQGnSGA+f17v5tqMEWyHUIvPWPmMUFlcDcqme3Ccs5y5sB5X5Kda4xpBDNUHkq6FO
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 11:39:27.8716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ded33c9-5784-4a90-a846-08de9a1a7c68
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR22MB5464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_043938_862754_DBB6086B 
X-CRM114-Status: GOOD (  11.12  )
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

This bug was already discovered and fixed for arm64 in
commit 588a513d3425 ("arm64: Fix race condition on PG_dcache_clean in
__sync_icache_dcache()").

Verified with added instrumentation to track dcache flushes in a ring
buffer, as shown by the (distilled) output:

  kernel: SIGILL at b6b80ac0 cpu 1 pid 32663 linux_pte=8eff659f
          hw_pte=8eff6e7e young=1 exec=1
  kernel: dcache flush START   cpu0 pfn=8eff6 ts=48629557020154
  kernel: dcache flush SKIPPED cpu1 pfn=8eff6 ts=48629557020154
  kernel: dcache flush FINISH  cpu0 pfn=8eff6 ts=48629557036154
  audisp-syslog: comm="journalctl" exe="/usr/bin/journalctl" sig=4 [...]

Discussions in the mailing list mentioned that arch/arm is also affected
but the fix was never applied to it [1][2]. Apply the change now, since
the race condition can cause sporadic SIGILL's and SEGV's especially
while under high memory pressure.

Link: https://lore.kernel.org/all/adzMOdySgMIePcue@willie-the-truck [1]
Link: https://lore.kernel.org/all/20210514095001.13236-1-catalin.marinas@arm.com [2]
Signed-off-by: Brian Ruley <brian.ruley@gehealthcare.com>
---
 arch/arm/mm/flush.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
index 19470d938b23..4d7ef5cc36b6 100644
--- a/arch/arm/mm/flush.c
+++ b/arch/arm/mm/flush.c
@@ -304,8 +304,10 @@ void __sync_icache_dcache(pte_t pteval)
 	else
 		mapping = NULL;
 
-	if (!test_and_set_bit(PG_dcache_clean, &folio->flags.f))
+	if (!test_bit(PG_dcache_clean, &folio->flags.f)) {
 		__flush_dcache_folio(mapping, folio);
+		set_bit(PG_dcache_clean, &folio->flags.f);
+	}
 
 	if (pte_exec(pteval))
 		__flush_icache_all();
-- 
2.47.3


