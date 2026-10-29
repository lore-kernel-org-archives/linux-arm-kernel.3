Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dLCTi8Db;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=O2XMX68m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o9qVXnmYPWwEWL6vYT0sE4rqArVgEZmH/7qwJmZBvWo=; b=dLCTi8DbD6yI/6
	Gvy0pKSKJtat0xAQ4F9K7FoCy4GuWG1Z4OaWKtxlLm/nPlwsgwsQ8vqyUBRjm/Q5Kfr6fQMAZ+ZcG
	leoPlpVeGLwo4ZfH2CtBS2v0MHwLQUR2m+SReKO8PLsZnU+vzrlJeEd622nyMCaDTY3zvVacX1eeA
	20W9fvVX+9t0lBCPpB+un2E7W34SdJuLUMzLjWw6hv2/uQLVvrkb053BdiA4vArouUC0os1grpfqB
	N8s9/dRJNr2U+WBwyaNBEPU6waCC7d19u+sSkVLsUVUU0mrg4JjvKHXxPVES0mCL/WF4iHyXU0VYW
	KZ70N9+X06ID6oW1ZDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTS1-00000009tqN-3dWm;
	Thu, 29 Oct 2026 16:58:05 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRg-00000009tN5-3f0E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:57:46 +0000
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id F0AF6C0482;
	Thu, 29 Oct 2026 16:57:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id A233B2000E;
	Thu, 29 Oct 2026 16:57:34 +0000 (UTC)
Date: Thu, 29 Oct 2026 12:57:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook
 <kees@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Puranjay Mohan <puranjay@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Ben
 Cressey <ben@cressey.dev>, Florent Revest <florent.revest@linux.dev>, Bill
 Wendling <morbo@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org
Subject: Re: [PATCH v3 1/7] scripts/sorttable: Make the arm64 before_func
 offset configurable
Message-ID: <20261029125733.75e80eec@gandalf.local.home>
In-Reply-To: <20261029-b4-arm64-callops-kcfi-v3-1-1b011ad5ddec@linux.dev>
References: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
	<20261029-b4-arm64-callops-kcfi-v3-1-1b011ad5ddec@linux.dev>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: A233B2000E
X-Stat-Signature: 5754sd9cpbybo3dm5dhdrqmqhjwxwxuo
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX184EGAq7MiFwVvUPkOypaUue5Jo3FQ2e0k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=o9qVXnmYPWwEWL6vYT0sE4rqArVgEZmH/7qwJmZBvWo=; b=O2XMX68m845O3WDKi9BwaEt1caAlqa+gEtKsxmrIIXNytcUCtD3BLyldTS0/IqEKS+sM7VNwEUlYgK6umqv9OZFhwN3O6EcrWATSvs8oQY4SOY6qfWglzjOxnxrIIqI8aklfLUt5fgWJsPkh/9yXX3eCqzf2tdv2eG8c3TO57KM=
X-HE-Tag: 1793293054-777104
X-HE-Meta: U2FsdGVkX189UC0rZjNrMJ6F5e65lS1+Gv5SMF2ZBhu39yNWsJkFs5+b6b9Q7YHTZ0snpCrHrxfBnDULhMEot5zJLRVz16QoQvulVN2CjfPk/B4EESInm3Qu2xcMbOjvRUMSZRmcu7Dj0JBbZ2rVgfy2wQ2z3CVuhez61PkigHP9sX7MmtxCCC3hgT+XwqT65rAlL0cskuWuJAgOialQh17Xaia6U9QUQBR/v1+1u+dr/FCg5+MG7XBrcDyJ/uDV+BxJRnh7vFNPdsY5om5V62LCUzZqD7vQuuF2wpxe+IuJ0UzeFfIc/MT8nHjhRVBEEtcK9bRoft+1iCaWP9ubvWrJAZ3Q6yh4zFo5GQOjHX5aayr72SZvIX5uZJPXZ9sQu7Cr0vzyiAGwZ1F60kRIfg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095745_003996_58D652F9 
X-CRM114-Status: GOOD (  20.44  )
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
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 16:53:58 +0000
"Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev> wrote:

> sorttable hardcodes before_func to 8 bytes on arm64 (two prefix NOPs).
> Make it configurable from CONFIG_ARM64_FUNCTION_PREFIX_NOPS instead.
> kCFI kernels with CALL_OPS need three NOPs. The symbol does not exist
> yet, so no functional change.
> 
> Reviewed-by: Ben Cressey <ben@cressey.dev>
> Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
> Acked-by: Alexei Starovoitov <ast@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>

Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

> ---
>  scripts/Makefile    | 4 ++++
>  scripts/sorttable.c | 7 ++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile b/scripts/Makefile
> index d7fbb7ca098b..7ef1c84cf79d 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -54,6 +54,10 @@ endif
>  
>  ifdef CONFIG_BUILDTIME_MCOUNT_SORT
>  HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
> +# 0 or unset (no prefix NOPs) leaves sorttable's built-in default in place.
> +ifneq ($(filter-out 0,$(CONFIG_ARM64_FUNCTION_PREFIX_NOPS)),)
> +HOSTCFLAGS_sorttable.o += -DFUNCTION_PREFIX_BYTES=$(shell expr 4 \* $(CONFIG_ARM64_FUNCTION_PREFIX_NOPS))
> +endif
>  endif
>  
>  hostprogs += gen_init_cpio
> diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> index 88e49a5c4251..2e951f2f60e8 100644
> --- a/scripts/sorttable.c
> +++ b/scripts/sorttable.c
> @@ -281,6 +281,11 @@ static int add_field(uint64_t addr, uint64_t size)
>  /* Used for when mcount/fentry is before the function entry */
>  static int before_func;
>  
> +/* How far before the function entry a patchable entry may be recorded */
> +#ifndef FUNCTION_PREFIX_BYTES
> +#define FUNCTION_PREFIX_BYTES	8
> +#endif
> +
>  /* Only return match if the address lies inside the function size */
>  static int cmp_func_addr(const void *K, const void *A)
>  {
> @@ -912,7 +917,7 @@ static int do_file(char const *const fname, void *addr)
>  		/* fallthrough */
>  	case EM_RISCV:
>  		/* arm64 and RISC-V place patchable entries before the function. */
> -		before_func = 8;
> +		before_func = FUNCTION_PREFIX_BYTES;
>  #else
>  	case EM_AARCH64:
>  	case EM_RISCV:
> 


