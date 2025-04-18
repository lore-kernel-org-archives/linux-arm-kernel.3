Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACC3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 04:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+Vn2LFhCAzHkJFT91OLq9Z8RSQTkODvQle+BJwxdds=; b=JEmbP5QWCP6lBsIr2YeeIgTvOc
	4sm4GMq1LKReB5Jk/zC1o1o4e07gGtwB8afqX4Vsx7/SaNQ7+v9nO27LkhXnMgS/IM6DFcgh+Bq6N
	Le4sEGoPFKnGQbA3kHIEAEOgrxe8FFFfCmUU/tRWm4m2S2mpJJF/fcgFjnlutIlNbncBH3ymqf4QF
	bsQd+jJ/qZIFcKYklRjdgFCp6f/lxP/FskqrFzfBF5k1mqBzzlV6riudpByrnXT1Ow0IHgezpvYIS
	6okXNzHJJ0VWYi3NtbEa18oUMy9ht3qZKC3v/eEPNImKJbBpf0KfZH/Vk1b0odFgcaiA1A1JdNScs
	Yq1b5ScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5d3y-0000000F44v-3x6v;
	Fri, 18 Apr 2025 04:10:50 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5d26-0000000F3vs-2ssE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 04:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1744949329;
	bh=L+Vn2LFhCAzHkJFT91OLq9Z8RSQTkODvQle+BJwxdds=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lfYt/ad4VufDrNMIX6D1SUO9+z3rcxqWivBBdEoxlneim3k3r4yvwN1BzsxboAYdn
	 GoFnPCOXVr0CPR1nV+gGOvskWVjM+tvnUuKd2Hk1ZOCCLCyhnoPNOkUZCxMxbgrLQj
	 jVKJfXwYmoCbnvuIg1AIPatbkaChKPlbSuDx+LXw=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3957C65A96;
	Fri, 18 Apr 2025 00:08:46 -0400 (EDT)
Message-ID: <353a56b54fb5505ad43035f9f06971fb8171fd79.camel@xry111.site>
Subject: Ping: [PATCH v2] arm64: Add overrride for MPAM
From: Xi Ruoyao <xry111@xry111.site>
To: James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Mingcong Bai
 <jeffbai@aosc.io>
Date: Fri, 18 Apr 2025 12:08:45 +0800
In-Reply-To: <20250402031603.35411-1-xry111@xry111.site>
References: <20250402031603.35411-1-xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_210854_749022_5B628AC3 
X-CRM114-Status: GOOD (  25.70  )
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

