Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBB8D637DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 23:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEnKjDj9pQFaCr4EZmae2jNEPFVNmbflp2ZNa+r+P+Y=; b=Y2iP0wYw5qVSuEnxWrGU8WP/Z4
	gtsK2xrM2aYMSH4sMZrDJm8RkhJFMsngD2/ZHSsBKpmRjFKd9EmnAzSjg4EawFcM0m5db0hyNEFJ6
	Ylx7sP1BayneN4J6Us+W/g+P3nYuRhfhuQgng5r6DaBeMkR4chSE651ra0u2I0PKPsAfyBTT2qm41
	0k22BZnMudZfLTerGQ37qxQkQgP/pQVGAtqsIb3LQHDYoqZ2iIQM4s5yXPm/EHc7hD6mPesgUV7DL
	P5IrUXpAC4NlYOAxArjqzUoy298tZVATRhT0TZSG+/EsjmWt76g0J1wZ1qPobJEz5UU1WKuKdHlyL
	9VNHfBRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVe9W-00000005vqY-3ed4;
	Tue, 16 Dec 2025 23:08:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVe9U-00000005vq9-1HDi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 23:08:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477a1c8cc47so26295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 15:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765926498; x=1766531298; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fEnKjDj9pQFaCr4EZmae2jNEPFVNmbflp2ZNa+r+P+Y=;
        b=A+YyCY2rqTe2Z9jFC1A43zAScGetdq9t6L5e7+ZgDbYLk7GsX9AH/gkAkZYS2XIrFV
         KP7PyjEBZlQiUvt4sWXpwHvooRXSvITYpn1eDItt9YxTftX9oFkGTAfa7D6x67Mhp7Vl
         4KO1hcW+Q4y0d23TH9mic3eTbXmQxUWqaeIuYbjmLyujbYpVKOdF9iJUxk0yFDmW8jCD
         AeOPNGxwn1mKL1Sq4zkVqipDLtJPuwc1CnMmOop9AKwf1I1Q61+icmCv9fnKgWr3L459
         wzcKCmnm3Hv92tPWOf4y/HGczzctqdvNvhpwXy5WI1RwrvQrtgxJb3KdSTViblZXvrQI
         A69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765926498; x=1766531298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEnKjDj9pQFaCr4EZmae2jNEPFVNmbflp2ZNa+r+P+Y=;
        b=OXd19ZkZ4wSnIgApb8Yn4j4Tki6BD2XLH/eGTxGorrbe1oTodsK6KHmQdv5LA3y0bj
         XHWOLLpzdqiNKZGOeTKho9ONPFF38xygvEnEqlZ+esiO4AX8eHIGMgbpvD0gKBsNh++a
         9rlndXkt61eMmCc8OFWaG5c5cjow0ZaYRca6DuudT0IVF6I5qm8LhG+Vy/nXsZu0G1ej
         pv9JV8o7Xb/6TZsyoRwdGHF9Bfm4O5XtQcnSmlJF/zePpe9hkTQf435IeJ5y93394wF7
         xMMnhhxuQcBT+1X26WR4hAYBAhwSPzuqSAPGm0U1qIMUUt0BhI2QdvKe6vzeby7om7Up
         gsEw==
X-Gm-Message-State: AOJu0Yy28uu0eZ/UUY47JfCKEkvv/tFP40ibEeuYtZcwuj75pGSXaWnA
	BA5cHVnMmFa4J79tdwaaspr6iGr7vM8aimAzwPm8ozfFo4HvPI6StJbojR0Mz9BMRA==
X-Gm-Gg: AY/fxX7v+FbA0EFQH0tpRBYWyrOtZfmibrR48rVBV2fjjruz/WEOvv2A7+mc9se7OHL
	TE4nGWkBObbBzahCEZkribJfOnLbs8lsH7imRJbkJNTxRUkNAi+bPl3Gq/ueuGwWymDVJ1gdCDN
	TL2+rBjUcFGPEq/c3SX6IALgL9VAZq81KUbdLukRmFlAU76FBnf/VQPk1S4dC1xC6bC+nXggU19
	EITPdOC2GnQ9ApLWGVk+w7K4F+nDzdJkLCXH+6uXSsesDgbQ6ajtEwj2O5Fa1eKqiURYCUlonjD
	zP8SGwQy/nww++I7uzry31yPsB6gK56vYj5WBFvm6qVt28IiA0leDXj9jZWlvhXq+B8TXyVeSIe
	gbJj0lalT0RkyvFXIDYL3MJtdSi3P5/0YmSvPa9GVtwRvD20r3jRPoLmt1CpIsvctT0ozUMvC18
	hwqbKZXVfe/0LX7Mcb2nNGTaylPkCVMLW8dDLIo0Uu7vMFJaZwbkRiogRYTNVyGFw=
X-Google-Smtp-Source: AGHT+IG7LwUc1KusrGX+ZA2zOk94gnfIHzqutaEubqj6+XSKrKArOVejMGxCukQG8Efn/eVNuyxG+Q==
X-Received: by 2002:a05:600c:4b99:b0:477:255c:bea8 with SMTP id 5b1f17b1804b1-47bdd2b0bfamr45995e9.7.1765926498247;
        Tue, 16 Dec 2025 15:08:18 -0800 (PST)
Received: from google.com (170.226.195.35.bc.googleusercontent.com. [35.195.226.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc2355d7sm11409285e9.14.2025.12.16.15.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 15:08:17 -0800 (PST)
Date: Tue, 16 Dec 2025 23:08:14 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 04/27] iommu/io-pgtable-arm: Factor kernel specific
 code out
Message-ID: <aUHmXkdehGGYX5Mg@google.com>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-5-smostafa@google.com>
 <20251128164541.GA812105@ziepe.ca>
 <aTw2x1UlldJGVA4Y@google.com>
 <20251216005834.GC31492@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216005834.GC31492@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_150820_361429_C5B1C871 
X-CRM114-Status: GOOD (  20.00  )
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

On Mon, Dec 15, 2025 at 08:58:34PM -0400, Jason Gunthorpe wrote:
> On Fri, Dec 12, 2025 at 03:37:43PM +0000, Mostafa Saleh wrote:
> > On Fri, Nov 28, 2025 at 12:45:41PM -0400, Jason Gunthorpe wrote:
> > > On Mon, Nov 17, 2025 at 06:47:51PM +0000, Mostafa Saleh wrote:
> > > > Some of the used APIs are only part of the kernel and are not
> > > > available in the hypervisor, factor those out:
> > > > - alloc/free memory
> > > 
> > > Why not provide the iommu-pages API for the hypervisor environment?
> > > 
> > > Same for virt_to_phys, that could be moved into an iommu-pages wrapper
> > > too..
> > 
> > I guess that's possible, but then we would have to stub dma_map/unmap,
> > which might a bit ugly. I will look more into it.
> 
> I am hoping to drop the dma_map/unmap and replace it with an arch
> cache flush call directly since the code is no longer modular and
> relying on the DMA API will have some problems with a future patch
> series I'm expecting..
> 

I see, I always wondered about that, it's because CMO are not exported
for modules, I can look more into it and send a separate clean up.

Thanks,
Mostafa

> Jason

