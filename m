Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BEAC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kL17NT6z+UbqU/5wBkjid+UgzCmp+L4H4A471/kbx28=; b=sSkQ/wtFJ8JVjxFYpzY+huUPLa
	1HpC89ObaY9OiB1oIPZ8wUXYxpOhADsXOpVdJ5x1QjmHnZhQWBAEIhWZzaQZTrW7wId6Dtv0yuSoV
	HkVp8uY6qlyvn554y7i6CjATtDX3+CSpVjFGJVG7CAEhgyNTY/zPIE/90JHxewkL8eBbMqpLHB3RP
	VdU9+fb535IFLbXo8UUpN6Y7FMHARAP9o2u2i+OCU0LREx4Q7BBQWN7QsVJyzYAjF6eSJMWkSyB8S
	ZDU1VrrdW2fgf3P3nx5gwG9CK595WobqYH0NvY2xOWZqyYBuHf9MUnLTbXs1RwgSjLUzWIJ2zgxHz
	3p2Su+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCVZ-0000000FMLa-0Uio;
	Fri, 27 Jun 2025 17:05:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBIY-0000000F9vu-2Ifd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D71C0A52FB5;
	Fri, 27 Jun 2025 15:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E373C4CEED;
	Fri, 27 Jun 2025 15:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039249;
	bh=NwSYR4Y3P/Nv4MWeCvXIbxQR6ts80ZRFzbtZbRv4j1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oY0DxAsFBALBiufpiFY/pmOv3iEgL7o+oucrYFKaY2bXZzaxnZXpoajBcx+dPUITD
	 l4ujJgmkzUY/f0F/mQMwFO4fyacVyc2cd4N6gV7WMb3XmNgjtx8i5eIlKCd5aFOPPz
	 JoGCsDYDE0vXG+He5UFNXf/IoBuVZzGTZLUIXuJrKo6aUgy4am8TgpeFeySoI2SWVn
	 Ttt21bD8FDNQvegVR0ev+YyRfJa849nTQE8T4BHZW9pDJIEQHwKEy4tLdYf4lS+NaB
	 B7PnLQgKalo/5/LPChsG+UUFu1ML5zZFcu2LAPS7aMea43rC0PCzQXcLXntLTMMMJ1
	 kmNXoEj7txNsw==
Date: Fri, 27 Jun 2025 16:47:25 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 11/13] arm64: debug: split brk64 exception entry
Message-ID: <aF69DcN20brBmXEh@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-12-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-12-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084730_719093_1FDE89B1 
X-CRM114-Status: GOOD (  24.93  )
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

On Fri, Jun 20, 2025 at 10:12:05PM +0100, Ada Couprie Diaz wrote:
> Currently all debug exceptions share common entry code and are routed
> to `do_debug_exception()`, which calls dynamically-registered
> handlers for each specific debug exception. This is unfortunate as
> different debug exceptions have different entry handling requirements,
> and it would be better to handle these distinct requirements earlier.
> 
> The BRK64 instruction can only be triggered by a BRK instruction. Thus,
> we know that the PC is a legitimate address and isn't being used to train
> a branch predictor with a bogus address : we don't need to call
> `arm64_apply_bp_hardening()`.
> 
> We do not need to handle the Cortex-A76 erratum #1463225 either, as it
> only relevant for single stepping at EL1.
> BRK64 does not write FAR_EL1 either, as only hardware watchpoints do so.
> 
> Split the BRK64 exception entry, adjust the function signature, and its
> behaviour to match the lack of needed mitigations.
> Further, as the EL0 and EL1 code paths are cleanly separated, we can split
> `do_brk64()` into `do_el0_brk64()` and `do_el1_brk64()`, and call them
> directly from the relevant entry paths.
> Use `die()` directly for the EL1 error path, as in `do_el1_bti()` and
> `do_el1_undef()`.
> We can also remove `NOKRPOBE_SYMBOL` for the EL0 path, as it cannot
> lead to a kprobe recursion.
> 
> When taking a BRK64 exception from EL0, the exception handling is safely
> preemptible : the only possible handler is `uprobe_brk_handler()`.
> It only operates on task-local data and properly checks its validity,
> then raises a Thread Information Flag, processed before returning
> to userspace in `do_notify_resume()`, which is already preemptible.
> Thus we can safely unmask interrupts and enable preemption before
> handling the break itself, fixing a PREEMPT_RT issue where the handler
> could call a sleeping function with preemption disabled.
> 
> Given that the break hook registration is handled statically in
> `call_break_hook` since
> (arm64: debug: call software break handlers statically)
> and that we now bypass the exception handler registration, this change
> renders `early_brk64` redundant : its functionality is now handled through
> the post-init path.
> 
> This also removes the last usage of `el1_dbg()`.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> ---
>  arch/arm64/include/asm/exception.h |  2 ++
>  arch/arm64/kernel/debug-monitors.c | 48 ++++++++++++++----------------
>  arch/arm64/kernel/entry-common.c   | 19 ++++++++----
>  3 files changed, 38 insertions(+), 31 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

