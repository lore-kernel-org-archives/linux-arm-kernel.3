Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48290C79FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEtwck+GhzVGnuAmeYI6QR28xLrnmqSNSlv9PEkxITQ=; b=mUONoVdIsO3Zm8eLQpQrt/KPsx
	P14hL7ytda0Z21dXPGgBTI3IwfQl4MB1xz4loRRQGEUbZ12t2kZWgRy6ovDD4tRwzlUv5joKNsVnm
	SK++5dKVlYt0XUTFwDfeOASILEApsr39YcUlkIxB8hONMx8PuDzoVVWQiDBtcrj+vhZjKgRpwH2yK
	vE48RkqY/3KBXcVJhGs7nfCWqjHS8J0Fsbd9/63KaU0JOwRJ3ZlvpxfvLUGt28fb+xfqSQJw9tuku
	yHwjQnWSYLzlakXACgPmrzX3cBhFZem/7chWXPxtS/TuDgNijObLlKs3RuUUAlrow5GDmOcFlv+lU
	DtqpMfEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qMo-00000008Hpz-2mwd;
	Tue, 08 Sep 2026 07:35:42 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qMl-00000008Hp8-2O8B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:35:40 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482e1b30c94so261178f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 00:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788852937; cv=none;
        d=google.com; s=arc-20260327;
        b=BWJTNz0Np/HXVl/xDJdOP+WHnwuZ6y3e/yQMTgt57HmhhwJIevm+cB9319ioUIvr5+
         YKftuVdPW1+Dg15M+ITfEDYzEeeRF0kz96KA8Kcz2DrnpTPQgjI1v4bblq5hlc1CQCMG
         blp9RfuLLRi+hRwwGDayukqCQ1sg8SN8+Fw+F3aXUXi3m4TKAS6mUDs0ZuzJy53tjkQe
         LrRQg6Fe7No2sNwTUftMoELqAoz/d5UeSdNBXv5T0XivJgYvyIKndj1FvQWZ+pX5r5q3
         VA21F9LEoqYLsLLgjcYKM+IQcLXOP2PeyHn3UT27qrQLjexvFUEKWW8kuxAcuRo3Wrpd
         QUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kEtwck+GhzVGnuAmeYI6QR28xLrnmqSNSlv9PEkxITQ=;
        fh=SzfFMoTiiSZmihkVAMn/23a2GY5KBbLVq5UH6q0OZwY=;
        b=ReIw1xIuuk0yuwof8wr1SKKZ8qU8czi4IZ8HaRLwl0qJtfR+Y67G+yFk5d9X3xylOd
         Z91hpKpVQ3zEwJhob/dKChV2Fj1Hu28CtddMsM5RXaDws07x8Qb8Tuk8mlKKCF+YeHAW
         iNtJrupknpr48vvAtCPggtbfU8GOfG7JOQX7ccaxvDr1MGTqCqDkWth5+jB2Mtz2ZI5g
         ILMoOmS+e4Zfs3fNfi6LBga3579y78xxLk9nbAUU7dCBMd22sfWFbkxeeQbj5u6oDpi6
         ODG2Y6YqtGqXBtDvG+owVtbVjon9R17g18igawZRyo1J+OAjZJY8WS9N5WAVyntmz/FV
         WtTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788852937; x=1789457737; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEtwck+GhzVGnuAmeYI6QR28xLrnmqSNSlv9PEkxITQ=;
        b=DdJliAyErX+985S1IWpHsjaS/DVJ16H1soBjtmGSHG31erPJkab71pHQkWc9wRNlDM
         8br5E29UiPtfaXpixlC6cFEZYY12qrvBpyDm0U0vRBxSFYs5+oqv5a5sqo28UYlRwv+B
         AmfjpqMGqxcxNXzls7V1RNXSZx3KgzjTQeWyAo/bkZelMMnT5YPHbZQ5ms2zXegYfAQ3
         uEWRSw/huuYnIWlxs4UvsvqD4SqcVjVPreutHoYdONnFFM3qiifbq20/ADLJi++J/U/Y
         0uDB3jJ1EC++HsVGDz6lpTADXZuYgPWwAvDjE8+aO0yt4qLtPhplFSJI8+vRbHGP1ZY/
         QMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852937; x=1789457737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEtwck+GhzVGnuAmeYI6QR28xLrnmqSNSlv9PEkxITQ=;
        b=QIv/FhAywt7iAYhA2g5xWHOSJFxXaJbWeaeHSHqXab5uhBxqXSaQk8ASCMM/EOsy4Z
         OZPAP5fg/RygR+M7HZcrDJHPLEaUq6RnqvmFdgThNlfxSfEZaYS4VPB3W0tv0t/1Reyh
         Qi0zyJ2WM9qvMfvzhp1RI4pCYcjEUI8SDW2aCByc3wJwLHAGCFxSEiLTHJp8a9AZwpq0
         DwAbOzoGTHyykQ4OQBLa6N6J1yqInmT3IyLA4cEltSV7iyplSfVcgJKzt9uGblS9KFPN
         v5IlQWTBigqjlVWtpL9Y5OLXgNVz7EVPPGULHzTT6i/YQV3s7EFEpuWBPpw8RdQL0tID
         RVMw==
