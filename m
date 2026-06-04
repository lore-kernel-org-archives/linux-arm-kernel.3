Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF292CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55jJZ4b6FSuLirTwSnzlWie3FXn/0XRNBJg5K5NHKg4=; b=KISuUdExlZCP3cgJ6w+6sj3iag
	tRFrzCOLNeP/+t1mv1cg/bvJpv0Qyd83zWmBhK4Ii+FTf8/ZAU2N5nUMMpat3GT6bKOnrI/nm7LhY
	s7LZrguY99G4TrhT7IU5jTE5QPBiC1/YK9+bb7Hd2TOQDqzbhBZFkc8iwyRhy88P9s02/5cd+/Ouv
	mXwSW/6RO+Dh2ADNuIzvhVT/WmtP1Mhu1FUxUMqJhcksgn2iKWi+7a1JLXexIUNpTPiaAas3e48mu
	Y5xUOsWpxUuoZ3F3KOAqO0tPscTZWUBxTCFx+n7NfOUnC55GgpeDpo+gzuFC1h9UHGOdwmpc1mvSA
	i5BdHUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2qO-0000000GKER-2Q5r;
	Thu, 04 Jun 2026 07:50:24 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2qI-0000000GKB2-01e6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:50:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=55jJZ4b6FSuLirTwSnzlWie3FXn/0XRNBJg5K5NHKg4=;
	b=ZB2LJn4YFeV80oHV762/e+OONkYFYD1eOfWhFoUtuv1IkW/vatj2/qd0acsc3xthVj0/QNOti
	5MYR0y+k2+dcgryJqQ6f5AeZqz7cLeynIY4/o0LICpEb45m963U6aBuNoMU2c9BHiqt4OOLffKH
	nT6kqwBLAiBLgyCSSG/bUB8=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gWGk46r9PzLlTV;
	Thu,  4 Jun 2026 15:42:20 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 196634055B;
	Thu,  4 Jun 2026 15:50:11 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:10 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:09 +0800
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
Subject: [PATCH 04/10] perf hisi-ptt: Abstract trace data buf and offset
Date: Thu, 4 Jun 2026 15:49:59 +0800
Message-ID: <20260604075005.2219785-5-liusizhe5@huawei.com>
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
X-CRM114-CacheID: sfid-20260604_005018_743840_66351F89 
X-CRM114-Status: GOOD (  13.91  )
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

Abstract the base address, current offset, length and packet type of
analysing trace data into structure hisi_ptt_pkt_buf and move the step
of current offset into the corresponding function.

Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 39 ++++++++++---------
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  9 ++++-
 tools/perf/util/hisi-ptt.c                    | 20 ++++------
 3 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index 5daae2eaf435..201ca948c4fb 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -89,16 +89,17 @@ union hisi_ptt_field_data {
 	uint32_t value;
 };
 
-static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *desc)
+static void hisi_ptt_print_pkt(struct hisi_ptt_pkt_buf *pkt_buf,
+			       const char *desc)
 {
 	const char *color = PERF_COLOR_BLUE;
 	uint32_t value;
 	uint8_t byte;
 	int i;
 
-	value = le32_to_cpu(*(__le32 *)(buf + pos));
+	value = le32_to_cpu(*(__le32 *)(pkt_buf->buf + pkt_buf->pos));
 	printf(".");
-	color_fprintf(stdout, color, "  %08x: ", pos);
+	color_fprintf(stdout, color, "  %08zx: ", pkt_buf->pos);
 	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
 		byte = (value >> (24 - i * 8)) & 0xFF;
 		color_fprintf(stdout, color, "%02x ", byte);
@@ -106,36 +107,36 @@ static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *de
 	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
 		color_fprintf(stdout, color, "   ");
 	color_fprintf(stdout, color, "  %s\n", desc);
+	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 }
 
-static int hisi_ptt_8dw_pkt_desc(const unsigned char *buf, int pos)
+static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	int i;
 
 	for (i = 0; i < HISI_PTT_8DW_TYPE_MAX; i++) {
 		/* Do not show 8DW check field and reserved fields */
 		if (i == HISI_PTT_8DW_CHK_AND_RSV0 || i == HISI_PTT_8DW_RSV1) {
-			pos += HISI_PTT_FIELD_LENGTH;
+			pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 			continue;
 		}
 
-		hisi_ptt_print_pkt(buf, pos, hisi_ptt_8dw_pkt_field_name[i]);
-		pos += HISI_PTT_FIELD_LENGTH;
+		hisi_ptt_print_pkt(pkt_buf, hisi_ptt_8dw_pkt_field_name[i]);
 	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_8DW_PKT];
 }
 
