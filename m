Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E4CC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaFMQmISe8mwMKslzDhJXe2N9mtx8GidIaMXPAK04mQ=; b=BzT+2pcGAqh65JmC8aXbivacym
	shpJJLd/8xNdtZ9IdcW7057n7Ft37f+7vKzSkGvSUP3+o6MQgRGHi8J0LxfaTFoBSTb10//I4q/qO
	IlSnMUIjtGbiwinozcy5CXelaoxVxCfZucIpNRMLbj86GVrBd45LITqBdZ4V9YjzJbT3ztw0W9iLL
	4sW1FlMdgJV1Cqa004vyd49eWWA9Ty1NR+XJmOioTLiVdRHOyPqhwFH7SXLmQKWjhc+Q3ooNhUxFU
	XzzAn1gFfkp5JF4wHWvcflZqfGNSIX/VQ1goViXkP9IIW/0lW2EsfZ1YfBrpeEupYPsJ7TWHoaQZM
	DA5MMoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2zW-0000000DkK5-3cEY;
	Fri, 27 Jun 2025 06:55:18 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2xD-0000000Dk1R-3oOA;
	Fri, 27 Jun 2025 06:52:57 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-87f74a28a86so1117697241.2;
        Thu, 26 Jun 2025 23:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751007175; x=1751611975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaFMQmISe8mwMKslzDhJXe2N9mtx8GidIaMXPAK04mQ=;
        b=kK1zPewaO1O8M1U6dygDlhpaE43Ax1pE0VtqefjIII+iLOAlpovykC/IiXFBusoIYf
         RWNCKkU78cN2HxUDHtjys/UEfs8HVvAGl3A9QOlnTbuTDOO2VHwshdJxcKZ9JgaUs6Fo
         lC6R2bwiV+zpDDkFlgAKjfkmrwX5Lj0wG8Zy0SJx+1moNC1+c93mN0R4rGj2rVf6YIwg
         b1hwft3GvufeqywJat6dQm/tyTN3M0+SGgV0zMOgPWiGyg5JwU5Lb55wH4FdajSA+XRg
         RvlNwDGoZQjcSSxFssLHe/Q+AIJDqHHc8jVaJOTpRG7+MwcOFwDg/gKBLMiPQmKVeHGv
         xbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007175; x=1751611975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaFMQmISe8mwMKslzDhJXe2N9mtx8GidIaMXPAK04mQ=;
        b=MUj8iQrTeDycewxXhRQ1Ar1m87V3nYXC/yWBXwPTaD1qOKEvYnO4chCNiIreqbK+vY
         Y8LWHYP8zQBJAwTxfhCvD2jPTrcWd+OvRHcYCBsdtkPZdTrwUP46DG0wiurAp41b0Av9
         pOvpwzT7kwtblNZfgJOhdIKELT25Q1U5FjNuA6vHrzYegn/5FTRymcaXEDwT0vD/5ylq
         4kyd5VaYmP6AJlQ/PaZBAV/bMmlh0EjLnBAgTolVYLQFtqVLDhm0K+VlS9XbWjQ1MxMg
         HJnT/mpdruV2nPOg6TlwHV5ayxzzXMXI3/iHrWuqIdsypQeJdis0exCbF94Yc7f7euiD
         QuQg==
X-Forwarded-Encrypted: i=1; AJvYcCWO6Cjrwsoa+6O9Rd1hKTtSF+P0rc+v0OqB4JJoUlKoRSNxSrXJ3pC3ujY6PsWizcWhQV9vb6SUJ/ggy+Q=@lists.infradead.org, AJvYcCXuqUEhSxJ2uDH7rSXq1R0HsDHbThEg0FXyHllPRnSoLBZ3x7a/RK8UMGrONM6Jf3GGqxXSYN5IzjRKcmAF6jls@lists.infradead.org
X-Gm-Message-State: AOJu0YzOh9EqP/XNpbLpOsrfOmxqobjPnaIJI9DgpX0lKG1RQdoNlpDW
	I4Vn2UKJ7voD3PUJf774+z/V5i6OVL9esvCRFhpsihEh6W9hRYy8B6nYug7LlLVpWKY2h7FKdR0
	FjCJEuwrl0dHFEHfDBOnMH4fonsF3UD0=
X-Gm-Gg: ASbGncuhlwM3RgWy2SEXHFlgxMVhNak5ni+KKkxuQZ/k6kWE6nCQgIB6zkRkuQKPHOL
	p9cSXBYO9HAsXsR7LVJQwVno5xAREF4lWkfbEbsLu4xOCOngczyPgCzv+2eDNCDR8Yklvl75rKZ
	Gfhyx/eH8g4Xt9Az0fHNVGWC+dK2l610ObhAoMwyUVqyw=
X-Google-Smtp-Source: AGHT+IH6bDiCYOYL1uwyhCR37thkVbMFzWqTF1MJ7TonqI/9c72618WAPYRenRHgD5d7gIqLvS+7c3Y3eFAsHo5tk2Q=
X-Received: by 2002:a05:6102:50a8:b0:4e5:9138:29ab with SMTP id
 ada2fe7eead31-4ee4f6f7c8fmr1635839137.15.1751007174693; Thu, 26 Jun 2025
 23:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250627062319.84936-1-lance.yang@linux.dev>
In-Reply-To: <20250627062319.84936-1-lance.yang@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 18:52:43 +1200
X-Gm-Features: Ac12FXzKrRSpHCQX4R2-HXu3dI84IogjSfBJMN0ktRq8apwqIcoJ13xTkDhUr9k
Message-ID: <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250626_235255_944372_A8A5C2FC 
X-CRM114-Status: GOOD (  14.77  )
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

On Fri, Jun 27, 2025 at 6:23=E2=80=AFPM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
> From: Lance Yang <lance.yang@linux.dev>
>
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> can read past the end of a PTE table if a large folio is mapped starting =
at
> the last entry of that table. It would be quite rare in practice, as
> MADV_FREE typically splits the large folio ;)
>
> So let's fix the potential out-of-bounds read by refactoring the logic in=
to
> a new helper, folio_unmap_pte_batch().
>
> The new helper now correctly calculates the safe number of pages to scan =
by
> limiting the operation to the boundaries of the current VMA and the PTE
> table.
>
> In addition, the "all-or-nothing" batching restriction is removed to
> support partial batches. The reference counting is also cleaned up to use
> folio_put_refs().
>
> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe=
@redhat.com
>

What about ?

As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
may read past the end of a PTE table when a large folio spans across two PM=
Ds,
particularly after being remapped with mremap(). This patch fixes the
potential out-of-bounds access by capping the batch at vm_end and the PMD
boundary.

It also refactors the logic into a new helper, folio_unmap_pte_batch(),
which supports batching between 1 and folio_nr_pages. This improves code
clarity. Note that such cases are rare in practice, as MADV_FREE typically
splits large folios.

Thanks
Barry

