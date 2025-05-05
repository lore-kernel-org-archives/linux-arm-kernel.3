Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DC0C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 19:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRmVHK2+NwuLbtog1GptT/EFIvFprytb2WBcRarQxiU=; b=bO9PziY8Wygfn31lOzdbE8t1LP
	nO8Nsa1nCQbb7BFjb5aYymLYwRAjc/HfQO+hhDsbHS93I2bxZcS0zSYfrIp42QGu8fx5GjZvyHafC
	IEMusEshMIXuEW8lWuxosOfujEpokEGLnqVDXxYAJmXujYrd+RBNTuNZ00EEjvyDUduPRC7lq/euR
	xL8VNDsjnus6gJu1BXFM+wq53XQXrtVQfH1lDdF5tKZbHYi/fcR5J6yS7O1cmVywiY8emFxILRxu6
	5nRYdcn2F1Kpa/5kYK1ZLm5EyPezRPjgMy9g3bQNLV/uwwypYvsUMq/P7vMdnjEsuBFO1jM3RRbmM
	ZRXHXfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC13U-00000008MCZ-19gp;
	Mon, 05 May 2025 19:00:44 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC11S-00000008LzT-2Chx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 18:58:39 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-47666573242so60251cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746471516; x=1747076316; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRmVHK2+NwuLbtog1GptT/EFIvFprytb2WBcRarQxiU=;
        b=TtWTSKuhAHEYB9xKn968wVBIEAi8HKUNg6mAl+HO3uruHlGDaoMkKMj8B8vsyv5Ulw
         6mTuA3mXnIA61mvOfLcghpq4fsaOnGrsw7ty2mU94u3MUhS8FEnSzTlX9/DHmOProsua
         8o2xlk8CWnYC05jkJIKBnnEtX5rOmLJbW1nR2v4kBEXgn1NCeS5sQdmgUST6U/jgrSzD
         yOVIhL1/B869cLXXvI4LRmTvjkINMHxYYnvll4DCxbzO0zi9k8GORbPHq4SU08qVaAoh
         RnxzU8ME4DMlNWWMn9GXiB95gD/CZKcjty9aGZqtY2uOWI2MUA8ny4oQE8K+OnBGjoZ7
         FL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471516; x=1747076316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRmVHK2+NwuLbtog1GptT/EFIvFprytb2WBcRarQxiU=;
        b=lbVjpTZ47vYJE0vkWi+ZjCvkUc8Z8rVCiipoTjtj2ayXR8tWMuzK4UnA030FMUHFra
         4f3nHfF6r2SPdfoeDFwmwuXnX88EYnDxZkNtCc297EQP0SqsOR4oS14fJao6GMaFCxlo
         pHBlJpJ3BHsc30ajhZZoWkswWNlnoTVhz75LhsL7euc8ckGdpSYB9u34SoNU91aq+2DI
         BRED3ZPEnNCLAMqOtpZy4oE6aeV3DbyiU3ky3PsKKsOdNLx35ftKr/N8LZ5gC/27KwfE
         TFD7625MzzXrN5LmBdP8EQXenJLpCFYSDrzeg3n6KP5skUacbsEAl98YPbTCTVj/lmPX
         GG+A==
X-Forwarded-Encrypted: i=1; AJvYcCWPTQnpdwzQ8WchDG/jEq4TACUFw/j5uQHktoUjNGd2SWQZoV7WuIS6+b554gaRnQhFZ5bCig5VfAMpU9WypYE9@lists.infradead.org
X-Gm-Message-State: AOJu0YzRpPdI3mhs077x5vqSJGmCwAyiJCfNKs7Z8LqqBlKhJa8wWE3R
	rAFNTREj/GAqjI8cBKBF/j4FaAzc3Bt7m44pXMmwN5INkCaEbxLl9WrzF8bGCpgOp0IKQeS200z
	gBQ1x+y6FgjLVOJ94Mr07JcpeXMYxD8hZAx19
X-Gm-Gg: ASbGnctvV7CJ7ZGlEse2y5TY6JRIVI7KaoDNUOeweC/VQ9ZiDK9iCgkT+cVhsrSqije
	Hr7RzFO6OTmYEUkfikKLmzIoVu7U6OEACmKzlyL118RHhGSQMCvT/emDTXnzW9J0R6pjBE9Qn+X
	6gVbXkkSZQ275FcD95GfYq22wjApoPylI0kZdZ9fc9hKbMb04/AqZgm+T5qFceJruivg==
X-Google-Smtp-Source: AGHT+IEABWhD44MNjd25Nwa4A7Nm8LFtjVaBcJRjwZJAzXYNaj9wKDcCI9e1aiwC4/RYXDL+3xjsgQVqDX38dbN1Rb8=
X-Received: by 2002:ac8:5a42:0:b0:48a:7cd7:7e21 with SMTP id
 d75a77b69052e-490f5fc02d1mr521281cf.20.1746471516083; Mon, 05 May 2025
 11:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <aBO_laRsZDYgjEfL@casper.infradead.org>
 <20250502113733.GA29622@willie-the-truck>
In-Reply-To: <20250502113733.GA29622@willie-the-truck>
From: Juan Yescas <jyescas@google.com>
Date: Mon, 5 May 2025 11:58:24 -0700
X-Gm-Features: ATxdqUG-Wvi24xlhQTEXoMOm0zo_oHKG_ly7RZJQAmPNvApha_BnNHX2sd_q3Mc
Message-ID: <CAJDx_rjJzWv7-WDyQHDDOig1Qo+FAayGgUM0k0U+aBFxXALhtw@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Will Deacon <will@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, tjmercier@google.com, 
	isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_115838_565578_69E80186 
X-CRM114-Status: GOOD (  22.10  )
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

On Fri, May 2, 2025 at 4:37=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Thu, May 01, 2025 at 07:38:13PM +0100, Matthew Wilcox wrote:
> > On Wed, Apr 30, 2025 at 10:25:11PM -0700, Juan Yescas wrote:
> > > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerabl=
y,
> > > and this causes the CMA reservations to be larger than necessary.
> > > This means that system will have less available MIGRATE_UNMOVABLE and
> > > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to t=
hem.
> > >
> > > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> >
> > Sure, but why would any architecture *NOT* want to set this?
> > This seems like you're making each architecture bump into the problem
> > by itself, when the real problem is that the CMA people never thought
> > about this and should have come up with better defaults.
>
> Yes, I agree. It would be nice if arm64 wasn't the odd duck here. You'd
> think Power and Risc-V would benefit from similar treatement, if nothing
> else.
>
> Will

Thanks for the comments, I sent the v2 version with the changes:

[PATCH v2] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order

Thanks
Juan

