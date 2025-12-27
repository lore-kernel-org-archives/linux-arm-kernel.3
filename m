Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2995CE9271E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lt41blxsMyjhc3LV6WnC+/wCpChm6SDa9UhbOfqHfRs=; b=LKFKxLiDTVowwr
	hQWHwAIlQnmIpiNeNMn4OYIy/ieWYBVmG034hO0aZG5J5u3jI0+W/Swsbr6l2IIR0R1flWQz/gFZs
	y5HpzlhJ0DNaNWDuvKp7kVHlVRUUX+KIKahwbe53dJwF90et94jEN/K/CJpvDszOJ81LqOjldmr7R
	QhBU0DuT36aWuUdDyVY0BJCVBxQvs4hRhi/9TD+4rD8TaGZ3WHL2pxvlH6yLi/Qg44AwHgF++QAS4
	lxzF2OwoFniyVIaGO58Y1PmdTC2DvubWTNMDhkFrQNEsmf69VUg7QfHYJh0AFaeWI3tDG+clU7XhE
	2sFy/Y8g2f7lAXzKK9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZc6K-00000002DdR-3irX;
	Sat, 27 Dec 2025 21:45:28 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZc6I-00000002Dd4-0YxS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 21:45:27 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-88a288811a4so92138756d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 13:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766871925; x=1767476725; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt41blxsMyjhc3LV6WnC+/wCpChm6SDa9UhbOfqHfRs=;
        b=NVrSlE6nq+hcHWr50mRY4HRggGp9b9zVqbjRO2giIA+AL/K1jY7TxKOgY3E5TCs1BK
         L42aRdXU0WqMbr3+WWJWsrecwkt4A+FrEs5g/dfkWzH0gFLyiqGS9qkrXq5hd2fMnleC
         Vk4LuWUcHQUSOlu7f9DuraDwiB86eDjSdjqWJK8BWfOc4zkYynl8Qj+21ovyG/XGZZwX
         z9N5AF+xlNLdiXOZp9YM+YlDlt8U2+M+7WbjTK0uEIc8yrfFJ6exdEPml0OkbKhX7Tpv
         w0lms49rncZlNVCUN1v0hDVebleIntUwXty3xi1vIplj12eG5Bgv7q9kMnCB/4BVBPFB
         2TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766871925; x=1767476725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lt41blxsMyjhc3LV6WnC+/wCpChm6SDa9UhbOfqHfRs=;
        b=I0BhDSoIYfscfSCzVYylalAtxOgwKi0DIcr2agwQ4cQDBne8lacLmdfZuiLkvbwFiC
         H9cdqUb1uWPgzTaxJf+HWR7axSOp4NdLPYJCZ2ps6IBKUXJxG72JZe9MAz/WYch1DdBM
         iz1HF9sLRv7PmHPPXebXMdShKEddedEfDNgGgLEQc4EEZqPE7BF22XH8G0kSbMYnfzsQ
         61ZpUYzS9aSR+6PFCO/4AKJ5MJ5xxMzGjiaTFDYNtPz/XX6WGy45d762IQv5JoaH1kQH
         yYcU9KuBXwJYXPnXikYYBce5aAZ+hDw1sOqWRnIltVjgOxkQRasvHUCbcysHttNkg4x1
         EKuA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Cnpthiuh1Cu39eXUeBNL9bPOtjxXVvgrEOv07Ifavwc0suFBXlEpRlVrj1rW1gP8cO/jCMVnUHzH3AelzUwm@lists.infradead.org
X-Gm-Message-State: AOJu0YwyAyB5D76xCEvfaXn/Naf/IyMv4AxPyXUTYzA4qszYrnST1GWq
	R3kuLuQv+iysIlhIebRS9Fj8ED687T+RHzTFHnuGAAcuVVuwQ71YspvUyvmB+/W9s24JYna5Ghg
	pOpx6qGD5gWhmFlPm80/N7rLs4TkzCVg=
