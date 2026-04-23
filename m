Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4FDFDEE3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 18:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Lc2Z4djP+OFSIRCIs7YQs/PaAF5gbi+2NFb1IXfdPM=; b=2PMHIPYEAa+zjSCVlEXP2YjlyM
	+912mveNalp79y9V6ge9OoeyrxYjYB+pZapncnfrn8y7OZFEzmly4+TMwMFTCFLL2BUHBHlB+DtWe
	i+tHsOx1D5QCMCtjyha3HOXy2/wAQJTjMcRZSWPxlmM5HQC2k3hhH48Hl3TGbJ+DEREXDzXJruvn6
	2q1C3NAho5ooI6pO4PosgTbOzUej/k6YK+0I7vZEVRYi+DsWJRTUvUlPKhX5N2IT1p5JqJticYYYn
	l0FkV8QrwKz8Xc2Qo9fl5dgV9Sw6lCB7ShaRw1cvwe2XksPQolXFLhxzO1Nc2M+n/fhuU9owhY1Ok
	wLJzjebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFz1g-0000000C8T6-2Jcw;
	Thu, 23 Apr 2026 18:43:48 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFz1e-0000000C8Sg-3ebb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 18:43:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b2591757fbso152875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776969825; x=1777574625; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Lc2Z4djP+OFSIRCIs7YQs/PaAF5gbi+2NFb1IXfdPM=;
        b=FbZQTSigZyxZ4ngyrUooy8M6MF0kfXHbtxAMumqSF8Z1t1NS/1eUDQC0w6O+koneR6
         zJbJgQ8JpxFjWRosDFBw3+apbsHZk0p+ppvcKj2PH9r68QTx+VhuGQDhFe80jOXhNE12
         OH3GeH8awg81c/LpXXG4be3XdQv5OM16A5QSq6bCcO53l3su0AgVTYMC2PXWmhcW6dCG
         CxVhXaiYoInvYhH7NDMLzSEKUeUKsD088atcfWIi3FB/jPsSMWKN0Q1y6/DRoyY2jlgq
         A/+ca6zXl45reZYRtlhd+Ve9sHvdnRvj70W1zlwBNjZncGyZx8t//dikPchT3LTvvCfr
         CCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969825; x=1777574625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Lc2Z4djP+OFSIRCIs7YQs/PaAF5gbi+2NFb1IXfdPM=;
        b=M1OVqhFNZKXHrUVmQqUkpe/g6QtV0aCe0hYXQ4ZgRLWHnl67bzXj/Q+qGsD2UbbuLP
         /+9teawIiW2sPdMtuFHuFCLCdZlHK/OhXIwvZMHh+lE0vKWM9z7ztEsF0bxOAFRpOXi4
         IZPifPeVm7zv1EA7WnB8kDTzu4+sfHUNvf+qbxyt2QTjcvxemCx9kBAp+lWPGU7lDpAd
         t1UkcxuJzzEf0xBLcGqeMAd/98fAIrz6mQ+JC3f0mbMF2UjCNAricfv5r+2HTq63umB+
         TnLE30jLucwaNMl0u5VK6N69q84G+SgObbVaBUNkxpd26PJ64timVg8TBdpkfWiAIJU2
         UFBw==
X-Forwarded-Encrypted: i=1; AFNElJ/gNsWLrRQt3HBdG/TkV6t5L5bNXFAZfgt3GLOEK3fs1AFcr4BQi5yeVsUMzh0ifyrh+sJ0V5diq72dlaNPojb5@lists.infradead.org
X-Gm-Message-State: AOJu0YzLlZOt/qxT2a4N3R+UEju7umMBlY34MuYOIffVqfTc2gkty8Fz
	Uz5dqDQz1vqDTMfrulPX+0Ml66qG9nHcf/BdK9tvZKmY1D6zZ3cEAr3hAk5rFAJahg==
