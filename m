Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3446C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 00:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRAnSmciVx2Uv4vUT+zMl7S2GSv+W3820dA+59HEuQ8=; b=cVIFsGlspxzRXu
	Bab1yOjvujwCClr9jDApkD/vV/jhLC22gEzW51xWN9MhfwefqMqUXMcKYrbf/JRjCB9jzvJkHQr7p
	fAGDT1Fqybh64lKZlovPd3KhfcQBtAO5b1GVuegxVIE22zYAkdcEtnJi3VoXy8hM9y8T25C7k1Z8e
	XtVGBHPkgTJEE5HkuBVVpx+qKR2gAtHb83/nk93UMklb36HPJDCmvY8+3OAzVcEOAAhig2pU8gTjz
	LzYdPnKcTtTlS6HQ5UH3mGu+nWvb1rKjNOIIdM4QJntiJ/UiaYlKxhlCTTAfuqfMTmmT6QrLgL7xz
	NPweTDOeQzYq5tDQoLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whGZn-0000000G4m3-0Vx2;
	Wed, 08 Jul 2026 00:55:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whGZl-0000000G4lt-2zCK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 00:55:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 212E14075D;
	Wed,  8 Jul 2026 00:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124341F000E9;
	Wed,  8 Jul 2026 00:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783472145;
	bh=XRAnSmciVx2Uv4vUT+zMl7S2GSv+W3820dA+59HEuQ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=oZ/nGzZeYoH2tT49qy0JP7bPImKjYNCoqtGmbMWIGBgeDFbE8SO6DCo58NrcxAN9C
	 vATmCqgUsIO930R4BTHH5pyVrRwvJE3cr7M+WPLO/9u+C3n/bh8NYmZOVUcUQh8Let
	 VUFVvI2f4FLqj609hnDneqUzOMRM2WxJ2VujUxQIuIfL/SNghUH0mp3Aa/Z/F1frBk
	 UVx8xtryZ64qzN+191OYfvfG19bkyM8FiPZfL8W2Hquykb22LHoa5K2nWO7lpPjfDc
	 WxwIrJWtZ3Ow3AZcvyfZSILzOGb0Frvq8B09eK2qhR8k84fXcIiORHFICg53bIfXIP
	 VLojfCpZDBDXg==
Date: Wed, 8 Jul 2026 09:55:40 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Pu Hu <hupu@transsion.com>
Subject: Re: [RFC 0/3] arm64: kprobes: Fix single-step fault and reentry
 handling
Message-Id: <20260708095540.31c97fcbe9a56f3fd7f0b284@kernel.org>
In-Reply-To: <20260706083636.159883-1-hupu@transsion.com>
References: <20260704234730.46d51c47d75e7d208e7bec9f@kernel.org>
	<20260706083636.159883-1-hupu@transsion.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Hongyan Xia <hongyan.xia@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen@kernel.org" <naveen@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "will@kernel.org" <will@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi, Pu,

Thanks for updating the series. But even if it just update
the signed-off-by, please update the version.

Also, can you check the Sashiko's comments?

https://sashiko.dev/#/patchset/20260706083636.159883-1-hupu%40transsion.com

Thank you,

On Mon, 6 Jul 2026 08:36:46 +0000
Pu Hu <hupu@transsion.com> wrote:

> From: Pu Hu <hupu@transsion.com>
> 
> This series fixes two arm64 kprobes issues observed when running
> simpleperf with preemptirq tracepoints and dwarf callchains while a
> kprobe is active on a frequently executed kernel function.
> 
> The crash happens in the kprobe debug exception path. While a kprobe is
> preparing or executing its XOL single-step instruction, perf/trace code
> can run in the same window. That code may either take a fault of its own
> or hit another kprobe.
> 
> Patch 1 makes kprobe_fault_handler() handle a fault in
> KPROBE_HIT_SS/KPROBE_REENTER only when the faulting PC points at the
> current kprobe's XOL instruction. Otherwise the fault is left to the
> normal fault handling path.
> 
> Patch 2 allows a kprobe hit in KPROBE_HIT_SS to be handled as a
> recoverable one-level reentry. Only a hit while already in
> KPROBE_REENTER remains unrecoverable.
> 
> Patch 3 adds a kprobes selftest which registers a kprobe on a frequently
> executed filemap fault path and drives repeated file-backed page faults
> from userspace. This provides a smaller reproducer for validating the
> fault handling fix.
> 
> This follows the same logic as the existing x86 fixes:
>   6381c24cd6d5 ("kprobes/x86: Fix page-fault handling logic")
>   6a5022a56ac3 ("kprobes/x86: Allow to handle reentered kprobe on single-stepping")
> 
> Reproducer:
> 
>   simpleperf record -p <pid> -f 10000 \
>     -e preemptirq:preempt_disable \
>     -e preemptirq:preempt_enable \
>     --duration 9 --call-graph dwarf \
>     -o /data/local/tmp/perf.data
> 
> The new selftest can be built from tools/testing/selftests/kprobe/ and
> used to exercise the page fault handling path with the test kprobe
> module loaded.
> 
> Before this series, the crash reproduced frequently. With both patches
> applied, it was no longer reproduced in our testing.
> 
> 
> Pu Hu (3):
>   arm64: kprobes: Do not handle non-XOL faults as kprobe faults
>   arm64: kprobes: Allow reentering kprobes while single-stepping
>   selftests/kprobes: Add kprobe stress test for page fault handling
> 
>  arch/arm64/kernel/probes/kprobes.c            |  22 +++-
>  tools/testing/selftests/kprobe/.gitignore     |   2 +
>  tools/testing/selftests/kprobe/Makefile       |  75 +++++++++++++
>  tools/testing/selftests/kprobe/fault_stress.c | 105 ++++++++++++++++++
>  .../selftests/kprobe/kprobe_folio_stress.c    |  70 ++++++++++++
>  5 files changed, 273 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/kprobe/.gitignore
>  create mode 100644 tools/testing/selftests/kprobe/Makefile
>  create mode 100644 tools/testing/selftests/kprobe/fault_stress.c
>  create mode 100644 tools/testing/selftests/kprobe/kprobe_folio_stress.c
> 
> -- 
> 2.43.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

