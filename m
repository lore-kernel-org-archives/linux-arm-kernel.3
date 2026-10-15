Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911FCCC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgB3puw99a9UOzOZd9dAymxjDKduhLQv53aoPZb0JbU=; b=nMhZ2X7/Q7F/GseNMSnSFkuoBn
	EAytS1lILnYepo17e0kLSUfrPvjgNcyyUmlKLb22t5y7iMsgV1KbxczUNJmp6vgH9x9cqN5+p6Did
	dD/rD7h62im9sRRJLQ/9a3FzVKmXZF8HmH90Vhvv7lmNf9Fd0eSAwMjWbXWRP/oLyfdSgd8tH4edn
	ndamDa4ZT/IAAWBAVKgEjKJwzTD35mJkFMuANrscWaOmkp7sL/PUiMIMVA84CeCx/iuuzpP5tGu5J
	ny20vmCL9YfeyQ63L2uDOla+f9ajTDC+YkZX+9VPSCZiGbemchK6IT/38czGVFp8Plh5DZPjybyuI
	XOL/nDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOm8-00000000uwn-0hkq;
	Thu, 15 Oct 2026 16:57:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOm4-00000000uvi-3JIE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 16:57:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D75E14BF;
	Thu, 15 Oct 2026 09:57:44 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EF033F871;
	Thu, 15 Oct 2026 09:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792083467; bh=edtqmcBc9C5Jw1XnkpzZfUNKGjFPKHCCqCLCye+YyAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZAnapSfFDb2v5eT9NxdaYQzZWh5zW1x2ikWd2mGY3XDP8Dua+82I1p44tn+XCdak
	 o/labSzWV+oIosxxCWcdu+DiyH3ip0Dw2x//wtGphvZvqzZNxM0VQ9zWh6u23kCAJA
	 mA5XNkL5epMvjCG8DAl8ZimTGS8jqXVvHz4FHLis=
Date: Thu, 15 Oct 2026 17:57:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: will@kernel.org, mark.rutland@arm.com, ardb@kernel.org, song@kernel.org,
	dylanbhatch@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: patching: Fix instruction byte order in
 aarch64_insn_set()
Message-ID: <atEGBsR3eI3cXKay@arm.com>
References: <20261010084721.2197683-1-qirui.001@bytedance.com>
 <20261010085055.2200241-1-qirui.001@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010085055.2200241-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_095748_896245_94631C67 
X-CRM114-Status: GOOD (  11.27  )
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

On Sat, Oct 10, 2026 at 04:50:54PM +0800, Rui Qi wrote:
> aarch64_insn_set() passes the host-endian u32 instruction straight to
> text_poke_memset(), which memset32()'s it into memory in host byte order.
> AArch64 instructions must be little-endian in memory, so on a big-endian
> kernel the written bytes are reversed and the CPU takes an UNDEFINED
> instruction exception when fetching them.  The sibling aarch64_insn_write()
> already converts with cpu_to_le32(); aarch64_insn_set() does not.
> 
> This is reachable in-tree: bpf_arch_text_invalidate() fills freed JIT
> regions with AARCH64_BREAK_FAULT through aarch64_insn_set(), and arm64
> selects HAVE_EBPF_JIT without a big-endian guard, so the path is taken on
> BE kernels with BPF JIT.  The direct-fill loop in the same file already
> cpu_to_le32()'s the constant, confirming the expected byte order.
> 
> Convert the instruction to little-endian before the memset, mirroring
> aarch64_insn_write().  On LE the conversion is a no-op, so behaviour is
> unchanged.

We are just about to remove big-endian support (in 7.4).

-- 
Catalin

