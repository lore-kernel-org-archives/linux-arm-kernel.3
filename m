Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3459CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRF9H87K5QIT4Svr4fUlCXS5KMOpnBU2HG563g4pVCA=; b=xlTG0GN7Cm5pFJpDWFa2TUmZTg
	Lf2rD2Us5kBZP66YRes1m26sF7o9c9a/2qrdlvT17Km5vOshRwkXXydtdq+AucsNonNSpQQ53/ELQ
	OEiM11lsBOj+QhYwl/yHDlJtLi8wYorKjmBioFl+0470s3YTENHFTRe2jMyxgm+GTxrnZ4HZCLC1a
	NuEhY7riO1xjfCGsbAMGuhrZl+JYVsCEq0k/6MIBSkIpsIkWpHpEzqvZEr490CWUSt4Fmx60gpEZk
	8Z2KVSNjoGFWSSH16RG7kR0YNFhrg5KrcsTL8gm1lm0q+g0EBKL658NJ9NWDkPjbZCFoknW3LdVAT
	ngk3kTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhdo-00000000GL7-3mpW;
	Thu, 12 Dec 2024 11:46:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhcj-00000000G9c-1hrn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 11:44:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B85FA42749
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 11:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54EAC4CEDF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734003891;
	bh=HyXEfR+D1qnH4DNim5iPlsqxtl1hQOSDGzR8IuOmMmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fPVHzzklKAtNaesDcx4kEA6JJe7qF0gAtQ+lyM0+rzHG+KCVlpZf3vzArk7zEA53o
	 Gt+35JvNWvwo/xhxqixJqDj/tZBM8RO9wWJ44tb1FfOUxgjn5oFyerYP7qXENa0ryR
	 sgx68Ii7huWdLrsabV78RwP6+V9ESMajRr3jr/K/9SunzG9mCtC74SCjRMgCLDvOfO
	 tASeeajOMdDiMm7qYekZJ3vLimWrG7clYiJ3kSJ8wQ0kWZUF9VFBEwxup8bv+y6TfR
	 pDJsKh+LVrn1xmVxXmBlq7Va14nKfluK+lExKokL7WW76JIGfqO6gptdmeEGG7/i2w
	 +SUjF0toZAJqg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30229d5b229so3912181fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 03:44:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDFD2GarGzf7ajA1cjbj3XAoGs8OId8zbwtKkr69/D0svzwO72OokQ/fPLFqAgHV9fuiw/Q8DBdzTd1w93ETE/@lists.infradead.org
X-Gm-Message-State: AOJu0YxZYdA7e5NoVmcctWfMiSnHDmY+PNIwugrUezLR4dg3bdPFP5HN
	84rpCZJ16pWFye08azcTbjWmKbMqFSJUFTmlY5eMmnYNsZYmHhErb1/vB7G+Covz2QUdWefzMZK
	grOB+5bt94PcA2GEDYTeMGmawl5k=
X-Google-Smtp-Source: AGHT+IEbX5tqLnIbrK2KEGYQZQxlBqgxXKYoEGIDV/zv3l8JcHTRnWkTERVd8YDrkMv47zVzM5r8d0CCEZeG/SsqelY=
X-Received: by 2002:a2e:a586:0:b0:302:1d7a:e09 with SMTP id
 38308e7fff4ca-30249e830a2mr8588641fa.31.1734003889992; Thu, 12 Dec 2024
 03:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20241212081841.2168124-8-ardb+git@google.com> <20241212081841.2168124-12-ardb+git@google.com>
 <Z1rJ_dMJJzGOmjNs@google.com>
In-Reply-To: <Z1rJ_dMJJzGOmjNs@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 12 Dec 2024 12:44:38 +0100
X-Gmail-Original-Message-ID: <CAMj1kXERuRK_MdHJOY+SKR=BJ-Yi+q0FNgVayq3W_jL9zdjLVA@mail.gmail.com>
Message-ID: <CAMj1kXERuRK_MdHJOY+SKR=BJ-Yi+q0FNgVayq3W_jL9zdjLVA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] arm64/kvm: Avoid invalid physical addresses to
 signal owner updates
To: Quentin Perret <qperret@google.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_034453_511876_205A9312 
X-CRM114-Status: GOOD (  15.99  )
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

On Thu, 12 Dec 2024 at 12:33, Quentin Perret <qperret@google.com> wrote:
>
> On Thursday 12 Dec 2024 at 09:18:46 (+0100), Ard Biesheuvel wrote:
> > @@ -908,6 +892,9 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
> >       if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
> >               return false;
> >
> > +     if (data->annotation && ctx->level == KVM_PGTABLE_LAST_LEVEL)
> > +             return true;
> > +
>
> I don't think it's a problem, but what's the rationale for checking
> ctx->level here? The data->force_pte logic should already do this for us
> and be somewhat orthogonal to data->annotation, no?
>

So you are saying this could be

> > +     if (data->annotation)
> > +             return true;

right? That hides the fact that we expect data->annotation to imply
data->force_pte, but other than that, it should work the same, yes.

> Either way, the patch looks good to me
>
>   Reviewed-by: Quentin Perret <qperret@google.com>
>

Thanks!

