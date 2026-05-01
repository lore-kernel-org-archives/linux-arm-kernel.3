Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373D2CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxL2PZx/4KiAYlM/BSrsH2KIM4aSQy8bJWmezhmWpbU=; b=GwsVsS706i/k2q/kNVHnJqzKiu
	k3SKjL47jn5Saf5wEoqhlBEVLOPGI8SnRuLJ21eryygZDRkFltz3JNP7UzB3VtYlyn1dOCFc3AVHl
	7ARQIHU0N15Pam/sPIU6AarQSvmZReM+CdicseK+ts9R5ItEk19/1Hnrq6n9D2NgukSGCQjXWFgDS
	QhVcyWiKvZMDE4psN9DCEAACnn1n4QZ8IUu764GswtEVeEjblqkF6A7wIdGQNEGps1GopK0XcyyA+
	pE/ehcQUNfory1kDQb3F8pF2qYHu5rLSNLFth2BQdRMe6n9duEN6tJObaoAzxbzdB/I+AFthTjzJj
	jMDkCdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIn3u-000000076MB-3ERD;
	Fri, 01 May 2026 12:33:42 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wImux-00000006zMx-3JBJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 12:24:28 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8f0a87e23daso199012485a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 05:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777638266; x=1778243066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SxL2PZx/4KiAYlM/BSrsH2KIM4aSQy8bJWmezhmWpbU=;
        b=Y8El7NqMYwP8CWTbufp1rrpvQX2BaSiYanQF1Dg6qFX5RuUioUbgId11UbFWAQ0PSB
         AeTrJ5y8RXIO0q5MgzaSDrtHdZfh/k+VJ3XN0GTC++TH+AHqvxteyngl3S0ntxrP40Oc
         rdy4fsQSPuFbog35ng+GeF8bDmBB3wmMt2WM+vuS5pVCoxulUgmiiPqCTJS0XWmd5f+g
         A4jv604YE60sMCqqAdmjL4Vw/BcBsZhsHwPQ2J74I1qaTxRVg7fcBqF9kL4Gg0MztylE
         K3ZVURmX8r9Dx9W+oVRIq2MP/UuznlpUPU9LVDkOxoeHg7lR4L5L3Ll8tEtNOk0j3xVl
         YYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777638266; x=1778243066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxL2PZx/4KiAYlM/BSrsH2KIM4aSQy8bJWmezhmWpbU=;
        b=CyNZMwxnlpYZFyaPtVJDqyFNZaeKqbdtmb/aG3McPiHJArgEIuFiuY0xMYZYvP1shH
         dp5572VJGxtf4riS8CsrFKyy9fKZ40ahl5Q6BG7c/OYf5ZenzOxjiopTxXbOO93vYBhi
         A5OOxcL7bM5ec7bipHL+tf2++MpIQZT/vN+NbDhBoYdKLgCAUeXxhobggyn1+YDuD39z
         R9rSSzKzfDfxV4eiCrD3iMAaN3Pbx6+uAx4ps84YjKMCkDumTJEjs2FwsZOgcP4bZbHT
         hwl1WDMHoJ6OnVPcox/FatQ2LF3o1mVVDVY42XSShg3e6zKqGi5n4SbtTMTUZOH3AQrp
         1SRA==
X-Gm-Message-State: AOJu0YwGMt+IrIZj5BU9/Q/V6K+zVJXwZRqMsH7FfT3h2XAzZbpHeSnV
	g3kA6TtqpxDGC+UOBy1jRu/Wdi1L9RJCbNu93VpA40yxmY580NLRwyhX1Q4IAP1lW/o=
X-Gm-Gg: AeBDieucWGM85guMgNjjoI/HalPWDAawfo1MTpF3t01T1yDMAv1gSCcYwQRrOmzVJzU
	aowYjtZy8XzlLNLtfrTDAmVFwFgNz7SNYEnWOn8ftO6kNlYieC0HLORzJ9NElaNAlAUzEYtbNYy
	AOLzickctKahGxAIQbEZemCwKReuuufUjwXnhFEuzPvEELDeaG7yUCbdCEsFFk/7Vql6EuD0jqO
	Gzf7b7WYfSrj0Ltuwsb8B8HHsns8DWM/BI0CeS/ngUlTovUSdkIMT5M0ZMVpzQNzmDEpDzOzBN+
	P+uqyH18AWBcQqjhua0YEktM04mPM0ItgM9n6l97zm3Gf8r7hCv2k44iiyq95hAEusfso8xwGab
	LxUp4YpcyGtuLN5OmTQ4xnLWwy1kmprsp9gVv09vvCVVDUAhwC1p38WtDX9zKTP/jQDl5cMAQZy
	p19P7bu9IgCZJlaX2S8prwXiKoM1MvuAbVp967asFvG/HKMvDmLh+yXBHUw5l0PqUzVnaYrjEjH
	1yZPyfkSYb+dXGfykHoP9M27mQ=
X-Received: by 2002:a05:622a:1354:b0:50d:5f34:9a with SMTP id d75a77b69052e-5102add7284mr102979121cf.28.1777638266137;
        Fri, 01 May 2026 05:24:26 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b538c14514sm22998866d6.8.2026.05.01.05.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 05:24:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wImuu-000000053e9-3BRf;
	Fri, 01 May 2026 09:24:24 -0300
Date: Fri, 1 May 2026 09:24:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 06/25] iommu/io-pgtable-arm: Rework to use the
 iommu-pages API
Message-ID: <20260501122424.GA6912@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-7-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-7-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_052427_938022_6F7F1F71 
X-CRM114-Status: GOOD (  16.39  )
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

On Fri, May 01, 2026 at 11:19:08AM +0000, Mostafa Saleh wrote:
> To prepare for supporting io-pgtable-arm in the pKVM hypervisor,
> we need to abstract away standard kernel allocations, frees, virt/phys
> conversions, and DMA API mapping.
> 
> This patch introduces a set of generic wrappers in iommu-pages.h:
> - iommu_alloc_data
> - iommu_free_data
> - iommu_virt_to_phys
> - iommu_phys_to_virt
> - iommu_pages_dma_map
> - iommu_pages_dma_mapping_error
> - iommu_pages_dma_unmap

Wah? This has nothing to do with iommu pages? This just leaking
everything iommu pages abstracted out :(

When I said to use iommu-pages, I meant to use the existing API, not a
completely different one.

From an iommu-pages perspective the issue is this code open codes
dma_map_single()/etc instead of using the API surface
iommu_pages_start_incoherent()

This is annoying to fix beacuse the external allocator messes it up,
but I think with some #ifdef you can probably fix it up.

So.. I suggest you update it to use the iommu_pages API, #ifdef out
the allocator so the pkvm pkvm doesn't need to deal with it. Then
compile a special iommu-pages for the pkvm side presenting the same
API.

You should have a pkvm shim header that provides
kmalloc/kfree/virt_to_phys in the normal way and just #include that in
io-pgtable when doing a pkvm build instead of hacking up all the code.

Jason

