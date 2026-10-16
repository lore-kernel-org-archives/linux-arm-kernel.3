Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599F1CCF2C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 19:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzEjDaJTDISex2ZPOiizRCuwngZ28JcDGHKte0m6HrM=; b=xR+TqpVk+vbWk2+GgS3M/otJ3V
	fHlArR5Rx5Jt6ynRrco3kB/GE6N0T+CvuU7znVinl34WfWXSur+kf6LH5KxWObdTnqg8vlyNkOyYQ
	CquwmqZCZMy6cHQUWN+VTLT2Pwv2fqrGpsRh4l0pyCNH8UaJvdrwmYI+9+GkCxh0C8M/R8gNx+i0+
	OxPkLLsma9Di7ZYXPhGtPIR0WdMIkKRPR9MHiSCz6nw2e1D8iJhabUqtxX8OjiD1HrZBdNUG8E/MW
	F+wAWvWcTy2sQT1NPkfPkWU2fJRKb9ni9tzupwSe/l04zQvUZR/8RhFl4KK8Ryswu/bNNl/QfKfuK
	koNNgurg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsq-00000003vQY-19e7;
	Fri, 16 Oct 2026 19:46:28 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnso-00000003vOM-0Z41
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 19:46:27 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso540940eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179985; x=1792784785; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzEjDaJTDISex2ZPOiizRCuwngZ28JcDGHKte0m6HrM=;
        b=r9PfYDJwdiNRuAMyuxviHc5jEeujW2CkjUybgXmEa0X08aTEGEyXa8J7Lrn0h0o9wm
         e7iCoRsvxLgh7IQVnekM66gXhPxi+3o9CjRR+b0EDy06L9YVNi8a+7veVfvIDts3yIy7
         YixxTB92maPnTo1EczUC/pdSHnemC8RzmevI+ErJvT3mRKZAX2782Pcgplzl6+ThnnFi
         wOZmoQnkVt6SmVe7TFr0GrHRFpCT0Sqr8rvzUrAA+3kRC/EPJJXprCrsh58qZQl8G5hq
         65nUIx6EVrWsSMygSmlr75xRRV9Pldc2zKsIF4fO8/wErwuhlDJ1VXmZOE6HScwCQbyn
         TKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179985; x=1792784785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzEjDaJTDISex2ZPOiizRCuwngZ28JcDGHKte0m6HrM=;
        b=2WVjWWGokzdL/p6Ls5HOfw4Zriw1CQcrLussfea9UMVQFWwZaRghRxQAFfDazJxVz7
         JCuLVo562TyGw37Kwz/M74opb6FYgMhAuTRdfSIFPdfyF53bJ1nPIkzTeOB7Lp06u4eO
         eoSPPH+JoDvaXZUdwS6DajTjVBLdLqnF5pAGlOLfc8wKfifac8f9oKOXnfhCcNrpawaB
         x0kDbAD/isW6JYYt7Y/TnV2E26Awdt4i/K5BKhhUaJ9HcgMEJ5DnGsbbVp0OvcLneTps
         5yq6Ao9ZevpCXbR4Hk/rUeQoX2HvSPYAWndM2kXO0aA0W4n1neMLi6BMgk5e8rCiCOfD
         sxHA==
X-Forwarded-Encrypted: i=1; AKwUvByfKVsFoLWDDR5RFfb+LnsI3Td80998hUUUJFK4dOFrSp3K3JKceKizx9fmPYZroE41KahOZB6cJlHpgNl55rks@lists.infradead.org
X-Gm-Message-State: AFq9FYIK8pODQtInz0+4G7Ei8rE/Fu+yhSBCN+MnwsrEbbhY4Q1Xfe16
	uBroEDyMoWm6rsRONPykPYZ1xpAkfEJY4yct4cRi0r4UwE50ii20+Rn4
