Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA88AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 17:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRy7TSLv7XgtK7yVOoP/4PPtFt0r1aZ67kTGnhbzw7Y=; b=PsuHT7LPRNrYy5tQ+8O8BG5L6+
	m9PPT+k8Bo3kqu/rYMdXzQucAC/A0+3APvWkMNksp9+wllJ5dOyCtO6nGDU/ea+HjG+OI7KWHxL7A
	LD9zo+izM+VvBR5gcuJim8WQvUjkYFYm+8/I82Cydc7VHVrUhYqgzM9tBZvrC492G/Jqna6XzCFq2
	w7u0NgCtfDZVgQn5OkrQFP8JF4WU8s7ymgJoaB2LdIzuSYsdxnTuyb3Ug8SKhGClsco45r17MxgVm
	TqgpfsH+1185HCYLg/fYlfLSd0geflWn+mQKbTy19x1p3L6fmR3O0D7qQBn/o9mhxfjeFrLMqir8B
	vdxbAQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCym-0000000GhxD-1a2F;
	Wed, 12 Aug 2026 17:43:04 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCyj-0000000Ghw8-2wo7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 17:43:03 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-51c4436d02cso8139271cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786556580; x=1787161380; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RRy7TSLv7XgtK7yVOoP/4PPtFt0r1aZ67kTGnhbzw7Y=;
        b=hf/VCe4r7218Ygm3T5PPCKh1Ypd3kkxuJrhR9DC98sTJREJQU6lg/taYTGK83sAiff
         Arph8C11+d440pa8qReWLvc+HABOyHuFiRpmHd1Z3DHTGVPmiDkLIbfVyBHfOj8a1Qij
         b+ntPjgov3BBYdcPSZN6n5OVicWRlKMlRhwAQaHiQu1ZsmM89wX9rNQMmgn4EH/Ubbgi
         3C0uxTlLGtKXx4qRIi8QYacdEvZtoTrIjGIWKN2MTfzGjIukgRf+1gJzrYjdhDg6RV6L
         RijoHty9PjdOkweZyFeAYTm0He6dOtghRAfzyYpAqqxpO/+ILZ3ArsiqYvT8Qj6DO0rh
         1e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786556580; x=1787161380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRy7TSLv7XgtK7yVOoP/4PPtFt0r1aZ67kTGnhbzw7Y=;
        b=NDFo7vMfHDFB3RnER0hxSvuja8bT7D0JtlKTu9Tjnw7nEf3K2Tb9ifxGBYO6t2vSYO
         78/osYwOm6Zxv8nwhTmRJRJcHFZTaOayuHMSnC7MKgxz8y8MmuCnkvRrwzU52ZTcTrnQ
         j4gRBj02TU5CkNdG8q+F/t7cr1k6isWQETyVF6hGOrDIqKAXGqhUgs11z22uetLBGX+e
         gY3XfpsNn5otRfaUItkaYcR3UOKEQEDLS40KpbjpMjjYFYC4g4Kg2N3w1sMtfnXnpKPn
         PthankZHdEIOIk+fj2izJ2bxOclqrm54+j55M8gVRvUQRcPQrRHItwk2f5HxE/n7EBd5
         eMMA==
X-Forwarded-Encrypted: i=1; AHgh+RolFwX3E5USIXBGdtWj1IJbBOs3+M/J4U4L0RyJ+vNEP3h2uasB/grOR2zEjEP2sw00xZeNCHneahW5iAlGZru7@lists.infradead.org
X-Gm-Message-State: AOJu0YwbDt/0+dlzh9aEDCZg7NBPCgTB9/Us6BwnHFsSMFuQBztfr4B6
	JoaLtSEN3KgcAA47PgkbMvzEtJgrjN3f7TfXm2PLjpLCl7JlBKz+klO83ENZlHOofp51/PFmCE/
	dixpi
X-Gm-Gg: AR+sD116OkHFghGCLw4LB3pG8D58wAv80kAAzAU8T24CkA2FlOfanNNoTMu3eO3CCZ8
	d5tgxD3L0U8XNQMkyfYwdan1xBPcLhAONKS9zb/HVYEWjD66Ft4ILSa4i2WtKnJ7CLNMJL6vErJ
	v4IN+nFU2a7tX5wqOhFpquQHWzlMOeA8dxwh6uGCR6CBGuiflvUga6uRbnYvgxtEdlbyFchgbCj
	cnpMlNv5tpqKskPmLVgycCmaS8kBaTch227N//Opy7BjFjE1vNkPARcgmdTJVYs6HYjXGE6QM1Z
	ObWlirfgC0ylYu7huPGg37cjow8Uy+DrpqDOZ7CHe27ZX7W5YEThsWVJZmtlflaiOMJkmdWEkwM
	Th4fFXaRa6S7L4kb7ZfMjfBtNahwWf2xOfG4n7Hj51w/frjnByt8qGv4RuGMJ1Qzl0JydhbSf6q
	cBWujch2Y0zYiGHCgRHN5axi1S1JhIjZJ6ln6vqg==
X-Received: by 2002:a05:622a:145:b0:528:38b1:b54c with SMTP id d75a77b69052e-52d646a004amr57067221cf.2.1786556579927;
        Wed, 12 Aug 2026 10:42:59 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d61d91199sm22262711cf.14.2026.08.12.10.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:42:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wuCyg-00000003IL0-2V6p;
	Wed, 12 Aug 2026 14:42:58 -0300
Date: Wed, 12 Aug 2026 14:42:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [RFC PATCH] dma: swiotlb: Size shared default pools for memory
 encryption
Message-ID: <20260812174258.GF662699@ziepe.ca>
References: <20260811134056.756015-1-aneesh.kumar@kernel.org>
 <anxEc8EHmJQywVI5@arm.com>
 <yq5ajypvioks.fsf@kernel.org>
 <anysnQFVTO_RAYxp@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anysnQFVTO_RAYxp@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_104301_893356_A44E119E 
X-CRM114-Status: GOOD (  10.79  )
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

On Wed, Aug 12, 2026 at 06:25:49PM +0100, Catalin Marinas wrote:
> > > BTW, why does arm64 report CC_ATTR_MEM_ENCRYPT instead of the GUEST
> > > option in realms?
> 
> It's still not clear to me why we went for CC_ATTR_MEM_ENCRYPT instead
> of CC_ATTR_GUEST_MEM_ENCRYPT.

Yeah, this tune should be only for CC guests that have the
shared/private issue.

The AMD SME issue with the address width on bare metal is an entirely
different problem that would need a different kind of tuning.

Jason

