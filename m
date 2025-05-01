Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8589C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4oEmD5pkFXHibsXA2WC273fo0mn5jrWwyr6sBq7SDo=; b=Rb7A2sn4npi3niatsWD11CZSOb
	mAi2XZdsw2Ndx59nEdiQp0jg5CcoTh1EfRW7wfDM1odhmJaGrJyMsIIj3drIXjcC7CFy0X5qGwyQ9
	koXXbCMCFEz5oW/Su4m2l0xRnYMA9CWzxjCB8N2gBSOPYqbbW9uh9moW18W136dG1wPuKvSsDiTF7
	VAnUFmm0LOMSpG2Utvez7djjScUuqSpH7d7UffO+SuHYgyVL4RQAMLN15VcIAHQreRZbDeWBKbVYF
	QWpEW3qBzVuTC6SJ9neE8eeSV3WmyqMcS+AfJErp8QCkVW8R7eptMM8XG/8gxxcDOSUGFXj1W/LXA
	KKzKIQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYZn-0000000GML4-1G2Y;
	Thu, 01 May 2025 18:24:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYXt-0000000GMBO-02NG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 18:22:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2240aad70f2so27055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 11:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746123723; x=1746728523; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4oEmD5pkFXHibsXA2WC273fo0mn5jrWwyr6sBq7SDo=;
        b=vqxu5IpYUek5xebF4vGzTOibyMdZ8EWfbVPrKbp4dehDcC5js9sJUQwEnF/fidqND2
         O0SOANN1zq6mss/KEfbf6tkQPj7MkBtCl2iGrhW9R1vPkdqVI+uv4jLKrLb8DCUQoGMD
         HRNRXzCu9PHOwyJJXB75oUwe7+kM3lrTGe7NBBwPWa4qJy9NHVr4A5vJrluKr86MhsZD
         JZh4MNKErHdF5LJ/KBqF4/2QrYAwLwG81g+8HtraVOIx4SWttxJoPeBGU20j0PFLnkG3
         t7Jhnu25yQ0sFuBmNxYdoEoHCtQ02bLrWPaLZBTAZ3phjL4FF4IPKj2sxj1oTjcHwBqM
         m4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123723; x=1746728523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4oEmD5pkFXHibsXA2WC273fo0mn5jrWwyr6sBq7SDo=;
        b=LXuoeMFIfbgY7TMJI6a6yjfU2+jBrKjzevSknrWDSrlL5p/a931fjaMrU9MWrKeK4H
         WIqGz8zMEk0MNyspPO8StNTfvJT1FQtC3bmUJKhJQr/H9USe/HQYld+S9s1lZAdKXJA2
         pB9G/QXP7NuqrR+GjdrzOH2KAZ+x0kQr5dGwBPi2B2zLstsiFQATcoBg3DSyKfRlNrhG
         hU6ozp4vIxQnGnT1J0Z5YV5ugQdDdkleGqXinTjQZn9QqV1I386KJlfuZ6qUSCteIhtx
         CucNnCMhxhJ6C2EfSShpoVv2htqafjs2LVG2wxnNIWyjHMNB+CjY0Iqodi/iYytuWstT
         AQTw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ4Ev8ErSugBAkKEZLbIUZnm294qUTXy6niTuQ7R54qkSQNfPVz/3nO7Aq5mQ742r/q+bMvKb4qfFATGMvmQKJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxU6CRqobGje/h4/XVwaRvANG4S0BDpvbH3GvwJ/D+5MUAMMd55
	vP6w7xZy7XQm9Qd4wsDMNmc6mRE8Obi/HjNv+YWNJswcLgAnjJEq8iRk3QUsOq2/uko0he16tjn
	uNivdgMy6s4iwaJocJaRmLLAwNreAGBGvk6RS
X-Gm-Gg: ASbGncu4xnYGk3xWpvDcfkoM+B+QOG/GIodQ7TCRAzFw6EAl2YDqfuPLRScSWdn1qjy
	SgTwrGSGk+C5tg7hz7TkkjaxFhViHGCHRP1DIzu0+Z0bxp1ATpgQl639TxC8mObnqaWsJ5kp1QJ
	Roi3HI+QncKV+I6a6mBrZZI3ZTYpk3s1COsmN6gt6oJUR8taN1wq0=
X-Google-Smtp-Source: AGHT+IGw01QLKei1a1tqjRO1f1fstLHCdEGbwq/8Z+18IvDEQWgBjR9t4vbhB4thwSTGW5yezeLPGhT4pQ+nxyomE04=
X-Received: by 2002:a17:902:e750:b0:21f:3e29:9cd1 with SMTP id
 d9443c01a7336-22e0784ed21mr2880445ad.1.1746123723117; Thu, 01 May 2025
 11:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <3230A277-7D1D-4329-B871-5E43967E6A00@nvidia.com>
 <CAJDx_rgodAQXVrLjZBBGCqBkT82Oem1ACj7dk=G3qKMnyu_AZw@mail.gmail.com>
