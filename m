Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BF8C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-id:
	Content-transfer-encoding:Cc:Date:In-reply-to:From:Subject:MIME-version:
	Content-type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MObF2ZufsNFWLakEy48uUA9PR0QzdQdPvYTzDxrlqLs=; b=ojIKcw5TqUhaEd8e/5hd+2LsVh
	SNFuLKQ3JLWv6PFMoyRIj/ZDk7y+RW5qU9Vsl3SfQiZUWreuH5yeR2urB7mjGmN+8USYl3za9oOzD
	iLV5ga8FBjKAVKFtEWcBULUJ7bmT8RqpCoxKr49gcjB50MOfK0Cv7nTABtEE0AAoV0q3gU+mWqaOq
	jq3N1v9GB5Vk7UzoiUWm+BC6V0GINHxiIQRnfAIrcg0+BAplKWLZ6VsTYsySKUd2sur3xIkj5c4XE
	/rwMk4Py3A635fG1Zon64FU87csE2RXKNRk3ZaxTfVbLvnlzYOBVkyjUrXT2UkMJ1O4KupAlobhHw
	ySi54xzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpr1Q-0000000DGEp-3abn;
	Fri, 31 Jul 2026 17:27:48 +0000
Received: from vib-mx02.apple.com ([17.132.96.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpr1O-0000000DGDE-2Q8J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:27:47 +0000
Received: from vb11p01nt-mtap02.apple.com
 (vb11p01nt-mtap02.ise.apple.com [100.84.70.82]) by vb11p01nt-mxp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20250821 64bit (built Aug 21
 2025)) with ESMTPS id <0TJ11OTLSV5TPG00@vb11p01nt-mxp02.apple.com> for
 linux-arm-kernel@lists.infradead.org; Fri, 31 Jul 2026 17:27:38 +0000 (GMT)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=20180706;
 bh=MObF2ZufsNFWLakEy48uUA9PR0QzdQdPvYTzDxrlqLs=;
 b=F6mc8cVlKf7m61YxPZwe3ejymW1oDBnYK6G8l9OoxtSTsYX2rcA47imundOt3Rcev/6k
 +0MDrn6yH4CGndbzxqjshnNk9u49FNyt9zarG1VBNLdqODslscJIMm/8fGN9iBExoiLj
 YrYTLu9Co3c7y+yEmrpP54OGHid3945mHc1CJZ3Q4dNVZHY35rFnBDXsbr8cL5QxphAC
 WLjuLIUQMpDPksM4QvmP6a0dvM8c1th0FShUMUpUwooluEpqmTBHbSfxJS8IRnilKtl0
 hPt1mHOdwEzNKSRo6TcJNYSSnP4JeizLAq43CArdmTUJ26j81E8iCeEX3YJXg4zFLZGo OA==
Received: from am11p01nt-mmpp03.apple.com
 (am11p01nt-mmpp03.ise.apple.com [100.85.69.141]) by vb11p01nt-mtap02.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20250821 64bit (built Aug 21
 2025)) with ESMTPS id <0TJ10MD85V4SJL10@vb11p01nt-mtap02.apple.com>; Fri,
 31 Jul 2026 17:27:27 +0000 (GMT)
Received: from process_milters-daemon.am11p01nt-mmpp03.apple.com by
 am11p01nt-mmpp03.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20260513 64bit (built May 13
 2026)) id <0TJ103Y00V4MQO00@am11p01nt-mmpp03.apple.com>; Fri,
 31 Jul 2026 17:27:05 +0000 (GMT)
X-Va-A: 
X-Va-T-CD: cbf7380921e8e2f9db5ea993b70cea12
X-Va-E-CD: 70325e34e83579c3b3fcbc67bcb40655
X-Va-R-CD: bfd83131a8ab6e66990b315bd3663b76
X-Va-ID: 5150be6b-52f0-443a-9b0f-318900a89bab
X-Va-CD: 0
X-V-A: 
X-V-T-CD: cbf7380921e8e2f9db5ea993b70cea12
X-V-E-CD: 70325e34e83579c3b3fcbc67bcb40655
X-V-R-CD: bfd83131a8ab6e66990b315bd3663b76
X-V-ID: bfdce288-5561-4bde-ae98-94b661e68972
X-V-CD: 0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
Received: from smtpclient.apple (unknown [10.106.1.184])
 by am11p01nt-mmpp03.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20260513 64bit (built May 13
 2026)) with ESMTPSA id <0TJ103G4AV4UMD00@am11p01nt-mmpp03.apple.com>; Fri,
 31 Jul 2026 17:27:02 +0000 (GMT)
Content-type: text/plain; charset=us-ascii
MIME-version: 1.0 (Mac OS X Mail 16.0 \(3892.100.6\))
Subject: Re: [PATCH] arm64: archrandom: avoid trapping ID register read in
 __cpu_has_rng()
From: Aman Priyadarshi <amanp@apple.com>
In-reply-to: <amy0dVzgY-uPTTtU@google.com>
Date: Fri, 31 Jul 2026 18:26:44 +0100
Cc: catalin.marinas@arm.com, Jason@zx2c4.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Content-transfer-encoding: quoted-printable
Message-id: <97FF53B9-993A-4E73-9C6B-0DA514AD0778@apple.com>
References: <20260720140615.99343-1-amanp@apple.com>
 <amy0dVzgY-uPTTtU@google.com>
