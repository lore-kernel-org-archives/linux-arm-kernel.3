Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907B1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PEk82CLr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tEl6cpHA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KoCxuWWjDP1yVw1HvFaevXnQ4QC4h2u92EWwxCuPW/M=; b=PEk82CLrEkljxAitXxpGzXRHUM
	ipplntfXOMcPwcqtYSu1rhCH992hpWsmUMAKAvA2/lma5ghT96ZDyCtRaspKlD0a0jBORjfraBBx0
	5y/b3sIALr02rI4aQoUzW23Wbvl0CqWsWH515bHurqVL8AzFPabHG20rwLgLK4EmVmvD8OV/E5M91
	AsDk9+/604OU480TiUgfvpDe9NSfuqs1Mu6xkt7nu72w1Kt8A6mQAyn7+q20aHP6WFFnc8SLAJQZ+
	Xz5tHZBHeKi/ysfOSFpwneeUJS0EPsfsyO43i2mcVEJMrVCrW5cBj0CQrbKqTElhrKIG5Z8ul+VXQ
	I19DvVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTOH-00000009sQz-3lik;
	Thu, 29 Oct 2026 16:54:14 +0000
Received: from out-140.mta1.migadu.com ([95.215.58.140] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTOE-00000009sQ8-368G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:54:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rJ+GI9mSP2GAsgikWKRz/p+K9ZdSdVmHlMdYCh8VOxs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793292847; v=1; x=1793897647;
 b=tEl6cpHAtlunNNiZkjSyzVXX/bFpNZ1L7FiVP5ZBpqLFUH0FqeQnS6pzgRm2U9zJeRjiJ6kO
 apM1kLT2Cz+JSlxR/feG7HAFpNQxVco7kOxuv88/RzuR5Yf3UMb4ngwHeRIJqikj/ky6pZlNJIL
 91/zkTlXPShxZxzQLgI1yhqM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 66c164750fba40cd;
	Thu, 29 Oct 2026 16:54:07 +0000
X-Mizu-Trace-ID: 66c164750fba40cd
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 16:53:58 +0000
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
Subject: [PATCH v3 1/7] scripts/sorttable: Make the arm64 before_func offset
 configurable
Message-ID: <20261029-b4-arm64-callops-kcfi-v3-1-1b011ad5ddec@linux.dev>
X-Mailer: b4 0.15.2
References: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095410_949646_D385D87A 
X-CRM114-Status: GOOD (  12.66  )
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

sorttable hardcodes before_func to 8 bytes on arm64 (two prefix NOPs).
Make it configurable from CONFIG_ARM64_FUNCTION_PREFIX_NOPS instead.
kCFI kernels with CALL_OPS need three NOPs. The symbol does not exist
yet, so no functional change.

Reviewed-by: Ben Cressey <ben@cressey.dev>
Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
Acked-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
---
 scripts/Makefile    | 4 ++++
 scripts/sorttable.c | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index d7fbb7ca098b..7ef1c84cf79d 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -54,6 +54,10 @@ endif
 
 ifdef CONFIG_BUILDTIME_MCOUNT_SORT
 HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
+# 0 or unset (no prefix NOPs) leaves sorttable's built-in default in place.
+ifneq ($(filter-out 0,$(CONFIG_ARM64_FUNCTION_PREFIX_NOPS)),)
+HOSTCFLAGS_sorttable.o += -DFUNCTION_PREFIX_BYTES=$(shell expr 4 \* $(CONFIG_ARM64_FUNCTION_PREFIX_NOPS))
+endif
 endif
 
 hostprogs += gen_init_cpio
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c4251..2e951f2f60e8 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -281,6 +281,11 @@ static int add_field(uint64_t addr, uint64_t size)
 /* Used for when mcount/fentry is before the function entry */
 static int before_func;
 
+/* How far before the function entry a patchable entry may be recorded */
+#ifndef FUNCTION_PREFIX_BYTES
+#define FUNCTION_PREFIX_BYTES	8
+#endif
+
 /* Only return match if the address lies inside the function size */
 static int cmp_func_addr(const void *K, const void *A)
 {
@@ -912,7 +917,7 @@ static int do_file(char const *const fname, void *addr)
 		/* fallthrough */
 	case EM_RISCV:
 		/* arm64 and RISC-V place patchable entries before the function. */
-		before_func = 8;
+		before_func = FUNCTION_PREFIX_BYTES;
 #else
 	case EM_AARCH64:
 	case EM_RISCV:

-- 
2.54.0


