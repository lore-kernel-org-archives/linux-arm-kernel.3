Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8EDC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWEQ1eMBKaGWY//H6dDNjRpxJPO60W+Lkc57662hqTU=; b=SdPKQJkyXjrIpFrHYJttejYmF/
	K8uNXTNYunJpLabxx4NGbtnW0Sn6T4KsPnrLqxQr5cplxPGQuWEpodX55zXeUmP209fBUVG/HMQf8
	L0n5QpZpa+4LaA7hErpj0bm6zMqzzF0IrwxJnJVKTT5Kcd704b5FOSz6m3AlDgweE+xwU3JL3FT7d
	XSJb2MiEqfi98J5dYP4tVb9SNfKXE+EQ8gDVz8Niri+H9ziiG1NLEpWlHzwogrLLgT8XQ89EG3eVe
	rlXaQ4Q8nJp9iO3kSAfvZwNqRv0a7sT717DbOjHB6LXJ5+6UxH7Inrz3WA+mtAra/XXyOyotviPLq
	cjr5rYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC8s-0000000FJLu-25xW;
	Fri, 27 Jun 2025 16:41:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBGY-0000000F9S9-11dq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B75CA52FAA;
	Fri, 27 Jun 2025 15:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9527C4CEE3;
	Fri, 27 Jun 2025 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039125;
	bh=QJpytubaMCCf6SYa6gRGAvb93HT3fTyWxoFqKljD4lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kkdU3BOCYYLuAbhPA6nNNnpEULqBycNzzEzPz9irp+OaTBDDtJ/psgE/QXFKQd/Ff
	 tLbXS2iUA5Ime4JlqZpJJz19gbBP2qD9HERLZssiFSBDqU2+7UK5rSV+QLVWkj0ZJN
	 qOkpKffpf3PtE845lLser1Zo8KsBhf/ewIY0yDfYOhl6/ZoLCzQfX9McVQTBKZQ3rX
	 teg4GRNKMfl5ooVZUseqsjwrqZlTvMqbmdd7MKA6oOUr7jmJu7MYtl9EoZtpPG5OgT
	 8O93beSZbPSJxI9Pg6ZLpTMv5fp4jCqXw/H8SwAE6nKfYzfynhDRdBMfu4w8zPJv0v
	 nZIglqME2r9JQ==
Date: Fri, 27 Jun 2025 16:45:20 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 03/13] arm64: debug: call software breakpoint handlers
 statically
Message-ID: <aF68kNx9UtbcAD08@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-4-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-4-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084526_355017_E6F95965 
X-CRM114-Status: GOOD (  18.47  )
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

On Fri, Jun 20, 2025 at 10:11:57PM +0100, Ada Couprie Diaz wrote:
> Software breakpoints pass an immediate value in ESR ("comment") that can
> be used to call a specialized handler (KGDB, KASAN...).
> We do so in two different ways :
>  - During early boot, `early_brk64` statically checks against known
>    immediates and calls the corresponding handler,
>  - During init, handlers are dynamically registered into a list. When
>    called, the generic software breakpoint handler will iterate over
>    the list to find the appropriate handler.
> 
> The dynamic registration does not provide any benefit here as it is not
> exported and all its uses are within the arm64 tree. It also depends on an
> RCU list, whose safe access currently relies on the non-preemptible state
> of `do_debug_exception`.
> 
> Replace the list iteration logic in `call_break_hooks` to call
> the breakpoint handlers statically if they are enabled, like in
> `early_brk64`.
> Expose the handlers in their respective headers to be reachable from
> `arch/arm64/kernel/debug-monitors.c` at link time.
> 
> Unify the naming of the software breakpoint handlers to XXX_brk_handler(),
> making it clear they are related and to differentiate from the
> hardware breakpoints.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> ---
>  arch/arm64/include/asm/kgdb.h                 |  3 +
>  arch/arm64/include/asm/kprobes.h              |  8 +++
>  arch/arm64/include/asm/traps.h                |  6 ++
>  arch/arm64/include/asm/uprobes.h              |  2 +
>  arch/arm64/kernel/debug-monitors.c            | 54 +++++++++++++----
>  arch/arm64/kernel/kgdb.c                      | 22 ++-----
>  arch/arm64/kernel/probes/kprobes.c            | 31 ++--------
>  arch/arm64/kernel/probes/kprobes_trampoline.S |  2 +-
>  arch/arm64/kernel/probes/uprobes.c            |  9 +--
>  arch/arm64/kernel/traps.c                     | 59 ++++---------------
>  10 files changed, 83 insertions(+), 113 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

