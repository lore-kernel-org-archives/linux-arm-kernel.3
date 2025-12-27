Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9723E92710
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 20:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COlE5Xveygh67jucjDOeVZnfTHNWpMeqgQJOQuwR0lI=; b=brgyXW2L1elgS1
	pj5lPtmyqIyF9ArAYWUvYRcfxerxK7MTBEpGpn/k5UoVqrE7EHEXCB//dCdB1vhjk/9MVDUxQUAam
	32v8RSU+GHFvMt3+3RmuoKNVYVKJDGey3n0Ng9I00kPgc+FV6Urchf/Y5+WMueeHM0KyG5SobY2Yc
	8hCmVZI8FOkhv8kgtR/hA3VLTwnAQXPZ3g83AQrOIfAtvLvq7Nt+4GAcFCSvVHm3zIa4NaXw7PlXi
	u3RVR93BABsNZjeNI5Cp6iEXZNfoDs4f78fi8F1J7h39F8piSEoWlHr3Sp2X6AuOEda2i2hA4HljO
	1g/dT3/JzFmgH6EFQzaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZbGv-00000002CUq-3ipx;
	Sat, 27 Dec 2025 20:52:21 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZbGt-00000002CU2-0eG6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 20:52:20 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-88a288811a4so91880136d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 12:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766868737; x=1767473537; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COlE5Xveygh67jucjDOeVZnfTHNWpMeqgQJOQuwR0lI=;
        b=Z135UrV2YhfSz6oYOa4JMoVdWZrYwa15iYL4vARaICQYvYnLfbskAJ1lIrhyKmjJ4I
         LPddOIOZkZLNzU/nWDNDiN5hoAvzKdb++F4gQhW0qOtVfk2PdMFpTuuFnnTlRpo3Gq8b
         uj6tC/NWxLNQaKXvkoQZ7FWbVUW/Al1Zha8bS7ZEtlwk+eLqpEWKooe6Q4bS9HWYlp5K
         2fDtwkxbcrwWEEV5f55i2xdImwlIpX/EiMFdlnDBPITdYVp9IVhk+9f0KeGc/dHZF3KV
         vEuUWA2tTc9uA57sLmkm7asAstpFzXLfdHe+JF2mmWW33qJGudKg9WcWTGVwi2D/Ao16
         FYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766868737; x=1767473537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COlE5Xveygh67jucjDOeVZnfTHNWpMeqgQJOQuwR0lI=;
        b=gAaT3PFCuTGhu+CXv8woZxBiVbZ4BI9KmwJgRoj4OZiiUZ87fIl3UDi5NrKbhBjboj
         nZmP6kE8C4oEJafE6+P6umeVTMcwKXaO1MVOd6EWJDidKbA7AfDWvotzsGeykFmETn+r
         NJlqddnAcN8RSQTSKeAMBlakA0vNYl6m4s6u00TYgf7xMFee7WvIMo09Qh5ZGF93D6SY
         B14Oy/is0FTJ64pP7+ZpeHWfqkfk703urBrQf4sFaPHCaiaq3jl50XDrl/iETLLXdohJ
         F7ORZKDBt52NzPwZ+sARE2FjU2Xjj0BzlxP9Jke1fBSUEqR2jjA5iFeUyXoRavM/sitx
         XLIA==
X-Forwarded-Encrypted: i=1; AJvYcCV5/nshjbtyGA1FL9qDA5U94eaUT11cnsPrPqNe6DIDzKTyCvx+F7O0JlKR7sxe5RzdsJYt43ys11eJe2MndJzI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/JbNAJ0hUzfofqhydltlf4ik6w4r2FWZkK2gERok9KH8NvkrV
	psb4XCgSlx7SybYRQ4B6GD8zDjoGUn/4J0TuM9TAIOKFdDvn63fEVF6hh6PbGhaG80+MY2Ip/o/
	FtZCVjM6AeQWiQGGE58VfkPEclaD88+8=
X-Gm-Gg: AY/fxX75EPrZbRN9BfO+qGbl3Ft46Zj6uib4odqJAYs+bc95eWBzFZRA+57CNo1Cqkc
	OcIQTFfNHNwa3ZAtcpoFExc+su4/Cl1KNKgpNytiv6LwWuqYUdGDzXXCurrVspa3m12sFD30tjb
	+ZGgqnXlgFVgeZL3XrC2xNKyWcIrXn/Dxafgm0eNyeBogubG9oV77OYgETR5bdKPklRG7rDhDVq
	XuT+2wrOevXUY4BoOxH2WJOJSwLLttB1gRv5zV2iiB4x2mfg/fKv/MA6493zI2Mc3c9zA==
X-Google-Smtp-Source: AGHT+IFWlfYgq6fvhPnudIMznElnMp57SUfWPdf1Abz4VW1qQ4SuUkwafpWDnswUCDqMkbSt41dCGCuIrkeU0fQZTZ4=
X-Received: by 2002:a05:6214:3a8a:b0:88f:cd09:9431 with SMTP id
 6a1803df08f44-88fcd0995d8mr271616716d6.41.1766868737130; Sat, 27 Dec 2025
 12:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-6-21cnbao@gmail.com>
 <20251227200933.GO11869@unreal>
In-Reply-To: <20251227200933.GO11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 28 Dec 2025 09:52:05 +1300
X-Gm-Features: AQt7F2q5TMmxm7Qs_CjJBcT-WAtF0589kk4jJXu2nxeg2qZ04GIbkJZVDuQBxso
Message-ID: <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for dma_direct_sync_sg_for_*
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_125219_204041_4BFA065E 
X-CRM114-Status: GOOD (  15.64  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Dec 28, 2025 at 9:09=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> > From: Barry Song <baohua@kernel.org>
> >
> > Instead of performing a flush per SG entry, issue all cache
> > operations first and then flush once. This ultimately benefits
> > __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
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
> > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <baohua@kernel.org>
> > ---
> >  kernel/dma/direct.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
>
> <...>
>
> > -             if (!dev_is_dma_coherent(dev)) {
> > +             if (!dev_is_dma_coherent(dev))
> >                       arch_sync_dma_for_device(paddr, sg->length,
> >                                       dir);
> > -                     arch_sync_dma_flush();
> > -             }
> >       }
> > +     if (!dev_is_dma_coherent(dev))
> > +             arch_sync_dma_flush();
>
> This patch should be squashed into the previous one. You introduced
> arch_sync_dma_flush() there, and now you are placing it elsewhere.

Hi Leon,

The previous patch replaces all arch_sync_dma_for_* calls with
arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
functional change. The subsequent patches then implement the
actual batching. I feel this is a better approach for reviewing
each change independently. Otherwise, the previous patch would
be too large.

Thanks
Barry

