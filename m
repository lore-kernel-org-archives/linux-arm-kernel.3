Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00051C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 20:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31GHQPHWBGAHGW9onfV/wzjD16/j2GZDSuzniH4Q/3E=; b=IJ3xFN9tYoH+x8bgSA8azcSWAA
	3dr8WQHKOrHcOVmv+SdZQKVOh6zPr9kprxRgeeGMTgrDUp2llrNVL+4wnjKHhTHykPHK/J2Pt4AUM
	IvnKRpDivf7uBExohDCSUEVodWiiHc0kDk/GRSrFXnap3s6kzZboaM4SbvBJew1QIH5EsoRUqj3AN
	FJmbVeCtePTVIM+zFq5/NrJBK+C1PTMZzYBgZgJXJSEi92E9YJecueQoRCrAVOD2wGkobdqGvKsAa
	jFkZ3vQzD923FOpYJtKkKKgDEOEO7s+7p5o/33VI1E2nyNLjRRQzhpMByUsy9xAX6QhpyIrOVJ7Gq
	qtKe32sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42FY-0000000AASf-1Zpl;
	Tue, 08 Sep 2026 20:17:00 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42FU-0000000AARN-1aEj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 20:16:58 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d6ff3aca06so3215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788898614; x=1789503414; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31GHQPHWBGAHGW9onfV/wzjD16/j2GZDSuzniH4Q/3E=;
        b=Bgh1BLp1SS8gdV9kGmTI6yJ9SYvZw66uWOw66JCw/KgfTES+2TxP03MD+E30EN2LbA
         IGVr6XYCz/Qu5U7H+uldmCrMx7ENeLNOOr9DWX/6mmJ2tgPptwzejs90cNPvsi/s9ghe
         kFnNUu8na423BBN2sfdhAU7eDKizMkVKjBZbnR7ie+KWxLEw49ChDn+uIo6CaH7lykbo
         khKyyKq/mHZH1svnG7ZFCnRKcACtnc5CaLUikcKBTW3Z3NEYUHxUPUCiUESEAuoDP19f
         CZwumE38htQ+A2wtC6Zmc/II0HoOhhF5fSxBIxdmox2BvJE8a9f5m0+cSuKkCFZbtJJz
         wduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788898614; x=1789503414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31GHQPHWBGAHGW9onfV/wzjD16/j2GZDSuzniH4Q/3E=;
        b=n/2oT6ALLwOCmpi3h4l/VvWe9wF2vd2593MF1YdZR0diwXe8wAX2BGz5OZ6iwFacOQ
         Hryj9gvBuYvKLlSVmHNB9dLxsYOrd0bOwe5kyzb7otA1nu5GvPPyB035R7tx4eQY22X9
         DGm5dg61NfR11VArLS24Ml7J5r3zep4h4lRSlQBxgDzP2L0uJcegBMNbGJUBYTdI3V2j
         +eQ6PM6HeWmfm0TW8bRswauAvGH3Ye50/tvxCt71UkxvDNZQpWD2+C9dMxahI0ICMXKI
         YKHvabe76sAiz3eKoPkuEWVnK9XYDmR+n0P+BwUAWdT20D9i6ncf25mQyE8g6YQvHrmI
         9Ybw==
X-Forwarded-Encrypted: i=1; AKwUvBysUpT1LKglC/02C3pQyhrVUGx+RtGXaG2yFCopr8ig9wB8UlrTFVoEMj3lAul+ICynPC32uiBkOK2lqYfsQ3oy@lists.infradead.org
X-Gm-Message-State: AFuF++lN1JMEgxCPEfjRFs/Wgvr5OuQSdJhYEpZsuHgWKgyUtdAAU0a7
	+xTXb1A+ZACEK5DIqU3GosDJUhq+EZfDkp3E40QoraSVn57DYV8HnlMkASd0C+BFQQ==
X-Gm-Gg: AYBFou29Y8gr9xSBhLv2pza9JCK1umKLuqY9kJVdQq1MbBZKV2B2TdCzl1boI6BYJun
	tA9UiWrfcUd8fEra27dhY7sP4yPOzDvVbv+mR5+voRuxlpizU+xPj5ThllfCTDF1/QwmNga04Yc
	EIIFIxD7v4HoXM9JdbhukFoGh8tBn+aWUAMBYr4XnbY/AbstFAr4ipif7/FFqOhba5BL2i1uhX2
	P4jb3Yhu/zJc3fujdCsMwDwObA6nfwy3i/cpz9M0g/Z46okRIBMKsd2+5qfRU4njLTzTDFcC4VG
	L29xAmIvhrdRrHSBI9SgAM9oFS9Mtou1xv1vRlKAw8Krqtgh1GTtJGtI83qahTsRY4ficdhkiCN
	KDIjFt8wcwENqLVDR0fYzv1ix+4HFxHllSJlXUFY9VthHb8Le/CVjOe6YjO6XtO6eZxVgmJeL/h
	MODVGWYA5/bHSj78ZvJi9Iv8nVzWUduzl9+NAdd06b9E483SILSQ2b+XAg458p40PhmCFuxR6nc
	tbYUYP7OiZWwnwyvwuhfCYHxA==
X-Received: by 2002:a17:902:f641:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2dbddb1e7eemr1343925ad.2.1788898613709;
        Tue, 08 Sep 2026 13:16:53 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm35571770c88.11.2026.09.08.13.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:16:52 -0700 (PDT)
Date: Tue, 8 Sep 2026 20:16:45 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	Jason Gunthorpe <jgg@nvidia.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v10 07/15] platform-msi: Introduce
 platform_device_msi_rewrite()
Message-ID: <aqBtLerHaWUduIxW@google.com>
References: <20260908171712.356645-1-praan@google.com>
 <20260908171712.356645-8-praan@google.com>
 <87se3j1qgu.ffs@fw13>
 <aqBs1Rzz_i1N7756@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqBs1Rzz_i1N7756@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_131656_423358_2C4F717C 
X-CRM114-Status: GOOD (  14.70  )
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

On Tue, Sep 08, 2026 at 08:15:17PM +0000, Pranjal Shrivastava wrote:
> On Tue, Sep 08, 2026 at 09:40:49PM +0200, Thomas Gleixner wrote:
> > On Tue, Sep 08 2026 at 17:17, Pranjal Shrivastava wrote:
> > 
> > ...
> > > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > Jason. You really should know better by now :(
> > 
> 
> Apologies for the confusion, Jason just directed me to avoid open coding
> this in the iommu driver and have the irq core handle it instead. [1]
> Jason had nothing to do with the specific implementation / design here,
> that misintepretation / mess is mine :( 
> 

Missed this link. (Sorry!)

[1] https://lore.kernel.org/all/178767577112.3356902.7778967514008843854.b4-review@b4/

Thanks,
Praan

