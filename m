Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A39CC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P9M4Y6vJ/Yd7xalN4nvkSQVOkzCNrbVCVIBQj20T8o=; b=JpHrAiWyzp1S1BB0xmEP3vTFzF
	fDaU/lkUasoWaDB5nJrpKB1X2zvigWmBjaiItnYLofOc2kH9+z5hjeked+zTGj9jRlLARKbHTaIRx
	vH3/uckHOKTY7uLuVbTM+/mwZfHCa0YuNpQfMo2tl5zrhvloZCrO3aRc+qDFuwh8jdGlqwvvxC1oW
	3QF/BrewYmSXMifQECvXMpeeW7YAkJf3tWJE+EWTpcqz6PvESJaqantAOvK+L76q2igGprruKg20c
	/6K7vDeTcp9rJGSZOKTNumBzT5wAQT8YxOjMYHigjhp47AmfhawWDN3c6a70h6cbZbXe7D/GZXcdn
	8eCICiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzpk-0000000BLS1-1mQv;
	Thu, 20 Aug 2026 10:17:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzph-0000000BLQd-2ohj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 10:17:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56DED14BF;
	Thu, 20 Aug 2026 03:17:06 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFEF23F66F;
	Thu, 20 Aug 2026 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787221030; bh=+7Rmuor6yXuOnxCcupVMz2jDFYfkI0A5Czu3oK9FVYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XD6tLs3/X7CDnMBm6Imqu8tx5lVQFY+S7OnbaDHQ1Or87h9W5tjb5+JvyI1wvWFj7
	 BPAWPekKQcovoaTpdRukZSwxKw9epksB57CaQwwdwAeXYQOp+8rPB0gzIsv1y1Ng8M
	 zFuRGVBbNYqOFafJlJH9wA4RMmBY5Zb3CT1+TBgQ=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 03/14] KVM: arm64: Manage GCS access and registers for guests
Date: Thu, 20 Aug 2026 11:16:59 +0100
Message-ID: <aobUGyq8nInJYkdA@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <48be9e5d-357a-4863-8682-8b3f34c69723@sirena.org.uk>
References: <aoXamcdKoMynTkpX@LeoBrasDK> <48be9e5d-357a-4863-8682-8b3f34c69723@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_031713_784132_FB8EB922 
X-CRM114-Status: GOOD (  25.82  )
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

On Wed, Aug 19, 2026 at 05:46:00PM +0100, Mark Brown wrote:
> On Wed, Aug 19, 2026 at 05:32:25PM +0100, Leonardo Bras wrote:
> > On Wed, Aug 12, 2026 at 08:12:02PM +0100, Mark Brown wrote:
> 
> > > In order to allow guests to use GCS we also need to configure
> > > HCRX_EL2.GCSEn, if this is not set GCS instructions will be noops and
> > > CHKFEAT will report GCS as disabled.
> 
> > It is zero on reset, and keeping it in zero disables GCS in EL0&EL1, so 
> > unless we are in EL2&0 (HCR_EL2.{E2H, TGE} is {1, 1}), we need to enable it 
> > so EL1&0 (guests) can have access to it.
> 
> Right.
> 
> > > @@ -77,6 +80,8 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
> > >  	__vcpu_assign_sys_reg(vcpu, SP_EL2,	 read_sysreg(sp_el1));
> > >  	__vcpu_assign_sys_reg(vcpu, ELR_EL2,	 read_sysreg_el1(SYS_ELR));
> > >  	__vcpu_assign_sys_reg(vcpu, SPSR_EL2,	 read_sysreg_el1(SYS_SPSR));
> > > +	if (ctxt_has_gcs(&vcpu->arch.ctxt))
> > > +		__vcpu_assign_sys_reg(vcpu, GCSPR_EL2, read_sysreg_el1(SYS_GCSPR));
> 
> > Out of curiosity here,
> > Why does the saving of GCSCR_EL2 depends on ctxt_has_tcrx() (and E2H set), 
> > and saving SYS_GCSPR does not? ... 
> 
> This is just because there isn't a preexisting ctxt_has_tcrx() check
> already there, FEAT_GCS architecturally depends on FEAT_TCRX and there
> was a request to make this explicit in the code to try to optimise
> things a bit.  The compiler should skip over both blocks at once if TCRX
> isn't there rather than having two separate tests or static branches.  I
> didn't add new checks where there were none since I expect that to be
> unhelpful for code generation, you'd get the reverse situation and emit
> two checks.

Humm, but then why saving GCSPR_EL2 does not depend on TCRX/E2H? Or maybe a 
better question, why are not GCSPR_EL2 and GCSCR_EL2 saved in the same 'if' 
clause under ctxt_has_tcrx() (and E2H set), if they are restored in the 
same 'if' clause?

As you mentioned, GCS depends on TCRX, so it should be fine, but just by 
reading the code I see:
- GCSCR_EL2 :
	Save if 	GCS=1, TCRX=1, E2H=1
	Restore if 	GCS=1, TCRX=1
- GCSPR_EL2 :
	Save if 	GCS=1,
	Restore if	GCS=1, TCRX=1

Which looks kind of confusing for the as a first time reader.

Does it make sense?

Thanks!
Leo

