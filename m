Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA58EC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rceV7nIx0a83YvsY958fdlZIzlO3BKMtZ6IZXuR+eKc=; b=rmE0cvHwTJGimIZ2CIEoGMvwZL
	QBhwGpR/s1J4eJb3RGn6Q7UlY8sTOeat2/DZyjBAWxEqGo+EroYsmMaDqiworjkZm2aivdMZcSVAj
	MnVi92Cl3ArBFpa0x0FbOrvsCpgQ+OORsJbIRj2B6zA2v/hOfcXKDc0eNP5kuR/q5AE4YarZjBW7E
	e0Zq18x3NGiodI4BMscHmgeq1Bv1/ZTVRb9VRoie8rXaV3SEPXMBMhy2wePtLkMyQtp4FbnBdGlsW
	TLoQ8AnoqFjrDTkMrSvtcIqQPNNWiEzFRrG1/MUCH6Kb7Jv6OpVAIrGx/pxwno81qO3pC7QEHy47Y
	DnCWLAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzajE-0000000473t-2iAP;
	Thu, 27 Aug 2026 14:05:16 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaiy-000000046xz-3xLD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 14:05:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rceV7nIx0a83YvsY958fdlZIzlO3BKMtZ6IZXuR+eKc=;
	b=RPcUY4Y3ei3Lxo5W8nXlYG3mCQ3vk0lniie0L9w5FhdYVJEEGkDb+E6TEGQ0d+6h4oy1NQP3Q
	OwbQ7YBkKU0f8wp2BM7+NSQYdlzWeyCxWmMZWNPE4Wl5dJ3zW2ArsbquhdItQ4Xb5ngIP/vkd2G
	+KYPqp+1bC2W07BOAGwXS7s=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hW30J4mZlzKmTp;
	Thu, 27 Aug 2026 21:54:08 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id ABE8840565;
	Thu, 27 Aug 2026 22:04:58 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 22:04:56 +0800
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
Subject: [PATCH v2 6/8] perf hisi-ptt: Add field-level parsing for header DW2/DW3
Date: Thu, 27 Aug 2026 22:04:40 +0800
Message-ID: <20260827140442.2031128-7-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260827140442.2031128-1-liusizhe5@huawei.com>
References: <20260827140442.2031128-1-liusizhe5@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_070501_386153_E90CA0FE 
X-CRM114-Status: GOOD (  14.48  )
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

Add field-level parsing of Header DW2 and DW3 of the TLP, separating
the layout for CFG TLPs and CPL TLPs. The message type parsed in the
previous patch is used to select the correct field layout.

DW2 fields are common to MWr/Msg/MsgD/FetchAdd/Swap/CAS/IORd/IOWr
TLPs, parsed with FIELD_GET() against HISI_PTT_HEAD2_* masks.

DW3 fields have two layouts:
- CfgRd0/CfgWr0/CfgRd1/CfgWr1 use HISI_PTT_HEAD3_CFG_* masks
- Cpl/CplD/CplLk/CplDlk use HISI_PTT_HEAD3_CPL_* masks

HiSilicon PCIe trace device hardware is responsible for packet collection,
parsing, extraction and fills the corresponding fields with the required
positions. The packet decoder software will perform the parsing and
printing of fields filled by hardware.

Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 111 ++++++++++++++++--
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  39 ++++++
 2 files changed, 141 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index e63fe1534693..de1d4071e209 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -197,6 +197,89 @@ static void hisi_ptt_print_head0(struct hisi_ptt_pkt_buf *pkt_buf)
 	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 }
 
