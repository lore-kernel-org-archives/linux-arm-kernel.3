Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEB9CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOU/kElSaCjd9f7zwYG7ZjeJEeWR4TSXwf/lG3jqcY8=; b=Ok7rG59ehh+AtzLHPttUP1vg5t
	oqCaXhrIt+T6BdVGIWBOR1vZTt9i65JeOux9IdNh8KFI+Wxdg1wGLlaIsQTOknBQxeOHrYwSxpOeA
	NjOAyJxjy/iQbkcfmOLwFj2ZTx2IxkNIw31O6siBS7sf1wGwOC1DlCWTIbQSEiiha/tDpgreb2EB8
	CHv8KMY+QEAFMdeWILlWclZnEpTgkgXK32CebilMukKlvbPke/G/YEHQSCdyrp7DJXj9ehEmM9Yw/
	oO05rBbU4iDkXrm6y6eBMgld4pXeToxmvA5PgwAJJPufTlPa16FWbA8z8cporYvY1p9mE2Yu67UiN
	HbMHFV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBznl-00000007Adl-06ca;
	Thu, 23 Oct 2025 18:12:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzni-00000007AdP-1Peg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:12:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-26d0fbe238bso8214985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 11:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1761243157; x=1761847957; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iOU/kElSaCjd9f7zwYG7ZjeJEeWR4TSXwf/lG3jqcY8=;
        b=LNCr3IXTv5gMX8lg5xBDE7Fvls5c7rBgIgxVm5mF1oLuRF+ZKZ8H4D8fw70ggRui0T
         kJACxCUdZYVOYVlHjlLFZT5wIZFfonuFiclb9KdcQu9qATCI1qLG77hPkPfQtIX1lpzq
         /awEJVpWlkk/DVzdI75mLRMd0irkjLQhml8QZjM07X3Z4qjATzjlhjNnaGRt5uyfyORc
         nVJ0wU67XVyshmb5abBYJYJVmqR4lImknJ2aejKWChOg+yoEsMRxL/GCmxfcryvRGLh+
         EThWLl9AoTs+qR94F1m0SqS3bIey7stLCsLNp4hRrHYJHAJ4S7DPHJqo1yVwM+d9sGKB
         MZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761243157; x=1761847957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOU/kElSaCjd9f7zwYG7ZjeJEeWR4TSXwf/lG3jqcY8=;
        b=tDvuK/zUqlQ+PKIuMOL7yXZlopX23+cTzcXfZEMFST0NAJhoU/PnGf8Wzj7/M01LBJ
         TCJVzwz7+P5R/xb8LRVOmSvn2GdOYt45zvO/NyzPJefvp5ktlEI66Nfu4bbvkDZGkHDB
         g4ip9C0DlzB+sfbk6+B9lWWqk7Dd3NFGBULyj1EBzoZ5qrMJ7c42+XhFRuRhb3TLXqs+
         4+rs45CrrT7BqTXoMwMgKdnjlCfL/4I+mABBdv6EbnGK4TYH95RRXf8eS6EYilof9pfG
         DBtCgFEmeK/3Kf//y0Gab9CvxizUFqIO3E6UVdOOYbVJPja07nsGhoulsUkwau7KUJmp
         s1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrGyPtAfOJBpqGjU3v2NyDRHsl4sAK+QhK5IOBUBw7c8JW3NMwyFwRGg7s6XJARE4AvGILODGlTqBBx6grYUbQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Yg7QHe4vBaLeIzMAST4aJ+AijTyW0vG17I+P1ZAD42hLGzod
	j3DW33DQ3zH3B64WVsyUDtAhCxlKtPLa9aJW+3qAI9CVw6J/sB9B5S6MMQUgsmioj1E=
X-Gm-Gg: ASbGncsVWkh9IBSKIOJkrco7WSn214bCP88W/rRwLm60MHfQA5xrPz3oVPyAqBAjgl8
	+gU055+bPhrf8T0LzXj82Nve+3ccn239irPtGHJzwd9bQU8UxNERBHoEsHltfBX4k2IJhhkAnsK
	6K46d8yH+/nBCTpBdIESym8oKbzkKXhZDdUw4aQe4xaQrq4/FmmMCYw9PKFhUc4I5ubPnZyUHkQ
	ExaHyMzecGGicyhzo3su8escDycBek4AI/XNSaGvC2EmPk14H1fgDqmZVOTRyxwoiIGiTA2whsN
	fq9i8A/yMiFDofQAtt5/LK2F2+xko15AreCHAQvaA4Z5aAgbSAjp+E2hZYs+jTq0ggqkKQJ8yNb
	Qo+nqPFGOoCfRmzCbTeTrxHqzPeR3Tjrag0lWnnZd015ifv+1sY5qEhiWyLEn
X-Google-Smtp-Source: AGHT+IF1WEdpusCP+BeMXzNhxGYpnraKs8rtFDbaJHh+VNXtmmVcLIGFG75EjXdN+9DNv8IrhqEt/A==
X-Received: by 2002:a17:902:e743:b0:290:ad79:c613 with SMTP id d9443c01a7336-290cb27c76cmr315785155ad.47.1761243156831;
        Thu, 23 Oct 2025 11:12:36 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e2578desm29726705ad.106.2025.10.23.11.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 11:12:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vBznf-00000003Bqs-16NV;
	Thu, 23 Oct 2025 15:12:35 -0300
Date: Thu, 23 Oct 2025 15:12:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Reaper Li <reaperlioc@glenfly.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: fix probe device bug due to
 duplicated stream IDS.
Message-ID: <20251023181235.GH21554@ziepe.ca>
References: <20251011023003.159922-1-reaperlioc@glenfly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011023003.159922-1-reaperlioc@glenfly.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_111238_471951_0360E815 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

On Sat, Oct 11, 2025 at 10:30:03AM +0800, Reaper Li wrote:
> From: Reaper <reaperlioc@glenfly.com>
> 
> Commit 9246b487ab3c ("PCI: Add function 0 DMA alias quirk for Glenfly Arise
> chip ") add quirk to fix hda dma request issue, but IORT logic populaties
> two identical IDs into the fwspec->ids array via DMA aliasing in
> iort_pci_iommu_init() called by pci_for_each_dma_alias().

I'd rather we not have duplicate IDs in the same fwspec, can we avoid
that at the source?

Jason

