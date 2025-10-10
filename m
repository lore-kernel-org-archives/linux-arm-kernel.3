Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F4CCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVMYi0dEPlAN5oTp+GqnRcFGW49bLqYyv2ugGfsmT5k=; b=xdYbg1u4zx2TQmrPrdKjCfFpbV
	bfv5wLTUyP7k+nHJBp5xg9lpBLew9E82OeFXGAvsS0cUTHOIRkceNTqzEg5Lpub30h6U4lace1/6V
	LTvQ8RAyIRFJYku99B3vnihKKsDUBwiGY529EFwoa7L5q6+GvaoMvz5aQgFOhZ8Qq0acTsMbo7BGJ
	i8UDdLUbJw4Xl/LRCEAJxf9PvI3S6DIzmpR1HMsmtD9QQ+YdXh8OVAjPvoSQLsCpjyyC5wBrLzFh2
	mix8gfpi+E0k4BmKTEHCg2A0hjSmHCTy3835FV/YxOdcuf3IFSyLs+tQGQ2AgOJD8M/MmuKySwShF
	asHERLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJL-00000008suZ-24dC;
	Fri, 10 Oct 2025 15:45:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJK-00000008stf-2tnz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jVMYi0dEPlAN5oTp+GqnRcFGW49bLqYyv2ugGfsmT5k=; b=osZjde5ztmxG0N+KpFSdEz92Q7
	vZGhzAJd05tItZ9ahmiiCxVo7evQ8N7K2egL/WsDyij0KMSwq2cX3uRznSkIG+EWz5q7S+y6g3HZb
	mu8oHavbOHB5bELPOuRIwM3lMHX8+d+8QnPriICwZRoQi2uY4pw4ZkOHHAe8zbjr7H68hW63escQ2
	AqOnckhbCX/raLaNBwIDTWuSLVgxv0OgTzoHy4gGusCcUdm/b2xhwwtvbYTIkZ6N1zaaCfRbFpbdj
	C0QR5zg+S6wteFr3jg8j4uNcomQayCC87wynNge+EZPlBtKkM67u49USk6PQP/YvzfR0YOo4fCWSL
	jy9mF+2Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJH-00000002FGS-0d2J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVMYi0dEPlAN5oTp+GqnRcFGW49bLqYyv2ugGfsmT5k=;
	b=Z8nQZ3jRQkVBvMf6PpcUxKH3iFi1Zq7WRC6d1w35oruj3APhEVadM+lhNUccfyTJq4mZ0t
	Is0C6+2oAhfFY9KPnT7plf4x7PgWHCUJc+1zA39JrubbNJujd+K7X9KkcjyTD3Ru4zwMrF
	B98OC214qWGDiOOEyY9/b2+J+zxeWgY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVMYi0dEPlAN5oTp+GqnRcFGW49bLqYyv2ugGfsmT5k=;
	b=VhTmQJ8PPFyBq/CfWFuH9cP86gCPBdUWOuzqLuKDlVByC9XoMp7knFvjZMSDWueqtP5WW/
	Q81m8HS9guApZGg7VBdPCn36wEl7eEhxTc9LPwqEbmkC2whc196PDlmgcJUpXSoDptuv+/
	6zOPAdIopsCK7jug5IcntIfEQk/yozM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-thi_Xds-PSmRA2dcrK3vtw-1; Fri,
 10 Oct 2025 11:45:30 -0400
X-MC-Unique: thi_Xds-PSmRA2dcrK3vtw-1
X-Mimecast-MFC-AGG-ID: thi_Xds-PSmRA2dcrK3vtw_1760111126
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E36721800576;
	Fri, 10 Oct 2025 15:45:25 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BFE21800576;
	Fri, 10 Oct 2025 15:45:10 +0000 (UTC)
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
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
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v6 18/29] sched/clock, x86: Mark __sched_clock_stable key as allowed in .noinstr
Date: Fri, 10 Oct 2025 17:38:28 +0200
Message-ID: <20251010153839.151763-19-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164535_494707_DEDFF05A 
X-CRM114-Status: GOOD (  16.34  )
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

Later commits will cause objtool to warn about static keys being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

__sched_clock_stable is used in .noinstr code, and can be modified at
runtime (e.g. time_cpufreq_notifier()). Suppressing the text_poke_sync()
IPI has little benefits for this key, as NOHZ_FULL is incompatible with an
unstable TSC anyway.

Mark it to let objtool know not to warn about it.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/sched/clock.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/clock.c b/kernel/sched/clock.c
index c1a028e99d2cd..e6ef71d74ac95 100644
--- a/kernel/sched/clock.c
+++ b/kernel/sched/clock.c
@@ -78,8 +78,11 @@ static DEFINE_STATIC_KEY_FALSE_RO(sched_clock_running);
  *
  * Similarly we start with __sched_clock_stable_early, thereby assuming we
  * will become stable, such that there's only a single 1 -> 0 transition.
+ *
+ * Allowed in .noinstr as an unstable TLC is incompatible with NOHZ_FULL,
+ * thus the text patching IPI would be the least of our concerns.
  */
-static DEFINE_STATIC_KEY_FALSE(__sched_clock_stable);
+static DEFINE_STATIC_KEY_FALSE_NOINSTR(__sched_clock_stable);
 static int __sched_clock_stable_early = 1;
 
 /*
-- 
2.51.0


