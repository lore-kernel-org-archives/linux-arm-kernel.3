Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAABAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0npl5BvtjzaikMt6SIylqQSymiXrW9C26cahZl14wSc=; b=BzueL8cvtj+2aMexJMdvnbdvA9
	HcnuOW7atWsTc0R+SMuW7P0cqGnO6x9rgZrk2G3nhu0ji+EV99AEiL5i+mS/lHIbv0ViKq35N/hoM
	d3U0aKXyfUcDPoKIYm5xT5Vgm/+OnOlMRmI/O8Co5NSoBkBiKUV50U8mATEUsxH2LwyepA/XLOHmG
	h2/dqnl47VcZYXmMKaf0H0tItwx9Jiy/CcpSPAWODOZXGew4U790uevdRePmWLGjvvQNZjgpa8qZK
	X7Olm5p/n28RJcGzvo07eLnYqddcCaTaCUTu/PiRWEMEB3nf+sSKMGctM88hWeRg58ADvUSrvr0zh
	iLVA9cxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMZ0-0000000AJZo-0IvU;
	Mon, 13 Jul 2026 19:43:38 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMYn-0000000AJW8-2Z51
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:43:26 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8eeb4508f29so32711256d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971804; x=1784576604; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0npl5BvtjzaikMt6SIylqQSymiXrW9C26cahZl14wSc=;
        b=K+Y+C4XKJw/FeBFvvaCVf1AAs0QDJ3VBYnASA3r3JxB6P5nao8JvPl7T72YoXPk//R
         DfiFtPZ3umUnRHAJrgT5uSLwqpW4vDWG+myGYuh/5l4K83vdGxq6uKBHiHfQ26Sj+jcm
         cFoa3B3lxopGFA3yWFzuA2OHpDQ96e3c2m5AfCWFZ+Agci8ZW9oFX/Y8GhcCXPZsPW9U
         BeLNo5ZKeFua3s1wnMq73sMiGSNQKL/Sa02b5mfQf+BFDSo5Frp43ifOtcKzvPn8eclb
         bLU6lRiQhSalIomYtYiidPMFLAiuAa5RXrTsrzEs56UXXOt4u/9N/N3GLLctQMMTJCIC
         6DGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971804; x=1784576604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0npl5BvtjzaikMt6SIylqQSymiXrW9C26cahZl14wSc=;
        b=fP2sskewECTvg5pmUBsWbggCesvDPdrSqqoGpHx+oYKKG50cfIf1uNi8rsOCTbD6g1
         0iofuxCG8a9K0zpr8Ryuhdvm+Sh871dPT8BaudNllKzXaNfZUk1MrnJJZwqC9CS6ECfs
         3/GZMVtbpQxYMYlHsJki6aIFVI0TIsiGr3QTQ951+hm2GkDBOpso/4rc7BceHFwuxmnG
         H9xVZVNRKBEN/yuKcSwCsGmHyFmOFECVx3gLX32gXVY4KHbAjzk5d/5pTduWpsRaqooQ
         Igj+2RPzceAbiT9abDaRdNhk4mnsWj1BshIsVQCNtD3I9sdVn5xGg1gldtRUoF18BAqz
         kZkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGMwHtUewro6xZRcwL0v/+UtbYRhKGqwjooYeK4egyF9dfFoyHRd5TKTwCiL5OvIJZ6F7SUo5ml9+rMI20wJYN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3yY0oyCT7TudEdYbnBkhTPYtWwsSxoUZn3AwVttNlAz3+XbN5
	fe5F1Ej7eogtGjx2DTFUSVCWHZ2jwH2BTAi092dPr8oBvIzjpMRU1zHXNtj7GFFg4TE=
X-Gm-Gg: AfdE7cksuA7A1HiCr6Ds197g7DGeWyzjuyofRLhh9kQg91gs4bgsQQR+PiXKOMvlHqx
	Wv5h2cX9si3xZLJT8v9lqJqLcMYWKtIEW2ZucmDr3/ucTZj/z9Sbn1D9CdPfUo+Epjkfif5POLO
	h452HUQqAQKf+XYNGaNrG6yRgMby3gIqxaRshdA/fwwbbgEo37ZWWBXn43gfJUVK6NTujiAQuKC
	53qeD61s62ISKrVzj1IQ5Cnsn6fWOMB47SroMmn9R3aDQcD3s14RO3ewKcR5kF9OSlysvPvoVtQ
	IFZxSroJqsRKT3waYCqlx/xioo8gZR850HruJVfGwxp2RAF6cbkVzzuHiHdUWghr2N8u6EZB8u7
	fvdFscY4n3wbWuuiSpJ3+F9Ybq9cfeuCS3aRic4ZI5I7fGvfA5jCtOpsM7N0NpM07OlDnWT8=
X-Received: by 2002:a05:6214:3302:b0:8f0:63b6:5881 with SMTP id 6a1803df08f44-9040236cc47mr114290366d6.26.1783971804298;
        Mon, 13 Jul 2026 12:43:24 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87c9500sm137858946d6.46.2026.07.13.12.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:43:23 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMYl-0000000E6yO-1CDU;
	Mon, 13 Jul 2026 16:43:23 -0300
Date: Mon, 13 Jul 2026 16:43:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
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
Subject: Re: [PATCH v7 00/22] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <20260713194323.GC3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <CGME20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1@eucas1p1.samsung.com>
 <yq5av7argr65.fsf@kernel.org>
 <fc804746-4fb8-4ea9-997f-a4cae9ba8c14@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc804746-4fb8-4ea9-997f-a4cae9ba8c14@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_124325_659589_29C0D9FE 
X-CRM114-Status: GOOD (  12.57  )
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

On Tue, Jul 07, 2026 at 03:03:48PM +0200, Marek Szyprowski wrote:

> I'm fine with merging on top of the topic branch and I assume that this
> patchset is mature enough to give it a try in linux-next, but first I
> would like to get a review or at least acks from others with good CC
> knowledge or experience.

I think it is good to go from a CC perspective, there are still some
more items to fix up (like the MMIO) but I'd rather they be followups
at this point.

Thanks,
Jason

