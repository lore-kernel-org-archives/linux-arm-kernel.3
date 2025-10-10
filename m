Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C8FCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DO8qqKK4diXeF6daiShABtCSRiMA8DgEa8+UbYALx88=; b=v4+yNYd+oP4NlZ2EQrN+d1YKeA
	a8PfHgJkq4Ah+NaMuYL3ZnbdMj16ZMCfaG3SLJkHTZ0b0xd0+ZSEwbkAL096sX4suY65xi/PfRySz
	q8h+QkVMp5oWue8z6oAUspUYUdtWyeZgRAe+UMUzPZMTIg57gSOkO/DTB0/Cs9w8ieJS4VyPbhrGe
	ciWRs0cFo68yjPhxxW5XcfCJjLJKM2HfcCGe2fJ0Apy4GwmuIyDBajbjpSR60NI8F6v2+kUvk4dn2
	iRVil+YYVcLKhNMJ4PqZqc0gn22ZeZISYZf6u5OXn+Oz0TepWLCRjSGqhE8pE29UcP0Itxdgs0dEi
	cz/DrDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIH-00000008rxZ-2xTC;
	Fri, 10 Oct 2025 15:44:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIG-00000008rvp-1h6j
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DO8qqKK4diXeF6daiShABtCSRiMA8DgEa8+UbYALx88=; b=RTHEZ3p1zDOVn0NipCZqopJdmd
	b3IvvEcOIikb2FA77BBjQbzkVt3lWbaWoWOmqzR9U5J+tQksSYZEFWnM4LX84IWsxwFk49EfPsJmR
	d4Rs3dgofWrw/pVpz3YigA2KxeygiCK4O5qCFWqrladJGTEPJlAxqNg8SOmRTmYKaW1RLnyhBqWMv
	WOkiJ8MZ/h9ne0vxWQ4jVJ8VEBF/gSUp2Af1v4YciPflUCOTzNK34rxdGx3njanR/3B//6zM964HV
	h1CoTP5ivLBpatLlZgTHJP0JTmhQ8xjXdA3w1tDDBZQaTweaXPlCf1jhk0AoJhK6OMB2+9jj5NA/n
	WHxkMhDQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIC-00000002EsL-3kSo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DO8qqKK4diXeF6daiShABtCSRiMA8DgEa8+UbYALx88=;
	b=AfDCMV8BH1bof1dXHNG755J3DP+OEhabmMaqrEXwBMkMMb87qethz5fU/NjbKQXeSdoArA
	MOqYzCwrx74UkGNgok8CKJm7GMOy6YPlqvPTA2PIwQzd6iuFszk2a24rnRDZsC7XdANo1m
	s9Tv84pxl9vojnePLjuEXUiXN+WDBlE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DO8qqKK4diXeF6daiShABtCSRiMA8DgEa8+UbYALx88=;
	b=SeMQa9+UpOFNDUqS/62w/F6p0E7FsCLGgD0YICFGEfI86FglnFj0WGuhZ5DYxDfaxxxw9T
	EBC3i2eXvClp+F15ayhwphuDkV5z2KoD4r88/tJiHTY5GV+jhd3TL/2Ea/XAlTGP4iXLVC
	u8vhbN2M72QREZyBb7YOukILFRWggjU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-m4LwkMHWNBWbZvkPqwP3rA-1; Fri,
 10 Oct 2025 11:43:03 -0400
X-MC-Unique: m4LwkMHWNBWbZvkPqwP3rA-1
X-Mimecast-MFC-AGG-ID: m4LwkMHWNBWbZvkPqwP3rA_1760110970
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A8A1B19560B5;
	Fri, 10 Oct 2025 15:42:50 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81AC41801AD8;
	Fri, 10 Oct 2025 15:42:35 +0000 (UTC)
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
Subject: [PATCH v6 08/29] x86/idle: Mark x86_idle static call as __ro_after_init
Date: Fri, 10 Oct 2025 17:38:18 +0200
Message-ID: <20251010153839.151763-9-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164429_216602_C9403EE5 
X-CRM114-Status: GOOD (  14.14  )
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

x86_idle is updated in:
o xen_set_default_idle() <- __init xen_arch_setup()
o __init select_idle_routine()

IOW purely init context, and can thus be marked as __ro_after_init.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 1b7960cf6eb0c..1c2669d9b0396 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -761,7 +761,7 @@ void __cpuidle default_idle(void)
 EXPORT_SYMBOL(default_idle);
 #endif
 
-DEFINE_STATIC_CALL_NULL(x86_idle, default_idle);
+DEFINE_STATIC_CALL_NULL_RO(x86_idle, default_idle);
 
 static bool x86_idle_set(void)
 {
-- 
2.51.0


