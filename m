Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179B2CE7B1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPe85wKAQS8nAPbz9O1eWBHIVRYgj0iBULMk7IyxpE0=; b=1qQVXoUvCK4Pn86NU5lbSgzBJu
	32DZL4afwKtU+Z+TmJx3Rk2Y+Q3thKtvbUmTzkFQNHIt4YQvHVNWA2GtKd5JMLJLttKKtdNDOjF8H
	ZLmYqKFI9gQnyOTpQ9mQunZZF9nZJIXPpiqfN/BfGViGceHycEWMsN2OvSkIvKwDPunT640TLhMJv
	ivaRI05QGQV1S8ykVprLYvoWXCubm0tvcfhVMnBTRvBZ249H7Bm2of2zXbOHgel9/AIBs4UG8A0bD
	6r0lgVyyQOMUEzkS1GaezV87UzhRGpqdPrP0g4dorHgTfNIFQI10thdy+7iOeGXOtAOOZHGuHoYW0
	WA95CxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvO6-0000000CSLX-2vQm;
	Fri, 14 Nov 2025 15:06:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvO5-0000000CSK7-0lYs
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jPe85wKAQS8nAPbz9O1eWBHIVRYgj0iBULMk7IyxpE0=; b=YgYkIeGGl4mZnpebZo2E0ATQ4t
	VJj8ZBD4LWDZRsEl9fzOenkNTkZl8XnLpyWHkDGG+ZvZdZo9s4AHNQLBM9SRfmuR5BAVJhk8kbxdu
	uUwaYeLCqmxBUmCDcUyCYAPfV52oNobsKyxg8DGWtL2B5CIkmu72T9B8iQnWyUWH7+18D8NqIYILz
	ClK4NwOiVuWBZzzWxr+xKfyJKU5QrEPeWmU8xTUT88p6QIaWm2BlIhuZ4PK262/aQef0cHAFA45jy
	DGxYS3BsoagG0DDZpwX1TdQqxqNwchMWcNg6mGU4B5E3wgx47kMowTbf4C6bw3rbnKTG5kMDZ4y3J
	lKOX6Lmg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuWN-00000002ldP-0pxu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jPe85wKAQS8nAPbz9O1eWBHIVRYgj0iBULMk7IyxpE0=;
	b=igKtCKLfL3onsi7a0GkwqXb1Zl6n9JamxhWFVN/oeh7JJts0S7ZxiPptvkv8CD5VxsxMwY
	ZAGSVPaiHM6Ilh0sAnM8jIh9egZc6Zxbcn+ZOyHJyWDMGW3nERTH00dlwIVry+wcXMT1Fe
	mD9mS6mHAk+6aebehRpjBZM2BMOklVg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jPe85wKAQS8nAPbz9O1eWBHIVRYgj0iBULMk7IyxpE0=;
	b=igKtCKLfL3onsi7a0GkwqXb1Zl6n9JamxhWFVN/oeh7JJts0S7ZxiPptvkv8CD5VxsxMwY
	ZAGSVPaiHM6Ilh0sAnM8jIh9egZc6Zxbcn+ZOyHJyWDMGW3nERTH00dlwIVry+wcXMT1Fe
	mD9mS6mHAk+6aebehRpjBZM2BMOklVg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-101-LEviGDC8P1mJckMlf_MqCQ-1; Fri,
 14 Nov 2025 10:06:48 -0500
X-MC-Unique: LEviGDC8P1mJckMlf_MqCQ-1
X-Mimecast-MFC-AGG-ID: LEviGDC8P1mJckMlf_MqCQ_1763132801
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9FC518A1AED;
	Fri, 14 Nov 2025 15:06:40 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF9A91956048;
	Fri, 14 Nov 2025 15:06:26 +0000 (UTC)
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
Subject: [PATCH v7 18/31] x86/speculation/mds: Mark cpu_buf_idle_clear key as allowed in .noinstr
Date: Fri, 14 Nov 2025 16:01:20 +0100
Message-ID: <20251114150133.1056710-19-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_141127_379879_AE0F6F91 
X-CRM114-Status: GOOD (  13.36  )
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

Later commits will cause objtool to warn about static keys being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

cpu_buf_idle_clear is used in .noinstr code, and can be modified at
runtime (SMT hotplug). Suppressing the text_poke_sync() IPI has little
benefits for this key, as hotplug implies eventually going through
takedown_cpu() -> stop_machine_cpuslocked() which is going to cause
interference on all online CPUs anyway.

Mark it to let objtool know not to warn about it.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/kernel/cpu/bugs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index a2d7dc4d2a4a3..39f6a2f9593f8 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -181,8 +181,13 @@ DEFINE_STATIC_KEY_FALSE(switch_mm_always_ibpb);
 DEFINE_STATIC_KEY_FALSE(switch_vcpu_ibpb);
 EXPORT_SYMBOL_GPL(switch_vcpu_ibpb);
 
-/* Control CPU buffer clear before idling (halt, mwait) */
-DEFINE_STATIC_KEY_FALSE(cpu_buf_idle_clear);
+/*
+ * Control CPU buffer clear before idling (halt, mwait)
+ *
+ * NOINSTR: This static key is updated during SMT hotplug which itself already
+ * causes some interference.
+ */
+DEFINE_STATIC_KEY_FALSE_NOINSTR(cpu_buf_idle_clear);
 EXPORT_SYMBOL_GPL(cpu_buf_idle_clear);
 
 /*
-- 
2.51.0


