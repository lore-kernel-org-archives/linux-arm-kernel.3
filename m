Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD40C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seRQ4x7WCVBDlRNvM1ESoBfWnXSVwL4ZPJ5Cc52Vq54=; b=xaRH8/7nXOeOR/E/UrsIoeLvEa
	7S4+jrOIUJ2UmHXZ2gl1SsqJJbWaoG6ciGKGn4Mvlzxig+5gWq9ZqtoaYHY6tQMoEb0Wy2EOnodY5
	m48sZ78yzLXKdxyAV9fU3DYYgevJIriYkhB8sEkWp/CT0SaW6Ou1x/BFFDkCLNSwWIvXxoHopIbfo
	5op6iAmGON+vdZ8qfor3nAahVsTLGsqzZ/zVaP3W+7x0GjDc/o1nLxkZlB7o6XGM/UrM7m+Md3T/c
	XIFKVWAkJSp0XmzJwTaRnPBcrj9ws9IERuy72MBVxd68MZfgrwZ/7S0gQC3+sCkWRp4Q5/jwV+ClC
	yBjigoKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMT1-0000000AIiN-18Vv;
	Mon, 13 Jul 2026 19:37:27 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMSz-0000000AIhw-1H7h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:37:26 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-92e5d50b0dbso16345185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971444; x=1784576244; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=seRQ4x7WCVBDlRNvM1ESoBfWnXSVwL4ZPJ5Cc52Vq54=;
        b=GQSihPtQRi8+9bDiRfBvlTAHdqD6PpzWE7Yhy2mw8ou3BvBHBd3Z5jq3hA0WHmk6ir
         H+LdLRwW61WmtFexvkcOJdq6/gpoiwRlxWwKRzayUyzlhJFVN2h9aIxTuUj4Oh+R09Jj
         yob+ts4S2zuGQburUbrlG/IbDUevBw/f1h7vtSyTWRozVT7SDquejejusiALGNb6Na9m
         nR17dKvdW2kVCAo1v/IgByHcgvhLyR9cJIUFPELx0CQcx9Id5O8G+9TBRWu6+KNQHuya
         FkTBrEBA37K9UUpD8S7n2kRM6EmPYfxv2zU9IbiiFy6VBl1YHha6O9dCY5mIGZ8S3ZbM
         bW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971444; x=1784576244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seRQ4x7WCVBDlRNvM1ESoBfWnXSVwL4ZPJ5Cc52Vq54=;
        b=rwMEH/iPQzlCz5Bn+1FgjYknJl2hc+HDpzKyIDdFiA9WUhWVFUCe3pgTmypKzYS9Hx
         djLS4QiftDmO472MRuzX1wrlfKQwhFp/vCCVX2/s9sxphjVbEQamUcCo9sad3+8X6sBe
         0y1aVpOZSXOBeV4J6PjoQEWvqYcVV+Amkaoc3EUK2NZfjP73Mz5ZIqG5DaXq57JK+Jt5
         /AVx4vFVXH35bTmRtAZtH7gHY39DakX+pfx1lNM3YdSSzoc/CUnOm1LfEydFsPw3HbUw
         P/prF8K8syizvZttsIViIK0KpU0dLZtEbj7pMoIvEQMRum16OSgmkmg4WeDjP79bjEGE
         xcCA==
X-Forwarded-Encrypted: i=1; AHgh+RqrRzAVmaOYfqFFxkpOPfXJhKWOBHmUVyBQUWWbS1Mf0R0eC6OckqRBy2FdqnMHqoKJtM1r1BgvvTP/oz1SoRCa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx00Eg5WSw8VOzcTWA5bGU0Alefnw5z7cCi1MRV2roWBKQ0Bi5m
	3ob+Why1/11s8YZ99PR6nTnQZ8EarajVxrST/TJijbmmHmzr5YENz6MpChKd7OPGEyw=
X-Gm-Gg: AfdE7ck4c7Up2pAg4PCv2HgIEhfrC0XBq4Wy26aZAwZS6m5KYpbdkJL50RsbSUSlDLK
	Q4bZycDOo26O01dK09GMwXfhWTIqo8YloRtQNpXKohJ3Yxmqfaw8MzIoTnzgdOuKP6Zjr60Jrf+
	/m5VRTKOKZq078OgW8RPPnZSy9awqrdI4YA6aAj95k0aSh2FIy/ZoxMWfqkDlPr7rQb169HAZKT
	oEyssfI8ir6EkwBxuBdUoVI+tHee+VLXOn8pjq0RJ4dIJ9Yz8JSY0Yb/Ifa5uOd8bOYCVoN36VE
	0w7ZHb79uf7VWyWoqxpuIIHSrhRU6k0a6m0ydIh4evBgPrIJaNiORlM4VJokhtTyczI7XVpuieW
	cXhMFkGbhcsiDwqrGgifWv7iomTfIP6vbVkQakNWEKqHEHvTO8Vr5vzs+q/OS6NHVb3PHTac=
X-Received: by 2002:a05:620a:2551:b0:915:5930:94e6 with SMTP id af79cd13be357-92ef2bcc91emr1112783085a.51.1783971443832;
        Mon, 13 Jul 2026 12:37:23 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b86276sm1177578085a.11.2026.07.13.12.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:37:23 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMSw-0000000E6Rs-2gqS;
	Mon, 13 Jul 2026 16:37:22 -0300
Date: Mon, 13 Jul 2026 16:37:22 -0300
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
Subject: Re: [PATCH v7 17/22] dma-direct: set decrypted flag for remapped DMA
 allocations
Message-ID: <20260713193722.GW3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-18-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-18-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_123725_359553_C1B40D5A 
X-CRM114-Status: GOOD (  12.84  )
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

On Wed, Jul 01, 2026 at 11:19:21AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Devices that are DMA non-coherent and require a remap were skipping
> dma_set_decrypted(), leaving DMA buffers encrypted even when the device
> requires unencrypted access. Move the call after the if (remap) branch
> so that both the direct and remapped allocation paths correctly mark the
> allocation as decrypted (or fail cleanly) before use.
> 
> Fix dma_direct_alloc() and dma_direct_free() to apply set_memory_*() to the
> linear-map alias of the backing pages instead of the remapped CPU address.
> Also disallow highmem pages for __DMA_ATTR_ALLOC_CC_SHARED, because highmem
> buffers do not provide a usable linear-map address.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c | 56 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 44 insertions(+), 12 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

