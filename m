Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C9FD4899D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUy6Z0nl3UN06uLRlgqbdTzfRq3/0KilXmceKHyT+FA=; b=UDW8RZRcBfqgCio/PCESw5DxAD
	Fd+Qoh2cB78ac1ABoPsLn7A2bXYxfLyQKBrX/49XATYzj719B5JUvx2l8ikO5YqzgTsd8/N7Siheg
	GHOwp72TbKWWsFYtijE54quNyf2xQ2Ka7HqtVSnwKxll3Fzh3Nzk0EcAMnvhLLX6OWJfmxUYDKNkw
	XrsHLYMyYXy6dXGxCUhWmx5uAEDaEgrO2VUlF67xsirhZtd5yylxgvnwTT27Ko6fICiCxniTVrmBh
	m5daDaN6O0Ndis4EmRDtQJvWu359RUgA3eqVAXYTz81mnER2Suhpr1l35KVSRkf6MN3cgLVojaejb
	6yvHgFww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjc9-0000000E9cm-2yBV;
	Fri, 16 Jan 2026 13:11:45 +0000
Received: from mail-43102.protonmail.ch ([185.70.43.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjc7-0000000E9ah-3YCT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 13:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768569098; x=1768828298;
	bh=VUy6Z0nl3UN06uLRlgqbdTzfRq3/0KilXmceKHyT+FA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NsW4vNWI+sy+jtCwGEepBnQnhkRgbVqOJ8bQNyN7XOu/Bmiv5eUFHRTgDUqIkkZCL
	 3+CCEPXQsQCOIr68mCMChffW/v/xa4NXARE65ARAC1tUdbbVCR0YM/VVD87fT5Hnf4
	 g7uTiInwCUmOnfHiNaRH18bYdqK3XZUA8thcmHVBaNFZ6vrtQYXmnYyJGmjtUTL/eI
	 FeJuldGwl9Kv2xapCx8JUTWPf6JHyDRUjGnR9+bb0IaoSyvCU0fdqXQw8ZvrndtD8c
	 iztvGbaWNit1drtUSc0hgFnX7xkOB7r9nmg0mEFIctA/zk1M/dLih3b+MPcDkmHT6E
	 fi3T+X+l0xZ7Q==
Date: Fri, 16 Jan 2026 13:11:32 +0000
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Samuel Holland <samuel.holland@sifive.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v8 01/14] kasan: sw_tags: Use arithmetic shift for shadow computation
Message-ID: <aWo31aytvelldfiE@wieczorr-mobl1.localdomain>
In-Reply-To: <2592f303-05f5-4646-b59f-38cb7549834e@gmail.com>
References: <cover.1768233085.git.m.wieczorretman@pm.me> <4f31939d55d886f21c91272398fe43a32ea36b3f.1768233085.git.m.wieczorretman@pm.me> <2592f303-05f5-4646-b59f-38cb7549834e@gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 3ed341666d06b561ea7c217cda5b5d4311dd5d20
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_051144_034184_93092F24 
X-CRM114-Status: GOOD (  14.45  )
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

Thanks for looking at the patches :)

On 2026-01-15 at 23:42:02 +0100, Andrey Ryabinin wrote:
>
>
>On 1/12/26 6:27 PM, Maciej Wieczor-Retman wrote:
> =20
>> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
>> index 62c01b4527eb..b5beb1b10bd2 100644
>> --- a/mm/kasan/report.c
>> +++ b/mm/kasan/report.c
>> @@ -642,11 +642,39 @@ void kasan_non_canonical_hook(unsigned long addr)
>>  =09const char *bug_type;
>> =20
>>  =09/*
>> -=09 * All addresses that came as a result of the memory-to-shadow mappi=
ng
>> -=09 * (even for bogus pointers) must be >=3D KASAN_SHADOW_OFFSET.
>> +=09 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right s=
hift
>> +=09 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (o=
n
>> +=09 * both x86 and arm64). Thus, the possible shadow addresses (even fo=
r
>> +=09 * bogus pointers) belong to a single contiguous region that is the
>> +=09 * result of kasan_mem_to_shadow() applied to the whole address spac=
e.
>>  =09 */
>> -=09if (addr < KASAN_SHADOW_OFFSET)
>> -=09=09return;
>> +=09if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
>> +=09=09if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
>> +=09=09    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
>> +=09=09=09return;
>> +=09}
>> +
>> +=09/*
>> +=09 * For Software Tag-Based KASAN, kasan_mem_to_shadow() uses the
>> +=09 * arithmetic shift. Normally, this would make checking for a possib=
le
>> +=09 * shadow address complicated, as the shadow address computation
>> +=09 * operation would overflow only for some memory addresses. However,=
 due
>> +=09 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
>> +=09 * kasan_mem_to_shadow() only operates on pointers with the tag rese=
t,
>> +=09 * the overflow always happens.
>> +=09 *
>> +=09 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, =
the
>> +=09 * possible shadow addresses belong to a region that is the result o=
f
>> +=09 * kasan_mem_to_shadow() applied to the memory range
>> +=09 * [0xFF000000000000, 0xFFFFFFFFFFFFFFFF]. Despite the overflow, the
>                  ^ Missing couple 00 here
>
>> +=09 * resulting possible shadow region is contiguous, as the overflow
>> +=09 * happens for both 0xFF000000000000 and 0xFFFFFFFFFFFFFFFF.
>                                  ^ same as above

Hah, right, thank you!

>
>> +=09 */
>> +=09if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_ARM64)) {
>> +=09=09if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0xFFULL <<=
 56)) ||
>
>This will not work for inline mode because compiler uses logical shift.
>Consider NULL-ptr derefernce. Compiler will calculate shadow address for 0=
 as:
>      (((0x0 | 0xffULL) << 56) >> 4)+0xffff800000000000ULL =3D 0x0fef8000.=
...0
>Which is less than ((0xFF00...00LL) >> 4) +  0xffff800000000000ULL =3D 0xf=
fff800...0
>So we will bail out here.
>Perhaps we could do addr |=3D 0xFFLL to fix this

I suppose it should work; tried it in a python script by shoving various
addresses into this check. Pushing addresses through a logical shift
memory_to_shadow normally would return early as you noticed, and after 'add=
r |=3D
0xFFLL' it seems to work as expected. And I didn't really catch any incorre=
ct
address slipping by this scheme either. Thanks, I'll correct it.

>
>> +=09=09    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
>> +=09=09=09return;
>> +=09}
>> =20
>>  =09orig_addr =3D (unsigned long)kasan_shadow_to_mem((void *)addr);
>> =20

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman


