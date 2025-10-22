Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FACCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 18:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMQtFFxEEsqRDxbkrZxdDgeMxhSRyhXbpWRw8AN98fY=; b=fWMaz6Zt6KFGnuj8/bFDkpFPmt
	FGSCYimfRKvQhnqR6SQN8ySRBA+Og8fzUnHdIDEgZEgzIu7EBo/914PIMqe1CYGU+UWsa8OHyOM2p
	zm/2nqY1fygtF2Jjbg77mmda3MzLzhOUfLAdLimhejA9whxoAZVTgnn9yX8R7OH8XxqRoc48Xz7Ct
	GWjl06Q5KARSxXNVtLplHQZCZUmN+kw+HkVjykybcUoRL40ISO5yQ+jXC/r4CXLvEH5l/Y2WIPrAm
	q9QbkniD67uzx49xeCB4F78jcmeTAwxtxxDFYkbpdvVH/k+jx49OQ5+Px2MZOfZsleBtnZwTMUGls
	9XbGZFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdFz-00000003wD7-1kXR;
	Wed, 22 Oct 2025 18:08:19 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdFw-00000003wCh-3uoD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 18:08:18 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so1422317366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761156495; x=1761761295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMQtFFxEEsqRDxbkrZxdDgeMxhSRyhXbpWRw8AN98fY=;
        b=ig9B5VFzj94L9Bez7xVoWRZyJaHgr1qFDWgX2wHqwI/P+8r2/H3+lAfLDDZr95IhKj
         +i92kYHOlcsg/P63/SFhS/bSbYdC+v8NR2OtnXK8GOcWHiHNrpRnqkSiNozFrYQrp5th
         UU7n+GJWv1CpfwxdXmjtUp044pLv0E8XgsdwE35gxR9WOoCF3OXCh9fzkc0/YF8XrguG
         wjBC699phpuMXjJBQXf03ctXD7cLZ9ibrO8K5zbXtrDlY9ULPdzCZtsDvTbFHi0owyIB
         01O4SS59NTjNfkm+4XJJwu2QRd7+zCq/6NOvhOBKI6JCG/uEyX6sO5ZCk8qa5uQlvWTU
         p5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761156495; x=1761761295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMQtFFxEEsqRDxbkrZxdDgeMxhSRyhXbpWRw8AN98fY=;
        b=u4jf8hNk9/CMI5emGBm3FLXZdXKNDsaEVJtvpNLV9zAGmsS7lKoUPwvpbk5MxuXGRF
         YpIQITtNxJpN9dZFwOjCFdXOIVtRd6kepJk+SQ12/2NNV0RxiWHiXFjvgM4T4I9lJMfD
         36LDlGJgRSi592MPmQIQDzEp2SgGInoGFZnpubWLu4OpPDUuT3XEL3uoW+9d2UGcn3ru
         xULi297NZPWdDYWJF71skunBqVnEVZYhZEXQP9AN/YSw7RaXk8mDvu8nxQWD22RRMJfA
         15BSMbCjZcAPpG8y6lsL7/s0g1yGLUShQyAwAprAs6DsoQDeOVy/yl/vSDQPyvUZKsY0
         81Ig==
X-Gm-Message-State: AOJu0Yyug7Ct4WCwBttAAkJJiuzX3v3mttKfREZdorwKb187kHlKPBUd
	v6d4i1Y6LZnodGRmIoADLSd/GHL/U6qMz71JIiwIWJNB+cJVvGjXIRLlR5OFEOMYrhEQ7jVI7aX
	tpFJnRdwsXmh71BksPkljH7n41H/71oE=
X-Gm-Gg: ASbGncthjnjTNq4W/oFdvacwDaqKTLBMTf3uhtgiUZtiz3fXTG6nzmOTStarb/thFwR
	MtkiTlHoYRkkFe0w0ZqhqIDN1u5+f0bLNe5EpQZlyFMxHGx9XDCowio965JOz0TunxL5j5Wo3FK
	9qqFj6gA4EBi3Jitm6KblRLjUM2DUEW6pSdnbsQlHIShLr9cFHFbSLDvOc1WqFGRh9UdlWy3WPn
	1BKo3CxsjfL/ZMrmL0TlCHlkR+1NcgcifIf/OggdZ+C157mWeZIbRbzL9P3VT3kqi16FHeLRg==
