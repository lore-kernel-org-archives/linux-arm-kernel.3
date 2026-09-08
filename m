Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9707C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ar1cqiUGIhblAbeFXXUvhYbgZ/09secUyh9OrIqbTXI=; b=PTUR/gqtqrftxSep3okbb/ao8x
	gyevznDkgGUKNOtScIyqcaJSWLMgGj5LXDGHFsmVi1buMoGGXBGt7a5yEHgZi2qo+0uECp0/a+7Yz
	EYwnY0B6UtAdn6iMZGl19MAElM4cqFuG1T6fHHsjvu9uyJFUoFwm/j+Mk+4yGCzv3094zdU/nettX
	KqgqrxU6lY2t3y7Br0H6P0CNOSQf7sTs5P0x/kkogufW9n7ezQDDvN8XpLY5u2PoZhsB2EfQClUyn
	Mgmwtbi8fNI7mpyUoDzWui+tmgkWlNCdia667NTWTgoPZWa6yRsL5iC6FDNL6xuSJGtl2F0fcaAfV
	s7LfZbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yoX-00000009hPV-0ngA;
	Tue, 08 Sep 2026 16:36:53 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yoU-00000009hOk-0COG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:36:51 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-53012819c04so607231cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 09:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788885407; cv=none;
        d=google.com; s=arc-20260327;
        b=LBsUgV6I3lX+NfVkh6j1ptOFfe2Bq5WbVZP6m8U0IUKDx8DeqLE8TDbF0fkekCPaia
         oxQBTNZXjRzPFPiGQCC3sgJGNpaT2hK99LYyygftBZS2e5wPDg8VpJ4oeTBMv5TKZUx9
         l3hQJuG+qpEYqQf3FILNyU7zDM6XHmyQvhmFulSLF+lJFgXl5Huoi7ZQUM5YJqc0qA0K
         kXqe+5RYCeRTJk4GBx2sDGoX8C9rN3gr4YWupNBmTS4EJWLcZVynZQHt8qtiooefNO5D
         RH4/uZXS6LwWk2+TueZtv+Yxu9QfLW0OWMSwD9buLKs0WnuB9xJEsDV7vF1AOf8vwo0b
         OOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ar1cqiUGIhblAbeFXXUvhYbgZ/09secUyh9OrIqbTXI=;
        fh=/ofiEQOaRZ6UaRZIfIGLjPDWJlJuwY3iJKHSoDZTGZ0=;
        b=dbFwLJKRHwug+yswYN3vJi3f0iFG8voGAA4rGQwIBchg3asjPVh8M6/izGgO+ZrycB
         xVX/bJPubb0ZFn65eTngGKe2AoZXUIhKnLcuOluKlKJGa4qeSiiZxtHLvRbCtIMd+qhU
         iqWc+wtFFIsnm0hmZcRG/GJy364vvAo6Mf1en2NdHTsXSLZ/I+qgThNC5muN7o8yyR4v
         Bznx5WVGXGtpnJHgTiMCPo+ZQlmrCRljsVgNPLM3WUxt/Key47Q9ViVPq6ACIXVuGcY3
         FvJyW2Et/TqYHyqOAQpIg+w26m3ytcA9fiuTCf2YXvG5yunLWHFDFQV16BNcLvpJHlXK
         ALew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788885407; x=1789490207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ar1cqiUGIhblAbeFXXUvhYbgZ/09secUyh9OrIqbTXI=;
        b=ZFezQVg3BHHJpl06ppeZX/E2pQkndCoRItxWHyXmdE6/ABdeOXgEmgFkL4coL6osO8
         OlHR2AMX2ufcNaVDgsIZ60LVxSf06QrYZFk+d1DTQ5O8T9mxUrBKw/hF32tHhr8IS27P
         qP9edOSAeCJkDj/nNHru1Zs6HIt/dVATQ/OTSUBQSrNSbIsG4fU9Lq6wAnf2Uo/KHm9t
         /qQ0qart2IAFXzXFWLl+EaHOYRc+KMqTnOYDYQxva4RHYxUOumZxLFGdAu2GlTeI/FQG
         JMnFyohGvwlrSi0yK1I747fuTtTP2Bxwx3OpJGA8bn5xgNRYAG6ObAx3MwMQIu90mMNu
         udjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885407; x=1789490207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ar1cqiUGIhblAbeFXXUvhYbgZ/09secUyh9OrIqbTXI=;
        b=kbsVHIg9H7ul3ftQQq+zqgqwtssS4qg6VMEWZOUWnA/TwAIcds9Qlf05WsyfFZUZMa
         jm75DMnQBQRFqbNpM8M2xZVxKIjosDusMATDUPuxdaCy2t8iHrHyFz006Ba8GRzfFCta
         QNh9ssxhqF1imyIqNQTBPcGE7PJfX6ww6dyxcLYVpemEM1WUzs1jZDwdPvyz9BhbXlWZ
         WB7OslAjVyxdyHwD19LNlrxh3b2ZcHO/j6W/Rekzho3Q1+ZA2k2Zs6vPmaHx1XEUA4vb
         rjViGxDUGT0QNrZMfBQCEIecfRcaQUjRlIqyb2XFQcwt4eXaeg46q5t2DSw5P2QCLKYo
         u1SQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWUvLRCrylHp/03DJFa2Rxoc6XG5XyjV9KZIN0IpkWtVHdjoveQicErMTtcansgdrW+c2HjIG2ku+uCXRFjuqy@lists.infradead.org
