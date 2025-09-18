Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF76FCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 05:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/FjkSkLDSAX/k9/Gbj65Yvrj1MFYxv5iP6Le03/bMs=; b=k6FuTM9FK9i1pon3cajEngxgU+
	978UuPrtDsfbQG+L3IaB62HejiDllFaHW1qZ2vgFACLiZnYi5TsOgILevBatB2eeVdNmYnnlWbAXx
	Lk5zJY8Cl0NHhaiUexZJiZToZp4/4G9PTLAWW5rcCJxynTBQ9e+8+AecDWwzrJ3e95dvnPFbbOFT/
	emUpEFDjOYVRi1gzOeD72nqr6hinGnm3yLAH+M2dQnkyt3kRU+TVCQep56bhtBCgK9GvTGDA64Y6z
	KpsAEYG40G9/F3LTze097l04lOx3bVywJD8AoXD2CeX/lZdvzu1SbxNI7Pjx6x+SxrwlIbuiNmOTg
	6lltAxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz6kY-0000000GFxu-2JqD;
	Thu, 18 Sep 2025 05:00:06 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz6kV-0000000GFx0-0VCv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 05:00:05 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758171599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/FjkSkLDSAX/k9/Gbj65Yvrj1MFYxv5iP6Le03/bMs=;
	b=ln/LCSps8zLes3RmwkHzk3oLNtxgjosb7VfkXI2BR81smuUi/YNKFfLgMSO+cU1tjls5cT
	G3RxjUzqC6vWEtfh25Syvy4Er+aiyCBV5LUydHP+2wf14DRzb+s7Av/LecWkaJP8PcrZug
	BGCFC5hDBozOPrQETibLsCKxaT/oUKE=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] PMCR_EL0.N is RAZ/WI. At least a build failes in Ubuntu
 22.04 LTS. Remove the set function.
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
In-Reply-To: <86ms6s2a2e.wl-maz@kernel.org>
Date: Thu, 18 Sep 2025 13:59:36 +0900
Cc: Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>,
 K Poulose Suzuki <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Shuah Khan <shuah@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev,
 kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Itaru Kitayama <itaru.kitayama@fujitsu.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C133488-95DD-4B1E-98C9-A9B13B6AF8F2@linux.dev>
References: <867by4c4v1.wl-maz@kernel.org>
 <3FEB4D87-EEAF-4A21-BCBC-291A4A7C2230@gmail.com>
 <86348rdg5o.wl-maz@kernel.org>
 <0524084A-9E82-408A-9F22-369ED25E42E9@linux.dev>
 <86ms6s2a2e.wl-maz@kernel.org>
To: Marc Zyngier <maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_220003_743188_FBCCACE8 
X-CRM114-Status: GOOD (  16.61  )
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



