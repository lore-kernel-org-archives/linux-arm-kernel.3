Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C177C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bN9JaggjBtthcoIhUPMeMbFxrz5q2FPyWPTtAmvW2io=; b=OhfyCZUVCPnRBd5J9kDEHTXlye
	4zlDSJ8DSR8Kur1YU4WCbWdQArr/4DSwy2+z9ijLViM7UEB2HQO0Wi47GsZTT9xFitw/a8ZtaS0+W
	jjRPV1U8Eu5XybnsI1/+gquO2lqOLPVovwGG94ZYN6t86BAdhrW8+h05ESb4g/7zqlkc5Yz+LE1Jb
	J+rQ8FuMquCu2AZZCdf5uipdR+W7LcAulnvK0DxSWJdRO24zOXTRfY8iZ3ws4k4K6LsUXbrO1H/mq
	cb7Nqu0BL/5nrZ/J1/IaDAoaTu8H8KbX6s+TnVFCSs/MxhfO7VZQclncsHj6efDRYvmqkgFYaPeRp
	u6tTvstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMK8-0000000AI2Y-030U;
	Mon, 13 Jul 2026 19:28:16 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMK5-0000000AI27-20z0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:28:14 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-92f03daaa97so152973785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970892; x=1784575692; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bN9JaggjBtthcoIhUPMeMbFxrz5q2FPyWPTtAmvW2io=;
        b=Oh0pytQ/6gCBCdyYf2FSdiquAo7FA58LqDqdh+Y6U2UU2hUWjzFUlnXxMPw9jDMjoW
         Tsr9gxkb7uChPVUl1d5RucxImEYaWk7bm74Utsux0G4ecfLyc/mbxhAFOXXxtatcnGip
         7npUiHtMVScMkKzZQVi31JAlYCch6RZlAzucLq0g9LwomnfQVOQbcrDflKNd0OVNUKHd
         baIARlEBeadwlgDW9H87XKX8HIPGRS1tID28PrcnbkntuWJo+rcylqtq4dDldITGgoJS
         dGEGmvG+ShlKkrEBoefubxFWv1xisWb91NY4IU2MePVCdMUqsQW5vBPAG4bq1XXbkU0x
         rqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970892; x=1784575692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bN9JaggjBtthcoIhUPMeMbFxrz5q2FPyWPTtAmvW2io=;
        b=dX07/y2F67oP3Bi8dr1hPxruOt7tjgdOHxHNxOd17V1CzmGiwmLY5bBAuJAGnfu09E
         KW2Ao1afaQeXwTkkhoY2ev1C0ko2wK/w7qVALfEvxOGjjggENG+bVGDbHZCpws4MLs+F
         WZmN5YrsAZ/L8fJHbPNUYuXIH5KTYonofN6x+vp83CB0a1UrtWOWwzhu4Z8v67T/oCuH
         eH/m7ezIm/isz7yXrYAc5f5iGJ7syxESxs563Ah/gU4FPv/sBgQNtuOF+4hB5O97WcRV
         HUoDek1EVxKkO2kieQa7p2jgBpx0m8MW63LeVFjGU/BSf/VUhZ1Rmuo86ioz12RDItCb
         p6Cw==
X-Forwarded-Encrypted: i=1; AHgh+RoseWd1ieucpD6AWT1oXlLUGuN9D4fS15Xui3g+lYMFA6rZzQ6mU4zjrRmNoXD0PbLxu40RBAk6g5xWNJBY4F2+@lists.infradead.org
X-Gm-Message-State: AOJu0YznE6zxuxO1F7ypQhFSiQUcOwHRVlg6s0+wUVIBXjvlJQX0gYQt
	p4DuJseE43idcSMf0Y/N90e4MyZQRJ4fjP5KZrIwfpJIfOEfWB1+ZdElOel9VLmNvng=
X-Gm-Gg: AfdE7cn5SmWpLNaRyB6qv5d7plTVMyfAkp9IrbLHrgv9gwzssc4uh46nxXPZyJ8XPhq
	I1zhVIAINev3OA9aTc0ECGABhqFY8W3zDh51iDRjW8ynndLKacXE4THxDokEbFonk4fUnIrAepA
	42Da3rFJQSY3B8mtK8pYsX0Kl8sEHUgTRWAwKAdvhJyhoMdS6YgB2jj6pzvEtDhmsNjMSB5fWXH
	rmCfnZq6vXQkTInz1FdkeuugeWiKaxkoUSnPFMaRvY4nqn1sWITOJJe7v0WwwQUc2U6SvOcVh5r
	mGQTJjx5OF2f3G6uRfJdOgeb6bz7sEzhZ+uCXBRycHanpxwO4cqFXfox4yth01zNslNM2ZKPqCb
	oJLlG6oyp1t7pLwp+hzty+5tVerRV2e7/y6h3IN90DXf7qESyK1LPC51yCAYPFmonxiQFIUY=
X-Received: by 2002:a05:620a:2616:b0:92e:4a4a:4478 with SMTP id af79cd13be357-92ef2b55ebbmr1041396385a.31.1783970891864;
        Mon, 13 Jul 2026 12:28:11 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbac2asm137804776d6.21.2026.07.13.12.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:28:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMK0-0000000E5Zr-4AHb;
	Mon, 13 Jul 2026 16:28:09 -0300
Date: Mon, 13 Jul 2026 16:28:08 -0300
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
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 15/22] dma-direct: pass attrs to dma_capable() for
 DMA_ATTR_CC_SHARED checks
Message-ID: <20260713192808.GU3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-16-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-16-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_122813_528533_DFB28C2F 
X-CRM114-Status: GOOD (  11.33  )
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

On Wed, Jul 01, 2026 at 11:19:19AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Teach dma_capable() about DMA_ATTR_CC_SHARED so the capability
> check can reject encrypted DMA addresses for devices that require
> unencrypted/shared DMA.
> 
> Also propagate DMA_ATTR_CC_SHARED in swiotlb_map() when the selected
> SWIOTLB pool is decrypted so the capability check sees the correct DMA
> address attribute.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/x86/kernel/amd_gart_64.c | 30 ++++++++++++++++--------------
>  drivers/xen/swiotlb-xen.c     |  6 +++---
>  include/linux/dma-direct.h    | 10 +++++++++-
>  kernel/dma/direct.h           |  6 +++---
>  kernel/dma/swiotlb.c          |  2 +-
>  5 files changed, 32 insertions(+), 22 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