On Wed, 2025-04-02 at 11:12 +0800, Xi Ruoyao wrote:
> As the message of the commit 09e6b306f3ba ("arm64: cpufeature: discover
> CPU support for MPAM") already states, if a buggy firmware fails to
> either enable MPAM or emulate the trap as if it were disabled, the
> kernel will just fail to boot.=C2=A0 While upgrading the firmware should =
be
> the best solution, we have some hardware of which the vendor have made
> no response 2 months after we requested a firmware update.=C2=A0 Allow
> overriding it so our devices don't become some e-waste.
>=20
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Mingcong Bai <jeffbai@aosc.io>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---

Ping.

>=20
> [v1]->v2:
> - Handle the override and initialize EL2 mpam in finalise_el2_state
> - Move info->mpamidr assignment to {init,update}_cpu_features
>=20
> [v1]: https://lore.kernel.org/linux-arm-kernel/20250401055650.22542-1-xry=
111@xry111.site/
>=20
> =C2=A0.../admin-guide/kernel-parameters.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A0arch/arm64/include/asm/el2_setup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++++++-----------
> =C2=A0arch/arm64/kernel/cpufeature.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++++--
> =C2=A0arch/arm64/kernel/cpuinfo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 7 ++++--
> =C2=A0arch/arm64/kernel/pi/idreg-override.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A05 files changed, 26 insertions(+), 18 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 3435a062a208..4f2caa706268 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -458,6 +458,9 @@
> =C2=A0	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memor=
y
> =C2=A0			Set instructions support
> =C2=A0
> +	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
> +			Monitoring support
> +
> =C2=A0	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extensi=
on
> =C2=A0			support
> =C2=A0
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/=
el2_setup.h
> index ebceaae3c749..777190ec2b5e 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -294,19 +294,6 @@
> =C2=A0.Lskip_gcs_\@:
> =C2=A0.endm
> =C2=A0
> -.macro __init_el2_mpam
> -	/* Memory Partitioning And Monitoring: disable EL2 traps */
> -	mrs	x1, id_aa64pfr0_el1
> -	ubfx	x0, x1, #ID_AA64PFR0_EL1_MPAM_SHIFT, #4
> -	cbz	x0, .Lskip_mpam_\@		// skip if no MPAM
> -	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
> -						// and disable lower traps
> -	mrs_s	x0, SYS_MPAMIDR_EL1
> -	tbz	x0, #MPAMIDR_EL1_HAS_HCR_SHIFT, .Lskip_mpam_\@	// skip if no MPAMHC=
R reg
> -	msr_s	SYS_MPAMHCR_EL2, xzr		// clear TRAP_MPAMIDR_EL1 -> EL2
> -.Lskip_mpam_\@:
> -.endm
> -
> =C2=A0/**
> =C2=A0 * Initialize EL2 registers to sane values. This should be called e=
arly on all
> =C2=A0 * cores that were booted in EL2. Note that everything gets initial=
ised as
> @@ -324,7 +311,6 @@
> =C2=A0	__init_el2_stage2
> =C2=A0	__init_el2_gicv3
> =C2=A0	__init_el2_hstr
> -	__init_el2_mpam
> =C2=A0	__init_el2_nvhe_idregs
> =C2=A0	__init_el2_cptr
> =C2=A0	__init_el2_fgt
> @@ -371,6 +357,16 @@
> =C2=A0#endif
> =C2=A0
> =C2=A0.macro finalise_el2_state
> +	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@,=
 .Lskip_mpam_\@, x1, x2
> +
> +.Linit_mpam_\@:
> +	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
> +						// and disable lower traps
> +	mrs_s	x0, SYS_MPAMIDR_EL1
> +	tbz	x0, #MPAMIDR_EL1_HAS_HCR_SHIFT, .Lskip_mpam_\@=C2=A0 // skip if no =
MPAMHCR reg
> +	msr_s=C2=A0=C2=A0 SYS_MPAMHCR_EL2, xzr		// clear TRAP_MPAMIDR_EL1 -> EL=
2
> +
> +.Lskip_mpam_\@:
> =C2=A0	check_override id_aa64pfr0, ID_AA64PFR0_EL1_SVE_SHIFT, .Linit_sve_=
\@, .Lskip_sve_\@, x1, x2
> =C2=A0
> =C2=A0.Linit_sve_\@:	/* SVE register access */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeatur=
e.c
> index 9c4d6d552b25..44dcc0037ec2 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -88,6 +88,7 @@
> =C2=A0#include <asm/mte.h>
> =C2=A0#include <asm/hypervisor.h>
> =C2=A0#include <asm/processor.h>
> +#include <asm/ptrace.h>
> =C2=A0#include <asm/smp.h>
> =C2=A0#include <asm/sysreg.h>
> =C2=A0#include <asm/traps.h>
> @@ -1191,8 +1192,10 @@ void __init init_cpu_features(struct cpuinfo_arm64=
 *info)
> =C2=A0		cpacr_restore(cpacr);
> =C2=A0	}
> =C2=A0
> -	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
> +	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
> +		info->reg_mpamidr =3D read_cpuid(MPAMIDR_EL1);
> =C2=A0		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
> +	}
> =C2=A0
> =C2=A0	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
> =C2=A0		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
> @@ -1443,7 +1446,8 @@ void update_cpu_features(int cpu,
> =C2=A0		cpacr_restore(cpacr);
> =C2=A0	}
> =C2=A0
> -	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0)) {
> +	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
> +		info->reg_mpamidr =3D read_cpuid(MPAMIDR_EL1);
> =C2=A0		taint |=3D check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
> =C2=A0					info->reg_mpamidr, boot->reg_mpamidr);
> =C2=A0	}
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 285d7d538342..1c114f97bf1e 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -494,8 +494,11 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64=
 *info)
> =C2=A0	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
> =C2=A0		__cpuinfo_store_cpu_32bit(&info->aarch32);
> =C2=A0
> -	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
> -		info->reg_mpamidr =3D read_cpuid(MPAMIDR_EL1);
> +	/*
> +	 * info->mpamidr deferred to {init,update}_cpu_features because we
> +	 * don't want to read it (and trigger a trap on buggy firmware) if
> +	 * using an aa64pfr0_el1 override to unconditionally disable MPAM.
> +	 */
> =C2=A0
> =C2=A0	if (IS_ENABLED(CONFIG_ARM64_SME) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 id_aa64pfr1_sme(info->reg_id_aa64pfr1)) {
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi=
/idreg-override.c
> index c6b185b885f7..836e5a9b98d0 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -127,6 +127,7 @@ static const struct ftr_set_desc pfr0 __prel64_initco=
nst =3D {
> =C2=A0	.fields		=3D {
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD("sve", ID_AA64PFR=
0_EL1_SVE_SHIFT, pfr0_sve_filter),
> =C2=A0		FIELD("el0", ID_AA64PFR0_EL1_EL0_SHIFT, NULL),
> +		FIELD("mpam", ID_AA64PFR0_EL1_MPAM_SHIFT, NULL),
> =C2=A0		{}
> =C2=A0	},
> =C2=A0};
> @@ -246,6 +247,7 @@ static const struct {
> =C2=A0	{ "rodata=3Doff",			"arm64_sw.rodataoff=3D1" },
> =C2=A0	{ "arm64.nolva",		"id_aa64mmfr2.varange=3D0" },
> =C2=A0	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=3D1" },
> +	{ "arm64.nompam",		"id_aa64pfr0.mpam=3D0" },
> =C2=A0};
> =C2=A0
> =C2=A0static int __init parse_hexdigit(const char *p, u64 *v)

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

