Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267B2D2F34B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QZm1CZeu8P4ksfxFy+d8iaWyvI0I3DKeA/oH7Yr3/E=; b=2C6ZJ7ukqUUoNQxVLE4e9R5EmM
	TlPXPjdsxMrXtophHdg7Y77lGkGIxDrggAaMtn4RkuT3GsQf1GlMbq2itb1ApeSDBb+zuAHQ0R9AY
	GV89buC0V0SYAAE7cGr13kOu5kfvfecA7seKSRpYcs44mr8mt5V0q80xuAwtR5euJ53lSRJuKLH4L
	KZZF11+RB2LuszrIuhh1KmO4nxC39ZT6N8HcUgHzxQ4p/jZrJSLpSyc/M/k30B2R3/HbmRScejutm
	RZ6H6n2h5I/rXqR2dQ5KNWWeUz5JQoCxfvCWiyMp6XqbtWIOCS+RQakPk0xS/F9w/n5ZJNVI9/sFQ
	Owyc0ZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiFw-00000007XA4-3bMr;
	Tue, 13 Jan 2026 17:32:36 +0000
Received: from mail-244123.protonmail.ch ([109.224.244.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiFu-00000007X9f-1u6k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 17:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768325549; x=1768584749;
	bh=7QZm1CZeu8P4ksfxFy+d8iaWyvI0I3DKeA/oH7Yr3/E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gdXMnEdZmwn+tzH1Y7xVv5t9USdU9qSUiHNLP9uBYfdXrbzyAlzYJYd3+fdOIl8FD
	 4B1cwjyzCxH099YPM8pclhQdJIQFLPHDmdGXpFFHioTnZOh0Vhr5FMwFhvIPEgRIBg
	 imCV25e/DmTbnG9EQkSon6a6pbHZT2E4APl5n9XXqw4a2efie1W1vRw1zvk5GoN2BB
	 CF2NEfpy7D5somELQ6RBkORkPQVKPmlnpRyAdBSR0ORMaXUIdVdaUza5gnyA1Sz/Nl
	 g+SAZB5ORa63g+Togs39Um3ZPXCS0CiWYkzSCzRD7PN/QZwqJO9kQ2EKunsZqH6L8D
	 jLRIbJ2fappbQ==
Date: Tue, 13 Jan 2026 17:32:23 +0000
To: Andrey Konovalov <andreyknvl@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Samuel Holland <samuel.holland@sifive.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v8 02/14] kasan: arm64: x86: Make special tags arch specific
Message-ID: <aWZ_aRFfWNWiqzik@wieczorr-mobl1.localdomain>
In-Reply-To: <CA+fCnZfQmhSyF9vh3RzreY7zrQ4GbQOp5NbA0bXLHUMG6p28QQ@mail.gmail.com>
References: <cover.1768233085.git.m.wieczorretman@pm.me> <be136bf8d1a6ae9ef98686c3ba0b6a4e2ea2e780.1768233085.git.m.wieczorretman@pm.me> <CA+fCnZfQmhSyF9vh3RzreY7zrQ4GbQOp5NbA0bXLHUMG6p28QQ@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 023a5d308556f78925918902544da2df5131a718
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_093234_657536_7E3D76D0 
X-CRM114-Status: GOOD (  14.00  )
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

On 2026-01-13 at 02:21:07 +0100, Andrey Konovalov wrote:
>On Mon, Jan 12, 2026 at 6:27=E2=80=AFPM Maciej Wieczor-Retman
><m.wieczorretman@pm.me> wrote:
>>
>> From: Samuel Holland <samuel.holland@sifive.com>
>> diff --git a/arch/x86/include/asm/kasan-tags.h b/arch/x86/include/asm/ka=
san-tags.h
>> new file mode 100644
>> index 000000000000..68ba385bc75c
>> --- /dev/null
>> +++ b/arch/x86/include/asm/kasan-tags.h
>> @@ -0,0 +1,9 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __ASM_KASAN_TAGS_H
>> +#define __ASM_KASAN_TAGS_H
>> +
>> +#define KASAN_TAG_KERNEL       0xF /* native kernel pointers tag */
>
>One thing that stood out to me here was that for x86, KASAN_TAG_KERNEL
>is defined as a 4-bit value (0xF). Which makes sense, as
>KASAN_TAG_WIDTH =3D=3D 4.
>
>But for arm64, KASAN_TAG_KERNEL and others are defined as 8-bit values
>(0xFF, etc.), even though for HW_TAGS, KASAN_TAG_WIDTH is also =3D=3D 4
>and only the lower 4 bits of these values define the tags.
>
>This happens to work out: for HW_TAGS, __tag_set resets the top byte
>but then uses the given value as is, so the higher 4 bits gets set to
>0xF and the lower set to the tag. And for saving/restoring the tag in
>page->flags, everything also works, as we only store the meaningful
>lower 4 bits in flags, and restore the higher 0xF when doing ^ 0xFF.
>
>But this is not related to this series: I think the way x86 defines
>KASAN_TAG_KERNEL to be 0xF makes sense; we might just need to clean up
>the arm64 implementation at some point.
>

I suppose while there is only one such mode that stands out from the other =
two
there is little hint as to what should be generalized. As you said so far t=
his
scheme we have works - altough it is somewhat convoluted.

One thing I was thinking of was cleaning up all the #ifdefs for different m=
odes
into a more ordered structure. I think there are ~24 ifdefs in mm/kasan.h a=
nd
include/linux/kasan.h and many of them could potentially be merged.

...
>
>Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thanks :)

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman


