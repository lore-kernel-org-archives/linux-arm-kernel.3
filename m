Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605E1C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc032N2dP+96gZo5C4cwrU+RJ37ABZ5fu4zPpJwktik=; b=mj+yQJFyzfbeUyecDnwHOz03z7
	XtE0rn57O3boRsdZxp43UVgjprfa36v4IogCnXm22UDTRuAetmSqejI5YI92AGMJ0NMMKazgw8nDE
	xzd9zV1XObWHsO5k8CtnrP/8NkX7vpOA+KKXuSO6otpSh9GI/QcaGf+TAerjtfX0qjeSGAWKdZadt
	Nxu09drKwJhE0qsTXVbqAUkCDDO8xDac80dHb7xB/IlpsiH2EsCk3DIQC/cUS9O+V2M1rLEBZzYoo
	aqBni+7tvtRlc1fnaQW/toZkdyNF3FDUJiDKk/2mo2kSmE1osOsez32l7/7HjcKQJpShU902bipDH
	46ULU3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyus-0000000506x-1ucN;
	Tue, 24 Jun 2025 08:22:07 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy4p-00000004rlL-3qM4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:28:21 +0000
Date: Tue, 24 Jun 2025 00:28:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750750096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lc032N2dP+96gZo5C4cwrU+RJ37ABZ5fu4zPpJwktik=;
	b=DqFTQJCzyv7ZW1hvEieX7Tv1cH2uTdFq+CU5nxIqcXQzUMK7fJNSfc1ljHoatbsDfahyJy
	A/drSdnfKA4r++oWZYI67rUXxdDdMTS78irjNs8L0Ja5xCl/c9X+xBvTINGbvVjcqLLx4a
	JKirWyEfgoAsJNKWk2g5AXAJMBIikM8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net,
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 01/23] arm64: cpufeature: Add cpucap for HPMN0
Message-ID: <aFpThZIE2PxjVAVw@linux.dev>
References: <aFYAXjzICzgmSyLI@linux.dev>
 <gsntqzza9uxp.fsf@coltonlewis-kvm.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsntqzza9uxp.fsf@coltonlewis-kvm.c.googlers.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_002820_163531_BFCDA7EB 
X-CRM114-Status: GOOD (  22.89  )
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

On Mon, Jun 23, 2025 at 06:25:38PM +0000, Colton Lewis wrote:
> Oliver Upton <oliver.upton@linux.dev> writes:
> 
> > On Fri, Jun 20, 2025 at 10:13:01PM +0000, Colton Lewis wrote:
> > > Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
> > > counters reserved for the guest.
> 
> > > This required changing HPMN0 to an UnsignedEnum in tools/sysreg
> > > because otherwise not all the appropriate macros are generated to add
> > > it to arm64_cpu_capabilities_arm64_features.
> 
> > > Signed-off-by: Colton Lewis <coltonlewis@google.com>
> > > ---
> > >   arch/arm64/kernel/cpufeature.c | 8 ++++++++
> > >   arch/arm64/tools/cpucaps       | 1 +
> > >   arch/arm64/tools/sysreg        | 6 +++---
> > >   3 files changed, 12 insertions(+), 3 deletions(-)
> 
> > > diff --git a/arch/arm64/kernel/cpufeature.c
> > > b/arch/arm64/kernel/cpufeature.c
> > > index b34044e20128..278294fdc97d 100644
> > > --- a/arch/arm64/kernel/cpufeature.c
> > > +++ b/arch/arm64/kernel/cpufeature.c
> > > @@ -548,6 +548,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
> > >   };
> 
> > >   static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
> > > ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
> > >   	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
> > > ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
> > >   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
> > > ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
> > >   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
> > > ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
> > > @@ -2896,6 +2897,13 @@ static const struct arm64_cpu_capabilities
> > > arm64_features[] = {
> > >   		.matches = has_cpuid_feature,
> > >   		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
> > >   	},
> > > +	{
> > > +		.desc = "Allow MDCR_EL2.HPMN = 0",
> 
> > This feedback still stands...
> 
> > 		.desc = "HPMN0",
> 
> > [*] https://lore.kernel.org/kvm/aD4ijUaSGm9b2g5H@linux.dev/
> 
> Sorry for ignoring your previous feedback. I looked at the other .desc
> fields and they had more descriptive English, so I think this one should
> be more than "FEAT_HPMN0" for consistency.
> 
> If you insist I'll change it.

I'm not exactly sold on the merits of using descriptive names for the
capabilities, as the architecture extension names are exact terms that
can be related back to documentation.

Thanks,
Oliver

