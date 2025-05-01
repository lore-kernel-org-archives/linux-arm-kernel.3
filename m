Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA63DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyZUTfbjOtSI4Pg1zTRceh+Y3qETrTmwa1GNlHLrMsE=; b=uoARqshv3dDZeCf+JkAN8lyJ+k
	4mnNNsZ7kCZ0hfqGKOoah+Sah6b/BMwN9ozrI6TNb4j/ggy2sy900QS07rqlbb+OrTFeXQG98+u7T
	hb4PAAMCo8EZAs9DZWfLBCU/z/CCuKp7ZARplzZRw1u5UssMRMtHcnaCYhelciT0BbCFrfeYLRK9K
	CMYabV8zkc7O6iuIBOo2HkfFbFnHXHPZ3Tr4D1YwOhSNLqyCpdkkvlrpr/QN2U1M8WwcvbAj4bWfn
	OWc4fId2ZcejQzigaG8WaXo4KxI0xWinzB4TnaWUVmiE7O8MEMaTTTlNBXnLA5JgUIgqE666d55mL
	FtG+AJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAXTE-0000000GGsX-3lqR;
	Thu, 01 May 2025 17:13:13 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAXRK-0000000GGjl-3Spj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 17:11:16 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-47666573242so17931cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746119473; x=1746724273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyZUTfbjOtSI4Pg1zTRceh+Y3qETrTmwa1GNlHLrMsE=;
        b=S7d3kpJTkJQLfn68MaoJLOa6nXvlF9mNOExxXzKNm9D666TkMqQBqA6RJdT7KYVJBy
         2FvCMKWa4rQ96gKoOyPmGxPtxUzjXIkxcXBm+gIOQTHHN4ufvM6HlezH5UL4yOKewLJF
         VMFTEujoXzkm1rVM9XCpgWKNX9Mi2egCISUu0/V9DDGhsYUijM72geb78JpR/LKRK+b9
         RmAXKOYEerXSNjPGQ72I2RfDO2zSouT07y4ZQTXKiHINTtb3MTLvq+D5zPp9qJh4l4IV
         3eYnBCxXRiNIw1WFxeP2HcyrxAwyrSXL8im6svF4I+nNm1B7lf20l5rQUrI90oHZ7Hxu
         1JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746119473; x=1746724273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyZUTfbjOtSI4Pg1zTRceh+Y3qETrTmwa1GNlHLrMsE=;
        b=jF+3gFyhQhQY6ECk+ptox6fX1MLmOQQHFCORoKP1+JFxYj2vKU4JMulQ8t7FE6mYBs
         0XAJ4GrFV7Jjly3THapQY1pnQwDOrFyz/5ELWtfYOlq+JwjKbo321YKv97tjLNaCB3aY
         rQLl0b5SghvQWxzS5F03DqTV3KXDJdDeC3kglzsrXrinnWGJHGqEc3ClJw4uVcNTxllX
         nAQnrLDrxZ8DmFBVaaiam35uumR/IXZlswaTrWY6VDwoXbvX9LuonEDBiAon238W24EQ
         rjas2IHpZlVOFVsLGODq+4lCu2foDJkVK3pmbemoWUIwg5CJdlY5qD2Q+iujoF1mgOie
         b2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXpSdkB/Y0WcW1OAgpGXitHSFzM8WFMy6zcPk+ETJQrEPGY4UjYIx2x0Jif7MYE9jiky9CoDFVnCdjIDHYybJ5m@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5woLzgiEGAVzZLlZ5rovHJe90uFBksHtv9aN9vKQmx+5k9pdX
	TcPNolinoHV4C8kALkya43NCNyGecZOJ+rG/MxCVSuia0V1HQDcJzi2LK3NZEc59HzADJLTaNsk
	XQeJWwMXjZcuHuEChP5MldIJrftPT4/HS5RC/
X-Gm-Gg: ASbGncvmU8hdGtfIyRXdso3kqYQO4R0ds8UxmdG7pqfMTCIfaajaO2LXbkn44FrR29N
	Fa8R2MACxwiDiv9oBKAy68voqOokXZIRECYIJjuMf7mUm3ZCgHSWL0DH113mBVdbv4VKTSRN6ht
	7QT9VVO7TBjLAO/ctoJ/RrPdEwgmJg2spAv7HAl8ftbSy1/Njj1LraW4jE
