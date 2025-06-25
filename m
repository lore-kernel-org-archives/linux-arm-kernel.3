Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B7AC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 01:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFw2kmBOCe8dAlOebCiebY1IUKv0rnJ+4n3KRhV6q3w=; b=wUoGnJC4jQqHxSg3UqWAtq0m2G
	jjLj70JrGZQBGyhOsQmg8jOMKqiiGuDIXqp2+aPkvH4GG0ZBAojlzyIuQwQdc6ekkaMFEFz/77qye
	c/bbhWkLz42ZJmUZ7x/ECVd8rym28tlkEUpKPwCmKdsBAkMmrc7Yj4++TEI078rnL1gyu4SiZQfbt
	nvHwFN7sXwdfW8P860TYTmWPQnr1nMuMJu1iUoKkr4/T7SRuzratQdiX+xD1+C9xl2czwAwf/rMLp
	sgvb80cuf9TDen6MnmSXtCLSAvDmb8SxTmo7nd556JRcfy6JoG4Cq2lxkwY33j47RTNehCCBYZvea
	ih39mbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEft-00000007Ee2-0VrI;
	Wed, 25 Jun 2025 01:11:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEdZ-00000007EOc-30ea;
	Wed, 25 Jun 2025 01:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C914360051;
	Wed, 25 Jun 2025 01:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5E3C4CEE3;
	Wed, 25 Jun 2025 01:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750813756;
	bh=ar+M7uOS6NGMBXnGsSfhmdY2/NIrFzzFwB2vQ2UdzzU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=si3Mv9bYY/8kBwTkVAcQqZoJK6oPCfQbERzoeHQNnnjouaaju9cDPj5M/XH+LGCGf
	 sutZ2TLPTDRMtEiUcTLAfcucjlB1tBOK027s1ZYe+qpQm8YtBXVVCggwf2H8yIixe+
	 IDVtaRLnE7OYk8omFmO1wVvMArdpG+qU6ghcCXqwDH3eSeR/zt8PJr47crwpodU4K/
	 +SdYth5GpIqN7Rkz05vHh/vtCMrcnD2wmTD+63kR8qXgeUEYggdfeNmyLdKPgxxZY0
	 Z7hF7LuReE6Xw0PlrdhJ4M022p1QhH6fci9WuRh8Uql2D6xK1hPUmyC7uoJ+Q8UvXd
	 gbu4rtou3gcJw==
