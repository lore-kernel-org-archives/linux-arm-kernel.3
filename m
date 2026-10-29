Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775CC606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sKbAuRiO;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vHKR8/fy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BfqsXxL1rgrukdQyTNx4+JIhiUPg8ohWg3FwnLI2hP8=; b=sKbAuRiOE1vw32K7259v/4dhCd
	lVGOEvahgoUU4ke6zv8GhDBkAJ3PckPz7qIhWjgwzwzLwWzzbU/J6B3U9cQLBygj3yAavMGz99OF9
	P2G/qAxL7ABjEl2bZSXCRGsSPcxhB8Ds7JquVVm7s2od2Fq18wW29AUhlgZU+WvaL2cldAs5lP6nS
	s/dwcw89T9/CxTJzVfGXxqYEo0iFFpD47j8QyUvYIz/oo7lngcYkgMcX/+GGx0hvbJkscLVu3oqTI
	ly70rWOkNF//Ydsd3t2yoQXanyozh3EQYrx4K2NfVu+jRBTls2iEHmzn7DwVsUIr8LfdRR5Q3TmFt
	blSWH8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRK-00000009t8g-3eVJ;
	Thu, 29 Oct 2026 16:57:22 +0000
Received: from out-62.mta1.migadu.com ([95.215.58.62] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRH-00000009t6t-2v5k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:57:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xrX26dabxOZos4tCxbHq0hnwzFDsl+RM+u3ssoKzekQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793293037; v=1; x=1793897837;
 b=vHKR8/fy1gGLzPk/7dE/yvu/z1/wCGN2geIm5nFwlLMJYL45BnKFjiqdZttWfGTrfRf9jdfO
 lxiro3UjQmQVw0rHOKTxdrzNpXJ1LGYb4urQGNX5YSP3Ad8hyLkH2j4R+PrN6WjB8DH0kJLgVae
 Em15vXBImb7NBmiX4KFZ0n20=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 47818bb9047c54b2;
	Thu, 29 Oct 2026 16:57:17 +0000
X-Mizu-Trace-ID: 47818bb9047c54b2
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 16:57:07 +0000
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
Subject: [PATCH v3 6/7] arm64: ftrace: Use five prefix NOPs on ThinLTO
 kernels with BTI
Message-ID: <20261029-b4-arm64-callops-kcfi-v3-6-1b011ad5ddec@linux.dev>
X-Mailer: b4 0.15.2
References: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095719_887594_DCA0271E 
X-CRM114-Status: GOOD (  11.78  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Default CONFIG_ARM64_FUNCTION_PREFIX_NOPS to 5 on ThinLTO kernels with
BTI. Many functions there have a landing pad but no hash. That moves the
entry point 4 bytes. The 8-byte slot lands on the landing pad and ftrace
refuses the site. With five NOPs every function has a slot.

Commit d3359af21fc9e ("arm64: bti: Disable in-kernel BTI with recent
versions of Clang") keeps BTI off on clang 21 or later, so this default
does not trigger on a mainline build today. Josh Poimboeuf's series to
bring it back is under review [1].

With five NOPs the series costs 7.4% of .text on a defconfig-based
ThinLTO kernel with clang 21.1.4:

  Kernel                 || .text bytes | Delta       | Delta
  =======================++=============+=============+=======
  ThinLTO kCFI, base     ||  21,466,256 |             |
  ThinLTO kCFI, M = 5    ||  23,047,312 |  +1,581,056 | +7.4%
  -----------------------++-------------+-------------+-------

ftracetest results match with and without this series. The three
failures on a ThinLTO kernel are pre-existing. The BPF trampoline,
struct_ops and kprobe_multi selftests pass with CFI enforcing.

[1] https://lore.kernel.org/all/cover.1786768375.git.jpoimboe@kernel.org/

Reviewed-by: Ben Cressey <ben@cressey.dev>
Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
Acked-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
---
 arch/arm64/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6715adcae38b..e8cb44d881d0 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -285,6 +285,8 @@ config ARM64_CFI_PERMITS_CALL_OPS
 
 config ARM64_FUNCTION_PREFIX_NOPS
 	int
+	default 5 if DYNAMIC_FTRACE_WITH_CALL_OPS && CFI && \
+		     (LTO_CLANG_THIN || LTO_CLANG_THIN_DIST) && ARM64_BTI_KERNEL
 	default 3 if DYNAMIC_FTRACE_WITH_CALL_OPS && CFI
 	default 2 if DYNAMIC_FTRACE_WITH_CALL_OPS
 	default 0

-- 
2.54.0


