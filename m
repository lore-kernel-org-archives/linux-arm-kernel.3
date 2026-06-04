Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A78ACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfAqjfAKuKALPlMmSy4yHgVtiTcX8QOSrT0p3ACFQnQ=; b=UEFmuYCm5aSbLweI1F+92MmmvW
	RNQwyau/5OOT1bRwzB77IkGzaaIqDcyiesGpjZbOmbn0jHTE7yy6+S2hbZiV1xL2zC+SDFTygoDeW
	BD72zeKIJcm26dYKu5y9PnxtHR5Wh2LPWxvWJe7k7WALZ6rWoHQ1yyCg38R/DzWwyYtqEf34sRv4a
	kjVYVk5Ks5gJOCCGwPLD/79iR26O2NOVJNA88k2GFn/Lr/poo8ow0oB3uKBKd+0ug8QyFKbG364JE
	SI8amxzKIfkmhlRjht/rWrF/dmBR7HQG3O4yhrksYYxGfUEDBxtAnXDxqJCAsd+dVjUFi5e4m2nZ7
	pc7sjaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2qM-0000000GKDA-1EOE;
	Thu, 04 Jun 2026 07:50:22 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2qI-0000000GKBE-01AM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:50:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GfAqjfAKuKALPlMmSy4yHgVtiTcX8QOSrT0p3ACFQnQ=;
	b=54CiqRORWSEtNm7PVg0ThWRYLX4tReDgiVK/tiq5D0YJEg/XV4YsNHBe+tJI4QnyYv3HDb3wp
	3kMekrSnEYu5eGtNJzpqJTlLkWEn4uriI/VCTK02G8sJQhTgYHEA7XfBAIJ01MOl7yzNUSwoA1P
	b++i2Ve9e+ud6Xon1LOQ258=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gWGk36LwFz12LKC;
	Thu,  4 Jun 2026 15:42:19 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F0F340572;
	Thu,  4 Jun 2026 15:50:15 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:14 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:13 +0800
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
Subject: [PATCH 08/10] perf hisi-ptt: Add parsing of supported message types
Date: Thu, 4 Jun 2026 15:50:03 +0800
Message-ID: <20260604075005.2219785-9-liusizhe5@huawei.com>
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
X-CRM114-CacheID: sfid-20260604_005018_743884_78105EA7 
X-CRM114-Status: GOOD (  14.86  )
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

Parse TLP message types from Header DW0 Format and Type fields for
both 4DW and 8DW formats, classifying packets into:
- MWr  (Posted Memory Write)
- Msg  (Posted Message)
- Atom (Non-Posted Atomic)
- IO   (Non-Posted IO)
- CFG  (Non-Posted Configuration)
- CPL  (Completion)

Support for those message types depends on the hisi_ptt hardware.
The parsed message type is stored in pkt_buf->pkt_msg_type and will
be used by subsequent patches to select the correct field layout for
DW2 and DW3 printing.

Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 65 +++++++++++++++++++
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   | 12 ++++
 tools/perf/util/hisi-ptt.c                    |  1 +
 3 files changed, 78 insertions(+)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index 9ec84d398cc1..59ab8ec3a03d 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -78,6 +78,37 @@ static const char * const hisi_ptt_4dw_pkt_field_name[] = {
 	[HISI_PTT_4DW_HEAD3]	= "Header DW3",
 };
 