X-Google-Smtp-Source: AGHT+IH7M+imCkUPIEM0gojaqd/rG3Zx43O7A6mvp4uWZ0+fXegjfowMFGF2jPMC9fA+q+PtLYZiTxzhKO7/x560Dos=
X-Received: by 2002:a17:907:25cc:b0:b40:c49b:710 with SMTP id
 a640c23a62f3a-b6475129316mr2333654966b.47.1761156494265; Wed, 22 Oct 2025
 11:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251022101704.4015055-1-catalin.marinas@arm.com>
In-Reply-To: <20251022101704.4015055-1-catalin.marinas@arm.com>
From: Yang Shi <shy828301@gmail.com>
Date: Wed, 22 Oct 2025 11:08:02 -0700
X-Gm-Features: AS18NWC2FvbWTzA8C7rrkZW5hEdgmLMERlEUwWO1avl88qM2ea0eHvXPjFT8k2c
Message-ID: <CAHbLzkoG7zXHubYoh3gSWkdmsLEsMDrBzdAuViRzTEwQNHkpNw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: mte: Do not warn if the page is already tagged
 in copy_highpage()
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com, 
	David Hildenbrand <david@redhat.com>, Will Deacon <will@kernel.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_110817_008070_8952D764 
X-CRM114-Status: GOOD (  24.74  )
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

On Wed, Oct 22, 2025 at 3:20=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> The arm64 copy_highpage() assumes that the destination page is newly
> allocated and not MTE-tagged (PG_mte_tagged unset) and warns
> accordingly. However, following commit 060913999d7a ("mm: migrate:
> support poisoned recover from migrate folio"), folio_mc_copy() is called
> before __folio_migrate_mapping(). If the latter fails (-EAGAIN), the
> copy will be done again to the same destination page. Since
> copy_highpage() already set the PG_mte_tagged flag, this second copy
> will warn.
>
> Replace the WARN_ON_ONCE(page already tagged) in the arm64
> copy_highpage() with a comment.
>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Reported-by: syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/r/68dda1ae.a00a0220.102ee.0065.GAE@google.c=
om
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: <stable@vger.kernel.org> # 6.12.x
> ---
>
> v2:
> - Also remove the WARN_ON_ONCE for hugetlb pages
> - Drop a double-underscore in the commit log

Reviewed-by: Yang Shi <yang@os.amperecomputing.com>

>
>  arch/arm64/mm/copypage.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> index a86c897017df..cd5912ba617b 100644
> --- a/arch/arm64/mm/copypage.c
> +++ b/arch/arm64/mm/copypage.c
> @@ -35,7 +35,7 @@ void copy_highpage(struct page *to, struct page *from)
>                     from !=3D folio_page(src, 0))
>                         return;
>
> -               WARN_ON_ONCE(!folio_try_hugetlb_mte_tagging(dst));
> +               folio_try_hugetlb_mte_tagging(dst);
>
>                 /*
>                  * Populate tags for all subpages.
> @@ -51,8 +51,13 @@ void copy_highpage(struct page *to, struct page *from)
>                 }
>                 folio_set_hugetlb_mte_tagged(dst);
>         } else if (page_mte_tagged(from)) {
> -               /* It's a new page, shouldn't have been tagged yet */
> -               WARN_ON_ONCE(!try_page_mte_tagging(to));
> +               /*
> +                * Most of the time it's a new page that shouldn't have b=
een
> +                * tagged yet. However, folio migration can end up reusin=
g the
> +                * same page without untagging it. Ignore the warning if =
the
> +                * page is already tagged.
> +                */
> +               try_page_mte_tagging(to);
>
>                 mte_copy_page_tags(kto, kfrom);
>                 set_page_mte_tagged(to);
>

