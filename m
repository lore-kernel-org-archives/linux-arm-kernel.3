Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E37CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYS7fsNT9R9oAO3puCikrVTLce7BJXCsPPRVeJdhmFw=; b=n2iyMJY0G1dCnMIGRS6mYScgtc
	OgBEhpfsjK+bQNPTjoJ9goSboNE3YjGHbDtsFAf+IKLWAhVcAhI5gc9bXo4RHsaemityyElEkwXSt
	D8puHr8WmlvdfEAJ3D8BH/92v6mWAUpuyPGwH7F/SXDEftyOBf7NLFxsTVTaH5E2e4MiTmDmt0XQD
	s79IweJyqBAsVeulv3175H1xWcslXsgDCgRApG/75Idbu93I73ApTx9KrC3V8wknIBBbbAvY7cGwP
	M0xG64FG/WEJ5g8bRfuav456u1rK2hmGcb7TivK/v1s8MPhTEO64gv/WiTAoDoyTQZ3YXLZ5nAtQ3
	Eip5LPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZGz-000000036ba-0edW;
	Wed, 22 Oct 2025 13:53:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZGu-000000036a8-2eV7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:53:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE9561063;
	Wed, 22 Oct 2025 06:52:48 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE0763F59E;
	Wed, 22 Oct 2025 06:52:55 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:52:49 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [boot-wrapper PATCH 1/4] aarch64: do not trap MPAM register
 accesses
Message-ID: <aPjhsa9ZTSK5EEtE@e133380.arm.com>
References: <20251022102503.2878048-1-andre.przywara@arm.com>
 <20251022102503.2878048-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102503.2878048-2-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_065300_796740_07AFB0C8 
X-CRM114-Status: GOOD (  25.51  )
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

Hi Andre,

On Wed, Oct 22, 2025 at 11:25:00AM +0100, Andre Przywara wrote:
> The architectural MPAM system registers in lower ELs are controlled by
> an EL3 control bit. To allow access to registers like MPAM2_EL2 or
> MPAM_EL1, clear the TRAPLOWER bit in the MPAM3_EL3 system register, to
> avoid an unhandled trap into the boot-wrapper code.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/aarch64/include/asm/cpu.h | 4 ++++
>  arch/aarch64/init.c            | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
> index ac50474..0f6e2ce 100644
> --- a/arch/aarch64/include/asm/cpu.h
> +++ b/arch/aarch64/include/asm/cpu.h
> @@ -29,6 +29,9 @@
>  #define HFGWTR2_EL2		s3_4_c3_c1_3
>  #define HFGITR2_EL2		s3_4_c3_c1_7
>  
> +#define MPAM3_EL3		s3_6_c10_c5_0
> +#define MPAM3_EL3_TRAPLOWER	BIT(62)
> +
>  /*
>   * RES1 bit definitions definitions as of ARM DDI 0487G.b
>   *
> @@ -120,6 +123,7 @@
>  
>  #define ID_AA64PFR0_EL1_RAS		BITS(31, 28)
>  #define ID_AA64PFR0_EL1_SVE		BITS(35, 32)
> +#define ID_AA64PFR0_EL1_MPAM		BITS(43, 40)
>  #define ID_AA64PFR0_EL1_CSV2		BITS(59, 56)
>  
>  #define ID_AA64PFR1_EL1_MTE		BITS(11, 8)
> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
> index cb24f4e..99e43cf 100644
> --- a/arch/aarch64/init.c
> +++ b/arch/aarch64/init.c
> @@ -198,6 +198,9 @@ static void cpu_init_el3(void)
>  
>  		msr(SMCR_EL3, smcr);
>  	}
> +
> +	if (mrs_field(ID_AA64PFR0_EL1, MPAM))
> +		msr(MPAM3_EL3, mrs(MPAM3_EL3) & ~MPAM3_EL3_TRAPLOWER);
>  }

This enables register access to the MPAM-related CPU regs for lower ELs,
but doesn't fully enable MPAM.

There is a global switch to turn MPAM on (MPAMn_ELn.MPAMEN, where ELn
is the highest implemented EL).  It defaults to off, and lower ELs
can't turn it on.  Because it's off by default, most other CPU state
relating to MPAM is not in a defined state out of reset.


...So, I suspect we may need more steps here if we want MPAM to be
usable.

The platform should initialise resource controls in the memory system
for PARTID 0 in a sensible way without software having to do anything,
but we have to make sure that EL3 uses this PARTID and not something
random, and make lower ELs start out using it.  So, probably:

 	MPAM3_EL3.{PARTID,PMG}_{I,D} should be initialised to 0.
 	MPAM2_EL2.{PARTID,PMG}_{I,D} should be initialised to 0.

(Do we ever run the payload directly at EL1?  Hopefully not, but tf so
then we would need to initialise the IDs in MPAM1_EL1 also, and
initialise trap controls in MPAM2_EL2 and MPAMHCR_EL2 and make sure
that PARTID virtualisation controls are off in MPAMHCR_EL2.)

Many other controls require platform-specific knowledge in order to know
how to initialise them sensibly, even though the architecture resets
them to junk.

Since the bootwrapper is not attempting to define a security boundary,
it is probably reasonable to hand everything over to Non-secure, so far
as possible, so in MPAM3_EL3:

	SDEFLT should probably be 0.  (*)
	FORCE_NS should probably be 0.  (*)
	ALTSP_HEN should probably be 1.  (*; James might have a view.)
	ALTSP_EL3 should probably by 0, or left untouched  (*)(+)

(*) Feature-dependent -- in some cases the features that they depend on
have already been declared obsolete, but hopefully we can trust the
architects not to recycle the bits for other purposes.  I'm not sure
what the usual policy is on that.

(+) Architectural reset is IMP DEF.  So maybe it's something sane and
appropriate for the platform but then again, maybe not.

Then:

	ISB

and

	Initialise MPAM3_EL3.MPAMEN to 1.

(This is a global control.  Lower ELs can't turn it on for themselves,
but without it, IDs that they specify in MPAMx_ELx are ignored and
squashed to 0.)

The architecture says that MCSs out in the system will be initialised
with a sensible resource control configuration for PARTID 0.
We probably just have to trust that, otherwise we're in a world of
pain.


I can't promise that I haven't missed some stuff, here!

Cheers
---Dave