X-Google-Smtp-Source: AGHT+IGv3eRGNECsUyk6JOE6O6LjupkXS1Vch7nD0P9cmrdw/DfOv9xrVQcy66j5Dit0TNIse4AjgxHkAuco5q3Aruo=
X-Received: by 2002:a05:622a:104:b0:48a:42fa:78fa with SMTP id
 d75a77b69052e-48ae9f775aamr4522371cf.2.1746119472574; Thu, 01 May 2025
 10:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <3230A277-7D1D-4329-B871-5E43967E6A00@nvidia.com>
In-Reply-To: <3230A277-7D1D-4329-B871-5E43967E6A00@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Thu, 1 May 2025 10:11:01 -0700
X-Gm-Features: ATxdqUGuDLhfocEblH8_bII6KZwxowsdcLaFmo7SPnbUbxHXravB8vFsCWiGWlY
Message-ID: <CAJDx_rgodAQXVrLjZBBGCqBkT82Oem1ACj7dk=G3qKMnyu_AZw@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Zi Yan <ziy@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, tjmercier@google.com, 
	isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_101114_866125_103C2B19 
X-CRM114-Status: GOOD (  29.79  )
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

On Thu, May 1, 2025 at 7:24=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 1 May 2025, at 1:25, Juan Yescas wrote:
>
> > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> > and this causes the CMA reservations to be larger than necessary.
> > This means that system will have less available MIGRATE_UNMOVABLE and
> > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to the=
m.
> >
> > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> >
> > For example, the CMA alignment requirement when:
> >
> > - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
> > - CONFIG_TRANSPARENT_HUGEPAGE is set:
> >
> > PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
> > -----------------------------------------------------------------------
> >    4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =3D  4=
MiB
> >   16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =3D  32=
MiB
> >   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 512=
MiB
> >
> > There are some extreme cases for the CMA alignment requirement when:
> >
> > - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
> > - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
> > - CONFIG_HUGETLB_PAGE is NOT set
> >
> > PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
> > -----------------------------------------------------------------------=
-
> >    4KiB   |      15        |      15         |  4KiB * (2 ^ 15) =3D 128=
MiB
> >   16Kib   |      13        |      13         | 16KiB * (2 ^ 13) =3D 128=
MiB
> >   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 512=
MiB
> >
> > This affects the CMA reservations for the drivers. If a driver in a
> > 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
> > reservation has to be 32MiB due to the alignment requirements:
> >
> > reserved-memory {
> >     ...
> >     cma_test_reserve: cma_test_reserve {
> >         compatible =3D "shared-dma-pool";
> >         size =3D <0x0 0x400000>; /* 4 MiB */
> >         ...
> >     };
> > };
> >
> > reserved-memory {
> >     ...
> >     cma_test_reserve: cma_test_reserve {
> >         compatible =3D "shared-dma-pool";
> >         size =3D <0x0 0x2000000>; /* 32 MiB */
> >         ...
> >     };
> > };
> >
> > Solution: Add a new config ARCH_FORCE_PAGE_BLOCK_ORDER that
> > allows to set the page block order. The maximum page block
> > order will be given by ARCH_FORCE_MAX_ORDER.
>
> Why not use a boot time parameter to change page block order?

That is a good option. The main tradeoff is:

- The bootloader would have to be updated on the devices to pass the right
pageblock_order value depending on the kernel page size. Currently,
We can boot 4k/16k kernels without any change in the bootloader.

> Otherwise, you will need to maintain an additional kernel
> binary for your use case.
>

Unfortunately, we still need 2 kernel binaries, one for 4k and another for =
16k.
There are several data structures that are aligned at compile time based on=
 the
PAGE_SIZE (__aligned(PAGE_SIZE)) that makes it difficult to have only one
binary.

For example:

static u8 idmap_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE)
__ro_after_init,
 kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_ini=
t;

https://elixir.bootlin.com/linux/v6.14.4/source/arch/arm64/mm/mmu.c#L780

Thanks
Juan

> --
> Best Regards,
> Yan, Zi

