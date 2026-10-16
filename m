Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAEACC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 00:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2saNd2pf5xXpmgizEGMG+P83blHZRupazL/vtIJhv4=; b=UWzoZiAvF84Uf23tY8WxocOGLn
	m2T1s5whb50Z0B+JTKAvMGEu8gyyCKhYegz4cSBJaH+T71VW96XlaWZ3gWv88oKzZqOAZ3SzC6eE9
	fNNAzofdOklfFEegK00zaoIP+C3pJJDQF8Yox8PxDJgC86a9fBxMFM8RWK9hcmENruElP496aQVSh
	xVCDpPVCGFzLnQKn2ubxkr/LE5T8p5YGUdoCyjrIqcD96bWAge5QxHvz/QWY79THKsj+kZvY63Lz1
	MXOtHQoT4DmAwwdfjzyqRxfD6dHiWF5+KJEiXqv9v9tB+XnepZ8xhmHaSUH6hm+vnxSKDoCvSXwau
	G+gXe+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVb4-00000001bNZ-0805;
	Fri, 16 Oct 2026 00:14:54 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVb2-00000001bMy-22S8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 00:14:53 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-5351d76e1baso5830011cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 17:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792109691; x=1792714491; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V2saNd2pf5xXpmgizEGMG+P83blHZRupazL/vtIJhv4=;
        b=OJTw8psdF6P16D+q2y01uCb2Rvdz3Az4mmAe2/t6cDlaOcs3aJAWz2RWvBwl6zZHcn
         nm0hJM5He2bQXvQhdjVuravxrR+Az1OVJnqwCpTD1rZOAdBjTQxNHF8hYvst6dwb8G49
         0SgBQOYqJIB6lV90cqzLJGyABYkiNLsFaaq50sHR+j+nu6UICwzqqJJ9SlEaVSCel512
         VRUq/lkCXxCrTtJCtt8w7BwpYZW8GJAK4Oq0Mf4wMnNGch9AsPHx7ZhguXsakAgPCazs
         T+Qoq5P0AKLC/Olsz5zfZkdhIYihyFE5iaaVKEzGV+N6um4s+gZFc9xLLF95fWvqLSBG
         /tpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792109691; x=1792714491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2saNd2pf5xXpmgizEGMG+P83blHZRupazL/vtIJhv4=;
        b=IZ8aipzd3Zp5Bzkkyoxu3kZoa2NogRGMLS/M4/USUFv4BNeiDA8GqqU2EPfJ+aMBj7
         5gs/cpPHciIbIZ4KockAk3xjHcx3lQotgiienvQYCvFrq5QFXAqWzIP8q2tQs0kaDLLd
         YS2q2bwnY+EqaKhs9F8cHYsDIun3K1hTBukRRsNMnRX980wHB7mJP3VdZaUY1wGa0ssV
         V+p3Aej/idnENHKOtmq1lflDTOQf0YV44MnlqcouOJw+dtOHEXr8DSXrU4ptb6Fn+CUB
         xbF1ImS0TeoWfaMUaw3QWlvFwoKJgrkGb4e+qGtHLW4rJOvbhH7tS/eKMESvdI6sWBOv
         TVmg==
X-Forwarded-Encrypted: i=1; AKwUvBx7vwAyOqvfB3qosWLXaOjqKzMFNk34qSI3lt/EQaxhSQSCerhVhiSa6bdRKdtJP2Muf6Vmqf1yDEiXPPzsZmQn@lists.infradead.org
X-Gm-Message-State: AFq9FYJhU0nT2MskD52FCSf8d/o9NcVoXgg6CTLbQAFaDijMPiRrg+SW
	tcWFr9qcOxKjieGw6lu+DFJkNiRRo2Q8WJ7vi7SkLWNE0+pgJul+m5VX3VyZkTmCEk8=
X-Gm-Gg: AYBFou3yzUlFrNcSrO9S8oN5oou6/mBbMOqAcRFisavsfA/uEiWkrzBJZFCJTikM1FV
	bnm/Rvce1YgI/F4tIcEkGaRB3Ad1lczUc9l2sUDGjzviux+63DgWS5zGjjGIc2l17d8JShj0p1p
	SRz4VmeJjrirsTshaMCZ0dJ48c/8EHpSNBLTfSa8sQb8vunyhc6ShsgzXBOusWw7P6n6+4z91WM
	TVp3yUCDYjwhwIg/zwYsWdfUm6j0Yj+go6rAS5ozZc4GtotupJvaxvvCqd0ZHb0XwFTVdm7CjH2
	qwWU3Tz1BGmnihxDLFianKgJbbrHolD0liU+xEC1tl5JHYr8lFDjKpFEUdjjXkuRwEy9Dv351EA
	WkIazdc6k9Y4pBvGPL44UGw7EMsGe0gdcskhjep7uvyNZTC5MIC8UVK2O413j97xTG2X5G2xPFA
	tkz5ByTt+6eDaE0471iBGpdu7jMp5bt5DMYrGA1dfzw4+i1ukMLVFaMBEppwDqfyAuUdxOY5bYS
	oZhjG8NFkA7AQhg1TSOaIdxmO35w79QTojj9xszkC86kl7fnNR+cRA3
X-Received: by 2002:a05:622a:990:b0:535:ba01:d95 with SMTP id d75a77b69052e-536272c2d55mr30900421cf.19.1792109690637;
        Thu, 15 Oct 2026 17:14:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa57106sm7257071cf.28.2026.10.15.17.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:14:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHVay-00000000IxD-2c33;
	Thu, 15 Oct 2026 21:14:48 -0300
Date: Thu, 15 Oct 2026 21:14:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Fred Griffoul <griffoul@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 07/11] iommufd: Use large IOMMU pages for provider
 mappings
Message-ID: <20261016001448.GC14213@ziepe.ca>
References: <20261014093733.90312-1-griffoul@gmail.com>
 <20261014093733.90312-8-griffoul@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014093733.90312-8-griffoul@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_171452_537111_4D9F8919 
X-CRM114-Status: GOOD (  20.57  )
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

On Wed, Oct 14, 2026 at 09:37:29AM +0000, Fred Griffoul wrote:
> From: Fred Griffoul <fgriffo@amazon.co.uk>
> 
> Provider pages are mapped with one PAGE_SIZE entry each. A device that
> uses a large provider block then misses in the IOTLB on every page, and
> the IOMMU needs more page table memory than the block requires. A
> revoke also flushes the IOTLB once per run of pages it unmaps.
> 
> Map each block that the provider reports with large IOMMU pages where
> the IOVA and the frames are aligned alike, and with smaller ones where
> they are not. Only the pages of the block are mapped, as before.
> 
> A large IOMMU page can only be unmapped whole, so a revoke that cuts
> one widens its range to the whole page. It maps back what the provider
> backs now, and a device may also fault on the rest of that page while
> it is remapped. The widening finds the page with iova_to_phys():
> pages that only look like one large page make the revoke remap more
> than it must, which is harmless.

You are going to need to go into generic_pt and implement cut and a
more suitable unmap to make this stuff work properly. We can't over
unmap on conversions.

> iommu_unmap() may not split the range of one map call either, and
> virtio-iommu refuses to. Map each IOMMU page with its own call: the
> widened range ends on IOMMU page boundaries, so it also ends on map
> call boundaries.

Also please don't write commit messages with AI. WTF is this even
trying to say? The subject is "use large pages" and this text says
"map each page with its own call"

Jason

