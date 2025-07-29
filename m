Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7F2C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfHb7Nz3KKNhA85HYDVb9lVGX53K2Ls9vPaNIXMNKW0=; b=ATT+xWjHV8uZJPZZl2qJXD3v8L
	K2Lodooix+hO+MkvzI8/0bhWt5a7GjxwSiL7wIubxyQipPK9SnfUqbAwhFhyQBFtcaNyOpX23fdlT
	YTX3pjTTzJitDS2bhOh3O/7/TWTexI3H6k7b5YaFHhXcM+a/5ytKJZQQZkXQN4AAGSw85ylz3Tmrf
	GA5bHfLYi7qmX6TjIvQtrpAdLFddkl7f+eLrYDfrEtxBtNXbTgO7u3v/8+7nDZUxPZPZDdfX/6b9o
	v571ZN8H2NQXNA51NTEcOCRVYyL3L4IlCmTZTXVyfNTChlFqkZctROA/zzyRmk3wB8XAbGNOPijDV
	WbS8bkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughvs-0000000GZcu-3IoT;
	Tue, 29 Jul 2025 10:51:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughab-0000000GWzj-0NYg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 10:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86EEF601EE;
	Tue, 29 Jul 2025 10:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7055BC4CEEF;
	Tue, 29 Jul 2025 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753784984;
	bh=gkMMkcsvhGCheI1Y4239jYBPUdUxOQ7UslqUuwaf+NY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1lpVrWsiXKASxyTeBu3hnP8GrAosrNWPwwnx8nqmGQ/OYdrOweMpZfcPJDM+xl/N
	 F4XD0bEzsQhoeUhI1IHdDkNny0ntOU3R1ORBxaQKAcCSho40rLU0TZIsP/caOl2j6b
	 eUlT9Uk4O4stCse23RQeKCo1mb0Ci0/GK4CSfYkh3xGtgDuubYvBZ7csbKtFs8vc6h
	 NpQj1c+ZyyuLgC2IMKhfCxvkk5aJPNLOPJkD7xbB8QB/tfxtMsifUOhIdprlmn3mwt
	 yVfgNANCpMlJmOR9VgQh7NBbTPXT9aTogVoczcShubaCjQA195m5rR5a8Jdnuv0HmG
	 Vhk5fbNUqOm4Q==
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
	Menglong Dong <menglong8.dong@gmail.com>
Subject: [RFC 08/10] ftrace: Factor ftrace_ops ops_func interface
Date: Tue, 29 Jul 2025 12:28:11 +0200
Message-ID: <20250729102813.1531457-9-jolsa@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729102813.1531457-1-jolsa@kernel.org>
References: <20250729102813.1531457-1-jolsa@kernel.org>
MIME-Version: 1.0
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

We are going to remove "ftrace_ops->private == bpf_trampoline" setup
in following changes.

Adding ip argument to ftrace_ops_func_t callback function, so we can
use it to look up the trampoline.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 include/linux/ftrace.h  |  2 +-
 kernel/bpf/trampoline.c | 26 ++++++++++++++++++++++++--
 kernel/trace/ftrace.c   |  6 +++---
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 85f4ab1a1e72..1a61f969550d 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -394,7 +394,7 @@ enum ftrace_ops_cmd {
  *        Negative on failure. The return value is dependent on the
  *        callback.
  */
-typedef int (*ftrace_ops_func_t)(struct ftrace_ops *op, enum ftrace_ops_cmd cmd);
+typedef int (*ftrace_ops_func_t)(struct ftrace_ops *op, unsigned long ip, enum ftrace_ops_cmd cmd);
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 84bcd9f6bd74..398c1a722d83 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -33,11 +33,33 @@ static DEFINE_MUTEX(trampoline_mutex);
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex);
 
-static int bpf_tramp_ftrace_ops_func(struct ftrace_ops *ops, enum ftrace_ops_cmd cmd)
+static struct bpf_trampoline *bpf_trampoline_ip_lookup(unsigned long ip)
 {
-	struct bpf_trampoline *tr = ops->private;
+	struct hlist_head *head_ip;
+	struct bpf_trampoline *tr;
+
+	mutex_lock(&trampoline_mutex);
+	head_ip = &trampoline_ip_table[hash_64(ip, TRAMPOLINE_HASH_BITS)];
+	hlist_for_each_entry(tr, head_ip, hlist_ip) {
+		if (tr->func.addr == (void *) ip)
+			goto out;
+	}
+	tr = NULL;
+out:
+	mutex_unlock(&trampoline_mutex);
+	return tr;
+}
+
+static int bpf_tramp_ftrace_ops_func(struct ftrace_ops *ops, unsigned long ip,
+				     enum ftrace_ops_cmd cmd)
+{
+	struct bpf_trampoline *tr;
 	int ret = 0;
 
+	tr = bpf_trampoline_ip_lookup(ip);
+	if (!tr)
+		return -EINVAL;
+
 	if (cmd == FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF) {
 		/* This is called inside register_ftrace_direct_multi(), so
 		 * tr->mutex is already locked.
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 151ca94f496a..943feabdd5e6 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2040,7 +2040,7 @@ static int __ftrace_hash_update_ipmodify(struct ftrace_ops *ops,
 				 */
 				if (!ops->ops_func)
 					return -EBUSY;
-				ret = ops->ops_func(ops, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF);
+				ret = ops->ops_func(ops, rec->ip, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_SELF);
 				if (ret)
 					return ret;
 			} else if (is_ipmodify) {
@@ -8746,7 +8746,7 @@ static int prepare_direct_functions_for_ipmodify(struct ftrace_ops *ops)
 				if (!op->ops_func)
 					return -EBUSY;
 
-				ret = op->ops_func(op, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_PEER);
+				ret = op->ops_func(op, ip, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_PEER);
 				if (ret)
 					return ret;
 			}
@@ -8793,7 +8793,7 @@ static void cleanup_direct_functions_after_ipmodify(struct ftrace_ops *ops)
 
 			/* The cleanup is optional, ignore any errors */
 			if (found_op && op->ops_func)
-				op->ops_func(op, FTRACE_OPS_CMD_DISABLE_SHARE_IPMODIFY_PEER);
+				op->ops_func(op, ip, FTRACE_OPS_CMD_DISABLE_SHARE_IPMODIFY_PEER);
 		}
 	}
 	mutex_unlock(&direct_mutex);
-- 
2.50.1


