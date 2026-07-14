Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34EVAP3xEJbniYxw7KzDG6VhCOQxXOAP3siy7t1YUHk=; b=qOYUJa3WzRAd3H8uVV5jKmRcdF
	m7rrb+hT21jkvmYWExo+a9njZAV9J62kpGt6h815svHxHVJ1no5WMYPf0ULQjCy2w7XKNJzEgKdBw
	HN/Q9jdbjO1ngcBnyLZO6jgt8yujKTqWyxtrBxi2HQn/Q3fKLP+feIL4JeKp+C67uRB84XVoly85H
	9nbt1Pol13BWKpDqWb5ZdORUNyCCO+seIbO6K9wpCytAIT0jDQ3ngRvZT+9OCoF+sB+PrHVT3bp1L
	YkUUYOtEOG61dE0Rdw6WXOBVjWJ1If/Y61k6t2CgMx/2z/SNbIY4FcayEM0frjqVF8QIU0IyDAvHC
	MYATQ5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcqq-0000000C6B6-1HsB;
	Tue, 14 Jul 2026 13:07:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcqn-0000000C6AB-1Tbs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:07:06 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cacef7d299so119575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 06:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784034424; x=1784639224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=34EVAP3xEJbniYxw7KzDG6VhCOQxXOAP3siy7t1YUHk=;
        b=C7yx0Fc3jUdOVUEW8X3T/JVttxq4vkb7l9VfIB/ADm9yJK31yfN/2u5QmMC60GnQ6e
         z6OSbFE9PCxKzxrHEaD+jt5ajoDLOLFUvldyaxDdAsFRb21TX5vOpoXmfjynuqp9iFPe
         2LHGPV0olH14318asJdY29ltuFvpJoGI0qqnXy2BexZyOtC4+7dnycTG4uPSbflIGlf6
         ZUmtuGSv8/PKJjFweqSLPTwyIoreOztZ7wipdyP21NewdM6u4xCsKI19E+mBYHLcFiJz
         kc6iSXspwvo5klDQBRIHQoXhVvGK2kKD+GrQtEqVV3/iUj+VNipMZB+dFy82az8IA9sH
         OrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034424; x=1784639224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34EVAP3xEJbniYxw7KzDG6VhCOQxXOAP3siy7t1YUHk=;
        b=q2DYb7FEQ2HFAJ6ZXd+tADwPxV2mKYdNZU/dPqYB0t/ILBcvV1zONRdypf5yUrbIWU
         Ie/KSMvf5K91NfY9z/EFe9/GPwoAWcLC1pDTBXYkc6cyd5xeMA5h9zGH82WtpQS5AdBf
         bgfNVPMzMbecv0sZVQ4FrqokhM2VE8v/GAC1XeFnY6kUyx6DfeXhQHOLSh0WQVBaxsuw
         Tkh37F6yiRo+FlrMzIqeGqLSYTvgVmk9ICwQYP1tCA7cyn6kbFL4W5eL5kbhsnuVBTa/
         cX7IIpclOP8iJdGBy4MFC19MSuNuPpySk2goqGgnSYhTIMhRlqqV/Yvn7RnNjL074tVL
         iazw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5IIOSLWGHAVIJLVsmr5vSwt4edbD9Ychs9+xfLuJY0jk3hwDqSbKuqApMdpUf3v+ppA2N2JBvEbyh6TANMHC9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0LPgdi7c0indONBainGcMxFadD6Qeuc46TBw0hMoJcb2oXSeN
	1f/KGFNSc6dGeUVRIdWL5RtsA8M6cfS9Tn6SEaMnmTDk4xGVieSx1e9JmqNN9uNczQ==
X-Gm-Gg: AfdE7clolQ6sIc/tjzEjuWwNHigv+s94KFQG/BwdUzlpzy42JhoerFjuiT/nSq8Xfur
	LL9ddYfIrIUCAAlgvJjA1fXhClP6wHQ99r5gmaRyOReb4fgdH0tgChJeh/omysTfsJco97C+NOh
	hi4+aUWQXtbmQaCLy2wlNEMWOQuFcagxgRm0PXiBHlx/mVop7iubkB5VA7WDRrUaR/cqCnHiKdC
	BotyTauicYdL8VcslTkN7ZELyqDcE9i+5Ygajlptjb74UVmlc/ZtN4FrR3ZhNNC/QRVP9ddoLUV
	TCd5OAZYhj0b33jVbgteip6w6M98Opg7lKWpcRmyPQY3SsncKvGr1+a/Kw5GM8Yl56BDI1sqwEf
	epMooYQoBUy7iIjhKc+C1zfpilN7zbfrEZ+i3/fr8sLEVXJf8sv8aqzFjUzSVq8eL52PvAOzBbd
	0E67e/8twXjekN5LtX42QfDbucUVGdYWWwCQDvm5aLHrDv5Gg=
X-Received: by 2002:a17:903:1ac6:b0:2ca:cbe5:c3af with SMTP id d9443c01a7336-2cee169252cmr5952975ad.7.1784034423917;
        Tue, 14 Jul 2026 06:07:03 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb775sm116995885ad.2.2026.07.14.06.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:07:03 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:06:57 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] iommufd/selftest: Convert cache invalidation
 mocks to the core array loop
Message-ID: <alY0ceR2leyRxXTy@google.com>
References: <cover.1783539724.git.nicolinc@nvidia.com>
 <4383c0afeba9795c9ae312826443fd7d5fc3fb58.1783539724.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4383c0afeba9795c9ae312826443fd7d5fc3fb58.1783539724.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060705_395688_6C3B05D9 
X-CRM114-Status: GOOD (  14.57  )
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

On Wed, Jul 08, 2026 at 12:44:18PM -0700, Nicolin Chen wrote:
> The vIOMMU and the nested-domain selftest invalidation mocks each used to
> walk the whole request array on their own, with the vIOMMU mock even
> allocating a buffer sized to the entire array in order to do so first.
> 
> The iommufd core now iterates the request array itself and re-invokes the
> op with the not-yet-handled sub-array, so handle just a single request per
> call out of the front of that sub-array and report one handled entry via
> the array->entry_num. Drop both of the loops and the kzalloc_objs() in the
> viommu callback function, and keep returning a success for an empty array
> as a probe of the selftest data type.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
 
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

