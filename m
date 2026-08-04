Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4A9C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-id:
	Content-transfer-encoding:Cc:Date:In-reply-to:From:Subject:MIME-version:
	Content-type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=636Bfp0MRGv+96G+3mSLIveR31QmlhIcbOty6PIr0hQ=; b=CZ1QDURgfIDnVV5Jwir/x2C0Cc
	66Xg/ukczrInl/HYrJlgfJzsLsETUZpZdTGdK79l2vup9PxtSLoFgveOZrLHkjCgglVfJY93MefKG
	yOjlq/LcuF5SApX+eTVbZDDyznE/EwrJlgMwLnzpsmSQyraUJAHFTwf9s3oGtztMjkQZ2AHHiXErR
	akjxKwv86OIYzvMr7doKp4W2kIKDO+Oy9bXedDkc0l0VZfnSzPvQywe2Tb+heJB9iKCmx6YRVZA7b
	c20U6AM3DXFYaL67WHDlP632ID/TbYQi/71QQotRiccC0yJcx8+mWc41fYLix64G7Ew8/NCEiF5dU
	jeKoVT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHPp-00000002FH8-2zMY;
	Tue, 04 Aug 2026 15:50:53 +0000
Received: from hfd-mx02.apple.com ([17.132.100.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHPn-00000002FGX-1cLW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:50:52 +0000
Received: from am11p01nt-mtap02.apple.com
 (am11p01nt-mtap02.ise.apple.com [100.85.69.166]) by am11p01nt-mxp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20250821 64bit (built Aug 21
 2025)) with ESMTPS id <0TJ90XMHS5CO6I00@am11p01nt-mxp02.apple.com> for
 linux-arm-kernel@lists.infradead.org; Tue, 04 Aug 2026 15:50:48 +0000 (GMT)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=20180706;
 bh=636Bfp0MRGv+96G+3mSLIveR31QmlhIcbOty6PIr0hQ=;
 b=otclbzHVJnvqLf8YplYLMYWAwboBOMw3kr6vGwjXtqzBxMyvcNLo1kc7E5INm4EEiPfx
 bqTQOvGQjx6WDFpit616Uq34tJ/kZusUyk6FTQdu4GKo3r+uOkqVNoNfbfEUj2D4ge0G
 mSZkV1TT1eH/cfIRhYkqVD17wFmVbXp1+p54nSJIf07RGcX4k48Lk5YY2gEAQfhBzIdG
 5P3RoU5XLgBp0XMCppYlZ8JNxrnEQprSG5xm68OK+TMDTDBmxlRsopSmMjFmqzEtxaUJ
 f1pNPbNe7FSBTn83bxmin2are72NAVSTwVej83KrJv1PN/p7RGwXHWFeebptBRUPo1GX PQ==
Received: from am11p01nt-mmpp01.apple.com
 (am11p01nt-mmpp01.ise.apple.com [100.85.69.136]) by am11p01nt-mtap02.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20250821 64bit (built Aug 21
 2025)) with ESMTPS id <0TJ927JU55CO1V10@am11p01nt-mtap02.apple.com>; Tue,
 04 Aug 2026 15:50:48 +0000 (GMT)
Received: from process_milters-daemon.am11p01nt-mmpp01.apple.com by
 am11p01nt-mmpp01.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20260513 64bit (built May 13
 2026)) id <0TJ90FA004XSB300@am11p01nt-mmpp01.apple.com>; Tue,
 04 Aug 2026 15:50:48 +0000 (GMT)
X-Va-A: 
X-Va-T-CD: cbf7380921e8e2f9db5ea993b70cea12
X-Va-E-CD: 70325e34e83579c3b3fcbc67bcb40655
X-Va-R-CD: bfd83131a8ab6e66990b315bd3663b76
X-Va-ID: 8c74d87c-24c6-4e8d-bd90-414859810763
X-Va-CD: 0
X-V-A: 
X-V-T-CD: cbf7380921e8e2f9db5ea993b70cea12
X-V-E-CD: 70325e34e83579c3b3fcbc67bcb40655
X-V-R-CD: bfd83131a8ab6e66990b315bd3663b76
X-V-ID: 79cab5e4-a447-459b-b876-3eae2c9120c4
X-V-CD: 0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
Received: from smtpclient.apple (unknown [10.106.27.152])
 by am11p01nt-mmpp01.apple.com
 (Oracle Communications Messaging Server 8.1.0.28.20260513 64bit (built May 13
 2026)) with ESMTPSA id <0TJ90F7745CLTX00@am11p01nt-mmpp01.apple.com>; Tue,
 04 Aug 2026 15:50:47 +0000 (GMT)
Content-type: text/plain; charset=us-ascii
MIME-version: 1.0 (Mac OS X Mail 16.0 \(3892.100.6\))
Subject: Re: [PATCH] arm64: archrandom: avoid trapping ID register read in
 __cpu_has_rng()
From: Aman Priyadarshi <amanp@apple.com>
In-reply-to: <anH9kVWFN_dqA0c1@willie-the-truck>
Date: Tue, 04 Aug 2026 16:50:35 +0100
Cc: catalin.marinas@arm.com, Jason@zx2c4.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Content-transfer-encoding: quoted-printable
Message-id: <2EEBC3D5-55E8-4E89-A0D3-E2816038BEC2@apple.com>
References: <20260720140615.99343-1-amanp@apple.com>
 <amy0dVzgY-uPTTtU@google.com> <97FF53B9-993A-4E73-9C6B-0DA514AD0778@apple.com>
 <anH9kVWFN_dqA0c1@willie-the-truck>
