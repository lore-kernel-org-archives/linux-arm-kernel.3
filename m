Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF63C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAfYco4WfrGmByfZk6qWtv5WDZbE7I4F4cu33eC8eLw=; b=N7gSHd/V0W9fh3WuHGxvppC9y8
	Sbt66Fu0SOmtKpB+QuRMIIdttyymAaOZ/vy9RFBE6Zlo0JhhuJNgGQ2/O0Z9sp+3/rgPwQ2zhV00V
	C8ppNNm9g54x78CHijl+F57WzLfUMT4rTFhHRTlPvKyigpYfgiWDRou4iRLuB66rEPeumgfjFgmYw
	P9RPrCqHMrx0715kRl60HL3zOEDYtzoBDQ4nu5eRwxMv5mrD1IgbO/XTqA5cDL+0j5SHmNhc7Qk8N
	leQE0+zWFX4OoklQGtj3wJMQOcZ0s9pIeuhXKtPJ4eilAhADewUs6K6BwVZg5bpUiW42hcHPriIJP
	R3z1X9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUVv-00000008jdC-1tdq;
	Wed, 09 Jul 2025 13:07:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSIU-00000008M4A-09on
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:45:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28F7D447C2;
	Wed,  9 Jul 2025 10:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A58C4CEEF;
	Wed,  9 Jul 2025 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752057905;
	bh=bx494dg87ZcHtSWenFZRSz/6PX1NsdmicOQArPw1Yf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i4g4NyReeqVSrXkrgk9w6PhbRT5vzDJ1qGbDjGfEuZmQ9BNT7kmN8QNoZ6n+9YGlq
	 AzkuacTEBBb/J/TnV97zd3clRuhChXB5+PkLgTzKdlDKg2JlevslNCWdlutFS9bLjd
	 YTXBkucW8KjKLMNfZ8F3LDrhiHOgLa4vS7T8yhpODIC6ixYcpoP1LYj2mcbGD6pKRM
	 YelSHGOBurxYrfKTvEWCrkhzeraJOHQEcB2cusjtbPmib1ayQQuRHlN8ikcvhaDJUK
	 tjWAo91XPUix4gRZ33ipgUSzFDixLPhXUe6L2gRs6Yyb1SCC5AwG6rvyA/MuMMnqwU
	 Yqjb1SaJSEAKg==
From: neeraj.upadhyay@kernel.org
To: rcu@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	paulmck@kernel.org,
	joelagnelf@nvidia.com,
	frederic@kernel.org,
	boqun.feng@gmail.com,
	urezki@gmail.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang1211@gmail.com,
	neeraj.iitr10@gmail.com,
	neeraj.upadhyay@amd.com,
	"Neeraj Upadhyay (AMD)" <neeraj.upadhyay@kernel.org>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH rcu 06/13] torture: Provide EXPERT Kconfig option for arm64 KCSAN torture.sh runs
Date: Wed,  9 Jul 2025 16:14:07 +0530
Message-Id: <20250709104414.15618-7-neeraj.upadhyay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250709104414.15618-1-neeraj.upadhyay@kernel.org>
References: <20250709104414.15618-1-neeraj.upadhyay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_034506_096038_D73215D6 
X-CRM114-Status: GOOD (  10.25  )
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

From: "Paul E. McKenney" <paulmck@kernel.org>

The arm64 architecture requires that KCSAN-enabled kernels be built with
the CONFIG_EXPERT=y Kconfig option.  This commit therefore causes the
torture.sh script to provide this option, but only for --kcsan runs on
arm64 systems.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: <kasan-dev@googlegroups.com>
Cc: <linux-arm-kernel@lists.infradead.org>
Signed-off-by: Neeraj Upadhyay (AMD) <neeraj.upadhyay@kernel.org>
---
 tools/testing/selftests/rcutorture/bin/torture.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rcutorture/bin/torture.sh b/tools/testing/selftests/rcutorture/bin/torture.sh
index 25847042e30e..420c551b824b 100755
--- a/tools/testing/selftests/rcutorture/bin/torture.sh
+++ b/tools/testing/selftests/rcutorture/bin/torture.sh
@@ -313,6 +313,13 @@ then
 	do_scftorture=no
 fi
 
+# CONFIG_EXPERT=y is currently required for arm64 KCSAN runs.
+kcsan_expert=
+if test "${thisarch}" = aarch64
+then
+	kcsan_expert="CONFIG_EXPERT=y"
+fi
+
 touch $T/failures
 touch $T/successes
 
@@ -392,7 +399,7 @@ function torture_set {
 		then
 			chk_rdr_state="CONFIG_RCU_TORTURE_TEST_CHK_RDR_STATE=y"
 		fi
-		torture_one "$@" --kconfig "CONFIG_DEBUG_LOCK_ALLOC=y CONFIG_PROVE_LOCKING=y ${chk_rdr_state}" $kcsan_kmake_tag $cur_kcsan_kmake_args --kcsan
+		torture_one "$@" --kconfig "CONFIG_DEBUG_LOCK_ALLOC=y CONFIG_PROVE_LOCKING=y ${kcsan_expert} ${chk_rdr_state}" $kcsan_kmake_tag $cur_kcsan_kmake_args --kcsan
 		mv $T/last-resdir $T/last-resdir-kcsan || :
 	fi
 }
-- 
2.40.1


