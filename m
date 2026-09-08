Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C010C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHFtsegYkSXAAQ6VLTBIGRfXAcm81uMjTTor0MXHuTI=; b=Aeso2S7gxSElGPQvg6cBcRQr1A
	/lp0W9v66xa5pDwjY+TstzSmieauPFs9Vwf6btJubyuktFguMvsf6+m+Gg63GVCernCotil2vZeoT
	GaN7Ac0tut30h6XtvQsHnl2wZZF11+tyrmOajqDlRG49OuiDQZfyUuuG2S1lE4qnJ1l/i2JR3CFtV
	tNXPacrn3QtlOq5N5ows4vap35TA91ESr3kdoU7KJIhcWeAjZJ8dGc4coUonzco9TWW0dPQJw5qEV
	83knbHwz4xYZx0U1mK7y0KdTdb4IiGQ8yHmMLLKauEcneg2qKXAh0t7L4OZaObXy4+/CKpDX84tHo
	muNEpD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wS6-00000009EDE-42PZ;
	Tue, 08 Sep 2026 14:05:34 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wS0-00000009EAy-1rJd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:05:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SHFtsegYkSXAAQ6VLTBIGRfXAcm81uMjTTor0MXHuTI=;
	b=KWuF6IC6bGKi3ranAbI8gv4Ii8gUY2i6kQGwdMJTdCvr84XKLmPVUEiqnlsqQezcuJF0YoE9V
	n+IXuXFtWfSPpwbhu1sHzejM/vwmpPiFHKShH/JP3LT0DdkhFBdE+eZ0at7vhrFHa4xhAltw2w9
	zzRxS6N5Gufcj4+3IEI7YS8=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hfQR204Zsz1prlJ;
	Tue,  8 Sep 2026 21:54:22 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id 691AE4057A;
	Tue,  8 Sep 2026 22:05:17 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 22:05:14 +0800
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
Subject: [PATCH v4 2/8] perf hisi-ptt: Complete the field names for 4DW and 8DW packets
Date: Tue, 8 Sep 2026 22:05:03 +0800
Message-ID: <20260908140509.2485649-3-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260908140509.2485649-1-liusizhe5@huawei.com>
References: <20260908140509.2485649-1-liusizhe5@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_070530_512118_C297111F 
X-CRM114-Status: GOOD (  12.02  )
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

Reviewed-by: Yushan Wang <wangyushan12@huawei.com>
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


