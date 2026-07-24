Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF529C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ir3cBbA+grq0RW9ubbM0IgTXxYQsKBl5GJdSxtKNd+o=; b=AxoMeR/q6VWJyhwpvMnnWvliE4
	gq6SjtZveyG2CEKf+u4cCDdLhUJn7tQ8GBbjASkvgvB/O1963hs0nblgs2aSJpJz/QNqJeGWlNur8
	v8mFCD3gCAwgPbQg34vn81hKIaLXwvF47ziBjQJXIwbXyKa6xIiILx1YHxamP39dN+yUkyKFukvzI
	zCo4odGQ4CD3/3BKMMRxuVJuW19HIwSe+Mhh5E5N5oVQKli2H+zzNY3jLGJOkUadjbDo1CD84u8fk
	jgC+a959vkF4ZSjOWG5qQABJDnYjeKameoBkMFxsWx47SJ0nTJMXOoVUTd3psVkVKe+zBgzwjNklh
	hVxUCxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnMpw-0000000HEfh-4BL2;
	Fri, 24 Jul 2026 20:49:41 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnMpu-0000000HEfM-31mp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 20:49:40 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so148785966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 13:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784926176; cv=none;
        d=google.com; s=arc-20260327;
        b=Ps6oyIICIPZj2l/iqb5Wp7Re3ApdJvlnTL26lKt5UuYmObYbdYG4JMkzlWg0BCgSP7
         uSP0OcaqasvroskqnI0NuYay1IZ6jeXeaFnsr/8uv5PqaccZVjCIi3Yrnd3RCpjjlEu6
         BHkXme8RE0Wptp1p2RLZf5e5eECGLR/Ac9z+8D56MVe9GK7kqKt4zLF98TTjnPEGCv4Y
         D15MRqnR43Qa9+0bqAX2SMMvXjOv+3uCvEOxTNR7SXFJFaURhF5hdbKzN0tFe73JCZ2b
         Lef+aErzBPZ0KR45KulaI3GJLsq1xrGXCbk66LR98iv2fl0dA9KQ7u/svGQ88L4VBbX5
         ddug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ir3cBbA+grq0RW9ubbM0IgTXxYQsKBl5GJdSxtKNd+o=;
        fh=/lagNMAV/4G1Wxwy9txcesFg5ZNIdSAe7LlwHO3Kwpk=;
        b=GXS7dBHkKvyYbaCqAKYWZhKDJD6irsBWjhN8hSW0xPSdvkeTdbt3SzMl1yPzMj3JEx
         XfblZBPgHYqZIRJ8ufUYYHFg/inWZW8ve/NGXe/6r+AhXDTQlbl+Anw2Qg+KdLKpK1hI
         NozQirtdP7Bnfcd3QOa4JjeVSkymil8iWYXUhVpkkHrYP6MFl34eeZ9DvPY5cpvwRJL6
         vAgUe4fHhoahxaqTjNyq6vlsLPMs3mM5tZso8Gq11+fXkohAcHPvAGxETygfOAObQ/20
         bQF3/8S991JVrmW2u3mrUNyOAL4s8f8ujAySrbJ88RQbb2GlKku9lUeUCkRd4GhoYdd/
         /nzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784926176; x=1785530976; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ir3cBbA+grq0RW9ubbM0IgTXxYQsKBl5GJdSxtKNd+o=;
        b=igWh8cgQPXqpW5ilP4SzZtR8GDhUK3GENRJkb0415qKck2spjNxeH7kQISBRKrd0if
         8am4KiEUPk9sZZg4xMNcCB2o5ySAJ3lQt/Ntk7pBQHnsXxn5Z81MgJFz7lE2l591jVlz
         XTUZOICv8Ynb0xtd8WL5f57BaHftanjBnxWM5JiMcyUSBxdakyHce9qlGOoMH8JiFTz/
         qxkEhu0CqyrINyLyDy/j1rOL3uneD3rCa5hjUlX3BFX92wXLXkKU2vB8E0KBB0t40InG
         OLV3/xIaAg8yItyplt8290GYVyCSTrEvHndR/LSQtspYoN3s3U6Soz2amWftyjYImniL
         CbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784926176; x=1785530976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ir3cBbA+grq0RW9ubbM0IgTXxYQsKBl5GJdSxtKNd+o=;
        b=ovC9UcZeZItHkIQujo3M4yLKgZ7uPGERiF60zvKcYyr0PVnk5xmDOdL+wieZVoSo4r
         +rXpSWWXxi+ZipNsWybgaabiEjRrs2rZrkNkhu6DTNyNGFr5r6mpfgUjEDfgDTYimlsE
         xy9cLqoTxU3EiaHfDJ8zKap8lffPmwPoc0B2YXPn/wgMJB3867VQtnioZFpVHctbrUNo
         qb9HUeAV3ApMFkkKyFG+cWut9vzMn2LZiBoTe1uHdjhi2gLgsvqax2gNOMBEa0r/y4z0
         9JA0KA83/FqWtS44e85ZEM+rQ4gs7JJxf3N1Zlo0mGJP9TpUnlIC5xWsjYggH61pUEZy
         T/GA==