-static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
+static void hisi_ptt_4dw_print_dw0(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	const char *color = PERF_COLOR_BLUE;
 	union hisi_ptt_field_data dw;
 	uint8_t byte;
 	int i;
 
-	dw.value = le32_to_cpu(*(__le32 *)(buf + pos));
+	dw.value = le32_to_cpu(*(__le32 *)(pkt_buf->buf + pkt_buf->pos));
 	printf(".");
-	color_fprintf(stdout, color, "  %08x: ", pos);
+	color_fprintf(stdout, color, "  %08zx: ", pkt_buf->pos);
 	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
 		byte = (dw.value >> (24 - i * 8)) & 0xFF;
 		color_fprintf(stdout, color, "%02x ", byte);
@@ -149,27 +150,27 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
 		      "T9", dw.dw0_4dw.t9, "T8", dw.dw0_4dw.t8,
 		      "TH", dw.dw0_4dw.th, "SO", dw.dw0_4dw.so,
 		      "Length", dw.dw0_4dw.len, "Time", dw.dw0_4dw.time);
+
+	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 }
 
-static int hisi_ptt_4dw_pkt_desc(const unsigned char *buf, int pos)
+static int hisi_ptt_4dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	int i;
 
-	hisi_ptt_4dw_print_dw0(buf, pos);
-	pos += HISI_PTT_FIELD_LENGTH;
+	hisi_ptt_4dw_print_dw0(pkt_buf);
 
 	for (i = 0; i < HISI_PTT_4DW_TYPE_MAX; i++) {
-		hisi_ptt_print_pkt(buf, pos, hisi_ptt_4dw_pkt_field_name[i]);
-		pos += HISI_PTT_FIELD_LENGTH;
+		hisi_ptt_print_pkt(pkt_buf, hisi_ptt_4dw_pkt_field_name[i]);
 	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_4DW_PKT];
 }
 
-int hisi_ptt_pkt_desc(const unsigned char *buf, int pos, enum hisi_ptt_pkt_type type)
+int hisi_ptt_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
-	if (type == HISI_PTT_8DW_PKT)
-		return hisi_ptt_8dw_pkt_desc(buf, pos);
+	if (pkt_buf->pkt_type == HISI_PTT_8DW_PKT)
+		return hisi_ptt_8dw_pkt_desc(pkt_buf);
 
-	return hisi_ptt_4dw_pkt_desc(buf, pos);
+	return hisi_ptt_4dw_pkt_desc(pkt_buf);
 }
diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
index 6772b16b817b..316f24f01068 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
@@ -26,6 +26,13 @@ static int hisi_ptt_pkt_size[] = {
 	[HISI_PTT_8DW_PKT]	= 32,
 };
 
-int hisi_ptt_pkt_desc(const unsigned char *buf, int pos, enum hisi_ptt_pkt_type type);
+struct hisi_ptt_pkt_buf {
+	const unsigned char *buf;
+	size_t pos;
+	size_t len;
+	enum hisi_ptt_pkt_type pkt_type;
+};
+
+int hisi_ptt_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf);
 
 #endif
diff --git a/tools/perf/util/hisi-ptt.c b/tools/perf/util/hisi-ptt.c
index e4cc4785f744..4efda3f3e5f9 100644
--- a/tools/perf/util/hisi-ptt.c
+++ b/tools/perf/util/hisi-ptt.c
@@ -49,22 +49,18 @@ static void hisi_ptt_dump(struct hisi_ptt *ptt __maybe_unused,
 			  unsigned char *buf, size_t len)
 {
 	const char *color = PERF_COLOR_BLUE;
-	enum hisi_ptt_pkt_type type;
-	size_t pos = 0;
-	int pkt_len;
+	struct hisi_ptt_pkt_buf pkt_buf;
 
-	type = hisi_ptt_check_packet_type(buf);
-	len = round_down(len, hisi_ptt_pkt_size[type]);
+	pkt_buf.buf = buf;
+	pkt_buf.pos = 0;
+	pkt_buf.pkt_type = hisi_ptt_check_packet_type(buf);
+	pkt_buf.len = round_down(len, hisi_ptt_pkt_size[pkt_buf.pkt_type]);
 	color_fprintf(stdout, color, ". ... HISI PTT data: size %zu bytes\n",
-		      len);
+		      pkt_buf.len);
 
-	while (len > 0) {
-		pkt_len = hisi_ptt_pkt_desc(buf, pos, type);
-		if (!pkt_len)
+	while (pkt_buf.pos < pkt_buf.len) {
+		if (!hisi_ptt_pkt_desc(&pkt_buf))
 			color_fprintf(stdout, color, " Bad packet!\n");
-
-		pos += pkt_len;
-		len -= pkt_len;
 	}
 }
 
-- 
2.33.0


