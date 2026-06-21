Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C468CCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=eq4Jiz0A0s0y1CCaKrigK8iMCmKO2KO/DMw+O1PS1ZY=; b=Ya04hqKA/lZTCp
	hQ0zoGp0fzJxGxc7Ac9MWlhBl0BEpViWSKvI3J80NCX7ec4PMpVVO7boaEKoykJDd84N40bnuc4SA
	aJ38zBSXJNl/i5Sw+8e1pAuffMGBoFVYUO9aa5jhMFYFS0uE2XQPEYE5rDg/f5mkdHhDD8K7CnBXD
	5nbdyc3SGM4qaT5wTgo7VaangKiAGnOlHl3ueJ83KcLSPKGKhetpIi5sb5W748va1B1swRTmXuaKs
	m8IC+9f2ghfWkMgy2CCd3t5NAoGi0QYZssU+5/RsTPpOWDm0E4rHwKtPuPIH/KA2awccVXgYmu1M8
	tZbuazU1wU55+4xoiWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbEcm-00000003sm0-0fik;
	Sun, 21 Jun 2026 09:37:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbEck-00000003slc-2GmM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 09:37:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA1C8600AF;
	Sun, 21 Jun 2026 09:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4931F00A3A;
	Sun, 21 Jun 2026 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782034672;
	bh=eq4Jiz0A0s0y1CCaKrigK8iMCmKO2KO/DMw+O1PS1ZY=;
	h=Date:From:To:Cc:Subject:References;
	b=kHYbAcsD3riuZyE8yw/zGyX4OGv8E29ntBrV/psMay3TNT67fA5gNBpeHGFBeZ/12
	 2Ay7PRmR+s6HdarptXq0OjoszuRK4hDjuFDr5zqy5M5pwo3OOG5Rfwzz1hG/+dQ1n8
	 CM2zwSeAYz4lQYZRNadhemupSTJhYAVEj8Z/JGBsC+uxY4TS20hXDjW9EjrTZX/Dl+
	 vMXqPLpJ/wkow6elNFJjsfNE/3ih99IbbRotQdZuC4nu/UA/y3tJKjSTogiiW5YYf5
	 87SMm3+n4xuUToS7j7SvNUKsWt0yz2IfUnDNb9wlqNTm+yoVD5272meD4iMEV5O7Pw
	 ZebFVZP2gqGBg==
Received: from rostedt by gandalf with local (Exim 4.99.3)
	(envelope-from <rostedt@kernel.org>)
	id 1wbEd1-00000001qU9-0cPr;
	Sun, 21 Jun 2026 05:38:11 -0400
Message-ID: <20260621093811.007634476@kernel.org>
User-Agent: quilt/0.69
Date: Sun, 21 Jun 2026 05:34:31 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 John Ogness <john.ogness@linutronix.de>,
 Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Julia Lawall <julia.lawall@inria.fr>,
 Yury Norov <yury.norov@gmail.com>,
 linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org,
 linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org,
 kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] tracing: Move non-trace_printk prototypes back to kernel.h
References: <20260621093430.264983361@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Steven Rostedt <rostedt@goodmis.org>

In order to remove the include to trace_printk.h from kernel.h the tracing
control prototypes need to be moved back into kernel.h. That's because
they are used in other common header files like rcu.h. There's no point in
removing trace_printk.h from kernel.h if it just gets added back to other
common headers.

Prototypes are very cheap for the compiler and should not be an issue.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/kernel.h       | 18 ++++++++++++++++++
 include/linux/trace_printk.h | 17 -----------------
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index e5570a16cbb1..c3c68128827c 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -194,4 +194,22 @@ extern enum system_states system_state;
 # define REBUILD_DUE_TO_DYNAMIC_FTRACE
 #endif
 
+#ifdef CONFIG_TRACING
+void tracing_on(void);
+void tracing_off(void);
+int tracing_is_on(void);
+void tracing_snapshot(void);
+void tracing_snapshot_alloc(void);
+void tracing_start(void);
+void tracing_stop(void);
+#else
+static inline void tracing_start(void) { }
+static inline void tracing_stop(void) { }
+static inline void tracing_on(void) { }
+static inline void tracing_off(void) { }
+static inline int tracing_is_on(void) { return 0; }
+static inline void tracing_snapshot(void) { }
+static inline void tracing_snapshot_alloc(void) { }
+#endif
+
 #endif
diff --git a/include/linux/trace_printk.h b/include/linux/trace_printk.h
index 3d54f440dccf..879fed0805fd 100644
--- a/include/linux/trace_printk.h
+++ b/include/linux/trace_printk.h
@@ -35,15 +35,6 @@ enum ftrace_dump_mode {
 };
 
 #ifdef CONFIG_TRACING
-void tracing_on(void);
-void tracing_off(void);
-int tracing_is_on(void);
-void tracing_snapshot(void);
-void tracing_snapshot_alloc(void);
-
-extern void tracing_start(void);
-extern void tracing_stop(void);
-
 static inline __printf(1, 2)
 void ____trace_printk_check_format(const char *fmt, ...)
 {
@@ -176,16 +167,8 @@ __ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);
 
 extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
 #else
-static inline void tracing_start(void) { }
-static inline void tracing_stop(void) { }
 static inline void trace_dump_stack(int skip) { }
 
-static inline void tracing_on(void) { }
-static inline void tracing_off(void) { }
-static inline int tracing_is_on(void) { return 0; }
-static inline void tracing_snapshot(void) { }
-static inline void tracing_snapshot_alloc(void) { }
-
 static inline __printf(1, 2)
 int trace_printk(const char *fmt, ...)
 {
-- 
2.53.0



