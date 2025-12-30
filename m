Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7136EE0205
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNB2+llp0whG4tunotM6X7LqpU8zvePkzClEajEQnkw=; b=zWzWNZfM7ZsG+lisFkcXK/ydTk
	stR22yIMU2H7KDEz//exYeCSF1ZnMuwx212LnthHbhVO+ePHvezDKgAKAffsHWaWSblQRXiMzu2/g
	NwPHRNHmpffjEU7+FW/5qd1hwe1NVYMgweLmilXmxlphoxsQZYnY6mJx20D9MtZt3Q5Vn7Zv+Q754
	CkB/rSn9dPwGzUInd2JmGfxjEXBpc/x8OQqfD5lBrgsUiUNkK7bDWyLJQCZyW2ySpVLPSZtlOjVZi
	CuBJFFC/Szs1dR2gNFpCFY3e9Wlvkv5C5vP2/Phd8BSI60umqGB+kKWZRYdLZYlHNFwbY+hdGQIO3
	IXzUdT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vab4c-00000004xbx-21EE;
	Tue, 30 Dec 2025 14:51:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vab4a-00000004xZy-0lVk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 14:51:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B993840C36;
	Tue, 30 Dec 2025 14:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A299BC116D0;
	Tue, 30 Dec 2025 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767106303;
	bh=FyY2kAvHD96tBjCFBg4Ht7xxs3v9QHdIjTezYjBYBnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qXQ+xfw+iG3gNTqCrj4ori7WaiJx/+cOHrU5nx29ca6OkslyqblnCXCySARyrJ+iV
	 RkJ2viIqIJRly6nMWM7HtFqS6F3w1vTN6hJK7q1Q9Cnm01/ImZMeY99ZVf4/JCS3qN
	 +EcF7A+WkzkjfQyRfmTm1RSocIw3v/Co7GFRgW7G0jTdhLtLmnnzDOmis8TCXb3j8S
	 2akWpVKX8UEBgU1A0+IB4SwleULp78XFrIBfMF9ubKt0uuJma/Q/LfjLx6lpwxYl16
	 lER55ffctuJVrp74aPmIUumn9F4w1SiHdo3KkqthDsHrwfLqX7GhIn8vm2Nsuc7UoX
	 A1fVgGWrX6/hQ==
From: Jiri Olsa <jolsa@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: [PATCHv6 bpf-next 8/9] ftrace: Factor ftrace_ops ops_func interface
Date: Tue, 30 Dec 2025 15:50:09 +0100
Message-ID: <20251230145010.103439-9-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230145010.103439-1-jolsa@kernel.org>
References: <20251230145010.103439-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_065144_256987_32687A13 
X-CRM114-Status: GOOD (  12.63  )
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

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h  | 2 +-
 kernel/bpf/trampoline.c | 3 ++-
 kernel/trace/ftrace.c   | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 6c1680ab8bf9..781b613781a6 100644
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
index bdac9d673776..e5a0d58ed6dc 100644
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
index d24f28677007..02030f62d737 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2075,7 +2075,7 @@ static int __ftrace_hash_update_ipmodify(struct ftrace_ops *ops,
 				 */
 				if (!ops->ops_func)
 					return -EBUSY;
-				ret = ops->ops_func(ops, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF);
+				ret = ops->ops_func(ops, rec->ip, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF);
 				if (ret)
 					return ret;
 			} else if (is_ipmodify) {
@@ -9058,7 +9058,7 @@ static int prepare_direct_functions_for_ipmodify(struct ftrace_ops *ops)
 				if (!op->ops_func)
 					return -EBUSY;
 
-				ret = op->ops_func(op, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_PEER);
+				ret = op->ops_func(op, ip, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_PEER);
 				if (ret)
 					return ret;
 			}
@@ -9105,7 +9105,7 @@ static void cleanup_direct_functions_after_ipmodify(struct ftrace_ops *ops)
 
 			/* The cleanup is optional, ignore any errors */
 			if (found_op && op->ops_func)
-				op->ops_func(op, FTRACE_OPS_CMD_DISABLE_SHARE_IPMODIFY_PEER);
+				op->ops_func(op, ip, FTRACE_OPS_CMD_DISABLE_SHARE_IPMODIFY_PEER);
 		}
 	}
 	mutex_unlock(&direct_mutex);
-- 
2.52.0


