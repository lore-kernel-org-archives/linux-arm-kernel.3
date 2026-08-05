Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9D2C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gc5m4+tIBvg0egjJhph4T+RN5CfIOJByD9/EsS70PrM=; b=JAlt1kk5ou7D8joJd0yYbgNQqf
	/96KIShWBIeuAmeeI7VCsZNxEdayAgpLIOu9/0/8rFbbx0VYGHHx8DAZCoU3pWMjLpdeMFVzhtm9l
	FFCM3618FtCRmwgve5CJIwoT2nxn+/RrWsRHRAjevUDYM61zqlgaG/1zaJObevWHNv6UmVwTkb7Ms
	r89g2O1ABWH1CD+/TV/zomA83X3INX1P2dE4P6R/JlljL0W8jeyq0hpaM5HVZFDMhqi5acQpZgaMH
	2qlaXICCDDECoKYK6w3BDVM4pA63I2hJmNl7hRUSt20DiSlq6EUUVsjPf2+5/YlOxUHPo8IacNYXv
	Xn+xZ8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXdr-00000003aHn-3U2N;
	Wed, 05 Aug 2026 09:10:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXdp-00000003aH6-2Een
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:10:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4994d67d260so29815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785921022; x=1786525822; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gc5m4+tIBvg0egjJhph4T+RN5CfIOJByD9/EsS70PrM=;
        b=K2KQNsEimZF6yvRFfUfBL+kom/MUaOzPS6Dy76BDR8YkSJapWXqYMIwWT376n4TC0R
         n5RShDfCFWVFyFaZX2IgVIoEOXQXfId8aOFJ0B+/vBdBcu79bwgCKqn53Sr7n3LmGSV2
         X/8TjHkBrAtW9OX7PevowQjPpzyAYOCAlhg6Uj+HycbuIBd7gnTvkpuImep46FcLcj6E
         2zsFTgn8F77KVHTckotZs/73STs5J1seHqEWwTHddxBjIFh4yiCd7ZGFTdjLevRUnp0k
         oSavZTbNRXGz3dOraifPE47/RnNiKQuuZfbgZZrqRvy9N3BM5BJoikgfue/pZkYL9Zes
         5EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921022; x=1786525822;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gc5m4+tIBvg0egjJhph4T+RN5CfIOJByD9/EsS70PrM=;
        b=p8IhQsuyCbLAhbRNQ8AAAUSFExpgPTS8XGquyatiOo7wM97nxsJXhA+t8B/RSQ34Wf
         gKbAYRNYf5y8VRfA8jf9qZBZ2m0upBvb/ov9zOotVwqtH9RgS7QQarM2KuKUUaHJ0FS2
         WN9nNZvs5TVm/qbLm84yeF2Rq5rWKYEuVeFX8hEC84O0fAo5H5BRKIDYXL8DNJeZmKds
         0XYdF3+i2ynXX1GvlzM0wMSCSQNB4lplgeZOdVZI5qYrsA3nUwzc8mqjlEVna2YSS1VH
         nQ9D7tetvUHRBVHoujm1XuWER2pYDCcd28pZ84P+M6Go8lQCSrlmayq2xZOKan0dUBhp
         FjsQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro09D8ma8cq/lJizvq4SAKFFE2GejD6FdHNdx8wgueuNIBw4OcV5D7Is9nnmFZDTaE6aGd75L+ycvxeadRh+KKH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7MGM5W4FLmz+kBV273VYlwYIp53EIMuzlIcggXO/4TSY2XMgS
	X5jpFE06yeRuHbEDBWIdbwhZjWN1WPbZGUbvGwdaDYu2kreCPvflRvq192Mv4QKOKA==
X-Gm-Gg: AR+sD11tNCK/vlfgOjYiMXm48LiKl/+dmdbOhv/Q/pmknm0Tfz1SorrWRsSwOJasdao
	CLD65OaAdMasLfc92Y7rUL6vE1Cy7JKNFzJkl5Q2WVILCJxR5LBIlum0JEGgZSy4bnhb1enS4FK
	NnpmYvi9aUVrra9LM3B8IsVLW10aeBH/X4u/g/pfOFEX9Y8LEoCOVv65c+buCjyqOV9klr0I17R
	5VMXfXD5MPq7FWIKaw6pNGrFrlnIghFLc4ko4bTGsgYIC31y7JgF0NjhOTat2O/ZLShN551HWQb
	+IsMaxgdv4RGCGc6rlfmeBUkxQifiFz/r/Qms0XOPU0Q5qvpRBNz5gUwcZOjwFzRkok+AZbOaHH
	vsyi5cFcKTh5W8Q70a+ggbMHDZJ1vhgrNFsjFsZUBNyUk7vHXCd1zxxbK+vN4YmA2B21nxNgMGU
	zT9wqM5qbWrfKK4kTt/osL2AbZ6v7mlpWW9Ywo8/T/N0qeZQKKe6pQplTvuM40mfY0GwgePC9wc
	JttBR+R5Cye0SjT2DpXywUsVFsqgQ==
X-Received: by 2002:a05:600c:630f:b0:495:4069:b0de with SMTP id 5b1f17b1804b1-4994f123620mr696915e9.9.1785921021836;
        Wed, 05 Aug 2026 02:10:21 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994dfda45asm92632815e9.4.2026.08.05.02.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:10:20 -0700 (PDT)
Date: Wed, 5 Aug 2026 09:10:16 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 12/23] dma: swiotlb: pass mapping attributes by
 reference
Message-ID: <anL9-OrDGqYQAWNV@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-13-aneesh.kumar@kernel.org>
 <ami_mpd_1pF4Tmdu@google.com>
 <yq5a5x1ygo7z.fsf@kernel.org>
 <amnRB98ZZIysHuM3@google.com>
 <yq5acxw6dl1d.fsf@kernel.org>
 <20260804142032.GC27883@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804142032.GC27883@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_021025_624744_08ACFFA6 
X-CRM114-Status: GOOD (  22.82  )
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

On Tue, Aug 04, 2026 at 11:20:32AM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 29, 2026 at 06:12:38PM +0530, Aneesh Kumar K.V wrote:
> > There is a possibility that we may support io_tlb_mem with cc_shared =
> > false in the future. As a result, only swiotlb_map() knows which type of
> > bounce buffer was used, making it the only place where the attributes
> > can be updated correctly.
> 
> Yeah, +1, the attribute should be changed at the same effective place
> the source memory is changed away from what the DMA API user
> provided. Only the thing providing the new memory (eg swiotlb) should
> know its properties.

I will keep the conversation here instead of 2 threads.

That seems like a big leap, I'd be worried about devices that operate
on confidential data that should not be shared/decrypted.

One example for this which exists in pKVM (this part is not
upstream yet) is non coherent devices that require bouncing but they
still want to keep the data private. In that case ideally they get
an encrypted SWIOTLB pool, but it's always better to fail than to use
a decrypted pool behind it's back.

I have not been following the work on T=1/T=0 devices, but IIRC, they
required some complexity to handle their stage-2 as these modes will
be emulated differently (for CCA, RMM vs untrusted host).
I was thinking that it might be easier to represent those to the
guest kernel as 2 separate devices (bounded to different groups...)
where one is trusted and the other is not, and that way the DMA-API
can have strict rules about memory sharing.

Otherwise, SWIOTLB does not seem like the right place to me, as it
does not understand the context the device is operating in, and the
DMA-API should deduce that from the flags passed.

Thanks,
Mostafa

> 
> Jason