X-Forwarded-Encrypted: i=1; AKwUvBzCOU19Xfjx778TWqnosovRLb454CqsoE9EpiC+cNVNGGmRjcdSZLj+zvlUpgoeWeDblUyt2z7n9XGE2yk0fX7c@lists.infradead.org
X-Gm-Message-State: AFuF++kNqsDXITW8WXswweycd3s4KGfCFH7kBjnDLWxUg8MwI5LgOcjB
	y2ED37vJPVtbYrXhZhT1+AAQq4sCDJCKJ0youy9AVUrwTtgrLRd5F5y30kdMoBy4azTaZxnhzkf
	9dwhYjYJM2xybjD8SyyiISl2xmy68a8M=
X-Gm-Gg: AYBFou3UU7KxupBNY1dQ+oVg8u6mPuDK7bDcpLAQAoDCV8E2lCrxaZI6CLoi5+Bez1p
	+3J87lOC3ZsbS3tZL3ebTkl0J8CkOoFT3RFs4cT1ILojWe8UiK2EaPMc3V1EDrLAJ8dVRpRYRdR
	yVQq97QiY2/S4cKP99DavtxLgQhPN8hJbAmRgMQqyKY3sVi1QSPbcpvh8mGE7UTwj9xkI84mn/r
	WyHju5mIYMBXHFat+lxN/uHYQi9JtRb1pO3o/A5mUF4BFeIG89J7coh8A/jx4m8HwA7CnoJQ9D3
	WTAqYysWhzvfW3i1RDvx+fdIC21IwSOeRnI0tEJ36ykGoIVYr9i2jI0mwdf7sOlI101SE/gvgWn
	zPFtteg8pcT9X0j/HOG+euL6NPJieeg==
X-Received: by 2002:a05:6000:2610:b0:482:ea38:6b80 with SMTP id
 ffacd0b85a97d-485905b6dcamr17746950f8f.1.1788852936749; Tue, 08 Sep 2026
 00:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <apk8ZRr6do_YAlzf@kernel.org>
 <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com>
 <ap05ue1pq3TgHOS6@kernel.org> <CA+qSx6y=OaMsvTKUbPP2DOan3Ym6c8L5z60512-tCYeUjLZz3w@mail.gmail.com>
 <ap5Tqu5yswJrj5UM@kernel.org> <69db9546-d14d-4107-96b7-30963292c2bd@kernel.org>
 <ap7L2UEriz6DJfif@kernel.org> <2e8dae0b-d81e-4c5d-b4d5-c80bde07a314@kernel.org>
In-Reply-To: <2e8dae0b-d81e-4c5d-b4d5-c80bde07a314@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Tue, 8 Sep 2026 15:35:23 +0800
X-Gm-Features: AcwNN1WRh9Ejy1a6UjKpBEjkYuP25njGh2x0QoOc56jCCHUBW1sbsWwyKaUqbMk
Message-ID: <CA+qSx6ybfqMMNKkAwVgcEga4uzFixXYKLZ-D8FuXmjXpQ9zExA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org, ljs@kernel.org, 
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_003539_639036_8B27E240 
X-CRM114-Status: GOOD (  25.77  )
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

On Mon, Sep 7, 2026 at 10:48=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/7/26 16:36, Mike Rapoport wrote:
> > On Mon, Sep 07, 2026 at 01:18:42PM +0200, David Hildenbrand (Arm) wrote=
:
> >> On 9/7/26 08:03, Mike Rapoport wrote:
> >>> Hi Xueyuan,
> >>>
> >>>
> >>> And I believe this is an historical artifact rather than necessity. F=
or
> >>> configurations that allow set_direct_map on arm64, change_memory_comm=
on can
> >>> update direct map too, it just need to be implemented there.
> >>>
> >>
> >> Are we sure the other architectures do what we want in their set_memor=
y_ro?
> >
> > It's a zoo right now :(
>
> Yeah, that's why I'm asking :)
>
> > Although most of them do.
> >
> > But we need to sort it out anyway because of increasingly growing deman=
d
> > for modifications of the kernel page tables.
>
> The question really is whether we want to use a single interface for all =
page
> tables.
>
> I quite like a page-based directmap interface. Other page table areas are=
 not
> necessarily page-based. It also expresses which types of operations we ex=
pect on
> the direct map.
>
> One could, of course, use set_memory_ro() internally to implement
> set_direct_map_ro() (and similarly for other variants); but at least
> set_direct_map_*() would have clear, well documented semantics.
>
> >
> > I started something here:
> > https://lore.kernel.org/linux-mm/20260721-generic-set-memory-v0-1-v1-0-=
2c1fc62306b3@kernel.org/
> >
> > Now that x86 CPA is nearly fixed, I can look into the next iteration.
> >
> >> Having a dedicated set_direct_map_ro() with clear (documented ;)) sema=
ntics does
> >> not sound too crazy to me.
> >
> > It's not too crazy, no.
> >
> > Still making arm64 more aligned with x86 and other arches that update t=
he
> > direct/linear map in the set_memory_ro() seem a good thing on it's own.
>
> Right, but I'd much rather user set_memory_ro() later to implement
> set_direct_map_ro() [initially on architectures where we made sure that i=
t
> actually does what we expect? later maybe generically]
>

Hi David, Mike,

Thanks for the discussion. I'll keep the page-based set_direct_map_ro()
interface. :)

Thanks,
Xueyuan

> --
> Cheers,
>
> David