+static bool hisi_ptt_is_mwr_tlp(uint32_t format, uint32_t type)
+{
+	return (format == 0x2 || format == 0x3) && (type == 0);
+}
+
+static bool hisi_ptt_is_msg_tlp(uint32_t format, uint32_t type)
+{
+	return (format == 0x1 || format == 0x3) && ((type & 0x10) != 0);
+}
+
+static bool hisi_ptt_is_io_tlp(uint32_t format, uint32_t type)
+{
+	return (format == 0 || format == 0x2) && (type == 0x2);
+}
+
+static bool hisi_ptt_is_atomic_tlp(uint32_t format, uint32_t type)
+{
+	return (format == 0x2 || format == 0x3) &&
+	       (type == 0xc || type == 0xd || type == 0xe);
+}
+
+static bool hisi_ptt_is_cfg_tlp(uint32_t format, uint32_t type)
+{
+	return (format == 0 || format == 0x2) && (type == 0x4 || type == 0x5);
+}
+
+static bool hisi_ptt_is_cpl_tlp(uint32_t format, uint32_t type)
+{
+	return (format == 0  || format == 0x2) && (type == 0xa || type == 0xb);
+}
+
 union hisi_ptt_field_data {
 	/* Header DW0 for 4DW format */
 	struct {
@@ -90,9 +121,41 @@ union hisi_ptt_field_data {
 		uint32_t type : 5;
 		uint32_t format : 2;
 	} dw0_4dw;
+	/* Header DW0 for 8DW format */
+	struct {
+		uint32_t others : 24;
+		uint32_t type : 5;
+		uint32_t format : 3;
+	} dw0_8dw;
 	uint32_t value;
 };
 
+static int hisi_ptt_parse_pkt_msg_type(union hisi_ptt_field_data dw,
+				       enum hisi_ptt_pkt_type pkt_type)
+{
+	uint32_t format, type;
+
+	format = (pkt_type == HISI_PTT_4DW_PKT) ? dw.dw0_4dw.format :
+						  dw.dw0_8dw.format;
+	type = (pkt_type == HISI_PTT_4DW_PKT) ? dw.dw0_4dw.type :
+						dw.dw0_8dw.type;
+
+	if (hisi_ptt_is_mwr_tlp(format, type))
+		return HISI_PTT_PKT_TYPE_MWR;
+	else if (hisi_ptt_is_msg_tlp(format, type))
+		return HISI_PTT_PKT_TYPE_MSG;
+	else if (hisi_ptt_is_atomic_tlp(format, type))
+		return HISI_PTT_PKT_TYPE_ATOM;
+	else if (hisi_ptt_is_io_tlp(format, type))
+		return HISI_PTT_PKT_TYPE_IO;
+	else if (hisi_ptt_is_cfg_tlp(format, type))
+		return HISI_PTT_PKT_TYPE_CFG;
+	else if (hisi_ptt_is_cpl_tlp(format, type))
+		return HISI_PTT_PKT_TYPE_CPL;
+
+	return HISI_PTT_PKT_TYPE_UNKNOWN;
+}
+
 static void hisi_ptt_print_raw_record(size_t offset, uint32_t value)
 {
 	const char *color = PERF_COLOR_BLUE;
@@ -128,6 +191,8 @@ static void hisi_ptt_print_head0(struct hisi_ptt_pkt_buf *pkt_buf)
 	union hisi_ptt_field_data dw;
 
 	dw.value = le32_to_cpu(*(__le32 *)(pkt_buf->buf + pkt_buf->pos));
+	pkt_buf->pkt_msg_type = hisi_ptt_parse_pkt_msg_type(dw,
+							    pkt_buf->pkt_type);
 	hisi_ptt_print_raw_record(pkt_buf->pos, dw.value);
 
 	if (pkt_buf->pkt_type == HISI_PTT_4DW_PKT)
diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
index 316f24f01068..3fdad34fe400 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
@@ -26,11 +26,23 @@ static int hisi_ptt_pkt_size[] = {
 	[HISI_PTT_8DW_PKT]	= 32,
 };
 
+enum hisi_ptt_pkt_msg_type {
+	HISI_PTT_PKT_TYPE_UNKNOWN,       /* Types do not support analysis */
+	HISI_PTT_PKT_TYPE_MWR,           /* P-(MemWr) */
+	HISI_PTT_PKT_TYPE_MSG,           /* P-(Message) */
+	HISI_PTT_PKT_TYPE_ATOM,          /* NP-(Atomic) */
+	HISI_PTT_PKT_TYPE_IO,            /* NP-(IO) */
+	HISI_PTT_PKT_TYPE_CFG,           /* NP-(CFG) */
+	HISI_PTT_PKT_TYPE_CPL,           /* CPL-(CPL) */
+	HISI_PTT_PKT_TYPE_MAX
+};
+
 struct hisi_ptt_pkt_buf {
 	const unsigned char *buf;
 	size_t pos;
 	size_t len;
 	enum hisi_ptt_pkt_type pkt_type;
+	enum hisi_ptt_pkt_msg_type pkt_msg_type;
 };
 
 int hisi_ptt_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf);
diff --git a/tools/perf/util/hisi-ptt.c b/tools/perf/util/hisi-ptt.c
index 4efda3f3e5f9..e321f393601b 100644
--- a/tools/perf/util/hisi-ptt.c
+++ b/tools/perf/util/hisi-ptt.c
@@ -55,6 +55,7 @@ static void hisi_ptt_dump(struct hisi_ptt *ptt __maybe_unused,
 	pkt_buf.pos = 0;
 	pkt_buf.pkt_type = hisi_ptt_check_packet_type(buf);
 	pkt_buf.len = round_down(len, hisi_ptt_pkt_size[pkt_buf.pkt_type]);
+	pkt_buf.pkt_msg_type = HISI_PTT_PKT_TYPE_UNKNOWN;
 	color_fprintf(stdout, color, ". ... HISI PTT data: size %zu bytes\n",
 		      pkt_buf.len);
 
-- 
2.33.0


