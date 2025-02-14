Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7028C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36JVfaYsMA1yjpWbwombcPibEH3++Dm1p834NYi7GjY=; b=Q6iBQEfGZDPLMjUKyQqTaCPrIS
	DnGi2B3C+lSIULRydDPW7YVstm5j6Kqr5R5at0Fo10p0Eo1nyAhQAeYOtWHDH2QYjIP8AjpCqOrdq
	JfPbn0rpyrlXIJE9t6RIIk26C9YzYlYi5JL1gjvjh12+Bycbo+/vRdFsDwBsf39O7ci7xdBkombLu
	g8T/fLUMcCTKmlthldb/7wGN7/HJAI2B9gd8FqI5416mcEPzbaQTfi2ZR3DGB+UBu3bDx1/qWZ1o+
	lyTU6FShMCvQWpNpxNfwf0bXsG2+4RhZYFTRtcJumBfBYGBrlfa1AXEYry+RJK9At2N9VhyxN9ld7
	c37/TvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiv0p-0000000EraJ-0iC2;
	Fri, 14 Feb 2025 12:41:43 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuzM-0000000ErJu-1zyo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 12:40:13 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5ded1395213so2869653a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 04:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739536810; x=1740141610; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36JVfaYsMA1yjpWbwombcPibEH3++Dm1p834NYi7GjY=;
        b=iokgK/uUYgxYATkIGjqyf/bOCjCssIUdlTJu9E3Yb/opZeIy46eI9KaTXUygpohKFo
         IB/ZvXp/pYW90jB5l+GK+W3NJHH1z6eub5WKeCzoabwBH5F0+zL1L18lsA0sKTptNugo
         gCvLeJo/G2Y9xqsSUrKKmp+FJZyX+YKRBC5ahuZyDJbVi5SUK20YADFIWsNu1lIhWIs4
         oNH3A6fan0FYKkZfH7NA/Gw92kRog4aZJNo816yhSKQVPdG0/c4tJdtDPMQfni+cR8aT
         YMpOIQW9cl4H3vwnQoNPaQ+9w674OewZ3ZLjWWkV4ouOa6Bt4pjtp4uvFLaziM3ZiOHL
         3/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739536810; x=1740141610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36JVfaYsMA1yjpWbwombcPibEH3++Dm1p834NYi7GjY=;
        b=hEcz+oaCXgESXrRaDNeLwwouMdCDIoGvEioqMG0F0wxeMSNhz4y5GdngHn1STQKpT2
         Oka2YTkfvf01p0AdBkgJD8wGi21EopJtxxbDeYR+P3oGEranGlKPnGRkifycx6JyWtjm
         o6jcvbxhR/j0vmR1PPzKrw9Bt4hMC7ER0WW3jauqOiUimCkcIgqyL9naIu6HgZzBo4wv
         KIRZAj1qPnxgs3vtL7x5LPs3gqSRhMTOfnQU7buMQMWsMVIwm5WMK5pMYXJ3HZ9JJPZh
         yqSu3rWPuXq2deVT3mroiZqSo3O+HoslT0Kckb8yFqGLkayCmX1kIcugSLlo59rKmCD9
         g00w==
X-Forwarded-Encrypted: i=1; AJvYcCXLOOUq+cgPIX9jB2GAqFb5tKfekYv00HJG6bhCmaTlot2BjJ8bf58MYx3/RlV3LN7zN5EpW0SbWMtlWBRrq251@lists.infradead.org
X-Gm-Message-State: AOJu0YyRZMdBUXfrVo0fxNZHclSuK2TpqTym52y3A3QyxOe4HpkgiIB3
	IsG6cLDmqEL+AJJ9Nuk4Cg1DDYpbu3uuKRtIV7bKA1fNwe0oPlX6pFxWp75bNGITKPC4CfCf3so
	67Mr5ovdySPORjk3K522sfEtYN63Cw4RFfWC3Tg==
