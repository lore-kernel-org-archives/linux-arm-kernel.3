Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A6E606D700
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3gffPHj1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UyZtP/2i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b460Q3cwnl04EHCg8MutI2uS9sgGHru84RfF/i2AAKA=; b=3gffPHj16TruDs
	W2K2rAsVF8s5XjetN/XI+oeqUb7C+NKAapbashGuiCaa8uW2f956VC93iV2sWxBhq6+NZrt3gBnj+
	6uUyEee/ExfCSumfRnyWKranTzBVL46t2W7mnZpbW0GErBbTO/8m3lqvvu197My0ReGArwFvLRspc
	jjQinYXwek+heQq8wShJleKcvlPoqM3HzAvxTVXCsYUa97yLF+ekwPXXINVE3mvP1ezs4UWjQFxWi
	ntlAnEgoD66msrXBqK+2kNC2gXngI7o0GXt6dlsOa2yLGLngP7Htvbx7zIvKkOT1ZM/khwAmhomNz
	Mcii7lUmZTV2jPDYOSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0OE-00000009dRy-39K5;
	Thu, 05 Nov 2026 16:32:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Nw-00000009d8c-3NS9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 16:32:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 376D4609FE;
	Thu,  5 Nov 2026 16:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41981F00919;
	Thu,  5 Nov 2026 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896339;
	bh=b460Q3cwnl04EHCg8MutI2uS9sgGHru84RfF/i2AAKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UyZtP/2if2EtBCr0hvwUtvmhrbOiwo50jhs1QAMhe0u0drleGnIFma1sgbIeTwunH
	 +EUDfuSgPv89WmLqSRnXcN6YTFfMqVSOTmZjuJFsFEDFGyZCMOGr7B/g5T2BRtd+Qg
	 16yB78OWIe4qreWQQIl/F2nlPBgQ05eqBeOMAtFWqeUYPdLfqyHrC3GVCH7bGxOib/
	 ILLCCJ7zf819IAGUWDACxaDoDSk7lDflp7TN8OE3aeYqySGQqLnH1aIg3XY8X4QOKn
	 BKpugwQBduNmMD8lJi/2RR8x3B6mlhc5q/pQAqXataEAYI6SaOMuxR/Rsseyy+xpKM
	 4s5698hNaTHIg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 27/47] ARM: smp_twd: Move CPUHP_AP_ARM_TWD_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:25 +0100
Message-ID: <20261105163045.38862-28-frederic@kernel.org>
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
index 38d60ddc166a..d7a6dcb14885 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_JCORE_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_TWD_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_JCORE_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_TWD_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


