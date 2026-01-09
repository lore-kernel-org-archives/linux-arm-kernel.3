Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA824D1A627
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 13:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3NjXkb3MtCkcFp1gZdZbK2WKHYzWPAkjB9Zixe5dUM=; b=TCaJ3aRDmVeAQzLaxxnd2ivTpM
	bRofAyH7xsQ6rO6pzN2UE5abI2+7w0AYvLHUgPkoZKXiY7IgDLccxIg4b7LKGl3yqJdsmjRnqXRS4
	zITr4K9T+60ra8TWweIjT1VZUdmd2afD9ysGhdb3fqUEUH4VH/Sg1q5vHd/V72Dyzxt7tgBS6kvfQ
	VKgnMv8dai/ntqiSdz1GQTNPygmqpfAj5aI7U9y+vr/27LS54t5iYw3aVT3Akd1ZAZojRvhpnlAJJ
	ntBzDnRuE12P9YjZJLH8gmbSvngD8LubQYtAWn1QmvC/d1OtbmHzUJL0011IB+SiXZIMdfazXyoF0
	9X58SasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCgl-00000002MT8-0ZZH;
	Fri, 09 Jan 2026 13:38:03 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCgi-00000002MSe-1VEW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 13:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1767965875; x=1768225075;
	bh=j3NjXkb3MtCkcFp1gZdZbK2WKHYzWPAkjB9Zixe5dUM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FJlY+lwDEWrue3SxdKLkdkB5DgiHZE10OAmfbtbcwa0yXF8Gs2rPlo2EwsJNMBsw/
	 DSDjj3il1VqHvr6UL38tEM9mqmyyoin9Az51E6NrV3DrbZvRG4ucXEOQ9gHS9IhPHJ
	 pIETU6HZbmW/n2hQyKX0kQdqA3brjZzZwOY050bokoLyUPdliNpWip/hoLYy9rHpgV
	 dxtSfklbmxvCVSMfujG6ICA2t7K626MZ491sP+4F5iEbVKsaJsudTqRyZM4qfp7dAF
	 K0gVFbG5hB7LOnnc2Czvk9WFEP6gunL1dDOi/2IOYZoluUKDoly8XKz5Ot6ebZONND
	 e1Mf8H90vu0JA==
Date: Fri, 09 Jan 2026 13:37:49 +0000
To: Will Deacon <will@kernel.org>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Samuel Holland <samuel.holland@sifive.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v7 02/15] kasan: arm64: x86: Make special tags arch specific
Message-ID: <aWEDDjQms8zbMgsB@wieczorr-mobl1.localdomain>
In-Reply-To: <aV_v18YWCHXMETVK@willie-the-truck>
References: <cover.1765386422.git.m.wieczorretman@pm.me> <0db7ec3b1a813b4d9e3aa8648b3c212166a248b7.1765386422.git.m.wieczorretman@pm.me> <aV_v18YWCHXMETVK@willie-the-truck>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 0570fdf76a1b4710800e4cf7ba907d1afc4ce5d7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_053800_539355_2F371B5E 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

Hi, and thanks for looking at the patches!

On 2026-01-08 at 17:56:39 +0000, Will Deacon wrote:
>On Wed, Dec 10, 2025 at 05:28:43PM +0000, Maciej Wieczor-Retman wrote:
>> From: Samuel Holland <samuel.holland@sifive.com>
...
>> +#ifdef CONFIG_KASAN_HW_TAGS
>> +#define KASAN_TAG_MIN=09=090xF0 /* minimum value for random tags */
>> +#define KASAN_TAG_WIDTH=09=094
>> +#else
>> +#define KASAN_TAG_WIDTH=09=098
>> +#endif
>
>Shouldn't this be 0 when KASAN is not in use at all?
>
>Will

This file (as well as the x86 version) gets included in
include/linux/kasan-tags.h:

=09#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
=09#include <asm/kasan-tags.h>
=09#endif

=09#ifndef KASAN_TAG_WIDTH
=09#define KASAN_TAG_WIDTH=09=090
=09#endif

So the 8 or 4 value is only assigned if SW_TAGS or HW_TAGS are enabled.
Otherwise it's set to zero.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman


