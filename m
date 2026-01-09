Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D59D167F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j3TDkz1mkk+5CoG4tXdYWIkXakwQPf8XXuWbY3gDnmo=; b=yIY6p/B77YS4/aWlFYPNXT+nkl
	8YPr8jiGTqQuKhOtED68ra3rv3A3Nmf/MSyI4A7TFpSJrStc3kIMX1umRyeJ45cn0DTf6WOM41NM4
	VfYP55Lx/ObTs2ya2HMju3DrBFtK6EUZoYrnh7I0tlkhn5XOUHfta7AbFyPTpaOqc5GSAhPPIreLX
	2HK66AWVGv9TayDO5GWxnReHAn3bSd3Bm9tOEU0yCA5G4gBDaJOvpQjYqgD29F8nnYXngE/FoQhbJ
	J2LogdhOVkSr6XWQQ3D9u3978xCFdKdF6P4gmGbRFsb5zltRzFIFkr8DpQKoIaUA6NaaGFODq0pJx
	QqhSLLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Li-000000025st-1xj8;
	Fri, 09 Jan 2026 10:04:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Lg-000000025pj-1eXl
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Jan 2026 10:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=j3TDkz1mkk+5CoG4tXdYWIkXakwQPf8XXuWbY3gDnmo=; b=eekzdr5FZB9lx8VWrdux5rlVbN
	xUjbs2GqjyYq9bqj4VoMSmQi46ith4mTa9jNoKzOmSJm+kQynoH1ByELsgY0RpAybgY1u5g8D/rIh
	UklKyHJMRwOnfYHjivB6lDl7UWaqY2ues7xThaBkvWIl2el/5raeGUBisS35zja0oJZ5BO4xKxUqe
	7h+8dgiIm9xMgr16e9vKrLtFHIhTnvjzHtswfImY12Scw0qWUW1m6xUz/FItwYnRQvhKt7lqebZlh
	8KLUL+PBxYuPEkJwhv+++QAzrog9Q2gNifH3wMfrotTH14o5MDrz7QjiL93reIRb5//MJlkwUKqdZ
	mFzb5TAQ==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Ld-0000000ExuS-1GfI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:04:03 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767953038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j3TDkz1mkk+5CoG4tXdYWIkXakwQPf8XXuWbY3gDnmo=;
	b=n1dQInmeF3rYS0P77sAZY8s+4xxkBpW5NPTDMHdkaSR4JF05sdnhPUA9Mi6A5ElUs/V3z9
	LQTwHE/vjFeo2xWFIP2em5H76KIOizOSNuyLE02CUa5X6bjA2fZxWAN6IefiYBEJKJgKqJ
	ZYkeTgaofBnwC+IMvyM2c/vjRw7EdyJbcDcNNumrSbLna76nWZ2DrYwYt0qRg2WU0d6uVz
	rL4IVfu6ZkNxiGdZ3rOu0sCPjxbOPYTjYdPywOMvKcdPQSsvfZSf3NoKzpUbztkSnmY99u
	GL495knmc9u6voFQFXTF4SfzktwLwRczbpdMCNWfwoOTaUFlZwGa0alZUiG9Uw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767953038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j3TDkz1mkk+5CoG4tXdYWIkXakwQPf8XXuWbY3gDnmo=;
	b=v6/6Q+v7oH/6sk1dAFUbNFoLCLimUOK/sFvBWUhNkfSLuw8GwZqF/cf+nb7c0nRSBzQHyW
	L4zeur5t5NYFySCw==
Date: Fri, 09 Jan 2026 11:03:56 +0100
Subject: [PATCH] ARM: Implement ARCH_HAS_CC_CAN_LINK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-cc-can-link-arm-v1-1-b748e2aaa6a6@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAIvSYGkC/x3MMQqAMAxA0atIZgM1FAevIg4hphrUKi2IULy7x
 fEN/xfImkwzDE2BpLdlO2NF1zYgK8dF0eZqIEe96xyhCApH3C1uyOlAryqBZ2KnHmp1JQ32/Md
 xet8PIRKgjmEAAAA=
X-Change-ID: 20260102-cc-can-link-arm-4eecfad2a0e4
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767953036; l=1481;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5uI5RyNM8D/WUKFooFEr0jc6IRi5AZX5Qxy0aMTcUOI=;
 b=PvEF9tAxvLs1S8N7gsTUKnyZpzU7qN6rDazLWrNDhzcyxXWfZ42qZKAQppu+47R7gXgpFKlhH
 4vjaICVERK+CdABHMzjF9PzLLkCew4p2K7sk+zv2bLWm5IzCprgghO2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_100401_662600_4E7EF130 
X-CRM114-Status: UNSURE (   7.06  )
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

The generic CC_CAN_LINK detection does not handle different byte orders.
This may lead to userprogs which are not actually runnable on the target
kernel.

Use architecture-specific logic supporting byte orders instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fa83c040ee2d..5ca48361e1a0 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CACHE_LINE_SIZE if OF
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
@@ -1715,6 +1716,16 @@ config KERNEL_MODE_NEON
 
 endmenu
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-mlittle-endian) if CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-mbig-endian) if CPU_BIG_ENDIAN
+
+config ARCH_USERFLAGS
+	string
+	default "-mlittle-endian" if CPU_LITTLE_ENDIAN
+	default "-mbig-endian" if CPU_BIG_ENDIAN
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260102-cc-can-link-arm-4eecfad2a0e4

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


