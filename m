Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D7CC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 18:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlmgqKiyqc7mU7pAn/JSXJE8TLhKwTlI/zLMMe65kC4=; b=TQGjVjLiafJddzohRX9WQKTwS8
	77woKTWSKdEQCiD6/hnDPjk2QsvWfPZJS5WAQIjgY62DZhxenm30ZuoF5HbYH/mPI7xdO/Jud3/Px
	ZaYnPg2nUj/yA9Gl8411UCPIIrn40Ti9l1OrT8K+b+r+zMtH4tKfUX5hInUQz7eCQC/NjDAZI7oYL
	4gWzInTPz2yBQQmbk6vuh21DOnDESK793T8TAzS70/OUbuEwyGHytJDsJBs8CtE0PTEkSqmkMq3xD
	A11Id7MubMV49PQC4XNcxPEt0Xjz7mjUEt3glZV03Fnz6T6hUKF0Nmo7u06h5W7UfTXFx+RnFARE1
	0QSLcXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP51-00000008Z08-2Rj4;
	Fri, 07 Aug 2026 18:14:03 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP4z-00000008Yze-1TQH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 18:14:02 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6a177b2dc8dso1036a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 11:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786126439; x=1786731239; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NlmgqKiyqc7mU7pAn/JSXJE8TLhKwTlI/zLMMe65kC4=;
        b=LP9v9kYgDjNKefW63cemP+b7YXe4pKdRleCmLcAKNcKF58APzsl9b4b4Xxk8IZR87n
         Dgm7b1SvSc5X41qqE3F4dTe5hoKplACZIPJED7tkVvSeHnGXQwgkN+EP/vzM0bAtbAxL
         3l4pybZvjSCRu7PqcZtwcnJtc6522B666aHd/NpJDJprimqV/Se1VREg6Za7/XppFJgm
         5sTLzt5VAoRpyKo5N1ziT/BCwojixDJHPl9ztgLawncU3KgJS8w95iXn1hBngrpv0XHU
         lKOYrIk4wxmrGrLNCOwf4taG1x+e0ZH4A/GxqfPQTvszyOiEyOoSvUiBNL2zqMW4v+f+
         4Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126439; x=1786731239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlmgqKiyqc7mU7pAn/JSXJE8TLhKwTlI/zLMMe65kC4=;
        b=NNB9nJ6e7CoqR1/zmZv4/4f+ItzYPuoDGaIvkezCR8+qmZUX/SImUqwaWl3mK7BtA4
         1BFwWw2x1276FZMbIYK3K5PJiQvs8vNWQjyhQrGVTw65/+Vad/8ovhf5ScgJQibaLU1c
         wyS/8Bk8wcN6FiYrkAkPMMstc3mi7sWWAY0FRrqlXerg09sV7pGWs2KdHj+CGfpNu4+a
         6EeDfXf7bQxNznLZWYN7irnGFq2FHc2rCjK7KkrOBU8B+kD0ruw42laMMcOG2TYEELjX
         BVHa7owTF18iIzIuKDOQMNssXhJ7DUtrWgPDUROzucrzxu0NTt709ce0DrXaEF0YKKYP
         gkAg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/XfX5jjIxZPBnH/chSW6zp7NF36IOppMSXDmTqGCJFCik1GbSXBvuP8u7lxrgNqeXYpHQDvSZvzRYyBLsf2MS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+XQBZbxWMaK08UZakSdlIv7cyBoBwZdAF2hyegRo7+CRVRjqO
	8vNS0XACcZmp8U0JKhLpgkyK8zGEKoSBtk2um/DcIWGM+WCbxstjJIEv8E/oW8sXbg==
X-Gm-Gg: AR+sD10YpVxIHcZhgo3QCE7x+s5gknzsVZBbI8rRJoA8Pr5qKHF14OL1mQZw2NwpSSQ
	WcQz5IhBtV9F8QiP2vboXhYUC/p+dmKgeXeS47+cN85i0uQoA/rk5ixcBD06wSZNfw+UmBPDlNC
	f4KsHzxWUw1MlD0dvHF0mbbC+wxNoZIi5fd1P8FcsSbcu8O5e/vvRMlU+wWO1dMTX4SKohCNB1G
	sBvczzHZH2strsBqjQl511/ub9TD/oThPj7nhcHCGeCJciBADgk/bCLof+z86jpp1YyKYPo4fqR
	2EVMz00eLS67g1ejqgo7Zj1GF2nruLeYnSPXrghykTd5YLA3eeuYu4TZLUhRCm2kvpBqS8DXvue
	Cn8g1oUb4QAXuop+pZRGxD7aASpEDQ0bMT2xzwPIDGe9hL110MNFntqMFpE9pgFIbfY+pVk+k3/
	YlDODUPDD1VMqouwau8VHx8qxRz9it3Vwad0b6kqMZfoJNgZnoo2qOIrR3XTHV26ihywJHSHlRF
	9HJij1a9wcyAtsPGZVnBjqRmGwG9A==
X-Received: by 2002:aa7:ce06:0:b0:6a1:f26c:ae2d with SMTP id 4fb4d7f45d1cf-6a1f4f438f9mr5439a12.6.1786126433777;
        Fri, 07 Aug 2026 11:13:53 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080ab446bsm79186966b.27.2026.08.07.11.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:13:52 -0700 (PDT)
Date: Fri, 7 Aug 2026 18:13:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
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
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <anYgXSR4VAi3TpOj@google.com>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
 <20260807135810.GA200537@ziepe.ca>
 <anX7F7dnKOtAOIIe@google.com>
 <20260807164734.GE200537@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807164734.GE200537@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111401_408624_A294F0D8 
X-CRM114-Status: GOOD (  28.02  )
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

On Fri, Aug 07, 2026 at 01:47:34PM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 07, 2026 at 03:34:47PM +0000, Mostafa Saleh wrote:
> > On Fri, Aug 07, 2026 at 10:58:10AM -0300, Jason Gunthorpe wrote:
> > > On Fri, Aug 07, 2026 at 02:18:31PM +0100, Will Deacon wrote:
> > > 
> > > > > I was under the impression that there is a possibility of using swiotlb
> > > > > instead of restricted-dma-pool with pKVM.
> > > > 
> > > > Yes, that patch enables swiotlb as a possibility for protected guests
> > > > but with your patch we avoid shrinking the swiotlb buffer even when
> > > > restricted dma pools are being used and that's a waste of memory.
> > > 
> > > I also thought we switched pkvm to use CC-like swiotlb as part of the
> > > alignment in this rework? Mostafa ?
> > 
> > Yes, now protected VMs can use the SWIOTLB for bouncing. However for
> > Android (and kvmtool), use restricted DMA. so SWIOTLB is not used.
> 
> Oh? Why?
> 

The patches are not in Linux yet, when it eventually lands in Android
it should be possible, I did some initial assessment and did not
see any regressions.

> > However, I do not think we should over engineer this in the code,
> > swiotlb can be set from the cmdline and now through Kconfig also.
> 
> That's fine for android, but real users buying a cloud VM and sticking
> a distro on it shouldn't be expected to have to mess with cmdline just
> go get a halfway working system

But the whole thing is best effort anyway, the kernel picks
IO_TLB_DEFAULT_SIZE which does not depend on the system topology or
how many devices or how much DMA they do.
SWIOTLB memory is wasted if unused so we should be careful around
that as it would be the other way around and users would have to
decrease it manually.

Thanks,
Mostafa

> 
> Jason

