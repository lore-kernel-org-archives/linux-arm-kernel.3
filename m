Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3672C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 22:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kivqKCD/+dlHoNCjZOlMrMIExYZ3y1i62zZem0Ylilc=; b=R9Wdo6y8mH5W/4Q6gwiy2toMrI
	oqBsmEgBoK9PypeFTBEcB7c4rSjfMNdZF53W0lSKNC8PcDCxnPQ+8OlJB5+ZWo3WhUimq+a2Xk6aa
	QkdFzc0+NIa17WmdnLLaP9esmkwJHHd/SMuJWmpbOY7V2+Mcy5MJ1TrNzkKCi7njVDF0Rb3W0z6to
	+xxEKwOlZjNsBqAjCkJEMTSwB1ufQBVAs4AD4Dq5c6IUpaYlFJWUW8ojK5AFx8PPowGTjYx7a/BPE
	u5y706b/7cHxAITCAPijKFnv8i4G3WWmFJZyg4j3munNTDReBosVA0dKDmJipQn+eOtlCVP1vc+St
	b5w1yHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2JE-00000007ndC-0n1I;
	Sun, 12 Jul 2026 22:06:01 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2JB-00000007ncS-0kYO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 22:05:58 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-920f33347f5so150800085a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 15:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783893955; x=1784498755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kivqKCD/+dlHoNCjZOlMrMIExYZ3y1i62zZem0Ylilc=;
        b=BsJh9hHJsSE7ml+R1gX3mfNW5MrEZpt1W4cQ4WhGiSkb+Uj6OQ5w4qypt9svOZHrep
         6/H1NFjsRtM/Y3CGjuXbObNFEbwO4eBOWXY5I7ZS3LWO4q9kaEerXv0TgK9Ie0zBmIir
         QH+o6LIWZrQtgPQ2gkGbTY5aOSSzyMmzilbfxNwS+IERX4YTJepJruLoqS+IzzhHQcVq
         Ee5qHu2/tz1q485MB65GP/p5pcAQwDF+VhYJdfES5b/Y5LZaIfd6wx34RMNx8XhnMLpT
         +qb67sX6omNgUkyV3Dt0lc+m21bYAqfFynG3torsVvDG2WnKKWWivHKIY9x6fCoPZGec
         xqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783893955; x=1784498755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kivqKCD/+dlHoNCjZOlMrMIExYZ3y1i62zZem0Ylilc=;
        b=rHyuo5uERb7/+kXS87hw7oyrqwFVMThjeg7cZwWHKXCrba7uJFzEIeMnQn9P42k463
         SDZKyN0bEbjjg1+T+zswGirbZgexHQpaN57kNivgBjmj6G/iBPVkvnH+gqyODMU/1y4A
         TJ+1tSCz3IhBRhpc+CmrrcshAWILkN5t/UX8BWkZEPbLipO8TkTFLcl9AMC13/eWhFAg
         FBXa77rlnfz2bMTI/cXOK6eDPgp0eWuGwiiU8ljZADF9HLBn1Nf/2lG/ndpIDjXybsuF
         +8nFbrNKoxQspXZp4nzd2L/W3/HMTF3jycSfC8lH4GS6O5pdPj8HsS/sWthC7jIWme5f
         fggA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9xwkmeINHsKw6xeBp/V2th6B5EjdG/Cu0I5xZtsfmoacdMKU+GY7EnIUCx2eFeeA5lBF+CajPZHN8th7NuK4y@lists.infradead.org
X-Gm-Message-State: AOJu0YxByoQ2KW6oqFgH3f038ioWY9CSy9eBEwQ/rnwpNNvwL0yBiCLz
	avD88fAYGp9Yu9Oj+73mJT2hD7qZShwa5v8NELyXkGqHFlnBZyru+rHiCk73KSIsxro=
X-Gm-Gg: AfdE7cmn3PD4FrAUzbPs+QNWJx9TmiHp/+Hygsr3FzVP8VbrbVtptA5tG/4iVIr7IhH
	USjDuA1AE/Lb6PcmYxgQ8xei1XCzaOFSpjIfr3oVOjnMgkHWY5LyKUJr4vitfkUMC4xVPjXbYgw
	switFR+hAnOOYX0V9O5dfw7Qivuhe5S2S1lBdFO813K/b0l+ZmlAGGq8MeYXSdrn6rOpTutkQaD
	zf3dmqGq55QGwB+vEf172+gynG30JgnUZfD2mBI8lnAGhCQHQ5GZHClyuo0bYTpkykbxmW9brfn
	7iYP49rvECdBh4r262I1W/ud23MSYeuDW66towKxuAn+PYDpj8t1VxR/4w/SJT1SxCCMQSONoN9
	BCql5mo+PWQ8/9Y7yZfK44JT5DA2sozOjWeBv9SXJo9kzhY8D+92m6a7EzEbG
X-Received: by 2002:a05:620a:43a8:b0:92f:c78:559e with SMTP id af79cd13be357-92f0c785768mr97967985a.35.1783893955496;
        Sun, 12 Jul 2026 15:05:55 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5baaab7sm953864085a.19.2026.07.12.15.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:05:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wj2J8-0000000BnY7-1ro6;
	Sun, 12 Jul 2026 19:05:54 -0300
Date: Sun, 12 Jul 2026 19:05:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com
Subject: Re: [PATCH 4/6] iommu/generic_pt: Add Broadcom BCM2712 page table
 format
Message-ID: <20260712220554.GC1835788@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-4-80e10cdde2ea@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-4-80e10cdde2ea@reactivated.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_150557_247170_EA4112CB 
X-CRM114-Status: GOOD (  13.06  )
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

On Sun, Jul 12, 2026 at 10:18:54PM +0100, Daniel Drake wrote:
> The BCM2712 IOMMU implements a 2-level page table format. It is relatively
> simple, with one unusual aspect: leaf entries can only be installed at
> Level 0.
> 
> Adapted from Raspberry Pi's downstream bcm2712-iommu driver (original
> author Nick Hollinghurst).
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>
> ---
>  drivers/iommu/generic_pt/.kunitconfig        |   1 +
>  drivers/iommu/generic_pt/Kconfig             |  10 ++
>  drivers/iommu/generic_pt/fmt/Makefile        |   2 +
>  drivers/iommu/generic_pt/fmt/bcm2712.h       | 259 +++++++++++++++++++++++++++
>  drivers/iommu/generic_pt/fmt/defs_bcm2712.h  |  18 ++
>  drivers/iommu/generic_pt/fmt/iommu_bcm2712.c |  10 ++
>  include/linux/generic_pt/common.h            |   7 +
>  include/linux/generic_pt/iommu.h             |  13 ++
>  8 files changed, 320 insertions(+)

Looks straightforward to me!

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

