Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5790C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqr9TBBigcc7SJqP6XB+xbJPVqGbbMmN+1rNcOTnL2A=; b=3W6mtE9EwCVd7s4IRLVcDc2wlr
	t8HeMm66gWxCBpS/acCKpa8flJKjjViYyqNjr8e34qGLpS5Rd/2mMy+rQmq8oHdLlk4dIRDDSrbnI
	twz792flLbC3Q0KkBwOX3eS1LnI+aY7/mKfx0PS1P88mXLlGTJWG4nEixDwdCD+7I+iLJuInPoEU0
	SiQ2z51rXrCHyognV/4VpmIKT3h/vky1JtiVFyIQkaAKlaD6/44bchN2z2xJNmMrxJCO82fCOdvzk
	fzX3lJNN2JQ9Ng/oBCpG1SmtLz7CDJuYQJ0iOqgYqMfmA2rVmhgIvOSLDe6qliitKgRMjsI3PQO6W
	aWY9hRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Fv-0000000Gh5w-2qGJ;
	Thu, 03 Sep 2026 07:53:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Fu-0000000Gh4R-2Ccz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 07:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nqr9TBBigcc7SJqP6XB+xbJPVqGbbMmN+1rNcOTnL2A=; b=EdWyGnfOfVhwITQaL+wyb7EofA
	Q+1xDttkYez+4H7PN31s0+T38dnb/BFRKw5+lQS+sgTO9M0VPtne8T2ubPnrFK0Qr7jHOpnFsMhr2
	Y7EBHQEbL3kcXFUTvauRC7SdD1v8zlAQS948TipzDnLKCvu854kS3bQv/DCL2+G7u5oUnJrAN9g8f
	GeNC2VpjnN99rxmw6zKrJN6McvMQIFdy75qnbLDdWR7DujkAyKlVZeZRd12yVMSwVz7pd1e3mJtDb
	+ksGpugfX6Fmdoa6Yg9Kw52U5bnJg341UgCr3T5vZuoZBMN1jdt18zyJqBolROwD/yBMbVcKdG+ib
	vKMp/y+w==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x22Fq-0000000CoqM-1PuO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:53:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nqr9TBBigcc7SJqP6XB+xbJPVqGbbMmN+1rNcOTnL2A=;
	b=jBwqgwJtVfe9inJ4dmzuHrOdNq6IDZsBgiO9dMw3efucJ2H5vj8KySaCBtWt9RGQvy3Y0pako
	EsT8jn896psc/jT+UDtl+ozNuE64AVZf5efstapAGVFiiH2awjXOY3eRsWNdBHl2l6Qntm/PYol
	b8XP5tPAO837O9Kqlq/tb+U=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hbBPp3k8sz1cyR3;
	Thu,  3 Sep 2026 15:42:06 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id 66FF44055B;
	Thu,  3 Sep 2026 15:52:56 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 15:52:53 +0800
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
	<wuzongyu1@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <liusizhe5@huawei.com>
Subject: [PATCH v3 5/8] perf hisi-ptt: Add parsing of supported message types
Date: Thu, 3 Sep 2026 15:52:38 +0800
Message-ID: <20260903075241.1445338-6-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260903075241.1445338-1-liusizhe5@huawei.com>
References: <20260903075241.1445338-1-liusizhe5@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_085302_999057_7A266CDE 
X-CRM114-Status: GOOD (  14.87  )
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

Classify TLP messages by Header DW0 Format field and Type field for
both 4DW and 8DW formats, according to PCIe r6.4 sec 2.2.1.1 & 2.2.1.2.

Parsing packets into:
- MWr  (Posted Memory Write request)
- Msg  (Posted Message request)
- Atom (Non-Posted Atomic request)
- IO   (Non-Posted IO request)
- CFG  (Non-Posted Configuration request)
- CPL  (Completion request)

The parsed message type is stored in pkt_buf->pkt_msg_type and will
be used by subsequent patches to select the correct field layout for
DW2 and DW3 printing.

