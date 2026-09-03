Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513C0C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQMRWjJVk821g2t06PS1R48o+Gaj+3LX6g+X1hR1mf4=; b=o8wjPl13kAZKkqBJfWTShZp2jX
	yW0GlCdB7ypv8nvGdE8VvC9dEDE2QdwFVCSQccH0J7jKDDLNpbX+BFFPJYXOO+asmVyrFj2YR7OKH
	K1ScHnIA48WOiwHBSDPbBF2ZNzhVjFyR0TLhnW52TkiwR1GL/ur4kyCmKIgCNhAUM0Pjv4/O4sjzO
	OpIvLTp0LfI2EJfVu+4toXz6rYUllbucu0j9M6o3FPTaKuYPNJFOUiLjwOi4Km7EOmE9S5PMWA5J9
	WTlVL+3jfEqdSERwYoFzKTzqIKLuxyhFFe86QkCk7rG4TtnuApjN3/1gAI1TLsK0JvkR9adbLTR3J
	LPe2x6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Fy-0000000Gh8l-3iGr;
	Thu, 03 Sep 2026 07:53:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Fx-0000000Gh7A-3jKS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 07:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fQMRWjJVk821g2t06PS1R48o+Gaj+3LX6g+X1hR1mf4=; b=hnQYHcd2H9PpQOq5pdhGcCIhHD
	X3fBSuYRUTnEaUaKnlzVWxOvH4nalrLpcErH8TkyvrPiwjIJwlSkCmjH+N9sYsxN79BjL70inXZH/
	U+krqFoMONEkMEUMc/KUy+jwwk6MHBKaX1pjgL1H/DRIYdOO5p1lh+ENOa/P7WERMq4gIc0rP3VFe
	7XJKDAgggpu68k1l/omp67Mh7nt1cUNkF2Ip/kdpoBiha7BdfEK+JLhY+LC5pK8DgTSgFdERj5p63
	61rhm9+mJPvbz0hMI6Pr96qc2HfYRfoDUmxtRw6ame/txLb1QKoMVKcMmVynpDo2aK1A1vC7Xq5ZL
	PkST0kdA==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x22Fr-0000000CoqH-3HKE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:53:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fQMRWjJVk821g2t06PS1R48o+Gaj+3LX6g+X1hR1mf4=;
	b=tgURI+w0BRHAgHaFEqonxW3WaXwFvR8Nr4fP1kW36eaVjpi2Z++0O68vEaNmNsnSgSN8fDvGG
	fFnYzTp9ffm6eJmJrDlkl/CjZlOsihUCbfi/cDDB7f588uCXwhDG9OLXsUFwmGT83BVB/tDjWgc
	xYTUr6tI2nk1MTIu/HT/aX0=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hbBPp5zWMzcbQq;
	Thu,  3 Sep 2026 15:42:06 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id 344A44057F;
	Thu,  3 Sep 2026 15:52:54 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 15:52:51 +0800
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
Subject: [PATCH v3 4/8] perf hisi-ptt: Merge 4DW and 8DW HEAD0 printing
Date: Thu, 3 Sep 2026 15:52:37 +0800
Message-ID: <20260903075241.1445338-5-liusizhe5@huawei.com>
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
X-CRM114-CacheID: sfid-20260903_085304_478283_8EE1BDD7 
X-CRM114-Status: GOOD (  11.66  )
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

Merge the printing of HEAD0 for both 4DW and 8DW TLP headers into
hisi_ptt_print_head0(). This unifies the entry point and makes it
easier to add HEAD1/HEAD2/HEAD3 field parsing in subsequent patches.

Reviewed-by: Yushan Wang <wangyushan12@huawei.com>
Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 56 +++++++++++--------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index 23ae99f33c9f..00bd9309df68 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -108,6 +108,33 @@ static void hisi_ptt_print_pkt(struct hisi_ptt_pkt_buf *pkt_buf,
 	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 }
 
+static void hisi_ptt_print_head0(struct hisi_ptt_pkt_buf *pkt_buf)
+{
+	const char *color = PERF_COLOR_BLUE;
+	uint32_t dw;
+
+	dw = get_unaligned_le32(pkt_buf->buf + pkt_buf->pos);
+	hisi_ptt_print_raw_record(pkt_buf->pos, dw);
+
+	if (pkt_buf->pkt_type == HISI_PTT_4DW_PKT)
+		color_fprintf(stdout, color,
+			      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
+			      "Format",
+			      FIELD_GET(HISI_PTT_HEAD0_4DW_FORMAT, dw),
+			      "Type", FIELD_GET(HISI_PTT_HEAD0_4DW_TYPE, dw),
+			      "T9", FIELD_GET(HISI_PTT_HEAD0_4DW_T9, dw),
+			      "T8", FIELD_GET(HISI_PTT_HEAD0_4DW_T8, dw),
+			      "TH", FIELD_GET(HISI_PTT_HEAD0_4DW_TH, dw),
+			      "SO", FIELD_GET(HISI_PTT_HEAD0_4DW_SO, dw),
+			      "Length", FIELD_GET(HISI_PTT_HEAD0_4DW_LEN, dw),
+			      "Time", FIELD_GET(HISI_PTT_HEAD0_4DW_TIME, dw));
+	else
+		color_fprintf(stdout, color, "  %s\n",
+			      hisi_ptt_8dw_pkt_field_name[HISI_PTT_8DW_HEAD0]);
+
+	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
+}
+
 static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	int i;
@@ -119,39 +146,22 @@ static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 			continue;
 		}
 
+		if (i == HISI_PTT_8DW_HEAD0) {
+			hisi_ptt_print_head0(pkt_buf);
+			continue;
+		}
+
 		hisi_ptt_print_pkt(pkt_buf, hisi_ptt_8dw_pkt_field_name[i]);
 	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_8DW_PKT];
 }
 
-static void hisi_ptt_4dw_print_dw0(struct hisi_ptt_pkt_buf *pkt_buf)
-{
-	const char *color = PERF_COLOR_BLUE;
-	uint32_t dw;
-
-	dw = get_unaligned_le32(pkt_buf->buf + pkt_buf->pos);
-	hisi_ptt_print_raw_record(pkt_buf->pos, dw);
-
-	color_fprintf(stdout, color,
-		      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
-		      "Format", FIELD_GET(HISI_PTT_HEAD0_4DW_FORMAT, dw),
-		      "Type", FIELD_GET(HISI_PTT_HEAD0_4DW_TYPE, dw),
-		      "T9", FIELD_GET(HISI_PTT_HEAD0_4DW_T9, dw),
-		      "T8", FIELD_GET(HISI_PTT_HEAD0_4DW_T8, dw),
-		      "TH", FIELD_GET(HISI_PTT_HEAD0_4DW_TH, dw),
-		      "SO", FIELD_GET(HISI_PTT_HEAD0_4DW_SO, dw),
-		      "Length", FIELD_GET(HISI_PTT_HEAD0_4DW_LEN, dw),
-		      "Time", FIELD_GET(HISI_PTT_HEAD0_4DW_TIME, dw));
-
-	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
-}
-
 static int hisi_ptt_4dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	int i;
 
-	hisi_ptt_4dw_print_dw0(pkt_buf);
+	hisi_ptt_print_head0(pkt_buf);
 
 	for (i = HISI_PTT_4DW_HEAD1; i < HISI_PTT_4DW_TYPE_MAX; i++)
 		hisi_ptt_print_pkt(pkt_buf, hisi_ptt_4dw_pkt_field_name[i]);
-- 
2.33.0


