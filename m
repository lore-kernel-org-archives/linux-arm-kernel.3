Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DED3C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 19:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsdHMRa8GkCTW9AS++NpdtXRR4Sc7yKmVAWiCuBlqGc=; b=0LdXKxUgRgnqaZfD1+uyBUzDWK
	uJ93BufWQi600vp/ZjbdBoW2gMHhnDwp1B60XlAZ5O3WGfhfvTnkLrI80OyEx7wLmn9RtEGt0TpXC
	P4f/gBLc68YL/bHGUbZwdxPtLCS7bLfZNc+AVYc90Hlmmg5ogbnLWp6Ei1vbxPMv7Htq6UpR3fwPd
	1KYynggu/v128E1k8zCBtXbe47paIglqEKTrZe/Y7kAkfS+nynmCU/G7CwoQEwgNmwyk4TLtO/Okk
	osd41sq/lMPlJMtElUyb8BlLsmKeYhakMYo8V1IMcqh0Q1c408vU0qzBZlPHQYwS5TuVgSiBtVWnX
	RIz00TgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZbO-0000000GUUK-2MUO;
	Thu, 01 May 2025 19:29:46 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZZR-0000000GUJl-3FPO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 19:27:46 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-47666573242so53751cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 12:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746127664; x=1746732464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsdHMRa8GkCTW9AS++NpdtXRR4Sc7yKmVAWiCuBlqGc=;
        b=VR0jTAweqpVqsWzYJMWENFjAU9yF54AR9JZJGwrXgvSzu7SWKJ1DayzeVc1/CzNkfB
         6RBC3RsdyXlVmZP2Xf8Mq1r8RTKn3vzz7Yz5ZQdL4OJcvjNSBSkj7+QnUx6feurM9myc
         s66/jQLn9kTWTEPZathHKOC3ZZKRI85T1F3LezUaFpeNPE6ZbsXkwP3h+4h9RjJuYBhG
         Q74UxYJGgdY14UWOUpxykiLqFJljY+L1cKTVq5ybI+CiRjZM1KgUNlB1RFtT3pH7Rrgs
         a4tFf1ECXvBF3H9SHv/QaR9dMd+N7jVN+DdblH+eC74rkMO1OlE3VgUFq3CRDorn40q4
         Xakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746127664; x=1746732464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsdHMRa8GkCTW9AS++NpdtXRR4Sc7yKmVAWiCuBlqGc=;
        b=L7H/k2W2/C0t4kcNbycWdXozh3TZjfal1cKuw4H9lMlB2O5UqQK8tTBhc/STev/SVH
         iegzxNk//MHlEERQ4H+Yx3hRxJxOzRNMx5VoYB8BytqUdRzJRAfqvRZvp29lfxXm8YwT
         +vKbpRC/KYkLj5Wg3gUqep7SSt10kMVTuZT/o7jMKEAMofq65yOo9bIzeL7odXTrUBM3
         qP4AbY7qCzJmZo7069RLz+0oM0unCW3uxVO/s+sP2AZRbp5VUR9gOj3r8fHxFbTHLizQ
         otNRd1xFluW0vbw+XcgcazgrLB/TIQFiOhjgf6o5XWVmLMwT5iB/vqQec22vjBqMjT0L
         dKCA==
X-Forwarded-Encrypted: i=1; AJvYcCVUX9j8FQyWXSPflhPplxbhpjl7sC8W02PoPBr738ejD9ltjAo2SZD3bafcvltY3g8K9ou7jwX2iOVzNMznH0WO@lists.infradead.org
X-Gm-Message-State: AOJu0YwrLo5R2HuZbOjbSfwyWH6ukUE5dItM6uWDO0vKyehCZpj5KuJs
	sduzHNI1Mntiah/9v8cqHQEBcboGa2qza9aQaMOs+HicWbICiFIA9eCFLFrbs4IKSvbL9LcDfRe
	Xf6nbLZdDFg58JFyMu5aWmFQQM3VNeB+mO1Pe
X-Gm-Gg: ASbGnctbaegdv1WZdfJs+zirjCNuxo9bUYhJ4J4Ww2rTWIk2PQB7dpkjIGjUSE3YLGh
	UV9Wu+YP+YY9acVoCI4bI8aNIUQ8nP5d/4X6AGM+2Z62cXlyd/RymucXQ77tbCKhSQp3WXFtWWl
	wDxZvBjNTftl3YldBH9LVMA66mGVJsZJy9RsN5QRdRkw9OJsbH+s2l1js8
X-Google-Smtp-Source: AGHT+IGEYvRnZ220N49P6WowIdeV7ZMLCe1Ohy+RRvGTUY8QE/Mjht3NMEOKTlyUkZYJGE+AY5DQq5bo+Xh81NMJc/8=
X-Received: by 2002:a05:622a:1a0d:b0:477:2c12:9253 with SMTP id
 d75a77b69052e-48aea4670b3mr5562161cf.16.1746127664234; Thu, 01 May 2025
 12:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <aBO_laRsZDYgjEfL@casper.infradead.org>
In-Reply-To: <aBO_laRsZDYgjEfL@casper.infradead.org>
From: Juan Yescas <jyescas@google.com>
Date: Thu, 1 May 2025 12:27:31 -0700
X-Gm-Features: ATxdqUHbSRMwrhBZUMF2ojlrG-8kcb7B4aDa27SXz78tq394QFyw_svY2uWGfzU
Message-ID: <CAJDx_riW0B6wQb0U3EG5oEevorUaq0AH20zcJJBgq4yjFTTxvw@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Matthew Wilcox <willy@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, tjmercier@google.com, 
	isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_122745_820829_FB70617D 
X-CRM114-Status: GOOD (  19.83  )
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

On Thu, May 1, 2025 at 11:38=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Apr 30, 2025 at 10:25:11PM -0700, Juan Yescas wrote:
> > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> > and this causes the CMA reservations to be larger than necessary.
> > This means that system will have less available MIGRATE_UNMOVABLE and
> > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to the=
m.
> >
> > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
>
> Sure, but why would any architecture *NOT* want to set this?

You are right, not all the architectures support large page sizes and don't=
 have
the CMA alignment issues that arm64 with 16k and 64k page sizes have.
This change only affects arm64 architectures.

> This seems like you're making each architecture bump into the problem
> by itself, when the real problem is that the CMA people never thought
> about this and should have come up with better defaults.

This change will only affect arm64 architectures. By default,
ARCH_FORCE_PAGE_BLOCK_ORDER
will have the same value that ARCH_FORCE_MAX_ORDER (This is the current
behaviour). If the kernel is configured with large page sizes for
arm64, the user
can decide to change the pageblock_order or leave the default. It is
an opt-in feature
for arm64.

Thanks
Juan