X-Forwarded-Encrypted: i=1; AHgh+Rrg+oJZr8dXQj8QGLszu+immZ2PqJXxX8oniePdI/uUcogJ8jlcitguxWoXcgILN4KDTVdyaKyz1nTbItb/4vov@lists.infradead.org
X-Gm-Message-State: AOJu0YyRmKn49Tm7xHr+ULiVSlNrcWS4gc6dU2VwNfVHmPeyPB/4aEaB
	c4LXZ1Y+o59+vBGSTHpfWCwgmuZ/5D0QN2ECLWKUITwl5oDdYl6rSu6R4Lya08ZR9n3rsQtxQ52
	TQMhP+/MNhaN+noSm1RN8llVa2MnHRpx17oupwL8b
X-Gm-Gg: AR+sD12NxDVf+Y1iyhZ7zpbHIMoCzZqmzOv9ScMdlpbSsjlh2XNDvvzPJM8ABj4hliN
	gQjvcYHUnPXqFdXFuq0Sy7B8hUuiDMWqXKxzZTi3+7Fu6XLsqSIVEq0bFxi4dADIliNAVTtgUD5
	do45oZXpBao8r/cUqjv+N6bblaH2Nmh/YGu+xT5Amp/MeKxB9OxWPg9PmmrCJKgMMtEGW2eartZ
	x7nBA5TCL9rU/CvDqs7w83V4iBDUDfX9p2YzRB7DB7BWKZcwG/yqJCLPqGjRJlevz8l6NAEwF9u
	Hv6/v53KxmTwFURk2dvpks/0HivvWNS+SycKE7/bfyLX1iJRJy/7blZccclu4FZAyH8vdGzp1Hs
	=
X-Received: by 2002:a17:907:608f:b0:c19:5db0:edd3 with SMTP id
 a640c23a62f3a-c1c50cf9265mr356852666b.58.1784926175176; Fri, 24 Jul 2026
 13:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com> <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com> <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
In-Reply-To: <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 24 Jul 2026 13:49:23 -0700
X-Gm-Features: AUfX_myzXob-BTOm6ceAaY-cqbzmlciva43qU3JWJWtP-y4nEwp_xtUIj8U2zQo
Message-ID: <CAKwvOdnaOy-nyZ=8oLw4N-_hA9JZVdP2BhR8cweCAOhsy4VG6w@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_134938_781824_0CA87731 
X-CRM114-Status: GOOD (  18.77  )
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

On Fri, Jul 24, 2026 at 8:54=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Thu, Jul 23, 2026 at 12:56=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com=
> wrote:
> >
> > On 2026-07-23 9:21 PM, Sami Tolvanen wrote:
> > > What's the value for the __kcfi_typeid_imx6_suspend symbol in
> > > vmlinux.o? I would expect the hash value to look a bit more random.
> > Checking vmlinux.o with `llvm-readelf -s vmlinux.o` indeed shows:
> >
> >   a488ebfc  0 NOTYPE  WEAK  DEFAULT  ABS __kcfi_typeid_imx6_suspend
>
> OK, so the hashes should match. I can only assume that the hash prefix
> doesn't end up getting copied to OCRAM for some reason then, or

Yeah, Yo'av did you test further modifications that explicitly copy
the hash prefix? I assumed Nathan's change _plus some additional tweak
to copy not just imx6_suspend to OCRAM which I assume the code already
does, but I would imagine you need another change to copy
__kcfi_typeid_imx6_suspend into OCRAM just before the function.  Was
that tested?

> perhaps the source of the copy operation doesn't have relocations
> applied? Either way, if this turns out to be infeasible, I think the
> __nocfi approach is reasonable in this case too.
>
> Sami



--=20
Thanks,
~Nick Desaulniers

