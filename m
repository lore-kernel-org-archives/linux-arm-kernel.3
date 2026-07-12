Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C013C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 22:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvL6EjrEIuF0wC64QnMQO+VDujPOa7rrdCG0RMcrsPU=; b=qWYbPGIYUQO7Za3FjB124G6FWv
	amO8vzN514h+s02hbc4VKVYFX+OBW4TfKddf+LQF9esaoidmhXSs+9F/SqgYBhSRpxHAiMdsJOCUB
	6NnquDAL2WSgmHLEcHxSRGQF+Lvx6WNhRuETfURgehf4PQkJbwJnz0WrvjfQ/6aXXk8POg1RsAw0R
	ffya8EyfgMw3AxeD/PKEtGhaiP5qfIdjcBfK4uorYTV/G5fPW075uLciC1PZ+OI17F8hDOEQZ7zcu
	SnAkOkwVD7y30JQSs1IXVjhzLm3NOQ53egTQyD6KHfTmSCzigaPBPIAz93om4mCTq2XM6jh3X2uob
	5Qy5XOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2Fz-00000007nTm-1vIj;
	Sun, 12 Jul 2026 22:02:39 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2Fx-00000007nT7-29sJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 22:02:38 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51bfb91795eso18971251cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 15:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783893756; x=1784498556; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvL6EjrEIuF0wC64QnMQO+VDujPOa7rrdCG0RMcrsPU=;
        b=EJ2E9fyDttFdvJf2AOtVDwXeN1pIRsRxKc25LotVAy9LqmF8IHgYlnljW+Pxzb9P3G
         sSASJar35jjRDYUFgZkQCDhShZud0Y6pRxHtZfAfvz6/mFY1QK96MB9A1xM/kwGypvdY
         pjWOEVfbSrRUKwyNCWe/ZAvki2eH9KPsbeExJAq/dGQG7+tqHI4bH/KvV041/+9ChOiN
         CKH1p9S6tlnrSHgFZ7UvEf+2dHpsuPkb+h3iY4bGLnzz4j9Y4MA9Yvt1rochHp8rxto2
         G+tA4OY1uDCaK0IWwp3PCkjR6h2op8iTXazifaG/EXTOdIRFPgwm7dWffUBz1yB7hVNA
         oNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783893756; x=1784498556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvL6EjrEIuF0wC64QnMQO+VDujPOa7rrdCG0RMcrsPU=;
        b=khwGxP5cr7bFiH1vjGV0jYUwT1UD30thdpRg6dyKWT630qq4ftjLUsrNJnMK6u8EJb
         t5XdaK5BsSGmnWlOHyfhzJmpq0nduGkkIZrV3Z/tcxGFpP4jIoqapyHDJ0EEk3XxL68Q
         6b6ENl+MLZQhq6Sn9T/2WYMO7G+hOs3n1h9OCP8YI4LFJirUE7xxCXmmLs2l2erKRgtI
         xoOQPgK3/arvRoCFBNQeGtsSzB9OfoaTrPjUsec6hBQC3SdRrbfIAbhVMRL1Hj3KXu3y
         EiDF/GD4w8G471gOyc4W8dMjhF6esO8abChrTdA5ZI3L3lE1OfYF0qnGwntN9Lyu10i8
         3tVA==
X-Forwarded-Encrypted: i=1; AHgh+Rro+cwnLM3mmnoUqOGJJvYQS7h+PhHqQg9Jy5dUmclVTlUbgodMrfR5bY2Mm/H3ZbmwN50qkhybSxqFBJ3DU42H@lists.infradead.org
X-Gm-Message-State: AOJu0YxAuebGQkUEBH+8F/2E0Muvi76xGuFVaNOBckXXyLBozB7wllb2
	AaeyJOfXsn4NNZGULvVBNBDlnHEXj3kVOMmVSp4VYHRKkHja2FFiF305tkMQh4rY8wU=
X-Gm-Gg: AfdE7ckmhLaCrmeeWTBJ4nbAFspA7mvLoYDdPCW23ZnTt7PYcoDas1HtDBtdpyQo0aY
	Tfd6cVk7p4LyGbd7bKlsYJ0Kgcky7ubcgtx9EXit0VFfjzaEVbgfSKVh4KT3cD5T//4F0qJbKHk
	y9TIPjZHlLS9t5FAbZ/Sp0+s9N4m7FqmzaMzzkap8CSg/CKqSevnNljM2qozN6M9Sozgmbc6o1u
	muC4Q1lH1+RtPmpABCi1eiaX1JoHVH2xc2LEuw62APhOm7sK07fl5ELpyej0ZxJG4ozVGxTS7hY
	Hqp1tqy+aMxkySRKzxhX2n9/MdYwXt+jUJ0C/UyTINO7QI2RoQCIIlsql10j6tDJJH9xYQHtAxf
	7Mo9LG1M9vYATInUUXM5isBYj7OM2JWwdagHeK+DW7DHEKs1fj99tY0iDTk3H
X-Received: by 2002:a05:622a:15c4:b0:51a:8e07:59d5 with SMTP id d75a77b69052e-51cbf071548mr72240201cf.12.1783893756428;
        Sun, 12 Jul 2026 15:02:36 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4b78sm113643606d6.18.2026.07.12.15.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:02:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wj2Fu-0000000BnNB-2edV;
	Sun, 12 Jul 2026 19:02:34 -0300
Date: Sun, 12 Jul 2026 19:02:34 -0300
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
Subject: Re: [PATCH 2/6] iommupt: allow full-table contiguous leaves in unit
 tests
Message-ID: <20260712220234.GB1835788@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-2-80e10cdde2ea@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-2-80e10cdde2ea@reactivated.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_150237_564539_A223B95B 
X-CRM114-Status: GOOD (  18.22  )
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

On Sun, Jul 12, 2026 at 10:18:52PM +0100, Daniel Drake wrote:
> The generic_pt tests currently assume that a format should never support
> a contiguous page size that spans the entire mapping range of the table
> it resides in.
> 
> This assumption breaks for BCM2712, which has a 2-level page table.
> Level 1 entries cover 4MB of memory via their corresponding Level 0
> table pages. There is a concept of a 4MB largepage, but that is
> represented as a Level 1 entry pointing at a Level 0 table with the 1024
> usual PTEs with an additional largepage hint applied (for TLB
> optimization purposes). Unlike typical IOMMUs, it is not possible to have
> the Level 1 entry point directly at a 4MB chunk without the need for
> Level 0 mapping.
> 
> This BCM2712 format is well supported by generic_pt: SZ_4M can be
> advertised as a possible size at Level 0 (so that the iommu core feeds
> it 4MB-aligned mapping requests where possible), and drivers can also
> advertise that *all* leaf entries are installed at Level 0. This indicates
> that the tests are overly strict.
> 
> Transform the test to become a validation of the driver's routing intent:
> for every advertised page size, check that pt_pgsz_lg2_to_level() maps that
> size back to the table level under test. This is roughly what the original
> tests were doing, but also allows the BCM2712 case to pass.

Seems fine, but I wonder if it should be conditional on the format
somehow, I put it in to detect mistakes on what was the universal case
that nothing would do this.

Either way

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

