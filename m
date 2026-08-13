Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9778FC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogSpcSG1OWMwO8aqJpRjbVxMlNAfNW4F47lS0hCZOts=; b=SzEIN82UgR7CnK5SUxicqbhiUI
	E3Qto75I/sUTvblwdAb7XgNM7rkLVEjjAtzpxA6gtVQxnO/h7m8UnjSjRC74ZLoSWLp+Xq35WCctH
	z3DDvIRlYcbUT1I+0BATPQs+5uEhBrE1SZdS0u/vsl+Y5K2Lvum/Q1WySxCdVBeNPelsBYT5iasmZ
	Jh2SOVx/zk1BAndP7i1u6UxwrGd7Psypv5jBQbtH9OhJNtOrwP+fwHkK+mebh4OeZRtbCfuFormbA
	1aCgk/HcXlorZD9fNSzV+/lwgap/JC1XF/qYsYboGhpOh0DpV1tAnmXOskiJPLpgATq3NrIuE/0R4
	n3bDT5eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVs4-00000000nIG-0sn2;
	Thu, 13 Aug 2026 13:53:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVs0-00000000nHU-3dWX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:53:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-498012a61f6so41145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786629198; x=1787233998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ogSpcSG1OWMwO8aqJpRjbVxMlNAfNW4F47lS0hCZOts=;
        b=XSzAdfvok1PZj/or36irjUpU0MgxBI1QcjZ39HZ6octl5zmk3d+CRK8qFarbasxAol
         0gPv97nGBzUk8lHR94P+z34dJhaGT14Ej3HqzmuHAXDBoQjuUH85PHHLfQhegRqQ0Fb0
         1tErx+S55EIvMb3J2TWM97pqIQCunAutnbk0jXm3EkWBu2MqLAJe57h72TfDW+GwZCst
         jqo9aPI7OP/vIeRa4/q5tZO5mdeey6MDVuuK1rQPeogvLt0S7g6HbgvDNSP2BCUip/mP
         JQdPfpooY5MLxq41GUroBeWmh1ZgyU5yKmda3/8SzEAwR51rnxkjfDouL+2NQBoA5ZS5
         CAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629198; x=1787233998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogSpcSG1OWMwO8aqJpRjbVxMlNAfNW4F47lS0hCZOts=;
        b=CvB+Yad46TiigtVxuYVXfLzbH4Lb1CPPC6yTWf8HuSL7mf6D1O7dSs0J60OEqgSTAX
         rXFZtIOx76KzqtwvpPhv8axvrZMWzyY1BvJ2mMQ04gwNswN4lVWIvQ6RueWSWHYgYY2R
         iDzdy4lJPJI62lN/U8tN+Bvb9l4zmrQKGJMHZjNppvjDxY6dwETvic0BkicVBt7ZTs5z
         5JzTNAHTudB39cw7LYc/pofdxjLUoxtePVwiUBODBEQN73pbui4z7/FEzQXL2wEnCHEY
         s2XFvOJ8xI3J8FAmrUdrvSTzr2+HKOh+mbiENYJ9eDt3SZ98EQitnq1HgQ1X9RvuJJ8T
         MGvw==
X-Forwarded-Encrypted: i=1; AHgh+RoMoS/VBhhkFIqlGNxS6WY1s9u5N3S93jr1KTIy7j9BsbvH3E600nQqUt9Tbb7VSI7uOKGDoLUf1AXTLUhM6zg6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7D9XPep2KzydqKvYt1zTXW8UypEn0/mMF13yyJ3hcCAwhiZKU
	12cX1Ys/vHsCN/DWDwHfkcBRM/5wtRZuNb6MsZX2Vnc/119DDC8PCfqKqyfXFw7HxA==
