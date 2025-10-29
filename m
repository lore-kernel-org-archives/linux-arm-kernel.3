Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A8FCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaU7p8ahmNCHaG3kbOaKByvc4PL/i8FOp86ZUuzimbc=; b=T/Z4rH67jRpqbpwlYwASXcDVXD
	enl+Ise1WlHq1wwjowLNMO+IJLUhGZ8yzpRfwlbELqAoE0rgQLYqiHp41Wr2SmFat1WJXMn3Mgmgi
	0d1F88pvRnLIWlVhGSxSCUoRHJLGffeQbqmNS20CvRaKQLMrgFO27Lk6DBu4TEFR1LoeBf0CzIjgJ
	KkYfVZeiW6LY94jGTj554k2SDxDstAX8fwKXU6aj8LUxYAZibPJlpVtIaqTVxnsqNDa7d0Ubw63yD
	AQD6HGaiUtYgLmDoeXUvFW5Ubsnc87KJzPggIg5ndBI683Lxm27TllS1Ry4PXSPBSYCfI31PI2tw4
	Xkrux2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8aI-00000001tv6-3pwv;
	Wed, 29 Oct 2025 15:59:38 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8aE-00000001trL-3rUS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:59:36 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761753572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KaU7p8ahmNCHaG3kbOaKByvc4PL/i8FOp86ZUuzimbc=;
	b=mkp4AK1g1+nEaFAnxnN1yRX+6h7qNRFVcVUVjjLDUHpS9ftoDSJu3pCrc+zyjiA+PnvR0M
	IglZsC2kkHV3Gecpuz7ishoDUMty+k+eWuQCUXqB4DpknOegstPVtH0nXtFBwjYYjB+j32
	n+0T75Ebr9MAu4H6mNAJVkV0J/ogP77aFbyXoc8bkdGohxUsqHAPMx2kfjRGrhDpCfh/Lx
	hLSb7ANyhwmv9HnGBNpFNQxj4VvPAPyEsvoOpyObnsxLJJhp6jTeP7R6REK2pMTazhxbDG
	rt5eBuqlwXoZ8z5eoYCZmPcPs3DjV2DbGYUBXjPXGKR7DbZ/bMvwJn3IYaqdww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761753572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KaU7p8ahmNCHaG3kbOaKByvc4PL/i8FOp86ZUuzimbc=;
	b=Id4IpUJAwCLjlI6vtkei4JtSeElAFjBvJxC3clvZE7E/kIGUKhMLCBsrUtHP1ILKIRjGX1
	cIiIehMVq+HV3DDw==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Yadi.hu" <yadi.hu@windriver.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/5] ARM: mm: fault: Enable interrupts before invoking __do_user_fault()
Date: Wed, 29 Oct 2025 16:59:15 +0100
Message-ID: <20251029155918.503060-3-bigeasy@linutronix.de>
In-Reply-To: <20251029155918.503060-1-bigeasy@linutronix.de>
References: <20251029155918.503060-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_085935_104979_A884CEDE 
X-CRM114-Status: GOOD (  10.28  )
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

From: "Yadi.hu" <yadi.hu@windriver.com>

In the !LPAE case __do_user_fault() is invoked from do_bad_area(). If a
user pointer cause the page fault then a signal is sent.

Sending a signal requires to acquire sighand_struct::siglock which is a
spinlock_t. On PREEMPT_RT spinlock_t becomes a sleeping spin lock which
requires interrupts to be enabled. Since the calling context is user
land, interrupts must have been enabled so it is fine to enable them in
this case.

Enable interrupts in do_bad_area() before invoking __do_user_fault().

[bigeasy: Initial patch/ report by Yadi. Maintained the patch and redid
          the patch description since]

Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/mm/fault.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 5d28c28e877c1..ad58c1e22a5f9 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -218,6 +218,7 @@ void do_bad_area(unsigned long addr, unsigned int fsr, =
struct pt_regs *regs)
 	if (user_mode(regs)) {
 		if (addr >=3D TASK_SIZE)
 			harden_branch_predictor();
+		local_irq_enable();
 		__do_user_fault(addr, fsr, SIGSEGV, SEGV_MAPERR, regs);
 	} else {
 		__do_kernel_fault(mm, addr, fsr, regs);
--=20
2.51.0


