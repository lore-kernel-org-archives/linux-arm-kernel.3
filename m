Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40099CCFA08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaU7p8ahmNCHaG3kbOaKByvc4PL/i8FOp86ZUuzimbc=; b=ak7LYMQVn9goKme9N7WPPqYvjs
	2ZHnAxD990i5z3nYEAtZghKZzV+0fOEHG36OG8CqT7etaeGtM36ZA+beWBD1Q7e/DEOdEIjk0Dl56
	LW1CzRWQkTuJ888vaJHaySYL0z7El4NiXNfmvRcnUPMomDRq9+pazUerwYkB4N2ozCf2EULdxAFvv
	imlEPfKb+GRv1bgiMrx9DbCAncle4NxXyLKfGNubNnto7ZOp/riPYaYc7STvGJvz6g4bryrVBEmgo
	XrW127HOujDTEsSdKt+c+tDaSWzNITR9/zj9ERrIh+b/3z/FSOW6ntTKU7T5LJaMgm/49lSqwGta4
	g+RCMIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbQ-00000009at5-005f;
	Mon, 03 Nov 2025 10:15:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrbL-00000009akw-3bEy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:15:54 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762164948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KaU7p8ahmNCHaG3kbOaKByvc4PL/i8FOp86ZUuzimbc=;
	b=ceFmENrl4NDS42u8BwvnJbx5VpAEI2Rfo1PEn4iLZUAPYMtq6rRH1Ojd+2LnDfBkN4Up6T
	pIuycKv8DHZTmUKa4H9W+7WnYrxhs4yND6Y+JwLKbUfgHrVO14WtS7btFh6pkPwU6Ae6E6
	v17WBWFJ0Ix4fH5Eu1GuCYJjMbVv2AcrJIxWZZR+te8QIcp/TMq7meadtIJtJT/by60HEN
	at+Eq+UFbNpGwqf+ypqni//O7v3G4nX1VDy/+9W5RJ7o9DD592YEkF36tTqvCdI/gRVuv/
	TD3aKBB4O59IoqFPvnjxSaidBoC7QyOozG49DnyLIlMed0K1f4Z5QSK5FbLhAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762164948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KaU7p8ahmNCHaG3kbOaKByvc4PL/i8FOp86ZUuzimbc=;
	b=vD8id2aR4V8Qnneq8LT5WWROYZKpgDA74fFqZZ+o1i+A7J4h4M5noHNhM5WpfxAJPmH8C8
	/ocqUkOzjahjGnCQ==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Yadi.hu" <yadi.hu@windriver.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 2/5] ARM: mm: fault: Enable interrupts before invoking __do_user_fault()
Date: Mon,  3 Nov 2025 11:15:42 +0100
Message-ID: <20251103101545.760243-3-bigeasy@linutronix.de>
In-Reply-To: <20251103101545.760243-1-bigeasy@linutronix.de>
References: <20251103101545.760243-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_021552_050781_8052AED0 
X-CRM114-Status: GOOD (  10.16  )
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


