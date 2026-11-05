Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE8F606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4AbXz0Sj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlAnTUHC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qE1tq1rr4cEJpbwdtqUsfVIbjxrmUGUzpJ4okWtgjys=; b=4AbXz0SjKgfk8q
	lUwnMm5MZOsOPp2W1lSNBr5aba/6674H8or6Fi6v6eSYesbKDoC0WBdz6hy70iTgzUKIwl+wIPhj8
	a/+ai7QAg9iS1QugnFZ07zqDIrL9ftAXcgK2WZ65C9J+MXYwebZxxI1jinOrzD5oBzz0FuAwW6noW
	qMXdo9/1i/kyMFEfip91f4fkl1na7/vNndH8CHMclyrSVo/8lfk4p70H4zNKAR30wj9HWMnjK4WCO
	32APOgJoSMur+lRjMwKv8TT1pkfcqRnzhGe0oR2Uj+SdTIDUHstOdqNkKdk7k92SAjitQMGKrw6mz
	yNxJr4ldDTg2GkdRJctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0PB-00000009e4A-0w2S;
	Thu, 05 Nov 2026 16:33:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Oq-00000009dxr-3M7v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 16:33:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8765B43AB8;
	Thu,  5 Nov 2026 16:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E120E1F000C1;
	Thu,  5 Nov 2026 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896396;
	bh=qE1tq1rr4cEJpbwdtqUsfVIbjxrmUGUzpJ4okWtgjys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mlAnTUHC6GJYDGMliPGljXkCD9ZKMtZePBL3it1C+V7h24jrGjNfZ+q9k4OhE+xBE
	 0YcxgiYEDXXoIYqFGm+SNuiJ47x20TvhfkK3az6+7w7MdV1Kz0cLIOUlfh1wPL5haN
	 Rc+vUSxwJjrLuaKC3GPiVOunqT0+4LB2vezk+hBOr7YgotQasQW003edDJsxWeTvo+
	 tMpQbKmyn+LTxVPRYvt4Dz1kZc9JDrhThtDrK6fht6yn8gR41SSzv7BejXWbteVCuV
	 FwCzwfnCcDtRnz6Hsn17ZTWUrmc8wkF5oalI49lZgPQPodr49szTu1ZU58l8+JzM7o
	 qwtgGAO4+82GQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 47/47] ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:45 +0100
Message-ID: <20261105163045.38862-48-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The cache readahead can be globally disabled while the other CPUs are
running.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 995b235da733..b6d7a8e70fe5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_X86_TBOOT_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ONLINE);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_X86_TBOOT_DYING);
+	WARN_ON(st->state != CPUHP_AP_ONLINE);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


