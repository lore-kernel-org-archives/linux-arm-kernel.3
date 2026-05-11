Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31D0CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjFxAsYJ767LfglQAiic8pmf/v4fVUq2j4oVrXIto5c=; b=l7ln2Ga3g1wgk0IKHBtY9vHYsv
	VVor6Qxm9Zcgb1AEQrHMrm+8VBpAXpnT8v/aGIC/lkawGPQlTCztqxlcGeOlbiF+3l5B12iW+jQN4
	sJWcVbS7HKHIwlScjVkRLCHRhiU5R0CR8ZuJsOtEhEKMab9XwSWKegoVPuqoVj3koUvq9xLqFfp22
	kdBM457XbCmxAXgC8mDdPq25bShe6AgGbyOKLvukEwnEwvKGeK71XI/DkjHoXzvpXw3qyz/7ArT/e
	5uSnYSqsHajOXzm+7GTyXUqw+6yXKtQ2LA6SvULXL71xYBJeaiSLXGnMLuAw1s9VmAkMfGmVwO5c2
	3Wmj3OjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOd6-0000000DI2d-2V97;
	Mon, 11 May 2026 11:16:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOd4-0000000DI1y-22ro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:16:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778498211; x=1779103011; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mjFxAsYJ767LfglQAiic8pmf/v4fVUq2j4oVrXIto5c=;
        b=i+tiD4Kk63g0C0dviyp6dek7/EkcZoT2Tagf52VeNTY/USuYBLma8swoAST6IZzD3n
         aRAXSfAm8H6QFpWihsNUMFf4fTLAepRPkIN9JCRByl5lZ854C/wupwHxbEkImygiN47Q
         5ylMlv/MrRqcFRC8fU4BAee27pB5yFwlVbWqVZAwkxIPjnn9rDkFX7j2r78SIUzDhUJU
         oPb/MXjAED6nwgK6oRJPzIq2yGS0WizrTiQ0em87jyMMzGFEckL1p9Vwlnwual1udRm1
         Am/fzHXIhAXk/gTloJoOB/SlH+LyqT0ncQRjws38EpHvocm/RM+WeAsOy0nV2PTtNEP5
         yHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778498211; x=1779103011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjFxAsYJ767LfglQAiic8pmf/v4fVUq2j4oVrXIto5c=;
        b=TcTRSfCT4u7bmXrG1k5D7fZ2p9hKSjV9XE/M87WczqLQCGxmAZcs2LYhA65lVc+uJB
         vAG+TTAipUR6E5DLNoYjWQviTP8TecA294k0BSG/2q0leHEvS0UyDPvxuHPB39F09L02
         v3x2pPo2TNNZ5TIs04GMJCdt3ZZY7iJhWZEWfE18GA+WdmAZfBPPRV3fOKQw/v4UBmZI
         X/XKOXTw21BitrCFpCdNc26E2xNiykr+ebGnf+aiOPndGD6acweAPnT3yePmHhigGI+C
         l0SKo/L/OoP7SmlGe3VbZ/kiHAEqatbcyyeSTn503IvbOtp3qHrJ4TfXKruDb0+SNsPK
         p9FQ==
X-Gm-Message-State: AOJu0Yxdd0b031EdNkPki+hIag3qgc02tSHOb0kujJhpQjDkr8it+F3Q
	oIg7sEslMGlle1B/kFlfocDMTLqrDMQAdk4Zbv5yyzHpVmJiivCIhHLd95A1lg+x2w==
X-Gm-Gg: Acq92OGqXrBDL4EOwcoZyYwRLz0vOXgq+jbFlbgGB7bJl8DxLzLUWBSMwBWq6OKlFpS
	9mIsan5CUMu29kV9ntWvdC/weX2XGL9gRnhayHNjsyw3YQm1+7lG64M5IE6v5lv2x/o6iUVyqzT
	C67YMMu7LY2yF2eQDU1iqih5dGAf4UO3RgCsTe5OGYQUof20kfpumWayH2WZ0ZOQ4zW9ZFRBq9k
	CQc96eYXsgq+O38HpCYoY27aAw2yp2OUxSMql2tIN0yclwWYJFpiln5C+IVXtoJlZYPJj5a4dHR
	X0XWNGk88F0+2HYpV9ChAbaXhHLMSX5rVTtyOA1WsxmZwEXkZWpTtYTr0nDLtx0f635Vb3n2tgM
	lWOB5+zVO2xocqVnK6TY99n0KLV5ejnm4snc7dl+uxNaaNpqMZSZfmkAHOTn/HAtL7+nvoLGZIB
	hKGZmabMohQvNstxnjCf2OCunGhLIYMCmJA6rhi6VpfnNFtSXAOvljSatIlF2bEVOdnYA=
X-Received: by 2002:a05:600c:c3db:10b0:48a:5d55:c194 with SMTP id 5b1f17b1804b1-48e6f507bc1mr1377065e9.7.1778498211122;
        Mon, 11 May 2026 04:16:51 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm24522316f8f.9.2026.05.11.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:16:50 -0700 (PDT)
Date: Mon, 11 May 2026 11:16:47 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 06/25] iommu/io-pgtable-arm: Rework to use the
 iommu-pages API
Message-ID: <agG6n4CeuIMD57G1@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-7-smostafa@google.com>
 <20260501122424.GA6912@ziepe.ca>
 <afiO2WL4ILGfmUui@google.com>
 <20260509232155.GH9285@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260509232155.GH9285@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041654_544013_AD3ADF7A 
X-CRM114-Status: GOOD (  27.73  )
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

On Sat, May 09, 2026 at 08:21:55PM -0300, Jason Gunthorpe wrote:
> On Mon, May 04, 2026 at 12:19:37PM +0000, Mostafa Saleh wrote:
> > > So.. I suggest you update it to use the iommu_pages API, #ifdef out
> > > the allocator so the pkvm pkvm doesn't need to deal with it. Then
> > > compile a special iommu-pages for the pkvm side presenting the same
> > > API.
> > 
> > I see, we still need to leave the DMA-API calls for the custom config,
> > as I am not sure if it can use pages not backed by the vmemmap, I
> > pushed that into a separate function so it’s easily compiled out.
> 
> Yeah..
> 
> > Without this patch, now it looks like:
> 
> Seems reasonable, and then i'd probably just put something like
>    #define dma_map(...)
>    #define dma_umap(...)
> 
> To effectively take it out of the pkvm build
> 
> Then have a pkvm compile of iommu-pages to provide the functions in a
> pkvm compatible way. I guess you can't actually fully do this, but
> can do enough to support this file at least.
> 
> > > You should have a pkvm shim header that provides
> > > kmalloc/kfree/virt_to_phys in the normal way and just #include that in
> > > io-pgtable when doing a pkvm build instead of hacking up all the code.
> > 
> > Ok, I can do that in another change, but I believe it's better to
> > change the usage in this file to arm_lpae_*(virt_to_phys...) so it's
> > clear which parts are intended for that.
> 
> IDK, why? virt_to_phys() is part of the iommu-pages API, I'd just
> leave it.. If you want to narrow it then #define it for pkvm when
> compiling this file..

It is not going to be part of the iommu-pages API, I meant in
io-pgtable-arm, we will use something arm_lpae_virt_to_phys()...
which is then implemented differently for pkvm.

Thanks,
Mostafa

> 
> Jason