X-Gm-Gg: AR+sD10r9l/7yNpmSaqzkSTcPrXpNd/8M4hUv1XK0o/3GbcolJIIvTft2kyppTiSZWG
	wbdfkZDO5ZU5kby30tdjOx8x5RrSKML1x5p3F/7OHjRYMGrIKBAPYTbzA5TD/FX6iZotsvNvmiR
	HBx3wTUCgy/yWpl0IMzkB+oQvje/LAPaAYuvAStbFRrQcD9Xl9Q32cPQ/io/ZVqCqfCjyDHUztZ
	HHIlm+M84kRXpVp8e80Kg5tLmgVttm/Hm+m8KoXws72tSgpxjK4CsJd+YsCH5O2arKX0RVn3QU8
	RNkJSrcTh3K6byzIVlFcOOpBeieCwWalbMF9QvrU5ULZuUdsqNd1ktZWVHxZxP+M7QaGyG8+Ofp
	c76ksKfniFDPMTZaSv6Rhrjwx+GzV/DOeJyUqd/2et6Zz5jrurLKwq8B5ilYgUHVDnVLFZm4wVm
	sGCtkD3aKWFY06ATKHj4RprNrb9J8QmmSDVtQcpSRHTDT4p5YNAWQdHgoCDVPsWISSTtFUQmvUg
	s28V/kQNBA91dHFBb6BaGvIniG0dg==
X-Received: by 2002:a05:600c:17d6:b0:495:51b1:3b7c with SMTP id 5b1f17b1804b1-4998273aa2cmr847895e9.8.1786629197039;
        Thu, 13 Aug 2026 06:53:17 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5b6c2dsm5990307f8f.26.2026.08.13.06.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:53:16 -0700 (PDT)
Date: Thu, 13 Aug 2026 13:53:12 +0000
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
Subject: Re: [PATCH v2 3/8] iommu/arm-smmu-v3: Optimize range invalidation
 for latency
Message-ID: <an3MSKEj7VhT4WkP@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <3-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <akzm5BoV0rToJ7ij@google.com>
 <20260708001058.GA422027@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708001058.GA422027@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_065320_926354_62AD7436 
X-CRM114-Status: GOOD (  28.59  )
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

On Tue, Jul 07, 2026 at 09:10:58PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 11:45:40AM +0000, Mostafa Saleh wrote:
> > > Calculate the smallest SCALE such that NUM can cover the range to minimize
> > > over-invalidation. Always use a RIL command if RIL is possible working
> > > around the spec limitations to form a valid one. If RIL is not possible
> > > then do full invalidation.
> > > 
> > 
> > That may be beneficial for servers, but I am not sure about other use
> > cases, we already know that the invalidated entries are unmapped
> > and not used. However, over invalidating might impact live DMA which
> > would be bad for workloads sensitive to translation latency (as
> > embedded cameras, displays for example). 
> 
> The isochronos stuff I've seen has a latency budget for translation
> lookups and has to be tolerant of an occasional full walk.
> 
> Prior to RIL you had a much bigger issue, the cap on the range ment
> you'd face a full invalidation from time to time if the domain is
> being used for DMA while something ischronous is ongoing. Compared to
> that a RIL over invalidation is not significant.
> 
> I have been talking to people about some formal isochronos support
> that could do several things to try to manage the latency of DMA, it
> would be reasonable to include some alternative RIL algorithm here if
> that happens someday, and it is an issue.
> 
> But otherwise, I think we should leave it. Over invalidation is
> consistent with how single works, and single has a long history in the
> field so I don't think RIL is any worse.

Sorry I lost track of this thread and I just saw v4.

In the mobile space, I haven't seen an SMMUv3 that does not support
RIL.

However, I have seen workloads that are really sensitive to translation
latency (display, camera...). And I'd be concerned about those
regressing.

There is a clear trade-off here as you mentioned with TLBI latency,
would it be make sense to make that behviour configurable from a
module param?

Also, looking at SMMUv2, it does not qualify single commands to
over invalidation (but it exposes and knob that is used by qcom
driver), so it is always accurate by default.

Thanks,
Mostafa


