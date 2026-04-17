Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FE1F436B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 14:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eBnlodbgD2+srihBW/Gyq0JDZAw64eMwbq/amYZTn8o=; b=k5YSFHhqLQbd67
	ferELKwiW/WE7d4/khEpdUVVl8G9T5nOJktc9t6ipoI4yNr7W4BPrOow1wxlE1GQeO1zHFZkbFnuO
	MIdRy4Z8cZAnHX2+NK7rz7ajt4WL1UWJPsYJVpkCfXUSzhf6Ji2VeCaySP2UA8oAxNbamDYFpRB6Y
	I25gylN8XNoolYahrjn+qnD9ZM8hvdj0qr8LHTH425AeDpbeglSH+tKJQ/j/HaQpjzDlpKfZ3Hyg4
	LZVTkuZxEb3iRA+75teT/Jx3szEvgrvPiZYkm6ptOlv89lWTlnVW3LHwtBhb3apckrMcR457VJel6
	P0+QY/yeukJaWfg+QYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkdc-000000049np-2R9V;
	Fri, 17 Apr 2026 14:57:44 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkdX-000000049ll-08Qo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 14:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=eBnlodbgD2+srihBW/Gyq0JDZAw64eMwbq/amYZTn8o=; b=ryvCXGlsF/3phJW/7eqeI6L7fE
	tjHvq5ZjAcxAEPdMuz/zV0z2JHculoZgwX5wGouohbBwQYksHUPAlqgPP9MmEXdr9Q8GzIJYy2aIz
	jUUlinPhq4T3i9KoZK/FfUngf3Jmhw2d8ma4txl5LKmh2L+zUMbLeYZbZbfdXvEZQH6Lm1bN7/7Og
	hcf+zn7wy9ZZPLemMy4VITErMJLbqCNK2jLKykRg+IgiMvJS4erVD6D4dBO981HcKf3GFczRHEpVx
	I/R8cUSM5O6eFmm9q50pjBX42xBwEbTHbAW6wuiKxbaxbzvlX8rnXvarCsqjr6U0zisCAyCPyvQVn
	cqMPTJMw==;
Received: from [187.57.76.127] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wDkcs-00HVwL-Qs; Fri, 17 Apr 2026 16:56:59 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH RFC 0/2] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
Date: Fri, 17 Apr 2026 11:56:09 -0300
Message-Id: <20260417-tonyk-robust_arm-v1-0-03aa64e2ff1a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3ZL8vMps3aL8pNLikvjEolxdU5O0NHPzFKNkk1QTJaC2gqLUtMw
 KsJHRSkFuzkqxEMHi0qSs1OQSkGFKtbUA9nUFPXkAAAA=
X-Change-ID: 20260416-tonyk-robust_arm-54ff77d2c4e4
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>, 
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>, 
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 Arnd Bergmann <arnd@arndb.de>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uros Bizjak <ubizjak@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, kernel-dev@igalia.com, 
 LKML <linux-kernel@vger.kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_075739_426600_117A491B 
X-CRM114-Status: GOOD (  15.81  )
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

Hi folks,

This is my take on implementing the new vDSO for unlocking a robust futex in
arm64. If you don't know what's that, Thomas wrote a good summary,
including the motivation for this work and the x86 implementation:

   https://lore.kernel.org/lkml/878qb89g7b.ffs@tglx/

There are some loose ends in my patchset so I'm sending as a RFC to ask
some questions:

 - I haven't managed to expose the assembly labels correctly, the linker can't
 find it and the compilation fails, more info in patch 1/2
 - If the process is interrupted between the labels, we need to check the
 conditional flags and clear the op_pending address from the register. Using
 objdump I see that op_pending addr is being stored at x2, but I suspect that
 this isn't stable, so I need to figure out how to make sure that the address
 will always be stored in the same register.
 - So far I have implemented only the LL/SC version to make review easier, but I
 can do the LSE version as well.

This patchset works fine with the tests proposed at
https://lore.kernel.org/lkml/20260330120118.012924430@kernel.org/ (but of course
without the labels the complete mechanism doesn't work properly).

---
André Almeida (2):
      arm64: vdso: Prepare for robust futex unlock support
      arm64: vdso: Implement __vdso_futex_robust_try_unlock()

 arch/arm64/Kconfig                                 |  1 +
 arch/arm64/include/asm/futex_robust.h              | 35 +++++++++++++
 arch/arm64/include/asm/vdso.h                      |  4 ++
 arch/arm64/kernel/vdso.c                           | 29 +++++++++++
 arch/arm64/kernel/vdso/Makefile                    |  9 +++-
 arch/arm64/kernel/vdso/vdso.lds.S                  |  4 ++
 .../kernel/vdso/vfutex_robust_list_try_unlock.c    | 59 ++++++++++++++++++++++
 7 files changed, 140 insertions(+), 1 deletion(-)
---
base-commit: 0e8896e9899b607bb168c1cce340596b8c2e3e2b
change-id: 20260416-tonyk-robust_arm-54ff77d2c4e4

Best regards,
--  
André Almeida <andrealmeid@igalia.com>


