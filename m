Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D1CC982CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ruow4/wZjKfb8JMQTU1Zv1qutfh8KJ4DdZLyiqz0aA=; b=p4ZZ47pY6sJ5RDb+AXH5BnyrYi
	COI4hwKFCf5vqtSKI6YXZJIJC/mP/TYGqLkOkJdS1nli5//JNQ9D21XLAuqaMCpEZbwGkuiFr6XYQ
	LgeVyiZfH2HXVGi4vYFQtH8wmkrztByx+zvFuVhIiqgN2Jiw5uBdfsXThJmKJ1e2o0dgJ25LYAzHv
	ObDV7M9sD0qiZ3eVOTftzdz0g9hWlRPucxjzZoZoktLjBxCbz/jTwyJHs3qb6phBoBWZnPiRxuiZq
	dLcVHMYPgiGXgA+13wyAFrPik4sm4SLHeSwDBpoar2i4X6WLD1AOS/jvRV0W+YZAu9EJQCdTbImg2
	AD1RNZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglfY-0000000ELzg-2gFB;
	Fri, 16 Jan 2026 15:23:24 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglfW-0000000ELzE-1C9t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 15:23:23 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-5014b671367so27085801cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 07:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768577001; x=1769181801; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ruow4/wZjKfb8JMQTU1Zv1qutfh8KJ4DdZLyiqz0aA=;
        b=JF1jix/FNcgX2+OxB5nw11KFuyxVrUGFJ+ekqPu895eSHx8gCfUsqfNu5jXUoj7eKk
         qPCDjf9zTFYTIofY2xRumo2YZtAVfrpgSxJlPx4GjL5pLHf3HR+LRGT1PAapCqPmRtge
         UsBVEa1OtJAywmBPa3R9LetBs9WSfEEQFO4Mp/9RDUNCw4y+yBWei+wpRGNDWPnBnvF/
         +5ro1vaabs7lGpBPF+v1EBJtG+BjoDB6k1MvWSdU27t7auPnjVZKT/gla+CrOVgB29sg
         y9AvotciR5vNrAkA+wxGTBYdVSrLH9Va3JE36Ar/f0uMW+mlV48i6nw+75J0+mSO7UCd
         1i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577001; x=1769181801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ruow4/wZjKfb8JMQTU1Zv1qutfh8KJ4DdZLyiqz0aA=;
        b=ZoBLRvfD5mE36egs0swHh4tacgRN7tbus/+UY342fUb7+9+Bs1GwHC8xh2ztzK/kTr
         RwBO6RG8K6wS+nx/jOF7YDRyAAYYnsN93+hH9GhsgjUGpkwZlqLFDe5OX1J2L6jn93f2
         MvzGg0tth1ohluTtC4kiZxRMD1BF2S5uH5YGZWk0LJPaXO1H5C9nsL+Aek1DPasgFONr
         LJ7mJLcyISzPSw6c/FkAhB8Q65hE+LYlDc2ZeeFHqtbGIvvfM2zuVeMKUcTJhbefjkr6
         t3fGD9XihUuD9saExUgAga3uTWMqD+mWR/YB7kjgjsCGzT4cip0LDOwV7B+GucYPGQ2v
         I5UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfULMQi04Qj5KVbdaDE6uato4C6jy3BPnsiKbz0wOKrYJ3eDZGZrfI3cq91oswK/q57OVhDSU8LIKB9tqw80HQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzLKV7iG6knl6raNsNVEYXqD91IFbTIZmUD7Izj4U2j/hVExbmG
	dz9CxZpHzqHEDWqSE2YvbNsysyjxzBJx7KrsLGscioNzGxL+hU5PWURUaX1sZGTgK0bVV23y7CU
	9EmYxZANnOaDRq1qmJp7jd0tDY7ximrk=
X-Gm-Gg: AY/fxX7sU9ZNVgOI2//PwOnmZLoyL+scet2dYkNQsgNEcmdMHpVQJmWID3tyNhv/WmR
	0VZvUmuJf/DnJJa8gv/7+i6WPLKwWcspwSbm/hnRIoT8K2NyhzWYZOjntk9Tg26cOsV/HRzX5hK
	FTMD/9UxzVvzMx0gb6nEulHByEqcF4dcfaF7wPKvPQ2N1QnnrKWlxORtwz8m6vLi7NMtcE64EMn
	A9EFeOWw40X1DMMQHYShD5MrgBAM2USBovN5evcP7swHmTp//lVVC/pMnW6EuzL8GoU4T7NjQ==
X-Received: by 2002:ac8:5ac2:0:b0:4ee:1301:ebb3 with SMTP id
 d75a77b69052e-502a1f22059mr42688281cf.54.1768577000668; Fri, 16 Jan 2026
 07:23:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260106132203.kdxfvootlkxzex2l@master> <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
 <20260107014601.dxvq6b7ljgxwg7iu@master> <db4d0a19-598b-48ff-accc-f5940a481035@arm.com>
 <CAGsJ_4yo-EE__1VzHqxE8ehDOFQuxqP9GXcskkeZ-WTTyz12_A@mail.gmail.com>
In-Reply-To: <CAGsJ_4yo-EE__1VzHqxE8ehDOFQuxqP9GXcskkeZ-WTTyz12_A@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 16 Jan 2026 23:23:09 +0800
X-Gm-Features: AZwV_QjhIL27HqGh-V6xqXTmePQwUXe1I8tfl9ShdQFMbp6lIAEloV1CW3BxTnU
Message-ID: <CAGsJ_4yACo0YVmQG4i1cr_w2unEt+SnpbFPg=O79g-2Asho1dA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file large folios
To: Dev Jain <dev.jain@arm.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_072322_323497_055B7815 
X-CRM114-Status: GOOD (  12.96  )
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

>
> Thanks for catching this, Dev. I already filter out some of the more
> complex cases, for example:
> if (pte_unused(pte))
>         return 1;
>
> Since the userfaultfd write-protection case is also a corner case,
> could we filter it out as well?
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index c86f1135222b..6bb8ba6f046e 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1870,6 +1870,9 @@ static inline unsigned int
> folio_unmap_pte_batch(struct folio *folio,
>         if (pte_unused(pte))
>                 return 1;
>
> +       if (userfaultfd_wp(vma))
> +               return 1;
> +
>         return folio_pte_batch(folio, pvmw->pte, pte, max_nr);
> }
>
> Just offering a second option =E2=80=94 yours is probably better.

Sorry for replying in the wrong place. The above reply was actually meant
for your fix-patch below[1]:

"mm: Fix uffd-wp bit loss when batching file folio unmapping"

[1] https://lore.kernel.org/linux-mm/20260116082721.275178-1-dev.jain@arm.c=
om/

Thanks
Barry

