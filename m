Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9551D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFjQYIlB30FgXRQX2wBMXGESztsH8JJF73k1AW/qFb8=; b=sZBxl8H0GEsf487PApsSktuzRZ
	5esBS1ukyDIyuuOpBlCVDvUI8eZhCLyjsOWB2Ty/HZaqujhU779ZSYSnY6TYgH5covwdP2S9Hxcfl
	sJDi1DLNyvTkmgFlKY7xrnovRBxEQgwfAMgCA/PCnHqkAfkbdhMYfyfTE120hmlSnHIi8hpo/iyLO
	cOkjWast6ztgwE+ZY/xB06utUKsomL9j5i+PR2pVDgINBk4XXOfZzZY+vmHtBm/h+AdPaTqGwL2sk
	73HfO1hbzerKjcfm9vhV2nNZliwLnZWiXe2QuUusmeyIqvH65JzJpsBHeSsmjmyKrscS4/DW08BAV
	HEPvkbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVFuy-00000004GYv-2XQY;
	Mon, 15 Dec 2025 21:15:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVFuu-00000004GX8-0uIl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA748407C1;
	Mon, 15 Dec 2025 21:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B1AC4CEF5;
	Mon, 15 Dec 2025 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765833339;
	bh=MWeM2npA+/r+WLkyhdWGmPCCvwaBhWn30P369wb3/B4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XmL66eN+wNT9TwZQmb05x8uT6n6SDuLDFBYjPbR+N73FSgSMWfbEe9yCevPAqWAhR
	 DYy1UpQCLwUNVbPx+XlINuN5fZzssxJQ5dsozqvSIzOH2MhLpSQq9Sc9o4Kyetmetk
	 w08fY423x96CJWfksor4zzaBYiYXOG2e3mPZ04NGE0NUMKHJwPJIuiTgcGjZf/ODvo
	 65SCJzRdFfjeZucEFSSwFtY7y+R67AYkESLNxq3VzPVZhQcaoOZaS92hS7JU3hgx/K
	 GYWeURCvmnMhGAkgY8PsJrJ/CxQdX3EBFhtpJ8xLCFgj9OG/yFBl8UEYdnMUFBq+5H
	 uVQFifqLov94Q==
From: Jiri Olsa <jolsa@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: [PATCHv5 bpf-next 8/9] ftrace: Factor ftrace_ops ops_func interface
Date: Mon, 15 Dec 2025 22:14:01 +0100
Message-ID: <20251215211402.353056-9-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215211402.353056-1-jolsa@kernel.org>
References: <20251215211402.353056-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_131542_386647_7B484D5B 
X-CRM114-Status: GOOD (  12.82  )
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

We are going to remove "ftrace_ops->private == bpf_trampoline" setup
in following changes.

Adding ip argument to ftrace_ops_func_t callback function, so we can
use it to look up the trampoline.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h  | 2 +-
 kernel/bpf/trampoline.c | 3 ++-
 kernel/trace/ftrace.c   | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index c3bf9cede1fe..6f94bad34492 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -403,7 +403,7 @@ enum ftrace_ops_cmd {
  *        Negative on failure. The return value is dependent on the
  *        callback.
  */
-typedef int (*ftrace_ops_func_t)(struct ftrace_ops *op, enum ftrace_ops_cmd cmd);
+typedef int (*ftrace_ops_func_t)(struct ftrace_ops *op, unsigned long ip, enum ftrace_ops_cmd cmd);
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index f298bafab76e..17af2aad8382 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -33,7 +33,8 @@ static DEFINE_MUTEX(trampoline_mutex);
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex);
 
-static int bpf_tramp_ftrace_ops_func(struct ftrace_ops *ops, enum ftrace_ops_cmd cmd)
+static int bpf_tramp_ftrace_ops_func(struct ftrace_ops *ops, unsigned long ip,
+				     enum ftrace_ops_cmd cmd)
 {
 	struct bpf_trampoline *tr = ops->private;
 	int ret = 0;
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 95a38fb18ed7..c2054fe80de7 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2049,7 +2049,7 @@ static int __ftrace_hash_update_ipmodify(struct ftrace_ops *ops,
 				 */
 				if (!ops->ops_func)
 					return -EBUSY;
-				ret = ops->ops_func(ops, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF);
+				ret = ops->ops_func(ops, rec->ip, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF);
 				if (ret)
 					return ret;
 			} else if (is_ipmodify) {
@@ -8983,7 +8983,7 @@ static int prepare_direct_functions_for_ipmodify(struct ftrace_ops *ops)
 				if (!op->ops_func)
 					return -EBUSY;
 
-				ret = op->ops_func(op, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_PEER);
+				ret = op->ops_func(op, ip, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_PEER);
 				if (ret)
 					return ret;
 			}
@@ -9030,7 +9030,7 @@ static void cleanup_direct_functions_after_ipmodify(struct ftrace_ops *ops)
 
 			/* The cleanup is optional, ignore any errors */
 			if (found_op && op->ops_func)
-				op->ops_func(op, FTRACE_OPS_CMD_DISABLE_SHARE_IPMODIFY_PEER);
+				op->ops_func(op, ip, FTRACE_OPS_CMD_DISABLE_SHARE_IPMODIFY_PEER);
 		}
 	}
 	mutex_unlock(&direct_mutex);
-- 
2.52.0