X-Gm-Gg: AY/fxX7ngMsWCY6vdCaLyu6AQOfKgMhYQkatbpOb3JVtIGlkn5QUo0pWeJK2RkfR017
	HPS8zH6qxw6i4YB5mHmloSP2V9EvDLLMkwNqLwwvfTapjRo8leCS15atx+5OtetdRVUdTCgZTv5
	GG9g0/3iY939HWOsG2V7XozdB5cpAnnfLCKw6usw7GVg/ox/494+PJfnQlHreErhYLG0YcGNUcX
	ch9B+C1X+RjcRlHsHB0kx1QNGYwTJ9gdfPDAC/fGDNAq8BjN2iJCWUvpG517WI+P/14IQ==
X-Google-Smtp-Source: AGHT+IHmBi29677t2O37ea1flM7K/Y0dIjXGGt2yXIRM7uMA6APSnauCpQ+0jFlHKgITt5UGFK02RSmCY0Fj091CN4k=
X-Received: by 2002:a05:6214:5092:b0:888:6ea5:a90b with SMTP id
 6a1803df08f44-88d7f5b331fmr425798726d6.0.1766871924468; Sat, 27 Dec 2025
 13:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-5-21cnbao@gmail.com>
 <20251227200706.GN11869@unreal>
In-Reply-To: <20251227200706.GN11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 28 Dec 2025 10:45:13 +1300
X-Gm-Features: AQt7F2r-YxjjSYpd8cllnEqpFXg5kopB86XJsQIZsxDdh04rwEIBpc-UuQSQ9GE
Message-ID: <CAGsJ_4zyascnpQ1cB-BMO9PDeeRZTBAh8Z-j-ip=RcxApa4zSg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and
 completion waiting
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_134526_249978_E949C71D 
X-CRM114-Status: GOOD (  25.98  )
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

On Sun, Dec 28, 2025 at 9:07=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sat, Dec 27, 2025 at 11:52:44AM +1300, Barry Song wrote:
> > From: Barry Song <baohua@kernel.org>
> >
> > Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
> > always wait for the completion of each DMA buffer. That is,
> > issuing the DMA sync and waiting for completion is done in a
> > single API call.
> >
> > For scatter-gather lists with multiple entries, this means
> > issuing and waiting is repeated for each entry, which can hurt
> > performance. Architectures like ARM64 may be able to issue all
> > DMA sync operations for all entries first and then wait for
> > completion together.
> >
> > To address this, arch_sync_dma_for_* now issues DMA operations in
> > batch, followed by a flush. On ARM64, the flush is implemented
> > using a dsb instruction within arch_sync_dma_flush().
> >
> > For now, add arch_sync_dma_flush() after each
> > arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
> > no-op on all architectures except arm64, so this patch does not
> > change existing behavior. Subsequent patches will introduce true
> > batching for SG DMA buffers.
> >
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Juergen Gross <jgross@suse.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <baohua@kernel.org>
> > ---
> >  arch/arm64/include/asm/cache.h |  6 ++++++
> >  arch/arm64/mm/dma-mapping.c    |  4 ++--
> >  drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++---------
> >  drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
> >  include/linux/dma-map-ops.h    |  6 ++++++
> >  kernel/dma/direct.c            |  8 ++++++--
> >  kernel/dma/direct.h            |  9 +++++++--
> >  kernel/dma/swiotlb.c           |  4 +++-
> >  8 files changed, 73 insertions(+), 25 deletions(-)
>
> <...>
>
> > +#ifndef arch_sync_dma_flush
> > +static inline void arch_sync_dma_flush(void)
> > +{
> > +}
> > +#endif
>
> Over the weekend I realized a useful advantage of the ARCH_HAVE_* config
> options: they make it straightforward to inspect the entire DMA path simp=
ly
> by looking at the .config.

I am not quite sure how much this benefits users, as the same
information could also be obtained by grepping for
#define arch_sync_dma_flush in the source code.

>
> Thanks,
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

Thanks very much, Leon, for reviewing this over the weekend. One thing
you might have missed is that I place arch_sync_dma_flush() after all
arch_sync_dma_for_*() calls, for both single and sg cases. I also
used a Python script to scan the code and verify that every
arch_sync_dma_for_*() is followed by arch_sync_dma_flush(), to ensure
that no call is left out.

In the subsequent patches, for sg cases, the per-entry flush is
replaced by a single flush of the entire sg. Each sg case has
different characteristics: some are straightforward, while others
can be tricky and involve additional contexts.

Thanks
Barry

