Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8CECCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZRlBrGWRm8/WFIoJDNgIH6m5X7XtAKEAZi/T3mFxxA=; b=clZHvBkRR0PJhwVM2eJXobZeIm
	mfDEZ7k8bNENhN6RdMA/oPJQUXr45DIgrAIx2DwxTohfZoNhafvkT883aSkLULcSNGdPZ10U1+eic
	JAzHO63NDBZs9NZ0KzvzHW3EUxjCIDly0qIQFw5JUTmBGOHXZla1OC8H/8DAVTdZL3DJwETdIxvV6
	uUzprUXHAHEu6q5VxOTrfwavJCIAv9fqcuvpaZN1UIrz4v9jdDbPoGUgzdkfqv6cGzxrdLqTCUu+U
	UNykWBpCzAtEgHowfRhkv5ISHUn0/zCHatvoh2GDwJEfqOJ+sNS7woOxuqxAGZzD0yBpAQco7sgRr
	G53vSgCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbP-00000009asM-2Iuw;
	Mon, 03 Nov 2025 10:15:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbM-00000009alg-0UpJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:15:54 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762164949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ZRlBrGWRm8/WFIoJDNgIH6m5X7XtAKEAZi/T3mFxxA=;
	b=OQipPlZ/OdaqOw2HJaVx7WO095xRZYAqzz4KEG28MK2PEODbohaG0EHxLsPD49VjULZVO0
	fd5E6WGRfbe8t3E1DI9rFAVB+fsKNLE9fc+oCxbDN+YK8P/WBwn7z2SIGUJn203+cpruYs
	QHqKH2STaAs0p9VvUQp9Nfq+KMDlZYQ6ynmEV2McXdR5fZe/NEo3+6+5rTKGuDPpI//PJv
	IrCMJf7Ze5pfeVujaJ/Tbzkk8G9gK9VUgbingTrqqx6S1gidMQ9T74wiGT8WdT9zp1OExn
	SiyboC5PE7nTJNfuRCHCMldsMAAFsC1PYsKfForC9zbLoG7QIfPkEZ06448Unw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762164949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ZRlBrGWRm8/WFIoJDNgIH6m5X7XtAKEAZi/T3mFxxA=;
	b=ldr/wetoW3v+nVgu78ujUV8d6HYWMfbEggHbECCLT9Sxy6zbCDnY/DRfRzX1ejvkmzOyNi
	HWjYWU3+6aNb2WCQ==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 4/5] ARM: Disable HIGHPTE on PREEMPT_RT kernels
Date: Mon,  3 Nov 2025 11:15:44 +0100
Message-ID: <20251103101545.760243-5-bigeasy@linutronix.de>
In-Reply-To: <20251103101545.760243-1-bigeasy@linutronix.de>
References: <20251103101545.760243-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_021552_326405_FEF2D6EB 
X-CRM114-Status: GOOD (  11.95  )
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
sleeping lock and must not be acquired in atomic context.

The loop in map_new_virtual() uses wait_queue_head_t for wake up which
also is using a spinlock_t.

Since HIGHPTE is rarely needed at all, turn it off for PREEMPT_RT
to allow the use of get_user_pages_fast().

[arnd: rework patch to turn off HIGHPTE instead of HAVE_PAST_GUP]

Co-developed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 92ca24336ec4b..45d29320196f0 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1213,7 +1213,7 @@ config HIGHMEM
=20
 config HIGHPTE
 	bool "Allocate 2nd-level pagetables from highmem" if EXPERT
-	depends on HIGHMEM
+	depends on HIGHMEM && !PREEMPT_RT
 	default y
 	help
 	  The VM uses one page of physical memory for each page table.
--=20
2.51.0


