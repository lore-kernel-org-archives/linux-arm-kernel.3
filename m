Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1BFD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 21:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1g/LUZaFq6bDefX53BhgiuD5fkwRR70905nqxT15Dw=; b=PBCV4mNgPE8ltw
	ji73n/RM+J8+lzsS7iO2sjjc3zvk7nq0+jy8YykZdmXO6C4hopZfJMZ4UDoYJ9g0Q8siEot1+6+Y4
	IZG582Wf57x+X630FpqtqYMsW6AuinPR+ZK9QjUwlrUs+1HN/uUigN/hiK4U9XicrFUqhYSCd7yoL
	fRg0KBr7FL/ZRtUHjjyQKT1vten4JgFMadi7UCL+Vci8o/CMh0+ulh3JdAcJWMK78hH4z1xm0AqIb
	r7W3nJVL6rkvB4iQT6OTR1sy6fzuQpvWu19cIDSFUbEkDm7xEZHSl2USdJx8f2e14mWeCY2FrtVab
	Qnpvzu9nsLKESjOq27lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZyTL-000000032Vf-1oI9;
	Sun, 28 Dec 2025 21:38:43 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZyTJ-000000032VI-0Obq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 21:38:42 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-88888d80590so128897006d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 13:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766957919; x=1767562719; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1g/LUZaFq6bDefX53BhgiuD5fkwRR70905nqxT15Dw=;
        b=XhzOxVcwNxCiFPQiBgycvtpUVX6quRZXeiXKDJ9V0C1yhVx6cqoK9Z1JIIxCgpalsu
         o+0D6FXrHey7GUPLGhmHofJtr7s5lF/+rNm+HB8TI7C/xDeYa3zGvQW7C0wJRIbHn/S7
         Tb8EdA5FApDwvFx9UF4zRkNTxVjY7hHJ6gFsNkI/Q4fkCMqCAUDy1bZHQ3zDFoSXjLMr
         rAw2aczmjktudFdByBquucPQrvUhCQDZbZztudAKx0POsnsTSUC5bAdFlG6x6y8kEqPA
         +OJyW3cHaVRqJ4DZ3elIAxzydGmsTunWRpSwUApReAe7VCc30VB3OhXyIqBGT0jgyEdi
         dHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766957919; x=1767562719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1g/LUZaFq6bDefX53BhgiuD5fkwRR70905nqxT15Dw=;
        b=f9lQSTvrryifo4issXq7m3AdGk9Us/Mhsz5rmyjn7MjRuEkmddG+pazaoS7Qd2rRpV
         SQlYzA4P+zI4kZt0dsMFMjmTN1ku5qiCZDRK1wIzlhuTQD0Mj1s28rl1TOr4elTGeZ0j
         wTIFDl0rlBhsb5jH+74axoTDE8tmgslncTqTTBNNTnqHyt/73ZAMDhHPMquwEJkWpHaQ
         W9YcpQfY9fiDMbFiWya1MKA72DZqQkRghqmbw1rFrh/sGr4O20qCV1+a11UKr1ovOrQQ
         nrWFSD4pGfHmViZWUwnuUefBt50qvlzV7kApq7/Fxg/yoDfu0kHAAvA5xH9jJ/CdrXz7
         pa1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvIgyuFc37InOMSCwI1yMiJpprAW2ss1QV9ChFkqUilG8A7PaNV13XnJiHU+sWERhyTnvjE6rbc/coXnQ6uA2r@lists.infradead.org
X-Gm-Message-State: AOJu0YyuBlG8hJJhelfBwGqRmkBTW59T5u1NfhhssAreh1AkxWzrxBNy
	anBuSASP5tXJxJ9zFVlJmwaQoUS55BCntmfv+JKgcacL23al5XZOFI+ADY1KK3j2LbIUY/3E2fD
	a65qy/KkAX+Jx9x2ZPcGfG80qgZSUJGI=
X-Gm-Gg: AY/fxX4888FyB2LVNM+syG05hdWOFwmFqs5ao10+78wvCaq9BEVI/hqUrJKjqb9X/Lv
	5Md7I/F6arAW4HSc9rXSCFJNOOvOlrxoJ4niOnvIRAqmZf5WyuxBY2R/PWx43uGQNpqHnxA9Khy
	doQR7FYO5/BvnHSzkkNug1oRpJen/8ojTnSvDZL+gi5Mjp+ziyKoa4irQkwxnwOqJwqnPBcHYZj
	OrB/zCsGbjnLX7lXWusAdvshIfpgSEY5vY18Lgu/JvMEf+Ks89IN8bwy7Jj4wVlJt29bt+hTL+q
	Gmmv
X-Google-Smtp-Source: AGHT+IFgKeFJUcF4JlYrS+2alW/MpQ7kokvILpma/XvhkGlA5YEBPhAcAdbbpwwssSzZ4QYH5TR+I6xzr6+JAPDvDvM=
X-Received: by 2002:a05:6214:3106:b0:87d:cb8d:2a98 with SMTP id
 6a1803df08f44-88d851fbfafmr460409556d6.2.1766957918792; Sun, 28 Dec 2025
 13:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-5-21cnbao@gmail.com>
 <20251227200706.GN11869@unreal> <CAGsJ_4zyascnpQ1cB-BMO9PDeeRZTBAh8Z-j-ip=RcxApa4zSg@mail.gmail.com>
 <20251228144909.GR11869@unreal>
