Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D55D167F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kdGrZacv9IowSY78WMAynQv1ZGunoCXgOt7xY17SxA=; b=v9o/K1q6MgL4C3SWDM71Sh+OKl
	CPQMR/Iml3+vG1afrxtUbh1vjwIc07srzb4TsiPCNcjtUZx5fwUUqNIBFO5G9yeK24TBnds11RiF/
	NpzST57GIa6DYOObDWHmyX2gph1Mg3py6+nYrnWGOdM0VQbkuYsQoR2RKMNpUktcTMqy3DuQ7/H8K
	vkNQvw9M/vw30KjFIydzNURES1fiezcpuJRI9/sIwjBnau8yCOcNX+gZu4LJw4W4IgqIcqseWUBQn
	fj3h58zIQitbMv5xsLDqzIgmtIPQVBq6FM64Jyo5SDBlc+eUF1yzx/nH1sAdPBtmfM2DUGRaEvJ+b
	OldHfdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9HL-000000024nx-03e3;
	Fri, 09 Jan 2026 09:59:35 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9HI-000000024nI-2AFb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:59:33 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-88ffcb14e11so44187496d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 01:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767952771; x=1768557571; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kdGrZacv9IowSY78WMAynQv1ZGunoCXgOt7xY17SxA=;
        b=H67vxJK4RjBO2N5nTpRL87wGWBgGcmyyycYzlB+GCQKX3BKuLTXn4f+YQ4a/Zv4Sp6
         IQUyB0JNrnLd/xosw/7AGvy/HMBHgqcSE5C4T4oz5tO8djJLk4Pfc2Tzl1iKTVvTjv8q
         6y0fJMghmHB3bpzrF7TLvIbWUXZ4fkxu8uRBSRXQzplvHOj4z8TH53Lhb4xyjQ7fnBwe
         tjjnZj4ljWBzCPlwZb3NF90JLdWwpRGRWliGqS2/jq/08dNKt9yOsa+nlVzIoDijmFSq
         Q4ht0xm+RkCUlXX1tnvl3/BCjvflzZ+JliyKQr10UpZepmLSbWtz4zGOtMjeUcNwXHni
         eusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952771; x=1768557571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7kdGrZacv9IowSY78WMAynQv1ZGunoCXgOt7xY17SxA=;
        b=df4QQUk5sABWsBvmP4WA/7AmqbtbTJ3vFocVP9aZR/j9X34Zm7iJ6kt9gQOSl6NlZq
         SohQ9PT+6+doZ2wS1AClosf8BCVnKif/EIr8tny8nlESEn7MU9x6GC4bVnuNItjIoPTg
         60KU3Ip1I5fZOdLTHwfQtUWjOJ9yVAJq9AQLmJuagnmLdtojpj0htUVwqRU/o55/2LSL
         QJgiQZssKXvj8Q6mNRvPZCzAoelJfXdqy/AYNYKvJVvMH1j48Ir7DoFyAgm+snODPi95
         iMZ81KkJIIx+rcj/MyWPKAl9FM7zAjYPKOosF3PZQY9ITei9zmB79qkmYa3A+uh1RoEz
         O1Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXiNeaWmnsv6Ss8rB1t3dayc5cDGcHuULF45PwcHuf6eny43HH+HfPc59WsIN27dkz25/Rfm4Q5Ql/FYDm0P/r2@lists.infradead.org
X-Gm-Message-State: AOJu0YxW/uQUk+uZbrg+7vbf/3PTVUkxmzm0fA6RHi22CdwXLtzzbqGU
	g2rK/YOAuCDbgE3kjwPfnBbiXzp6jMlXkZUKlZ4gS8rTUfN+zMsCbvlD6V2BXul+HzC3WbDD65e
	tOVURcR0GYBHAsqWpMHYcoCqfNn0DjBk=
X-Gm-Gg: AY/fxX7ImEw+g3rL+XIT5kjCCcP1DSvF8JZYGuYJx9gfKvSbbX1LrhMmBtB31547tid
	Xk0gbgOZTXyJtcZZI8ufZeaBGc2dmSpJUM3qAwzKiBuiuuPp5B646YhTFRXvJXwWRDVchpWEokK
	N+bqvpqMn7aY/M0d29VUP7l45DNoOKitJTBos96NB/USx47u570ClEP3/Sedjw1F1MqV3k2fvqD
	iHBJ30oRCfViXh9IblRr5KxVawrTM1yxbGlBZigwlr0Ubd/T18jMwh9sI5fSz+Iz2duzQ==
