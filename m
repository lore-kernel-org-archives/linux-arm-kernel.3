Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CB5C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 00:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C+ndS92zXPqAJ+cNcpLuaSmLaftIm1AvtWGzzi2M09w=; b=NZvZw+YYQKZ6A0eXyur1gVzyHt
	Jn4+lZp48agslWqNZZuvmAVlXzTfmeNpWQ8ctTPpkC1bR9m0uiuxPb73KGBBZTXRqI8cgltGXnRG5
	yVVQD4BUYYub6Uveg2oX3g0haixbn8AgKWoQ8Zj5UG3OBSZo2yutyXoarPIxpfPk4uSXaTXYYa7rY
	Dm7/QvDeW4XfqmAw0y6uPktXptdmkrBO9Q0snNzvINEUJ22ESd1p/iY6t9vCP0EatcP3ikm+Y0dOS
	61bCWpXZooHnhK4XvtkXfBEIujIWCSWctJFJZ4plrXJAxjQl61fKlLzIZRtau9ld2hWVxMSKS+KIZ
	NuorgUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrlYz-00000004fHZ-0Y94;
	Thu, 06 Aug 2026 00:02:21 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrlYx-00000004fHE-1Eea
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 00:02:20 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso1924868b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 17:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bourg.net; s=google; t=1785974537; x=1786579337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+ndS92zXPqAJ+cNcpLuaSmLaftIm1AvtWGzzi2M09w=;
        b=CbCGFq24EEzd1oBdIkiRsUjPizqGLyRC/oX1VQgo8jDO6FfQKdEfkFVBAvN9kWt1cN
         gnMPGtrjzLI/wcPwAPlJVgSq0FDCAmFAFzZv7NfcMwDfSuvXkrMCPJlSKWMvXFTCzdua
         uQbQQTPeOcC4EjumXV4GR+cCipb7FJTRbSckM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785974537; x=1786579337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+ndS92zXPqAJ+cNcpLuaSmLaftIm1AvtWGzzi2M09w=;
        b=iFqcj1P9C5qU1YyL+lJpDUCW7YJllENV+VGhUyomarD5ZtymJB+xwt77UbxsX6XYdU
         pNKYXgwxqyKgCT/xe4xARYOu5cWlzsXOBlrKi/oUvUShyCqVll/XFwTgulLfJuvCjO5G
         5ph1sZGd3X/7wrCOmlTYO+mWsog0umfRmk5baLyPmGWQyKv6ZkwHGfbap8/Zgaa1VX71
         N+8KHQ+oqwMAeGLvKqro9uJaWzA7CkxwPyRq4czmawhPHxS5PGNedEMwCoAsj6HVppqn
         iV13hFTKzGK9XEokJBH8zFv9ypfdm4m2eWytYLvrpg4QzjvD94Q2rsNaNJ3qMoeC7xiY
         Q75A==
X-Forwarded-Encrypted: i=1; AHgh+RoOdyDefXMdJvpAYCtYT3llX58YgrdkGT+co28UaSJbjgZmDv9k/TC7yMb/jYVkWjKMZQk4EPm/TSd0KAeNFL8t@lists.infradead.org
X-Gm-Message-State: AOJu0YxZnfCHMPMlBe4YZ5ExZDzOYsltjNqeqJ0wX/s0uptTGBR4GeaA
	5+tPFf3WpS5gojRYB5fLFmKnXZMgxYuX1Iuv5kLIJvU62dAcWXJRMT5TiZFQyEGTlCY=
X-Gm-Gg: AR+sD130won4TxWmPGVTDJHH5PeF3Lfh2u6fxuVk8YRPnc8btEudZd/tbeE2vcNSUGT
	mQ/OqzwLYYGuP+gHo1zTaHhK4JzNjRHEgtMlDE1jb8sq7pWy/weoaRWwmOQ8HAnP4MqgEw0Pye8
	Omzv5wVm/NEJZQSw5MGcbjfqo0jI24JSnwfFciTSDMPnsKqsehslJYspV79IkoGBKk6ItY5lJc4
	KER+m7/byClQunJvEC4J0stLqiInJPfJleTJu0gzcYap7mplO8XxWf8bp4vB9/ZCu4gq5OTy/rp
	daFUfCpwklHe1JN7EQOcsv4qmfDvlxVx5cyx3qa3Q8IsyZPVUGj+jTFq8jot+j4URRJUCfvZ9iy
	q9/CF5+tuEHJ7eS0LNsnZsjgdZPuwgzg0mEU3whLR9QzMwmRArTMWUz0CkHgIfkfPGC2boyN8AG
	RWmoNIQq+gCgdBjxmSwZJkrFnTANlpwKF0KvRrLPvDLEldn2QpHg/hHs1gPvSXNhN4eBPnLE1/9
	YVAKjxPx94VC7Jc4OYB5zkuCmRVBKEmWnz3twZ5sKG0EK9f
X-Received: by 2002:a05:6a00:8d81:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84f2dfc8f83mr13807202b3a.11.1785974537350;
        Wed, 05 Aug 2026 17:02:17 -0700 (PDT)
