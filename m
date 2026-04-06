Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A185EF4ECA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 10:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5E0biVaCM0rYpobPN8MyG40BVPvZO7sSTcUxMm2heU=; b=kWkZXkB1hAMoiJIjxHQgtLFTyM
	NJ3urj67gr+NnK2XbNgEXdR01c846ymZ2m7x/G/yV0OHNmc34sFBulaonNKcTU2xVleF0bgrsECmt
	ID+qObv8qh80QcyQIbzU48iYK9/PNIzsYjy64fpqJi6+QUHkd1Ih8H++Xz1CYKtY5ISJZX3/QbDch
	Sd3gbzCoyKunZ6kG9XXqdDAIcKf++FLPTSpn3NeoR+v4EIv28aashHu/thit08Nm+fTeyn8tskfRl
	uO4KivEGf8+qpcVrKBtQkuymT8B7iwM2QGrbk/vs8vi8W+UE/OePG5pEhY4gj/zx+vLUmT4tYHgdo
	axJjazLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9h8i-000000050Dj-1qkK;
	Mon, 06 Apr 2026 10:25:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9h8g-000000050BW-01Ca
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 10:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79A8A441FB;
	Mon,  6 Apr 2026 10:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C97C4CEF7;
	Mon,  6 Apr 2026 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471101;
	bh=04xzV7B6C0nmMB8kee/matN9EpL075hjg5Q3i9FX6OQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E1IclHoMlFg67kG65rpRpLwRfbHVTs5ZkORk+pxRgxrLE6xWaZaEK9qubaRpMj65P
	 f/OGyw/MgKXaG/NFtYfRFiXZSwjDWcYVsIG/W30FztV9pX+BujkcJgacqOKk9NFeJ7
	 VFegw/3cISJgzNviEx5LSCxie7aeaQyyJeOr0mue+XQ2Mpc6AXovhmQYHS9uuy88Oc
	 an5emKPHvsbwKKBTayqWiBQJ74vzoQwMwrNOWtU/2knEHFuy7sA4/siCeR8IT2iNPS
	 myVuTBER+U4H3MW5DsJsI639seQ5ueHXEbCJn+KQnooRbEu+itgjW/wsCYUop3L54D
	 iqAc6CTjWzMNQ==
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
Subject: [PATCH v16 5/5] ring-buffer: Show commit numbers in buffer_meta file
Date: Mon,  6 Apr 2026 19:24:58 +0900
Message-ID: <177547109851.259641.2033773321493831101.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <177547105523.259641.14385891517704197263.stgit@mhiramat.tok.corp.google.com>
References: <177547105523.259641.14385891517704197263.stgit@mhiramat.tok.corp.google.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_032502_257367_C2EEDA8B 
X-CRM114-Status: GOOD (  13.53  )
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


