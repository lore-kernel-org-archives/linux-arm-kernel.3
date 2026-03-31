Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7EFFF60ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kh9hM5ha3NYl4EbN9f/1GBGPVghOUXdHZUxFMBW8TFY=; b=D5uFn/JaDMcpnOJQCStNlfPTBy
	6Ctqh6vyDST3lXKTYoFGMpFMEM6X2z51S3Ct8r3rH8P70yBUEtsHKFr5Nb684gV3yjS8ZMBXtnHvw
	0Es2Ni0bxyqT7uUUnHQMJ136ZEj6Ra99NkDLRuG4bEqpdG+I++Fy6kCiEcOwUvKdb6eVsHmQWNO8r
	s5DoxCj9ljQOwSa1H6P3SeR67Q2G4jxIMsV7rhYqQ24i2HUx2FFAtMOKRfs5Dew2DYyK24qsi8gKs
	yPMVnDD1Wjtjr80A/TBAwgRTWEtVgK8KNfx/uCO+DOZTDwI1Gq95Ki2eE4VEG/AnyNYZVo1jg3ZFQ
	zKQm2htg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Uap-0000000Cc9q-29ca;
	Tue, 31 Mar 2026 08:36:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Uao-0000000Cc9M-40D9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 08:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Kh9hM5ha3NYl4EbN9f/1GBGPVghOUXdHZUxFMBW8TFY=; b=ff+u5SO3zSELHLxhzGOb81uoCl
	04FPJqwDfVIQgMCfmjLbxse+ZaQca2CAhobd+jEWmXRb6YL27rEMXRgUz1TKXmmUo6is/9cuRwvDf
	NgW9sJvOYq+IxPv6D6MEtqc61boh34xJ1KLrVD3v98hFeCscqDfyIBXfr6ySe1WqItNfpWuKnDWtp
	xjv9S4xlEOjyH/+XesZ5Q+Ycv2vACIjEnVZ5hXm1INt5DnEx2L0r73/LWZFLvAuyzg+yfCT9jVH70
	O0BwJ83JzuovvsAXasHBbx9rIXGGXPt9bSaTm17f+BN8/kAFEiwVdN4T/4pi0lbxP1R0kZGYzsujk
	pG9sx2ew==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Uac-0000000FQbM-2xxP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B716A42DF6;
	Tue, 31 Mar 2026 08:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FB3C19423;
	Tue, 31 Mar 2026 08:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946201;
	bh=zBvbhKuvsTDbLAa1L0owpCB16c4iKQkzIjyhvgxp+hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HFN56mWC6/hjUGUjsna+ue9prq5jNncv2i0I9ar0nNDqmtbIjwhUHOJG4pIAMDcCT
	 Sf1LH6F2ppDsBAKI4xV1CQFnEXyxRlY/db1naL0ifltZThPB2qBQaewAx972ItDdya
	 pmR9pbDCwXKOetkR0Iob0cjfebPU4wbiJEbIQpH535ePy17JY0agiNPTMdhpg3EWf1
	 eFddBentttY7huy+XnpSqMBdhJKjSqqTTxYU5JHrzCVSI5AQ2v3GDHvts2PrigUnoA
	 f+R3yXeMl9nMX9IlAPL3DBT65/xZXBKcig8j32Ngqeyv5GG+APQi/pRvooV6O0XNAF
	 9pq0U/Hz8zs8w==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v15 5/5] ring-buffer: Show commit numbers in buffer_meta file
Date: Tue, 31 Mar 2026 17:36:38 +0900
Message-ID: <177494619878.71933.15471023049227398684.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
In-Reply-To: <177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com>
References: <177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_093648_065966_9755A7C9 
X-CRM114-Status: GOOD (  12.71  )
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

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

In addition to the index number, show the commit numbers of
each data page in per_cpu buffer_meta file.
This is useful for understanding the current status of the
persistent ring buffer. (Note that this file is shown
only for persistent ring buffer and its backup instance)

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/trace/ring_buffer.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index fb098b0b4505..5b40fea6b15d 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2209,6 +2209,7 @@ static int rbm_show(struct seq_file *m, void *v)
 	struct ring_buffer_per_cpu *cpu_buffer = m->private;
 	struct ring_buffer_cpu_meta *meta = cpu_buffer->ring_meta;
 	unsigned long val = (unsigned long)v;
+	struct buffer_data_page *dpage;
 
 	if (val == 1) {
 		seq_printf(m, "head_buffer:   %d\n",
@@ -2221,7 +2222,9 @@ static int rbm_show(struct seq_file *m, void *v)
 	}
 
 	val -= 2;
-	seq_printf(m, "buffer[%ld]:    %d\n", val, meta->buffers[val]);
+	dpage = rb_range_buffer(cpu_buffer, val);
+	seq_printf(m, "buffer[%ld]:    %d (commit: %ld)\n",
+		   val, meta->buffers[val], local_read(&dpage->commit));
 
 	return 0;
 }