Date: Tue, 24 Jun 2025 18:09:18 -0700
From: Kees Cook <kees@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tianyang Zhang <zhangtianyang@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, kasan-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, llvm@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_10/14=5D_loongarch=3A_Han?=
 =?US-ASCII?Q?dle_KCOV_=5F=5Finit_vs_inline_mismatches?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAhV-H5oHPG+etNawAmVwyDtg80iKUrAM_m3Vj57bBO0scHqvQ@mail.gmail.com>
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-10-kees@kernel.org> <CAAhV-H4WxAwXTYVFOnphgHN80-_6jt77YZ_rw-sOBoBjjiN-yQ@mail.gmail.com> <CAAhV-H5oHPG+etNawAmVwyDtg80iKUrAM_m3Vj57bBO0scHqvQ@mail.gmail.com>
Message-ID: <B5A11282-CB0E-46E0-A5D7-EF4D8BFC23B4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On June 24, 2025 5:31:12 AM PDT, Huacai Chen <chenhuacai@kernel=2Eorg> wro=
te:
>Hi, Kees,
>
>On Thu, Jun 19, 2025 at 4:55=E2=80=AFPM Huacai Chen <chenhuacai@kernel=2E=
org> wrote:
>>
>> Hi, Kees,
>>
>> On Fri, May 23, 2025 at 12:39=E2=80=AFPM Kees Cook <kees@kernel=2Eorg> =
wrote:
>> >
>> > When KCOV is enabled all functions get instrumented, unless
>> > the __no_sanitize_coverage attribute is used=2E To prepare for
>> > __no_sanitize_coverage being applied to __init functions, we have to
>> > handle differences in how GCC's inline optimizations get resolved=2E =
For
>> > loongarch this exposed several places where __init annotations were
>> > missing but ended up being "accidentally correct"=2E Fix these cases =
and
>> > force one function to be inline with __always_inline=2E
>> >
>> > Signed-off-by: Kees Cook <kees@kernel=2Eorg>
>> > ---
>> > Cc: Huacai Chen <chenhuacai@kernel=2Eorg>
>> > Cc: WANG Xuerui <kernel@xen0n=2Ename>
>> > Cc: Thomas Gleixner <tglx@linutronix=2Ede>
>> > Cc: Tianyang Zhang <zhangtianyang@loongson=2Ecn>
>> > Cc: Bibo Mao <maobibo@loongson=2Ecn>
>> > Cc: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> > Cc: <loongarch@lists=2Elinux=2Edev>
>> > ---
>> >  arch/loongarch/include/asm/smp=2Eh | 2 +-
>> >  arch/loongarch/kernel/time=2Ec     | 2 +-
>> >  arch/loongarch/mm/ioremap=2Ec      | 4 ++--
>> >  3 files changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/arch/loongarch/include/asm/smp=2Eh b/arch/loongarch/incl=
ude/asm/smp=2Eh
>> > index ad0bd234a0f1=2E=2E88e19d8a11f4 100644
>> > --- a/arch/loongarch/include/asm/smp=2Eh
>> > +++ b/arch/loongarch/include/asm/smp=2Eh
>> > @@ -39,7 +39,7 @@ int loongson_cpu_disable(void);
>> >  void loongson_cpu_die(unsigned int cpu);
>> >  #endif
>> >
>> > -static inline void plat_smp_setup(void)
>> > +static __always_inline void plat_smp_setup(void)
>> Similar to x86 and arm, I prefer to mark it as __init rather than
>> __always_inline=2E
>If you have no objections, I will apply this patch with the above modific=
ation=2E

That's fine by me; thank you! I didn't have a chance yet to verify that it=
 actually fixes the mismatches I saw, but if it looks good to you, yes plea=
se=2E :)

-Kees

>
>
>Huacai
>
>>
>> Huacai
>>
>> >  {
>> >         loongson_smp_setup();
>> >  }
>> > diff --git a/arch/loongarch/kernel/time=2Ec b/arch/loongarch/kernel/t=
ime=2Ec
>> > index bc75a3a69fc8=2E=2E367906b10f81 100644
>> > --- a/arch/loongarch/kernel/time=2Ec
>> > +++ b/arch/loongarch/kernel/time=2Ec
>> > @@ -102,7 +102,7 @@ static int constant_timer_next_event(unsigned lon=
g delta, struct clock_event_dev
>> >         return 0;
>> >  }
>> >
>> > -static unsigned long __init get_loops_per_jiffy(void)
>> > +static unsigned long get_loops_per_jiffy(void)
>> >  {
>> >         unsigned long lpj =3D (unsigned long)const_clock_freq;
>> >
>> > diff --git a/arch/loongarch/mm/ioremap=2Ec b/arch/loongarch/mm/iorema=
p=2Ec
>> > index 70ca73019811=2E=2Edf949a3d0f34 100644
>> > --- a/arch/loongarch/mm/ioremap=2Ec
>> > +++ b/arch/loongarch/mm/ioremap=2Ec
>> > @@ -16,12 +16,12 @@ void __init early_iounmap(void __iomem *addr, uns=
igned long size)
>> >
>> >  }
>> >
>> > -void *early_memremap_ro(resource_size_t phys_addr, unsigned long siz=
e)
>> > +void * __init early_memremap_ro(resource_size_t phys_addr, unsigned =
long size)
>> >  {
>> >         return early_memremap(phys_addr, size);
>> >  }
>> >
>> > -void *early_memremap_prot(resource_size_t phys_addr, unsigned long s=
ize,
>> > +void * __init early_memremap_prot(resource_size_t phys_addr, unsigne=
d long size,
>> >                     unsigned long prot_val)
>> >  {
>> >         return early_memremap(phys_addr, size);
>> > --
>> > 2=2E34=2E1
>> >

--=20
Kees Cook

