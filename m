Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A6CFA1FD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGssG2LNNmvYp1j9Dak1Um3uvLr8RxDuhyKEkNLoBsA=; b=EZZapSGhsY+sfhZfX8BUHVddFx
	hHTC/oWWcFj31LXel7sKrhErpOSKrt28vRNWGm3jpK3ryrO9dGAXMTR0yTSDK9ZGIGpyps8NbKzMb
	OzzAUtflPTjiHqQXFekkvebqLHWjfVIAsVxKewk3FVnqoVfQ1Jq4712LUXNFEKvjrZarHYTPSD73/
	4m9yJiaInzMjCwH6f7+CmFpO58BnvVSPiRMVgMiEPeTonvdrbjuCOjOvXMRpooANd4mH3xTSaFYb0
	k/VLJdFVj/TbTmpbveODoAO76Tz1nstCWs81NiJvoASYrre3cJTA7IB9mM3LL30ucwo+mGPnf7dt0
	nU9C1UGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaGI-0000000AUWh-2Yl2;
	Wed, 22 Apr 2026 16:17:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaGF-0000000AUUZ-3PpM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:17:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4329D60132;
	Wed, 22 Apr 2026 16:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3D6C2BCAF;
	Wed, 22 Apr 2026 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776874631;
	bh=c7iBYZRpOtWPvLcFtw1dd9PzPthaeOLO/ie+Zfx/ByQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EtN5BZ6FQTsY6ccim/pco0ZmKP9wp8NZSXFDAFHf5PqLX8+EFcWD92MAhe+/O4fPW
	 GiDYi5I6C1l206Q4fGFFgxoiyfdZls/04p2tAU+KgDLEPeNqg00EhOkmeHPBUKSMtA
	 FsKw8/Xe0DsppJZ2cB6W4ESUNrAySe+RjROXZnT/zJNlLuANX/AaVKW4IM05Ycqx+F
	 Vn7ACFEVeZ5LxpdxOxBesF2BgnnW/l/o1TfBh4xn++sW7XVxl324J65Czhwqvpwyx3
	 dfSlFESonGFjoFY0G/LxIvzc8M6dZEg8CzHbCGZVxdp/JSTcO0MlN6tkqVeJEXBe0X
	 TTStuH0SJjalg==
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
Subject: [PATCH v17 5/5] ring-buffer: Show commit numbers in buffer_meta file
Date: Thu, 23 Apr 2026 01:17:06 +0900
Message-ID: <177687462643.932171.4169785470864985964.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
In-Reply-To: <177687458572.932171.10907864814735342737.stgit@mhiramat.tok.corp.google.com>
References: <177687458572.932171.10907864814735342737.stgit@mhiramat.tok.corp.google.com>
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
index 31448c5ea791..15dcbf554d49 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2215,6 +2215,7 @@ static int rbm_show(struct seq_file *m, void *v)
 	struct ring_buffer_per_cpu *cpu_buffer = m->private;
 	struct ring_buffer_cpu_meta *meta = cpu_buffer->ring_meta;
 	unsigned long val = (unsigned long)v;
+	struct buffer_data_page *dpage;
 
 	if (val == 1) {
 		seq_printf(m, "head_buffer:   %d\n",
@@ -2227,7 +2228,9 @@ static int rbm_show(struct seq_file *m, void *v)
 	}
 
 	val -= 2;
-	seq_printf(m, "buffer[%ld]:    %d\n", val, meta->buffers[val]);
+	dpage = rb_range_buffer(cpu_buffer, val);
+	seq_printf(m, "buffer[%ld]:    %d (commit: %ld)\n",
+		   val, meta->buffers[val], dpage ? local_read(&dpage->commit) : -1);
 
 	return 0;
 }


