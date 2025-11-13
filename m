Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C8DCD6E54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qSLyDshW9kkhTmJ8IRXaVuD1vLy/jeZ3N9PJ3p1KGU=; b=LeUog+BV2/EvzbolpB5Dl7O1ey
	48BjYhS8l4G4z8lmiipcYh2Egtn0FWuxNIBrYobGw4vX4X5bST4ZEwwVtzLUHvhHhPgUGzBqd/cLU
	u3bunz1bhtJGLPaH8nXlfnL3vC3bAWktWu/6QHkQIAWHU8kJMHmQ2wsY0mJqg3lFGmCbXQ9oHzpfW
	EV+xDg2n+3AlVhTeNqM8BBszAuW9OxPDxZUiQVROlkTlFz91PQBinLzwWgvjgJwLnXElLaFiTilEt
	tmj6vjiWvhu46fIja7ewcl+D4NEOe3g3V7Fbv27LJ5K7emSDLn30exdj4fOyo5oYU93U903rC3mvH
	c0CsOspg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcZ5-0000000AxxO-1jkf;
	Thu, 13 Nov 2025 19:01:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcZ4-0000000AxxA-0cuv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 19:01:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1ED3F60103;
	Thu, 13 Nov 2025 19:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF70AC4CEF1;
	Thu, 13 Nov 2025 19:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763060458;
	bh=H3Clw8gjcbGw+xYduDA4z9LON6MUCgNU2LErbevLunA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A+Yez3vmqjImQAJABdv5lgo/kTd3N3vuVjk+1UX/x5vgaM99H4vpn7D4JLiz931UD
	 Ijlk5tIw7KKbWa/qH4wH5umbshiKkLsR5qK5A2E6o5ZbnAsxBwYMmlZ5L3dRDYc24m
	 J+N4C6AR6JJP1rD+ikyfxnUcrULUugoG3rjTy1qfcK5onkcINdeFRMvI01xOkamx9m
	 RvZaFEx6/OC/Z62ozbtLlnIyxaDwzU0ySGIEdOIEOk5mvwU2ZW332zHDLCkuYUAYpJ
	 GqK5Dcu6hx9ph1jaFWZ82+6FjNd1HgABR4Lrb24Vb3C0giXGaXzFAkplRQS7iz4ihG
	 8q9+N7NUORl5A==
From: Catalin Marinas <cmarinas@kernel.org>
To: linux-kernel@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH V6 0/3] arm64/sysreg: Clean up TCR_EL1 field macros
Date: Thu, 13 Nov 2025 18:59:34 +0000
Message-ID: <176306037412.2469077.5781631213880341597.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013052945.2197190-1-anshuman.khandual@arm.com>
References: <20251013052945.2197190-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Mon, 13 Oct 2025 10:59:42 +0530, Anshuman Khandual wrote:
> Currently TCR_EL1 field macros are sprinkled across the arm64 platform code
> including KVM implementation. Clean these up via updating required register
> filed definitions in tools sysreg format and then subsequently doing all
> necessary replacements. All required TCR_XXX macros have been moved from
> (asm/pgtable-hwdef.h) into KVM header (asm/kvm_arm.h) for their continued
> usage in KVM.
> 
> [...]

Applied to arm64 (for-next/sysreg), thanks!

[2/3] arm64/sysreg: Replace TCR_EL1 field macros
      https://git.kernel.org/arm64/c/b0a3f0e894f3

The tools header updates can be triggered subsequently, I haven't queued
that. I left the KVM changes to Marc/Oliver.

-- 
Catalin


