Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B59CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3SSyL6XDPm0B1wSgJccpgK6c1F2MWcK3UMGOKWZ9yA=; b=2D02SAQ/RaA1p3M3AmNPjls/d1
	nmyddde5yECtDmv3jYCRCl+G2uXboDl9KwPYNPSzjN70nCKEsLNS/8OxJK1fRXWRAbdnbRekAwBKD
	DRd++sAxS1vM4+1wQjumqVYpEOxdMnX7VLeKIphElmeI1BQHsEszd1qrCNkI/1i8F99lhRXNEn6lu
	Q+6ig+Tu8X6n5b/6KSAwRNl3ZjawFbelCVhp5qohAXYtWAByXqJ97/wa/h6xfOPn50CBG2wdhrKv8
	wTwAxrEVE6Q+r831XfLecI5s69fjdS/lm0TADAgGk9qNiu1QGmqacryB5nKcnPfRvnnt5d0LldUsO
	vCRA+hdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTFI-0000000DbtN-3qRu;
	Tue, 02 Jun 2026 17:49:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTFH-0000000DbtD-1ZEg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:49:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97F9960098;
	Tue,  2 Jun 2026 17:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375831F00893;
	Tue,  2 Jun 2026 17:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780422582;
	bh=x3SSyL6XDPm0B1wSgJccpgK6c1F2MWcK3UMGOKWZ9yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=THcXnvnh6bAvtnE2NpOON27TvODIIYnWcLsKAgn+KY/kcro/zOo3a/xoP0wb/Kvl6
	 g07daCyMzMxmmu5y+VgVYU6hAfhwdtpRtio6OXCL2dnEdrfZme0srbziRhsaRkjzIk
	 a7OuaqvL5FrPBrMlKPzTC9daOtEVWYcHrRjK5l9zZlPLbfWQZhzAiwLhaANRKtu03k
	 1g76msvXjZzSFueZUKcdX7zpvJdcSkDdA0NKhxtaPqRp+OrJeauRJe5uZXAe3MLjtK
	 R0bSNeUCFGmCslHSNglwula4bcpSmrtZZ1CqTjzU3QR4g3LExcIWlfeebEXL6EeIwW
	 qrzg/4Q/D1K1A==
Date: Tue, 2 Jun 2026 10:49:41 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/3] KVM: arm64: FEAT_{S1POE,ATS1A} support fixes
Message-ID: <ah8Xtf7zvyTT5MJ6@kernel.org>
References: <20260602155430.2088142-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602155430.2088142-1-maz@kernel.org>
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

On Tue, Jun 02, 2026 at 04:54:26PM +0100, Marc Zyngier wrote:
> Whilst working on a slightly unrelated feature (FEAT_NV3), I found out
> that an L2 guest wouldn't boot if the host was exposed to FEAT_S1POE.
> 
> Upon investigation (and hours wasted in a SW model), it became
> apparent that while the AT S1E1A code was ready for action, it had
> never been fully plugged in (blame the usual suspect...).
> 
> This resulted in an extremely odd failure mode, with an L2 being
> unable to make forward progress, but KVM at L1 not taking the hint
> that something was really wrong. Additionally, an embarrassing typo
> was spotted in the CPTR_EL2 handling.
> 
> With this in, FEAT_S1POE no longer breaks our NV guests.
> 
> Marc Zyngier (3):
>   KVM: arm64: Key CPTR_EL2.E0POE propagation on FEAT_S1POE
>   KVM: arm64: Wire AT S1E1A in the system instruction handling table
>   arm64: cpufeature: Expose ID_AA64ISAR2_EL1.ATS1A to KVM

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

>  arch/arm64/kernel/cpufeature.c          | 1 +
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
>  arch/arm64/kvm/sys_regs.c               | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> -- 
> 2.47.3
> 

