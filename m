Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7871D6CFBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 04:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngbmmqYCi1w/CqjnVtCIQqcPtzhxHLxHVHZkge5dGYQ=; b=uTtLIYyhuKLtstEGTIVA5D7Lek
	xOhswhJpPU5Ot3WGPhB8eoTf/J/lTr+bihn8leuPCmXXGkEDVqIjkpfwy9ZI24w0ElY9QTDRN+Xho
	SIgbLGrCAjUgOoIBXeq0PBKWQC0C4ROzrx5OZreknlhELoiA20djrgPHzo4J/2x6sSHMjjg0mMjvf
	Yr1N490rRyX6rSMo83UKi8hZRVYOXC0lX1ZnqkxNK7LLN4SP398ZLt9EIYQ4DBcWO4vSFm9/F4iVi
	UwM9KLD1chvKhuUlQgjABQGC6l3dqAgG0KlVmvBNwVKY8HeDj+lxnCnRiGLLyfgQuNpyjE7paN51+
	9E8xGV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8tB-00000008Ces-1wBI;
	Fri, 23 Jan 2026 04:35:17 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8t6-00000008CdH-1nhJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 04:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769142910; x=1800678910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FwqtJH3O7glTJxFVBCwFNvRnU+Vt8HLfDNj4oBrDJwQ=;
  b=Hk8752no/wYHy1fEZQZaSPY0xbrLrqJ1fibbUcUrog7Jwy8JGrlYl8Pv
   dZt8CIoq6QfG5miaYR172XR4VWihliABGFq7aO+HsLjK4EYpaDPnekGYX
   anTWbXMz/ryoSdKf1tH19QDOb1k8oGyrSCPfpAR9bakiAaU9PnMnDGlvX
   EXdw8N16aSvbFHdfqO2sA4/Oma7ykGjPN3UVU+X2qZaPoqUVctvYnETH7
   YmkKdt0GzHXVvq5prnKDyeDVwR56wuYF3weZKEOlcNljRpcn82wzQxHdG
   TX3SI8Bt0RazpekvSOmX53Jw1LY2runtwV4yRTH5Gr3NDjiPjIE+vHydK
   g==;
X-CSE-ConnectionGUID: lIrbvh1+QIaWROkzfd/Rxw==
X-CSE-MsgGUID: SiQCVPQcTjWSjEtqYWbZfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="205771631"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="205771631"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:35:08 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9F5891C1737A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:09 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 5035EC05A14
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:35:09 +0000 (UTC)
Received: from sm-arm-grace06.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B34BA1001528;
	Fri, 23 Jan 2026 04:35:04 +0000 (UTC)
From: Shaopeng Tan <tan.shaopeng@fujitsu.com>
To: fenghuay@nvidia.com,
	reinette.chatre@intel.com,
	ben.horgan@arm.com,
	james.morse@arm.com,
	shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tan.shaopeng@fujitsu.com
Subject: [RFC PATCH 1/5] kselftests/resctrl: Detect the ARM architecture
Date: Fri, 23 Jan 2026 13:40:27 +0900
Message-ID: <20260123044034.141247-2-tan.shaopeng@fujitsu.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_203512_739903_87800C86 
X-CRM114-Status: GOOD (  13.18  )
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

The resctrl test is not enabled for MPAM (ARM Memory System Resource
Partitioning and Monitoring)
Add processing to detect the ARM architecture.

Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
---
 tools/testing/selftests/resctrl/resctrl.h       | 1 +
 tools/testing/selftests/resctrl/resctrl_tests.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 3c51bdac2dfa..492d2a1c4033 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -38,6 +38,7 @@
  */
 #define ARCH_INTEL     1
 #define ARCH_AMD       2
+#define ARCH_ARM       3
 
 #define END_OF_TESTS	1
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 5154ffd821c4..662968d38eca 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -8,6 +8,7 @@
  *    Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
  *    Fenghua Yu <fenghua.yu@intel.com>
  */
+#include <sys/utsname.h>
 #include "resctrl.h"
 
 /* Volatile memory sink to prevent compiler optimizations */
@@ -26,6 +27,7 @@ static struct resctrl_test *resctrl_tests[] = {
 static int detect_vendor(void)
 {
 	FILE *inf = fopen("/proc/cpuinfo", "r");
+	struct utsname system_info;
 	int vendor_id = 0;
 	char *s = NULL;
 	char *res;
@@ -42,6 +44,11 @@ static int detect_vendor(void)
 		vendor_id = ARCH_INTEL;
 	else if (s && !strcmp(s, ": AuthenticAMD\n"))
 		vendor_id = ARCH_AMD;
+	else {
+		uname(&system_info);
+		if (strstr(system_info.machine, "aarch64") != NULL)
+			vendor_id = ARCH_ARM;
+	}
 
 	fclose(inf);
 	free(res);
-- 
2.47.3


