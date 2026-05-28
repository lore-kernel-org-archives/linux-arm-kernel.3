Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7100CCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s45jeyZUnHcuxamvKyKSnvNc3yOM6rgGg+lJBsLH2Ic=; b=VDlYUF00FqTc0yMMoTFZJgcyom
	I01LqQFSt7AOcsrSEsEGhShXP5KvY4cnA1yOLeZJzX/jN64KRY5UEq6Q5YOkZrd5tiS3JNP9NUiQI
	XZF39lDymEK6nm0W9eg6DivjBFZIgjBa8Ysdncz+/fAq/TTGQFKE3Zykxpnf5DPCt8G9QsKO64Dd7
	BZDXovgZ5KMVeS9fLqTQl+2Kv9CHt3G72n96wE38c4mkchhhc5/bQ0t448u3AjPYtSPaY1qFHKQy7
	pLO53EM27frvhlt/A4wkQfbKDjk4Q/WlZAjg6ifKtFPPES2KHSgNsq5fs/uniZx4gBF+s9UrB0NGa
	nZtEDfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSil4-00000006RVH-0XSQ;
	Thu, 28 May 2026 21:59:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSil2-00000006RUw-0Hsf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:59:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ba180a022dso1135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780005555; x=1780610355; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s45jeyZUnHcuxamvKyKSnvNc3yOM6rgGg+lJBsLH2Ic=;
        b=NhHnWSsaTgKoCYEU7Q4pDJHK1XcRjI5e3fUbbdd71Q1Vi6tAH3yqjH8fzHMVDt/fJ4
         vQokgyUxdrfNbxOecY3cDFx76+lQ5ztD3Bq9kQcC4+lOto4ADZY8QUyXAQrt9jWjlFhg
         D8qBu/vsx+5B1PlZbyuBB9syh3t0ymfgDQ8fvMuGffeYO8p0RXBQKxVcHLKk3y6hD8Fz
         sWvTI+VT/RzZ6OBFCiOc2wAgEB0KNjCzbflQqkX/MMSl75WINdHkySqP4VDhFXxWtXz1
         juC6cgCZ7wASIgvzkpc0kxgMOIVxfbUzqGIv6F7FMkU7JmIkKHCgDFgq6ZTM+TBW2ZbV
         KxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005555; x=1780610355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s45jeyZUnHcuxamvKyKSnvNc3yOM6rgGg+lJBsLH2Ic=;
        b=htHIw7o4WaAB9P4UlyZHmeZQG+1ouYs+r89+Pwi5Latql5XyDsEruDy4a4UMIU9Myx
         WhswlrADc5EXQX82XPoNhsCPsDD4BeRlAIVs+AO5Oih8RzmadYp2qR+iALF8WVc12HMk
         2uWm2NSkmgnfYfWl1vKuIfDAG9gjRRO6X+EK5QsJkgiHgI1yPKZSMnnTQLC2YVic2gaX
         Vus+IrhrWb9XkFY5+fHVoaMoBJypIJqiwKwd5GtWgEtf4GBiUul0Hb1lA4LT+OFiWSJ7
         BZnLGHg4Hv+fDFBRA44GaxHwK0NT3tvN7QrSWSjrbc8SK/o8SUzdIblS+HBfbvjjCZk6
         bd7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Dyxdo20TGD+dInBSs/EXiCslO6unu0kLRgTD0TZTHtAPfR6eSrai6tTry0EWSsLdZ5SAu2eseO+yVPNigijln@lists.infradead.org
X-Gm-Message-State: AOJu0YzV0yNXw88f4pwQXG0vZFYP5b5Nq9rQScdR7Aq3HZQe63fPh7kx
	Mkk9q9jle3WOBKw59iV8mL/YXbiNXXg5o0eZ+Kl77Ptv76bYTNSlkpmh+STQ1i2jTw==
X-Gm-Gg: Acq92OEZjN8Lu4YkV8tgFionq3SFFV6s+FxZjyraLx4TcGKusTvX/LidcnIJHF4/vpZ
	GOrWNof4VAr8BdK84n7duLrYxPVduVFyT+YUbg5LHV/EM+MI1vdtGrx7rALRsnzJKLziF68nB5y
	nZH/hO5bhgjo6K+KPd2yKPYVGDJkmBWXWwF1s5+vi0ZIPuiAsha4INd49CSHqBO2K2Ocu/MOwmC
	z7Mw3XFD2j35+9shTI64WDH1IEOkoKWE+/oByxtsL8FK9FXkoutnMSsuFUdIT1vicx5g0j58Kb9
	SHt00bEoo76aTrAQX3i+uZi7GwZ+FLGrPGjbTs+JX2zCPGwrgPNjLP9wX9CVLYxe1y0g0H89NOY
	kEnOz3mDMnj/DkXYTmM7mdrgm7ZFnEx1vTkSV1cFd9UqB654zetelX/lsxfcY7WYCwNvzZr0pBq
	rzGIdvN80SYq+q7QXNBDL0wQSTVD0LetBtkp/CShLnHlf92lq7CVOyf3mym1iufM2Cy3d8
X-Received: by 2002:a17:902:db02:b0:2b4:60e6:44bc with SMTP id d9443c01a7336-2bf20d31c2emr350305ad.13.1780005554757;
        Thu, 28 May 2026 14:59:14 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbe10d592sm55406a91.3.2026.05.28.14.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:59:14 -0700 (PDT)
Date: Thu, 28 May 2026 21:59:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 06/11] iommu/arm-smmu-v3: Handle gerror during suspend
Message-ID: <ahi6q_BgoKaJG27I@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-7-praan@google.com>
 <ahiPNqKhC186BHPl@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahiPNqKhC186BHPl@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_145916_126394_7232CB06 
X-CRM114-Status: GOOD (  15.14  )
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

On Thu, May 28, 2026 at 11:53:42AM -0700, Nicolin Chen wrote:
> On Wed, May 27, 2026 at 10:14:02PM +0000, Pranjal Shrivastava wrote:
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index 93cee32f6c99..191b5b5b805c 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -2257,10 +2257,9 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
> >  
> >  static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
> >  
> > -static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
> > +static irqreturn_t arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
> 
> We don't need a lock because the new caller would disable the IRQ.
> 
> Yet, maybe add a line of comments:
> /* Lockless; must ensure that there are no concurrent callers */

Ack, I'll add the comment.

> 
> Otherwise,
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks!
Praan

