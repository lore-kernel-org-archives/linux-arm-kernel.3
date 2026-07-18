Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9B6C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 21:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z4YGNawamvQdlBrqVppCZOuCeOqoXk+MraHRjuwkWAk=; b=bhCjcO3GalD1GridqD8W6ImWx/
	uPq3o/PQLzGrLjAJKGlr9WcHVPP3CdH3ZGrr9MeweBt4GSIdNJH/bx4fq3iz7QR8ene3+ujiBF1Aq
	/6AurWWtK2JjeS73r1HNbK2ymM20+jnWa65eWDZgug6fxBhEwesEYj+gTsL4eucquUyBe4lvhC8lP
	qtC+Dm466EvlqHCGvtrmM972Scd0DkOarDgNJOZHKS0KGTg9oaSnG8NoEdPexPXRszdOAo7C+DxnV
	rrkBdM9uyd5BrKhYm5I5zxDyKqaK0Up80GgNpqCoCvJnyWWsJuK7/UbHnwcR6oVmOF2lZVFnQ0PRF
	mpSv8WYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlCqc-00000004Y6n-49f8;
	Sat, 18 Jul 2026 21:45:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlCqb-00000004Y6Q-0UyU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 21:45:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493c733f15aso77386115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 14:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784411123; x=1785015923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z4YGNawamvQdlBrqVppCZOuCeOqoXk+MraHRjuwkWAk=;
        b=MOi8t587sQxOklB9pJxVvapLWXIhmGEE4Fom20rDI2OJ15YvvPcH/BsuMtWMoCAfcV
         E8QAlhwU+UUZiGj+KqR7es6MdhgCOwU/jryueScBVk044y7oYskBzDuUN4pFviRdWIOl
         531QFNZKHbKfj0DOzzhvoBMNjM7K/lUNt4jQN3TyyQksm0e6AXfecdF4NE9oFCMqn6Co
         +zeRzyQFp74hWVmHfS8LWtVSJVHoMUGt6uA+3hJKsVNZsmQEZlRtYAAQD34w23td+uMa
         9wGPj1k/O06d/aORrkh00ncs8m6NXmivw/Xzv/a3+nt1DlDQRucGVPSAAsRgsKgdVcF7
         IxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784411123; x=1785015923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4YGNawamvQdlBrqVppCZOuCeOqoXk+MraHRjuwkWAk=;
        b=VKcFnu6PfRJYwCwiBdhzpdM5W2rYEG7Q8yYExGRCN3+k1/7/kR9ZpClxNnTNe9cLQi
         9z05X8UH7FcCL2T8EfUfffA2tZ/nuqBaDns1zO4bfhvnjFQLxthXTA+grpZA8KkeqGxq
         gsXBmD1QwIET1bGhuGLUIX20BV7fR57beTOEOAMpD7iZ7wXWqPBTV+zqu9ViN7v1nZfI
         c+w9ikhDy1suB9k65V6J6DCWA6b30LFIUc0rxkGcBs3JFpGS2tfBNOPM6A+Ni3ktY8TD
         mkwdHWDtGREhSEkYEarTngOPFrSv7UivWLiGvGX6ruEPiZszL4s3hQxL+vdI1byHWrx/
         J+/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpVzBmYJIurWwf7nYuisQLwrc3Hm9PEx4tkjJqVNcebIr+qu872HYUfrRhgc0KHhOVctvTKGz6OpE293JHr7Z5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxhrWk+AUDxZGamNhffyx41VlGoGw2fHdUf37cvCIgCDaQsJ+be
	RE8wEmHMNqmkQPX779Tstq0N6aAo6cSlTcIqEWG7nUxJciDe5Tm7lvEh
X-Gm-Gg: AfdE7ck8vbiJAI7QhRB12L4EfEaIJNUAcHqC+1fDxtOi31XYuyK43Ld9Mm5CONbJWEL
	If/DAZh4ItPJfY3trWlg49uOLPiesrSFtyvT+d483Xo43FaaeWxTiMs6qn96dQx5ZvcAXRSRhSD
	quqXtGO8lqW0g+849K2MDD+5GPsLWSBFOZiqN6vks7tj9LTYPxUbKFVX0poMcdKc8/h1C5+DzkI
	k/Ppe31wUqR/ttKtx1UUN1jOz6PlUOCjQE4PJ+U+E98Xcr7YEPqHDg7gLZTy8dUTFoVopmjrQLe
	J10uYV0QsH7NA2Urr+AVzn1ku4Zm/BEHPOOd/yEokkvlWFBCjrZLXGxz3Dd3/GViER4K+8JCEME
	pB7E3foApKDyek+JR9cVcfjijWTXA7DOdqoMQfqeqJcCygtG4UUnBUFqNExKKn0CciqgDRvap+X
	rLhQ/hCh3iSuulfTnRdf4dFu0JqkWTCBg38I61H4S1956FqsUDNz7FWjJtm5tPL2PU9IEJEZiS/
	ALUbMuqsBbRJA09u6ix3gTwK+Qum/s7tOlaf6AXJEJq7BlKR1oRHvgFnxsyg+azdIJPKUgR6tqi
	CwDHrS8AQg==
X-Received: by 2002:a05:600c:c83:b0:495:40f0:e77 with SMTP id 5b1f17b1804b1-4954a3d59c8mr86633455e9.5.1784411122797;
        Sat, 18 Jul 2026 14:45:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c00-bb01-3966-facf-793f-82a8.310.pool.telefonica.de. [2a02:3100:9c00:bb01:3966:facf:793f:82a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49558cb8433sm6377835e9.2.2026.07.18.14.45.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 18 Jul 2026 14:45:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-rt-devel@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
Date: Sat, 18 Jul 2026 23:45:15 +0200
Message-Id: <20260718214515.11275-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_144525_177827_A6509A32 
X-CRM114-Status: GOOD (  11.98  )
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

Commit c6e61c06d606 ("ARM: 9463/1: Allow to enable RT") enabled PREEMPT_RT
on ARM but did not select HAVE_POSIX_CPU_TIMERS_TASK_WORK. This leaves
CONFIG_POSIX_CPU_TIMERS_TASK_WORK disabled, so CPU timers expire in hard
IRQ context.

On PREEMPT_RT this makes run_posix_cpu_timers() take the sleeping
sighand->siglock:

  BUG: sleeping function called from invalid context at spinlock_rt.c:48
    rt_spin_lock from lock_task_sighand
    lock_task_sighand from run_posix_cpu_timers
    run_posix_cpu_timers from update_process_times

ARM handles TIF_NOTIFY_RESUME on all return-to-user paths, including v7-M.
ARM32 KVM host support was removed by commit 541ad0150ca4 ("arm: Remove
32bit KVM host support"), so the select need not be conditional on KVM.

Select it to defer POSIX CPU timer expiry to task context.

Reproduced with setrlimit(RLIMIT_CPU, ...) and a busy loop. The same path
is used by setitimer(ITIMER_PROF or ITIMER_VIRTUAL) and POSIX CPU timers
created with timer_create().

Fixes: c6e61c06d606 ("ARM: 9463/1: Allow to enable RT")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Found with a self-hosted syzkaller instance patched to fuzz kernels on
QEMU's versatilepb machine (ARM926EJ-S, ARMv5TE). Runtime-tested before
and after the change on that setup, and compile-tested mps2_defconfig
with PREEMPT_RT (NOMMU, CPU_V7M).

 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9187240a02db..f073b5102d4e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -133,6 +133,7 @@ config ARM
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-- 
2.53.0

