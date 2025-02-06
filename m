Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7C6C02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H26hCa0BkZ3dMHTQ+5j05dxgsk8Xe5RdYR/UT/6FR1s=; b=bm+1Dwhmlp7AreycdR9w7twHDo
	VihL64gvR4qQR+Q81LLQAQ9ab6hMId0Wuok3q/8jjsL7b5UpWWlkjbZnaaDSPGG5GkfOjRAil22WL
	2osZNpXpa5s0SpSnM7chCrhT9gidJ4DY3PZVXvIgPGavjjn1tu3pIhsN3v2QWNp+V5/xdRB3whgvN
	8r5paZRKip9Mybmhf/ThSYZWoAKT2fnYxbbaQBOH+rqrbB8iUz5EDgJKaTef+iOshCkbqWy64d9dV
	peMiFaCzvUDGQ/9SirBwr025oi0cIIOsMy9meImIXW5tKVkI6eptFsCSAhwVlM/3pqRYKuKvNFZfm
	NskYFf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7Ea-00000007K0v-1MuF;
	Thu, 06 Feb 2025 19:08:20 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg78G-00000007InB-0cJf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 19:01:49 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401be44b58so1422856e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738868506; x=1739473306; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H26hCa0BkZ3dMHTQ+5j05dxgsk8Xe5RdYR/UT/6FR1s=;
        b=x5ZlkXnFNjlgFGS2Ex5QWTCHXa7B/CFcEdgUJM2ciybTNtkv3OsZgNY1XwCGKNz2UM
         /uc8ld9VfW8xVuVUooO55H+kO4WRwAubZ4S4vJe71IPoOqLXYAsLsyf+DtQgWFKTrXK0
         NJygyrpaHj+GOitsKpm+Idn/XzVKOKW/ewWd+jXa/kgDisoE2PFmj4s5pE+s7aEs7/FJ
         zbifbH08UP9k5RJP7T5fqQ4qOXQgSIZaOvF0SP2aLZIhztBhdXvA502LdfJ9VwyZat6+
         yx0JM4z2qgLf8MRp29yxPIxnZVkZZZl9009HjlSPDbHTsJB1drKSJ6vDOxbLteht1DBy
         Eydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738868506; x=1739473306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H26hCa0BkZ3dMHTQ+5j05dxgsk8Xe5RdYR/UT/6FR1s=;
        b=MNRtFQ5acez955QjMhNxpDVxo8CVWGIbqZQIbSIfltp2mp7JzaJ1Mpcf5gN9h2jDqX
         +/5zQ0tI4JDhO9oueSfj12onRXnwMdMjkjzJuMb6BaifZb6Jc+ml6T8hOQ/HGDyZgUSD
         dfxobqEYvMoIhZIRhrmw3vkcXfIO5ZXoIia1GBeLKiOxxXuI3FKLGuyV4CvW8HXQEYeS
         e+t8xLGiKE3/Nvoj57cUGqqWWm9STpBgqg1ZzFmAhEK3Tkx1crX52bTcvzk5NfQAtFw2
         cutJ1e/wcDN4C87bLqoDaN52uglrNRA8m1y+c8+QnRG10kIfNNf/DQfYUqXb37uK3yL9
         7dgw==
X-Forwarded-Encrypted: i=1; AJvYcCW4Be0e2INLFn6jNeswnkt4CfEua5LSuSVodKOgA7lx6TJ3SCBdj1xjAM94kCCbXathvlaIgpeRqXsYLn8oMWi5@lists.infradead.org
X-Gm-Message-State: AOJu0YyW9XriCZWoShiWstDQb1r5oaf9G1uoQeul52fHdwgv+j57OMvV
	TRQwwvzq6spvXfJlGDzM9gXLAfMbO6MEDZg5V9x7rNzPCb0+M9VI35y3lVW2O5ieW3If+qzljJs
	dbN7IEFi0xJs0ZlVNpiri8rgttbAj3id1byvHYA==
X-Gm-Gg: ASbGncsA5iXHpD98nf+EtvsueTy4pMATs3hw6I3OWBJVy1IUQJ28aA1wVpzQMbS/Jqz
	oi+pOmHFLmmdJU+9V2zpuFfMIJj9MoMGZF3l4EsUfITXLqpbmXukEN+PlppzHkL1laGb/Drg=
X-Google-Smtp-Source: AGHT+IGYbTW64WX7v4eRIud9aI7sO+r6eN6uxSXvFM2flvdaMCaTnXZkw1PV8dpsvo+PKiCDP3tZfZA6qctV7ZLyAak=
X-Received: by 2002:a2e:a10c:0:b0:302:3de5:b039 with SMTP id
 38308e7fff4ca-307e57bc6b9mr333711fa.8.1738868506188; Thu, 06 Feb 2025
 11:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20250203101839.1223008-1-kevin.brodsky@arm.com> <20250203101839.1223008-9-kevin.brodsky@arm.com>
In-Reply-To: <20250203101839.1223008-9-kevin.brodsky@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 20:01:34 +0100
X-Gm-Features: AWEUYZkf3utqCGGAYFw3Wd0K9HPUGk1pvzmcRu62yuHXXkM5758Qny3DAHNgUk4
Message-ID: <CACRpkdZ_eGsfZh2vkG8dtSyZDbStMfDUuj7s7TQ4FcDwThJVkg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 08/15] mm: Introduce kernel_pgtables_set_pkey()
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
	Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Pierre Langlois <pierre.langlois@arm.com>, 
	Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_110148_197722_B319AC7E 
X-CRM114-Status: GOOD (  12.23  )
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

Hi Kevin,

thanks for your patch!

On Mon, Feb 3, 2025 at 11:20=E2=80=AFAM Kevin Brodsky <kevin.brodsky@arm.co=
m> wrote:

> kernel_pgtables_set_pkey() allows setting the pkey of all page table
> pages in swapper_pg_dir, recursively. This will be needed by
> kpkeys_hardened_pgtables, as it relies on all PTPs being mapped with
> a non-default pkey. Those initial kernel page tables cannot
> practically be assigned a non-default pkey right when they are
> allocated, so mutating them during (early) boot is required.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

(...)

> +static int set_page_pkey(void *p, int pkey)
> +static int set_pkey_pte(pmd_t *pmd, int pkey)
> +static int set_pkey_pmd(pud_t *pud, int pkey)
> +static int set_pkey_pud(p4d_t *p4d, int pkey)
> +static int set_pkey_p4d(pgd_t *pgd, int pkey)
> +int kernel_pgtables_set_pkey(int pkey)

Aren't these all discardable after boot, so the whole set should
be tagged with __init?

Other than that it LGTM.

Yours,
Linus Walleij