Received: from deskstar (syn-024-216-245-233.biz.spectrum.com. [24.216.245.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f4538bb3bsm180478b3a.12.2026.08.05.17.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 17:02:15 -0700 (PDT)
From: gus bourg <gus@bourg.net>
To: ardb@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	ilias.apalodimas@linaro.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Gus Bourg <gus@bourg.net>
Subject: [PATCH] arm64/efi: Do not call EFI runtime services preemptibly under SW PAN
Date: Wed,  5 Aug 2026 17:01:44 -0700
Message-ID: <20260806000144.3388823-1-gus@bourg.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_170219_392286_C0224CED 
X-CRM114-Status: GOOD (  19.07  )
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

From: Gus Bourg <gus@bourg.net>

When PAN is emulated by switching TTBR0_EL1, arch_efi_call_virt_setup()
installs the EFI mm into TTBR0_EL1 via uaccess_ttbr0_enable(), and only a
return from exception ever puts it back: check_and_switch_context() skips
the register write by design ("Defer TTBR0_EL1 setting for user threads to
uaccess_enable() when emulating PAN"), and __switch_to() does not touch it
either. switch_mm() updates only thread_info->ttbr0.

Since commit a5baf582f4c0 ("arm64/efi: Call EFI runtime services without
disabling preemption") the runtime call is preemptible, so the EFI worker
can now be scheduled out inside that window. An involuntary preemption is
harmless, because __swpan_entry_el1()/__swpan_exit_el1() save and restore
the state around the exception. A voluntary reschedule is not: it performs
no return from exception, so the worker resumes with another task's
TTBR0_EL1 - or reserved_pg_dir - and the next efi_mm access takes a level 0
translation fault.

There is such a preemption point in arch_efi_call_virt_setup() itself,
immediately after the TTBR0 install: __efi_fpsimd_begin() ->
kernel_neon_begin() -> put_cpu_fpsimd_context() -> local_bh_enable() ->
preempt_check_resched().

On a Khadas VIM3 (Cortex-A73/A53, no FEAT_PAN, so CONFIG_ARM64_SW_TTBR0_PAN
is in use) this reproduces as:

  Unable to handle kernel access to user memory outside uaccess routines
    at virtual address 00000000f322ff30
  Mem abort info:
    ESR = 0x0000000096000004
    FSC = 0x04: level 0 translation fault
  Internal error: Oops: 0000000096000004 [#1]  SMP
  Workqueue: efi_rts_wq efi_call_rts
  pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : efi_call_rts+0xd8/0x288
  Call trace:
   efi_call_rts+0xd8/0x288 (P)
   process_one_work+0x178/0x4f8
   worker_thread+0x194/0x328

The faulting instruction is the kernel's own load of efi.runtime->get_time;
firmware is never entered, so efi_runtime_fixup_exception() declines it
(the PC is kernel text) and the result is a full oops rather than
EFI_ABORTED. The EFI runtime path is then wedged for the rest of the boot:
efi_rts_work.efi_rts_comp is never completed and the runtime lock is never
released, so every subsequent caller blocks in uninterruptible sleep, and
poweroff hangs because EFI_RUNTIME_SERVICES is still set.

The failing window was identified with ftrace, tracing efi_call_rts,
arch_efi_call_virt_setup, kthread_use_mm, __efi_fpsimd_begin,
kernel_neon_begin and arch_efi_call_virt_teardown together with
sched_switch. Of four preemptions observed inside the window over 12726
calls, the two that landed before the TTBR0 install (in kthread_use_mm)
were harmless and the two that landed in kernel_neon_begin were not; one
of those faulted.

Keep configurations that emulate PAN on the non-preemptible path, which is
what they used before a5baf582f4c0. Systems with FEAT_PAN are unaffected:
system_uses_ttbr0_pan() is false there, uaccess_ttbr0_enable() is a no-op,
and check_and_switch_context() installs TTBR0_EL1 on every switch.

Fixes: a5baf582f4c0 ("arm64/efi: Call EFI runtime services without disabling preemption")
Cc: <stable@vger.kernel.org> # v6.19+
Assisted-by: Claude:claude-opus-5 ftrace
Signed-off-by: gus bourg <gus@bourg.net>
---
 arch/arm64/kernel/efi.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 30cd7f804398..1b666ca79758 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -166,11 +166,32 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
 	return s;
 }
 
+/*
+ * Whether an EFI runtime service call may run preemptibly.
+ *
+ * When PAN is emulated by switching TTBR0_EL1, the EFI mm is installed into
+ * the register by uaccess_ttbr0_enable() below, and only a return from
+ * exception ever puts it back: check_and_switch_context() deliberately skips
+ * the write ("Defer TTBR0_EL1 setting for user threads to uaccess_enable()
+ * when emulating PAN"), and __switch_to() never touches it. A voluntary
+ * reschedule performs no return from exception, so a preemptible runtime call
+ * can be scheduled back in holding another task's TTBR0_EL1 and take a level 0
+ * translation fault on its next efi_mm access. Keep those configurations on
+ * the non-preemptible path, which is what they used before commit
+ * a5baf582f4c0 ("arm64/efi: Call EFI runtime services without disabling
+ * preemption").
+ */
+static bool efi_runtime_preemptible(void)
+{
+	return !system_uses_ttbr0_pan() && preemptible() &&
+	       (current->flags & PF_KTHREAD);
+}
+
 void arch_efi_call_virt_setup(void)
 {
 	efi_runtime_assert_lock_held();
 
-	if (preemptible() && (current->flags & PF_KTHREAD)) {
+	if (efi_runtime_preemptible()) {
 		/*
 		 * Disable migration to ensure that a preempted EFI runtime
 		 * service call will be resumed on the same CPU. This avoids
@@ -207,7 +228,7 @@ void arch_efi_call_virt_teardown(void)
 	 */
 	uaccess_ttbr0_disable();
 
-	if (preemptible() && (current->flags & PF_KTHREAD)) {
+	if (efi_runtime_preemptible()) {
 		kthread_unuse_mm(&efi_mm);
 		migrate_enable();
 	} else {
-- 
2.53.0


