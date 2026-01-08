Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B41D232C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 23:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNHiapC99AUmMCJCO2j2w3ESAywZ8Y8Tno7kRjFgTko=; b=V0qOCZqr7s4JyvHQAiu6n+iw5j
	ABaE4YrNStAbJrwSHthLB6SWtrFYqS/FBFE4Wbwilw/DRiiEcKiqrAFStbkIYoT1YcVhtg/uNf2qm
	x7bh/Yrj+RTnaQnhjdHlTVC1YQggW+pdElMetXFu8OhHRYavVVacLmxsUs4kWSgrn3epX8xwXjZSs
	Bl9B73UwBmx2vzmr5vcn+cKlzyBFJ8eFPUdhcblbXgd34FYb3PXaVb3VRDzfmpajDqulSMTF/xwz5
	+BrSHRZcAcnUe5xsPishI6xHo/ZT1935SF1361LVMBYd0mBgCX/0tVwP61SyR5cY1YngjtglZfv/9
	qXV3mOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdzAD-00000000z71-0xCi;
	Thu, 08 Jan 2026 23:11:33 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdzAA-00000000z6Z-0Fy2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 23:11:31 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8bc53dae8c2so514139185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 15:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767913888; x=1768518688; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNHiapC99AUmMCJCO2j2w3ESAywZ8Y8Tno7kRjFgTko=;
        b=iLzXYVDu9r7Y2yfX3/cDFhQ2Yo6bltiGcVcBcxlgILcT+7J7zF5wumgXEGgDelO74k
         wZyzAWBrTeHQgUuMfPv79xvkKcRRH6OTToDgY+57fgBh7mE/0UdE9oS9q8j0kWA2/n4F
         NO/znTuljLT9GgD7rtYVUliWQRW8mE8GhDogry2Raul9zD8R7ZsJrw3AQ3WubujGE1pb
         9jp2A5KkagC2Qw17CW3/8zwiO67LU/V0AYxoegf5ZQWhpwuNMr8/ABt/uoljniiHhCCn
         bRSSbLa50kjQHvU2W6+mDMSwh3Zsh/S8I2CqkOF3dWJtVmbmZChvlLViLIdGx+yA+I5D
         7pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767913888; x=1768518688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XNHiapC99AUmMCJCO2j2w3ESAywZ8Y8Tno7kRjFgTko=;
        b=gPahhh9noijBwIHgJBSnKGznpfplUJF/0OmXV3rrX8MoUiuc+l6bAVDaFLArS2wQM1
         TB0RUH+Q4Ppb//PSwHnrWowNgKNGzVGwAT0eOyS68akXdYhnc3H5KvBMoJKp+V8kMhZZ
         Zi85ahXdAKieRoYaXVZoflsq18/YaPCuIwNcnntP5KedyJkmVBLOgPr3ZzVkvo1JTZzR
         7k/dq3mB/9olUStNNcpvGLHDaXw9ng0i+89oFf4NBJNvHhkdRNkBQTGSbn+p/sP11tbk
         rpAITyAUWUYRaFe9nrp3ns1RATqOQGS5c61UWPNUvQ2KxlETsrYjcVUV1jJUJdOqSbL+
         UOww==
X-Forwarded-Encrypted: i=1; AJvYcCWgscJ7RPYGo9TZl549H0UAIB/mumapSLUtQFtwkLNmQgpeXrsF9x1SLTPLFWV33ZvJxvnZP5L2RbMjbJVdsuTi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+lkBb4DePmkkGm2blBFQ6NPg63H2Y4cRZR0Z5AM9mOdw/u2YF
	950MUuP3WI4cgvEr9751kITdc1Fne1v5Wk3L34CVB3J9KI4QwM7UPmCaHXj98++r/HXhAei6awe
	Er4mTvo/0FPPwrmBVKaGxBHR/ToRlevo=
X-Gm-Gg: AY/fxX6crchcH0oEv8lpvX7E5NmeCf+bqFR52OoCPUyb1Es8Z6Z3sA8s0PnH1f9v54q
	JqnFnW0tGx3WSradRf3bpLHyze00GrNVpTDkwnfTnAA5lnpZhZyqw7Wz2kqb5El0v+bXCOJ+OoG
	NcSx3zIchC71hzUXzfpX8A9m5KV2gzLcGZ1nvhGHnSBKA5suPrr5G2P5+QliqrGb13yUnblWDAy
	RxymAlBRqfmlYbGno4C5ZeZcGHZ+4myKcV0n6AEJEHwutBO5WAyLauysarvpD3fg8GPiA==
X-Google-Smtp-Source: AGHT+IHEQByyNRJTAQUFNu5ThEW5eQaRzASnOQJZkGVdn8HLtXQvJ7O3wifM7bk81elrzagRfPQdaGca+MGBg/P0j8c=
X-Received: by 2002:a05:6214:daf:b0:880:51b9:e8b2 with SMTP id
 6a1803df08f44-89084275dc7mr119405186d6.48.1767913887593; Thu, 08 Jan 2026
 15:11:27 -0800 (PST)
MIME-Version: 1.0
References: <20251226063759.4020782-2-tongweilin@linux.alibaba.com>
 <CAGsJ_4zd+SMa4Mj23tjF5OwsP3LQyvYTrwN4y81=k8FSFgbH3Q@mail.gmail.com> <aV_3fxlzwOSz8B0t@willie-the-truck>
In-Reply-To: <aV_3fxlzwOSz8B0t@willie-the-truck>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 Jan 2026 12:11:16 +1300
X-Gm-Features: AQt7F2oHOKrzfSL2LssjsEfQPu4bcd9R3NUhDfSnV_B8eZokCpQo4dn2s21CDqQ
Message-ID: <CAGsJ_4waQsxPKTcGvtpTAF4kVbYQXeH_iHaQX3aAYDNo-8oDLQ@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: Kconfig: enable ARCH_WANTS_THP_SWAP for all pagesizes
To: Will Deacon <will@kernel.org>
Cc: Weilin Tong <tongweilin@linux.alibaba.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_151130_116685_74D6ADA8 
X-CRM114-Status: GOOD (  15.38  )
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

On Fri, Jan 9, 2026 at 7:29=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Dec 26, 2025 at 07:52:44PM +1300, Barry Song wrote:
> > On Fri, Dec 26, 2025 at 7:39=E2=80=AFPM Weilin Tong
> > <tongweilin@linux.alibaba.com> wrote:
> > >
> > > Currently, ARCH_WANTS_THP_SWAP was limited to 4K page size ARM64 kern=
els, but
> > > large folios requiring swapping also exist in other page size configu=
rations
> > > (e.g. 64K). Without this config, large folios in these kernels cannot=
 be swapped
> > > out.
> > >
> > > Here we enable ARCH_WANTS_THP_SWAP for all ARM64 page sizes.
> >
> > I no longer recall why this was not enabled for sizes other than
> > 4 KB in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64"), but
> > it appears to be fine, and the swap cluster size should also be
> > more friendly to PMD alignment.
>
> You seemed to be worried about I/O latency in your original post:
>
> https://lore.kernel.org/all/20220524071403.128644-1-21cnbao@gmail.com/

Will, thanks for pointing this out! With a 16KB page size, a PMD
covers 32MB; with 64KB pages, a PMD covers 512MB. So, Weilin, are
we ready to wait for 32MB or 512MB to be written out before
memory can be reclaimed? By splitting, we can reclaim memory
earlier while only part of it has been swapped out.

While splitting down to order-0 is not ideal, splitting to a
relatively larger order appears to strike a balance between I/O
latency and swap performance. Anyway, I don't know :-)

Thanks
Barry

