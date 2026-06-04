Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC9FCD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWe+vZO8oMF8iNfLKj+yBqRETDq4Lrm39k4z5xsUJ0I=; b=Yz8ntR0zNzD6t6AerfcDg84Qjk
	qio6ArtCJxbhnSRm+WDrr9dPS33oQCjahS1CVV5DvmJJSRK8AaczPiUfwGSr9BYctZ8aGwk0tVD8n
	Fl/mgf6g1kQ19tgunBAlU20VlftK5JoD1rMXR+267ZIpkjEp3LEIMAQg0Jd+uFsaO0reRBrGf+xRg
	LNkSiT6U1c2vGw3jAoQfyfllIP9hAMqvPOwwGW3nFOlunpfuIJIFXTSaE7cj7geRRmpzRMjF36nJh
	1ViUVpPD3ndm9LsyPKIC7gtYsyqckcMKmKZGQRa1rKy0Qbz9n8AnCwRDPuKrlBw6Oo8gzCxWMk/cj
	KkA6psRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2sK-0000000GKro-2q1T;
	Thu, 04 Jun 2026 07:52:24 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2sH-0000000GKB3-3QRD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:52:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cWe+vZO8oMF8iNfLKj+yBqRETDq4Lrm39k4z5xsUJ0I=;
	b=Pn03m0U8N/O5z/ABeFdtW7TR4YtFtE2huApdQvQBo84LcKAuMZzPV3ocTwkNuWCyUav7KyR+F
	8O8TnRIteVURwaBao6wRavJHRONmJ+ZV3bBJ09uek8Eguj+Gl+BuADSq8aJntiYizUO5XWByfNX
	OajjJrrgtClaQstRSd9dSGk=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gWGjz4fbWznTY6;
	Thu,  4 Jun 2026 15:42:15 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C6F940565;
	Thu,  4 Jun 2026 15:50:08 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:08 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:06 +0800
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
Subject: [PATCH 01/10] perf hisi-ptt: Fix spelling and abbreviation errors
Date: Thu, 4 Jun 2026 15:49:56 +0800
Message-ID: <20260604075005.2219785-2-liusizhe5@huawei.com>
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
X-CRM114-CacheID: sfid-20260604_005222_560988_CA51ED06 
X-CRM114-Status: GOOD (  12.94  )
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

Fix spelling and abbreviation errors in the PTT packet decoder:
- HISI_PTT_FIELD_LENTH -> HISI_PTT_FIELD_LENGTH
- hisi_ptt_8dw_kpt_desc -> hisi_ptt_8dw_pkt_desc
- hisi_ptt_4dw_kpt_desc -> hisi_ptt_4dw_pkt_desc

Cc: stable@vger.kernel.org
Fixes: 5e91e57e6809 ("perf auxtrace arm64: Add support for parsing HiSilicon PCIe Trace packet")
Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 20 +++++++++----------
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index a17c423a526d..c48b2ce7c4a3 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -94,26 +94,26 @@ static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *de
 
 	printf(".");
 	color_fprintf(stdout, color, "  %08x: ", pos);
-	for (i = 0; i < HISI_PTT_FIELD_LENTH; i++)
+	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++)
 		color_fprintf(stdout, color, "%02x ", buf[pos + i]);
 	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
 		color_fprintf(stdout, color, "   ");
 	color_fprintf(stdout, color, "  %s\n", desc);
 }
 
-static int hisi_ptt_8dw_kpt_desc(const unsigned char *buf, int pos)
+static int hisi_ptt_8dw_pkt_desc(const unsigned char *buf, int pos)
 {
 	int i;
 
 	for (i = 0; i < HISI_PTT_8DW_TYPE_MAX; i++) {
 		/* Do not show 8DW check field and reserved fields */
 		if (i == HISI_PTT_8DW_CHK_AND_RSV0 || i == HISI_PTT_8DW_RSV1) {
-			pos += HISI_PTT_FIELD_LENTH;
+			pos += HISI_PTT_FIELD_LENGTH;
 			continue;
 		}
 
 		hisi_ptt_print_pkt(buf, pos, hisi_ptt_8dw_pkt_field_name[i]);
-		pos += HISI_PTT_FIELD_LENTH;
+		pos += HISI_PTT_FIELD_LENGTH;
 	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_8DW_PKT];
@@ -128,7 +128,7 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
 	dw0.value = *(uint32_t *)(buf + pos);
 	printf(".");
 	color_fprintf(stdout, color, "  %08x: ", pos);
-	for (i = 0; i < HISI_PTT_FIELD_LENTH; i++)
+	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++)
 		color_fprintf(stdout, color, "%02x ", buf[pos + i]);
 	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
 		color_fprintf(stdout, color, "   ");
@@ -140,16 +140,16 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
 		      dw0.len, "Time", dw0.time);
 }
 
-static int hisi_ptt_4dw_kpt_desc(const unsigned char *buf, int pos)
+static int hisi_ptt_4dw_pkt_desc(const unsigned char *buf, int pos)
 {
 	int i;
 
 	hisi_ptt_4dw_print_dw0(buf, pos);
-	pos += HISI_PTT_FIELD_LENTH;
+	pos += HISI_PTT_FIELD_LENGTH;
 
 	for (i = 0; i < HISI_PTT_4DW_TYPE_MAX; i++) {
 		hisi_ptt_print_pkt(buf, pos, hisi_ptt_4dw_pkt_field_name[i]);
-		pos += HISI_PTT_FIELD_LENTH;
+		pos += HISI_PTT_FIELD_LENGTH;
 	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_4DW_PKT];
@@ -158,7 +158,7 @@ static int hisi_ptt_4dw_kpt_desc(const unsigned char *buf, int pos)
 int hisi_ptt_pkt_desc(const unsigned char *buf, int pos, enum hisi_ptt_pkt_type type)
 {
 	if (type == HISI_PTT_8DW_PKT)
-		return hisi_ptt_8dw_kpt_desc(buf, pos);
+		return hisi_ptt_8dw_pkt_desc(buf, pos);
 
-	return hisi_ptt_4dw_kpt_desc(buf, pos);
+	return hisi_ptt_4dw_pkt_desc(buf, pos);
 }
diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
index e78f1b5bc836..6772b16b817b 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
@@ -13,7 +13,7 @@
 #define HISI_PTT_8DW_CHECK_MASK		GENMASK(31, 11)
 #define HISI_PTT_IS_8DW_PKT		GENMASK(31, 11)
 #define HISI_PTT_MAX_SPACE_LEN		10
-#define HISI_PTT_FIELD_LENTH		4
+#define HISI_PTT_FIELD_LENGTH		4
 
 enum hisi_ptt_pkt_type {
 	HISI_PTT_4DW_PKT,
-- 
2.33.0


