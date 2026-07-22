Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0159C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 19:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEIQnXJI41GVGpHCEj7IDcqZ+AmiiYPwRk5ZlYk7rZE=; b=KlmIDc/il/MyZTdJjzIllLrPu9
	/OjU+64Zufvc3BlpZ+F1zpYTxg5bxU1qipKBbLXIsFpYQLsjjuc47DjigzHgCxpedlh/tQJspmq91
	S89BBfMbBHLItjxuSBJHEKQZrW1c5c02K0NEkQykoKOgYW434vqiljMpW3z2Bfg9vn4OTzCSvLsn/
	22JGPgVUy8uM4Dm4l11OMFNUAhscEcQzeKHPxi/4xx4trk2K6Gkuz7S+XRejH2utE2xZP2q0VKR6S
	wPIFA3yRbgDSq++0dwtmDULzj+e8YR/66T3AAlhrlYL9zscLtPMG2yW9tF9KnfbidN+nJ3yqFnMaj
	uY7S6HtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmd65-0000000Cfn5-1ZJY;
	Wed, 22 Jul 2026 19:59:17 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmd62-0000000Cfmk-1y5U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 19:59:15 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so7399600a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 12:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784750353; x=1785355153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EEIQnXJI41GVGpHCEj7IDcqZ+AmiiYPwRk5ZlYk7rZE=;
        b=VkLBHuzADwCk+MZMqn67cXsyWOuNM2+mg1F6xwndTnppsLPjdKSOUr7epBAPtbiAIY
         AraRRsZhvB96DeyKTEMorf3sxAbUWdqV4cfpnNpCUDGxpvGlio/oMVexrjqAjJq35Kov
         bzvSi8Fm8qUidQLm8NKIZptteFbxzXl0/lA+J8rzCAqdcp99bsuzUsUX4yLg0VY8A9AE
         x9KxMM2C+W9gOA3vIRVZRZaFnI4603U2zsyqIVJSAuNTZS/tR0UNzkS/Z4haI/8urzHM
         D3X/yVVeUnJ8o5BDF0/nAJt2klCPvnXabLoAafCGz4zXpgCwilEOINQ1uU1U5vGem7nj
         os1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750353; x=1785355153;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEIQnXJI41GVGpHCEj7IDcqZ+AmiiYPwRk5ZlYk7rZE=;
        b=kC4THczlnoU+qqzZETK8b7bPObLN8/kintt7raci6iuk/TqFYj05CAVgNlTM75RlWj
         g3FBxclfYmY6LWGAIKxOluhnrMN0z0iaIbrKe/qwg3NXaUeIgt/bC2TRg8PwAfRfQ9c3
         0Opwmfobu0tuFVRq0fFpfVURZHWq8MjsobCjFRF+8iNP6PnU+g4f75SvzVfhu96O+yBN
         n1IrnMvaKe89KbxzvhqhfDc75TQbDSzWDIwLLljoSyeJHdtjciMfuHSxj7eTVdE28puV
         RXeSdG+zk7um5FGcuhmn59VLDM3eNd6gdxijepTRhhzotKvmDNHQOpkuWmmNENmIMl8p
         kfXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpG8U/DFTkAe3Ty0+L+hoAm+CK0kM6B5sYQbI61gFI5vsypjjAlDUrPancPIaCkBXG6tOvyaEzBt5vdcLc9SPGF@lists.infradead.org
X-Gm-Message-State: AOJu0Yydp2Cu1P8MJUKIzxHn5DXxsaRCinA61T8rG22vMPYIjd+i+qBo
	+A7F+Ak901530WAAf3WHo8ctaYw/ECP/S5YxZhOZdETXjmbOgEU4cOe+xvKpVja3obQ=
X-Gm-Gg: AR+sD116KepcaORzqq5z2e+LEx8g8/hWJUENACkBj4+0hihPD3FWWtce8jbd97mIdH2
	n1OAKCWLyu75k/NqsLNAbS77XR3jH0XDGGD1TSr65swRxl0ZUfbxFgcCHU7Oc8MDXjXX6NKCuqu
	2sscw/fE7eN/y1L4DGHhHPencageeccDJN/MW/1ei2O/SjejHZRGwOA8W0VkCcRKIbI2e9lcnVS
	f3fya84xZJMpNaxPrGdeoIi/I+eErZJiH3p5QV13P7/Jb1CeNHRvOGfcbTHDSGgLEu2anWodDv2
	pjNfTx5oCgAiU1sW35GQbdwLnpIpPole7weQBJzGpbjo5oAQzoztPHJiBEccMA93Hje30y9i8Dt
	phqXASRGb0qYalpj4rGE4Q6cOegmeRCn65nm1BTj5KBzxm0RboPq1
X-Received: by 2002:a17:90b:28c5:b0:38e:7080:b4c0 with SMTP id 98e67ed59e1d1-38ec6979bc6mr98413a91.10.1784750353408;
        Wed, 22 Jul 2026 12:59:13 -0700 (PDT)
Received: from ziepe.ca ([216.228.115.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm14809771c88.2.2026.07.22.12.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 12:59:12 -0700 (PDT)
Received: from jgg by NV-9X0Z6D3.localdomain with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wmd60-000000002O0-1hvF;
	Wed, 22 Jul 2026 16:59:12 -0300
Date: Wed, 22 Jul 2026 16:59:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 01/23] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <amEhEKQW0_HJ9cLN@ziepe.ca>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-2-aneesh.kumar@kernel.org>
 <20260721115456.GI110966@unreal>
 <yq5atsps77c5.fsf@kernel.org>
 <20260721142921.GN110966@unreal>
 <yq5ao6g0750v.fsf@kernel.org>
 <20260721153321.GO110966@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721153321.GO110966@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_125914_510393_B2895382 
X-CRM114-Status: GOOD (  10.02  )
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

On Tue, Jul 21, 2026 at 06:33:21PM +0300, Leon Romanovsky wrote:

> Something like, but probably void* needs to be phys_addr_t:
> 
> static inline struct page *dma_phys_to_page(void *addr)
> {
> #ifdef CONFIG_DMA_DIRECT_REMAP
> 	return vmalloc_to_page(addr);
> #else
> 	return virt_to_page(addr);
> #endif
> }

I don't like this, we don't know for sure the addr will be in a vmap
and this will fail if it isn't.

Jason

