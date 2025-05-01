Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02125C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 21:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xy6WPL8IgV8oIt4FWUz6x7SfYAVHFe0+2Pds+erCLV0=; b=j9RkA4g1/PlerNC8yS9qL9c/kT
	lmRnoX9Qtw3/a9PCiVmaYGRuhyA9Ar/40UJQIsFm3U2yg6DpYecDdJmMR/5GNcyAA/ZgFuE0ilMqt
	hDeMxJbaWjqxU1xdU6wPob1FYhPMbwILwbuKUhBKIYSQaaF1svskDqcl3RFS1odoFiwCdTGamEais
	hlWtHcxHfe5kAWISckYZcnJa3pSnmKU1AesH7e8QAH03VF5zL0VxyY/HGB7f9XSK/WiVlisEG0aU0
	q6pgAV0zIkE7pO07h5jUC6+6be3m1oLj6+so0ZOhTijHquLi0aIXN2Arsw+QeNLG3D4KDsm98ekJP
	iiXTKqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAb9r-0000000Gtvj-2IqZ;
	Thu, 01 May 2025 21:09:27 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAb7w-0000000GshT-09wY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 21:07:29 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4774611d40bso76141cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 14:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746133647; x=1746738447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xy6WPL8IgV8oIt4FWUz6x7SfYAVHFe0+2Pds+erCLV0=;
        b=K/dz9/xzQCupkhe7h9tJ5XKTgzZPMX6VXIm1sZtILzs2SGMzxu4wav8PuqxUB9FCSd
         mH2SlmLuM6jP6wGZxeRNNTRhSbiaLUOADPqGpfagmwFrRvy+jPoAEM9IBByu5DZQBvCE
         4EWhWrupV9jyG/mooGw2RjETjfEmtjo+G8Xc5TfksPGG1DKs9pN+VTIazxir28HE9qYJ
         2ocP7GyVLYbKEu2bZFjU3tx5avZ46S9WD4LMnFudn5o71wlcjeELBC550UaFBp5x0inJ
         SVHRG1A3vMPaDrhOQXdSpnLREmGcLzEQYRoCbo/f2J8sfbjKTkrx/pp5pH9YJllCgBrU
         FZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746133647; x=1746738447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xy6WPL8IgV8oIt4FWUz6x7SfYAVHFe0+2Pds+erCLV0=;
        b=cw0gEsmg4kTYrT54aJSx5VJP0aUpeViEJkQwbKoHc5tT/7S9RBYZcLDq2fa0avMmCT
         vYAnJY6h4fVsPMQkfJn5aoSyBoFrQ3dDv7ICnPK+T2G+akRNIYh1YJvSM4qRCa0hZoAo
         C9j1inBDkWix0SuBEs6Snwyl5dhhDw61HolBNhB3c2US3Yoy/ZU/oMRwq6ospA9pcLTk
         IwNK2hnpl57QJenuh9E+Om3mtF4lRI85Dq4xPz4l7CwK1Xkr6y2Qm6iO+4W2393oOXJH
         Jpk7SCF1n6tyKpq7qx+EmI+XFGtHiiG5P67wWyOwrDPmGk95w/dFzPkpxXXnfry8RRLx
         vfjg==
X-Forwarded-Encrypted: i=1; AJvYcCXnvJrWRv2RGcZUujj81ZvW/KpVODtS+4gHsXO1UAX4QeeZd2ax7vV61jrEI/noXi1BG34Cg5uSy8rb2jy1FUSj@lists.infradead.org
X-Gm-Message-State: AOJu0YzXzXVKNpQqUH0AhhORyT8mRflEMs2z/qILEhp2PR39KBDYPF/L
	BVkTo0Q84dH1g0ytBqfCGAnh4t5pf5lcUwJTLJ4oJm0srt6DCNtN8tFpDPSA/loTfHeMOCWh2k2
	cyykerUdUpd+4sb3iRNbna5kW6BHr/IpFQG5t
X-Gm-Gg: ASbGncufwSeIvCeccnvELt9LiE+UHfX3qLpOGQdYFzvOCvs+tT/URNQISo1zvZZ3aSa
	/lVBYAjKUMZ5rbDYcu+phd33uJJIofsNgpbvKgLj584WJHOgf/PEZyrVV/d4iH6+cg7GKCgJDZw
	Y5OiSwSep0sgkJMDz7Mx+sZD0q3JYnb6RkKtGCAWUdAVb4lkEpl5yt3IIS
X-Google-Smtp-Source: AGHT+IGvnP8urudJpxOJ6z3FyGr9MhaER5BLt2ywO0G+UQqU0GWB149WNRFB6WlvIo4GaxjZKVKVo8gUFfalw6ne5BE=
X-Received: by 2002:ac8:7f83:0:b0:486:a185:2b8f with SMTP id
 d75a77b69052e-48ae9e81af4mr5810981cf.8.1746133646561; Thu, 01 May 2025
 14:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <aBO_laRsZDYgjEfL@casper.infradead.org>
In-Reply-To: <aBO_laRsZDYgjEfL@casper.infradead.org>
From: Juan Yescas <jyescas@google.com>
Date: Thu, 1 May 2025 14:07:15 -0700
X-Gm-Features: ATxdqUE0i0pAVlHPUIfuSzJGk1bNTpRNT-sUhQHoyQekasgTpUc_olKxPd4LNJA
Message-ID: <CAJDx_rjX3e2sprPxhGa6hVwZBYH_NP3pguYNPe2FHofTh7jrOA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Matthew Wilcox <willy@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, tjmercier@google.com, 
	isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_140728_080793_EBAF5D4C 
X-CRM114-Status: GOOD (  18.22  )
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

On Thu, May 1, 2025 at 11:38=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Apr 30, 2025 at 10:25:11PM -0700, Juan Yescas wrote:
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
>
> Sure, but why would any architecture *NOT* want to set this?
> This seems like you're making each architecture bump into the problem
> by itself, when the real problem is that the CMA people never thought
> about this and should have come up with better defaults.

Sorry Matthew about my previous reply. I think I misunderstood you.

You mean that we should move the configuration to mm/Kconfig as per Zi
suggestion so that other architectures can utilize if need? and have
something like this in mm/Kconfig

config ARCH_FORCE_PAGE_BLOCK_ORDER
       int "Page Block Order"
       range 1 ARCH_FORCE_MAX_ORDER
       default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
       default 10 if !ARCH_FORCE_MAX_ORDER

Or should we include ARCH_FORCE_PAGE_BLOCK_ORDER only on the
architectures that configure ARCH_FORCE_MAX_ORDER? In this case

arch/arc/Kconfig
arch/arm/Kconfig
arch/arm64/Kconfig
arch/loongarch/Kconfig
arch/m68k/Kconfig.cpu
arch/mips/Kconfig
arch/nios2/Kconfig
arch/powerpc/Kconfig
arch/sh/mm/Kconfig
arch/sparc/Kconfig
arch/xtensa/Kconfig