X-Gm-Gg: AYBFou1fVcdmILaBX52eQoUgrys91bD6bGexQJ6zITOZWdnx9bZNF8ltp34yDf0ofjc
	mOb0zeXNooqnDHsScw2vNrxendMSuGQw2vFNxirInP6rGZT23kKIbpCioT8v1262xKSt3uMJvkB
	YvuHH2o+ygJZVUFuptKvI2PwH9ZiYdqaPHvlIDrFdqMNJyMKl87gkzothFokGeg2GBQIy2uU2O7
	+KnF3mCnhQMsW7igGxWhG/Ecg9lEY/Xx91ndB+JF35jcJwKRQDpt+Y6gWzopjZBJ+x3D0XNAOt3
	79bcHk2QAsoUcm43OAMOyYn3527el+DOgGNx12MuEGyUS20R5ptocwjPyDr0ulDWU/LsGzajt64
	DIRi6l2lAQjNIHq0+BJO1knHMMso4HwQrrlZtvJmEaLovK0M5hdiyb/qv7NCs6otlofEoMPTV0W
	JesLhhVQqeLX67/POZ1ZV8eXeWyPphLViVdH46UfzW3kkUTVg8S2mQ7LgEp7Lr7dUCVZCssjnAz
	5s=
X-Received: by 2002:a05:7022:f90e:b0:168:3243:c937 with SMTP id a92af1059eb24-185119e3cfamr1015727c88.16.1792179983649;
        Fri, 16 Oct 2026 12:46:23 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:22 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] riscv/shstk: release shadow stack on failed fork
Date: Fri, 16 Oct 2026 16:46:01 -0300
Message-ID: <75e29a5db0166247c407bd51f184864b398a2ee6.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_124626_175762_5A864645 
X-CRM114-Status: GOOD (  15.09  )
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

copy_thread() maps a shadow stack for a CLONE_VM child and can still
return 0. A later copy_process() failure, including clone3()
CLONE_PIDFD when put_user() fails, goes through
bad_fork_cleanup_thread and exit_thread(). riscv did not select
HAVE_EXIT_THREAD, so that free was a no-op. shstk_release() already
documents this call; deactivate_mm() is the only path that actually
reached it.

Select HAVE_EXIT_THREAD and call shstk_release() from
exit_thread(). The helper already refuses a different mm and a
cleared base, so CLONE_VFORK, !CLONE_VM, and a second call after
deactivate_mm() stay no-ops.

Do not free when shstk_alloc_thread_stack() fails. That error
returns from copy_thread() with the inherited parent base still in
place, and copy_process() skips exit_thread() on that path.

A kthread copies the caller's tracking via arch_dup_task_struct().
kernel_thread() uses CLONE_VM, so during a failed copy_process()
the child still shares the caller's mm and shstk_release()'s mm
check does not save us. Clear the inherited tracking as part of
kthread setup.

Fixes: fd44a4a85516 ("riscv/shstk: If needed allocate a new shadow stack on clone")
Cc: stable@vger.kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/riscv/Kconfig          |  1 +
 arch/riscv/kernel/process.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5874ca30f4f6..7635f8cb0397 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -169,6 +169,7 @@ config RISCV
 	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_TRACER if HAVE_DYNAMIC_FTRACE
 	select HAVE_EBPF_JIT if MMU
+	select HAVE_EXIT_THREAD
 	select HAVE_GENERIC_TIF_BITS
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7cc5a6a5c020..def1f520d9ef 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
+#include <linux/sched/task.h>
 #include <linux/sched/task_stack.h>
 #include <linux/tick.h>
 #include <linux/ptrace.h>
@@ -213,6 +214,16 @@ void arch_release_task_struct(struct task_struct *tsk)
 		riscv_v_thread_free(tsk);
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/*
+	 * shstk_release() documents this call for a failed CLONE_VM
+	 * clone. copy_process() reaches it only after copy_thread()
+	 * returns 0; deactivate_mm() does not run on that path.
+	 */
+	shstk_release(tsk);
+}
+
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
 	fstate_save(src, task_pt_regs(src));
@@ -261,6 +272,13 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
+		/*
+		 * kernel_thread() uses CLONE_VM, so a failed
+		 * copy_process() still shares the caller's mm.
+		 * Inherited tracking would then look like a child
+		 * mapping to shstk_release().
+		 */
+		set_shstk_base(p, 0, 0);
 	} else {
 		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
 		ssp = shstk_alloc_thread_stack(p, args);
-- 
2.43.0