X-Google-Smtp-Source: AGHT+IGLLavd9VSrxbJpf48jMuM2/5lKiUGJv0WgqjpUW+4hVqviEz1DHlO0GEpWhIRNikxjBoOI3myDSpdIqzuejYg=
X-Received: by 2002:ad4:5c87:0:b0:888:7c7e:fce1 with SMTP id
 6a1803df08f44-89084175250mr143596366d6.4.1767952770961; Fri, 09 Jan 2026
 01:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20251226063759.4020782-2-tongweilin@linux.alibaba.com>
 <CAGsJ_4zd+SMa4Mj23tjF5OwsP3LQyvYTrwN4y81=k8FSFgbH3Q@mail.gmail.com>
 <aV_3fxlzwOSz8B0t@willie-the-truck> <CAGsJ_4waQsxPKTcGvtpTAF4kVbYQXeH_iHaQX3aAYDNo-8oDLQ@mail.gmail.com>
 <f9d1c2d2-a6d9-47b7-9f1d-382a28bb88b8@linux.alibaba.com>
In-Reply-To: <f9d1c2d2-a6d9-47b7-9f1d-382a28bb88b8@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 Jan 2026 17:59:19 +0800
X-Gm-Features: AQt7F2oy3Qu2Sj8vfVPOtvE_KvUT6ywyCoxwqUYtKMcnoV0-UNLT0j8awhGcZs4
Message-ID: <CAGsJ_4wzZV0maShXW7MO-8coascv2nKhWW=sAcyg1BvWRRFqeQ@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: Kconfig: enable ARCH_WANTS_THP_SWAP for all pagesizes
To: Weilin Tong <tongweilin@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_015932_563031_D7BC3B71 
X-CRM114-Status: GOOD (  23.82  )
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

On Fri, Jan 9, 2026 at 4:32=E2=80=AFPM Weilin Tong <tongweilin@linux.alibab=
a.com> wrote:
>
>
> =E5=9C=A8 2026/1/9 07:11, Barry Song =E5=86=99=E9=81=93:
> > On Fri, Jan 9, 2026 at 7:29=E2=80=AFAM Will Deacon <will@kernel.org> wr=
ote:
> >> On Fri, Dec 26, 2025 at 07:52:44PM +1300, Barry Song wrote:
> >>> On Fri, Dec 26, 2025 at 7:39=E2=80=AFPM Weilin Tong
> >>> <tongweilin@linux.alibaba.com> wrote:
> >>>> Currently, ARCH_WANTS_THP_SWAP was limited to 4K page size ARM64 ker=
nels, but
> >>>> large folios requiring swapping also exist in other page size config=
urations
> >>>> (e.g. 64K). Without this config, large folios in these kernels canno=
t be swapped
> >>>> out.
> >>>>
> >>>> Here we enable ARCH_WANTS_THP_SWAP for all ARM64 page sizes.
> >>> I no longer recall why this was not enabled for sizes other than
> >>> 4 KB in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64"), but
> >>> it appears to be fine, and the swap cluster size should also be
> >>> more friendly to PMD alignment.
> >> You seemed to be worried about I/O latency in your original post:
> >>
> >> https://lore.kernel.org/all/20220524071403.128644-1-21cnbao@gmail.com/
> > Will, thanks for pointing this out! With a 16KB page size, a PMD
> > covers 32MB; with 64KB pages, a PMD covers 512MB. So, Weilin, are
> > we ready to wait for 32MB or 512MB to be written out before
> > memory can be reclaimed? By splitting, we can reclaim memory
> > earlier while only part of it has been swapped out.
>
> I got your point. In our production envs using 64K pagesize kernel, we
> only enable 2M and below size

If mTHP is enabled only for sizes below 2 MB, the patch makes
perfect sense. However, the problem is that we do not know how
others configure their systems.

>
> mthp, so swapping out as a whole is a better way. Or maybe we can set
> the SWAPFILE_CLUSTER by arch.

Even for 512 MB or 32 MB PMD folios, it would be perfectly fine
for SWAPFILE_CLUSTER to match the PMD folio size, given the
assumption that the swap table should be PAGE_SIZE.

>
> I will do some tests of this concern.

Right. It would be helpful to have some test data=E2=80=94for example,
with larger folios like 16 MB, 32 MB, or 64 MB=E2=80=94to see what
happens when memory reclamation kicks in.

One possible option is to call
split_huge_page_to_list_to_order(&folio->page, list,
                                get_order(SZ_2M));

for paging out.But this looks rather ugly :-)

On the other hand, if users configure mTHP to, for example,
128 MB, swapping out and reclaiming the entire 128 MB folio
could actually help with memory de-fragmentation.
So perhaps users should tolerate the I/O latency in this
case?

>
> Thanks a lot.
>
> > While splitting down to order-0 is not ideal, splitting to a
> > relatively larger order appears to strike a balance between I/O
> > latency and swap performance. Anyway, I don't know :-)
> >

Thanks
Barry

