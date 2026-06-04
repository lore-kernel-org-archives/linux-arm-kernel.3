Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A1CCD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ts2iYOlNKH3kWFa5rVVu9XfgvOuT/GxiEr87iyKRZdg=; b=IKBEs3uTf4IWdk1n0Qauf8ZcIz
	6aN8IxCWDLECX9f2/VKV99KxPogf3b5WWT6LmEFmIbCv2VSGnq0keexPvrFz1oWhcfxejzV4nacTi
	PRsaFsibjCoyW2Bsv1SgFbTCmAJjJKhkJgwMcla6cZqxr4OzdCX+qI/frzlCT3ub9Lfq6iHBimZGG
	YYxWgBs8FD9fYb87b8doMxcdHenoDT5Zwb+rEz2/Lvx1VGrtzUhFCgWCbG3j0Sj8xzcEvHCpjDKVM
	RBp3eWKqkCGZXAcvv8w01JMuVfwvDIlcMrRdh4l1uWY2agLR6qMkF4E4RAomkJ31GCRswDq22nGSY
	JXdYtj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2qU-0000000GKJx-3dsb;
	Thu, 04 Jun 2026 07:50:30 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2qN-0000000GKB8-2veF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:50:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ts2iYOlNKH3kWFa5rVVu9XfgvOuT/GxiEr87iyKRZdg=;
	b=WH/gBSSHVf9VXwlXAHa5ElbV+aucjJmYuCIctUTcGAf8dRCwRPe+0aqhiFGvYOb5sLqRWoDNZ
	zH3Sa/ejc8FEgjZ+77oaweKi8p7oYa+hYUEvROVIctbEXLhdodm7R6/tsJ36ABZJ2gjhHX0GL5F
	/A0+xVeUx7684OTjwwW+8aA=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gWGk01W7XzKm8N;
	Thu,  4 Jun 2026 15:42:16 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 348594055B;
	Thu,  4 Jun 2026 15:50:09 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:08 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:07 +0800
From: Sizhe Liu <liusizhe5@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <bhelgaas@google.com>, <yangyccccc@gmail.com>,
	<jic23@kernel.org>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <wangyushan12@huawei.com>,
	<shenyang39@huawei.com>, <gaozhihao6@h-partners.com>,
	<yuzhichengcheng@h-partners.com>, <liyihang9@h-partners.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>, <wuyifan50@huawei.com>,
	<liusizhe5@huawei.com>
