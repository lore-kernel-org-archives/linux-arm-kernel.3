Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C52C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAqhdEJIac1nBI7ghVhE2bBif5ol3c9AIgGMBRie10Y=; b=gCHgqZpFXEHZwQ4MYddn+6Z9E/
	hycQy4pDNU8FbigQ4Jpw2Dds2vJmd1Rlp7E8+oHnRRmr1wWPg5Xhlz8RIycD08q1wW/28tSEJ7m6m
	sEclL60jUsZ/3ykaLRCHCucehy+GBR0iLAzcaQJToHd33NJo5jhPZqsRq0N0VtyZc9dTD/zHuATA3
	ffEsWa/s0hB4QG+1XCtcmYAomHu9GTk+qT2DpJ4L0m5xLJj+QedqxFaJYe8JM4FLxjEorV9RCl0Nj
	ZRk7IlhkA2GiULRg7eiSUx7k402JHr7XpWDegCU/L7zWWfyxTL0vprSJjoYqoWr6Yc4QxiZwEyIAY
	4+ZbHC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvMl-00000004uiz-13yh;
	Tue, 11 Feb 2025 18:52:15 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvB7-00000004sQ5-2sK1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:40:15 +0000
Date: Tue, 11 Feb 2025 13:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739299210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TAqhdEJIac1nBI7ghVhE2bBif5ol3c9AIgGMBRie10Y=;
	b=DEP9DTdOL7rgm9GNUJd6f3Y15SCXoMpg/zGbtOV3YCnDxmMHyOfbamgMAEtFnkbQ9XNUm+
	MNw1pcp/LWTC1B+uJMKjcG5+3N9OeKlZWSoTbJmYBVdgrHLjOgskY7ZE3decNuTCUvHyRp
	3CeV3xiGX1VHrxkMU/bGgEmKJUVhQmG1xMP65Tp37UsFCMdNMSIQmOjPsLLuyhFseo7qsj
	PgOPDlaCfAqLkkGGguWC+wdPYj41eZWPEOnASbTHsZ4/5C7ZwpoFKKL67dASGx1ETp00q4
	wdXWp+4qmJqoLYHAKoplMwVk+bsNqAe35ttAdXPXTwiVpv4hlnJQmT/ndXtstg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] iommu/dart: Set DMA domain for locked DARTs
Message-ID: <Z6uZhQtPAE8Ck_b0@blossom>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-3-5d97fe247f35@rosenzweig.io>
 <1d6b3fe7-9376-422b-a2e6-ebaed7b6cd75@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d6b3fe7-9376-422b-a2e6-ebaed7b6cd75@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_104013_867757_492C8817 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Robin,

> > This is required.
> 
> Now that we can, I'd really rather do this properly and not offer an
> identity domain in the first place when it's not available.

I'm reading through iommu.c but I don't see a way to avoid offering an
identity domain without the DMA override here, just reading through the
logic of iommu_get_default_domain_type. Could you point me to what you
have in mind?

Thanks,
Alyssa

> > --- a/drivers/iommu/apple-dart.c
> > +++ b/drivers/iommu/apple-dart.c
> > @@ -941,6 +941,8 @@ static int apple_dart_def_domain_type(struct device *dev)
> >   		return IOMMU_DOMAIN_IDENTITY;
> >   	if (!cfg->stream_maps[0].dart->supports_bypass)
> >   		return IOMMU_DOMAIN_DMA;
> > +	if (cfg->stream_maps[0].dart->locked)
> > +		return IOMMU_DOMAIN_DMA;
> >   	return 0;
> >   }
> > 
> 