X-Gm-Message-State: AFuF++ltBbii99YeatxS8h4LqISlkN9DVecarrALo749KNSAtiowlDDx
	11FdCzGT+zbx1w1XbjyDPyrKcjM5tTWqvR9dmYvvijVJsK0rmViubnjOBZS5hiQL0pI/wxI3SPn
	yDv9NANcU7+hyrJYn16meEK/klExEaQHmJ0C80+WF
X-Gm-Gg: AYBFou13RzVo/BEyYZS5sHKzecDbJaOvu1o0N3LpQJ/dusqmd17pa/KpTcnVlZYKmRG
	SFVjaLsAGqSYRM1yIl07T0W/kzdXQXQQQockjG3pOb9vL/xPRSK2AwWnnOar04xL0FsivMn/req
	pH7VxL7Di6rH/hzIhipY1eK1znMzVDYLZsMSNURQXAl6rkpHE6meyy8xJ1j1XYcSMVvN9hv0PhQ
	bI6DyoORxpKVEOjkyOGWKrKXcsAgJqUq/rE4TBxWcFrLEeBALkc61bUXqYb/eQhnbRoAZHN21SB
	+jCeLRZ0DtjBz9xG+Cz3uzc6dn+BMWdSTr6BdngekA==
X-Received: by 2002:ac8:6544:0:b0:52f:4a75:f840 with SMTP id
 d75a77b69052e-530a3b5e4d4mr956091cf.9.1788885406535; Tue, 08 Sep 2026
 09:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com> <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
 <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com> <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
In-Reply-To: <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Tue, 8 Sep 2026 09:36:35 -0700
X-Gm-Features: AcwNN1XrNENRtIESxOS2O_pA2bNb7D6VHVKhEtTbgLjPfFAgl7jg-nWJ8NnPV2M
Message-ID: <CAE2F3rAeq_CPeaDxuh40v41v2f=68oD2TqK9DYSPKz9F74kqeg@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_093650_109682_579646A4 
X-CRM114-Status: GOOD (  38.65  )
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