Subject: [PATCH 02/10] perf hisi-ptt: Fix PTT trace TLP Header parsing
Date: Thu, 4 Jun 2026 15:49:57 +0800
Message-ID: <20260604075005.2219785-3-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260604075005.2219785-1-liusizhe5@huawei.com>
References: <20260604075005.2219785-1-liusizhe5@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn200012.china.huawei.com (7.202.194.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_005024_160634_0C4B58F1 
X-CRM114-Status: GOOD (  13.79  )
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

The DW0 bit field layout of the hisi_ptt_4dw union does not match the
actual bit ordering in little-endian memory, causing incorrect field
extraction. Reorder the struct members from LSB to MSB to match the
le32_to_cpu() conversion.

Also print all DW hex values in big-endian byte order for readability,
matching the bit field layout shown in the format diagram.

4DW format is like:
bits [31:30] [ 29:25 ][24][23][22][21][    20:11   ][    10:0    ]
     |-----|---------|---|---|---|---|-------------|-------------|
DW0  [ Fmt ][  Type  ][T9][T8][TH][SO][   Length   ][    Time    ]
DW1  [                     Header DW1                            ]
DW2  [                     Header DW2                            ]
DW3  [                     Header DW3                            ]

Cc: stable@vger.kernel.org
Fixes: 5e91e57e6809 ("perf auxtrace arm64: Add support for parsing HiSilicon PCIe Trace packet")
Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 Documentation/trace/hisi-ptt.rst              | 28 ++++++++--------
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 33 ++++++++++++-------
 2 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/Documentation/trace/hisi-ptt.rst b/Documentation/trace/hisi-ptt.rst
index 6eef28ebb0c7..f6a2655f99e5 100644
--- a/Documentation/trace/hisi-ptt.rst
+++ b/Documentation/trace/hisi-ptt.rst
@@ -285,20 +285,20 @@ according to the format described previously (take 8DW as an example):
     [...perf headers and other information]
     . ... HISI PTT data: size 4194304 bytes
     .  00000000: 00 00 00 00                                 Prefix
-    .  00000004: 01 00 00 60                                 Header DW0
-    .  00000008: 0f 1e 00 01                                 Header DW1
-    .  0000000c: 04 00 00 00                                 Header DW2
-    .  00000010: 40 00 81 02                                 Header DW3
-    .  00000014: 33 c0 04 00                                 Time
+    .  00000004: 60 00 00 01                                 Header DW0
+    .  00000008: 01 00 1e 0f                                 Header DW1
+    .  0000000c: 00 00 00 04                                 Header DW2
+    .  00000010: 02 81 00 40                                 Header DW3
+    .  00000014: 00 04 c0 33                                 Time
     .  00000020: 00 00 00 00                                 Prefix
-    .  00000024: 01 00 00 60                                 Header DW0
-    .  00000028: 0f 1e 00 01                                 Header DW1
-    .  0000002c: 04 00 00 00                                 Header DW2
-    .  00000030: 40 00 81 02                                 Header DW3
-    .  00000034: 02 00 00 00                                 Time
+    .  00000024: 60 00 00 01                                 Header DW0
+    .  00000028: 01 00 1e 0f                                 Header DW1
+    .  0000002c: 00 00 00 04                                 Header DW2
+    .  00000030: 02 81 00 40                                 Header DW3
+    .  00000034: 00 00 00 02                                 Time
     .  00000040: 00 00 00 00                                 Prefix
-    .  00000044: 01 00 00 60                                 Header DW0
-    .  00000048: 0f 1e 00 01                                 Header DW1
-    .  0000004c: 04 00 00 00                                 Header DW2
-    .  00000050: 40 00 81 02                                 Header DW3
+    .  00000044: 60 00 00 01                                 Header DW0
+    .  00000048: 01 00 1e 0f                                 Header DW1
+    .  0000004c: 00 00 00 04                                 Header DW2
+    .  00000050: 02 81 00 40                                 Header DW3
     [...]
diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index c48b2ce7c4a3..67024f18ebbb 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -11,6 +11,7 @@
 #include <byteswap.h>
 #include <linux/bitops.h>
 #include <stdarg.h>
+#include <linux/kernel.h>
 
 #include "../color.h"
 #include "hisi-ptt-pkt-decoder.h"
@@ -75,14 +76,14 @@ static const char * const hisi_ptt_4dw_pkt_field_name[] = {
 
 union hisi_ptt_4dw {
 	struct {
-		uint32_t format : 2;
-		uint32_t type : 5;
-		uint32_t t9 : 1;
-		uint32_t t8 : 1;
-		uint32_t th : 1;
-		uint32_t so : 1;
-		uint32_t len : 10;
 		uint32_t time : 11;
+		uint32_t len : 10;
+		uint32_t so : 1;
+		uint32_t th : 1;
+		uint32_t t8 : 1;
+		uint32_t t9 : 1;
+		uint32_t type : 5;
+		uint32_t format : 2;
 	};
 	uint32_t value;
 };
@@ -90,12 +91,17 @@ union hisi_ptt_4dw {
 static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *desc)
 {
 	const char *color = PERF_COLOR_BLUE;
+	uint32_t value;
+	uint8_t byte;
 	int i;
 
+	value = le32_to_cpu(*(__le32 *)(buf + pos));
 	printf(".");
 	color_fprintf(stdout, color, "  %08x: ", pos);
-	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++)
-		color_fprintf(stdout, color, "%02x ", buf[pos + i]);
+	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
+		byte = (value >> (24 - i * 8)) & 0xFF;
+		color_fprintf(stdout, color, "%02x ", byte);
+	}
 	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
 		color_fprintf(stdout, color, "   ");
 	color_fprintf(stdout, color, "  %s\n", desc);
@@ -123,13 +129,16 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
 {
 	const char *color = PERF_COLOR_BLUE;
 	union hisi_ptt_4dw dw0;
+	uint8_t byte;
 	int i;
 
-	dw0.value = *(uint32_t *)(buf + pos);
+	dw0.value = le32_to_cpu(*(__le32 *)(buf + pos));
 	printf(".");
 	color_fprintf(stdout, color, "  %08x: ", pos);
-	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++)
-		color_fprintf(stdout, color, "%02x ", buf[pos + i]);
+	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
+		byte = (dw0.value >> (24 - i * 8)) & 0xFF;
+		color_fprintf(stdout, color, "%02x ", byte);
+	}
 	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
 		color_fprintf(stdout, color, "   ");
 
-- 
2.33.0


