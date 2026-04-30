Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DA9FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CQf3oztDOBEArGCCm+sSAN9wRu5XEKgAXumhimw5Hs=; b=agW639ESKIB3F0+H/RW53/D7h6
	vK+xYEfv48S85Sp+HKYuPrY7wuCwRQAR3cJ2Y0o4O0t0h7mB4Hl2TvHRIowYhHZ7UMDtQC1aepmZ4
	gU5FG9bd45CM+nsNLfyEx9dg2dBhsC56x5/PLfJfmO1pa4/G2fDnyYHOKUL6AjamQPLMgQKGll9B5
	V7jKnNwjX4WFlIurmvV2xz+t2e+yjYXE5E0rBS2+HUahI/yqNJe/khxAz8m1eiVnkix/r3ad/Kh/2
	EF1a7XclOfL43t0I/kV0J4NLPdx1Q+N0S/+mhIeRZY+gnrprSN7vbggxutQxjO4aIs6mfibRHK2+o
	oVoFBWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINNP-000000054gy-33Lj;
	Thu, 30 Apr 2026 09:08:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINNN-000000054gc-1ZDu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 09:08:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12D77404E9;
	Thu, 30 Apr 2026 09:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F31C2BCB3;
	Thu, 30 Apr 2026 09:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777540083;
	bh=ZFzSNODvz59u5BBj2IDcPy45PSPOnkHPbn9VjRLPFko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tr+sv2mFI9m4Ofy6Z0CStOodv0cPAChYeTf2a3fmIaFcBPf+N3J7PMUQ2IsSG5aKu
	 Ws09EaXWOCdaKF/SE443itbM9VK4E6tn5zNtfAWEe8F1oVWjulubvyY+SDFIG8nGJb
	 aWwDoCxGyVXwVXC9Fo/HEw+pFY5Br/2PfTvj2DMn+cBsBZsx93dLe+tf6r4zPvfsXb
	 3KzcHrFPh+lw+7fU3SCr7XSFXlFjhgeGtTQy7ByyUK5bnWqLhPH0nxu0bphVd+9mvJ
	 TzuqDp7DgriF5jFxU5E3CPNYB03GIMupks3LEdgHdC2+eFLWbj4/NOO1gDLJ5imF9V
	 b4u8H3NfNszvQ==
Date: Thu, 30 Apr 2026 10:07:58 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com,
	vdonnefort@google.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/8] KVM: arm64: Make EL2 exception entry and exit
 context-synchronization events
Message-ID: <afMb7uuPlUbLeu7k@willie-the-truck>
References: <20260428103008.696141-1-tabba@google.com>
 <20260428103008.696141-2-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428103008.696141-2-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_020805_454351_5AD07949 
X-CRM114-Status: GOOD (  19.92  )
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

On Tue, Apr 28, 2026 at 11:30:01AM +0100, Fuad Tabba wrote:
> SCTLR_EL2.EIS and SCTLR_EL2.EOS control whether exception entry and
> exit at EL2 are Context Synchronisation Events (CSEs). Per ARM DDI
> 0487 M.b, EIS is governed by D1.4.2 rule RBBSRF (p. D1-7205) and EOS
> by D1.4.4.1 rule RBWCFK (p. D1-7209). D24.2.175 (p. D24-9754):
> 
>   - !FEAT_ExS: the bit is RES1, so the entry/exit is unconditionally
>     a CSE.
>   - FEAT_ExS: the reset value is architecturally UNKNOWN; software
>     must set the bit to make the entry/exit a CSE.
> 
> INIT_SCTLR_EL2_MMU_ON in arch/arm64/include/asm/sysreg.h sets neither
> bit. KVM/arm64 hot paths rely on ERET from EL2 being a CSE, and on
> synchronous EL1->EL2 entry being a CSE, to elide explicit ISBs after
> MSRs to context-switching system registers (HCR_EL2, HFGxTR_EL2,
> HCRX_EL2, ZCR_EL2, CPACR_EL1, CPTR_EL2, SCTLR_EL1, ptrauth keys,
> etc.); examples include the activate-traps path,
> ptrauth_switch_to_guest, and the FPSIMD trap re-enable in
> kvm_hyp_handle_fpsimd. On FEAT_ExS hardware those reliances are not
> architecturally backed unless EOS=1 (and, for entry, EIS=1), and
> whether they hold today depends on firmware initialisation outside
> the kernel's control.
> 
> Make the guarantee explicit: include SCTLR_ELx_EIS | SCTLR_ELx_EOS in
> INIT_SCTLR_EL2_MMU_ON so that EL2 exception entry and exit are
> unconditionally CSEs regardless of whether FEAT_ExS is implemented.
> This matches the pairing in arch/arm64/kvm/config.c which treats EIS
> and EOS together as RES1 under !FEAT_ExS.
> 
> INIT_SCTLR_EL2_MMU_OFF is left unchanged: that path is used during
> very early EL2 init and the EL2 MMU-off transition, neither of which
> relies on these bits in the same way.
> 
> Fixes: fe2c8d19189e ("KVM: arm64: Turn SCTLR_ELx_FLAGS into INIT_SCTLR_EL2_MMU_ON")

I don't think this Fixes: tag is accurate:

1. That commit doesn't do anything with EIS/EOS afaict.
2. Back in 5.12 (when that thing landed), SCTLR_EL2_RES1 did actually
   include EIS and EOS

so I think the issue here might be that the auto-generated sysreg file
quietly changes the RES1 definitions as bits get allocated, but the
macros using the RES1 definition don't get updated. That's a pretty
horrible pit that it feels like we might keep falling into :/

Looking at 0a35bd285f43 ("arm64: Convert SCTLR_EL2 to sysreg
infrastructure"), I think we ended up dropping a whole bunch of fields
from the RES1 mask (which became 0!). Have you checked all of those?

Will

