Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25411C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6t+xdfzMCs4DcRrMXZPkoSUw845+vOHEhYS3QWsW9s=; b=TGOrn0VEpKkiW72VJzLiQM7q/s
	V9pPKcv+4MtMZvtNu/HlOHb4zksTaSikMnMp36k1uV0ygM0Zhu0bnn97i1lTqHjqegS/LBYuvCRRF
	uWWUw/P8XcAkRW4Rmmt3FVGQXYto72hhoDgm1jRnPVpM2/QgqPgsKehJzPJLOp6traXSAJPqaSp/+
	8lF3JQG+/Xt/kuBgNACmh13u67iM+TbV2NUpcMqh/tVSpZgGq6nWdp2yQte6SUZD6SSzZWLogq6pL
	rsDvFzBAaivj6VoEF+yIfjLzbxmMFACkq5y9rd0ugkhJYJ3oTHVnfTd9+WYfEDMNmrTpAMuAt6Vgs
	xWMrw5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCMT-0000000FL4o-0eEH;
	Fri, 27 Jun 2025 16:55:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBHv-0000000F9ku-0UEU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:46:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5F9C44E17;
	Fri, 27 Jun 2025 15:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1E7C4CEE3;
	Fri, 27 Jun 2025 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039210;
	bh=U7qaSwIHG/K1TVxiUD4sUFqFzB4YBZAvkq+YwP4OL9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5Y3D4qGZOYJMDA9aGtXt98hLYTDEywX7OUAPGPkg9YpJ1YhNFSkdb9fJmpAr8UeQ
	 XoDKJLlJ6/VKFzEbInn6hDNM5AY7yTtWwLsn8x/eTtelTO7NzAVokDMNh3nXxIDI00
	 3AmaGb71uZkzCuMyU+abSgbQ59Ohil1Cwjw3d9JDSHfALhgLyq88kvzJpJy4EjqdHI
	 EpEoSiboZuTFt/Qho4d5KTYiqriCI3NWLify5Tj0jFsx43TOMdB4WKswSBh6azeK1C
	 LoXUyHKzsH0HTMRUDnL7vTTyRitXI9XePxaCLh01+LN9EIRyzx6m8plcH/tEz331wA
	 DSeSA9St8xPNg==
Date: Fri, 27 Jun 2025 16:46:46 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 09/13] arm64: debug: split single stepping exception
 entry
Message-ID: <aF685thMbwApqTYH@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-10-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-10-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084651_212630_0BE3472E 
X-CRM114-Status: GOOD (  24.43  )
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

On Fri, Jun 20, 2025 at 10:12:03PM +0100, Ada Couprie Diaz wrote:
> Currently all debug exceptions share common entry code and are routed
> to `do_debug_exception()`, which calls dynamically-registered
> handlers for each specific debug exception. This is unfortunate as
> different debug exceptions have different entry handling requirements,
> and it would be better to handle these distinct requirements earlier.
> 
> The single stepping exception has the most constraints : it can be
> exploited to train branch predictors and it needs special handling at EL1
> for the Cortex-A76 erratum #1463225. We need to conserve all those
> mitigations.
> However, it does not write an address at FAR_EL1, as only hardware
> watchpoints do so.
> 
> The single-step handler does its own signaling if it needs to and only
> returns 0, so we can call it directly from `entry-common.c`.
> 
> Split the single stepping exception entry, adjust the function signature,
> keep the security mitigation and erratum handling.
> Further, as the EL0 and EL1 code paths are cleanly separated, we can split
> `do_softstep()` into `do_el0_softstep()` and `do_el1_softstep()` and
> call them directly from the relevant entry paths.
> We can also remove `NOKPROBE_SYMBOL` for the EL0 path, as it cannot
> lead to a kprobe recursion.
> 
> Move the call to `arm64_apply_bp_hardening()` to `entry-common.c` so that
> we can do it as early as possible, and only for the exceptions coming
> from EL0, where it is needed.
> This is safe to do as it is `noinstr`, as are all the functions it
> may call. `el0_ia()` and `el0_pc()` already call it this way.
> 
> When taking a soft-step exception from EL0, most of the single stepping
> handling is safely preemptible : the only possible handler is
> `uprobe_single_step_handler()`. It only operates on task-local data and
> properly checks its validity, then raises a Thread Information Flag,
> processed before returning to userspace in `do_notify_resume()`, which
> is already preemptible.
> However, the soft-step handler first calls `reinstall_suspended_bps()`
> to check if there is any hardware breakpoint or watchpoint pending
> or already stepped through.
> This cannot be preempted as it manipulates the hardware breakpoint and
> watchpoint registers.
> 
> Move the call to `try_step_suspended_breakpoints()` to `entry-common.c`
> and adjust the relevant comments.
> We can now safely unmask interrupts before handling the step itself,
> fixing a PREEMPT_RT issue where the handler could call a sleeping function
> with preemption disabled.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/Z6YW_Kx4S2tmj2BP@uudg.org/
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> ---
>  arch/arm64/include/asm/exception.h |  2 +
>  arch/arm64/kernel/debug-monitors.c | 77 +++++++++++-------------------
>  arch/arm64/kernel/entry-common.c   | 43 +++++++++++++++++
>  arch/arm64/kernel/hw_breakpoint.c  |  2 +-
>  4 files changed, 75 insertions(+), 49 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

