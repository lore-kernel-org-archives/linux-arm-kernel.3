Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC4CEDEC0E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezmyIM6FHQDrzl1EkcfN6SAGz5elIdAZuug2Oh8CgtU=; b=mp52ibORQVbxTMlwxJmuPCC9dA
	qFoRkaLd+cqdWRw67vD21n1lhAx4gMmgwBev565wIQh/8mQd59m1/1FvCEU3ndR1y2p3vMq8fUfhE
	Er3KtJ4qSBpEH452Iu/8nwsXQQW95V2RPh+QOZNOo9ykxoMeFG+TGv4/I0PUhK1/ZM0QQ8nKXnR/m
	N5dpCyHOmzuq4f7OdqrPcQqs6SQ44TbpTR1j8ixX1A86KqD8+q4jjCkzkOoHbQ7ct0V6ZQOwoOKtH
	ObeIKiPES3RzmLXrmruy+++p2lwloaJZNrC0sNhGugXvY6fbbEINiyQ5fW7aobPHDRp0+32rmI4ch
	JgR9SaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSk-0000000GPKu-1yrs;
	Wed, 04 Mar 2026 04:03:54 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdSe-0000000GPEf-1dJ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:03:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ezmyIM6FHQDrzl1EkcfN6SAGz5elIdAZuug2Oh8CgtU=;
	b=Uu63euOB9tuLj9E9JCIUsB0HfXS9UUdW0Yq2eJicbMLWHk/UyI+VCaQi9qs/bp+y9qWC5QxAL
	lNaQrUr7rE2PHV1wojc/pGzbyNBTXrlsHsPm0+XLAeW1arEF238xOSP0bSr8hWTi2Kia13/AyPw
	vQv3ZafU7rDKQ6dA9ZvJQ5Q=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6P3z1bz1T4GG;
	Wed,  4 Mar 2026 11:58:37 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D46CD40538;
	Wed,  4 Mar 2026 12:03:38 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:38 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [RFC patch 5/9] selftests/resctrl: Refactor CPU vendor detection to use lookup table
Date: Wed, 4 Mar 2026 12:03:30 +0800
Message-ID: <20260304040334.765860-6-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260304040334.765860-1-wuyifan50@huawei.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_200348_780926_27DEBEF0 
X-CRM114-Status: GOOD (  15.59  )
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

Currently, the vendor detection is implemented using a series of
hard-coded "if/else if" string comparisons, which does not support ARM,
as the ARM implementer is indicated by other sequences in /proc/cpuinfo.

This commit refactors the vendor detection to be data-driven and
extensible.  It introduces a lookup table to define all vendor-specific
detection rules.  This separates the detection algorithm from the data.

The new lookup table is implemented as a variable-length array of nested
anonymous structs to to map a file to a sequence of string and vendor.

This makes the code cleaner, maintainable, and simplifies the addition
of support for new vendors (e.g., ARM) in the future.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 .../testing/selftests/resctrl/resctrl_tests.c | 82 ++++++++++++++-----
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index dbcd5eea9fbc..419d876a97c2 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -23,39 +23,77 @@ static struct resctrl_test *resctrl_tests[] = {
 	&l2_noncont_cat_test,
 };
 
+#define VENDOR_ENTRY struct {\
+	unsigned int vendor_id; \
+	void *arg; \
+	}
+
+#define SEQ_ENTRY struct {\
+	char *format; \
+	VENDOR_ENTRY *vendor; \
+	}
+
+#define DETECTION_ENTRY struct {\
+	char *pathname; \
+	SEQ_ENTRY *seq; \
+	}
+
+static DETECTION_ENTRY vendor_detection[] = {
+	{
+		.pathname = "/proc/cpuinfo",
+		.seq = (SEQ_ENTRY[]) {
+			{
+				.format = "vendor_id\t: %s\n",
+				.vendor = (VENDOR_ENTRY[]) {
+					{ .vendor_id = ARCH_INTEL,	.arg = "GenuineIntel" },
+					{ .vendor_id = ARCH_AMD,	.arg = "AuthenticAMD" },
+					{ .vendor_id = ARCH_HYGON,	.arg = "HygonGenuine" },
+					{ .vendor_id = 0,	.arg = NULL }
+				}
+			}
+		}
+	},
+	{ .pathname = NULL, .seq = NULL}
+};
+
 static unsigned int detect_vendor(void)
 {
 	static unsigned int vendor_id;
 	static bool initialized;
-	char *s = NULL;
+	char s[64];
 	FILE *inf;
 	char *res;
 
 	if (initialized)
 		return vendor_id;
 
-	inf = fopen("/proc/cpuinfo", "r");
-	if (!inf) {
-		vendor_id = 0;
-		initialized = true;
-		return vendor_id;
+	for (DETECTION_ENTRY *dentry = &vendor_detection[0];
+		 dentry && dentry->pathname;
+		 dentry++) {
+		inf = fopen(dentry->pathname, "r");
+		if (!inf)
+			continue;
+		for (SEQ_ENTRY *sentry = &dentry->seq[0];
+			 sentry && sentry->format;
+			 sentry++) {
+			for (VENDOR_ENTRY *ventry = &sentry->vendor[0];
+				 ventry && ventry->vendor_id;
+				 ventry++) {
+				snprintf(s, sizeof(s), sentry->format, ventry->arg);
+				char *res = fgrep(inf, s);
+
+				if (res) {
+					free(res);
+					fclose(inf);
+					vendor_id = ventry->vendor_id;
+					goto out;
+				}
+				rewind(inf);
+			}
+		}
+		fclose(inf);
 	}
-
-	res = fgrep(inf, "vendor_id");
-
-	if (res)
-		s = strchr(res, ':');
-
-	if (s && !strcmp(s, ": GenuineIntel\n"))
-		vendor_id = ARCH_INTEL;
-	else if (s && !strcmp(s, ": AuthenticAMD\n"))
-		vendor_id = ARCH_AMD;
-	else if (s && !strcmp(s, ": HygonGenuine\n"))
-		vendor_id = ARCH_HYGON;
-
-	fclose(inf);
-	free(res);
-
+out:
 	initialized = true;
 	return vendor_id;
 }
-- 
2.33.0


