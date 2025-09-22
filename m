Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75ACCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPYzAXEdeF7lMogWFGvskWNtIBoMjA8NdQ+ADHMu5s0=; b=WJR+6dBeOnXkHtH9YlEf3Hhhh1
	Yp+TW0PvwuslzLmVSvVHqRjmNMi8y+BWL5x/M65jfbs8emdg5lTOLNxcoYEtamUSPvxtHZWDG+F6d
	3M6Kajaub7MUQ+YFNBZA9Kn9T2D6BzdlmOLe07FStol7uH7xf8QqtdpA5h15DwHDWao7qeGSqnC2j
	iMfaVkFKOeNSKHKdXmRKy7eFClghKVTbHDNakaBvO3QOmEsECCTVFmkHetavuaquhLGnSGHI/IIJk
	Yi8pRyQpnTAptdzz68yqAw4Q5G2HWTWzBCPpkfPDINuSzpsHEIc2Xy+44mm/XpX7pn3l4dndNrnrb
	PD517PZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gO7-0000000ASLJ-2l0H;
	Mon, 22 Sep 2025 13:15:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNt-0000000ASCR-2EHm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Sep 2025 13:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tPYzAXEdeF7lMogWFGvskWNtIBoMjA8NdQ+ADHMu5s0=; b=LG1GvJMa8pPyRlKtcIeA11d61c
	ZhHTpD65KJ4P5kLeQqRQyfrz8sHlwf2mz3rSbLXCD191OmbF9kqkYiH+Fvf9sIzJ/01mlQtLZ9w3L
	t87nZVCz2PXeDXJI6Xqw7nx3iSBhKvcyUMs+bcof67gQT9vUto8ArMUmXiAT2Yy53LC1szjruct/6
	Xlw+1aXs5T9bsrYR0OBjJzqfIFzRaAPvIYBld0+runpZX8Wg9y8XejNz2s8tlo4Fd3i7I9xGbMjQL
	iTWaCkMgVSqVnQP9qDknWqd87+GLFRp8nU6SG9cXCSPtx7TnasaM7rr9AZvqQ0n4fQIadLXpaZQn4
	gXC9Juug==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNq-00000008IDv-0HOh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE20144F5C;
	Mon, 22 Sep 2025 13:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A18C4CEF0;
	Mon, 22 Sep 2025 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758546908;
	bh=w0BgZ/0PysnMar/u7LAhZ9GfXOMmoJnFFf/iWDEkfiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WHytwIDZe5D+QvFzO+KrhrqFEJmBwnN8l6c14HrO5UkiNkICTXX/X+ukHk0D5svKg
	 9V8CWy12ndQ8543BWsrWgmdmyxnxd+ssqglrRQXygC2nk9fD2sgl6cwg9ckf5qMWI0
	 evI7jBREbXGoFg+dLPetUUY6qUD/PxEA9ONZoURHqOKQxom/CefUjZRLrjhGFLjV2W
	 pQBB+1MgpO1g4tEhky7IwUUe+4g9AUNBjTKm+nCNdP9mH1qs2WvWUHpeYXy0BajDa/
	 dXAypbx+Yl7aBvQr4NiD659O6HCXeojs38B1A76zqazfiUeMBK0QFP3M79x9/btg8B
	 LeFPyuxAumA/A==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Omar Sandoval <osandov@osandov.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-debuggers@vger.kernel.org,
	kernel-team@fb.com
Subject: Re: [PATCH v2] arm64: map [_text, _stext) virtual address range non-executable+read-only
Date: Mon, 22 Sep 2025 14:14:48 +0100
Message-Id: <175853869848.3126168.11981509234580321695.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <93a6f8e47cce118493e250b719a927f517be12cf.1758316750.git.osandov@osandov.com>
References: <93a6f8e47cce118493e250b719a927f517be12cf.1758316750.git.osandov@osandov.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_141510_446817_C7C29BEA 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

On Fri, 19 Sep 2025 14:27:51 -0700, Omar Sandoval wrote:
> Since the referenced fixes commit, the kernel's .text section is only
> mapped starting from _stext; the region [_text, _stext) is omitted. As a
> result, other vmalloc/vmap allocations may use the virtual addresses
> nominally in the range [_text, _stext). This address reuse confuses
> multiple things:
> 
> 1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
>    mapping the entire range [_text, _end) to
>    [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
>    [_text, _stext) from /proc/vmcore therefore gives the incorrect
>    result.
> 2. Tools doing symbolization (either by reading /proc/kallsyms or based
>    on the vmlinux ELF file) will incorrectly identify vmalloc/vmap
>    allocations in [_text, _stext) as kernel symbols.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: map [_text, _stext) virtual address range non-executable+read-only
      https://git.kernel.org/arm64/c/5973a62efa34

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

