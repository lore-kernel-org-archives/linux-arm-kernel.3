Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1330CCD1B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QX4R/NBKfqzPmM9np8ip/2J9fn8AlyDDHWJ/b66Led4=; b=u6PJ52LmNWJG4sFFdPadooeiHj
	JX3Xyef1c0gPUiKbzSUVOoP8AiixnV6FZBCaKaE14joIaukzf/FvaFxwO0bGIU/VTJ+BhnPnKWrIO
	miVQ8oosu4tG7FQkl8gryRWwcSiuDF3dclqsw0xjW4HaoVVo+ASaGBaeSq/M1nvh9ekIyeSV3VGG2
	on/oLSPxzGqH1i0v/qsLO2uTaCe3Ryr9+6+N7iYoOfmo1PN//Al5hwRPe0dQKh74tztrJt1EilR46
	8WmYwveMNmOWfkMYt2RVGd6JljHghfVI/ke7nAXJbOaSVbNu2mFnU97ofkuPVUlvlINHV+sRfUb72
	zgaR4x/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHao-00000000QJv-1EW3;
	Tue, 21 Oct 2025 19:00:22 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHal-00000000QI3-1Jzj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:00:20 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-59dff155dc6so3006134137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761073218; x=1761678018; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QX4R/NBKfqzPmM9np8ip/2J9fn8AlyDDHWJ/b66Led4=;
        b=QLxFZsYvRN7e0iIPxKhWRZU1UZUh7Ip75Z3LdslmP9JmAeTGpNUQJw3eewL5NFUoy2
         iGYEFP5vG8NTbC0NS8aXOH4zm/sLBr4h5dePmNwFmKiQQ3N9QbbJSwzQ7YTXpH/Fb5aK
         m+UaukmyP1gxN2eMfyUPfD6obKiMkf4UzUiN+m9E4vFZutNcyXc6DkxPGrk8+MLANwUW
         F1/oEt8SbOiA6p++1Sy9KjxM6HNpDhKjddOQjma+lFt5EfY1doj4NyM++UXogrcxGGN1
         1TWCtTQVVMoZELzP22uIpdGbfOPZZASz0xExsMdaaT0jj45cPHMtyayBcRBbZr/JgFXR
         n58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761073218; x=1761678018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QX4R/NBKfqzPmM9np8ip/2J9fn8AlyDDHWJ/b66Led4=;
        b=nMJQ16etV7dOP+y+cB/N1lZw2tuxj6XGrUkKqe7X50Qh0zjWffABDOB19r9Q2yh5BY
         yDP6AzmXqGASlUJDAcOEkQi8qaKG5dvUiPyAqmTXmVq4O8s4MfUj10Nq0ZOdeIr2OnWw
         Z9RNakktz8oCNJ/CYPeuZ/yZDlqRmoBTWtIZnWkkOjTT++lLc9Ox7hgdG2Izr2hZOo4l
         bzuVHolKfkxfYMP5+npuxTk8yQ9NldR/CsI42PU946gZLduUI7asqWcziFFiaN7hfsKY
         pzI9G4QFJanB1kIAj8CwW4DyAFyhFZPNeZ4cd7HEarS95i42jSBbanC7i292QPnvksCU
         QUsQ==
X-Gm-Message-State: AOJu0Yy2YFG2lcVN2/Hvus0wVfrdvt4CuzogFeMyVMRugenmMBSPkAun
	u2oV/VW7cCcn2tcYeKteZfsUS89/E6R3bz+mZeHIvvY2jZBa3Tcxup0XeLx/OUsvxlTEruxCMxV
	SGW1PnS2UvavhjStInvjpBvU2diyKHTdce9nP
X-Gm-Gg: ASbGncu/ya92PzdYKfeuLs+i3XTh2dRqdKUaU8c1vXKLsX9SaxCFgk1DBgnbG+BtUBK
	JQIXorZ3QXy+X3WZ/dHNt0SReOMUr1m2h59/xNv5CCc3W2iSZcFGOzNJispgomi2uAm3Se5utC/
	wN/Dr6iW4Hhi/WkBqTxc0LYohJF4h+u5o0veO9Ey9YG6LrlGlL8GiE3RFcDuRocSE+VFINAY4o/
	DSVoimh7BAAHScwRwyhrb4P/zleAmm8PaKeYBdRAksatoSIUc9LK6U3E2B7iRxqMzr1KEZUJw==
X-Google-Smtp-Source: AGHT+IHzPHA9WK5Ga04M2zxckJS1s5xJMnk2C43DqK1XOAGMJNbXAm04rGA+bsFUHBWP2svtA/gkjzvflLlfapXJqYA=
X-Received: by 2002:a05:6102:374d:b0:528:d2ad:1f4d with SMTP id
 ada2fe7eead31-5d7dd6d91f7mr6017190137.34.1761073217856; Tue, 21 Oct 2025
 12:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251021181353.3842660-1-catalin.marinas@arm.com>
In-Reply-To: <20251021181353.3842660-1-catalin.marinas@arm.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 21 Oct 2025 12:00:04 -0700
X-Gm-Features: AS18NWBvsDP5km-0XmYnLKQIdPCwf47TEESXursF19YBQqMpxVIwRFTadlqzvtA
Message-ID: <CAHbLzkpd8awNe=bZVv9fTux+Fx-HT8qL4ENZ-uC4YcPjf9e=KQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: mte: Do not warn if the page is already tagged in copy_highpage()
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_120019_368985_4DF97E27 
X-CRM114-Status: GOOD (  24.71  )
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

On Tue, Oct 21, 2025 at 11:14=E2=80=AFAM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> The arm64 copy_highpage() assumes that the destination page is newly
> allocated and not MTE-tagged (PG_mte_tagged unset) and warns
> accordingly. However, following commit 060913999d7a ("mm: migrate:
> support poisoned recover from migrate folio"), __folio_mc_copy() is
> called before __folio_migrate_mapping(). If the latter fails (-EAGAIN),
> the copy will be done again to the same destination page. Since
> copy_highpage() already set the PG_mte_tagged flag, this second copy
> will warn.
>
> Replace the WARN_ON(page already tagged) in the arm64 copy_highpage()
> with a comment.
>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Reported-by: syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/r/68dda1ae.a00a0220.102ee.0065.GAE@google.c=
om
> Cc: <stable@vger.kernel.org> # 6.12.x
> Cc: Will Deacon <will@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/arm64/mm/copypage.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> index a86c897017df..40749d0a385c 100644
> --- a/arch/arm64/mm/copypage.c
> +++ b/arch/arm64/mm/copypage.c
> @@ -51,8 +51,13 @@ void copy_highpage(struct page *to, struct page *from)
>                 }
>                 folio_set_hugetlb_mte_tagged(dst);
>         } else if (page_mte_tagged(from)) {
> -               /* It's a new page, shouldn't have been tagged yet */
> -               WARN_ON_ONCE(!try_page_mte_tagging(to));

I think you should remove the WARN_ON_ONCE in the above hugetlb chunk
too IIUC. migrate_huge_page_move_mapping() does the similar thing.

Thanks,
Yang

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