In-Reply-To: <CAJDx_rgodAQXVrLjZBBGCqBkT82Oem1ACj7dk=G3qKMnyu_AZw@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 1 May 2025 11:21:51 -0700
X-Gm-Features: ATxdqUELKjWvsXtfVkBZFM3lN1s1zGGvb5Be96Hj7WDDLkjDj34v7xW40EM0e3Y
Message-ID: <CAC_TJvf36Qr3r_LJ0Knf7WtozUZ_YVxLxF7bEAPC+87J-QEd6Q@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Juan Yescas <jyescas@google.com>
Cc: Zi Yan <ziy@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, tjmercier@google.com, isaacmanjarres@google.com, 
	surenb@google.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_112205_048778_D7D103CA 
X-CRM114-Status: GOOD (  37.45  )
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

On Thu, May 1, 2025 at 10:11=E2=80=AFAM Juan Yescas <jyescas@google.com> wr=
ote:
>
> On Thu, May 1, 2025 at 7:24=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
> >
> > On 1 May 2025, at 1:25, Juan Yescas wrote:
> >
> > > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerabl=
y,
> > > and this causes the CMA reservations to be larger than necessary.
> > > This means that system will have less available MIGRATE_UNMOVABLE and
> > > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to t=
hem.
> > >
> > > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> > >
> > > For example, the CMA alignment requirement when:
> > >
> > > - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
> > > - CONFIG_TRANSPARENT_HUGEPAGE is set:
> > >
> > > PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTE=
S
> > > ---------------------------------------------------------------------=
--
> > >    4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =3D =
 4MiB
> > >   16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =3D  =
32MiB
> > >   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 5=
12MiB
> > >
> > > There are some extreme cases for the CMA alignment requirement when:
> > >
> > > - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
> > > - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
> > > - CONFIG_HUGETLB_PAGE is NOT set
> > >
> > > PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYT=
ES
> > > ---------------------------------------------------------------------=
---
> > >    4KiB   |      15        |      15         |  4KiB * (2 ^ 15) =3D 1=
28MiB
> > >   16Kib   |      13        |      13         | 16KiB * (2 ^ 13) =3D 1=
28MiB
> > >   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 5=
12MiB
> > >
> > > This affects the CMA reservations for the drivers. If a driver in a
> > > 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
> > > reservation has to be 32MiB due to the alignment requirements:
> > >
> > > reserved-memory {
> > >     ...
> > >     cma_test_reserve: cma_test_reserve {
> > >         compatible =3D "shared-dma-pool";
> > >         size =3D <0x0 0x400000>; /* 4 MiB */
> > >         ...
> > >     };
> > > };
> > >
> > > reserved-memory {
> > >     ...
> > >     cma_test_reserve: cma_test_reserve {
> > >         compatible =3D "shared-dma-pool";
> > >         size =3D <0x0 0x2000000>; /* 32 MiB */
> > >         ...
> > >     };
> > > };
> > >
> > > Solution: Add a new config ARCH_FORCE_PAGE_BLOCK_ORDER that
> > > allows to set the page block order. The maximum page block
> > > order will be given by ARCH_FORCE_MAX_ORDER.
> >
> > Why not use a boot time parameter to change page block order?
>
> That is a good option. The main tradeoff is:
>
> - The bootloader would have to be updated on the devices to pass the righ=
t
> pageblock_order value depending on the kernel page size. Currently,
> We can boot 4k/16k kernels without any change in the bootloader.

Once we change the page block order we likely need to update the CMA
reservations in the device tree to match the new min alignment, which
needs to be recompiled and flashed to the device. So there is likely
not a significant process saving by making the page block order a boot
parameter.

-- Kalesh

>
> > Otherwise, you will need to maintain an additional kernel
> > binary for your use case.
> >
>
> Unfortunately, we still need 2 kernel binaries, one for 4k and another fo=
r 16k.
> There are several data structures that are aligned at compile time based =
on the
> PAGE_SIZE (__aligned(PAGE_SIZE)) that makes it difficult to have only one
> binary.
>
> For example:
>
> static u8 idmap_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE)
> __ro_after_init,
>  kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_i=
nit;
>
> https://elixir.bootlin.com/linux/v6.14.4/source/arch/arm64/mm/mmu.c#L780
>
> Thanks
> Juan
>
> > --
> > Best Regards,
> > Yan, Zi

