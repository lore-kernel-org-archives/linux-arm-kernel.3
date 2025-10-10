Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EA1CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1F5Hxk9Mh6e5UiSiQQtZ6dU5HQkdaz+pE8DP+qaty64=; b=bOiQ0tb1FCHRqkbNde7l81GfOT
	MZcH/d3ZPOlNswCgJqQj0qnJMOcBJoXqdhgPmk9jKgFQH5ngOuyBDhf7ggmPDx3xz1V6vIGKR3REY
	QpYdY7jo5ZUw45jKzIrRpaUFOLGuQHa0USHPCmH55C5TDKULmeTX96WJmgiEr9WqYKsdQQvuJhLGo
	dqEPB/dNRSPC0RfEpB7TKWayNyKPmC3SeHkMvgtfgTSnJwzWPsVUmgymIsWxvuBBWFl26XQytwRY3
	GHTpZ6J8q402tA3MgAE4RjXpZf8JG4N+QwS1O78Ei6/ICSCm2uvegPDbcCs2aMK52SppuEy5/V0ts
	gP01NCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FHC-00000008rDK-2K3H;
	Fri, 10 Oct 2025 15:43:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FHA-00000008rCj-2aYn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1F5Hxk9Mh6e5UiSiQQtZ6dU5HQkdaz+pE8DP+qaty64=; b=Lb3u3JltixtAWYSaKjLdXbSoCh
	OBy/l4r/8nePsnmCCV+F/iRqqXmF8whyjznddlvkGP+zdPkqDLfPJxPK2js3wCrUO62xcZhJi0oqN
	t2rSB34N21EHzW22Vxnock16+5gggbKMffelh7ZwtusUsJd+3d5pEw7e/AJGuF5V6xeV93Lm/nbTS
	djnOEdehZK8y3OJrAtcm28u6BmFx5xXjW+WI8q9v5Uk7gOEkGMBnQUphIcOcdvbNQGbx/TvLol6Uy
	sSmCNLs1R4xpc2tTCgUPo4YPMvxw0G2E/ASOz8JYN9BFjw82LFyTwbvYhzoKDASNQ4VEuQwAq2f9Y
	CmTItyGg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FH5-00000002EVW-2fRO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760110997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1F5Hxk9Mh6e5UiSiQQtZ6dU5HQkdaz+pE8DP+qaty64=;
	b=ir1rRDVjW65x9IpJh/Uf1G+2IKtlNCKX6/Ytf70AdOdW6P6ZHooMFQwxeYYtqN87VWCgwy
	IX2z18AFpzEBWfT+22hyX+IRa4ZjmGn1BhwXTE10Ll5I6Rofo9zeA5cLCe5e4kzkMTO6L3
	MjfGBIDj22ere44cN4bVwydfFq6hjZY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760110997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1F5Hxk9Mh6e5UiSiQQtZ6dU5HQkdaz+pE8DP+qaty64=;
	b=ir1rRDVjW65x9IpJh/Uf1G+2IKtlNCKX6/Ytf70AdOdW6P6ZHooMFQwxeYYtqN87VWCgwy
	IX2z18AFpzEBWfT+22hyX+IRa4ZjmGn1BhwXTE10Ll5I6Rofo9zeA5cLCe5e4kzkMTO6L3
	MjfGBIDj22ere44cN4bVwydfFq6hjZY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-AOZGRuQIPCu19cfaiiylOw-1; Fri,
 10 Oct 2025 11:43:12 -0400
X-MC-Unique: AOZGRuQIPCu19cfaiiylOw-1
X-Mimecast-MFC-AGG-ID: AOZGRuQIPCu19cfaiiylOw_1760110986
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D97D19560AA;
	Fri, 10 Oct 2025 15:43:06 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F4231800576;
	Fri, 10 Oct 2025 15:42:50 +0000 (UTC)
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
Subject: [PATCH v6 09/29] x86/paravirt: Mark pv_steal_clock static call as __ro_after_init
Date: Fri, 10 Oct 2025 17:38:19 +0200
Message-ID: <20251010153839.151763-10-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164319_836068_23F33A37 
X-CRM114-Status: GOOD (  13.97  )
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

The static call is only ever updated in

  __init pv_time_init()
  __init xen_init_time_common()
  __init vmware_paravirt_ops_setup()
  __init xen_time_setup_guest(

so mark it appropriately as __ro_after_init.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/kernel/paravirt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 34b6fa3fcc045..f320a9617b1d6 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -68,7 +68,7 @@ static u64 native_steal_clock(int cpu)
 	return 0;
 }
 
-DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
+DEFINE_STATIC_CALL_RO(pv_steal_clock, native_steal_clock);
 DEFINE_STATIC_CALL_RO(pv_sched_clock, native_sched_clock);
 
 void paravirt_set_sched_clock(u64 (*func)(void))
-- 
2.51.0