+static void hisi_ptt_print_head1(struct hisi_ptt_pkt_buf *pkt_buf)
+{
+	/* Currently, no distinction here for 4DW foramt and 8DW format */
+	hisi_ptt_print_pkt(pkt_buf,
+			   hisi_ptt_4dw_pkt_field_name[HISI_PTT_4DW_HEAD1]);
+}
+
+static void hisi_ptt_print_head2(struct hisi_ptt_pkt_buf *pkt_buf)
+{
+	const char *color = PERF_COLOR_BLUE;
+	uint32_t dw;
+
+	dw = get_unaligned_le32(pkt_buf->buf + pkt_buf->pos);
+	hisi_ptt_print_raw_record(pkt_buf->pos, dw);
+
+	if (pkt_buf->pkt_msg_type == HISI_PTT_PKT_TYPE_MWR ||
+	    pkt_buf->pkt_msg_type == HISI_PTT_PKT_TYPE_MSG ||
+	    pkt_buf->pkt_msg_type == HISI_PTT_PKT_TYPE_ATOM ||
+	    pkt_buf->pkt_msg_type == HISI_PTT_PKT_TYPE_IO)
+		color_fprintf(stdout, color,
+			      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
+			      "Reserved",
+			      FIELD_GET(HISI_PTT_HEAD2_RESERVED, dw),
+			      "Request Segment",
+			      FIELD_GET(HISI_PTT_HEAD2_REQ_SEG, dw),
+			      "RSV", FIELD_GET(HISI_PTT_HEAD2_RSV, dw),
+			      "TV", FIELD_GET(HISI_PTT_HEAD2_TV, dw),
+			      "T", FIELD_GET(HISI_PTT_HEAD2_T, dw),
+			      "Tag", FIELD_GET(HISI_PTT_HEAD2_TAG, dw),
+			      "Header DW2",
+			      FIELD_GET(HISI_PTT_HEAD2_HEADER_DW2, dw));
+	else
+		color_fprintf(stdout, color, "  %s\n",
+			      pkt_buf->pkt_type == HISI_PTT_4DW_PKT ?
+			      hisi_ptt_4dw_pkt_field_name[HISI_PTT_4DW_HEAD2] :
+			      hisi_ptt_8dw_pkt_field_name[HISI_PTT_8DW_HEAD2]);
+
+	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
+}
+
+static void hisi_ptt_print_head3(struct hisi_ptt_pkt_buf *pkt_buf)
+{
+	const char *color = PERF_COLOR_BLUE;
+	uint32_t dw;
+
+	dw = get_unaligned_le32(pkt_buf->buf + pkt_buf->pos);
+	hisi_ptt_print_raw_record(pkt_buf->pos, dw);
+
+	if (pkt_buf->pkt_msg_type == HISI_PTT_PKT_TYPE_CPL)
+		color_fprintf(stdout, color,
+			      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
+			      "Destination Segment",
+			      FIELD_GET(HISI_PTT_HEAD3_CPL_DST_SEG, dw),
+			      "Completer Segment",
+			      FIELD_GET(HISI_PTT_HEAD3_CPL_CPL_SEG, dw),
+			      "DSV", FIELD_GET(HISI_PTT_HEAD3_CPL_DSV, dw),
+			      "Reserved",
+			      FIELD_GET(HISI_PTT_HEAD3_CPL_RESERVED, dw),
+			      "TV", FIELD_GET(HISI_PTT_HEAD3_CPL_TV, dw),
+			      "T", FIELD_GET(HISI_PTT_HEAD3_CPL_T, dw),
+			      "Tag", FIELD_GET(HISI_PTT_HEAD3_CPL_TAG, dw));
+	else if (pkt_buf->pkt_msg_type == HISI_PTT_PKT_TYPE_CFG)
+		color_fprintf(stdout, color,
+			      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
+			      "Reserved",
+			      FIELD_GET(HISI_PTT_HEAD3_CFG_RESERVED, dw),
+			      "Destination Segment",
+			      FIELD_GET(HISI_PTT_HEAD3_CFG_DST_SEG, dw),
+			      "DSV", FIELD_GET(HISI_PTT_HEAD3_CFG_DSV, dw),
+			      "TV", FIELD_GET(HISI_PTT_HEAD3_CFG_TV, dw),
+			      "T", FIELD_GET(HISI_PTT_HEAD3_CFG_T, dw),
+			      "Tag", FIELD_GET(HISI_PTT_HEAD3_CFG_TAG, dw),
+			      "Header DW3",
+			      FIELD_GET(HISI_PTT_HEAD3_CFG_HEADER_DW3, dw));
+	else
+		color_fprintf(stdout, color, "  %s\n",
+			      pkt_buf->pkt_type == HISI_PTT_4DW_PKT ?
+			      hisi_ptt_4dw_pkt_field_name[HISI_PTT_4DW_HEAD3] :
+			      hisi_ptt_8dw_pkt_field_name[HISI_PTT_8DW_HEAD3]);
+
+	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
+}
+
 static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	int i;
@@ -208,12 +291,24 @@ static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 			continue;
 		}
 
-		if (i == HISI_PTT_8DW_HEAD0) {
+		switch (i) {
+		case HISI_PTT_8DW_HEAD0:
 			hisi_ptt_print_head0(pkt_buf);
-			continue;
+			break;
+		case HISI_PTT_8DW_HEAD1:
+			hisi_ptt_print_head1(pkt_buf);
+			break;
+		case HISI_PTT_8DW_HEAD2:
+			hisi_ptt_print_head2(pkt_buf);
+			break;
+		case HISI_PTT_8DW_HEAD3:
+			hisi_ptt_print_head3(pkt_buf);
+			break;
+		default:
+			hisi_ptt_print_pkt(pkt_buf,
+					   hisi_ptt_8dw_pkt_field_name[i]);
+			break;
 		}
-
-		hisi_ptt_print_pkt(pkt_buf, hisi_ptt_8dw_pkt_field_name[i]);
 	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_8DW_PKT];
