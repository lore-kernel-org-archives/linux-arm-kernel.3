Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5952CC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 00:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+eyuJJuDqUpzb7f6fRfbazX81T9EOhy1ShTPafeE64=; b=hwMMUCLSFDvmKUFQ24jchG7765
	yac42La1ZCIktdScZKFYmPo003MrsDyeHkdR270PB16jo4MQKHLY6b24tWfbmtZBKSNqdIsIpLSoY
	JvAuEQvT5EzBmTPTdwaSU/2tcZpEF16PkujAR2WTkezuSX2zHtftNM3BUzqScmP6sGtrgr4rB/zBp
	uRr02jwd/AmDV+sCC+US5d6KnhG2Eye1UfrJ2B0113IacQF7Run+mLTEE/2j2RLz8KrgZw9En9V73
	UY7XEti4zZIv1d148NQvvJ39N9jYGuZJC6VdS/l++P/65HhFpaEpCVYXGEoWcxZKJZQTZg1OzRLkd
	IbdqwSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1worsV-00000006VXn-1MGs;
	Wed, 29 Jul 2026 00:10:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1worsT-00000006VX0-24uW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 00:10:30 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cace91f112so5391285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 17:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785283827; x=1785888627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+eyuJJuDqUpzb7f6fRfbazX81T9EOhy1ShTPafeE64=;
        b=IfjyAV/gzFvi+NRnZlUdn0pJzYVRWkoyOZ+Yu7de3cb4rsE1JrlJUu471o5YcAxyPv
         hhuP1Fvf+zResF/Xoeo+UBFGykbHARn+kYwCrPeTVoBSJaKPv8wyjwFDTmlw7IhFIqVG
         3bPHDo2Wxh/+DTYB+KSDsK/6Fowd/HitBIsMA1ctmgVBYpu/EfLc9yRadjloyPtgS6+i
         u5ia1iMmhxrw4ADTEwv107rw0rBOJqB8+YQ4tx5W8S+u2b+YBGBbuihI6D+A+gUcDRHb
         siFiuZIL8z/OuwCPCJ2C0cqAgl+RSxd+q1LcP/jvr7lHgsatEtruA/LBFxWuF3wR3lio
         Rajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283827; x=1785888627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+eyuJJuDqUpzb7f6fRfbazX81T9EOhy1ShTPafeE64=;
        b=iQcWNCYnNqHqHeQyKncqMT01jMETGKEafCy+q1wg6LSGBAIAhTXn2hiOuuAG8f20a4
         wejmFBDyfyrD78lQu+VyWRWuIE0ER3pqIM+68cSZBofa6dnMxXfyqSa+E+tXUWJvUccu
         2a32xUW2X5eUwDC+kjHsHC73VnwUcZDIL973oEYpueIXXEr+QSdWIVWn3lr0xw6DZlLY
         sa6haM3OiElDk7acwWDXxZ7rAF5xXvNy0ZzfBEqudi7n2l6+qw3SfbYWsdOsPqL4Dyr2
         RrXMrHQifIu9yj2lZUbs83Fu4AqrwB4ptAKH9GB71KO/bP5eEWFSLnAR/ikyMBOO0q0j
         lPQA==
X-Forwarded-Encrypted: i=1; AHgh+RqscX33ExZbJ0sUcGo9Z1wQ4xqsb2THOBcNfFu5SA5yeotcbiNbmkkSfo8Lia4u2/qbQJiu0lfOe06CmaYwVeEN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn4bQotURzsY/rAu+RCC9OR0H4ZOJvun26kWoAQw1lkL4HVnpI
	d+/Nm6CBkog1Q73sJOyBNutLGOx0z8AhtJBSA6QQ9N8eEhLhnnTYY1cBrf9o5CbJlj4=