> On Sep 18, 2025, at 3:44, Marc Zyngier <maz@kernel.org> wrote:
>=20
> On Mon, 15 Sep 2025 22:31:31 +0100,
> Itaru Kitayama <itaru.kitayama@linux.dev> wrote:
>>=20
>>=20
>>=20
>>> On Sep 12, 2025, at 21:11, Marc Zyngier <maz@kernel.org> wrote:
>>>=20
>>> On Fri, 12 Sep 2025 12:33:39 +0100,
>>> Itaru Kitayama <itaru.kitayama@gmail.com> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>>> On Sep 12, 2025, at 20:01, Marc Zyngier <maz@kernel.org> wrote:
>>>>>=20
>>>>> =EF=BB=BFOn Fri, 12 Sep 2025 09:27:40 +0100,
>>>>> Itaru Kitayama <itaru.kitayama@linux.dev> wrote:
>>>>>>=20
>>>>>> Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
>>>>>=20
>>>>> This isn't an acceptable commit message.
>>>>>=20
>>>>>> ---
>>>>>> Seen a build failure with old Ubuntu 22.04 LTS, while the latest =
release
>>>>>> has no build issue, a write to the bit fields is RAZ/WI, remove =
the
>>>>>> function.
>>>>>> ---
>>>>>> tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 6 =
------
>>>>>> 1 file changed, 6 deletions(-)
>>>>>>=20
>>>>>> diff --git =
a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c =
b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>>>>>> index =
f16b3b27e32ed7ca57481f27d689d47783aa0345..56214a4430be90b3e1d840f2719b22dd=
44f0b49b 100644
>>>>>> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>>>>>> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>>>>>> @@ -45,11 +45,6 @@ static uint64_t get_pmcr_n(uint64_t pmcr)
>>>>>>  return FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
>>>>>> }
>>>>>>=20
>>>>>> -static void set_pmcr_n(uint64_t *pmcr, uint64_t pmcr_n)
>>>>>> -{
>>>>>> -    u64p_replace_bits((__u64 *) pmcr, pmcr_n, ARMV8_PMU_PMCR_N);
>>>>>> -}
>>>>>> -
>>>>>> static uint64_t get_counters_mask(uint64_t n)
>>>>>> {
>>>>>>  uint64_t mask =3D BIT(ARMV8_PMU_CYCLE_IDX);
>>>>>> @@ -490,7 +485,6 @@ static void =
test_create_vpmu_vm_with_pmcr_n(uint64_t pmcr_n, bool expect_fail)
>>>>>>   * Setting a larger value of PMCR.N should not modify the field, =
and
>>>>>>   * return a success.
>>>>>>   */
>>>>>> -    set_pmcr_n(&pmcr, pmcr_n);
>>>>>>  vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0), pmcr);
>>>>>>  pmcr =3D vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0));
>>>>>>=20
>>>>>>=20
>>>>>=20
>>>>> So what are you fixing here? A build failure? A semantic defect?
>>>>> Something else? What makes this a valid change?
>>>>>=20
>>>>> Frankly, I have no idea.
>>>>>=20
>>>>> But KVM definitely allows PMCR_EL0.N to be written from userspace, =
and
>>>>> that's not going to change.
>>>>>=20
>>>>=20
>>>> Then I=E2=80=99ll drop this patch.
>>>=20
>>> I'm not asking you to drop it, I'm asking you to explain. If you =
found
>>> a problem, let's discuss it and fix it. But as it stands, you're not
>>> giving me much to go on.
>>>=20
>>=20
>> You are right, while the bit fields are write ignored, to be
>> consistent with the handling of other bit fields of the register,
>> I=E2=80=99m fully convinced that checking the write operation in the
>> vpmu_counter_access.c file should be kept.
>=20
> The bit field is *not* ignored when written from userspace. That's how
> we configure the PMU if the guest runs at EL1.
>=20
>> The build error I=E2=80=99ve seen with Ubuntu 22.04 LTS is below:
>=20
> [snip]
>=20
> Can you please detail what compiler version this is? I'm unlikely to
> install an ancient version of Ubuntu, but I can pick the corresponding
> compiler version.
>=20

Sure, here it is:

[itaru@vm4 ~]$ apt-cache show gcc
Package: gcc
Architecture: arm64
Version: 4:11.2.0-1ubuntu1
Priority: optional
Section: devel
Source: gcc-defaults (1.193ubuntu1)
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian GCC Maintainers =
<debian-gcc@lists.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 50
Provides: c-compiler, gcc-aarch64-linux-gnu (=3D 4:11.2.0-1ubuntu1)
Depends: cpp (=3D 4:11.2.0-1ubuntu1), gcc-11 (>=3D 11.2.0-1~)
Recommends: libc6-dev | libc-dev
Suggests: gcc-multilib, make, manpages-dev, autoconf, automake, libtool, =
flex, bison, gdb, gcc-doc
Conflicts: gcc-doc (<< 1:2.95.3)
Filename: pool/main/g/gcc-defaults/gcc_11.2.0-1ubuntu1_arm64.deb
Size: 5128
MD5sum: 2ec2c9fcec3deb45052f307f85f37f7f
SHA1: 19491fe4fb89a6cbd389f573bf3abf46e841f3d6
SHA256: 426deed543cc32f388ad8336354e312fb76a47450194d2d775d855ad5878f82e
SHA512: =
c7e16c35037b0987458bf51a341045cdc1ac8da5bada4eb1c43922a83c5e18203beca8df99=
37b95de6c4185605f6e9054c92858d2842de0f6859cd21c0b33f01
Description-en: GNU C compiler
 This is the GNU C compiler, a fairly portable optimizing compiler for =
C.
 .
 This is a dependency package providing the default GNU C compiler.
Description-md5: c7efd71c7c651a9ac8b2adf36b137790
Task: ubuntustudio-video, ubuntustudio-publishing, ubuntu-mate-core, =
ubuntu-mate-desktop
Build-Essential: yes

Thanks,
Itaru.

> M.
>=20
> --=20
> Without deviation from the norm, progress is not possible.



