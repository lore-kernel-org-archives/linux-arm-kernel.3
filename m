Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36826C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BBsjNZJ46p61GVJyRNvRKNhKTJyhEwUbX6XNXZgDe0=; b=Fil+gUR3jVhiSOLtYwkCcmmnRd
	89iq8Jnm7pEKBE5CDrJa4dASBZyeWyAThcsxko4pgMPxkCrmRiG2oBhRNJh4mmEVJZuvD4xX3yEGP
	763BoSXi1SwMqYDovAp84PwlMCqHdbY6JJKvPxCs/K+oKoFiIiG/XrzL0dB474CWt3tSD0Jk48iFj
	Bzi5fpf9xfx+4kG2f/K+oFzYdeYc7CItxONbDwkYjWPDCxJ35h9ToVx3kw2q2ATGm6E8lNGa7MKzU
	ay+g9EEh48FzgdTrtOjbrsF1u5tYVUHCXkoSIQ/75lkg1hd7sjYLxM7if0dwg8i7AqkzWkxoOKJy0
	FneR94Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMXx-0000000AJMz-2Ixf;
	Mon, 13 Jul 2026 19:42:33 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMXw-0000000AJME-0DdX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:42:33 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-51c2c8f43aaso31119391cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971751; x=1784576551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BBsjNZJ46p61GVJyRNvRKNhKTJyhEwUbX6XNXZgDe0=;
        b=XivMAFfzq9XeNyPoTvaN4yoooDDTCDE7IknF7IerJneSbyXff6BG6GMC0iRY+mxWgj
         WEVQSCyOqSrmYJmeyUjC56reXbW26FKmHSfk5h6c7deUqOpqYnHXYOaUFl6RDTLsU46g
         EcRRA8Rwz6ZtWAHVGJVGUue+QQTbQfVm6ZEsGf6Sb4dAZJF/WG4PlY76ucB9LSMRwz2F
         1FcI6BlVF4hS8ANOvQVQK+C/wn/vKlvnGV+r0E8MdqWxoUhRQaJYkSd4eNB3vi485DBz
         vYRd6i1ERpEiCLar59spLAQs7mEzko6eLpq+TpXH9Ao61VCaasm5aDqazFidJYUh5jS0
         Vl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971751; x=1784576551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BBsjNZJ46p61GVJyRNvRKNhKTJyhEwUbX6XNXZgDe0=;
        b=njrJVN+O1V2ZcHZWPAJLnZZDnIN6/OIEuq8P5LjDZ6mx3CPuAWLj2HH4nn3EP/dU3H
         I2b1EoLHzm8NNZOzGH507VNJIlycB12r6cR3twSuxzqfmBT6ThZWi+YOoTv5plndQakE
         LQNFtnRZcZabuzIhU2OY72ZOunC9VAZ1cD1jhibvpnp14JKBJkCsnZRWbTqHkxDh6aVx
         iF9tDc+gebjlnuLjVJesiaop1EAP8wdOvhAoz40RnO2oB7+JZuvbMpOl+WNGM9fqyOvH
         jMr2dLAyoiTtbv9rfS4iFFd/r3IUzcSOlw5jtezbAYml/TAEm+vn1kaPQBcpVY/WNCcr
         kNAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp92iXbiVN/fW2HIcTiJpJ78bh9iIRokqPxq0JzmP+Vy7fkdjL4gWsccgrhc9Wb/TNnxyhwr9E8sILABTe20UHl@lists.infradead.org
X-Gm-Message-State: AOJu0YzfnbHbV/NXow1FkKzbq7/Rxlt8tBd14dtoveZFW42Pn4V1c2dO
	3QH9nPCLUSbAMWoVnqGM5Gh+ikB1XpGsEfG/IHqg0aH9WkzDdSGbuTSZGyq5p0fHR84=
X-Gm-Gg: AfdE7cl5GcjzIagMo6pCWzf1Lk2x2OyDxZOAn6Pc7+JHSGldKtvhD9VA9ay1ZlvuGiK
	ZUf0f3dDnJw63KgEJQDiiHVHK2LgqJA2jh+Kk8rtR1lm/XCG28vbaekLdY/bKxgwS9gkasLor/z
	nMJ7b2676wpq0Abcuq0z1jMqAloe1IZUREKdtPGXFjgrlGvactmj8PRzYOWz4YZVdKCbix5Ohwx
	MuICM9t5niguOoiTyBOVu3AJRv5ZoRRgTyU9311Z+jhlWpizs+1EdhHHw2rII93VTuhHQyZlYU6
	cKZOzUr4ksF5gY50wqY8Ig3569mwPDc3+LaKObTG7ahXTV8K3zKhKhVDYj+VeL3sMMc3pM/ilD4
	AFgvfnV6u3Fem+diA+m3so7v+1AUVIVFqnX7Zxztp7ZH1GMJNZoV21d2ysGad
X-Received: by 2002:ac8:7d53:0:b0:517:6550:2a0 with SMTP id d75a77b69052e-51cbf0b836emr108931441cf.19.1783971750625;
        Mon, 13 Jul 2026 12:42:30 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbac2asm138277776d6.21.2026.07.13.12.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:42:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMXt-0000000E6oU-2oJ5;
	Mon, 13 Jul 2026 16:42:29 -0300
Date: Mon, 13 Jul 2026 16:42:29 -0300
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
Subject: Re: [PATCH v7 22/22] swiotlb: remove unused SWIOTLB_FORCE flag
Message-ID: <20260713194229.GB3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-23-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-23-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_124232_105417_1631ECA8 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, Jul 01, 2026 at 11:19:26AM +0530, Aneesh Kumar K.V (Arm) wrote:
> SWIOTLB_FORCE has no remaining in-tree users. Forced bouncing is now
> controlled through the swiotlb=force command line option via
> swiotlb_force_bounce.
> 
> Remove the unused flag and simplify the force_bounce initialization.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/swiotlb.h | 3 +--
>  kernel/dma/swiotlb.c    | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

