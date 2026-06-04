Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE279CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0bZ6/5IF5u6IblAtoXo0vDn8/JhU8/jFh51QnHbslU=; b=0/Bs/oh77rpLqbVx2c2PzosZL0
	9jspri8YB+KoWC+w+bdS2LAPkXrX7gdM28n+QUNlu+7ywcWICwkNiOLN57FHjqseYIiLrFdUlAv9e
	YtfYfvKveHX2kL30X3ckew3hZTF6B1dtEEgTP4wHd//MTsnIsuA/51pbnsTzZoaXidi1EebhyZaPY
	ztveH96Oc937qqst2ysevf6m1F9U1YSxyqVj2vxDnbdRkZ9aEOa59dqPv1iQrneD+VJeCs3bPb78r
	0AbmQ6pbZsiXkRtrMEIp7RhL+Kt+5dxU/bymif7xhJmbrx5W3hce+yoHusNB+GuF5kNWdxDxnG1q/
	h0g8VD7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2sK-0000000GKrY-2Jbl;
	Thu, 04 Jun 2026 07:52:24 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2sH-0000000GKBB-13gN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:52:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U0bZ6/5IF5u6IblAtoXo0vDn8/JhU8/jFh51QnHbslU=;
	b=wkgUTtvcqEqDW31caCt5WvhxzdZJkB2iN2lbhp5RtvQUsgWZLl/iVTR44OwRC6w6WjZunmttz
	+79tkYmqdUVEVyWorwp+I0e810IT1jdrXQy9sJhXbOCjDluvQLSaifLXbTUNnXywGmDlvQ/kY6n
	y7xmAWuqpclxcp8ztcNTHG4=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gWGk62qtPzmVW0;
	Thu,  4 Jun 2026 15:42:22 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 24B4440561;
	Thu,  4 Jun 2026 15:50:14 +0800 (CST)
Received: from kwepemn200012.china.huawei.com (7.202.194.135) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 15:50:13 +0800
Received: from huawei.com (10.50.163.32) by kwepemn200012.china.huawei.com
 (7.202.194.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jun
 2026 15:50:12 +0800
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
Subject: [PATCH 07/10] perf hisi-ptt: Merge 4DW and 8DW HEAD0 printing
Date: Thu, 4 Jun 2026 15:50:02 +0800
Message-ID: <20260604075005.2219785-8-liusizhe5@huawei.com>
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
X-CRM114-CacheID: sfid-20260604_005221_690472_B3619559 
X-CRM114-Status: GOOD (  10.79  )
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

Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 49 ++++++++++++-------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index a5b66e0f7827..9ec84d398cc1 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -122,6 +122,30 @@ static void hisi_ptt_print_pkt(struct hisi_ptt_pkt_buf *pkt_buf,
 	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 }
 
+static void hisi_ptt_print_head0(struct hisi_ptt_pkt_buf *pkt_buf)
+{
+	const char *color = PERF_COLOR_BLUE;
+	union hisi_ptt_field_data dw;
+
+	dw.value = le32_to_cpu(*(__le32 *)(pkt_buf->buf + pkt_buf->pos));
+	hisi_ptt_print_raw_record(pkt_buf->pos, dw.value);
+
+	if (pkt_buf->pkt_type == HISI_PTT_4DW_PKT)
+		color_fprintf(stdout, color,
+			      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
+			      "Format", dw.dw0_4dw.format,
+			      "Type", dw.dw0_4dw.type,
+			      "T9", dw.dw0_4dw.t9, "T8", dw.dw0_4dw.t8,
+			      "TH", dw.dw0_4dw.th, "SO", dw.dw0_4dw.so,
+			      "Length", dw.dw0_4dw.len,
+			      "Time", dw.dw0_4dw.time);
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
@@ -133,35 +157,22 @@ static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
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
-	union hisi_ptt_field_data dw;
-
-	dw.value = le32_to_cpu(*(__le32 *)(pkt_buf->buf + pkt_buf->pos));
-	hisi_ptt_print_raw_record(pkt_buf->pos, dw.value);
-
-	color_fprintf(stdout, color,
-		      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
-		      "Format", dw.dw0_4dw.format, "Type", dw.dw0_4dw.type,
-		      "T9", dw.dw0_4dw.t9, "T8", dw.dw0_4dw.t8,
-		      "TH", dw.dw0_4dw.th, "SO", dw.dw0_4dw.so,
-		      "Length", dw.dw0_4dw.len, "Time", dw.dw0_4dw.time);
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


