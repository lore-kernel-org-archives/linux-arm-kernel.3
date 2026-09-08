Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93313C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1G/5FmZL4xdw+0lMQfJjEPkPMKzHU5gOio8BHsZzuA=; b=CFuFFYYQY2XrWEZwRPzk/nJgfA
	aESydnfOQoEGs/3qATjHXQufDX0aEeuaT+nV0XQxhHzWXSRx2u1LbcryE/wjmxe3zCF/PJhmn8Nw9
	b7uhkj0paoruUdOIMAbhsT5w2HdoZkW6eDkuKXI034w+cKjM2J2OrQlv9cFIms2RX5On3FNbr8wNh
	/XwcuXWPFTkaUY+TBSfaBy9GpvWYiN1Wu27bnVSNoOCrH6yJTmiDwKQUhijab63SYjgTRJDVveMOR
	5myytL0tO+pz97u5gsHQIHij7Gx5/ToB19qp4HuYii9/8bCNgKDP4wE4wqmVArvN95AQ4wTcKDZI/
	YRyZvOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3u1z-00000008tC7-0xuG;
	Tue, 08 Sep 2026 11:30:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3u1t-00000008tAR-1ca9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:30:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D451E43A75;
	Tue,  8 Sep 2026 11:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1741F00A3D;
	Tue,  8 Sep 2026 11:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788867020;
	bh=e1G/5FmZL4xdw+0lMQfJjEPkPMKzHU5gOio8BHsZzuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S1PzksPg3GlnN60NnS8u3KBNEe7/XQ0UakTlKP1QoSmuhUcSbgqt1k4d09k6QY5wX
	 R/9SIIEU42bHp3YuHzLz0ykO3sWf6jDfuGfpYiTwelbaCgnyummIn86hf5NAOfSbol
	 IFk7BLyVI+n2ug1mifLTTcagY/wvvWa5q+6a7FNja8qDXc6zMT5mWVLU5lN9i2TppZ
	 9F0IallBAlbVkewMxKdEsSIdOUIsm7ROgvWPNx5TSc1CTZqTR2l9G8gSl4wOL2loYV
	 ncmPQ0rIuJEO9031Qc96uD7sn5Cvhm1LV7uCB5WMPDN0Fh58t31BxrLBxuF0KY26Wn
	 riiBYA0yJmNEw==
Date: Tue, 8 Sep 2026 12:30:14 +0100
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 19/21] arm64: entry: The great stack switcheroo
Message-ID: <ap_xxpoBi_x-7wF-@willie-the-truck>
References: <20260907164247.17223-1-will@kernel.org>
 <20260907164247.17223-20-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907164247.17223-20-will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2026 at 05:42:44PM +0100, Will Deacon wrote:
> With the kernel stack pointer in SP_EL1 and the overflow stack pointer
> in SP_EL0, it is now straightforward to switch between the two on
> exception entry from EL1 by writing to SPSel. However, since exception
> entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
> repurposing the overflow stack as a more general kernel exception stack
> would require writing to SPSel on every exception entry from the kernel.
> 
> Switch things around so that the overflow stack resides in SP_EL1, with
> the kernel stack residing in SP_EL0.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_asm.h | 16 +++++++++++++++
>  arch/arm64/kernel/entry-common.c | 34 ++++++++++++++++----------------
>  arch/arm64/kernel/entry.S        | 26 +++++++++++++-----------
>  arch/arm64/kernel/head.S         |  5 ++++-
>  arch/arm64/kernel/smp.c          |  8 +++++---
>  arch/arm64/kvm/hyp/entry.S       |  3 +++
>  arch/arm64/mm/proc.S             |  3 +++
>  7 files changed, 63 insertions(+), 32 deletions(-)

[...]

> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 12aacc74f764..0811fa569100 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -98,6 +98,7 @@ SYM_FUNC_START(cpu_do_suspend)
>  	mrs	x10, oslsr_el1
>  	mrs	x11, sctlr_el1
>  	get_this_cpu_offset x12
> +	msr	spsel, #1
>  	mrs	x13, sp_el0
>  	stp	x2, x3, [x0]
>  	stp	x4, x5, [x0, #16]
> @@ -156,6 +157,8 @@ alternative_else_nop_endif
>  	msr	sctlr_el1, x12
>  	set_this_cpu_offset x13
>  	msr	sp_el0, x14
> +	msr	spsel, #0

Sashiko rightfully points out that I've got this slightly wrong because
I've pushed the spsel toggle too deep in the callchain for the
suspend/resume paths. My original rationale was that the current code
already saves/restores SP_EL{0,1}, so we shouldn't need to change
anything. However, that's not quite right because it's the caller (e.g.
__cpu_suspend_enter()) which saves SP_EL1 as 'sp', so the stack toggle
should happen there.

I'll fix that in v2.

Will

