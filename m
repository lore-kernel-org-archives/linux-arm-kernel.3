Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE787CE7B1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHbOf6w5rlj656BCFSOxLzgqhHO7ycdTLJssDuPvEBo=; b=XjnvuY3cQG7PLTPde933nA2ZO+
	lhcA7PCVSfD7aJuHXBkamrc3iZAd9tvgWbBzrDhNKNSIXLc9zwyKzJI5qhI8K6tzHE4VcFXQapcfz
	Bn7ONqidiKecRYtwfT9sDlvCoQaF10hkL8DEmM+xd1WUnUv0znUQzL+SIsaoXYtXZA+5RCW+Gaaej
	Ta9SjK5CmkRpgnGUtH68FZ/eA2beThxQIikoBZonpkx5nAJFycs5GkqFdC+c3Za0GOVZwAm+CMJHQ
	6ACikBpLCtQPU1SuGZCqU+501HsIHFf+Bj6/EaGoaGFKTQzMCft02/cdyRp2Vyukr7rZRVtFn2LTD
	NnK/cZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvYZ-0000000CVZS-38UY;
	Fri, 14 Nov 2025 15:17:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvYX-0000000CVXl-3rEk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YHbOf6w5rlj656BCFSOxLzgqhHO7ycdTLJssDuPvEBo=; b=gwtnZJGSx5iAv92mHM68Bk8xaD
	8DsbAEJf3HohptjTLAwjaQHNkN8S3CpNtALURu9SYXCi4Gtpq2KV5SBLXWra3oV9+Iq0ScgrHYGR6
	dVLAm715cz+fqH4VvMUvKVNDGRX/qW+QqHVLR2OoulfOWQ2OUeCxKWknoNwtn60PmyW0QVzn+1j4u
	WLZAy1dNRCdFYP6ZZznLjlDd2yK5snW79CS1Jp+Q25wPDLwAZpeDIinburfWCmkpr8bk3iXYGj33m
	jbydxULjnrYEyYgIJhv7FNuDe6H0NXkbT+UYIu4who9KE+wzZLA6LUnXZzvndO1Tw/SEOVQnWoNd+
	ZtJN5CaQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJugq-00000002nHQ-13jD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHbOf6w5rlj656BCFSOxLzgqhHO7ycdTLJssDuPvEBo=;
	b=iirRmPEn5keefa8xiA70bhb7vKhUlus6LpLEwZW0Q2Yg1Hf0BFVcimm6w/TapkVf71m17e
	/ehTR7M1CVl5xFR6Be/I0lt0PKj12ofuiykppIZ4HaQqqxl6H6wjGf8kuiMqlMg2CP7H+U
	pK/ugHJRf7UmwO9AIj8AyS6RRqWDDmQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHbOf6w5rlj656BCFSOxLzgqhHO7ycdTLJssDuPvEBo=;
	b=evrrEUR5NVHn+ukFbam5BNmM2tiY4yDz16ZImRoRct50GfQdZRj7Ux3n8DFRY6Zi6uo8pI
	swMTEw2RcQs1RrkVRB2NisLhhbvU5GcJtfoQ5UdqmzjPTPL8yhBfP9bHr+IOXkzpkHuKz3
	4PNktAxc73GWtDoLJeqNdn9WNJUIxBI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-531--Ii0M5UDM1-LvTUINdpoDg-1; Fri,
 14 Nov 2025 10:17:37 -0500
X-MC-Unique: -Ii0M5UDM1-LvTUINdpoDg-1
X-Mimecast-MFC-AGG-ID: -Ii0M5UDM1-LvTUINdpoDg_1763133453
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DC7C1956096;
	Fri, 14 Nov 2025 15:17:33 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A94EB180049F;
	Fri, 14 Nov 2025 15:17:18 +0000 (UTC)
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
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [RFC PATCH v7 31/31] x86/entry: Add an option to coalesce TLB flushes
Date: Fri, 14 Nov 2025 16:14:28 +0100
Message-ID: <20251114151428.1064524-11-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_142216_433446_E6C9759E 
X-CRM114-Status: GOOD (  17.80  )
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

Previous patches have introduced a mechanism to prevent kernel text updates
from inducing interference on isolated CPUs. A similar action is required
for kernel-range TLB flushes in order to silence the biggest remaining
cause of isolated CPU IPI interference.

These flushes are mostly caused by vmalloc manipulations - e.g. on x86 with
CONFIG_VMAP_STACK, spawning enough processes will easily trigger
flushes. Unfortunately, the newly added context_tracking IPI deferral
mechanism cannot be leveraged for TLB flushes, as the deferred work would
be executed too late. Consider the following execution flow:

  <userspace>

  !interrupt!

  SWITCH_TO_KERNEL_CR3 // vmalloc range becomes accessible

  idtentry_func_foo()
    irqentry_enter()
      irqentry_enter_from_user_mode()
	enter_from_user_mode()
	  [...]
	    ct_kernel_enter_state()
	      ct_work_flush() // deferred flush would be done here

Since there is no sane way to assert no stale entry is accessed during
kernel entry, any code executed between SWITCH_TO_KERNEL_CR3 and
ct_work_flush() is at risk of accessing a stale entry. Dave had suggested
hacking up something within SWITCH_TO_KERNEL_CR3 itself, which is what has
been implemented in the previous patches.

Make kernel-range TLB flush deferral available via CONFIG_COALESCE_TLBI.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/Kconfig | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fa9229c0e0939..04f9d6496bbbc 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2189,6 +2189,23 @@ config ADDRESS_MASKING
	  The capability can be used for efficient address sanitizers (ASAN)
	  implementation and for optimizations in JITs.

+config COALESCE_TLBI
+       def_bool n
+       prompt "Coalesce kernel TLB flushes for NOHZ-full CPUs"
+       depends on X86_64 && MITIGATION_PAGE_TABLE_ISOLATION && NO_HZ_FULL
+       help
+	 TLB flushes for kernel addresses can lead to IPIs being sent to
+	 NOHZ-full CPUs, thus kicking them out of userspace.
+
+	 This option coalesces kernel-range TLB flushes for NOHZ-full CPUs into
+	 a single flush executed at kernel entry, right after switching to the
+	 kernel page table. Note that this flush is unconditionnal, even if no
+	 remote flush was issued during the previous userspace execution window.
+
+	 This obviously makes the user->kernel transition overhead even worse.
+
+	 If unsure, say N.
+
 config HOTPLUG_CPU
	def_bool y
	depends on SMP
--
2.51.0


