Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879ACFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 03:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlQG0NREzTnP/FdvnDza0ulHmT2WKqhENJx6FarYkuY=; b=3Z7yKLwvGwfZ8iZKd6fHdVDm6y
	wfJ0/spH3NNLdmiR88VMQge2W3cNSJ/TLoKDx4RQsw0nghUdXGlhlBz0IGO2fM8kjubechmyVETD1
	tLMUzOuwImuGByP617eQvadZGKSwzkbORLE5ft+oRBjORlUXl8qalJzWngMpPW1sIq/vsZ4PEICWH
	Km/a79xsD/1wsdyodsPAw9zQnF3ssVv0sNj7DoKQCPL3lsYdFhlR625Z80onQxxadJiilByAYZv2F
	Az2oFwIccu7d7PLqDS2VtGtiFK+n0+HFc6N0ZjTibt5riIBPh6vu0IW4E3A/WSiDTC07wMgqjxLuV
	mlCyYnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII5i-00000004Zss-0X4v;
	Thu, 30 Apr 2026 03:29:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII55-00000004ZNQ-2XEy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 03:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52AE04031E;
	Thu, 30 Apr 2026 03:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17143C2BCB8;
	Thu, 30 Apr 2026 03:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519731;
	bh=Wz6RdrD5t8KH7Q+otfYxrLoXyFQWTLtIM5Olk/l6sa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s4pUhk2TP0voqb2Yxu9CEomvG3ReUSZSVhHkVK5BRORXZHeLFfbEQ7FIWGRMv24ks
	 0v6HmhA8Spd0MqwiTJn58cideSEAJnHFoojYyJVNPUV2yjlozf3hPZ9bY9vkMUrfpF
	 2ezcUgyfr0LRtXvI7niMMBSWegFD5wAbN5snHcstRJcRfNQe6hnmzdQ/WqvNByj0UY
	 VHjOVJOEe6pfPe3LaqW3BtAPZoR5dMd4/QlVxbQrxyOuCkmFkkXZnfCU8UlyexqUKm
	 SnJP5lFiIAFojzbjl0dN8PzdrggYUmvIEBefyhZfsgO0uj6PYw4/UTprh38Q+x/+Ka
	 zOzVtMjsU6a1g==
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
Subject: [PATCH v19 5/7] ring-buffer: Show commit numbers in buffer_meta file
Date: Thu, 30 Apr 2026 12:28:48 +0900
Message-ID: <177751972838.2136606.1618809923544417134.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <177751968499.2136606.17388366710182662849.stgit@mhiramat.tok.corp.google.com>
References: <177751968499.2136606.17388366710182662849.stgit@mhiramat.tok.corp.google.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202853_497945_31184B1F 
X-CRM114-Status: GOOD (  14.03  )
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
index c7cd93b66e0a..2654315c1b7c 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2224,6 +2224,7 @@ static int rbm_show(struct seq_file *m, void *v)
 	struct ring_buffer_per_cpu *cpu_buffer = m->private;
 	struct ring_buffer_cpu_meta *meta = cpu_buffer->ring_meta;
 	unsigned long val = (unsigned long)v;
+	struct buffer_data_page *dpage;
 
 	if (val == 1) {
 		seq_printf(m, "head_buffer:   %d\n",
@@ -2236,7 +2237,9 @@ static int rbm_show(struct seq_file *m, void *v)
 	}
 
 	val -= 2;
-	seq_printf(m, "buffer[%ld]:    %d\n", val, meta->buffers[val]);
+	dpage = rb_range_buffer(cpu_buffer, val);
+	seq_printf(m, "buffer[%ld]:    %d (commit: %ld)\n",
+		   val, meta->buffers[val], dpage ? local_read(&dpage->commit) : -1);
 
 	return 0;
 }