X-Gm-Gg: ASbGnctYcIvf97xRjUb1sxOOcWrraybE3njaarLzobboL2FUn0hOMqsy5CMy2Acs3iB
	kFcXqiK5BtqogxYCknp+CtkMT7YNNBhzE6t4/M2UIaPRnE/35t2XJKgLQJTwpO/zdTjrF7MlxtU
	7z+ROCk/GpRPxYEIb1Lk/kt2oMjwXHPQ==
X-Google-Smtp-Source: AGHT+IFINGXcloPLWY70sK+aKs3hrkvh5XEIarAY+7Qnm9+bPaz2Y4r4q5IenGXk077X8b2/k5JVm3DlphyYM3UHP04=
X-Received: by 2002:a05:6402:2788:b0:5db:f26d:fff8 with SMTP id
 4fb4d7f45d1cf-5dec9ffa08emr5908259a12.22.1739536810465; Fri, 14 Feb 2025
 04:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
 <20250127093530.19548-3-alexghiti@rivosinc.com> <Z5ePZt61CM84Hb36@casper.infradead.org>
In-Reply-To: <Z5ePZt61CM84Hb36@casper.infradead.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 14 Feb 2025 13:39:59 +0100
X-Gm-Features: AWEUYZnHz0DxGK1Ovcy4paeZs4bS-kYqEUuZDZsciI4W-HbFUkIFcKN0yQFuh38
Message-ID: <CAHVXubhf7aMwsKA0H9OvTg2Lk8U7+bwntVT9Cm-7L4o7=LM4TQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] riscv: Restore the pfn in a NAPOT pte when
 manipulated by core mm code
To: Matthew Wilcox <willy@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_044012_517921_CFDCF1A3 
X-CRM114-Status: GOOD (  25.54  )
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

Hi Matthew,

Sorry for the very late reply, the flu hit me!

On Mon, Jan 27, 2025 at 2:51=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Mon, Jan 27, 2025 at 10:35:23AM +0100, Alexandre Ghiti wrote:
> > +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> > +static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
> > +                         pte_t *ptep, pte_t pteval, unsigned int nr)
> > +{
> > +     if (unlikely(pte_valid_napot(pteval))) {
> > +             unsigned int order =3D ilog2(nr);
> > +
> > +             if (!is_napot_order(order)) {
> > +                     /*
> > +                      * Something's weird, we are given a NAPOT pte bu=
t the
>
> No, nothing is weird.  This can happen under a lot of different
> circumstances.  For example, one might mmap() part of a file and the
> folio containing the data is only partially mapped.

I don't see how/when we would mark a PTE as napot if we try to mmap an
address that is not aligned on the size of a napot mapping or does not
have a napot mapping size.

> The filesystem /
> page cache might choose to use a folio order that isn't one of your
> magic hardware orders.
>
> > +                      * size of the mapping is not a known NAPOT mappi=
ng
> > +                      * size, so clear the NAPOT bit and map this with=
out
> > +                      * NAPOT support: core mm only manipulates pte wi=
th the
> > +                      * real pfn so we know the pte is valid without t=
he N
> > +                      * bit.
> > +                      */
> > +                     pr_err("Incorrect NAPOT mapping, resetting.\n");
> > +                     pteval =3D pte_clear_napot(pteval);
> > +             } else {
> > +                     /*
> > +                      * NAPOT ptes that arrive here only have the N bi=
t set
> > +                      * and their pfn does not contain the mapping siz=
e, so
> > +                      * set that here.
> > +                      */
> > +                     pteval =3D pte_mknapot(pteval, order);
>
> You're assuming that pteval is aligned to the order that you've
> calculated, and again that's not true.  For example, the user may have
> called mmap() on range 0x21000-0x40000 of a file which is covered by
> a 128kB folio.  You'll be called with a pteval pointing to 0x21000 and
> calculate that you can put a 64kB entry there ... no.

Yes, I agree with this, then we have to go through the list of ptes
and check if inside the region we are currently setting, some
subregions correspond to a napot mapping.

Thanks for your feedback,

Alex


>
> I'd suggest you do some testing with fstests and xfs as your underlying
> filesystem.  It should catch these kinds of mistakes.

