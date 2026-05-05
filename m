Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9FECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIyq5XxnZOa3QCDQC431jNPLKmCFh6Pbs13KNByKE/o=; b=iF7kywjYWN1zYLNt0Zn50MY1qz
	rfjc9LVfMC5vyrB4VzOYccHYoQmF9h95GaqX5iikzGcjEQzuK9HhRw7eHxexowtvqWEB+RuuPfO3d
	aAvG86uWwriS9sap5p/OwPdDS7ghMBZtZhQolrbvD9jn72FPdm1hD16VPu0HxlJIK7pTU5yDNEW3Q
	xkyfLwWxNSXmVft7qV4ZzNZE4iFvsQRJ88u2xF/p5xw3Kt9huouKerEClI+fJvbxGqKukWSMOR+FE
	SL+TZIz1hwf5NzC/OU/hi1KGV0d7BDZC8saenNT+l3C4/OTymWP0/9VbolhWe49MInT0Q1BpMyyk5
	Qbg0aBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIrn-0000000Gw5A-1sns;
	Tue, 05 May 2026 16:43:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIrl-0000000Gw3f-0sik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:43:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777999402; x=1778604202; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HIyq5XxnZOa3QCDQC431jNPLKmCFh6Pbs13KNByKE/o=;
        b=QE70U0ElRo1gzTPZcxE6hQvrROQdvBvBBQTFdx8CB3NDQckK7y5kE7TMlBNGhh2cDX
         +wa+FcsLE74N982q7w+vOqzsMyerWzmx6u7EJxueHmbWt8J3BGwjHDzU8+k5ipfgBHXf
         16LXCfkCgaoYAju5NLN50JFd7SKOlXhIfHnzdQo/jMFKMx8nrjrmK+mIjTnYDn5TfoID
         Zn3ZFqOUQp3d2y1PhjOuR1s1ep2uBUNoZG4hFdzodOUDo3PH51Q0Rw8q9SeR06PPmDxR
         Dz5KjLhKangEyZbV6wyR2XRpcrlyX2rP9296W2KZ8Va87riN/QV74208Ma0DajZvzW5k
         XvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999402; x=1778604202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HIyq5XxnZOa3QCDQC431jNPLKmCFh6Pbs13KNByKE/o=;
        b=SY474/7QbMmSvup9hcXLotzEGlor2wwuYpJIGnGwbmCmA6OmzS2a8JaYfNKbbuwN/+
         z5Z/b2WucGystPWfaJ88QO7yV60V4S9YQ+RUigMnEqC4AncNgi2/KeQDVDpunxzXd7ba
         SrwNvmg9uhja7jaPH918My6V17rmkti2aPsvIbk2a1b4irRu4TTHwt5p9QTw90OTVSHC
         ePNVC9jnSp9/sNV/gDK0sg1XEzrDlcdnTI+A0slkvK3W53rIkSRsfSedWExlReANcd90
         p0sQhT9gTQdfTUeFB5RyRogfr7WE6EeQjhS0BlNUA1dVD8uW8EGsQ6BREWO1eD++XCF7
         83DA==
X-Gm-Message-State: AOJu0Yyqlz+XfEeva1pRKf5TymKM17lB19IDRP+CwoXfQ56rWoNu8MOk
	5FeUuEiCqjK/phuK87y79mVKPzpTUvsRm0b8ClbSz4yEGHjk/eq507AIPCAMJ7sgBw==
X-Gm-Gg: AeBDievYmsrvpCpwHKsTNkXO6UQW8rlfJplkTzY5MIoWazB9m+ppl2hCCKlJZaZYfH4
	apxIee9k7GExag4Lak3ua/ueudHvdCmUng9f3CPw1+t3NW/ktS8JIEHzfZ6eobi3gNT4lOlPl/t
	pbY0xjfNb1iFW+2+3yG9p/IgAb04ARsaGAMXnnvTvEfdzDhqbHFACxG7VG+5KnjPW7Gqk0UtVse
	VMDofONNMvld7A+6/zyCbxzS0TbTErEeGScFmxcWeEpbN6tWZ5iSD8E+s3sx9yvFVapvECmAY84
	uYso+Tue1GsraSjC8PfTFM87OsEXTWF7vp/vR3HCYVcGuszBUckpWJ6qpaJxFSkxiwxunDvRTTt
	+PHfADDzd8eM+9eyyghgTcsnj1458Q+AkR+zWslC9e3YmoTun4IFQc/gX+mS8CBwm23sVbrM98N
	3saykjKnRwezvjHuBBNltRsxfO2NA4CxXIMKxyB9pWRMRA9rttR5uoON7qnqBAjaHJ9xwSrRKKz
	Jor1w==
X-Received: by 2002:a05:600c:2214:b0:48a:6321:87f7 with SMTP id 5b1f17b1804b1-48d147423acmr907145e9.8.1777999402201;
        Tue, 05 May 2026 09:43:22 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14e15ce9sm22679075e9.13.2026.05.05.09.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:43:21 -0700 (PDT)
Date: Tue, 5 May 2026 16:43:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 04/25] iommu/arm-smmu-v3: Move TLB range invalidation
 into common code
Message-ID: <afoeIVIGE-JjYy22@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-5-smostafa@google.com>
 <20260501124143.GB6912@ziepe.ca>
 <afiN1UwS9q6F6A_v@google.com>
 <afoYBYIJOTClsdLS@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afoYBYIJOTClsdLS@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_094325_265190_CBB78C39 
X-CRM114-Status: GOOD (  27.76  )
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

On Tue, May 05, 2026 at 01:17:09PM -0300, Jason Gunthorpe wrote:
> On Mon, May 04, 2026 at 12:15:17PM +0000, Mostafa Saleh wrote:
> 
> > I am not sure if it’s worth it, the hypervisor is much simpler, there
> > is a single page table, it’s locked (also identity mapped), it’s
> > updated on VM boot/teardown only, we don’t even use iotlb_gather at
> > the moment, although possible but I wanted to keep this series as
> > simple as I can then we can add more features later.
> > So this patch is the least intrusive change, as whatever the main SMMUv3
> > driver does, the range tlb invalidation logic is the same.
> > But I am happy to experiment with that when posted.
> 
> Okay, then maybe just always push a full invalidation?

Like full address space invalidation? that will not be optimal and will
affect every device on the system, why would we do that if we know the address?

> 
> I didn't like seeing the range invalidation lifted out, especially how
> ugly that will turn into after my next series. So, don't use range or
> use the proper full gather flow seem like the right two options.
> 
> I'm not so interested in minimal change, but maximum forward
> maintainability. It is much easier to manage if you double compile
> more of the driver exactly the same, and call functions in a fairly
> normal way vs make special cases and special functions..

Let me try with your series, but the core range invalidation shouldn’t
be changed often as it is tied to the hardware and wrapping it in a macro
is reasonable (just like the CPU tlb invalidation)
The last time this code was changed was in 2023.
I am happy to use higher level functions to improve the driver maintainability,
but I don’t see what is the problem at the moment.

Thanks,
Mostafa

> 
> Jason

