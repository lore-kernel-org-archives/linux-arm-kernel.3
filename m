Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4278606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y3Q6UKl/;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fKHFCO3I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EfJ0KxzbqIuij0yRGv6RKskmiOg7DtOrzfgh1If9ul4=; b=y3Q6UKl/gmKCjz7PbA0dgTaVIw
	B93zhRm2nrW+MBwJTw2DYtofnz1zyhPnVrkPRwL+PCSooW0qk/fDqFqjU0B4ZfkICsg939vfJCGy7
	+rv4Z5SBLn5cDSAKuKsW+oSGJISWRaBCNPB+wAfE9YpTOBjSXx7qBaCswO5+xDUlRPKWWFEYv7Ctf
	2zr6rKrpujxX+y/CI10uemmo+p/Vn7CDStEmnXZ4gUfsKEwEyqNMM9ZqcJ09koNym9Bo+OXHw/iSI
	31Ojz6aTKsoA6r8sxRnC9mAUzfUO1JbsNI4kh0IRp1FlZuec5zAb0J73ImUH5z7GuIbn8VtYIZcNu
	//W8fHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTP8-00000009sdL-37mH;
	Thu, 29 Oct 2026 16:55:06 +0000
Received: from out-247.mta0.migadu.com ([2001:41d0:1004:224b::f7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTP6-00000009sbY-0O0O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:55:05 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MWQsoPirKRzLtu5mUH+dnsV+vc6wl756TnIvbej6NSU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793292901; v=1; x=1793897701;
 b=fKHFCO3IcYVv8q26Kb1NguVMFyph5lYZG2bFWdznGCvA+zImJOH5ACCK4sWtGZauxR3cqfoA
 QvDDfk4NNQQbd11T+wrJcZBc+o1WVEOj9nhcr2so6cx7vHREk6fI4GjZfzFdFtXXL0OlVwK+O/g
 uUaawWkr792DIeEup3IuXqFg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6b12b908b1c5348a;
	Thu, 29 Oct 2026 16:55:00 +0000
X-Mizu-Trace-ID: 6b12b908b1c5348a
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 16:54:51 +0000
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
Subject: [PATCH v3 2/7] compiler_types: Let notrace keep the function prefix
 NOPs
Message-ID: <20261029-b4-arm64-callops-kcfi-v3-2-1b011ad5ddec@linux.dev>
X-Mailer: b4 0.15.2
References: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095504_279187_CE495066 
X-CRM114-Status: GOOD (  11.34  )
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

Let notrace keep the prefix NOPs when the architecture defines
CC_USING_PATCHABLE_FUNCTION_PREFIX. kCFI callers check the type hash
at a fixed offset before the entry point, so a notrace function needs
the same prefix NOPs as any other. Record the entry in a section the
linker drops, so ftrace never sees it. Clang 21 takes a section name
as a third argument of the attribute. Nothing defines the macro yet,
so no functional change.

Reviewed-by: Ben Cressey <ben@cressey.dev>
Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
Acked-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
---
 include/linux/compiler_types.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f139007..43dafaa06194 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -211,6 +211,15 @@ struct ftrace_likely_data {
 
 #if defined(CC_USING_HOTPATCH)
 #define notrace			__attribute__((hotpatch(0, 0)))
+#elif defined(CC_USING_PATCHABLE_FUNCTION_PREFIX) && !defined(__BINDGEN__)
+/*
+ * Not for bindgen: its libclang may not support the section argument
+ * (Clang >= 21), and leaving the attribute out does not change the ABI.
+ */
+#define notrace								\
+	__attribute__((patchable_function_entry(CC_USING_PATCHABLE_FUNCTION_PREFIX, \
+						 CC_USING_PATCHABLE_FUNCTION_PREFIX, \
+						 ".discard.patchable_function_entries")))
 #elif defined(CC_USING_PATCHABLE_FUNCTION_ENTRY)
 #define notrace			__attribute__((patchable_function_entry(0, 0)))
 #else

-- 
2.54.0


