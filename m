Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AFB606BF36
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=47k+4zyu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUxR6E4v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x9LP6CXivlT650CDHPY2LNyMQwhkNHnjZr4UOIbAV+Y=; b=47k+4zyuySCQD3
	dLu8xT7gom+IRAZgrJsSGGbHhDnZf5S8HiQteTH2aiDgFDyEDvdlzMru/pY7zLXe9FWY06PLgkkzY
	6toEyC5Cyjx5PJ4qdoqKbqbHrTmrDFCS+GMNVAkYtzwUkTgOGWo2K7/wS2QrvLw4ZtBTRv/HD0ZNl
	yOStCc/cCMYW3IBGZimLrvgwWzdFFQ0Ybz1zxEn1e4PY1kzSVh5JXotSBTe77nVS4tSRYYKwjX+Ox
	nsU0rifz+F8btqOp2gECYjkjnYXypnIU1T14zZDgcMcLSGSmBZIE/v11cgW9nSKKJqAathhSuWfW0
	vgkG6IhplPrcjBhce8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0O4-00000009dH6-0qT5;
	Thu, 05 Nov 2026 16:32:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Nr-00000009d5O-3fwD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 16:32:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 299A3609FF;
	Thu,  5 Nov 2026 16:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830281F00A02;
	Thu,  5 Nov 2026 16:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896334;
	bh=x9LP6CXivlT650CDHPY2LNyMQwhkNHnjZr4UOIbAV+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BUxR6E4vRBW3eyixM5PsFYHh4FFjOkAAnNJSfvyEKvilcdL21r0IBYDrzS4JHHpmA
	 OLxI7wmY0YztOB6kMK0fiojVtGzbcBeKPZdV0AjUo+265Xt0gEKsyAFnr1ZzGuIFPF
	 QUigmCyDd9Py6lHXbrGHaJdGNx3Gr4Z3zEyCGXeMcyEDRSv+mMcMwUatVn5Z/sLvEj
	 Vg3jH/53ZS7xf7O91QTNlOM98SmNTGiQ0peKWKcUJstesJ1LuyJ7MlDNzRbHD572MI
	 RkWOV8GoEP9USzQofJ1OPbOIGYKvgkf/0W6MUl0Ylb7YEhho7N7uwdWzkbphzl2R6U
	 6yZU7m9Qkqfgg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 25/47] clocksource/drivers/arm_global_timer: Move CPUHP_AP_ARM_GLOBAL_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:23 +0100
Message-ID: <20261105163045.38862-26-frederic@kernel.org>
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

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 6f4c609163e5..d980d11abf27 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


