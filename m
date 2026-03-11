Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F564103E2E8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 22:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2h3JBsqRMrN/N2OOa19DOwOFVIU+aepcjKyUB7UTT/Q=; b=MrT4yFGnwOB1Qw++qCvjVtZBO8
	T3Ptcyk6/iEXP/6M8ELq+WGamGzScbZtuWKvosR2thGkM8X68HTMu95r/2Cj+lLmn8XN96sRMi2XM
	XD5UZszvPR2cmBPm/Wjzh/mSAT0TkVe2HHUJXgoctWonzKzSlq2FJxBNjivQlbr2pwcrHppN3fAvT
	QNJ40+44dQzKQokmmVk8tRD2zwRHQe8MwsZYvClOQCyG+MFED3R3vLQ4QPskRziMGnOyZSDw1MNi+
	4QJMEiZgocdQQUUCR7hyc2eQCvIzajqe8geIzNPDjKekNLx+df/PYV+cfd2WZATZ20bLHNE2PWKWw
	2/1Nq1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rsr-0000000CeUg-1WLM;
	Wed, 11 Mar 2026 22:18:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rso-0000000CeTq-2iiu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 22:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01AAD417D2;
	Wed, 11 Mar 2026 22:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89708C4CEF7;
	Wed, 11 Mar 2026 22:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773267502;
	bh=UkcWuDDKFCtOzPMcaQPRi4iOunlDeFvQXT87qyfDCmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9J3sgLA9S//wXI5sCKh7YLMqn41GDJmYfc598b7ndkFh8SDdWL+zRt5FfHTApL1t
	 eFw4mxiTQ52uHOiZnwnfhQkLZZ69FGf+Omdav3EFSFZvGLzDVaBr6C3Rjwngxabxwz
	 d+0JasLxpFrmuqlAqg/17icDaUayGe59gigm4h+zHWLCUCAAoz9z33wVCRN3oC28+B
	 I4sw7mxR8qx/+1CrghYdwu7qyQ4Nhd5ot4eqj1gDAOhg3ejLRDXDKaDXhl85fG3i4o
	 mrUjtO5XPJyLmYaTqf1esEqls3WQjEw/BgecuDmQ9+r0WBP4atyMefSKeR4bZ5orPU
	 G2ybt0con6eMw==
Date: Wed, 11 Mar 2026 15:18:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jstultz@google.com, qperret@google.com, will@kernel.org,
	aneesh.kumar@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 18/30] tracing: Check for undefined symbols in
 simple_ring_buffer
Message-ID: <20260311221816.GA316631@ax162>
References: <20260309162516.2623589-1-vdonnefort@google.com>
 <20260309162516.2623589-19-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309162516.2623589-19-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_151826_755130_10117A93 
X-CRM114-Status: GOOD (  19.29  )
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

Hi Vincent,

On Mon, Mar 09, 2026 at 04:25:04PM +0000, Vincent Donnefort wrote:
> The simple_ring_buffer implementation must remain simple enough to be
> used by the pKVM hypervisor. Prevent the object build if unresolved
> symbols are found.
> 
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index d106beca8d7f..3182e1bc1cf7 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -132,4 +132,20 @@ obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
>  obj-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o
>  obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
>  
> +#
> +# simple_ring_buffer is used by the pKVM hypervisor which does not have access
> +# to all kernel symbols. Fail the build if forbidden symbols are found.
> +#
> +UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov __aeabi_unwind
> +UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
> +UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
> +
> +quiet_cmd_check_undefined = NM      $<
> +      cmd_check_undefined = test -z "`$(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST)`"

This check triggers when building allmodconfig targeting arm, arm64,
powerpc, and x86_64 (at least, I did not test more at the moment) with
clang. If this is a hard failure, this really needs to print something
out to the developer/user to help them debug off the bat, versus having
to manually dig the $(NM) command out from the .cmd file or V=1. I came
up with

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 3182e1bc1cf7..c725b06876bc 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -141,7 +141,13 @@ UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sani
 UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
 
 quiet_cmd_check_undefined = NM      $<
-      cmd_check_undefined = test -z "`$(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST)`"
+      cmd_check_undefined = \
+          undefsyms=$$($(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST) || true); \
+          if [ -n "$$undefsyms" ]; then \
+              echo "Unexpected symbols in $<:" >&2; \
+              echo "$$undefsyms" >&2; \
+              false; \
+          fi
 
 $(obj)/%.o.checked: $(obj)/%.o FORCE
 	$(call if_changed,check_undefined)
--

which prints

  Unexpected symbols in kernel/trace/simple_ring_buffer.o:
                   U llvm_gcda_emit_arcs
                   U llvm_gcda_emit_function
                   U llvm_gcda_end_file
                   U llvm_gcda_start_file
                   U llvm_gcda_summary_info
                   U llvm_gcov_init

for arm64, which makes sense since these are LLVM specific GCOV symbols,
so they should probably get the same treatment as the other ones:

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index c725b06876bc..d464e3aa5bdd 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -136,8 +136,8 @@ obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
 # simple_ring_buffer is used by the pKVM hypervisor which does not have access
 # to all kernel symbols. Fail the build if forbidden symbols are found.
 #
-UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov __aeabi_unwind
-UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
+UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov llvm_gcda llvm_gcov
+UNDEFINED_ALLOWLIST += __aeabi_unwind __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
 UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
 
 quiet_cmd_check_undefined = NM      $<
--

For x86_64, I see

  Unexpected symbols in kernel/trace/simple_ring_buffer.o:
                   U __clear_pages_unrolled
                   U __memmove
                   U copy_page

which comes from the use of KCFI_ADDRESSABLE(), since allmodconfig has
CONFIG_CFI=y.

For powerpc (with both clang and GCC), I see

  Unexpected symbols in kernel/trace/simple_ring_buffer.o:
                   U .TOC.

For arm (with both clang and GCC), I see

  Unexpected symbols in kernel/trace/simple_ring_buffer.o:
           U __stack_chk_guard
           U warn_slowpath_fmt

Presumably adding all of those should be fine as well?

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index d464e3aa5bdd..4f120cb8c79c 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -137,7 +137,8 @@ obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
 # to all kernel symbols. Fail the build if forbidden symbols are found.
 #
 UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov llvm_gcda llvm_gcov
-UNDEFINED_ALLOWLIST += __aeabi_unwind __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
+UNDEFINED_ALLOWLIST += __aeabi_unwind __stack_chk_fail __stack_chk_guard stackleak_track_stack __ref_stack __sanitizer
+UNDEFINED_ALLOWLIST += \.TOC\. __clear_pages_unrolled __memmove copy_page warn_slowpath_fmt
 UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
 
 quiet_cmd_check_undefined = NM      $<
--

I don't mind sending a series for these, I just wanted to make sure I
was reasoning about everything correctly.

Cheers,
Nathan

