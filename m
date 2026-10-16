Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE9BCCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 19:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiRo02OA1IxHJkhQCnHi5URLw0bi6CvLtMWBM69Y8xM=; b=tgigX2gvryBKRTy8YtjE6zitrZ
	1+se6GXf7VI71ticGoZcxOccBgCrJE9akA3IuYRCHCx4QTv1mxx3KCisqV1VRT0HYdF7uUmsoZzF0
	nEE+WwugBl3nxJJGt/0qr1Ku9LrxnjIBbszKhDZPhUozouHj9lUlcWP17qatnRoiG2c36Bvepe8BF
	QJ3+KrHZLHGQ5e0g3xmtv2iInh/M73aRDeAHpSq5fPihrPTKy0V4UibckEuqWLXKbxcKmY/TfaR21
	2NuZp/u7boxf+RF3DaZX2BNJ3od5GVthzZSVQIRu2bBSO9g1K/8PlrNI/gTs0F+6oQ8q4kilVFk4d
	J0EzxcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsj-00000003vMb-3T25;
	Fri, 16 Oct 2026 19:46:21 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsh-00000003vLB-078G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 19:46:20 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-30b6dad2382so774845eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179978; x=1792784778; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RiRo02OA1IxHJkhQCnHi5URLw0bi6CvLtMWBM69Y8xM=;
        b=Hd1E7w/e5LQrlPT3uookkXF3JffucdO8eN7aOMLyac7Vx/SfAe/IJQI2pZuuX0Zbh9
         a1pISFcwYgwmDwVXkbSSFK3Sn75kVzpJsH2jX+PDtCOVqnyqvbn3B17AJFmRBtO+2B9b
         h9PEY5OeZAzcFxc6EUYmU0W4hIRiRSdxsWtM1YVErMDT+QHkFOMuucADqQAIHnHfNW8l
         NpMlFZFtO7ilHOKQDjDmPNnakdKBhbTE77eeCGmPWufMCWXM4NMZxpESr0NFEJmBJmwG
         TfGQnQwIQFtLIuvkwjtGg10SJi19sVSbxJppfqhpsU8RdE4y3psUp6At4jPiGaSJ1MdF
         1K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179978; x=1792784778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiRo02OA1IxHJkhQCnHi5URLw0bi6CvLtMWBM69Y8xM=;
        b=czNxzD4nFKr6UEPS4HrlO+kyUGrLStWw1bo/kDDCvC6cHTJ+tad0y0wt5kcj7mbGcb
         VffUVywQrWztWsJwGAJ2mHbpHuEzclHZXio5TaXkn0n1tExgfrAK58YRJ6euqTSeFZxW
         EodKdXRUfxxSZk36UJEO+LAnSzE/ziGpsg0LLT+zDLNlZ7ea97mlZvjZTzLL7S+4+Kyl
         03lZ8iqok3+UP6M4gPqWhcb8llRYwYcHzl4nZ1Xvlwewb6mtHzsHAZWlzQv+y5rV1S1o
         +/UR3IElw/DOYDnKrH5lzx/zqJ3H8rGMg3k/5vJU7FWfKNhdPYeXVcICxMJjyl3HmsZ+
         ai8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwKj26aj34F1/ysEx/wXmV3x9ddlCj0iOTP+vOmtLpT1FE565NE2i+OJByM3jSexzbPcSjw7sfHQ+0CQYpAGSF@lists.infradead.org
X-Gm-Message-State: AFq9FYJLf2t890sWYH+vfjXOpsK7lUFrjFT83wnT/BUd656Zr1nXPM48
	ygmDnFE1cCsv5wfP1/o5N3GBXaP27RN+NWFs9ZmaIxZQLJSHMErl5T47
