Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25E5CCF9F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JC8L79/U+jvssoEZEowKKBa9fD4CBt6SS7URdOpJOs8=; b=sPhWrmO377Lnq2L4UibieQ8y3W
	l7o28D4vuPI+FjxuWYyRFkqNsxrzW0Uq1qAJjmQ4Tji0uLUZDqL4QDaGe7H1/jivz/NksYVf4Jb5J
	oi7Tjny8qCU9RbMgYmfNPpXe7TOP2Dgftkvkg43TTLOhwmvU2jWiVrsqAXRJjhNIkvyi1rKpnbhIA
	IbGdYzYdlaLt7EuX8e/73bfxzZhLPTipaFMNRe001gNoG7TEaeCVlEgv9Bvgsr8qrCstkyj/JTKx6
	IO9TT0eNPsQkwzyMBiKflL+48A2SNGZStaX6cowwJp1nGrSizENZULiMHnqxOXKecfRlSWXXHVO4/
	avkwHMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8aY-00000001u2l-3v8q;
	Wed, 29 Oct 2025 15:59:54 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8aH-00000001ttj-2ttJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:59:39 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761753573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JC8L79/U+jvssoEZEowKKBa9fD4CBt6SS7URdOpJOs8=;
	b=jyxf0DoyAWM0uBiVJk3/r7FuAp0o7Dcf6TS/fvlxBhZsHbWskuYrrFI8pQ7/6BXwlRGLwN
	w1vtAcI1r1mq8qrcE+LJu117TJENkAhNp0XhHHswdPwbQUxoA2DZeMyNCLTwXB3iPdbwa1
	1fwuNEW7hUW+ahlIYi+SzBLsz5SjXJlbnWV0cGUgKyVbdJlSzhsaOsLdeuIJc9B0oovrrb
	0VF4R3P79Fx5b0pVysQZhC6SrZDYTP4X2rAWVWbL1vbTu+/JDRQ6S9NCyAinNF/vRvIYno
	IAazSFizKsmsZN5hamJUNZ2s6HC3KLo7MQz4kOAEPNmVfaud1xUY7RdZ8ieung==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761753573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JC8L79/U+jvssoEZEowKKBa9fD4CBt6SS7URdOpJOs8=;
	b=5DcaBrpjhqQrem0X4nGZ4JhLVHn66h9ACqt+0hCSEoF/qscTEl1W0/3gSHMxoTjvJHVAYC
	STwJ3tYTPzO+yEAw==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 5/5] ARM: Allow to enable RT
Date: Wed, 29 Oct 2025 16:59:18 +0100
Message-ID: <20251029155918.503060-6-bigeasy@linutronix.de>
In-Reply-To: <20251029155918.503060-1-bigeasy@linutronix.de>
References: <20251029155918.503060-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_085938_327116_AB81ACAF 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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

All known issues have been adressed.
Allow to select RT.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 99c9b1c320af8..002db8da69ee5 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -41,6 +41,7 @@ config ARM
 	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
 	select ARCH_SUPPORTS_PER_VMA_LOCK
+	select ARCH_SUPPORTS_RT if HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
@@ -129,6 +130,7 @@ config ARM
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_POSIX_CPU_TIMERS_TASK_WORK if !KVM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
--=20
2.51.0


