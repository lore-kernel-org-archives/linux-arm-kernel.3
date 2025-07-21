Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98DEC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pgy7qu/16WzRDDr0E7paFYn90GmmPKh6et0hAtZhSj0=; b=fAFE8lPy0b38vmUTcbySDSbRt/
	/7BHJsC/3CnfZn69IaPJyMWWvqO62152u1l8qIK3mnmqxQPZM5t4TaOS5rlKkW2vzqNydN4xT+IdI
	gS1TausF/xoLfkqppKkIVATx/+QFqWZH232xJMlQT5v6CkjUsRKhTTjr/++yrmfGW5/hT0hNf9HNq
	E50X6lTSjuthlh94QZljqwDKMbAvscKHXofT6vHeA9aix5wc5q/1S3wF+s4Jh+MA2Qwr7fYYqoTT5
	9PuL9eY2P+RIARek1GHTNZMeaWIO03m4z08obNv1tArIYIHSDWVC88GmHqvQWNqGuj4iSUJQBCa+w
	6JYRZygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtb5-00000000BuB-3NQq;
	Mon, 21 Jul 2025 16:42:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrLo-0000000HUjf-1nV6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD4335C5EC2;
	Mon, 21 Jul 2025 14:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136B1C4CEED;
	Mon, 21 Jul 2025 14:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753107523;
	bh=l45SIkARsEf4ojtfNKZ9lIvhx/qNQNY9eMSFKgVVF3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqsJGafpc6xGnfEgVUoIcjgvNYdbLXsxXS2JhWC0a6re/nkDOC9+anrpDmgMD8YTX
	 M9EktoSNDzxBdryPZPlgQD9kCT47kk33jgJ1/o6vylt2IizRiXT52m0Zl51uNHP3/a
	 Y/IVkbWdAh2XFWgCtlTp8APJFjz8MenLhNbShgXERy1qs2i7rzrC/TBJjq0bbq3Hxt
	 26iWFz+hHI5DZhW+E5fT2GKlLVD+Wg4g2rmxnMuLPXhEXp9jEda1m4bnU8sEHxdmLX
	 3q1yAg3a2okOZBys9Tspw/RfMx9+a1AyvnLn0b8a5UnISR1P8OfeYpk6ie9Lau0DrB
	 DBtQTc4kvtIOg==
Date: Mon, 21 Jul 2025 15:18:39 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>
Subject: Re: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(),
 call_on_irq_stack()
Message-ID: <aH5MPwJJzFZxOtfr@willie-the-truck>
References: <20250718142814.133329-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718142814.133329-1-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_071844_547571_01A7B12F 
X-CRM114-Status: GOOD (  26.47  )
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

On Fri, Jul 18, 2025 at 03:28:14PM +0100, Ada Couprie Diaz wrote:
> `cpu_switch_to()` and `call_on_irq_stack()` manipulate SP to change
> to different stacks along with the Shadow Call Stack if it is enabled.
> Those two stack changes cannot be done atomically and both functions
> can be interrupted by SErrors or Debug Exceptions which, though unlikely,
> is very much broken : if interrupted, we can end up with mismatched stacks
> and Shadow Call Stack leading to clobbered stacks.
> 
> In `cpu_switch_to()`, it can happen when SP_EL0 points to the new task,
> but x18 stills points to the old task's SCS. When the interrupt handler
> tries to save the task's SCS pointer, it will save the old task
> SCS pointer (x18) into the new task struct (pointed to by SP_EL0),
> clobbering it.
> 
> In `call_on_irq_stack()`, it can happen when switching from the task stack
> to the IRQ stack and when switching back. In both cases, we can be
> interrupted when the SCS pointer points to the IRQ SCS, but SP points to
> the task stack. The nested interrupt handler pushes its return addresses
> on the IRQ SCS. It then detects that SP points to the task stack,
> calls `call_on_irq_stack()` and clobbers the task SCS pointer with
> the IRQ SCS pointer, which it will also use !
> 
> This leads to tasks returning to addresses on the wrong SCS,
> or even on the IRQ SCS, triggering kernel panics via CONFIG_VMAP_STACK
> or FPAC if enabled.
> 
> This is possible on a default config, but unlikely.
> However, when enabling CONFIG_ARM64_PSEUDO_NMI, DAIF is unmasked and
> instead the GIC is responsible for filtering what interrupts the CPU
> should receive based on priority.
> Given the goal of emulating NMIs, pseudo-NMIs can be received by the CPU
> even in `cpu_switch_to()` and `call_on_irq_stack()`, possibly *very*
> frequently depending on the system configuration and workload, leading
> to unpredictable kernel panics.
> 
> Completely mask DAIF in `cpu_switch_to()` and restore it when returning.
> Do the same in `call_on_irq_stack()`, but restore and mask around
> the branch.
> Mask DAIF even if CONFIG_SHADOW_CALL_STACK is not enabled for consistency
> of behaviour between all configurations.
> 
> Introduce and use an assembly macro for saving and masking DAIF,
> as the existing one saves but only masks IF.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Reported-by: Cristian Prundeanu <cpru@amazon.com>
> Fixes: 59b37fe52f49955791a460752c37145f1afdcad1 ("arm64: Stash shadow stack pointer in the task struct on interrupt")
> ---
> Hi,
> I spent some time evaluating the performance impact of this change
> to make sure that it would be OK to mask in those functions.
> They have very few instructions so have few chances to be interrupted
> to begin with so the impact should be minimal.

It's definitely worthwhile doing the benchmarking, so thanks for that,
but realistically I don't think we have an awful lot of choice but to
fix this, do we?

The code looks good to me:

Acked-by: Will Deacon <will@kernel.org>

Will

