Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CBFC61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSczr4ylEvSlzQsXP0yrTMydq03M/MKujUS1yI+lF+g=; b=B6tgFIJH0mWfwHjsuIHkFJWDVB
	6YBh2P7VgS9JxbSBhW3VkTum+btQwu9QE67PdXQ06xEZ/zqX+TGmNekBsK+yLoYdorJGIoIMYObGT
	M7r2vSJITx+7mrStISjz0cA2/IJOsXMiPssa6u79Lb6ZzRvZ/GguW5Q6LN825aOKp9AQrnQFxuNtA
	ofWi8egfNyt/F0JheG5B92e1usDixWVK16nrTCkr/I1dwy0OY/oS1HjcBxbRZpSDi6Xygt1/OkwRH
	tAAw2eCqFwEnf8FqkVNSBXoEvO7KMAT4q973sGj+BSkly6xfKAjmuQDnfWgCia1lOCFQKRAxfg/QZ
	9EFhOfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzajF-0000000474q-04H8;
	Thu, 27 Aug 2026 14:05:17 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaiw-000000046wl-0Adg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 14:05:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iSczr4ylEvSlzQsXP0yrTMydq03M/MKujUS1yI+lF+g=;
	b=E1RWijJDH2y6MtTQoBUDmPxKho5sLhlheqnfTQPRIKlgU4CI9NcgzRTNHJoO/vVQEAMBsJHHO
	0evMi/X6JS11oRIoqgdJPlOTxoeztshiPcEpsfmUFaFjssxGC+ErZ9cUDLZ6rYuJuLMMSvC+b9c
	GqD9X5HwfISgxYGamF5UvaQ=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hW3076lRpzKm8W;
	Thu, 27 Aug 2026 21:53:59 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id EDE9E40563;
	Thu, 27 Aug 2026 22:04:49 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 22:04:47 +0800
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
Subject: [PATCH v2 2/8] perf hisi-ptt: Complete the field names for 4DW and 8DW packets
Date: Thu, 27 Aug 2026 22:04:36 +0800
Message-ID: <20260827140442.2031128-3-liusizhe5@huawei.com>
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
X-CRM114-CacheID: sfid-20260827_070458_502110_EE166ED7 
X-CRM114-Status: GOOD (  12.17  )
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

Add the missing HISI_PTT_4DW_HEAD0 entry to the 4DW field name table
and add the HISI_PTT_8DW_CHK_AND_RSV0/HISI_PTT_8DW_RSV1 entries to
the 8DW field name table so that all DW indices have corresponding
names.

Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index ef72223d3854..766665414ad8 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -54,6 +54,7 @@ enum hisi_ptt_8dw_pkt_field_type {
 };
 
 enum hisi_ptt_4dw_pkt_field_type {
+	HISI_PTT_4DW_HEAD0,
 	HISI_PTT_4DW_HEAD1,
 	HISI_PTT_4DW_HEAD2,
 	HISI_PTT_4DW_HEAD3,
@@ -61,15 +62,18 @@ enum hisi_ptt_4dw_pkt_field_type {
 };
 
 static const char * const hisi_ptt_8dw_pkt_field_name[] = {
-	[HISI_PTT_8DW_PREFIX]	= "Prefix",
-	[HISI_PTT_8DW_HEAD0]	= "Header DW0",
-	[HISI_PTT_8DW_HEAD1]	= "Header DW1",
-	[HISI_PTT_8DW_HEAD2]	= "Header DW2",
-	[HISI_PTT_8DW_HEAD3]	= "Header DW3",
-	[HISI_PTT_8DW_TIME]	= "Time"
+	[HISI_PTT_8DW_CHK_AND_RSV0]	= "CHK & RSV0",
+	[HISI_PTT_8DW_PREFIX]		= "Prefix",
+	[HISI_PTT_8DW_HEAD0]		= "Header DW0",
+	[HISI_PTT_8DW_HEAD1]		= "Header DW1",
+	[HISI_PTT_8DW_HEAD2]		= "Header DW2",
+	[HISI_PTT_8DW_HEAD3]		= "Header DW3",
+	[HISI_PTT_8DW_RSV1]		= "RSV1",
+	[HISI_PTT_8DW_TIME]		= "Time"
 };
 
 static const char * const hisi_ptt_4dw_pkt_field_name[] = {
+	[HISI_PTT_4DW_HEAD0]	= "Header DW0",
 	[HISI_PTT_4DW_HEAD1]	= "Header DW1",
 	[HISI_PTT_4DW_HEAD2]	= "Header DW2",
 	[HISI_PTT_4DW_HEAD3]	= "Header DW3",
@@ -100,7 +104,7 @@ static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	int i;
 
-	for (i = 0; i < HISI_PTT_8DW_TYPE_MAX; i++) {
+	for (i = HISI_PTT_8DW_CHK_AND_RSV0; i < HISI_PTT_8DW_TYPE_MAX; i++) {
 		/* Do not show 8DW check field and reserved fields */
 		if (i == HISI_PTT_8DW_CHK_AND_RSV0 || i == HISI_PTT_8DW_RSV1) {
 			pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
@@ -150,7 +154,7 @@ static int hisi_ptt_4dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 
 	hisi_ptt_4dw_print_dw0(pkt_buf);
 
-	for (i = 0; i < HISI_PTT_4DW_TYPE_MAX; i++)
+	for (i = HISI_PTT_4DW_HEAD1; i < HISI_PTT_4DW_TYPE_MAX; i++)
 		hisi_ptt_print_pkt(pkt_buf, hisi_ptt_4dw_pkt_field_name[i]);
 
 	return hisi_ptt_pkt_size[HISI_PTT_4DW_PKT];
-- 
2.33.0