To: Will Deacon <will@kernel.org>
X-Mailer: Apple Mail (2.3892.100.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_085051_451895_AB6242D7 
X-CRM114-Status: GOOD (  30.28  )
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



> On 4 Aug 2026, at 15:56, Will Deacon <will@kernel.org> wrote:
>=20
> On Fri, Jul 31, 2026 at 06:26:44PM +0100, Aman Priyadarshi wrote:
>>> On 31 Jul 2026, at 15:43, Will Deacon <will@kernel.org> wrote:
>>> On Mon, Jul 20, 2026 at 03:06:15PM +0100, Aman Priyadarshi wrote:
>>>> diff --git a/arch/arm64/include/asm/archrandom.h =
b/arch/arm64/include/asm/archrandom.h
>>>> index 8babfbe31f95..8067e9a35641 100644
>>>> --- a/arch/arm64/include/asm/archrandom.h
>>>> +++ b/arch/arm64/include/asm/archrandom.h
>>>> @@ -61,8 +61,22 @@ static inline bool __arm64_rndrrs(unsigned long =
*v)
>>>>=20
>>>> static __always_inline bool __cpu_has_rng(void)
>>>> {
>>>> - if (unlikely(!system_capabilities_finalized() && !preemptible()))
>>>> - return this_cpu_has_cap(ARM64_HAS_RNG);
>>>> + if (unlikely(!system_capabilities_finalized() && !preemptible())) =
{
>>>> + /*
>>>> + * Until the ARM64_HAS_RNG alternative is patched we can't use
>>>> + * the static-branch form, so consult the feature register
>>>> + * directly. Don't use this_cpu_has_cap() here: it reads
>>>> + * ID_AA64ISAR0_EL1 from hardware on every call, under
>>>> + * virtualization each ID register read traps to the hypervisor
>>>> + * (HCR_EL2.TID3) -- producing a storm of vmexits during boot.
>>>> + * The sanitised value is cached in memory.
>>>> + */
>>>> + u64 isar0 =3D read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
>>>> +
>>>> + return cpuid_feature_extract_unsigned_field(isar0,
>>>> + ID_AA64ISAR0_EL1_RNDR_SHIFT) >=3D
>>>> + ID_AA64ISAR0_EL1_RNDR_IMP;
>>>> + }
>>>=20
>>> You can probably rewrite this a little more cleanly along the lines =
of
>>> the (not even compile-tested) diff below. I was about to do that, =
but
>>> then I got a bit confused by the whole thing. The preemptible() =
check is
>>> presumably not needed if we're accessing the in-memory feature =
registers
>>> rather than the per-CPU id registers, but then how do you handle =
races
>>> with concurrent updates to the "safe value" made by CPUs =
concurrently
>>> coming online?
>>=20
>> I kept preemptible() check for this exact reason: the updates made by =
CPUs
>> concurrently coming online will always take the downgrade path (a =
secondary
>> CPU can clear RNDR, never set it), and therefore by taking the =
non-preemptible
>> branch I can guarantee that the pinned CPU supports the said feature.
>> I agree, this assumes that a secondary CPU folds its own ID registers =
into sys_val
>> before it can ever be a randomness consumer, but looking at the code =
that seems
>> the case, please feel free to correct me.
>> Besides, in my opinion, it's hard to argue correctness of this code =
without
>> preemptible() check.
>=20
> My point is that this change introduces a data race on 'reg->sys_val' =
for
> the ID_AA64ISAR0_EL1 entry in the arm64_ftr_regs array.
>=20
> Will

Agreed, you're right. My reasoning was that existing =
read_sanitised_ftr_reg() callers
already race with sys_val updates during hotplug CPU bringup, so this =
wasn't a
new problem. But I agree it's not much of a defence.
It looks like an easy fix, though: mark the reader and the writer. What =
do you think
of the patch below? I'm happy to post it as a separate patch ahead of =
this fix once
you confirm it works for you.

- Aman Priyadarshi

--->8

diff --git a/arch/arm64/kernel/cpufeature.c =
b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120..e1c10a23da3c 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1235,18 +1235,20 @@ void __init init_cpu_features(struct =
cpuinfo_arm64 *info)
 static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
 {
        const struct arm64_ftr_bits *ftrp;
+       u64 sys_val =3D reg->sys_val;
=20
        for (ftrp =3D reg->ftr_bits; ftrp->width; ftrp++) {
-               s64 ftr_cur =3D arm64_ftr_value(ftrp, reg->sys_val);
+               s64 ftr_cur =3D arm64_ftr_value(ftrp, sys_val);
                s64 ftr_new =3D arm64_ftr_value(ftrp, new);
=20
                if (ftr_cur =3D=3D ftr_new)
                        continue;
                /* Find a safe value */
                ftr_new =3D arm64_ftr_safe_value(ftrp, ftr_new, =
ftr_cur);
-               reg->sys_val =3D arm64_ftr_set_value(ftrp, reg->sys_val, =
ftr_new);
+               sys_val =3D arm64_ftr_set_value(ftrp, sys_val, ftr_new);
        }
=20
+       WRITE_ONCE(reg->sys_val, sys_val);
 }
=20
 static int check_update_ftr_reg(u32 sys_id, int cpu, u64 val, u64 boot)
@@ -1526,7 +1528,8 @@ u64 read_sanitised_ftr_reg(u32 id)
=20
        if (!regp)
                return 0;
-       return regp->sys_val;
+
+       return READ_ONCE(regp->sys_val);
 }
 EXPORT_SYMBOL_GPL(read_sanitised_ftr_reg);


