Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C660CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0Aw/ikfdZAzmeCUnWbRRZpCbzRiV+TMr1DdjVhlkr8=; b=ZVvxG2GC3URRiJoiB9gm0QAKiU
	Nk8I5+BaLT5qslElOABrvlhsl8qTFWH+27X+NgBTK/KGQAXVxODK3CtsJuqTqhGVlMsvVfcUd29xd
	g9DuU0kxcIJkxpQ5+t/AE59LI/HplYgi6Ng+sIfg9pGhxp7zmrNXlwX0cC1TrGCT5sBfFVLkBXMSZ
	rU3MNfIAIfUKG7W0GrFn5JbxKmsPZb5Nd8WBLY/w8P05+5KA7WizAyhS51qiwY1QzWsAnuJsPxAEP
	ve6FxzM9x4mlgfgHZ/LuulGUTUSRKHGLLlfXkYanEwzjKv9FJY0T/az6dLw3QBzvBzp7nz/FQQ3Oj
	lCT4xZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyyoM-0000000EanY-31n4;
	Wed, 17 Sep 2025 20:31:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyyoK-0000000EalY-10va
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 20:31:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45f30011eceso5255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 13:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758141086; x=1758745886; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t0Aw/ikfdZAzmeCUnWbRRZpCbzRiV+TMr1DdjVhlkr8=;
        b=McVNRqkpM1rYwShrf1q5052Ic7MXO/5ALVjkDdYNqMOZ9IbbvxDR/tMp25fWWiDb2h
         +/pdcXTHd3eO34gG9T7M4b0WaBZg3AyHym5dVOnzWUCFee3PQSTdkcVttKc9m0IAV2tY
         /ZRcJojkY+REaU9IYUfp/P/H2n1nWTs6mMbTi/npTf6lqFtW9UdxgOg/sPSJgBxByRTL
         B3A4qaZ2THrsWzUNqUonX2SKSCQiMmHXNSA1wCAP9pe0zYCUN07VNXSw/3mhU9bJSX43
         gIzBX1RXOeCshDyPKvPoWfpg9Sgn8ynF67aMY7rrxJyZpvFk4aWCrWpvzQAjxqH3XOgp
         s4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758141086; x=1758745886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0Aw/ikfdZAzmeCUnWbRRZpCbzRiV+TMr1DdjVhlkr8=;
        b=GAiq8/IqT+QjPmizBH6a+oWMONVa9X6G8DegJfHtsyrxndOmIoUY3cb8SPSWD9bARe
         ldm7MAsd9sCb/eYDFHeI1U84UkfSQmcpRybwfNpt0ZMh3R3pNn/l4rMjk+2GO+QiVV7r
         2FheJ/oHvN9lX7j9RXboGhog7qJrPlZlg447hZejZnCNMUyBhZ7nsRN1J+SySGhGQj9i
         b7/ZcibSlT9iPlpSbSoBC87C73gaIbHiDMidT0FZp+H2a674X6KPnHXTfGg/RSWO5kTY
         wKFiHmxFkYhk/Q1RcXLfOpiiOfGWUtwsXJteGNGND0gx5A6GImNYzQ9L8eAR5HFEV3dn
         o0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUT/X9TpbUxmbYO5uP1a2jLpRQfBdy953H00TqyvUuha7ExGS+MfBzjGbcPv183wpcDAMol/9I1erzLdnNXiWvA@lists.infradead.org
X-Gm-Message-State: AOJu0YwVQlELbkKOM/veQcfWLcoL3xRyzH8Be+j/8WsLgqgMHtdiFiMF
	K1fLx+kWBQ+x+an4z3yv2xQk+4cBhOAYSO+TdEdGrDZnxz5XvWx/pqLSHMt5GIN4sg==
X-Gm-Gg: ASbGncuYHdZC3dX3y4D3Dch5Tn84P4WfwfTf81I1uZ2fDIShBu9GX18CMJf1adpxk8K
	WGvA+L4jnJQIbNZRlNiJ4/7lBpzl6v47gA7WAQuU2YRZ/UXDK8dA8K+pFR/wlCihaikfjMsorxR
	52Hm9fN2rdfXbPEax8FVAyIIphdCgYuop56nPygmk/CJnLQyQZ1dufOKsLX1J211iX9d3snWf29
	wsghfiGUE6FoLhd59BZJLgLW3ufLXIvUVgVU+7FGAfGx1eorYrsTugWruaix+yUsPf0HE0FtqIP
	mFTQuQHRrKUGl86RwMQUtTM+47EAy6itjpelrQQZ+x965iyTgjzEnDJBB2AHCczwM+O8hBylpal
	dDm9Q/KPbqfJrpRmTU9j/HSKOGIGTozswA8Zq0fAAQSEwp8QZfQdDlzgZg9HhaF4+gSrQeG9S6I
	i25dv0uaMDJ1r62mrfCgeTz0o=
X-Google-Smtp-Source: AGHT+IGI+TRRIpc57be67hlvyGZzYort82ADBT/ieq1RpFHGCywCE3qx2LHW/vGr/9Ap+vWBFfN2VQ==
X-Received: by 2002:a05:600c:8b55:b0:45a:2861:3625 with SMTP id 5b1f17b1804b1-462de4d0edamr1272285e9.4.1758141086300;
        Wed, 17 Sep 2025 13:31:26 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac271sm9969975e9.3.2025.09.17.13.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:31:25 -0700 (PDT)
Date: Wed, 17 Sep 2025 20:31:22 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v2 3/3] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <aMsamiTEssyR1wsd@google.com>
References: <20250917191143.3847487-1-smostafa@google.com>
 <20250917191143.3847487-4-smostafa@google.com>
 <20250917194454.GM1326709@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917194454.GM1326709@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_133128_312663_1C4D51D8 
X-CRM114-Status: GOOD (  21.46  )
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

On Wed, Sep 17, 2025 at 04:44:54PM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 17, 2025 at 07:11:40PM +0000, Mostafa Saleh wrote:
> > Integrate the selftests as part of kunit, this makes the test
> > available through debugfs.
> > 
> > Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/Kconfig                    |  2 +-
> >  drivers/iommu/io-pgtable-arm-selftests.c | 93 +++++++++++++-----------
> >  2 files changed, 51 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 553522ef3ca9..f7e6d1db6ce6 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -42,7 +42,7 @@ config IOMMU_IO_PGTABLE_LPAE
> >  
> >  config IOMMU_IO_PGTABLE_LPAE_SELFTEST
> 
> This should probably be renamed to xxx_KUNIT_TEST

Will do.

> 
> >  	tristate "LPAE selftests"
> > -	depends on IOMMU_IO_PGTABLE_LPAE
> > +	depends on IOMMU_IO_PGTABLE_LPAE && KUNIT
> 
> I wonder if it should be:
> 
>   	select IOMMU_IO_PGTABLE_LPAE
>   	depends on KUNIT
>         default KUNIT_ALL_TESTS
> 
> ?
> 
> At least the default should be there

Makes sense, will do.

> 
> >  	help
> >  	  Enable self-tests for LPAE page table allocator. This performs
> >  	  a series of page-table consistency checks during boot.
> 
> "kunit tests" here as well

Will do.

> 
> > -subsys_initcall(arm_lpae_do_selftests);
> 
> Oh so it does drop the initcall, the coverletter is a bit confusing then.

Yes, I will reword the cover letter.

Thanks,
Mostafa

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason

