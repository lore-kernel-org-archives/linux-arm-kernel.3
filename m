Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66CD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5GUZzzZm;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DJJ6of28
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qS+HEkR0vDGWLdjeSo4joCKjj6Y1JdTXkJiDIbjQdvo=; b=5GUZzzZm85CNjAo4mFTk7b+0gd
	gn6YLv1/ayv/2f0wcYJgirZdAbZ/Rtntenj08JSem63qrDEjuwsH0Sg3uSltozY6KO8U3D9glz8mQ
	wxw5URcfULhYhzbbx5ON+/cyV4YW/N5ZxI/LGHfudm8+3EIAbrWxmCFBRaMhizxtXtEBCNc4RSZYJ
	T9EJspp1d3s1ImKS1uT0lnLZnDopvBTwi8Q/t5I0qbpe0bAbSCfkPktCvjutBBfRUChK3II0fhQI5
	6ixRFcp2Sd0OE5AIesG0UHsly7GMO0R0zFqoXYM9M1mwRikts/m/nS8R7f+1K7EPQBw56KRAZwtUE
	v0YGJq+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTS9-00000009tzo-2rIS;
	Thu, 29 Oct 2026 16:58:13 +0000
Received: from out-73.mta0.migadu.com ([2001:41d0:1004:224b::49] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRo-00000009tYk-0vSl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:57:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CAYOtMfAj2CKhNyLkHjEGE+Ku1FgcGL4RmYNUgnppcs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793293069; v=1; x=1793897869;
 b=DJJ6of28Sv53LKrKVpHYxU8UvNo/3F/LAeH/M2sEW9rTsJBNEGzpOMrVf+DGC8Jpnn1d1qIY
 pURL1Sanj3w5ARUiBNlp5LIY8SPvHaXCvGproA52siS7rf7jNznJbk7JMCDIdmOjn7E385Z+Kds
 cLAewYbrHlWZPtgNnjh4mX3A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b8a209880955641a;
	Thu, 29 Oct 2026 16:57:49 +0000
X-Mizu-Trace-ID: b8a209880955641a
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 16:57:38 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Puranjay Mohan <puranjay@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Ben Cressey <ben@cressey.dev>, 
	Florent Revest <florent.revest@linux.dev>, Bill Wendling <morbo@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Subject: [PATCH v3 7/7] arm64: ftrace: Allow CALL_OPS on kCFI kernels built
 with Rust
Message-ID: <20261029-b4-arm64-callops-kcfi-v3-7-1b011ad5ddec@linux.dev>
X-Mailer: b4 0.15.2
References: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095753_982613_BA91CF53 
X-CRM114-Status: GOOD (  13.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pass -Zpatchable-function-entry=M,M,.discard.patchable_function_entries
to rustc when CFI and CALL_OPS are both enabled, so Rust functions get
the same prefix NOPs as C functions. The section argument needs
Rust 1.98 [1]. Probe for it, and let ARM64_CFI_PERMITS_CALL_OPS
accept RUST=y when the probe passes.

Filter -fpatchable-function-entry out of bindgen's C flags on every
architecture, not only on arm64 with CFI, since removing the flag does
not change the ABI.

[1] https://github.com/rust-lang/rust/pull/157445

Suggested-by: Ben Cressey <ben@cressey.dev>
Reviewed-by: Ben Cressey <ben@cressey.dev>
Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
Acked-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
---
 arch/arm64/Kconfig  | 7 ++++++-
 arch/arm64/Makefile | 3 +++
 rust/Makefile       | 7 ++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e8cb44d881d0..e64d053e1854 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -277,11 +277,16 @@ config CC_HAS_PATCHABLE_FUNCTION_ENTRY_SECTION
 	# https://github.com/llvm/llvm-project/pull/131230
 	def_bool $(cc-option,-fpatchable-function-entry=1$(comma)1$(comma).discard.patchable_function_entries)
 
+config RUSTC_HAS_PATCHABLE_FUNCTION_ENTRY_SECTION
+	# The section argument needs Rust 1.98.0 or later:
+	# https://github.com/rust-lang/rust/pull/157445
+	def_bool $(rustc-option,-Zpatchable-function-entry=1$(comma)1$(comma).discard.patchable_function_entries)
+
 config ARM64_CFI_PERMITS_CALL_OPS
 	def_bool y
 	depends on CFI
 	depends on CC_HAS_PATCHABLE_FUNCTION_ENTRY_SECTION
-	depends on !RUST
+	depends on !RUST || RUSTC_HAS_PATCHABLE_FUNCTION_ENTRY_SECTION
 
 config ARM64_FUNCTION_PREFIX_NOPS
 	int
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 9fbfe5ab3724..b47733b585b5 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -147,6 +147,9 @@ ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS),y)
 			 -DCC_USING_PATCHABLE_FUNCTION_PREFIX=$(prefix_nops)
     KBUILD_CFLAGS += $(CFI_PREFIX_CFLAGS)
     export CFI_PREFIX_CFLAGS
+    # Rust functions are not patched by ftrace, but they are called indirectly
+    # from C and make indirect calls themselves, so they need the same prefix.
+    KBUILD_RUSTFLAGS += -Zpatchable-function-entry=$(prefix_nops),$(prefix_nops),.discard.patchable_function_entries
   endif
 else ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_ARGS),y)
   KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..686964c826f7 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -511,7 +511,12 @@ endif
 # prototypes for functions like `memcpy` -- if this flag is not passed,
 # `bindgen`-generated prototypes use `c_ulong` or `c_uint` depending on
 # architecture instead of generating `usize`.
-bindgen_c_flags_final = $(bindgen_c_flags_lto) -fno-builtin -D__BINDGEN__
+#
+# Do not pass -fpatchable-function-entry to bindgen: its libclang may not
+# support the section argument (Clang >= 21), and removing the flag does not
+# change the ABI.
+bindgen_c_flags_final = $(filter-out -fpatchable-function-entry=%, \
+	$(bindgen_c_flags_lto)) -fno-builtin -D__BINDGEN__
 
 # `--rust-target` points to our minimum supported Rust version.
 quiet_cmd_bindgen = BINDGEN $@

-- 
2.54.0


