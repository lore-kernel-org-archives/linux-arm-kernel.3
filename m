Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473E3D59D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfg2SmLr3HbDKANFq8sDAahr7BVj1MWtGDCHWff86x0=; b=m1hnrKHuiEgZ2XYRtTaaSn6Q20
	pyWBEHZo2QFNOGM9cMTU08JJJrKCF/WnZT/D/BzVGOqPboYF1wv7Af9l38QfrPcO+iaUBiaIPxVZA
	2CdwikRg4QZkv1kVRbIjGeQB7lvmzk98/1YGaIcjoKwZVmR4p/8MiUbUVLRH9WswSQLA31Ufx99SX
	Amx6Vq09aAXEVPhgo2wf4AdUTA9jkGaqPPZeEItOlovmsLAIE1eLF7z2yFfJ/vCmTRznDjAsPWuzg
	1/3oZ2fz/CMDGiVwDLr9PnY5TFD/YkVy0bArO3neHeh46x/Gx5r1HDJyRq/fVLhO2hud+ctgEQVjO
	Z+qt+dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5Hj-00000000lHP-3JUe;
	Fri, 12 Dec 2025 15:42:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5Hh-00000000lGH-2Gy7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:42:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47a815c43baso132345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765554139; x=1766158939; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gfg2SmLr3HbDKANFq8sDAahr7BVj1MWtGDCHWff86x0=;
        b=nH274UlsHKdNOT88tUFDkxGykm5/ULDKQgg5/3vRUsK5rOt/K2Q+fdJmX/8ht2/xoJ
         5DTP0a/SjGhp4mc8wGlGzInkRXgzyGjwKneUVxdl5d+i6aLoYLp8O1LwgeaoVC5lvtAE
         wkp1MAyW4OrrGqIAE3mxbux4yrK1YV9mjap6Q/KnCf2jjwv4JtF9Le3Ds5CpjJkEfXCp
         6Qpp6I1H4KAM4b9g6fuIYPIJR1YDixrhfZMuKWAMiNiFrHFnnb1auiV4q6BJl4Q5UwxN
         B24mifop1vSuuVO8x7BlA/fWS+E0UhUNQ2/8399hpfmuGp2gPOJxvnnKwcS3veENOxf5
         MzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554139; x=1766158939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfg2SmLr3HbDKANFq8sDAahr7BVj1MWtGDCHWff86x0=;
        b=XJn0qsMaqQ/y699k2Ki3JaJXqNaao9MuuSmd2WZuJ7recE4MW3y/Gfc/6n62j7L6AS
         dFMTYjKQpZH4Vyge5lqYDbUHAWYtSZjnA7quw2qZEtYuDqw1PyHOmUBd4IajuZa3cfma
         1kttZWFjx4Dw+o7DkoxyNkRkRQq7ADWBYI58MH4cjSIYTrkZTsBlCVoOqDLOHTg/fxiG
         L/oUtd2VYvcBV/qhPdWL4G43j7SiQkgdDA5gtC+eYFk8j875Bu3K++UPGy0YQ4baAEeY
         g6YaZVJ6pGaJq4YOnsE2FVfmNt26BgVx3YRDwtPtzK6oDOXAfcVNxLmiOElNPQ2xuCvL
         BXKg==
X-Gm-Message-State: AOJu0Yzh+Vvh1lzBLC+ApO+wvEKTQoHjg/dXsxExC9aw/XB2KMfctsPu
	CyUm9m2C918Bq1++HfhiincRH7WrUqpBGsLAzHwP50N64FfyyKGknCGJr01VFfJYdw==
X-Gm-Gg: AY/fxX6IY8RNw882I0JFIajdC2txYt4D7jE7HPRh5PUEMww0Cxau9lhmC1yDx/+i+KP
	cCfhQ/KJvnGTEjxif84lKm07FcX6y1gNlI65LyFK9AS3QVUpLapP14exQMLME0pLme1mqIxTSR2
	ac6folCbi/4U6dLw6vDtki/WKLQmVCZMIDldszRxU80x4gPbWOwQLWxoDZjUqd2xm6UHMbh68qX
	xWuLFTIWa8LYFBAhqxrDxU+vr8ZAse+eTXm63bZb9IwiSrmIPQf1hlXuAYF3bjXY7g5sySG0gJX
	/0opq4C6d6cLSHVyN3neqiieDmAXyhxeti7UyHVPXaAlW70i5NJ8szTYGwAd8Nx66/y9XAHk1Ji
	UXBZj5tT3rkzAt30bZODVC9PsFwQea4k69WgZTgaRppqZBHtPiAS8dftIUpLSIPkNIP5q5bYCGr
	RtgXyMBUEBuu6yPt0kDEgdu6EPRb75SOAs6iJAyYc7+v5JfEoI0Q==
X-Google-Smtp-Source: AGHT+IGt3F8L3ODVzdoshKJbidZOroW1R1wmPFQ9WkER5xE0kT1roC/MUuXOsH8BQJj1YtvxKpKD7A==
X-Received: by 2002:a05:600c:a103:b0:477:563a:135c with SMTP id 5b1f17b1804b1-47a88b7b11bmr1671425e9.0.1765554139413;
        Fri, 12 Dec 2025 07:42:19 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b8a97esm15331584f8f.31.2025.12.12.07.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:42:18 -0800 (PST)
Date: Fri, 12 Dec 2025 15:42:15 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 07/27] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <aTw31-mh8z81yi4Y@google.com>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-8-smostafa@google.com>
 <20251128164816.GC812105@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128164816.GC812105@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_074221_584251_1C85EDED 
X-CRM114-Status: GOOD (  15.07  )
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

On Fri, Nov 28, 2025 at 12:48:16PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 17, 2025 at 06:47:54PM +0000, Mostafa Saleh wrote:
> > Move parsing of IDRs to functions so that it can be re-used
> > from the hypervisor.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 112 +++-----------------
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 111 +++++++++++++++++++
> >  2 files changed, 126 insertions(+), 97 deletions(-)
> 
> I don't see that this slow path stuff needs to be inlined?
> 
> +10 to my prior remark to not dump all the huge inlines in the main
> header.

They are inline as they are defined in the header file, otherwise they
get defined multiple times.

I am ok with adding a new common file.

Thanks,
Mostafa

> 
> Jason

