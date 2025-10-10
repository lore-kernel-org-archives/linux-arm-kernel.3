Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391AECCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c85HG9M5FnMNKHSoA3zkMZkmQw264GRYsrTXaruk+rY=; b=k/fRtBMlR0hRgyASB1h5lvTjBJ
	LASQnC15ZyMysUp3vFGi5qiXLpyfzwgjBwwbsELPrkSZ+nK79KqMt7eHIRKoNEkoF0U08Gjjr4Bxo
	PTDrnQKeIeHyIINaJT1VYN+ZsVbgzg+TswPdPwdmyO6oc/0tOB5nqZ8vI24z4uz0dZA6k9NULD/id
	T4mM0Tb2wNFvvQanjxclOdnWEcYRBpVXs3CWOsCKYVOHl3uqgjnfwfuelF1Lvx3ulo9sHHZVbUkVk
	9R7hhu8slcyW8jSD7wMtR3ql9NbmAmk0ivjglVfyyeTNKmI/T+uqWRAJyfLvzfewubowJrsK3V4M9
	6u6Cy4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FHx-00000008reH-0eyJ;
	Fri, 10 Oct 2025 15:44:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FHv-00000008rcF-1W56
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=c85HG9M5FnMNKHSoA3zkMZkmQw264GRYsrTXaruk+rY=; b=jtcGC5UFaigMcuvKX3AtHR4UjQ
	n76h4gEq2uB8W59xPjGURtrK2rW3ON3Qq1CDPRlcvDiJkh8IUK2e8leijpV8lqwhifg56Jo/+jzfx
	3/2aO/GqxZ1lb/8XZsTTQCVkQ/7nXiZKn7kKmXVOT9RNHIgate+O2Z5ljVMVyAWtkGV1HG8adknXD
	GUWrHN3gSUh3bb2Up6fKjEqfQoXU02oHnKXMfvD6OZul4XZHSX/XfPP1x8XeLNUetL8wRKJujZ900
	/NMCIrW2fOAc8Y/skUGP8nJdH4Kd0yll4/uHvNm8M7PFpnDBGEDMvQtzzuTqUjk7zVLwGbqaYTL6i
	jtG+DUNA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FHs-00000002Em2-0MlR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c85HG9M5FnMNKHSoA3zkMZkmQw264GRYsrTXaruk+rY=;
	b=X5Ju+qwHUhC57QQbizjmQgvSBzNeCBiVhgclbUUrbU301VUdBm2AcXRCdU7neaE9Gj0hCO
	sBu3cJNWC1VKyOfQCob5RfsoMkEhtn/jyKbhWEXD1ckiWOI9z/Vf6zBOsgPRaGEuOo1yAN
	8PMLy1wjHDhDLhT0R5yOXtKzN85OiGU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c85HG9M5FnMNKHSoA3zkMZkmQw264GRYsrTXaruk+rY=;
	b=S3hGOhrcuQgraSRbRo7obC5DUzCrdNTAuHd8lzTnV4wT+aIcvyqm2N8hY0X9y6mm+qq9pf
	YVZFxFZZCQZ39LcjOT67bd1bry5ysMmwIpp+OA0SxHmA/FiPPwX455YTuNoARD+1Kc2c8/
	wBPK4f/GhxcEPLMyBvrIqEZpet6mKME=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-244-WHaa5xPLOOOfBTTf7Rya5g-1; Fri,
 10 Oct 2025 11:42:39 -0400
X-MC-Unique: WHaa5xPLOOOfBTTf7Rya5g-1
X-Mimecast-MFC-AGG-ID: WHaa5xPLOOOfBTTf7Rya5g_1760110955
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4B991800447;
	Fri, 10 Oct 2025 15:42:34 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CFA21800576;
	Fri, 10 Oct 2025 15:42:19 +0000 (UTC)
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
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
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
Subject: [PATCH v6 07/29] x86/paravirt: Mark pv_sched_clock static call as __ro_after_init
Date: Fri, 10 Oct 2025 17:38:17 +0200
Message-ID: <20251010153839.151763-8-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164408_451594_F05D3CF9 
X-CRM114-Status: GOOD (  14.30  )
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

Later commits will cause objtool to warn about static calls being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

pv_sched_clock is updated in:
o __init vmware_paravirt_ops_setup()
o __init xen_init_time_common()
o kvm_sched_clock_init() <- __init kvmclock_init()
o hv_setup_sched_clock() <- __init hv_init_tsc_clocksource()

IOW purely init context, and can thus be marked as __ro_after_init.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/kernel/paravirt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index ab3e172dcc693..34b6fa3fcc045 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -69,7 +69,7 @@ static u64 native_steal_clock(int cpu)
 }
 
 DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
-DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
+DEFINE_STATIC_CALL_RO(pv_sched_clock, native_sched_clock);
 
 void paravirt_set_sched_clock(u64 (*func)(void))
 {
-- 
2.51.0


