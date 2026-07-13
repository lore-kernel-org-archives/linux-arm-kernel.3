Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF737C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfyQxZTxEaV2M3A7Wuj8sGJT6iMHPBQ3Q1zHUbuKZKY=; b=lknMubzqbCX1+tJjghUkMsyFWm
	EKUKAKMEVVTOfib/MtAvcZcVOdtTeirUeSq9ssRQSB1UeUtMlwCNBX8Qq55YOtVoqDhuTyXUUy5t0
	KA7E9eF2v1fKBE42msE0kzv3xG99AwjNa/BVa2hP8ceoLFqezj+vxiOmLZz4iJKEsn2F77xEGM+Ek
	oOApkNcfdzxaL/PE62PxPx/cJ/+vRH8BtNttL+QwFnaoPVmfl8QJpTKvvM2IGzUMznlwTQzKyLce1
	ZBndSdH4TC9xonCtHrZ+AvDRK5INHfZh6GFsuOqtLMzEXcKk8PWm1/CrzUprgGTqksjBcEtU/R9lt
	rgR8x5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjM62-0000000AGNu-1Kko;
	Mon, 13 Jul 2026 19:13:42 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjM5y-0000000AGMz-0bcx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:13:41 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-92e6a434cabso16691885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970016; x=1784574816; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GfyQxZTxEaV2M3A7Wuj8sGJT6iMHPBQ3Q1zHUbuKZKY=;
        b=mz2/rywPJudJ8ucq9+GQmcEdbj4VPA9pDdEgaZCekjnxly6yH0AMNqprj05CCPupv0
         +AXC0phnnmLzjdzAwDuVddmEfakU43cPBPvCfMHgVDHChygPy8UUb/eaK/lQtTkJlv1d
         DKlnrF+SBCVJT9YfVkBa506TmpPQyh/zlXCZE1V+3I3E7jmH9/15qEAgwN1PZXo5pQ9G
         azL5E0/fMQ2RTmu61FIqsRkKwquVI+P+qfKVoUnx3QsA+zWIMiKImdcnm54sSuZjRjro
         4GqDdodSQTgZa2E9GtU1V0NF4y0dTjw1stX2wE3eqAEF50C+DzfHiSmoQRpPdkl5Ty5P
         lbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970016; x=1784574816;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfyQxZTxEaV2M3A7Wuj8sGJT6iMHPBQ3Q1zHUbuKZKY=;
        b=F/3KXuXSamcKonCL0jWd2JMrq/x704oHZlYT7fVmjeocG4tF8tsNhL75fMRF7Pjbj+
         ABJAW638Z15MIFa2/56WGoXiIWyFaEHA9Ht5PQfrhbGPPfnM97yDOVlUINxYSp70iIQe
         Hpw9R8lPPwHLJqoOOmKA/pjntG6Hy1zcmRMn+O1+FXHPoT3B0sOqMDL7zLzRaHcU6UVP
         CKu334hMAy5twm0xVQIC/fR6CTUtvQUTLmba4MlQcjIVna55c7stbtb92iWh7VTBI2EV
         gkHeCJ1XnNEGGjyWNNxBG+/AERKfWOoNd5dh+u4wfzoaWDe1B/+WrAuXHh9mTsssspZY
         YS2A==
X-Forwarded-Encrypted: i=1; AHgh+RpyqTWSEJcbTwqmwOLPIo82ZtgZnyk7eJ1Cbq06aZjtshQBs4aRv3ueDvC0761hl3dxism0I9Jfls8k2dazZ3lk@lists.infradead.org
X-Gm-Message-State: AOJu0YzTPzo4IaQnKdMlYSqgrY8HavVgV/4qeTjMZ4lc5alt9QaufTW7
	3AQlyvw5JSeOXK4/lBhzDoz3756WQJaP4Bc84L4uGFWmmF/+zVfZcMjZuFnbCNQD/aw=
X-Gm-Gg: AfdE7cmpCcKMrwQLHkaO75wfNkOgY2hvvqQj/GHQDRmaRkD8EQ5dqIbtKuPaRmbk77/
	/QAgzQtKJpszgNAEXmVKtBrwCrHn8BYHN93xY43n2M+0Fkiwvo7ZXlV59N8gp2ilmpYQbzTmP09
	u3KewGVhRNSaMSITGHpTafcUOcEuYA/jufqF8X6BOll7XVCi+zkm1wWACfYCvLq969lmE1I9bOk
	J4ukUb7y5HdAU85LQA7hTyYQgfZfjyTNvCYZPocmEKMdtl6/uJTOuhAzY2ICblCbcJ/LZyqP+0H
	z96UoAt5WbyeNXmqYMp4+PxySUHAuQxq/fv1CdwkItt8gK8emyKFEcdBB6w4gFY8mD7BBxP25I1
	Rrq7DWJrcHvOF9W3DAc//vASboFQuQFeWokdptpjS7Z67hb4OSw7BKsRAMOeb
X-Received: by 2002:a05:620a:8908:b0:92b:6805:9198 with SMTP id af79cd13be357-92ef2c69c53mr1083302685a.64.1783970016442;
        Mon, 13 Jul 2026 12:13:36 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5bab293sm1169545085a.18.2026.07.13.12.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:13:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjM5v-0000000E4M5-1cBx;
	Mon, 13 Jul 2026 16:13:35 -0300
Date: Mon, 13 Jul 2026 16:13:35 -0300
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v7 09/22] dma-mapping: Add internal shared allocation
 attribute
Message-ID: <20260713191335.GP3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-10-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-10-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_121338_192696_2531B75E 
X-CRM114-Status: GOOD (  13.92  )
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

On Wed, Jul 01, 2026 at 11:19:13AM +0530, Aneesh Kumar K.V (Arm) wrote:
> DMA_ATTR_CC_SHARED describes an existing DMA mapping whose backing memory
> is already shared, or decrypted, for confidential computing. It is a
> mapping attribute: callers use it to request a shared DMA address encoding
> for memory that has already been prepared for shared DMA.
> 
> Allocation paths need a related but different state. Once the DMA core
> decides that an allocation must use shared backing pages, the lower-level
> allocation helpers need to select shared pools, decrypt newly allocated
> pages, derive the DMA address with the shared-memory translation and
> restore encryption on free. That state is internal to the DMA-mapping
> implementation and should not be passed by drivers to dma_alloc_attrs().
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  Documentation/core-api/dma-attributes.rst | 29 +++++++++++++++++++++++
>  include/linux/dma-mapping.h               |  8 +++++++
>  include/trace/events/dma.h                |  3 ++-
>  3 files changed, 39 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

