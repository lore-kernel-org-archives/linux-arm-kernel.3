Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67843C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGrxhCeS1UihQtSyLwZYefdsHJ3gt32bAk+gCeT3YuQ=; b=Q3WlyFQRYROb3fkI8v9Viszq9V
	UtcqHguRtr45rSZl1uJbGIO97AZBab4+7CSBWQ5fxniGo+I6L+YGh7YwutHhRh5IkzUuZdjOleWhc
	PSjsTQyes/rbEyY50xGnW3JkUybRV8WVyBhxplFqLOlsDj8wTB9Ej/euExY6eo1rq9Gb6Z4538IwW
	7Kjf87OusP7AtGJ+Oi8XJ3ghqscpSr4x5xqgpv94PP7sMk2N2s1HW9re+/BSZIvcG8AAwHqUrOQnC
	iHWfjRUroQFXY5MGGxqfx/xS35lo22a8V1qE9OG8d3YudJwQ+XBgB3eYt6kvNRSPfXt26khQleHtm
	by+tUkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTcR-0000000Av2k-0lri;
	Thu, 17 Jul 2025 18:46:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTXx-0000000Au36-0T1G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 18:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752777692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGrxhCeS1UihQtSyLwZYefdsHJ3gt32bAk+gCeT3YuQ=;
	b=KQVMfJFv4I+XNsGvBzasO2XNHltwSYB6q7HKMnn5pOo+6/UPt66/ue1EFW6jvduCjaDyqL
	b9YdP1OnpA6luN91V6+y7LN2Z40HuPEqRxnmpWPDyZaZEEAClhYy/s5eawZVEjSKKJoJPX
	SI8R+/mO9XjcwejsmIYQ5byWfdmY3GU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-_31ifGVKPp6mZ4YwN5wsEA-1; Thu,
 17 Jul 2025 14:41:26 -0400
X-MC-Unique: _31ifGVKPp6mZ4YwN5wsEA-1
X-Mimecast-MFC-AGG-ID: _31ifGVKPp6mZ4YwN5wsEA_1752777683
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E0CAC1800368;
	Thu, 17 Jul 2025 18:41:22 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.66.69])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 86CC6196664F;
	Thu, 17 Jul 2025 18:41:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Juergen Christ <jchrist@linux.ibm.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Brian Gerst <brgerst@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-s390@vger.kernel.org (open list:S390 ARCHITECTURE),
	linux-arch@vger.kernel.org (open list:GENERIC INCLUDE/ASM HEADER FILES)
Subject: [PATCH v11 02/14] preempt: Introduce __preempt_count_{sub, add}_return()
Date: Thu, 17 Jul 2025 14:37:54 -0400
Message-ID: <20250717184055.2071216-3-lyude@redhat.com>
In-Reply-To: <20250717184055.2071216-1-lyude@redhat.com>
References: <20250717184055.2071216-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_114133_220892_F8E4458E 
X-CRM114-Status: GOOD (  14.04  )
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

From: Boqun Feng <boqun.feng@gmail.com>

In order to use preempt_count() to tracking the interrupt disable
nesting level, __preempt_count_{add,sub}_return() are introduced, as
their name suggest, these primitives return the new value of the
preempt_count() after changing it. The following example shows the usage
of it in local_interrupt_disable():

	// increase the HARDIRQ_DISABLE bit
	new_count = __preempt_count_add_return(HARDIRQ_DISABLE_OFFSET);

	// if it's the first-time increment, then disable the interrupt
	// at hardware level.
	if (new_count & HARDIRQ_DISABLE_MASK == HARDIRQ_DISABLE_OFFSET) {
		local_irq_save(flags);
		raw_cpu_write(local_interrupt_disable_state.flags, flags);
	}

Having these primitives will avoid a read of preempt_count() after
changing preempt_count() on certain architectures.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V10:
* Add commit message I forgot
* Rebase against latest pcpu_hot changes
V11:
* Remove CONFIG_PROFILE_ALL_BRANCHES workaround from
  __preempt_count_add_return()

---
 arch/arm64/include/asm/preempt.h | 18 ++++++++++++++++++
 arch/s390/include/asm/preempt.h  | 10 ++++++++++
 arch/x86/include/asm/preempt.h   | 10 ++++++++++
 include/asm-generic/preempt.h    | 14 ++++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 0159b625cc7f0..49cb886c8e1dd 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -56,6 +56,24 @@ static inline void __preempt_count_sub(int val)
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
+static inline int __preempt_count_add_return(int val)
+{
+	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
+	pc += val;
+	WRITE_ONCE(current_thread_info()->preempt.count, pc);
+
+	return pc;
+}
+
+static inline int __preempt_count_sub_return(int val)
+{
+	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
+	pc -= val;
+	WRITE_ONCE(current_thread_info()->preempt.count, pc);
+
+	return pc;
+}
+
 static inline bool __preempt_count_dec_and_test(void)
 {
 	struct thread_info *ti = current_thread_info();
diff --git a/arch/s390/include/asm/preempt.h b/arch/s390/include/asm/preempt.h
index 6ccd033acfe52..5ae366e26c57d 100644
--- a/arch/s390/include/asm/preempt.h
+++ b/arch/s390/include/asm/preempt.h
@@ -98,6 +98,16 @@ static __always_inline bool should_resched(int preempt_offset)
 	return unlikely(READ_ONCE(get_lowcore()->preempt_count) == preempt_offset);
 }
 
+static __always_inline int __preempt_count_add_return(int val)
+{
+	return val + __atomic_add(val, &get_lowcore()->preempt_count);
+}
+
+static __always_inline int __preempt_count_sub_return(int val)
+{
+	return __preempt_count_add_return(-val);
+}
+
 #define init_task_preempt_count(p)	do { } while (0)
 /* Deferred to CPU bringup time */
 #define init_idle_preempt_count(p, cpu)	do { } while (0)
diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
index 578441db09f0b..1220656f3370b 100644
--- a/arch/x86/include/asm/preempt.h
+++ b/arch/x86/include/asm/preempt.h
@@ -85,6 +85,16 @@ static __always_inline void __preempt_count_sub(int val)
 	raw_cpu_add_4(__preempt_count, -val);
 }
 
+static __always_inline int __preempt_count_add_return(int val)
+{
+	return raw_cpu_add_return_4(__preempt_count, val);
+}
+
+static __always_inline int __preempt_count_sub_return(int val)
+{
+	return raw_cpu_add_return_4(__preempt_count, -val);
+}
+
 /*
  * Because we keep PREEMPT_NEED_RESCHED set when we do _not_ need to reschedule
  * a decrement which hits zero means we have no preempt_count and should
diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
index 51f8f3881523a..c8683c046615d 100644
--- a/include/asm-generic/preempt.h
+++ b/include/asm-generic/preempt.h
@@ -59,6 +59,20 @@ static __always_inline void __preempt_count_sub(int val)
 	*preempt_count_ptr() -= val;
 }
 
+static __always_inline int __preempt_count_add_return(int val)
+{
+	*preempt_count_ptr() += val;
+
+	return *preempt_count_ptr();
+}
+
+static __always_inline int __preempt_count_sub_return(int val)
+{
+	*preempt_count_ptr() -= val;
+
+	return *preempt_count_ptr();
+}
+
 static __always_inline bool __preempt_count_dec_and_test(void)
 {
 	/*
-- 
2.50.0


