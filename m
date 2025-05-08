Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF7DC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUTZOX5pL0rFm8GbdLnxeDKHtpkMSbSCmXVwtnugENA=; b=Z9ybYM293CWi26TGf9XsfruUUq
	G3HU3Uro81cKwmFJzPfRaqAhmER+7X6ikqZHoNZOiqRmsD6sjo4IE9K+glJRVgkVNDXYAVZhcEQsp
	v/G6tahHLopxm5sOmr2ngcu1vIzY/YY3jOUW4M0Gr6tI4vfHwwEt+/N1n2oWpAAuSWPx+SEBb5l0Z
	2XHzwuPNNy5wXOkEXWDnhhUPaPHp0sQhlHhegbmEMclY75h8DU5Uq7LZC1bArzN5O4u4gzNICv/Wc
	QGKexXTOOA3897TY6OEn0+N6nqfq7y+5/GDtx2dEe4LvRN1n/KhiHdrdsFlfkorhAEKoAHh7kvxq+
	Y1jGjLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3gC-00000001Dmm-26m1;
	Thu, 08 May 2025 16:01:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2mB-000000012Bb-0snz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 15:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75C905C6391;
	Thu,  8 May 2025 15:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956DAC4CEEF;
	Thu,  8 May 2025 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716586;
	bh=i307aCl5BVWvl5MiOv33nldL0mjlqS9MMmAtQ4QuhRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bA3DpbPun/ZrtWKIb6qp1mFKAQ1uWyHkWDIGFFI/4q59NatfCqMdLAymdSDD2yBtX
	 NSe69IW+zJnCSp65K2iTJWGSAKCG+vzDukCNPMuJWO3d09UDKW5P1eWrVdYILhm9wg
	 UtKSF+C4g+gclqmMk57BeJlgl6l024/mVRAtyYKCkuCi7/88rOXs/K/05w8VsFGLUc
	 n1oTm5t8mrhlodW/waMOe1MCXkZ5JjhSw47o9+78dGLUe32fCFuZAzclG3aiG2dcYq
	 zsgYYH7lT1175V0M0TmA4OvhUNTmhFLbSnMm3n4rBdYqXp1iS4aB6+3JYIUVcqb59Q
	 1tEVs2p9KkkSw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	broonie@kernel.org,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH v2 01/24] arm64/fpsimd: Do not discard modified SVE state
Date: Thu,  8 May 2025 16:02:57 +0100
Message-Id: <174671422240.2281135.7072752588975728937.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250508132644.1395904-2-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com> <20250508132644.1395904-2-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_080307_326378_692553AA 
X-CRM114-Status: UNSURE (   8.07  )
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

On Thu, 08 May 2025 14:26:21 +0100, Mark Rutland wrote:
> Historically SVE state was discarded deterministically early in the
> syscall entry path, before ptrace is notified of syscall entry. This
> permitted ptrace to modify SVE state before and after the "real" syscall
> logic was executed, with the modified state being retained.
> 
> This behaviour was changed by commit:
> 
> [...]

Applied kernel changes to arm64 (for-next/sme-fixes), thanks!

[01/24] arm64/fpsimd: Do not discard modified SVE state
        https://git.kernel.org/arm64/c/398edaa12f9c
[02/24] arm64/fpsimd: signal: Clear PSTATE.SM when restoring FPSIMD frame only
        https://git.kernel.org/arm64/c/1bf663a86a45
[03/24] arm64/fpsimd: signal: Mandate SVE payload for streaming-mode state
        https://git.kernel.org/arm64/c/b465ace42620
[04/24] arm64/fpsimd: signal: Consistently read FPSIMD context
        https://git.kernel.org/arm64/c/be625d803c3b
[05/24] arm64/fpsimd: ptrace: Consistently handle partial writes to NT_ARM_(S)SVE
        https://git.kernel.org/arm64/c/316283f276eb
[06/24] arm64/fpsimd: Clarify sve_sync_*() functions
        https://git.kernel.org/arm64/c/b255be426913
[07/24] arm64/fpsimd: Factor out {sve,sme}_state_size() helpers
        https://git.kernel.org/arm64/c/8738288a08b8
[08/24] arm64/fpsimd: Add task_smstop_sm()
        https://git.kernel.org/arm64/c/6ef1d778ce56
[09/24] arm64/fpsimd: signal: Use SMSTOP behaviour in setup_return()
        https://git.kernel.org/arm64/c/99560c9452bb
[10/24] arm64/fpsimd: Remove redundant task->mm check
        https://git.kernel.org/arm64/c/8d61eef75679
[11/24] arm64/fpsimd: Consistently preserve FPSIMD state during clone()
        https://git.kernel.org/arm64/c/e0cb0f26594c
[12/24] arm64/fpsimd: Clear PSTATE.SM during clone()
        https://git.kernel.org/arm64/c/a6d066f70574
[13/24] arm64/fpsimd: Make clone() compatible with ZA lazy saving
        https://git.kernel.org/arm64/c/cde5c32db557
[14/24] arm64/fpsimd: ptrace/prctl: Ensure VL changes do not resurrect stale data
        https://git.kernel.org/arm64/c/49ce484187f7
[15/24] arm64/fpsimd: ptrace/prctl: Ensure VL changes leave task in a valid state
        https://git.kernel.org/arm64/c/b87c8c4aca11
[16/24] arm64/fpsimd: ptrace: Save task state before generating SVE header
        https://git.kernel.org/arm64/c/054d627c5554
[17/24] arm64/fpsimd: ptrace: Do not present register data for inactive mode
        https://git.kernel.org/arm64/c/b93e685ecff7
[18/24] arm64/fpsimd: ptrace: Mandate SVE payload for streaming-mode state
        https://git.kernel.org/arm64/c/f916dd32a943
[19/24] arm64/fpsimd: ptrace: Gracefully handle errors
        https://git.kernel.org/arm64/c/9f8bf718f292
[20/24] arm64/fpsimd: Allow CONFIG_ARM64_SME to be selected
        https://git.kernel.org/arm64/c/33c4618d0ac0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

