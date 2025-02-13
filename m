Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778D7C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpWjeJzRr/ybBDMxduT1xeopZGvxKJ15VmKmZZRWILs=; b=Ib/djcHQVVbnp/wLBmc8JF85Pl
	0Z0GVrW24Vjoe3j6zeCFM6bzLsFT3nz2otJgf1nG2f7pZd6ZJv3RyScc4U1ct4DoAN2bqB4fwqb2c
	BIvAqLCgVP7FvEOfKDh+w9456xOyTl0i+eqFNciUuRumNkf5Xp0iKpGHy6LzR7MJX0pjy91KgO/wF
	B9SUVXcI6MQxpXHUEXqIhexxBoRK/DGyvIDxRXq9DtLv2OAM/2PQqZH4DsaLxF/6OhJkCZSitoD+g
	8y6HAsXcZ41foLYdPMKjc8vl10gxRDQ+e+SKqMfYpepDJowlGYwjEfA6OLZFZC5/v1rkpc7j0BeSb
	INfcVAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVXo-0000000ATMG-2ETF;
	Thu, 13 Feb 2025 09:30:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVSS-0000000ARtX-0WSo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:24:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE7BE16F3;
	Thu, 13 Feb 2025 01:24:51 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77FCF3F58B;
	Thu, 13 Feb 2025 01:24:29 -0800 (PST)
Date: Thu, 13 Feb 2025 09:24:22 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v7] KVM: arm64: Fix confusion in documentation for pKVM
 SME assert
Message-ID: <Z626RqzA3HMskwJd@J2N7QTR9R3>
References: <20250212-kvm-arm64-sme-assert-v7-1-0f786db838d3@kernel.org>
 <Z6yByMUBPDUyEWOr@J2N7QTR9R3>
 <86tt8yrzon.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86tt8yrzon.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_012432_252011_CA2C1F62 
X-CRM114-Status: GOOD (  30.46  )
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

On Thu, Feb 13, 2025 at 08:55:52AM +0000, Marc Zyngier wrote:
> On Wed, 12 Feb 2025 11:11:04 +0000,
> Mark Rutland <mark.rutland@arm.com> wrote:
> > On Wed, Feb 12, 2025 at 12:44:57AM +0000, Mark Brown wrote:
> > > diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> > > index 4d3d1a2eb157047b4b2488e9c4ffaabc6f5a0818..e37e53883c357093ff4455f5afdaec90e662d744 100644
> > > --- a/arch/arm64/kvm/fpsimd.c
> > > +++ b/arch/arm64/kvm/fpsimd.c
> > > @@ -93,11 +93,14 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
> > >  	}
> > >  
> > >  	/*
> > > -	 * If normal guests gain SME support, maintain this behavior for pKVM
> > > -	 * guests, which don't support SME.
> > > +	 * Protected and non-protected KVM modes require that
> > > +	 * SVCR.{SM,ZA} == {0,0} when entering a guest so that no
> > > +	 * host/guest SME state needs to be saved/restored by hyp code.
> > > +	 *
> > > +	 * In protected mode, hyp code will verify this later.
> > >  	 */
> > > -	WARN_ON(is_protected_kvm_enabled() && system_supports_sme() &&
> > > -		read_sysreg_s(SYS_SVCR));
> > > +	WARN_ON_ONCE(is_protected_kvm_enabled() && system_supports_sme() &&
> > > +		     read_sysreg_s(SYS_SVCR));
> > 
> > As I mentioned on the last round, we can drop the is_protected_kvm_enabled()
> > check, i.e. have:
> > 
> > 	/*
> > 	 * Protected and non-protected KVM modes require that
> > 	 * SVCR.{SM,ZA} == {0,0} when entering a guest so that no
> > 	 * host/guest SME state needs to be saved/restored by hyp code.
> > 	 *
> > 	 * In protected mode, hyp code will verify this later.
> > 	 */
> > 	WARN_ON_ONCE(system_supports_sme() && read_sysreg_s(SYS_SVCR));
> > 
> > Either way:
> > 
> > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > 
> > Marc, are you happy to queue this atop the recent fixes from me? Those
> > try to ensure SVCR.{SM,ZA} == {0,0} regardless of whether KVM is in
> > protected mode.
> 
> In all honesty, I find that at this stage, the comment just gets in
> the way and is over-describing what is at stake here.
> 
> The
> 
>  	WARN_ON_ONCE(system_supports_sme() && read_sysreg_s(SYS_SVCR));
> 
> is really the only thing that matters. It perfectly shows what we are
> checking for, and doesn't need an exegesis.
> 
> As for the Fixes: tag, and given the magnitude of the actual fixes
> that are already queued, I don't think we need it.

That's fair; if you haven't spun a patch for that already, I guess we're
after the following?

Mark.

---->8----
From 4d05f6dd6d39c747c175782b7b44daa775251994 Mon Sep 17 00:00:00 2001
From: Mark Rutland <mark.rutland@arm.com>
Date: Thu, 13 Feb 2025 09:15:31 +0000
Subject: [PATCH] KVM: arm64: Simplify warning in kvm_arch_vcpu_load_fp()

At the end of kvm_arch_vcpu_load_fp() we check that no bits are set in
SVCR. We only check this for protected mode despite this mattering
equally for non-protected mode, and the comment above this is confusing.

Remove the comment and simplify the check, moving from WARN_ON() to
WARN_ON_ONCE() to avoid spamming the log.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/kvm/fpsimd.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 3cbb999419af7..7f6e43d256915 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -65,12 +65,7 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	fpsimd_save_and_flush_cpu_state();
 	*host_data_ptr(fp_owner) = FP_STATE_FREE;
 
-	/*
-	 * If normal guests gain SME support, maintain this behavior for pKVM
-	 * guests, which don't support SME.
-	 */
-	WARN_ON(is_protected_kvm_enabled() && system_supports_sme() &&
-		read_sysreg_s(SYS_SVCR));
+	WARN_ON_ONCE(system_supports_sme() && read_sysreg_s(SYS_SVCR));
 }
 
 /*
-- 
2.30.2


