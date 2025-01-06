Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5BAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtcAMCs7sAFcLIuNLNjqYqwZL1uSmgaWcft4AxdeRMI=; b=gpCTlkd3gOkRvlojb50sW8jZui
	06khQMt1rB8QN5yy81gV3Fy+Gm6SrB2uvU6U0Tbn6tFb4EQaBP8OKwKe7MhvunHR8kSGB99YZpL7M
	xr73Lo++4Y3nETiPBsjhPQo54olIoj+0JyXq1kGUTfpBMCIueQ6D0J5IFasSAZEF+yAh7d9NGCT96
	4acqFNd7TiYNbfY810FTjcxlAPo7aLLt9M4IqT5I6wW1mM5KpCpOfZ6OXQSINA6zR8Tv5K/swuCIQ
	4ffUUXRawViPa2UzaJNpYsJmaGuDHF4BBVs97seJCDLKC4RUAyQAS+BvYlq7eyBmxqrTu7nye3pGZ
	K1U1D1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoVO-00000001g8K-1J5q;
	Mon, 06 Jan 2025 14:54:58 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoH6-00000001by0-2jME
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:40:13 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so21506313a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736174411; x=1736779211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtcAMCs7sAFcLIuNLNjqYqwZL1uSmgaWcft4AxdeRMI=;
        b=Yunf8NOm/rnL1Ss5KyYNN4CO9X6Udh5WVjahTqK+0//Xw49p9cMiO7ELJ3ilvVL1U5
         br/YwegzZPxpbPhZNUv5Kpw6h+cOuUohBBH0aQ9nWz1fgBGP0CuLMN6Lxki4QmWN0zq1
         sOZA8rAKa/zVNuzYxqvGh6eMGWOmp2oqLjtSAIFLD1EHFP9vj0hDfXlkt23D+67reTo8
         MZZVL6aHxRAPeKyowsks/BR272CtNyb69OqkyEg3jt4J89YAN0MkwBdEVz2AOhtfjCm4
         9lO+5JXPe34sdolWJKO+YyEi5DSW/P3X0fqkJiDPxKBMgq5WfYTHEn2b8XOZ4ruZLFbt
         8W7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174411; x=1736779211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtcAMCs7sAFcLIuNLNjqYqwZL1uSmgaWcft4AxdeRMI=;
        b=j10tlz7huPyE9TlOVfAisOsswt3K57pNCbhr3J+eaeoDPI5wM9f6yvfl+kjd0RtgAd
         V343sFnzklMQEvB7CQpbSJp/tB9KSJhOZJLF5onp7yTNPhIJU1gfDy8xbeESgNzNqSux
         2pDQPAk3mwzG9xu9iVZtK2vo5lFIGrS2YzH0JSpLcJZ5IkO/wqJYvi/4V9+aE85PJJfS
         hr3Lot3QJp9GA6tmpDu7R0gVSLC3YVK2OdtDghBjOgSbEY3GAZ5fdxXSEEkCLyRHJNQT
         wbgsWapj7POzZezl2W8BJOOdfxrlpXxUBl6u4KkqLDTWoA88Xom7VEWAN+nNP9zhghxX
         uvzw==
X-Forwarded-Encrypted: i=1; AJvYcCX/CHPb5+6bU9LzEOoa/6YWsVahyBwpHpr+G8BALD+kJCjTxye8q85ryOB8Q1Myr2YYdkw8ry0JuA+LnqfKHKOR@lists.infradead.org
X-Gm-Message-State: AOJu0YwiaxegRnh1TZQMJwy4qXCGuoSw2EbRnotvSz1ZwfCBqd8yncEe
	/XdfEXiWJkuoLLUGpUfgMbjvbzFw6EHdj3WN39QCcBln5OQrjQDRywKFI8DS5z+ZA5Aqm9v5mW9
	fI8ydCuPE4R+3lMMi8/5qhQSP2L8=
X-Gm-Gg: ASbGnctQhsuS+1IhP3Vc2Xomq3MOIOKlGSoZCbG5+cpfWeNjRvos/NtnxleZ6oHEiX0
	/OlxHM/8nJnJveYg9PmeFDzrgeiEwc6DEPzkG3Jyk
X-Google-Smtp-Source: AGHT+IG2uwA3rD9Qlfb5V7qy1YNjmed4HGhC51YNzv3jhsmOiAEItDVYPORCoU1aPeG7pl3uTfQcUk8JRyq0A6YgBeo=
X-Received: by 2002:a05:6402:350b:b0:5d0:c7a7:ac13 with SMTP id
 4fb4d7f45d1cf-5d81de33ee2mr125498165a12.34.1736174410443; Mon, 06 Jan 2025
 06:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20250106031711.82855-1-21cnbao@gmail.com> <20250106031711.82855-2-21cnbao@gmail.com>
 <e68b8279-fe16-462a-bf99-6b4d90e96904@linux.alibaba.com> <CAGsJ_4wMuDYxuEMcA0jYvekt26Uvz86kjWbo0nz-ZZzuiyEOQQ@mail.gmail.com>
 <b65e145b-a754-41bb-8322-f93c24f6b7d1@linux.alibaba.com>
In-Reply-To: <b65e145b-a754-41bb-8322-f93c24f6b7d1@linux.alibaba.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Mon, 6 Jan 2025 22:39:34 +0800
Message-ID: <CAK1f24ksqXUKquPUu3hL3qZha6fOSz2xjRcy83CDg_rdOcZB6g@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm: set folio swapbacked iff folios are dirty in try_to_unmap_one
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, ryan.roberts@arm.com, 
	zhengtangquan@oppo.com, ying.huang@intel.com, kasong@tencent.com, 
	chrisl@kernel.org, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_064012_687772_7A29B205 
X-CRM114-Status: GOOD (  17.91  )
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

On Mon, Jan 6, 2025 at 5:34=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/1/6 17:03, Barry Song wrote:
> > On Mon, Jan 6, 2025 at 7:40=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >>
> >>
> >>
> >> On 2025/1/6 11:17, Barry Song wrote:
> >>> From: Barry Song <v-songbaohua@oppo.com>
> >>>
> >>> The refcount may be temporarily or long-term increased, but this does
> >>> not change the fundamental nature of the folio already being lazy-
> >>> freed. Therefore, we only reset 'swapbacked' when we are certain the
> >>> folio is dirty and not droppable.
> >>>
> >>> Suggested-by: David Hildenbrand <david@redhat.com>
> >>> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> >>
> >> The changes look good to me. While we are at it, could you also change
> >> the __discard_anon_folio_pmd_locked() to follow the same strategy for
> >> lazy-freed PMD-sized folio?
> >
> > it seems you mean __discard_anon_folio_pmd_locked() is lacking
> > folio_set_swapbacked(folio) for dirty pmd-mapped folios?

Good catch!

Hmm... I don't recall why we don't call folio_set_swapbacked for dirty
THPs in __discard_anon_folio_pmd_locked() - possibly to align with
previous behavior ;)

If a dirty PMD-mapped THP cannot be discarded, we just split it and
restart the page walk to process the PTE-mapped THP. After that, we
will only mark each folio within the THP as swap-backed individually.

It seems like we could cut the work by calling folio_set_swapbacked()
for dirty THPs directly in __discard_anon_folio_pmd_locked(), skipping
the restart of the page walk after splitting the THP, IMHO ;)

Thanks,
Lance


> > and it seems !(vma->vm_flags & VM_DROPPABLE) is also not
> > handled properly?


>
> Right.

