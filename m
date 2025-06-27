Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FCCC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QojGrqu5+O1RXRPJ0UNX3HD+ftEdKWWtkzHAn38zPIQ=; b=sjNf8PnwXPJJYIsrMFnu+G5/Ou
	gkBpw0vNHdW9D1mTZeowEY9tErcnZgMnzrjvDH9bqnM4xwWE/q7Dq/LB0WDqJ4Wlhm6jzGEjThLER
	no2hFSu5LiIZqhwfuZdVlLMp4UJFtsEtWttbj30QG9jPNwHl3XRgdWFFvwRjoK6vytH0q2EsutjjB
	GqULTdaycQ1jUrGaICc7BsoPM0zzuWy06aCNYxOMWNRjmsQqMCe+1ofdrwVx4SQDMdgvtCe1pls6D
	54X5HNTBXNCn06RSob1313WdabyfxCyY78bza6qFLHYSzW3R8ZIUl2YnhqilzFHMOANXiXFzXqIFT
	vQ4U2Scg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCKD-0000000FKqO-1bz5;
	Fri, 27 Jun 2025 16:53:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBHd-0000000F9in-3nEg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:46:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3BA26A52FAA;
	Fri, 27 Jun 2025 15:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA938C4CEE3;
	Fri, 27 Jun 2025 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039192;
	bh=s4P6Ykw60KnUdx0bEELTGcw3WW4v/75nupSxKBFoSmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2v+6ttRuaLwRuT/j5txbR8mHx/fYY/i6DWriYvG5STge9c5+CCqbmjrs4CyIeSur
	 RpvG6iou0ZHHBBlAI9VemvQq4DMywZs/+nAAPm5lzaTlYiSnHj0Uf0ZxhJZ7gXxw62
	 UW+nLNc9mwDrYz7Hdt3POTze5T1uoK10wSLemGNmZldZQyE4hMrme4+qacj4bRzlRw
	 UdQmUJppqe40TAd3u7KHbiXDaPgG/2ZNE1jqNw+Konj2FzTCGCxp2Tuz/wQByNL4wQ
	 LymCy1ybnck1mOvg9WPALIpXyuFQV4/HKwDiE1rU7lnq0A2FEOk1FrRa4gGM4Jt9TU
	 sLDm9ciCgJx3g==
Date: Fri, 27 Jun 2025 16:46:28 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 08/13] arm64: debug: refactor reinstall_suspended_bps()
Message-ID: <aF681FoBo8Bh-Pk6@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-9-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-9-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084634_005062_D3F53198 
X-CRM114-Status: GOOD (  14.87  )
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

On Fri, Jun 20, 2025 at 10:12:02PM +0100, Ada Couprie Diaz wrote:
> `reinstall_suspended_bps()` plays a key part in the stepping process
> when we have hardware breakpoints and watchpoints enabled.
> It checks if we need to step one, will re-enable it if it has
> been handled and will return whether or not we need to proceed with
> a single-step.
> 
> However, the current naming and return values make it harder to understand
> the logic and goal of the function.
> 
> Rename it `try_step_suspended_breakpoints()` and change the return value
> to a boolean, aligning it with similar functions used in
> `do_el0_undef()` like `try_emulate_mrs()`, and making its behaviour
> more obvious.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/debug-monitors.h |  6 +++---
>  arch/arm64/kernel/debug-monitors.c      |  2 +-
>  arch/arm64/kernel/hw_breakpoint.c       | 25 ++++++++++++-------------
>  3 files changed, 16 insertions(+), 17 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