X-Gm-Gg: AR+sD11/RkEILX0APFw1CSDkT22NLXAAA3JQESZp0pspBPbXhQRZM6h3LlT2T1UAMP7
	TwRidS7nJ4yRqq+QigGIXM0KsnM0sw2hoToK+bnaXDPY0+GC2+XxlFRWwZG0OPt4zeqcA8XMDqH
	yBAWaQyYlDda0O7UGGklfFw/6A8wlNJfM4aMK6/4XWnsOdca6jOp19Pk90Gh2W4bh0eZsBOqTOe
	ksDiLUL3H3GN6dfZyw0i5q5niZP2b7s2aesXzSTeH86KXynbQysr7EUwNB+aosvJhwi6UecdqYq
	IBetu0zeurwLhUL2/0nh6fRW/Sxay0lsv14Uijd+MMv+mEw3Jgrj91qWimAbe7sXbcgfVxzpXBq
	I68nXv2XkzR9+rbq0/Mo/ENaRgw4N8FpjU1YPemKpRzNUj1GDGXObCqYASD9ydc2QSm+59lg86t
	WGOL+oSDpmI641nirPAtEZ8Q+bttKw7k9RmmR6iixBZW+4ftQqHk67cptL7UXZ1DS6
X-Received: by 2002:a17:903:46cd:b0:2cc:f7c6:8353 with SMTP id d9443c01a7336-2d015da2cdcmr51336395ad.41.1785283827557;
        Tue, 28 Jul 2026 17:10:27 -0700 (PDT)
Received: from ziepe.ca (d50-92-54-205.bchsia.telus.net. [50.92.54.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a4596esm2962495ad.23.2026.07.28.17.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 17:10:26 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1worsQ-0002DH-GU;
	Tue, 28 Jul 2026 21:10:26 -0300
Date: Tue, 28 Jul 2026 21:10:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Daniel Drake <dan@reactivated.net>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
Message-ID: <amlE8rEgryPqrUZd@ziepe.ca>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
 <3e7ba95b-51e7-48e4-aea5-f86db1739ac2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e7ba95b-51e7-48e4-aea5-f86db1739ac2@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_171029_540856_7309AF45 
X-CRM114-Status: GOOD (  19.96  )
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

On Tue, Jul 28, 2026 at 11:51:04AM +0100, Robin Murphy wrote:
> > +	ret = pt_iommu_bcm2712_init(&domain->pt, &cfg, GFP_KERNEL);
> > +	if (ret)
> > +		goto err;
> > +
> > +	/* Set up a default (error) page used to catch illegal reads/writes */
> > +	domain->default_page = iommu_alloc_pages_sz(GFP_KERNEL, PAGE_SIZE);
> > +	if (!domain->default_page)
> > +		goto err;
> > +
> > +	domain->base.geometry.aperture_start = BCM2712_APERTURE_BASE;
> > +	domain->base.geometry.aperture_end = BCM2712_APERTURE_END - 1;
> > +	domain->base.geometry.force_aperture = true;
> 
> ...and thus (as things stand) this is a lie :(

Well, it shouldn't be here, the iommupt core code should be setting
this from its own internal information. If there is something missing
to add in the full_va_prefix we should fix it.

But, AFAIK this is the correct way to declare a page table that has a
range of IOVA - which I think is what this is doing..

> If you want to operate like an IOMMU, then the translation aperture and the
> bypass window should really be mutually-exclusive;

I think it is operating like an iommu..

It uses generic_single_device_group() so there is only ever one
translation.

If identity is attached then it clears MMMU_CTRL_OPERATING_FLAGS which
I guess fully disables the IOVA aperture

If paging is attached then it sets MMMU_CTRL_OPERATING_FLAGS and
places the aperture at 40G. Based on the comments about blocking I
wonder if the "bypass" even works when paging is on?

If blocking is attached then it sets MMMU_CTRL_OPERATING_FLAGS with
some 0 address cap which aborts everything?

It looks to me like some of those comments and choices don't reflect
what the driver actually does. Since there is only ever one
translation we never need to be worried about where the aperture is,
it could be anything so long as the HW gives it priority to bypass.

Could the aperture be placed at 0 with the bypass fully disabled? Then
it would basically be a normal iommu.

Jason

