Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC30C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3axe3nHsSV3pW5ca03j1xpTM6jT4Lmr5n6MpYvrruyI=; b=rKy+JfbooVOnOT3O+ZHgsqhf9p
	MECgiOKGtF34R5YS/Pb2sahXbeYyfRWphxNXbmcBEIDI2Q89jgTMsQQbzfRMGsO7InJQJJBPxVLlX
	2IQ5v0gPWCQbrciuVqC+uWuUCKZEd5jFKCfbu9X6RP+QLjY6q1iWCuSTirbhJ/xQc4x/neV10c+uU
	gA6Jh7SFV2uxCZAmT569On4+WsNHJtc8Qb5iWMDZraSfxajL3327mMIpQWOGF2sxF82EXR3hk2gZB
	vviBCfIC2mn2HbtfJ92TWjGI7ig6/WiD8SjE3m5Smcm64aD4253mEJH+LMse76EelA210sP97zthB
	/4o2og5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMVe-0000000AIzF-3RbC;
	Mon, 13 Jul 2026 19:40:10 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMVc-0000000AIy2-18wQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:40:09 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-9034b6b7674so21908366d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971607; x=1784576407; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3axe3nHsSV3pW5ca03j1xpTM6jT4Lmr5n6MpYvrruyI=;
        b=K+LxNIRgCVvvzB3VDYmSioUQdJ7lf1McX400QmpCE+V5VgqyVXhvPyqxgmQZNBYVKC
         hTobWRRKZ2iA3ex7aYGFMkkhrTEUzk2UTM3LW5TGjtnDUnUI2Ye9vItr+s+8QW1aLKha
         Bqqs/8dGvxrQBRifaVyJNtGCLUS3VMkmwCmy5dq7MJsdsaKL65Q4GXyKDRKssmO3/gHS
         Yv7DUN4yFtrI8bGcQ7BYcMb3VHngxGhDUJiEbGA9joIdBu11Zj7eZfrFrauG3qlZTjCz
         eWCIlhWt3EERxzb4Mu6E++FLBv6cMK2cJ/ik1bBIzCL0TNwKXO1Gcb8XWxAI36dNooIZ
         juEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971607; x=1784576407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3axe3nHsSV3pW5ca03j1xpTM6jT4Lmr5n6MpYvrruyI=;
        b=QWTdC1+F3ctMuY3fo+8WPfTD5N/7N8l75B3x9A1c7TvHkKN/mn2YzSgFFgCLe3RKtL
         pYDk3/fml73+vlSPnNsvknqQifDJ6YkksNEFWYrPGwsGsNAFMjCB7RZxyTFsWxlmhmdL
         JdwJcdSW/AIQdojnHTuVENbsBCxcKin3+KYxU3feKM1NYPdkyBmOz/zpmQ5evyTb2xff
         /8VX1R8n9YX8f5YiHWm9JTsRS6Dhnwhxldz5hduzD7eshDxuRTQ9AvtbB7Hpzs0/PWdE
         XX2e5/Y8ON43Wxw/JNAKKB03LAKscozR9wZjEPL0CsQxAVcX3939S20wW0x1JQxvIbfR
         SgWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKib8rgv8fcUM44Zxzdc0bC3SqlCcF3AxonF8tRwxLMQi5wh0nwi2l4r69eccu6SYUtigt9ySWbAwOJuK7AN9T@lists.infradead.org
X-Gm-Message-State: AOJu0YyUTjQZdSHWgJhOY+6BpswTJCfYNT0quzmcIFIbMVTaN8nMBu5j
	7FARFv7cFfhyWpDA6J8gYxLzRDLC1qPU+L81RziwLVCbjFq2nECjSNDFLq+wI8SDRlE=
X-Gm-Gg: AfdE7cmMN3uVbAFKa8nZwcmWg6NEIXwrbP+YT1fN+9KD0BRgAqc9xn6uQZTG1GHWg8b
	ejGaw8ZI3XHqIFtOfDQ90NYvB2gDFg4Np/sL1AoPnWtrzoUYwQfm+E7jjbLvUwRsNbBRkHmN8hr
	zOwHjwaXSBvu3d3Ju+/Mc+igaZc7qMudCEVvXvCjt4n59YeNL0yzrTu6Gft+yVB0GHO7hOKMeL1
	yGFEekos4+cgR1nmVavKCFA1bG7oSZ/OvOaUrvscv+si1npWiVUh5nHVuIYfy8JE/hhZVYQVM/q
	Nbd+L+m20kVsjyaJJa+XJ+uVsUcuCS1wWh0cbACMnOF/F7UjQKhWdNR5Ke/07Gxw4+zBAj2EaRe
	fTAgOxLKez4EkpohUHWu2hclhD2wiHL+7D1zh7ehtWZOzpavfsvEHc52ksM7a
X-Received: by 2002:a05:6214:e8c:b0:8fd:6e12:9711 with SMTP id 6a1803df08f44-90747d1c8bbmr12839976d6.63.1783971607034;
        Mon, 13 Jul 2026 12:40:07 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c06e1sm136829916d6.14.2026.07.13.12.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:40:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMVa-0000000E6cV-053d;
	Mon, 13 Jul 2026 16:40:06 -0300
Date: Mon, 13 Jul 2026 16:40:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 19/22] dma-direct: rename ret to cpu_addr in alloc
 helpers
Message-ID: <20260713194006.GY3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-20-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-20-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_124008_323859_79E1B652 
X-CRM114-Status: GOOD (  11.18  )
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

On Wed, Jul 01, 2026 at 11:19:23AM +0530, Aneesh Kumar K.V (Arm) wrote:
> ret in dma_direct_alloc() and dma_direct_alloc_pages() holds the returned
> CPU mapping, not a generic return value. Rename it to cpu_addr and update
> the remaining uses to match.
> 
> This makes the allocation paths easier to follow and keeps the local naming
> consistent with what the variable actually represents.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

