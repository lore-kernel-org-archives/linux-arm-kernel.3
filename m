Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8A7FA1FD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HbtIWJEEQfl5xMwb90/SLKx0MmSnbCQLKL8UeHi8wE=; b=kUMc4Od6QiKVMQTEgp5erf3UXu
	OH0pRhdo/32xbfN2yfJLMPPIbMhhyCpD+DTaOfBfh0LEPdoQbtZeTvNzVmqkhy18cygP0nB7m6mbS
	M7YnGIiYjn3jFNVDEjZWNbjcU3wjEIrLstO6fB2apgPMCN13QRI1UpRY9xjfGh0P6eQgVUoyi+ng6
	TWoVd26XRtSalJ7xVkC5E4kouXmQUUvNHybm+YAHN1gqmQqsZwZfHBzTkZLnqo5jFYVIkNu75ltM3
	zTr3oCRoAb6DxbkNW0+xo1+bYV3TLpweYWaW8StGBX0wu8JGCR3PPQssuCGPhk7syQTSeQTUQY4iK
	3z7P4q+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaMm-0000000AVKV-3ydI;
	Wed, 22 Apr 2026 16:23:56 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaMk-0000000AVK4-29G4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:23:56 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8a48deebe95so43303626d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776875033; x=1777479833; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4HbtIWJEEQfl5xMwb90/SLKx0MmSnbCQLKL8UeHi8wE=;
        b=Eh+SGGoDACHd49jib4ezHi686KawACQ+lNP8emkHYk8EuPxY8k7azz7QO2pS7gPwy8
         FqxCb8MLy4W8kUYlYPzQniE/GfZ35qtalSMWU052F/++wfy/3NX6w7Zltx7Wz6lOsChc
         tqoK4X7owv7IZhX2RDvukQ8d+AsGo6BMVNTcXXjfnvtb1j3bRhEjZiVl1u925rzUmkAm
         kjWrNPW5xumlcKOEadZJmSGi9NMb22C9No40DPrq5lVGwmMAl744MFX00+3nNFvZXSBb
         1HWu4RzTRacQDMOBc76PenOpua5MzMGariXT20XFvBzICmuzIVTYsWPDbGUooWyuzw7Z
         8L1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776875033; x=1777479833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HbtIWJEEQfl5xMwb90/SLKx0MmSnbCQLKL8UeHi8wE=;
        b=Xv504Xsbckrw4tscqJ7eJjANsnza4W4bTB3mx1un/gwSaO/Dz80UIuLTUuA07orWkk
         5UWhkK4Z2C+YDCUhEwJskXuxdfUawOtSd4M+Pfop0tCaCeQfYNuv3j16/lOTJ7qSO+Cc
         6zuaaZNrBTxWCxPxHBmTbvxnpMCc6HSKdjh8q7JAtFGJydSG0hwpgHhPUuV6ht8XKHRi
         JL7VlnHo0V3BhtxMNBDFkcfamSJpTxDOqxs0HZiGBc6KcZbiC5Ni7167zESkWeUho8F8
         +Nrj7pe9ft60HZSxEdJuAb6LwyFNRfXWaX7woSu4qIc2PYYsQ/NDTGytwnzNR2HpzVdI
         UjFg==
X-Forwarded-Encrypted: i=1; AFNElJ+uYq33q7CLHyy9Q76MSWFqjc3u+L2S2BCz0YJVD0S05Whmtsi/BRjNpiwX4jC1RXGL/oXCAXURqcklsbC09tNE@lists.infradead.org
X-Gm-Message-State: AOJu0YyPrNnVEXFw0V9tlXzh4I4B2aHnPCuCEBfa2HmHTUysEUENceLb
	yW7omBY8osSsr8JGFwvRvJ23tIDYuharziLa1AAnX/Oc3Fr7rpxsBKHzHZxPlSUtT80=
X-Gm-Gg: AeBDievMY8+Q9vPjGDkSvEdTmvEWWU46s7PZqprqryJq906ZTtiEyd6kuaE4FdH+0DN
	WqM+9JWverir8NiWnJ5SXSAMVei9Gy3SvzKpMKG8dddKwmrkgOntK1ZAC3LI2+QWX9k4UEgyyPm
	HMN24j7H97jfXacFPM3QHRbuycejhr6d8ZFxL7xCKo1HeQ8XICEolrfbqROt0lCS2oIzL1vNDP/
	vS0Dj/2q8BDzgWxoDDEMUFZvceGJozC2pe5O66S33cR5LQJLs6CM+zrYn78zmRRxCDecvzDrbKi
	EXXmV60mjXSgMHZL8ZO/zRdxjXkXHlc8G7wZ5eToOmtWyOqBVoAg2cOzzb2qe4QbQvnMMW2IaQ2
	+UxK2y0dnGVUOWHlhTQDb8Zh1piK9X0CIfwCgm79EDGGcXpV+tFzgcgSVv+2ydVJqRVXb+vrmB9
	QKoZR3BuwOx7qO4DC4Fqd/tjsY+Imz3nvOg+HY80LX/FhjLfZp3dcGZvFoD9zU+KN1v0jeEV3Qw
	PNu7/Yajp/oR9Pq
X-Received: by 2002:ad4:5de7:0:b0:8b1:f5da:f7dd with SMTP id 6a1803df08f44-8b1f5daf8fdmr109287156d6.43.1776875032883;
        Wed, 22 Apr 2026 09:23:52 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5eaf1sm136505886d6.30.2026.04.22.09.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:23:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wFaMh-00000008ahB-3LYQ;
	Wed, 22 Apr 2026 13:23:51 -0300
Date: Wed, 22 Apr 2026 13:23:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Evangelos Petrongonas <epetron@amazon.de>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
	Zeev Zilberman <zeev@amazon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <20260422162351.GK3611611@ziepe.ca>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_092354_830900_4234DC8E 
X-CRM114-Status: GOOD (  15.60  )
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

On Wed, Apr 22, 2026 at 06:44:31AM +0000, Evangelos Petrongonas wrote:
> The motivation is live update of the hypervisor: we want to kexec into a
> new kernel while keeping DMA from passthrough devices flowing, which
> means the SMMU's translation state has to survive the handover. The Live
> Update Orchestrator work [1] and the in-progress  "iommu: Add live
> update state preservation" series [2] are building exactly this plumbing
> on top of KHO; [2]'s cover letter calls out Arm SMMUv3 support as future
> work, and an earlier RFC from Amazon [3] sketched the same idea for
> iommufd.

It would be appropriate to keep this patch with the rest of that out
of tree pile, for example in the series that enables s2 only support
in smmuv3.

> For this use case, Stage 2 is materially easier to persist than Stage 1,
> for structural rather than performance reasons: 

I don't think so. The driver needs to know each and every STE that
will survive KHO. The ones that don't survive need to be reset to
abort STEs. From that point it is trivial enough to include the CD
memory in the preservation.

It would help to send a preparation series to switch the ARM STE and
CD logic away from dma_alloc_coherent and use iommu-pages instead,
since we only expect iommu-pages to support preservation..

I could maybe see only supporting non-PASID as a first-series, but a
CD table with SSID 0 only populated is still pretty trivial.

Jason

