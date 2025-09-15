Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31B4CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEs4pZ5z6UV6DIBPa4q4aPt9EKdlHVU1+3WYy5ax+Bk=; b=0KvLeiRgDmTrLUXT30BHkmDkiW
	hlHu61tN+WH7Vl+uc06lSzXF3QbuUdoVNMgOxQpliHzM3bT/1EJR9EjMD9owas2uAXzZvEALZ3xdD
	VTnzZG3qBcKyw7oVmsfKTcfmet+7M1xJJ97BN5UnhPx470pWRifM5oFOCasfFi24te3AIVsQ4/hY+
	RX4V5u7u7O1mxSPi6e2JlLf9uOsSZPhnoleU9OpABNryGVkTrAy5gOHLPuH8WJoV+Tr7+6oNiKKHM
	odJnBUvUvRG9peC3x4XPL5EOZ3G+YtiyzSTz/QAKT+pJiB5/Z2xl+tn/7CGWiL/5Yoi0YB4vHT9eO
	UWKKg/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCEK-000000058vs-0NTg;
	Mon, 15 Sep 2025 16:39:04 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCEH-000000058vT-2pSX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:39:03 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-772843b6057so3912491b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757954341; x=1758559141; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEs4pZ5z6UV6DIBPa4q4aPt9EKdlHVU1+3WYy5ax+Bk=;
        b=KFrzpczM/O4HE5D8GxJ/SEmCm6T9E5QGogwfyWfZTIJNxK2gEjumr/L9NtiTnDRgVe
         BorrLd5UQxAfpdlV4h2a1tyIaHz16MVKvHoJ2sG8uFEfZ5C6QEPKWJJVJ/FOEJy46CPn
         jPPaTtwQS6hrSzUEodbC3fIlcHyVd8csLKu7qARSIlvlFO0RAXIK15vli6XlPAv8xl7e
         7qvfvEvK37zVQZ/js6BrhiUPls+zxdiodA7vME1Jikk8wkPUznu5LTevUj3kVB3iEZvQ
         r7TQtkhRYxPHP5FvMxrZnYqxxBujR9CaLQACD65P41R6mIWtjLvQNrTS3V9DAab+FVTE
         Jl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757954341; x=1758559141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEs4pZ5z6UV6DIBPa4q4aPt9EKdlHVU1+3WYy5ax+Bk=;
        b=oR204PA3R47dFRXyMHj8q8LGHe4J2eO4wGZdoXW5iazRkgpnwPQGjwHaovU3eTn0W/
         afI0+rxfcUUlnMxv+Fu5f1y3eF3A/Y2PegiI1GQq3cdHJBpnYIv16Ub/IGuxBL0taGa4
         lP+7mAMktBTLY8oeZleorzEANuI1ex09cwH+PVcurDRZwH7/BD9XyBNpaK7JFINe6aDh
         NdtXGRaDA4ra6A/tJXdIoULvy4/7OGAzyBgFGldjC9txrpCtNFx3WOSiyRv+6kkN2BRD
         DH+8U2srlrKZnqxy18fvpsdMZDyHVX0ow1KjNatywIR9T+RSzvHLUDLfhYWkLUwPTcKG
         lI+w==
X-Forwarded-Encrypted: i=1; AJvYcCV035PXW/i5qixhvKPbIr+/YwrEV0pj2OvfqSQWyhhVYYZSYZnBQs7r72I3HoR7yaM8pQUr2Cu8eDlwIKzxwEua@lists.infradead.org
X-Gm-Message-State: AOJu0YzNUQiImy2SSgllhIH+w23dS/R7mpkBWHPLAqXnnuVsDvGLsZPO
	hfzFfe3jT3gjxc2MtrdnDXxBdloEJCNi57dzFgL9vQ/zT7VQ0wURy40SLCBjrLGP8H8=
X-Gm-Gg: ASbGncu3H/8vz+H/L37occzAcqB1IUr3ED8IR+SfsTH+JVdSyxBJ8Gxb6m97GnT6axq
	FrygPdxxO0AfK49lABhR29JqT8MeEXns+cebkVF8YkR4njCwR/Ze65hEVO0vrSQMBxZM28DydRE
	rEOPrXcIAUijVkAZRcBmFre8IJEV6W7/sE/C4c2nsBRp4B0lQ+KDB/0DxBGdPFxzq6DtJsJ3nZT
	Fw1OQrdsvJdBo//HnQObd6ak1onkoOdaWNVYHgDiF8eLM7vNs4CNQdQrri4kWIWeaKMS1sIMMiQ
	lYfXgE/SJXLsKFcP4WDdRtq89N3y/s16v37Sc6cyy3wr8mixVIbVMv3/27q2V7EFHapkozlS
X-Google-Smtp-Source: AGHT+IEq+05CDclx85E3rLT3itHmH/cfmy9YNLof0QbJTkKIbzLS8n6ulerDKoJUcV6j36ozIpBilw==
X-Received: by 2002:a17:902:f693:b0:24c:e232:f92a with SMTP id d9443c01a7336-25d26e47c1fmr168980405ad.44.1757954340679;
        Mon, 15 Sep 2025 09:39:00 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-265819a61besm43370025ad.53.2025.09.15.09.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:39:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyCEE-00000004THo-3rBl;
	Mon, 15 Sep 2025 13:38:58 -0300
Date: Mon, 15 Sep 2025 13:38:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <20250915163858.GK882933@ziepe.ca>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-23-smostafa@google.com>
 <aMQroI4NDu74PDGT@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMQroI4NDu74PDGT@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_093901_717029_386ADDD0 
X-CRM114-Status: GOOD (  14.45  )
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

On Fri, Sep 12, 2025 at 03:18:08PM +0100, Will Deacon wrote:
> Ideally, the data structures that are shadowed by the hypervisor would
> be mapped as normal-WB cacheable in both the host and the hypervisor so
> we don't have to worry about coherency and we get the performance
> benefits from the caches. Indeed, I think that's how you've mapped
> 'host_cmdq' above _however_ I sadly don't think we can do that if the
> actual SMMU hardware isn't coherent.

That seems like the right conclusion to me, pkvm should not be mapping
as cachable unless it knows the IORT/IDR is marked as coherent.

This is actually something I want to fix in the SMMU driver, it should
always be allocating cachable memory and using
dma_sync_single_for_device() instead of non-cachable DMA coherent
allocations. (Or perhaps better is to use
iommu_pages_flush_incoherent())

I'm hearing about an interesting use case where we'd want to tell the
SMMU to walk STEs non-cachable even if the HW is capable to do
cachable. Apparently in some SOCs it gives better isochronous
properties for realtime DMA.

IMHO for this series at this point pkvm should just require a coherent
SMMU until the above revisions happen.

Jason

