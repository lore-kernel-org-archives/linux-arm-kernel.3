Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D87ECE8D40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oVSattGET5cairz4pLrVIWMCsCMvZMhD6IO+zCvSIQ=; b=ptf6VZMc/XdGAvkevtWIxvkosQ
	AvMBQhd3a336dpblw7TmuoYR5FlXgUKXL1XQag4lDjX+WvcASSq5YCLE39SScy5bTzrUBSAfFT8fx
	sT7rw4nqV6GIJz8/7Yt48rCAz48YwxjhoNpoJD1O0QlCr+5IVuTKBKmCpbbxY6ySSpo3JxpZJD617
	6+IvrMB6cLBQjz3H4n1nhgPbMCMrUpKcakIzdPSyCu9tx7y6eeJqkYtKLdPi4HFLtpBYerjbteFxN
	DuVjzPGSAqQH+59OA/1OLSU0PN6p5TNoNnV0grgYAzqn5MMRunH2hEAsi6hxEU+d07342m7t856YA
	dFiBFvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvLk-0000000CQnz-3g09;
	Fri, 14 Nov 2025 15:04:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvLj-0000000CQmR-1YNA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2oVSattGET5cairz4pLrVIWMCsCMvZMhD6IO+zCvSIQ=; b=HD54boKFJY88HIk6Qh9vgKCZdD
	H/+gbuY8Ap/pesTJd9qv3IWuQCdYxwPSyB2t8xAh9rzg3ZtMqQ0d0Uk1nLdR6JLFjHCs9/oHKwosF
	QHf1hFi1IyZwxlVQTlyY7GZZHwxAZ7gJHFRkjHeK/JoHNKnQaNEILqXJD3ZYwxRXx72tVspbmEuNg
	YuR4f8XlpZ3/l6kf1wcq4X+nbOLOQGU8c/Ni+lMWGbMh06ZyTrlwMajVzJYVsIP4TyAXOPMBP3cV0
	waoInFUheXKrG2c8qH0hrHMUKGWuO8lew5BEaAhI/URN9UeGevnshJGhWOjax2RYMzd/NzZNNdhMb
	g4+aBHzw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuU1-00000002l2s-1ukG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2oVSattGET5cairz4pLrVIWMCsCMvZMhD6IO+zCvSIQ=;
	b=ZWnYMe936yfmj209TMdNQO45G4mOxOkz7NtgQqtZoqyrqmu0kkXUWG7WSJoIO4uAcpZcAG
	12kMgiTGh5vViN83OVHBnZK7aYs/qGp4It+I7iDi2paJfZN8/Dh7ACfoIZjOVY8YULVLal
	KwWxuq4gJjzXurjSsZqa4ghKELO/owk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2oVSattGET5cairz4pLrVIWMCsCMvZMhD6IO+zCvSIQ=;
	b=ZWnYMe936yfmj209TMdNQO45G4mOxOkz7NtgQqtZoqyrqmu0kkXUWG7WSJoIO4uAcpZcAG
	12kMgiTGh5vViN83OVHBnZK7aYs/qGp4It+I7iDi2paJfZN8/Dh7ACfoIZjOVY8YULVLal
	KwWxuq4gJjzXurjSsZqa4ghKELO/owk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-hJJuaX7AOP2PLODmDdPtew-1; Fri,
 14 Nov 2025 10:04:23 -0500
X-MC-Unique: hJJuaX7AOP2PLODmDdPtew-1
X-Mimecast-MFC-AGG-ID: hJJuaX7AOP2PLODmDdPtew_1763132659
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DAFDE1800342;
	Fri, 14 Nov 2025 15:04:18 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F2E71956046;
	Fri, 14 Nov 2025 15:04:05 +0000 (UTC)
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
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v7 08/31] x86/idle: Mark x86_idle static call as __ro_after_init
Date: Fri, 14 Nov 2025 16:01:10 +0100
Message-ID: <20251114150133.1056710-9-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_140901_625052_2A646FCE 
X-CRM114-Status: GOOD (  13.67  )
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
index 4c718f8adc592..4f0c1868d43d9 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -771,7 +771,7 @@ void __cpuidle default_idle(void)
 EXPORT_SYMBOL(default_idle);
 #endif
 
-DEFINE_STATIC_CALL_NULL(x86_idle, default_idle);
+DEFINE_STATIC_CALL_NULL_RO(x86_idle, default_idle);
 
 static bool x86_idle_set(void)
 {
-- 
2.51.0