X-Gm-Gg: AYBFou3ANOY7D8GbLhvZEFJU32aF7n3eMMliDYcLwuViyZpzYMwGqSHcNi5DJYacHsZ
	Dv2jgJPUJlwFp63Dr9q74vSA14+PPd1QugYAU6iEU/vgz0/9YQpE0W6K2lGIoEs06XUtHSPk0kU
	caAnBAlJzqPoBKhiygXlm5P2jbC4FHBJnWf7YehO075w7DGnmKlPBNgXxY4wm0q6CI6xtslYRyX
	d0qp9+Fiw4wXSGNCsiBZVTu7/w3mlGWF743i01reLf3u51DrdK9B0HN9m/WIugOuq5s8BeJv+LB
	+qAYX+KksJM04aBQMYxJ0sPh9VG146f0ZQ4iwFdVQq+5KxETk+js1Bqikqnc340APNk705zcZXz
	zUCzovo5VR40f33P4HJq0P5KA0dGYxeha7m96BSIUJMM7uVbgLD031XO6glq5hakp6YKH5m0/Dg
	SJoQStEj9DZC2pX9bSyIIYD/QyJcinU8mt6jKTAC05RFsU/CfEkLzdG/giShrMQYCO
X-Received: by 2002:a05:701b:2712:b0:151:ece6:b16b with SMTP id a92af1059eb24-18512c38159mr1013993c88.7.1792179977759;
        Fri, 16 Oct 2026 12:46:17 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:16 -0700 (PDT)
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
Subject: [PATCH 1/4] arm64/gcs: release GCS on failed fork
Date: Fri, 16 Oct 2026 16:46:00 -0300
Message-ID: <2539f61f79a6053e2a33a1d1ae9df09013c04bd8.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_124619_085332_F4CAF0D0 
X-CRM114-Status: GOOD (  16.50  )
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

copy_thread() maps a GCS for a CLONE_VM child and can still return
0. A later copy_process() failure then goes through
bad_fork_cleanup_thread, which calls exit_thread(). The hole this
series hits is clone3(CLONE_VM|CLONE_PIDFD) when put_user() of the
pidfd fails after that mapping. arm64 did not implement
exit_thread(). deactivate_mm() is what normally calls gcs_free(),
and it does not run on this path. Each rejected clone leaves one
GCS VMA in the parent's mm until the mm dies.

Select HAVE_EXIT_THREAD and free the child's GCS from
exit_thread(). gcs_free() already ignores a cleared base and a
different mm, so the usual exit path (deactivate_mm() then this) is
a no-op the second time. copy_thread_gcs() zeros the inherited
tracking before a user-thread allocation, so an allocation error
still skips exit_thread() with nothing to unmap.

A kthread copies the caller's GCS fields via arch_dup_task_struct().
kernel_thread() uses CLONE_VM, so during a failed copy_process()
the child still shares the caller's mm and gcs_free()'s mm check
does not save us. Clear the inherited tracking as part of kthread
setup.

Tested with CONFIG_ARM64_GCS on QEMU 11.1.2 -machine virt -cpu max.
Sixteen clone3() calls with CLONE_VM|CLONE_PIDFD and an unwritable
pidfd pointer leaked 16 GCS VMAs without the fix. With it, the VMA
count was unchanged and call/return on the parent still used the
original GCS. A successful clone3 child exit with the same flags
runs deactivate_mm() and then exit_thread().

Fixes: 506496bcbb42 ("arm64/gcs: Ensure that new threads have a GCS")
Cc: stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/arm64/Kconfig          |  1 +
 arch/arm64/kernel/process.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a695f5..c7fc79409f98 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -177,6 +177,7 @@ config ARM64
 	select HAVE_ARM_SMCCC
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_EBPF_JIT
+	select HAVE_EXIT_THREAD
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..eb5314b4b42b 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -341,6 +341,16 @@ void flush_thread(void)
 	flush_gcs();
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/*
+	 * copy_process() calls this after copy_thread() returns 0.
+	 * deactivate_mm() does not run on that failure path.
+	 * gcs_free() is a no-op once gcs_base is cleared.
+	 */
+	gcs_free(tsk);
+}
+
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
@@ -503,6 +513,17 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 		p->thread.cpu_context.x19 = (unsigned long)args->fn;
 		p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
+#ifdef CONFIG_ARM64_GCS
+		/*
+		 * kernel_thread() uses CLONE_VM, so a failed
+		 * copy_process() still shares the caller's mm.
+		 * Inherited GCS tracking would then look like a
+		 * child mapping to gcs_free().
+		 */
+		p->thread.gcs_base = 0;
+		p->thread.gcs_size = 0;
+		p->thread.gcspr_el0 = 0;
+#endif
 
 		if (system_supports_poe())
 			p->thread.por_el0 = POR_EL0_INIT;
-- 
2.43.0