In-Reply-To: <20251228144909.GR11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 29 Dec 2025 10:38:26 +1300
X-Gm-Features: AQt7F2qQRDPvBU46Q085z5nd3f2LlK_MxqFtI029gQlWHnLWh7NIEMxwcDVy0Zs
Message-ID: <CAGsJ_4y=yoYZn+_ztdfuOCj_dS-M0h8YWO51AXubPbeR1FH6uQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and
 completion waiting
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_133841_156432_5D1F2409 
X-CRM114-Status: GOOD (  43.88  )
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
Cc: Juergen Gross <jgross@suse.com>, Tangquan Zheng <zhengtangquan@oppo.com>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Dec 29, 2025 at 3:49=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sun, Dec 28, 2025 at 10:45:13AM +1300, Barry Song wrote:
> > On Sun, Dec 28, 2025 at 9:07=E2=80=AFAM Leon Romanovsky <leon@kernel.or=
g> wrote:
> > >
> > > On Sat, Dec 27, 2025 at 11:52:44AM +1300, Barry Song wrote:
> > > > From: Barry Song <baohua@kernel.org>
> > > >
> > > > Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
> > > > always wait for the completion of each DMA buffer. That is,
> > > > issuing the DMA sync and waiting for completion is done in a
> > > > single API call.
> > > >
> > > > For scatter-gather lists with multiple entries, this means
> > > > issuing and waiting is repeated for each entry, which can hurt
> > > > performance. Architectures like ARM64 may be able to issue all
> > > > DMA sync operations for all entries first and then wait for
> > > > completion together.
> > > >
> > > > To address this, arch_sync_dma_for_* now issues DMA operations in
> > > > batch, followed by a flush. On ARM64, the flush is implemented
> > > > using a dsb instruction within arch_sync_dma_flush().
> > > >
> > > > For now, add arch_sync_dma_flush() after each
> > > > arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
> > > > no-op on all architectures except arm64, so this patch does not
> > > > change existing behavior. Subsequent patches will introduce true
> > > > batching for SG DMA buffers.
> > > >
> > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > Cc: Will Deacon <will@kernel.org>
> > > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > Cc: Joerg Roedel <joro@8bytes.org>
> > > > Cc: Juergen Gross <jgross@suse.com>
> > > > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > > > Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > > Signed-off-by: Barry Song <baohua@kernel.org>
> > > > ---
> > > >  arch/arm64/include/asm/cache.h |  6 ++++++
> > > >  arch/arm64/mm/dma-mapping.c    |  4 ++--
> > > >  drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++-----=
----
> > > >  drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
> > > >  include/linux/dma-map-ops.h    |  6 ++++++
> > > >  kernel/dma/direct.c            |  8 ++++++--
> > > >  kernel/dma/direct.h            |  9 +++++++--
> > > >  kernel/dma/swiotlb.c           |  4 +++-
> > > >  8 files changed, 73 insertions(+), 25 deletions(-)
> > >
> > > <...>
> > >
> > > > +#ifndef arch_sync_dma_flush
> > > > +static inline void arch_sync_dma_flush(void)
> > > > +{
> > > > +}
> > > > +#endif
> > >
> > > Over the weekend I realized a useful advantage of the ARCH_HAVE_* con=
fig
> > > options: they make it straightforward to inspect the entire DMA path =
simply
> > > by looking at the .config.
> >
> > I am not quite sure how much this benefits users, as the same
> > information could also be obtained by grepping for
> > #define arch_sync_dma_flush in the source code.
>
> It differs slightly. Users no longer need to grep around or guess whether=
 this
> platform used the arch_sync_dma_flush path. A simple grep for ARCH_HAVE_ =
in
> /proc/config.gz provides the answer.

In any case, it is only two or three lines of code, so I am fine with
either approach. Perhaps Marek, Robin, and others have a point here?

>
> >
> > >
> > > Thanks,
> > > Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> >
> > Thanks very much, Leon, for reviewing this over the weekend. One thing
> > you might have missed is that I place arch_sync_dma_flush() after all
> > arch_sync_dma_for_*() calls, for both single and sg cases. I also
> > used a Python script to scan the code and verify that every
> > arch_sync_dma_for_*() is followed by arch_sync_dma_flush(), to ensure
> > that no call is left out.
> >
> > In the subsequent patches, for sg cases, the per-entry flush is
> > replaced by a single flush of the entire sg. Each sg case has
> > different characteristics: some are straightforward, while others
> > can be tricky and involve additional contexts.
>
> I didn't overlook it, and I understand your rationale. However, this is
> not how kernel patches should be structured. You should not introduce
> code in patch X and then move it elsewhere in patch X + Y.

I am not quite convinced by this concern. This patch only
separates DMA sync issuing from completion waiting, and it
reflects that the development is done step by step.

>
> Place the code in the correct location from the start. Your patches are
> small enough to review as is.

My point is that this patch places the code in the correct locations
from the start. It splits arch_sync_dma_for_*() into
arch_sync_dma_for_*() plus arch_sync_dma_flush() everywhere, without
introducing any functional changes from the outset.
The subsequent patches clearly show which parts are truly batched.

In the meantime, I do not have a strong preference here. If you think
it is better to move some of the straightforward batching code here,
I can follow that approach. Perhaps I could move patch 5, patch 8,
and the iommu_dma_iova_unlink_range_slow change from patch 7 here,
while keeping

  [PATCH 6] dma-mapping: Support batch mode for
  dma_direct_{map,unmap}_sg

and the IOVA link part from patch 7 as separate patches, since that
part is not straightforward. The IOVA link changes affect both
__dma_iova_link() and dma_iova_sync(), which are two separate
functions and require a deeper understanding of the contexts to
determine correctness. That part also lacks testing.

Would that be okay with you?

Thanks
Barry

