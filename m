Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7A4FB5173
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 01:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5E0biVaCM0rYpobPN8MyG40BVPvZO7sSTcUxMm2heU=; b=t2Gm6HD9/3hunguTnaW/3RE2iP
	dZuReIsECZny5/PFiJx+apINxBXUfp9SH7eBxyaDoZnaQl4uAAg1D8LI4SQuFv7KQf4P1razjxXgv
	JFHD5hExKwXwlF63trIuGnfDFNp1RD4USOx3oxXEyiKvpjBxlPudD3KCAGPEDk/QFcjGLF4hyMTK7
	HzTCEEZl+NZCLfrofHY5WdZUrqNMCtfrC/jDNh9zy3hSbRBExibPOa1EtEFqajyO8TxMQz2eewBC/
	HGrhKEJxsW576/89ERRC4GcJFS6ApYofZjkZWUv6eKcwfDvXa8M4k4A6jSxSI5NJQhHWkVawK++eb
	iy6Tmhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9uzq-00000005glH-0epx;
	Tue, 07 Apr 2026 01:12:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9uzp-00000005gke-17U8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 01:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C74D60180;
	Tue,  7 Apr 2026 01:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEEBC4CEF7;
	Tue,  7 Apr 2026 01:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775524368;
	bh=04xzV7B6C0nmMB8kee/matN9EpL075hjg5Q3i9FX6OQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O95rq4om1pTH7pZC7zwsk3J2bF91ArIo789zWNkO7ht2PLm82OGs+1LnfEhtJX4mR
	 LOH/dCNzSLpA4nBzF1dRvBogx8iOaoVTrKkK04y0fmn/NSNVpZFuUWTzURvYg0DZP5
	 hMShlNtxbJ2xpMe1d3xKOrpArq+qDRY2pg15pffyLD1cl7E1LQieFTyGjrV3JRu+7I
	 aEzRcyWFn7gh/QtB0uVXf33y7sODc1EQjniNJEHvKXQU1eEsKbiQR8cvbeNfvbhx2j
	 52Gf+Rrjzqhfo+F8lN4uvVSzKzPeBo6HWCbuqGQxjH826/vyNm1X3RfcpOD4R+Qwmf
	 EafK0o3CcUtBQ==
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
Subject: [RESEND PATCH v16 5/5] ring-buffer: Show commit numbers in buffer_meta file
Date: Tue,  7 Apr 2026 10:12:45 +0900
Message-ID: <177552436513.853249.11847302364667074886.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <177552432201.853249.5125045538812833325.stgit@mhiramat.tok.corp.google.com>
References: <177552432201.853249.5125045538812833325.stgit@mhiramat.tok.corp.google.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
each data page in the per_cpu buffer_meta file.
This is useful for understanding the current status of the
persistent ring buffer. (Note that this file is shown
only for persistent ring buffer and its backup instance)

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 Changes in v16:
  - update description.
---
 kernel/trace/ring_buffer.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index e56fe9dcc7d7..4bf83b7805da 100644
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