Reviewed-by: Yushan Wang <wangyushan12@huawei.com>
Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 62 +++++++++++++++++++
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   | 17 +++++
 tools/perf/util/hisi-ptt.c                    |  1 +
 3 files changed, 80 insertions(+)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index 00bd9309df68..e63fe1534693 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -79,6 +79,66 @@ static const char * const hisi_ptt_4dw_pkt_field_name[] = {
 	[HISI_PTT_4DW_HEAD3]	= "Header DW3",
 };
 
+/* TLP message parsers below according to PCIe r6.4 sec 2.2.1.1 & 2.2.1.2 */
+static bool hisi_ptt_is_mwr_tlp(uint32_t format, uint32_t type)
+{
+	return (format == 0x2 || format == 0x3) && (type == 0);
+}
+
+static bool hisi_ptt_is_msg_tlp(uint32_t format, uint32_t type)
+{
+	return (format == 0x1 || format == 0x3) && ((type & 0x18) == 0x10);
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
+static int hisi_ptt_parse_pkt_msg_type(uint32_t dw,
+				       enum hisi_ptt_pkt_type pkt_type)
+{
+	uint32_t format, type;
+
+	format = (pkt_type == HISI_PTT_4DW_PKT) ?
+		  FIELD_GET(HISI_PTT_HEAD0_4DW_FORMAT, dw) :
+		  FIELD_GET(HISI_PTT_HEAD0_8DW_FORMAT, dw);
+	type = (pkt_type == HISI_PTT_4DW_PKT) ?
+		FIELD_GET(HISI_PTT_HEAD0_4DW_TYPE, dw) :
+		FIELD_GET(HISI_PTT_HEAD0_8DW_TYPE, dw);
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
@@ -114,6 +174,8 @@ static void hisi_ptt_print_head0(struct hisi_ptt_pkt_buf *pkt_buf)
 	uint32_t dw;
 
 	dw = get_unaligned_le32(pkt_buf->buf + pkt_buf->pos);
+	pkt_buf->pkt_msg_type = hisi_ptt_parse_pkt_msg_type(dw,
+							    pkt_buf->pkt_type);
 	hisi_ptt_print_raw_record(pkt_buf->pos, dw);
 
 	if (pkt_buf->pkt_type == HISI_PTT_4DW_PKT)
diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
index 6747878b030e..436712e67a6f 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
@@ -7,6 +7,7 @@
 #ifndef INCLUDE__HISI_PTT_PKT_DECODER_H__
 #define INCLUDE__HISI_PTT_PKT_DECODER_H__
 
+#include <stdbool.h>
 #include <stddef.h>
 #include <stdint.h>
 #include <linux/bits.h>
@@ -27,6 +28,10 @@
 #define HISI_PTT_HEAD0_4DW_TYPE		GENMASK_U32(29, 25)
 #define HISI_PTT_HEAD0_4DW_FORMAT	GENMASK_U32(31, 30)
 
+/* Header DW0 fields for 8DW format */
+#define HISI_PTT_HEAD0_8DW_TYPE		GENMASK_U32(28, 24)
+#define HISI_PTT_HEAD0_8DW_FORMAT	GENMASK_U32(31, 29)
+
 enum hisi_ptt_pkt_type {
 	HISI_PTT_4DW_PKT,
 	HISI_PTT_8DW_PKT,
@@ -38,11 +43,23 @@ static int hisi_ptt_pkt_size[] = {
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
index ea659947c27f..78817ae7a8ea 100644
--- a/tools/perf/util/hisi-ptt.c
+++ b/tools/perf/util/hisi-ptt.c
@@ -63,6 +63,7 @@ static void hisi_ptt_dump(struct hisi_ptt *ptt __maybe_unused,
 	pkt_buf.pos = 0;
 	pkt_buf.pkt_type = hisi_ptt_check_packet_type(buf, len);
 	pkt_buf.len = round_down(len, hisi_ptt_pkt_size[pkt_buf.pkt_type]);
+	pkt_buf.pkt_msg_type = HISI_PTT_PKT_TYPE_UNKNOWN;
 	color_fprintf(stdout, color, ". ... HISI PTT data: size %zu bytes\n",
 		      pkt_buf.len);
 
-- 
2.33.0