On Sun, Aug 30, 2026 at 12:43=E2=80=AFPM Daniel Mentz <danielmentz@google.c=
om> wrote:
> > >>>> +/*
> > >>>> + * Install num_entries leaf entries starting at ptep (index map_i=
dx_start
> > >>>> + * within the current table), tagging arm_lpae_num_cont()-sized g=
roups with
> > >>>> + * the contiguous hint where both idx and paddr are aligned to th=
e group
> > >>>> + * size. Entries in a misaligned group are installed without the =
hint.
> > >>>> + *
> > >>>> + * idx and paddr both advance by block_size per entry, so their a=
lignment
> > >>>> + * relative to the group size is invariant across a run of entrie=
s within
> > >>>> + * this call: once a group qualifies (or fails to), every later w=
hole group
> > >>>> + * does too, up to num_entries. This merges each such run into a =
single
> > >>>> + * arm_lpae_init_pte() call instead of one call per group.
> > >>>> + */
> > >>>
> > >>> Can you provide an example for when this function installs descript=
ors
> > >>> where the contiguous bit is only set on a subset of them. I would
> > >>> assume that the contiguous bit is either set for all descriptors or
> > >>> none of them.
> > >>>
> > >>
> > >> That assumption doesn't hold in general -- it's only true when the
> > >> map request happens to start and end on a cont_size boundary. For an
> > >> arbitrary map_pages() call it usually doesn't.
> > >
> > > I believe you won't see arbitrary map_pages() calls. I understand tha=
t
> > > these calls are exclusively coming from __iommu_map_domain_pgtbl()
> > > which uses iommu_pgsize() to determine optimal page sizes.
> > >
> > >> Example, 4K granule (num_cont =3D 16, cont_size =3D 64K),
> > >> iova =3D paddr =3D 0x1000, pgcount =3D 34:
> > >>
> > >>    - idx 1..15  (off !=3D 0, misaligned prefix):        installed pl=
ain
> > >>    - idx 16..31 (off =3D=3D 0, paddr now 64K-aligned):     installed=
 w/ CONT
> > >>    - idx 32..34 (off =3D=3D 0, remaining < num_cont):      installed=
 plain
> > >
> > > In the example you provided, I expect that you'll receive three
> > > separate calls from __iommu_map_domain_pgtbl:
> > >  * idx 1..15 with pgsize 4KB
> > >  * one call with pgsize 64KB
> > >  * idx 32..34 with pgsize 4KB
> > >
> > > If I took your argument further, I could argue that we'd also have to
> > > check if we can put down a block mapping if iova =3D paddr =3D 0x0 an=
d
> > > pgcount =3D 512, but we're not doing that either.
> > >
> > > Could you provide the input parameters to the iommu_map() call that
> > > resulted in the parameters you provided i.e. iova =3D paddr =3D 0x100=
0,
> > > pgcount =3D 34:
> > >
> >
> > You're right -- for the iommu_map()/__iommu_map_domain_pgtbl() path, io=
mmu_pgsize()
> > already splits the request at the boundaries you describe before instal=
l_leaf() ever
> > sees it, so install_leaf() doesn't need to handle a mixed prefix/CONT-g=
roup/suffix
> > chunk for that caller.
> >
> > That said, install_leaf() is shared by other callers that reach it thro=
ugh
> > ops->map_pages() directly, without going through iommu_pgsize(). pantho=
r_vm_map_pages()
> > (drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_p=
gtable_ops via
> > alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consu=
mer, but does its
> > own chunking with a local get_pgsize() that only ever returns SZ_4K or =
SZ_2M, with no
> > notion of the 64K/32M CONT boundaries. That can hand install_leaf() exa=
ctly the mixed
> > iova=3Dpaddr=3D0x1000, pgcount=3D34 shape in a single call (panfrost's =
map loop uses the same
> > get_pgsize() and hits the same case). So the prefix/aligned-group/suffi=
x handling in
> > install_leaf() is still needed for that path.
>
> Maybe other people can chime in here, but I feel, from an API
> perspective, we should have only one way to make of use iopgtable. I
> think we should just mandate that users honor the updated value for
> pgtbl_cfg.pgsize_bitmap (and pgtbl_cfg.ias) after the
> alloc_io_pgtable_ops() call and then choose page sizes appropriately.
> Otherwise, we end up with two pieces of code in the kernel solving the
> same problem. panthor_mmu won't be able to take advantage of the
> contiguous bit until it gets updated accordingly, and that's ok.

On this note, I want to point out that I tried something similar in
2025 (see https://lore.kernel.org/linux-iommu/20250430231924.1481493-1-dani=
elmentz@google.com/).
The feedback I received from Jason at the time was:

"Wouldn't it be better to use the pgsize_bitmap and rely on the core
code to indicate that a contiguous page size is being used, so it can
trivially set the PTE bit without doing all this extra work?"

