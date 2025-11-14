Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DC3CE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HcZccm+EFWDfH2vO39s4AfZQgOMomacAD6OZP6p42M=; b=Ns8DLUddH/g9F54rJlDbTGpkVD
	KK62aYyreI61lUAxNg5raeb7KzvcQFsW8vq+SNrQp5KW/nYiTLU5L+pghuBwiZ2mlxqlEwOlfLA9L
	2encVfbRVhEdpIluuM4ViZ+AOcLbM8480bOZ37lbHK50K9x/w5WdDHe8wm/St44a4GjEGl0KycK/9
	AOo82U5434hzam3yDShZeRUKwpe299N+wEAg8WCVZ+jYsgcLjftm6nwp/XDDCFu1JSLdYS+HQDiGP
	t+L4EVOcwaJgi1bZ33DBNKzSdP5zca6oeb4NLiylHFFtFvjN/eSu8t3NVMtmA++rilPodASRcc4LK
	W0eMCCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvKa-0000000CQ1V-2oyf;
	Fri, 14 Nov 2025 15:03:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvKX-0000000CPyx-25el
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HcZccm+EFWDfH2vO39s4AfZQgOMomacAD6OZP6p42M=;
	b=gYydMF600NWp0dUBTd45rRuemMYeap136Jnt5MvSIlRYFgGZmvSsyxRlmSh00VV+W1I+mt
	gejerxZ0tFyROgMup4Wo12OUbSTXPfmzIlMf5p8WciMKn7pZAC8tYu3wbvmDLFcHDNks3U
	RZUFXbtyzF0ejGoB2nn71PZneBNkpg4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-599-caiLroS3O_OR7fs6-zrwAw-1; Fri,
 14 Nov 2025 10:03:13 -0500
X-MC-Unique: caiLroS3O_OR7fs6-zrwAw-1
X-Mimecast-MFC-AGG-ID: caiLroS3O_OR7fs6-zrwAw_1763132586
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DAD0D180034F;
	Fri, 14 Nov 2025 15:03:05 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1CFD019560B9;
	Fri, 14 Nov 2025 15:02:51 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v7 03/31] rcu: Add a small-width RCU watching counter debug option
Date: Fri, 14 Nov 2025 16:01:05 +0100
Message-ID: <20251114150133.1056710-4-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_070317_617979_87C9CCEB 
X-CRM114-Status: GOOD (  18.97  )
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

A later commit will reduce the size of the RCU watching counter to free up
some bits for another purpose. Paul suggested adding a config option to
test the extreme case where the counter is reduced to its minimum usable
width for rcutorture to poke at, so do that.

Make it only configurable under RCU_EXPERT. While at it, add a comment to
explain the layout of context_tracking->state.

Link: http://lore.kernel.org/r/4c2cb573-168f-4806-b1d9-164e8276e66a@paulmck-laptop
Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/context_tracking_state.h | 44 ++++++++++++++++++++++----
 kernel/rcu/Kconfig.debug               | 15 +++++++++
 2 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/include/linux/context_tracking_state.h b/include/linux/context_tracking_state.h
index 7b8433d5a8efe..0b81248aa03e2 100644
--- a/include/linux/context_tracking_state.h
+++ b/include/linux/context_tracking_state.h
@@ -18,12 +18,6 @@ enum ctx_state {
 	CT_STATE_MAX		= 4,
 };
 
-/* Odd value for watching, else even. */
-#define CT_RCU_WATCHING CT_STATE_MAX
-
-#define CT_STATE_MASK (CT_STATE_MAX - 1)
-#define CT_RCU_WATCHING_MASK (~CT_STATE_MASK)
-
 struct context_tracking {
 #ifdef CONFIG_CONTEXT_TRACKING_USER
 	/*
@@ -44,9 +38,45 @@ struct context_tracking {
 #endif
 };
 
+/*
+ * We cram two different things within the same atomic variable:
+ *
+ *                     CT_RCU_WATCHING_START  CT_STATE_START
+ *                                |                |
+ *                                v                v
+ *     MSB [ RCU watching counter ][ context_state ] LSB
+ *         ^                       ^
+ *         |                       |
+ * CT_RCU_WATCHING_END        CT_STATE_END
+ *
+ * Bits are used from the LSB upwards, so unused bits (if any) will always be in
+ * upper bits of the variable.
+ */
 #ifdef CONFIG_CONTEXT_TRACKING
+#define CT_SIZE (sizeof(((struct context_tracking *)0)->state) * BITS_PER_BYTE)
+
+#define CT_STATE_WIDTH bits_per(CT_STATE_MAX - 1)
+#define CT_STATE_START 0
+#define CT_STATE_END   (CT_STATE_START + CT_STATE_WIDTH - 1)
+
+#define CT_RCU_WATCHING_MAX_WIDTH (CT_SIZE - CT_STATE_WIDTH)
+#define CT_RCU_WATCHING_WIDTH     (IS_ENABLED(CONFIG_RCU_DYNTICKS_TORTURE) ? 2 : CT_RCU_WATCHING_MAX_WIDTH)
+#define CT_RCU_WATCHING_START     (CT_STATE_END + 1)
+#define CT_RCU_WATCHING_END       (CT_RCU_WATCHING_START + CT_RCU_WATCHING_WIDTH - 1)
+#define CT_RCU_WATCHING           BIT(CT_RCU_WATCHING_START)
+
+#define CT_STATE_MASK        GENMASK(CT_STATE_END,        CT_STATE_START)
+#define CT_RCU_WATCHING_MASK GENMASK(CT_RCU_WATCHING_END, CT_RCU_WATCHING_START)
+
+#define CT_UNUSED_WIDTH (CT_RCU_WATCHING_MAX_WIDTH - CT_RCU_WATCHING_WIDTH)
+
+static_assert(CT_STATE_WIDTH        +
+	      CT_RCU_WATCHING_WIDTH +
+	      CT_UNUSED_WIDTH       ==
+	      CT_SIZE);
+
 DECLARE_PER_CPU(struct context_tracking, context_tracking);
-#endif
+#endif	/* CONFIG_CONTEXT_TRACKING */
 
 #ifdef CONFIG_CONTEXT_TRACKING_USER
 static __always_inline int __ct_state(void)
diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index 12e4c64ebae15..625d75392647b 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -213,4 +213,19 @@ config RCU_STRICT_GRACE_PERIOD
 	  when looking for certain types of RCU usage bugs, for example,
 	  too-short RCU read-side critical sections.
 
+
+config RCU_DYNTICKS_TORTURE
+	bool "Minimize RCU dynticks counter size"
+	depends on RCU_EXPERT && !COMPILE_TEST
+	default n
+	help
+	  This option sets the width of the dynticks counter to its
+	  minimum usable value.  This minimum width greatly increases
+	  the probability of flushing out bugs involving counter wrap,
+	  but it also increases the probability of extending grace period
+	  durations.  This Kconfig option should therefore be avoided in
+	  production due to the consequent increased probability of OOMs.
+
+	  This has no value for production and is only for testing.
+
 endmenu # "RCU Debugging"
-- 
2.51.0


