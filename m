Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2344FB44BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LP3KiFp1p7P1eDookElpbgEeKWszgnpI/oLrbxKKyQ0=; b=DBbfde9R+EsdYNEmfM8IQ0aaRx
	m8eRKNU6vTqlzIFln4/92kcPqDXSxUYf8LQlTTvKxjOUj6b4fpZ31jyjKA/20kacq0k060UVBsg+j
	WZMhOvWtP794CGX+Cw6k4WHSA38m+oZx898Eey2AdOJWsEPwDS+8Xk9vKdlgkhoDUMeZFVuVRanWN
	/tumHgR2X+6bNefSaMq1tBRUhuaViGU9avSPLhlq6sfTWuS2Vsf/ok8+nAMKsd1/KlGKAhxoG60RH
	s3tz3oJMbjDu+vGMT9/A8kTkbs/Aqenfk55Y+q+zwz27RVMr5CZuSc2gBcm2TP4YR4OjWju4D0bEz
	4MSESdEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAPI-0000000Cjdt-2DAr;
	Fri, 24 Apr 2026 06:52:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAPG-0000000CjcQ-3G2g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FC26600CB;
	Fri, 24 Apr 2026 06:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994C6C2BCB6;
	Fri, 24 Apr 2026 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013573;
	bh=ZNLWUqzy6prqN8C2IicGEQorWhN6QWpt0ii93XNC/uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hXbevsU9B9t/NRBMR7+fap/Rf+nLhzAUx9MO25V9+OFRA5xvaY5Z306Rp5KkJmzDo
	 Axf9W9Lg/b7PXrVaAa8IOLMb2pLrxYdL2LP4vg+kUHnlVbibN/f9a8SccMT+pWR5kW
	 ns2ZKusPJpVuDRBcr7pmeT12223BireSNzXjoYMm9nLTZckvbgQHJQ4EFGcVI5BrKK
	 j1LXOb9b0UIiSqXk8ujF+yDuavdirtMbiW8GzviaNBPNFbdSI900m1CCmvM8ZvjQHx
	 Mpl1fPlSur4gfwOJlbuEyOpnWyvsYcFvjejxbneCbc3ldE54tSG16O1epW9xUuzreB
	 T5k3Ij95f6Qtw==
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
Subject: [PATCH v18 6/8] ring-buffer: Show commit numbers in buffer_meta file
Date: Fri, 24 Apr 2026 15:52:51 +0900
Message-ID: <177701357092.2223789.2924578391155511584.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
In-Reply-To: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
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
 Changes in v17:
 - Added NULL check for dpage in rbm_show in ring_buffer.c.
 Changes in v16:
  - update description.
---
 kernel/trace/ring_buffer.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index e8d2b3457d7f..de653a8e3cec 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2216,6 +2216,7 @@ static int rbm_show(struct seq_file *m, void *v)
 	struct ring_buffer_per_cpu *cpu_buffer = m->private;
 	struct ring_buffer_cpu_meta *meta = cpu_buffer->ring_meta;
 	unsigned long val = (unsigned long)v;
+	struct buffer_data_page *dpage;
 
 	if (val == 1) {
 		seq_printf(m, "head_buffer:   %d\n",
@@ -2228,7 +2229,9 @@ static int rbm_show(struct seq_file *m, void *v)
 	}
 
 	val -= 2;
-	seq_printf(m, "buffer[%ld]:    %d\n", val, meta->buffers[val]);
+	dpage = rb_range_buffer(cpu_buffer, val);
+	seq_printf(m, "buffer[%ld]:    %d (commit: %ld)\n",
+		   val, meta->buffers[val], dpage ? local_read(&dpage->commit) : -1);
 
 	return 0;
 }


