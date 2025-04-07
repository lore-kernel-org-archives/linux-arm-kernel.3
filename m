Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD62C369A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xXXoLwvzZrukEdlx3X/HwLUc1KrRLOBJumxqoeXr2k=; b=Bjf3lnSce0XFc+eWHqc/a352Ub
	9sPuxFMWVkNVfi2v25OkYn6/7Eu1fSYTvKOMEqhhsOOLAO11nYBoalZICpCUxIi67546XtiuEil0C
	/jkqkFwPvzs9yeGWZXmgdkd3RVsGRlJ+jMA8N6qw54jcLPR5jrAP5LuAZjpA6U7Ykmh4wqA2VarN3
	Pp6qPHcx+PGRlGwV3w3ZXYDa7o88fhzRtp8Tcodfb6V1fEhZ0bUOmgvj0VhC/glx2JBIq/5V4t6k0
	LuGy4rEd0/5OO06oM66hBWemSYU5ZkH2hVwZdMsOJdPi1muLVejX1N8Iyk754bFozplmtuAhpRQyi
	A0t1LYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1V-00000001VHN-2ySP;
	Mon, 07 Apr 2025 18:16:41 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1omN-000000011YW-2rCy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:52:56 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4769e30af66so758751cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744041174; x=1744645974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xXXoLwvzZrukEdlx3X/HwLUc1KrRLOBJumxqoeXr2k=;
        b=YN7AgOIxBmiWc/IPJSyYImFJUTpSktpbFhaE/JPYOQosOWAK+4Gm3TvfQ2q6H4xgU2
         o6zUcQGbDd5G5cTT5cDxNZnDYMan8o/mQQ/2n563jNxKR6a41ZvvV5hk42SPvwDaB/rB
         +SLfATOB0Qt8Ml4zNUyAUnYm3JirwKDle6ZdhZah4O351fwIIWdDrQBvyGJsb+36VGAt
         iGVD6yGj1bY97XTX94/aOAixJbHzceK80FhvcNmJIGfOeAiTcpgT5dK3RlFTuZrDbEQp
         yOTZYccCTH9eFMeDtDZOT2gO9yYGfRDP0qNOVcN2QAFJQmKC+APuACvMMJOhHL06tKYV
         vQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041174; x=1744645974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xXXoLwvzZrukEdlx3X/HwLUc1KrRLOBJumxqoeXr2k=;
        b=Iicl9J2sX0aLT5YwiRnLrSz3DPILb+3svy+cplcLIQt4dVy9sjTCEmqmlL0sW70244
         tmXGZMNAuAqPVIcHDGnL+Pc0eds9+GafLzWDRg2EzS4qtj8T1Zw8oUFG5vGS5ws3ztd6
         ephD0UeJLm1Gyogn8TwQ+zbrzQgR96bige5YKpL/6pw2crBuu9ZwC1NVi+GO6e1Jvvgc
         F+2W6uhCVZf4hnnJOwa4PyOol6pZK14ciJjKc7FPg9v04CNRKU1DHDvpgUkDUIB23Mnz
         +X6cGu6NMsDORmKehZLhRFG7QuZ4JrvWcj4wR2SkrYAWspjLAHwWJ2eH78lElmbXdLoz
         NndA==
X-Forwarded-Encrypted: i=1; AJvYcCVD8wgkm2jHe+rZY/TsPkAUjiwP9xYU9CXvaatvEr5zvqH9iG2Kv409DRNaF7rmQxb16xUInP4Dm31+SYMCLs0O@lists.infradead.org
X-Gm-Message-State: AOJu0Yy72RXxWVMXFLnSBqodsf7I1/7a234S0jskGmul3X0hysOD4ym7
	MFfhc9LYazaL4D2aVmjsw8ViErqZFZHh3CAvJbP7wGRfETKL+nD8goHFQQ/ANVvOZfwzrUJBlAn
	Ou5De5dB0aY3BsxgZip70lpqJKn9w9qS19Yz+
X-Gm-Gg: ASbGncv8aHbKJ2EV/6EZ0Wjb4/Fpo0ntNdt8vG+xRqa6DmDbyUFO4Z9Tm2w5bcPkfFk
	Iiv273EpuvhttAvVQ914skQujsEjIdh2iMSVxXbbIX6W9sUikXF69KEHadzyZjQ8dWqOhxxB3ij
	qe7NZbGn4BLDpgaN4f/UGnWJA=
X-Google-Smtp-Source: AGHT+IFIBgZaC437wC6LFI2WkYOyO3PJh+Hp0KwQwHgd7KVbv0KJT81vcrxyQeuTbHfu7nS8KoS+po1riLdnTGeL6ck=
X-Received: by 2002:a05:622a:110c:b0:477:1f57:38a8 with SMTP id
 d75a77b69052e-47953704448mr313851cf.8.1744041173528; Mon, 07 Apr 2025
 08:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250228182928.2645936-1-fvdl@google.com> <20250228182928.2645936-3-fvdl@google.com>
 <CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com>
In-Reply-To: <CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 7 Apr 2025 08:52:41 -0700
X-Gm-Features: ATxdqUF9nwle-L2yhrR-TnrIw4GPykG22raNMPvcz2hBIWJJmX1JDxamArUc2zI
Message-ID: <CAPTztWaAmG2L7L7x0boGG2aCNosJ8GHU=GiAQP-2nuP3k2650A@mail.gmail.com>
Subject: Re: [PATCH v5 02/27] mm, cma: support multiple contiguous ranges, if requested
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yuzhao@google.com, usamaarif642@gmail.com, 
	joao.m.martins@oracle.com, roman.gushchin@linux.dev, ziy@nvidia.com, 
	david@redhat.com, Arnd Bergmann <arnd@arndb.de>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_085255_716649_57AA03A8 
X-CRM114-Status: GOOD (  16.03  )
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

On Mon, Apr 7, 2025 at 4:50=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Thanks for your patch, which is now commit c009da4258f9885c
> ("mm, cma: support multiple contiguous ranges, if requested")
> in v6.15-rc1.
>
> After this patch, the printed base address becomes zero on several
> Renesas arm32/arm64 platforms:
>
>   - Koelsch (R-Car M2-W):
>
>       -cma: Reserved 64 MiB at 0x7c000000 on node -1
>       +cma: Reserved 64 MiB at 0x00000000
>
>    - Salvator-XS (R-Car H3 ES2.0):
>
>       -cma: Reserved 128 MiB at 0x0000000078000000 on node -1
>       +cma: Reserved 128 MiB at 0x0000000000000000
>
>   - Gray Hawk Single (R-Car V4H):
>
>       -cma: Reserved 128 MiB at 0x00000000b8000000 on node -1
>       +cma: Reserved 128 MiB at 0x0000000000000000
>
> None of these have actual RAM at address zero.  As I haven't noticed
> any other impact on system operation, I do not know if this is purely
> a cosmetic issue, or if it can cause real problems.
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert

Hi Geert,

Thanks for the report! This is just a reporting issue with my change,
it's working fine otherwise. I refactored the code slightly, and the
!fixed && !multi case will now report base 0, because it doesn't 'see'
the actual allocated base. Let me send a follow-up patch.

Thanks again,

- Frank