@@ -221,12 +316,10 @@ static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 
 static int hisi_ptt_4dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
-	int i;
-
 	hisi_ptt_print_head0(pkt_buf);
-
-	for (i = HISI_PTT_4DW_HEAD1; i < HISI_PTT_4DW_TYPE_MAX; i++)
-		hisi_ptt_print_pkt(pkt_buf, hisi_ptt_4dw_pkt_field_name[i]);
+	hisi_ptt_print_head1(pkt_buf);
+	hisi_ptt_print_head2(pkt_buf);
+	hisi_ptt_print_head3(pkt_buf);
 
 	return hisi_ptt_pkt_size[HISI_PTT_4DW_PKT];
 }
diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
index 9d98362d76b1..9663615ea3b5 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
@@ -31,6 +31,45 @@
 #define HISI_PTT_HEAD0_8DW_TYPE		GENMASK_U32(28, 24)
 #define HISI_PTT_HEAD0_8DW_FORMAT	GENMASK_U32(31, 29)
 
+/* Header DW2 fields for MWr/Msg/MsgD/FetchAdd/Swap/CAS/IORd/IOWr TLPs
+ *   bits   [   31   ][     30:23      ][22][21][20][  19:16  ][   15:0   ]
+ *          |---------|----------------|----|---|--|-----------|----------|
+ *   fields [Reserved][Request Segment][RSV][TV][T][Tag<13:10>][Header DW2]
+ */
+#define HISI_PTT_HEAD2_HEADER_DW2	GENMASK_U32(15, 0)
+#define HISI_PTT_HEAD2_TAG		GENMASK_U32(19, 16)
+#define HISI_PTT_HEAD2_T		BIT_U32(20)
+#define HISI_PTT_HEAD2_TV		BIT_U32(21)
+#define HISI_PTT_HEAD2_RSV		BIT_U32(22)
+#define HISI_PTT_HEAD2_REQ_SEG		GENMASK_U32(30, 23)
+#define HISI_PTT_HEAD2_RESERVED		BIT_U32(31)
+
+/* Header DW3 fields for CfgRd0/CfgWr0/CfgRd1/CfgWr1 TLPs
+ *   bits   [   31   ][       30:23        ][22][21][20][  19:16  ][   15:0   ]
+ *          |---------|--------------------|----|---|--|-----------|----------|
+ *   fields [Reserved][Destination Segment][DSV][TV][T][Tag<13:10>][Header DW3]
+ */
+#define HISI_PTT_HEAD3_CFG_HEADER_DW3	GENMASK_U32(15, 0)
+#define HISI_PTT_HEAD3_CFG_TAG		GENMASK_U32(19, 16)
+#define HISI_PTT_HEAD3_CFG_T		BIT_U32(20)
+#define HISI_PTT_HEAD3_CFG_TV		BIT_U32(21)
+#define HISI_PTT_HEAD3_CFG_DSV		BIT_U32(22)
+#define HISI_PTT_HEAD3_CFG_DST_SEG	GENMASK_U32(30, 23)
+#define HISI_PTT_HEAD3_CFG_RESERVED	BIT_U32(31)
+
+/* Header DW3 fields for Cpl/CplD/CplLk/CplDlk TLPs
+ *   bits   [       31:24       ][       23:16      ][15][  14:6   ][5][4][   3:0    ]
+ *          |--------------------|------------------|----|---------|--|---|----------|
+ *   fields [Destination Segment][Completer Segment][DSV][Reserved][TV][T][Tag<13:10>]
+ */
+#define HISI_PTT_HEAD3_CPL_TAG		GENMASK_U32(3, 0)
+#define HISI_PTT_HEAD3_CPL_T		BIT_U32(4)
+#define HISI_PTT_HEAD3_CPL_TV		BIT_U32(5)
+#define HISI_PTT_HEAD3_CPL_RESERVED	GENMASK_U32(14, 6)
+#define HISI_PTT_HEAD3_CPL_DSV		BIT_U32(15)
+#define HISI_PTT_HEAD3_CPL_CPL_SEG	GENMASK_U32(23, 16)
+#define HISI_PTT_HEAD3_CPL_DST_SEG	GENMASK_U32(31, 24)
+
 enum hisi_ptt_pkt_type {
 	HISI_PTT_4DW_PKT,
 	HISI_PTT_8DW_PKT,
-- 
2.33.0


