Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE05C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AonkeL2UG9zbG1SpDxserAwv5MTYfIP9basgeC0vKE8=; b=GDK/F5Q9iI9CjPCIRfcphfhtJj
	54ugYQL1BRfk7VLjccfXsVnYsRJiZ+3eqykmvJhkz3kYgo3HVFwc6F6ZGI3zSXYmGkCtEyJa++eFO
	VaACqwB8CXQuRL347ISz0ygekqCnGvbSJcE2+bevYj9nXqLROhcBS9i/ZcL6AP3CuE6DQubMBDaYc
	4yLjvlP8xkSNNmBVYpPBCGqtVZTeWS0dCrN7Q/xitDFRo4jLDAmm0FR0LXqHDNKR4QGYb7amYkE2u
	Q8jmVVrtVlnn/3nxnRhFgINhNazuYTlioDTJd7lsBTF5YH/kkAD4hs9CHBO6weqluVYKjr7pPTgHD
	+/7HeNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV345-0000000DlFO-3nSA;
	Fri, 27 Jun 2025 07:00:01 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2zz-0000000DkSs-17AL;
	Fri, 27 Jun 2025 06:55:48 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4e7ef5d6bffso482928137.3;
        Thu, 26 Jun 2025 23:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751007346; x=1751612146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AonkeL2UG9zbG1SpDxserAwv5MTYfIP9basgeC0vKE8=;
        b=XaPdIEau78ELlYZLdMs8dScXws3W9cyS05+bfeI69ignyo1c3zPV8TwPBkWdCPpdHb
         8CoKINq+RNI6gQAue8so9l8i9qI7f82/b6NlGZuDQS+zjFW51D2V6FO3jWApF0OMjYyx
         LnwzhHHGvQuDLRkItaUpOiO4skdxCzxNz6S3GtJNoyAhuqE7RDAYp9VQ8B8vRiqmrXS3
         pV5Ef+Z3Jy6VoA0KpWeWDeT3T+ZPCwed9XbY5N8wYA6ezFjRXI7DUftL4hRtJap94HCK
         qxIjDjzpTjk3ToR1KjrUg+Ph82syVRRX1bcWwhCiAJxQ0XmWkNBfEpQKjeIcbZm6G1nD
         YsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007346; x=1751612146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AonkeL2UG9zbG1SpDxserAwv5MTYfIP9basgeC0vKE8=;
        b=fMkfPLzbm/qb02Snn2WiPUugHs1IwLIIUhwBa7HoJh2hYHsdRHO7eSU/pY6RX9lu8c
         kJUWmOND0g01z5kG2PZo9gqmQoocKTOIynW9DglOBsevZqx3qdlhN4MlKEJeD0t1gE1Y
         DHia051g6Ml041xwGXr9iwCvnYQwPTBPufOTaB8asNRG8hMevvNftZ6kyBzk/957xY83
         SlmiZgbh/8Zk6x6ZtlNlbLDUd0rqO16L1I72XTwgQQpqnF9C8AuLXS0EqIu8mMs6/eU8
         M2x7qO1Pllzrk8Rdu0Ei0fUYJUDthwZpC1iAqs78T5IrqSCJqvRQysYhV7Xl6e+Be5h+
         6Jyw==
X-Forwarded-Encrypted: i=1; AJvYcCU2tbaSC3yNMyXumXEPpzWumZbsKzFpDVjFbzn6i1FjzOWE31KP1aja1IPZi7n3RZuDfiJneB6KRusHPaw=@lists.infradead.org, AJvYcCVbszxCZFVBn4enTxuinF0Mf7zA+r68LJAesBY9m3NugKRhjYyTK0MJP/rxjcDZ2FJPe9mT/+Wnj7+mDpR4qyoz@lists.infradead.org
X-Gm-Message-State: AOJu0YxUw0Jf2NIla5kSROD9/pIxqontVrih+9fpqLdYHhBZvTyudvwv
	rvqNsY+pEnvLLpxZMt+8NKfCN7b8f5nuBto2wsGFZGiuzwrnzpjRG6SBaKxlHFP/AbvHUveF/zc
	9XMHFtVUsAD5LQy3Z8Lv7DoXy3iQCUtI=
X-Gm-Gg: ASbGnctMfelxvfoM2ixXAN+Do5zLVk+ZmtrDQrYit66YqxOSY/+0l/dGuyWX4KQgS6c
	AXIz1yBrUFng+yfs0tv0MaJSapwSFcVEMXpZDvDG1DARHp0xMW5bhwlhW3qk2Nw515Vz2GiP4R0
	rLS8S8VwRbNtH9+Q3eaT6bJU4rFMceOoCeA9kTWqWWmhg8xIP1SwLbpA==
X-Google-Smtp-Source: AGHT+IHID72abIG7KO9tY0TMUT/7rvTScdoSDX7SF0tYvqk7dfZNu62uOYY7u8MoIAmAQhMkN3cJSxhZsgMz1pZQ9R4=
X-Received: by 2002:a05:6102:919:b0:4e5:acea:2dec with SMTP id
 ada2fe7eead31-4ee4f6a6083mr1641746137.7.1751007346178; Thu, 26 Jun 2025
 23:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250627062319.84936-1-lance.yang@linux.dev> <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
In-Reply-To: <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 18:55:35 +1200
X-Gm-Features: Ac12FXxvwUg1I8DIO0v6b56l2GT04XdFM5Ht5dpca7QYboGTabvmi5kE5vPkba0
Message-ID: <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com, 
	mingzhe.yang@ly.com, stable@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_235547_308582_C4650E99 
X-CRM114-Status: GOOD (  18.91  )
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

On Fri, Jun 27, 2025 at 6:52=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Fri, Jun 27, 2025 at 6:23=E2=80=AFPM Lance Yang <ioworker0@gmail.com> =
wrote:
> >
> > From: Lance Yang <lance.yang@linux.dev>
> >
> > As pointed out by David[1], the batched unmap logic in try_to_unmap_one=
()
> > can read past the end of a PTE table if a large folio is mapped startin=
g at
> > the last entry of that table. It would be quite rare in practice, as
> > MADV_FREE typically splits the large folio ;)
> >
> > So let's fix the potential out-of-bounds read by refactoring the logic =
into
> > a new helper, folio_unmap_pte_batch().
> >
> > The new helper now correctly calculates the safe number of pages to sca=
n by
> > limiting the operation to the boundaries of the current VMA and the PTE
> > table.
> >
> > In addition, the "all-or-nothing" batching restriction is removed to
> > support partial batches. The reference counting is also cleaned up to u=
se
> > folio_put_refs().
> >
> > [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fc=
be@redhat.com
> >
>
> What about ?
>
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> may read past the end of a PTE table when a large folio spans across two =
PMDs,
> particularly after being remapped with mremap(). This patch fixes the
> potential out-of-bounds access by capping the batch at vm_end and the PMD
> boundary.
>
> It also refactors the logic into a new helper, folio_unmap_pte_batch(),
> which supports batching between 1 and folio_nr_pages. This improves code
> clarity. Note that such cases are rare in practice, as MADV_FREE typicall=
y
> splits large folios.

Sorry, I meant that MADV_FREE typically splits large folios if the specifie=
d
range doesn't cover the entire folio.

>
> Thanks
> Barry