X-Gm-Gg: AeBDieuuUCM0CLaKANnextna1mZN2VfUz9oMii4A1QQpGz1/CxQacHxvEqmMuUOHu5n
	elN4SlIo63jSbY8AvIBqbQAbUfJj7x6QxlK64QHXZ4lfK2IIuBoEfOdwEcifx+ahV8sCJx6MnmE
	5aW38LE/XWxSkoS75ElqvXB14mL7s2mHTfGYfWnbc8A1D+HDi10QN/Br7ITCV1ABZIPufi7H6nS
	zD8kEeo03deCBYK0gg884MCpWZ3Z5bRuAx9oVGVYgAA5jE0DRcrdQveeuJkpsCOlUY2PIzCfbq1
	fzGKD+erdL54rsfuKRgzdhzQRVwkp6MGOXRCawJELCNMOhtIbbBPcVlSVwSRp+TgVteKDsMaKQy
	z4CeP7txvXce3A3U8aOS6rXuxjjC8mC4Cp1bcOH5uCAklswTvCPYUBp+vITVlycwHekRjnoKtOA
	0QIGEGYB6oY/b13L7DfIzMCVq3bg8P3nT3tTd4WAADwn/rXuDrKwZmwG5h7V/bfj9R4/wZPVtuh
	3QFbS7UVCg=
X-Received: by 2002:a17:902:ef52:b0:2b0:d1f4:f601 with SMTP id d9443c01a7336-2b603f688efmr1861455ad.15.1776969824338;
        Thu, 23 Apr 2026 11:43:44 -0700 (PDT)
Received: from google.com (195.236.83.34.bc.googleusercontent.com. [34.83.236.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9f0sm20471832a91.9.2026.04.23.11.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:43:42 -0700 (PDT)
Date: Thu, 23 Apr 2026 18:43:37 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, 
	Evangelos Petrongonas <epetron@amazon.de>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nh-open-source@amazon.com, Zeev Zilberman <zeev@amazon.com>, dmatlack@google.com, 
	pasha.tatashin@soleen.com
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <aepfYzkI7NsVGCF0@google.com>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
 <20260422162351.GK3611611@ziepe.ca>
 <aenp6FHzx9rtUQkZ@willie-the-truck>
 <aenqxasLJ8yKYqbT@willie-the-truck>
 <20260423142326.GP3611611@ziepe.ca>
 <aepRy7Gp7Ng85Zr7@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aepRy7Gp7Ng85Zr7@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_114346_913575_DBE73380 
X-CRM114-Status: GOOD (  15.67  )
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

On Thu, Apr 23, 2026 at 06:07:23PM +0100, Will Deacon wrote:
>On Thu, Apr 23, 2026 at 11:23:26AM -0300, Jason Gunthorpe wrote:
>> On Thu, Apr 23, 2026 at 10:47:49AM +0100, Will Deacon wrote:
>> > > Does iommu-pages provide a mechanism to map the memory as non-cacheable
>> > > if the SMMU isn't coherent?
>>
>> No, it has to use CMOs today.
>>
>> It looks like all the stuff dma_alloc_coherent does to make a
>> non-cached mapping are pretty arch specific. I don't know if there is
>> a way we could make more general code get a struct page into an
>> uncached KVA and meet all the arch rules?
>>
>> I also think dma_alloc_coherent is far to complex, with pools and
>> more, to support KHO.

Agreed. dma_alloc_* is too complex with pools, CMAs and what not to
support fully in KHO.
>
>I wonder if there's scope for supporting just some subset of it?

We have been experimenting with something like this. We have a usecase
where memory needs to be preserved but we want to avoid invasive changes
in the driver.

If it's not a crazy idea, maybe we can start with a very limited scope
of providing preservation for a subset of allocations done through the
DMA API? I can send out my proof of concept as an RFC after I'm done
with the next revision of my IOMMU persistence series. WDYT?

Sami

