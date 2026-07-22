Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D9DC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 19:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2NbIgCir1Hq8D+FOL5JeKeK13r88FeOdRS8YSok+dE=; b=WyvKd1Grs4fXuySgGsiaTqSMpg
	douKmcuHgtopW6yZ5TzLiioPjCjMGriJ2K1iNgtyujHNur5MVBzB0TDYr6akoxN7jVoQxSSLgdz4T
	ySbhodKuB5+HIhj7ffKM5pgItsQg/LoXULob98YYI2Sr+MJI6pdrGSjk2ColfVUi40/XW/vdV9gkm
	ivEnK7Vc+7yYkY9o8ROLN2NJCBacQak6H8KVCkpcwtAOYdumkcpQMQS5F0oSjPWuZ7oKu5iZuXDY1
	lFR4wdtsTLsCEmMDVuazclwLABup4IU+GbqhfNEMu/NhzFzAE3BX/ZSyPAmgLJsFaq6224A8GPO/C
	sNaU/cSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmd47-0000000CfZr-057c;
	Wed, 22 Jul 2026 19:57:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmd44-0000000CfZ7-0yRy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 19:57:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ce98cb8165so72388405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 12:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784750231; x=1785355031; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N2NbIgCir1Hq8D+FOL5JeKeK13r88FeOdRS8YSok+dE=;
        b=X79Kq/1UCi7eYogdzJ2G6ZxwtqmSjDTm4mgN9jccnYB0R42XzbtiTUPhkJ60LI5dUq
         LeUmExvIOnpkrCIUmg4glfysvyowzctz9KdlHP+/Bmrn9r8a8jcrPlScqhgUU471O1v3
         k+I0qtuCJ2TI5J4AY9PxiYOVXHgh5kfSZ7oaoSJlXW6mgmQyElPfzYSrjRIavnGRp3yo
         P05kWPszVLGje9Iz5MgdEnTILrSAgp7+MioVKucb7oAWuHAeDIqQUPYDuPNwTKBIy2p2
         UGNz9uXsT50QGMV9cuqvcqdm0sOJxBXAv1OIFfVRQ39fc8QO1915tUAoXLbzJ3akH84H
         nPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750231; x=1785355031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2NbIgCir1Hq8D+FOL5JeKeK13r88FeOdRS8YSok+dE=;
        b=gKDnUzq6CFXh6qupmaEC3XdajAdTTGZQ8jAFAk6iV7RCwNPXnQWF4gPJm3tcakKSRK
         bnDe2kjrV0BzsZnIg1t5Yr4QUvLIOhhgnILdrw34vS8Aoi/q2c115n3kAGjd67IXoiuo
         sAAr/+Bgh4K4xe4xFebPZJi10YCUvlRu3C6+AMnhKQ5JAyZGxPq5rrTVQsbmsrSrb3BU
         m7U5sDPeySNi5las6T3zuCmVd9Gt2eS/x+SFZZH5XO8RKycxvUOOvBKOmZCvrJeGXNyO
         B5o3iZMIal2uWP/5Scuwmf/b92qKyJskkSte94Et75oZJEF93pqWeliKNo86aCwyNXFC
         gi1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpyFR/WuEmtiI30jNHySvlOnQcpfs9S/SYNqyWDLYdZw3HtlILxadPip+XdXI1yl8K6aCjEWfz6W2+1oCot/sbr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn3uVjcmau9Sgsj3ac42K7D2M0Qs7tGj3uIEgAVBlSSFygeMq/
	iTtaaZKhmu54wLHL5hj/YxVgcAS0CDiSoMpQ2wO3Ep1DESJcG0g3qpOAyxCM7qcOv6I=
X-Gm-Gg: AR+sD11Yk32jO4q+2O/wTPa9Mfe6t2uVQLOP7Wlf0zaetmHDkKE3vvxbJ7YX+591dCU
	YKcvY2UQZyarqDXxPQusB6Ot5rm8khS619nKLFmKX/qX8xDHw4KVo21nmkzlAljyozhdrf4OAZG
	JtH96JvHiYMW/u8aK43i/1td5eITdafi+NLWrurYwH9uF0gJ0K5VjZPqr4iP6QDOJ0J0gKgLd3H
	8k9HVZ6B5KXDAt2B1VfKmiWq7KyikrrJx+5QH/Rn46a3lK5MNZpq0wfL5iLJd2ablLzl8PQc5tF
	j/+qpNLF7KFl+TfTXr1Jg51xhyQwlPYHi9ftDHleA/MTWMbI8FXfhAXvZ6XQOc2ym9NVhM0TNaC
	pQD5ukF0PM+gfWHZyA7edKLDWW+lX+Kn/xfPmLSQMge7pOQ1ew3Up
X-Received: by 2002:a17:903:4410:b0:2cb:402:70cc with SMTP id d9443c01a7336-2cf8df30504mr51520965ad.28.1784750231136;
        Wed, 22 Jul 2026 12:57:11 -0700 (PDT)
Received: from ziepe.ca ([216.228.115.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm11833170eec.7.2026.07.22.12.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 12:57:10 -0700 (PDT)
Received: from jgg by NV-9X0Z6D3.localdomain with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wmd42-000000002HD-06RY;
	Wed, 22 Jul 2026 16:57:10 -0300
Date: Wed, 22 Jul 2026 16:57:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <amEglRH3u6UFFnIQ@ziepe.ca>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260721124056.GK110966@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721124056.GK110966@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_125712_281916_E999A514 
X-CRM114-Status: UNSURE (   9.84  )
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

On Tue, Jul 21, 2026 at 03:40:56PM +0300, Leon Romanovsky wrote:

> Why don't we continue the effort to remove "struct page" entirely
> from the DMA API internals?
> 
> IMHO, everything not exposed to DMA API users should use
> phys_addr_t, including the DMA address pool.

The alloc interfaces return a struct page, that is why this stuff is
organized like this. Look at dma_alloc_pages()

There is also an API that forms a scatterlist that has to be struct
page as well

Jason

