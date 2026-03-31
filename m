Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7F210F92E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEpT5TzT0dN+PQ3W7kSlPgkgm8/9F2mXYE3bc4Etef0=; b=rpYzdzZAKYaMkXV/iHe7M95tvN
	oWr2HeQcqilU1SBqDvGjHJGPdPMIKcoV3FjHFpNMXJ8XtsI7bv8OP+97W1iqqm6Ca2vVSBygDW5P5
	OPbkEewut9LgBbokeIdVdpvB9t+wbxF7kjwDCk6zIN5z/BCv8S4XDDx2ax3bDBycYrCMve0BqWcGS
	iZcVBUPBZfRhxct3lS5xdVQc9S+8lRAdPfnr0eN2s7HCuehZPjVDkdj/vtJ7t07fz663WvbxgCON2
	Rl7YAqKozvnrsdgC6EwbI9vj2cS3baX+pe8CJ42TwlAcOUXRcpsQBqGprjj7SMLC3HOS4+xKfILCg
	e7TDNNKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dL8-0000000DNV7-2btP;
	Tue, 31 Mar 2026 17:57:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dL6-0000000DNTz-1TCe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 17:57:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9667D22FC;
	Tue, 31 Mar 2026 10:57:12 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86F853F915;
	Tue, 31 Mar 2026 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774979838; bh=E0eqte9sjXykp49wOweERJ+dgMceii7XBpHW2hEwIkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQMS81yQYo4mabe0D3goibtdFv8nXjVJQdN1tHpWkYWn1NJR8P/ZrDD16y1oPbb+l
	 o4QBWVnGYE4CQzHUrC4beKS/jvI1QuRC6rzaCA1FVa9SLpsicOSWBvcmsOmiqs5r2+
	 NUOPyAvHlF4hz5aiqb59iPTVcjNyY7kUb+REULwU=
Date: Tue, 31 Mar 2026 18:57:13 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Will Deacon <will@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v15 1/5] ring-buffer: Flush and stop persistent ring
 buffer on panic
Message-ID: <acwK-Xu-Mon2_6bT@arm.com>
References: <177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com>
 <177494616630.71933.2941681397188791689.stgit@mhiramat.tok.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177494616630.71933.2941681397188791689.stgit@mhiramat.tok.corp.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_105720_437906_AFF1AD04 
X-CRM114-Status: GOOD (  16.56  )
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

On Tue, Mar 31, 2026 at 05:36:06PM +0900, Masami Hiramatsu (Google) wrote:
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> On real hardware, panic and machine reboot may not flush hardware cache
> to memory. This means the persistent ring buffer, which relies on a
> coherent state of memory, may not have its events written to the buffer
> and they may be lost. Moreover, there may be inconsistency with the
> counters which are used for validation of the integrity of the
> persistent ring buffer which may cause all data to be discarded.
> 
> To avoid this issue, stop recording of the ring buffer on panic and
> flush the cache of the ring buffer's memory.
> 
> Fixes: e645535a954a ("tracing: Add option to use memmapped memory for trace boot instance")
> Cc: stable@vger.kernel.org
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
[...]
> diff --git a/arch/arm64/include/asm/ring_buffer.h b/arch/arm64/include/asm/ring_buffer.h
> new file mode 100644
> index 000000000000..62316c406888
> --- /dev/null
> +++ b/arch/arm64/include/asm/ring_buffer.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_ARM64_RING_BUFFER_H
> +#define _ASM_ARM64_RING_BUFFER_H
> +
> +#include <asm/cacheflush.h>
> +
> +/* Flush D-cache on persistent ring buffer */
> +#define arch_ring_buffer_flush_range(start, end)	dcache_clean_pop(start, end)
> +
> +#endif /* _ASM_ARM64_RING_BUFFER_H */

Adding Robin as he wrote the pmem support for arm64.

I assume the ring buffer here is cacheable memory, otherwise we'd also
need a dmb(osh) as in arch_wb_cache_pmem(). If that's correct:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

