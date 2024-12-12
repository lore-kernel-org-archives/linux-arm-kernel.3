Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CDAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpCx9eEDDQPBSqjdyYw4LOrb6jdU2YEGsy2eXplgVns=; b=y3AazSdsiykx3ZhT58Yg1RJUk7
	scFaxa/EVc43VcZz7XgcET+FDe5wJ8TWYNY72mf0Cd0FipTGxb+o+IY/v4Y0Xm2PtwE3t5ewo1otT
	DbHTPSpn7+0HGt6BbkKT9YAc8hok9wLy1FsULqnaGF/IpULiVgdLJM31UWKImZ1wQO41X0vxMymNK
	PwqW/pn9O9QNcEc/DsKjI2oVmeG3wJGmGBHjWJ7Ilvk9Vgx1uzDS9trxqBflIrH4txrgTbXZaEw2i
	JsqmeFY+4I/wFJd8kF8JPgrqzrH4AiWbYFEEp45iLQFEkj+X1igW/AbInJVg6WMp9ICg3AmLNqt+E
	lVq5W3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiIo-00000000N6Z-1kx9;
	Thu, 12 Dec 2024 12:28:22 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiHi-00000000Mzn-42gY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 12:27:16 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso97138866b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 04:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734006433; x=1734611233; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpCx9eEDDQPBSqjdyYw4LOrb6jdU2YEGsy2eXplgVns=;
        b=V8Y7tuJRP9cT4hmc8xcNeG2TEhIcAXqZy+3eNPAqlH/HYsBwNzSm2sOYlkf167xbTl
         dhPzfnPlLPAMQUEZIgyz/AznFjvfH2E7W82pq6E+jVwfx9E55xygB0yPw23m3mF4lHlk
         Ps4ow0eXOuif7JrgTHIGKcyE2FR6ykdNn4HT/Smgf62nHY+uopwl97L3GoRZ8nvwLW5a
         1x+FIiy5i4+5QQCyLjbW86h0U36BxEGUfm6ic94Mfd+UMGmixy/QHUHsfbwpVzZCboJ8
         E1CuXiOe34J1e4Mx7Sluu0zW71ahlR/KM4DjIvLR1KWT7ShcScxymjsHq98zQCyhfot5
         IBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734006433; x=1734611233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpCx9eEDDQPBSqjdyYw4LOrb6jdU2YEGsy2eXplgVns=;
        b=GgV8Wo+59Re8YfLxJOopWnPjjbsLLergQhoSfC/Ol5k1EH7ABhDJgiElY+z1Vnrt6p
         86C16XaiJ7xbSo5n1o9l79OAM7gdUXhBGYOK9KWl1xj/fGCgyN/lSB7bAp/T317mHncA
         ftvZy05lzbUXvkWvN7mTdo4R833zYtWdkki+suXbTTo7201ii9VWqhE4wAAdEqyMZ4Ub
         8gtds+IFiWiK8aF6MVRBw6/LAK03igxG170fs2MFu6q8BV3h6Fy1MEVAoACxboMz7cBQ
         uinRIParipDqEYji67yfARggGIHQsV0Tn9xBkdvHQEwjcwyWbfUmleIKRAc4Ih2G+aiU
         7DgA==
X-Forwarded-Encrypted: i=1; AJvYcCVTsMC2Iz82EQPqKGuFTEBDnZZpqu+GhgnDOuQeW5/uZBBqTfTKdxna172icr+j918+XEfCqbaymaKDM03RTVmg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk0QPjJ6d53JLunjThFGk7IUWFbMODbpSdQqJgxm/+B+8WkK31
	vEOHYlqgNZzyMmNkrTsc7MppbhBiB3wilSrgv2178fS3SsH4Efm3RqbQNyMpNvvZnaiPLDP1TqG
	z77jI
X-Gm-Gg: ASbGncu4VDYkDLyZ1D7CXitvokf66JD77+JpqTEgyg2e6mnjZiAwWBx6bIEI2EX1pXZ
	mHqSCFOuiToR7Fhax7VLmDlpg9ukSr2zwufxlzi0P77cKbilcFYuHWvg1n8+2v32xgHJ6dikxyT
	XMinjTHu8aGDi1TVJXVaay0n38Uwc/V9XRD4v6coAEYvBfls97XflIybp4D5NhzXGyURZ6efd2P
	Ls9b3jbzs1LWfhyox8YQQKoTshyf0ims6KMQiBLzCkjVT+nVc8wWO4HFi+RkpyiBvteU1pRULmU
	zJK5NIL0+204ty8=
X-Google-Smtp-Source: AGHT+IFFYyzPYoG7tPh7WgbnFd5v9cmFfs7rDc+kSSl50Gc/6DepQiqRz3hckPhM0D2fVycpQfsYQA==
X-Received: by 2002:a17:906:32d3:b0:aa6:967c:9aaf with SMTP id a640c23a62f3a-aa6b13da9f7mr673167866b.50.1734006433119;
        Thu, 12 Dec 2024 04:27:13 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67c7bd55fsm657911666b.116.2024.12.12.04.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 04:27:12 -0800 (PST)
Date: Thu, 12 Dec 2024 12:27:09 +0000
From: Quentin Perret <qperret@google.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3 4/6] arm64/kvm: Avoid invalid physical addresses to
 signal owner updates
Message-ID: <Z1rWnejzN5Zk8TDU@google.com>
References: <20241212081841.2168124-8-ardb+git@google.com>
 <20241212081841.2168124-12-ardb+git@google.com>
 <Z1rJ_dMJJzGOmjNs@google.com>
 <CAMj1kXERuRK_MdHJOY+SKR=BJ-Yi+q0FNgVayq3W_jL9zdjLVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXERuRK_MdHJOY+SKR=BJ-Yi+q0FNgVayq3W_jL9zdjLVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_042715_000293_1C5C366C 
X-CRM114-Status: GOOD (  17.86  )
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

On Thursday 12 Dec 2024 at 12:44:38 (+0100), Ard Biesheuvel wrote:
> On Thu, 12 Dec 2024 at 12:33, Quentin Perret <qperret@google.com> wrote:
> >
> > On Thursday 12 Dec 2024 at 09:18:46 (+0100), Ard Biesheuvel wrote:
> > > @@ -908,6 +892,9 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
> > >       if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
> > >               return false;
> > >
> > > +     if (data->annotation && ctx->level == KVM_PGTABLE_LAST_LEVEL)
> > > +             return true;
> > > +
> >
> > I don't think it's a problem, but what's the rationale for checking
> > ctx->level here? The data->force_pte logic should already do this for us
> > and be somewhat orthogonal to data->annotation, no?
> >
> 
> So you are saying this could be
> 
> > > +     if (data->annotation)
> > > +             return true;
> 
> right?

Yep, exactly.

> That hides the fact that we expect data->annotation to imply
> data->force_pte, but other than that, it should work the same, yes.

Eventually we'll want to make the two orthogonal to each other (e.g. to
annotate blocks when donating huge pages to protected guests), but
that'll require more work so again I don't mind that check in the
current code. We can always get rid of it when annotations on blocks
are supported.

Cheers,
Quentin

