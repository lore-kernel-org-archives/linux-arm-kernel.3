Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2A4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpKzCdj5qcu3hu84AvpMgxT6khF5giKkPZsqGowQugI=; b=vGlhSRpCT6xcc6K+/TtBGoIr8b
	KgdTKGWn0MfeJxtBWcPHN5o036FysrETXF2pqfdred7u0tWhtG8nQJJE26c47cjoB9aED9688m3Zs
	Dge/+V8zpfnSwmuCBBwAVyMUtna0beH7YLUEF8h5EYfEq0NIDUPAzGNJ4n3RlT9l5nK7Iue36sSGe
	cBTle4bh6sGNIh/01556K1s62NJqDS6rmQ5MngMoDKJPjVM4QDi/AhOY6+W2ZgXf+ZfFMgEGJeA+g
	6P2+XRskFjCi6uyRbY8TgF0G+dqH/WknPmskhmHGuvA5/0X6y6x9lK0Zb3ZhXCcEwGb7IbK6nt9vP
	qCiFInrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8aJ-00000001tvY-0w97;
	Wed, 29 Oct 2025 15:59:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8aE-00000001trP-3ruv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:59:36 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761753572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpKzCdj5qcu3hu84AvpMgxT6khF5giKkPZsqGowQugI=;
	b=cHLZLcOTbZv8HRQsqELn5G6Ko2h6wAZNsLD077VvP8SdRJecFI0ti4NjurbbJfFIJAymPD
	jyzox8bDIVVJK3z2GEqHmqdhznzY+6H9Z54QQ2UZ27Mj7BgpY2oM04YaVcG9wPr32yZ03R
	QNErZLlK5wlpht+0xy4mrFdrxs8yvGt0TrBgrrpii4fuo6UucKRWGyRT5PFfuGR4zVJvRZ
	zKHWVYW8YR+5h5LoC6kExy8QKH/281s/4wijsbYj7G7LBU1dcj8Bnc4QHL0Nj/5pBafNJg
	wTNfFccsppefDDaUbsTM+0L493tUu1FUgwaFhlyYhhWn6Qf+O2PJOCozhe+Qfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761753572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpKzCdj5qcu3hu84AvpMgxT6khF5giKkPZsqGowQugI=;
	b=O79y++7/8kBTiO1CJCsglRL9ggC0z87ZcX5MNw5PG0zQlDaITemDOA8rwnKYMngQLtTZ+N
	8NoPwWaJbhH6llAw==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 3/5] ARM: Disable FAST_GUP on PREEMPT_RT if HIGHPTE is also enabled.
Date: Wed, 29 Oct 2025 16:59:16 +0100
Message-ID: <20251029155918.503060-4-bigeasy@linutronix.de>
In-Reply-To: <20251029155918.503060-1-bigeasy@linutronix.de>
References: <20251029155918.503060-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_085935_111593_82C288A2 
X-CRM114-Status: GOOD (  10.88  )
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

gup_pgd_range() is invoked with disabled interrupts and invokes
__kmap_local_page_prot() via pte_offset_map(), gup_p4d_range().
With HIGHPTE enabled, __kmap_local_page_prot() invokes kmap_high_get()
which uses a spinlock_t via lock_kmap_any(). This leads to an
sleeping-while-atomic error on PREEMPT_RT because spinlock_t becomes a
sleeping spin lock and must not be acquired in atomic context.

The loop in map_new_virtual() uses wait_queue_head_t for wake up which
also is using a spinlock_t.

Limit HAVE_FAST_GUP additionally to remain disabled on PREEMPT_RT with
HIGHPTE enabled.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e3f93b690f47..864a14a434b08 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -105,7 +105,7 @@ config ARM
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if (CPU_V6 || CPU_V6K || CPU_V7) &=
& MMU
 	select HAVE_EXIT_THREAD
-	select HAVE_GUP_FAST if ARM_LPAE
+	select HAVE_GUP_FAST if ARM_LPAE && !(PREEMPT_RT && HIGHPTE)
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_GRAPH_FREGS
--=20
2.51.0


