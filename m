Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEA6C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsAW4Y/4POJDEozhqKilBNthaSLPnb2LVwqqTwM9i00=; b=xT9DVjL+rVqhUVKNdIwr0RGV1K
	DALFAotVmAPCzki/lSDDRHcbSNWmft5e9UAQkb84SFc1UvHFXtTaLX9EuuVtIWije7tvqIDG2c2l6
	w88YVmzi8CDJaGLWAhMMFr/JhamwpOFy5tugsX/25CnG11P+5Cgvq9I65zXBtFf7DvtoKx4QuvhQ7
	4v2I70OeyRTTTCjhJD75AnECV1Kx5kTrFBuRKdxdlm5YOAMTlMZUSogK1Jo52RY5JkMu6G1+GwFgA
	syF0DEUTo62OnlEk+CkZOFEKSmeIosYqacllGQW3OCBOdBuCEc4OzSyX4xlJX8joRUaTDjqpGiHiH
	KLzMaWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKEv-00000009boE-25Y6;
	Thu, 30 Jul 2026 06:27:33 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKEm-00000009blt-2Tcs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 06:27:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qsAW4Y/4POJDEozhqKilBNthaSLPnb2LVwqqTwM9i00=;
	b=3NVTjOwjgsXkDoaLHGc0GKBiSPxSbUstMkS9NNvL38fnaqVg6kheyS2dhPp7U7QfSBVbMmCib
	Zm8IgioxmteZM4Jnu4XgfNjpBLXQIK/GjjGebmpNjorjSJyiyuPX58Ery4OKfn5XDO0TV6IVBWj
	Dk03saiqxYG9oMGyGlnKet8=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h9fBw0H7GzpSvB;
	Thu, 30 Jul 2026 14:18:00 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id DC39140537;
	Thu, 30 Jul 2026 14:27:18 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 30 Jul
 2026 14:27:16 +0800
From: Sizhe Liu <liusizhe5@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <bhelgaas@google.com>, <yangyccccc@gmail.com>,
	<jic23@kernel.org>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <wangyushan12@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <wuyifan50@huawei.com>, <liusizhe5@huawei.com>
Subject: [PATCH v2 2/3] perf hisi-ptt: Strengthen auxtrace event handling and packet type detection
Date: Thu, 30 Jul 2026 14:27:08 +0800
Message-ID: <20260730062709.534139-3-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260730062709.534139-1-liusizhe5@huawei.com>
References: <20260730062709.534139-1-liusizhe5@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_232724_996113_C6AE9D74 
X-CRM114-Status: GOOD (  16.39  )
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

Fix pre-existing robustness issues in the hisi-ptt auxtrace decoder
reported by Sashiko:

1. Endianness in hisi_ptt_check_packet_type(): The first 32-bit word was
read with a host-endian memory cast (*(uint32_t *)buf). On big-endian
hosts analyzing a little-endian trace, the bit[31:11] 8DW magic check
fails and every 8DW packet is misclassified as 4DW. Read the header
with get_unaligned_le32().

2. Heap out-of-bounds read: hisi_ptt_dump() called
hisi_ptt_check_packet_type() which dereferenced 4 bytes of the buffer
without any size check. A malformed or truncated event with
auxtrace.size in {0,1,2,3} may cause a heap OOB read. Pass the buffer
length to hisi_ptt_check_packet_type() and return (defaulting to
4DW) when the buffer is shorter than HISI_PTT_FIELD_LENTH.

3. Integer truncation: event->auxtrace.size is __u64 but was stored in
an int. Traces larger than 2GB became negative (malloc failure), and
huge sizes wrapping to a small positive caused a short readn() that
left unread payload in the pipe and permanently desynchronized the
stream. Use u64 for the size, reject anything larger than SSIZE_MAX
before malloc (same bound used by auxtrace_copy_data()), and compare
readn()'s return value against (ssize_t)size to detect truncation.

Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 tools/perf/util/hisi-ptt.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/hisi-ptt.c b/tools/perf/util/hisi-ptt.c
index e4cc4785f744..d6f48993fdd6 100644
--- a/tools/perf/util/hisi-ptt.c
+++ b/tools/perf/util/hisi-ptt.c
@@ -8,10 +8,12 @@
 #include <endian.h>
 #include <errno.h>
 #include <inttypes.h>
+#include <limits.h>
 #include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/log2.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <linux/zalloc.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -35,9 +37,15 @@ struct hisi_ptt {
 	u32 pmu_type;
 };
 
-static enum hisi_ptt_pkt_type hisi_ptt_check_packet_type(unsigned char *buf)
+static enum hisi_ptt_pkt_type hisi_ptt_check_packet_type(unsigned char *buf,
+							 size_t len)
 {
-	uint32_t head = *(uint32_t *)buf;
+	uint32_t head;
+
+	if (len < HISI_PTT_FIELD_LENTH)
+		return HISI_PTT_4DW_PKT;
+
+	head = get_unaligned_le32(buf);
 
 	if ((HISI_PTT_8DW_CHECK_MASK & head) == HISI_PTT_IS_8DW_PKT)
 		return HISI_PTT_8DW_PKT;
@@ -53,7 +61,7 @@ static void hisi_ptt_dump(struct hisi_ptt *ptt __maybe_unused,
 	size_t pos = 0;
 	int pkt_len;
 
-	type = hisi_ptt_check_packet_type(buf);
+	type = hisi_ptt_check_packet_type(buf, len);
 	len = round_down(len, hisi_ptt_pkt_size[type]);
 	color_fprintf(stdout, color, ". ... HISI PTT data: size %zu bytes\n",
 		      len);
@@ -91,11 +99,15 @@ static int hisi_ptt_process_auxtrace_event(struct perf_session *session,
 	struct hisi_ptt *ptt = container_of(session->auxtrace, struct hisi_ptt,
 					    auxtrace);
 	int fd = perf_data__fd(session->data);
-	int size = event->auxtrace.size;
-	void *data = malloc(size);
+	u64 size = event->auxtrace.size;
 	off_t data_offset;
-	int err;
+	ssize_t err;
+	void *data;
+
+	if (size > SSIZE_MAX)
+		return -EINVAL;
 
+	data = malloc(size);
 	if (!data)
 		return -errno;
 
-- 
2.33.0


