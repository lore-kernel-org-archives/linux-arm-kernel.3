Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612FFCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5bTE2UFDn4FhRjqFPlcPPiaXyzSIXCKwLwP8uiIlgI=; b=hcZaWv7r/7IR6DZQjgeyb9uDQT
	S+p43RaYA97wNWD5yTRjENABLDgSks5pA8N6I3UMnLflgTJFcJYgyHMgaqnFrDZLiMey4bksyO02w
	jejMfF+8TFpYUCXs3D1+tI7yatuORc3xShvNe8cwfdXQ7BckQ+SamdlKxXwhpKnxYhPmV4ijlHtrK
	oHd5PWvCdpl+53+/tepiqZ9L2vaxQ4cADze91ue5G26w8BGVu/w4zOih1YaMqylsy7WYUbIvSYu/w
	vBjgj6D0EcMO25ygXdL2ROnK6Nw+FE/CArzGXGWMNNBQjVQORDmZQKWD0DxVXK9KUvbTbmsPyo621
	m/w/gsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIe-00000008sLs-1b8C;
	Fri, 10 Oct 2025 15:44:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIc-00000008sJk-3sxy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s5bTE2UFDn4FhRjqFPlcPPiaXyzSIXCKwLwP8uiIlgI=; b=p/uwWJDTX6FOfQjZV6iYIA+9Fs
	hJCUUcj9tP1LpA6Xcpsi291vfWtND2/T/ilogscwPLaxMyHcnEHZbNShzEngUhkp2LPTjnFNaEiq7
	wr82+k0LsfA/phVJSNiVx4nsNUano0eE63a8b3MqiLzPtOD0cdNaotZ4o9lddei09IiYuwvehYM+M
	wI2DnJCxIN0jVj2zLFTwV4hRALO1YTs7Y+Neqp4Gdz+LZvbWVigoms3MwDTPaBnjfvC2ygDSbxx28
	cnumNP/X+LNtK2pbDNO+tyQSd9KR/RwY1FXfQZrBCuqnrODLdVMSmtwXufmrd3d8jmpVqaoR7e1k2
	mQs6UZww==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIY-00000002Eyx-3Ld1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s5bTE2UFDn4FhRjqFPlcPPiaXyzSIXCKwLwP8uiIlgI=;
	b=dsuX1LoSVuwOPfDItSebt/z7uGHeIRmYmdu2C2lgf7lUQZxOT+sOUR4WS4P/MItq3KWtEt
	xp3x+n+v9MaX4mCWWB/c6q+FWOWzq59qVg2S54FQHIRvG801R5yFcSwpHF2WjLBOixbEt6
	m2okf/N63r58M1k5CuUIYxCV4Bbr5zI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s5bTE2UFDn4FhRjqFPlcPPiaXyzSIXCKwLwP8uiIlgI=;
	b=dsuX1LoSVuwOPfDItSebt/z7uGHeIRmYmdu2C2lgf7lUQZxOT+sOUR4WS4P/MItq3KWtEt
	xp3x+n+v9MaX4mCWWB/c6q+FWOWzq59qVg2S54FQHIRvG801R5yFcSwpHF2WjLBOixbEt6
	m2okf/N63r58M1k5CuUIYxCV4Bbr5zI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-26-35CwgeqANnqyTiiCVHZwvA-1; Fri,
 10 Oct 2025 11:44:44 -0400
X-MC-Unique: 35CwgeqANnqyTiiCVHZwvA-1
X-Mimecast-MFC-AGG-ID: 35CwgeqANnqyTiiCVHZwvA_1760111080
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BFACA1800562;
	Fri, 10 Oct 2025 15:44:39 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB6231800578;
	Fri, 10 Oct 2025 15:44:24 +0000 (UTC)
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
Subject: [PATCH v6 15/29] sched/clock: Mark sched_clock_running key as __ro_after_init
Date: Fri, 10 Oct 2025 17:38:25 +0200
Message-ID: <20251010153839.151763-16-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164451_183336_2D66601C 
X-CRM114-Status: GOOD (  13.66  )
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

sched_clock_running is only ever enabled in the __init functions
sched_clock_init() and sched_clock_init_late(), and is never disabled. Mark
it __ro_after_init.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/sched/clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/clock.c b/kernel/sched/clock.c
index f5e6dd6a6b3af..c1a028e99d2cd 100644
--- a/kernel/sched/clock.c
+++ b/kernel/sched/clock.c
@@ -69,7 +69,7 @@ notrace unsigned long long __weak sched_clock(void)
 }
 EXPORT_SYMBOL_GPL(sched_clock);
 
-static DEFINE_STATIC_KEY_FALSE(sched_clock_running);
+static DEFINE_STATIC_KEY_FALSE_RO(sched_clock_running);
 
 #ifdef CONFIG_HAVE_UNSTABLE_SCHED_CLOCK
 /*
-- 
2.51.0


