Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0A86082BCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DLIjRKAs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BVFLYV/5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WUkJ/uQyix+oaAX0W/w8dGkL1c+RWgUGocv4iOBMsfE=; b=DLIjRKAsI5kCW1
	tDdT5nZZYyQbuc05Nmg9gNWGwlsx8cZ9GOj3M4GoKYPPGwA8gtRa/zfcuDSsOCv7kfmj1qr/hm+xC
	rP0JN8VnVqlALaS7uVWjIgowPc9iWtfQ1h4AlsOcqtR/sFtRYHEg301LNYtsR+QGsjbjXjp77+ZC8
	jYjzEenXAHmWNejCsD3UQblqqlKSZ7V/ltcFAluTwyftKv+mMM2PzTsRnH+amR2HqZwRnvFwBnMme
	aYrVxIb3RYvwnn/09c1IG/AVqqKS3ANLVgtDIbwG9qAIIQ/p7imdzmR+Ng85AC4XaY987zrmDopR9
	kLfvrOgxEVGO5nHVfbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0N7-00000009cZE-1U6E;
	Thu, 05 Nov 2026 16:31:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Mu-00000009cT7-32VO;
	Thu, 05 Nov 2026 16:31:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27D6860621;
	Thu,  5 Nov 2026 16:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D3B1F00919;
	Thu,  5 Nov 2026 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896275;
	bh=WUkJ/uQyix+oaAX0W/w8dGkL1c+RWgUGocv4iOBMsfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BVFLYV/5xpdSR2YRfexITn/DydKF70LjKU++q5lqqF/G9DMhsRr5stOMuLQlIITvU
	 ouFbtqN+g8f2eQ3Str2ulruziZOsDYZ1rWGRq1ddRu3e/lOwfBKPcliDEIW4ASsKz5
	 xzTd4CD1dUd7RRE8wsIGp28RnNRmNCXORVHWglTgB1GIcNgFWioZ/DXsxKbrXRQmiJ
	 85kD8TORkP2M+odDS18MRRo6e67kLMRA8jXzTSlqWQA4eo7b24+TU4C816lTFkuBPx
	 sZxE2TUiLvItX0TWKIVyE1tbteMIcEtdxITcjXdkx/pw34Ie+eOJTAenFkUmtZVaAb
	 PRYS2DufiRDAA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 07/47] irqchip/bcm2836: Move CPUHP_AP_IRQ_BCM2836_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:05 +0100
Message-ID: <20261105163045.38862-8-frederic@kernel.org>
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

The teardown callback here just masks the per-cpu IRQ in the chip and
shouldn't race with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index cb0eb71c27c9..2e162425bfc7 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ARMADA_XP_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_BCM2836_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_ARMADA_XP_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_BCM2836_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