To: Will Deacon <will@kernel.org>
X-Mailer: Apple Mail (2.3892.100.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_102746_633116_E2A9387A 
X-CRM114-Status: GOOD (  33.51  )
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

Hi Will,

Thank you for reviewing the patch!

> On 31 Jul 2026, at 15:43, Will Deacon <will@kernel.org> wrote:
>=20
> Hi Aman,
>=20
> On Mon, Jul 20, 2026 at 03:06:15PM +0100, Aman Priyadarshi wrote:
>> __cpu_has_rng() has an early-boot fallback, taken before the
>> ARM64_HAS_RNG alternative is patched, that calls
>> this_cpu_has_cap(ARM64_HAS_RNG). With SCOPE_LOCAL_CPU that resolves =
the
>> capability by reading ID_AA64ISAR0_EL1 directly from hardware via
>> __read_sysreg_by_encoding(), on every invocation.
>>=20
>> Until the CRNG is seeded, crng_make_state() routes every =
get_random_*()
>> through extract_entropy(), which drains architectural entropy via
>> arch_get_random_seed_longs()/arch_get_random_longs() and so calls
>> __cpu_has_rng() several times per request. On a direct (non-EFI) boot
>> there is no bootloader seed, so the CRNG stays unseeded for much of
>> boot and essentially every early randomness consumer takes this path.
>>=20
>> Under virtualization this is costly: the hypervisor traps guest
>> accesses to the ID registers (HCR_EL2.TID3), making each read a =
vmexit,
>> producing ~200k trapped ID_AA64ISAR0_EL1 reads during boot.
>>=20
>> The register value is invariant, so read the sanitised feature =
register
>> instead. read_sanitised_ftr_reg() returns the cached value from
>> arm64_ftr_regs[] with no sysreg access, and hence no trap. That array
>> is populated by cpuinfo_store_boot_cpu() in smp_prepare_boot_cpu(),
>> before the first early RNG use in random_init_early(), so it is =
always
>> valid here.
>>=20
>> With this change the trapped reads drop from ~200k to handful number =
of
>> times, and the boot time drops roughly by 6.3% in the test =
environment.
>=20
> Yikes, that's quite a compelling performance improvement.
>=20
>> diff --git a/arch/arm64/include/asm/archrandom.h =
b/arch/arm64/include/asm/archrandom.h
>> index 8babfbe31f95..8067e9a35641 100644
>> --- a/arch/arm64/include/asm/archrandom.h
>> +++ b/arch/arm64/include/asm/archrandom.h
>> @@ -61,8 +61,22 @@ static inline bool __arm64_rndrrs(unsigned long =
*v)
>>=20
>> static __always_inline bool __cpu_has_rng(void)
>> {
>> - if (unlikely(!system_capabilities_finalized() && !preemptible()))
>> - return this_cpu_has_cap(ARM64_HAS_RNG);
>> + if (unlikely(!system_capabilities_finalized() && !preemptible())) {
>> + /*
>> + * Until the ARM64_HAS_RNG alternative is patched we can't use
>> + * the static-branch form, so consult the feature register
>> + * directly. Don't use this_cpu_has_cap() here: it reads
>> + * ID_AA64ISAR0_EL1 from hardware on every call, under
>> + * virtualization each ID register read traps to the hypervisor
>> + * (HCR_EL2.TID3) -- producing a storm of vmexits during boot.
>> + * The sanitised value is cached in memory.
>> + */
>> + u64 isar0 =3D read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
>> +
>> + return cpuid_feature_extract_unsigned_field(isar0,
>> + ID_AA64ISAR0_EL1_RNDR_SHIFT) >=3D
>> + ID_AA64ISAR0_EL1_RNDR_IMP;
>> + }
>=20
> You can probably rewrite this a little more cleanly along the lines of
> the (not even compile-tested) diff below. I was about to do that, but
> then I got a bit confused by the whole thing. The preemptible() check =
is
> presumably not needed if we're accessing the in-memory feature =
registers
> rather than the per-CPU id registers, but then how do you handle races
> with concurrent updates to the "safe value" made by CPUs concurrently
> coming online?

I kept preemptible() check for this exact reason: the updates made by =
CPUs
concurrently coming online will always take the downgrade path (a =
secondary
CPU can clear RNDR, never set it), and therefore by taking the =
non-preemptible
branch I can guarantee that the pinned CPU supports the said feature.
I agree, this assumes that a secondary CPU folds its own ID registers =
into sys_val
before it can ever be a randomness consumer, but looking at the code =
that seems
the case, please feel free to correct me.
Besides, in my opinion, it's hard to argue correctness of this code =
without
preemptible() check.

>=20
> Will
>=20
> --->8
>=20
> diff --git a/arch/arm64/include/asm/archrandom.h =
b/arch/arm64/include/asm/archrandom.h
> index 8babfbe31f95..1c6ccc1776cd 100644
> --- a/arch/arm64/include/asm/archrandom.h
> +++ b/arch/arm64/include/asm/archrandom.h
> @@ -61,8 +61,17 @@ static inline bool __arm64_rndrrs(unsigned long *v)
>=20
> static __always_inline bool __cpu_has_rng(void)
> {
> -       if (unlikely(!system_capabilities_finalized() && =
!preemptible()))
> -               return this_cpu_has_cap(ARM64_HAS_RNG);
> +       if (unlikely(!system_capabilities_finalized() && =
!preemptible())) {
> +               /*
> +                * Query the in-memory sanitised value to avoid a =
potential
> +                * trap when accessing the ID register under a =
hypervisor.
> +                */
> +               u64 isar0 =3D =
read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
> +               u64 rndr =3D SYS_FIELD_GET(ID_AA64ISAR0_EL1, RNDR, =
isar0);
> +
> +               return rndr >=3D ID_AA64ISAR0_EL1_RNDR_IMP;
> +       }
> +
>        return alternative_has_cap_unlikely(ARM64_HAS_RNG);
> }

Agreed, this looks cleaner. Thanks!

- Aman Priyadarshi=

