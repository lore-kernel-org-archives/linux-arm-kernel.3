Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF19C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiQMvuBEKbz3IC4tovbH4hMkKdurz1w/2IHV/DGw0uw=; b=QIZJb/HCUjx0Scg1VubSP7Pd87
	aKZ1Q7DHlwgPp2Fw4/wo1zYyjjHIfhWpkzl7VwViRPfopttvcg6o1wuYrkdvrmjHY5CRvPdXD+1t9
	do2c8bY9Gs4mKt+rrALXgUkk49ek4MFoNCf4guqn9V3k9j1YU2CXwa5uvW5u9RPy2RKTNo4yLdDQ0
	YmXiqdb04GpEmzvxhDqSgisi+8ggTLFpBDZpvHre8Jroz6ByIL0J9inKYPAHAySBiSgfyvMFVCLEO
	3LkmifcAYDFhBt2zOcaFdzsJcpFBGLfGYlH22twtqu9yw7gUauZ61hy376WAL1sbqPuXb/6Y79dyJ
	lJ8dbw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO9U-0000000GgeB-1lG5;
	Wed, 08 Jul 2026 09:01:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO9J-0000000GgMs-0iC7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so43115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783501255; x=1784106055; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QiQMvuBEKbz3IC4tovbH4hMkKdurz1w/2IHV/DGw0uw=;
        b=iezUcIoGAC77xV4ynMyu14MSHPMDiIb+JGvL/y076v5DoN00eUq10UoLQLGETcmrOp
         NgqJ2yDQn7MTQmmafT2rJr/ELT5RFHlx6yqQRCJilP41zc6P8LKuyzN9YkmoKeRKn82j
         z0gmXLLOdq1nBPnPNJXApBRIfGP5WKYLx2wRHGkQITEeZxKIaNSJIwtCXDlPZfpXlhM5
         Pios23boPXLbtuCZZ8ib9bkCa82NPOqN8svuDVmaGIJMpi2XEK7oUdiPAqqFIvOhyIMf
         ud+ko2bhqf2UCnwlPEiOn4/NYk9bisbgz4esKx9h/L+eTa/67B/8Za6NXOZObeOU1hmv
         CvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501255; x=1784106055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QiQMvuBEKbz3IC4tovbH4hMkKdurz1w/2IHV/DGw0uw=;
        b=K/UqBmwcLvLp6TZz3/k4p7a6PacBrnxqKOt33+Mtf7UVoJfcQ59FXAByJv6Cn1CX9K
         ZUSCCYa/dXCOGCLW8oU+fdgXTy0mquhedbM1iT+AfW2Qg619El9CF4CEmnzNyuVQy5HF
         I0u4wdGLpRZv7chxb17VIfW7JgAL22oxIfOMnUlNn6KLqr0HtmT3bwpIe0WlqUCSn6Dq
         ZCYA0N5cjxLXi3LE7eX0TYSNOs1rg0mR+U8i6HtgnuO2lRMS29x6ZhYzk36A+RElrA2p
         A31+eKNah7KutS+rJpFYSP18QQEdXIh0hoK5tP9VOf5mM1/33pgBu7kuQqQcmiw5tgkw
         QaHA==
X-Forwarded-Encrypted: i=1; AHgh+RqPqbzp2zUZ2bR/fIHgTp8AAUg8DFUEE0LYfKO39zgV8XZ4YJXtu6ZPhnRAUCiNcEyp4LIcXPZc0ug6wpxcEQYF@lists.infradead.org
X-Gm-Message-State: AOJu0YxzOrajaiChDfrdqaAm4xw+aeb+klfGYv/FxJ5MMKebrJKzh9wM
	TmS+63uAsiN4Obmo+dJGFgGCMU2gKGhvcpaaRxuNu37UjRunRA7a/bPvLAhQ3ul9zQ==
X-Gm-Gg: AfdE7cnZ0/EmAf6DromwqxyTfNEvpeKTIabh+dtIsKqHhHkNFrXVebn+VBhSbtWvqbI
	vnqcYYIuxrfRSFAzM0ZD3dbWSgLK0GYL2FDr7Ia49opxNMW3cTj6k4Uxm+oe/ppgjvXksm/CBNN
	u0e8w0OSHC8D2HRuN42E+yVqrHQSrv33OjvqsDuofkCdyqXcnrNV0CPdM9i12GBIVWw5WY9ea6K
	Ur7gfBOxG2T4NJfuGb+SEAiuQorXeiEoCISRThsXeovBlc2kGBYVkUC94eKri/nILeIdaFhSmzx
	i+W2xcjhW6qU76mZZstY1m/NouKe8YgCdR4MvX5wkELKgHT7Suru9cbmHygr3P6xjjqs5YsHkmH
	IvUo8zwKyo6k2RR90PUH/MyAUMK/9qZXwwK1rDN50NSPzgGrG9iXBcUXPKnULvDfLnLZDawxCrJ
	lHZEpjo8MJy5/GYmSglgfc7labm8mEbbEjDO9RSOo//ubY/++J
X-Received: by 2002:a05:600c:591a:b0:493:caa7:4fd2 with SMTP id 5b1f17b1804b1-493e121b946mr1933975e9.6.1783501254766;
        Wed, 08 Jul 2026 02:00:54 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f41014sm120832345e9.6.2026.07.08.02.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:00:53 -0700 (PDT)
Date: Wed, 8 Jul 2026 09:00:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 5/8] iommu/arm-smmu-v3: Precompute the invalidation
 commands
Message-ID: <ak4Rwnr39HuP053s@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <5-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <akzoeexW-4W70QdU@google.com>
 <20260707145812.GK220801@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707145812.GK220801@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_020058_241870_D8A914E7 
X-CRM114-Status: GOOD (  24.18  )
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

On Tue, Jul 07, 2026 at 11:58:12AM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 11:52:25AM +0000, Mostafa Saleh wrote:
> > On Mon, Jul 06, 2026 at 01:26:42PM -0300, Jason Gunthorpe wrote:
> > > Store the required cmd data in the tlbi and just copy it out when
> > > processing each item in the invs list. The cmd form only depends on
> > > if the instance supports RIL or not, otherwise it is always the same.
> > > 
> > > This avoids redundant calculations for each invs entry.
> > 
> > I do not understand how does this avoids redundant calculation?
> > This would be the case if the domain shares multiple SMMUs,
> > otherwise, a range TLB invalidation should be unique and can not be
> > reused.
> 
> Right, if there are multiple SMMUs for the domain then currently it
> recomputes the range for every one.
> 
> At the moment I think we can't have multiple SMMUs per domain but
> Nioclin has a patch series changing that

Yes, it is not possible at the moment, I think it makes sense to have
it in this series, but a comment would be helpful as it is not clear
from just reading the code.

However, as I mentioned I am not sure if that actually helps on a real
system, is that something that you noticed during perf or based on the
code?

Thanks,
Mostafa

> 
> Jason

