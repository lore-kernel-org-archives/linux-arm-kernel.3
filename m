Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9ABBCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrUC7JbXBMMxZugHWu6/YK600YFH5JwP0FwRYQIUf/M=; b=tlMoYIozpzUYnobDl8cTEwIIYM
	rybLhpMKafmyA8iel6VaL+noMr4rqoCv0CKCNGlohJQCeZo8iEB3AHqIbVesb5Z+UX0M5fbq7lg0M
	DsaSKxOI3duFu+P3X5JIJxezOcbWpSzV7eTlXoDsKsp8hV1JvDqDTbQsjimZnycIHUfAqPMacaarA
	AOZGOswlW6u1RxY20GfFHCYxqswXOe9FyspvcrheI9QtEc/JMFciyhxhDQDu4ePhB7hy/uMgQIHTf
	tOSsSkTIvvdBOwKbHX2xdxovpICH3qIEfdXvQ73FRbHH9T+LVbQP6c89VDkbiIXeokNrJ88skzHBW
	6FzlJuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJp-00000005dNb-0X02;
	Mon, 10 Nov 2025 14:56:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJg-00000005dK0-2iIg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:56:27 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762786580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LrUC7JbXBMMxZugHWu6/YK600YFH5JwP0FwRYQIUf/M=;
	b=JyC6l7+8FqVtcfYhbakSbUYu34GR7YTGq/u6DTGBUO6kpm1VLLA+XBgEFRI7a9ZrFMZNMn
	5KWAMu+p3WT6x+redLeV29EmvxnGyg6PGS1uCQ4L4eVrdnhq5ePAlewey9xfBNU3oM6eSL
	zlWbo58hQzt8CrzDaLtFysrBQoNx59l06sTGEVWRqwtDP8wD6oQ6eoZQysawwKSeWvEOmU
	p5n5z81HQ/IMCNYYivvSenGPrTOcK3PBx+YkuGDiFRsCUzX2q66FUy/pBKXphIY69gAqq3
	8qo/xcgDl94THVb9L+l6eidhu1fyHjY7yQL7Gi+opXS49WnPf+APrTDb7wPYlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762786580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LrUC7JbXBMMxZugHWu6/YK600YFH5JwP0FwRYQIUf/M=;
	b=jspdRtBLEAWqyMHczz5EJhINO7IkTsLK18N72je4bPgEtwAWt3eTpiACZi4pj0+us84yPa
	huWf94jBVy6sYpCw==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v3 2/5] ARM: mm: fault: Enable interrupts before invoking __do_user_fault()
Date: Mon, 10 Nov 2025 15:55:52 +0100
Message-ID: <20251110145555.2555055-3-bigeasy@linutronix.de>
In-Reply-To: <20251110145555.2555055-1-bigeasy@linutronix.de>
References: <20251110145555.2555055-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_065624_824459_774922DC 
X-CRM114-Status: GOOD (  11.27  )
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
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


