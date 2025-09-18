Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0083FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8l84kyRuuCoNVc5N+ElWv18ENe/Xi0Yvo10Z8affNw=; b=4j0kMJnU4CboMCqU6SwPwuVrMq
	cgePoQmAEFAanqlRHH8YMj/Kz40PVwE+SC9bkMU7UD8pyKKv+rFJadIxBZDG00rl7xx1W0PqifIbN
	ZiqqTv+ZXlkY4PVGA42BNhE6zL8Em3/LvC4+tFp3QazTcl6nz6UHv8bSqwju8WPIc9bkAmNAlJxsv
	DF6Z3nEbjg5BV/fC93mf21Nmz100qxz7IaWTYWtsb3zB+HnmI0/bVabTtdAtdvlPglooNtyW/nEig
	0Eo6bfyEFx7G7rnpqGPEYHCJSVJ8hyfOUiwTZdKWCdOEqruhCOcejjHRn4jjYteRquCtVlp/WcBu+
	tIrVI1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD1T-0000000HFEL-1EK6;
	Thu, 18 Sep 2025 11:41:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD1Q-0000000HFDu-3FA3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:41:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45f28aba94cso69485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 04:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758195715; x=1758800515; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B8l84kyRuuCoNVc5N+ElWv18ENe/Xi0Yvo10Z8affNw=;
        b=zCQLkosT7s4KvL9qKkMStVIgzaOzOIdgx0v0u7zCQ8STsWaHCbUdoa+TeWN3Sptes3
         pmCRjJtY+oqNK6yTNza/aQAb5I6qZ1q9YUsyf5CEwm22TrFiyS92MWAoVX3XN1neQeMb
         uTEkMxFQRcTUn0rKE1Q9sAADhQZcjt9XMC3o6Wnha0ACw4ZdJgWlWPgO9nFZLdycZFHX
         B4h1XiL6P7irs1RTcjKXfycTaxTMDCx6h+/KiyxwBPZu7JiXt6cOIiL0wdh3X5vNJ37Z
         okCpZZVYbgsoDgXlYOfgRvruCaNYFl6pLi8tQoCtlIDdUna+Nedg0wBwvDixusY1CnhF
         zUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758195715; x=1758800515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8l84kyRuuCoNVc5N+ElWv18ENe/Xi0Yvo10Z8affNw=;
        b=A6re9RRlnD+qH5Urn8Q5fPcoDVui0uKwCrfrSM/v7ceZOT5EfieS2mO0sxAi843RSd
         djTULLlXFDMgs8QF4m+y/aFZkmiC5777RW+q2ptoqERDVOvq9d7rNwlX4OfHWQmNVlPs
         C0d4Vw/8+SOVX8BCc1PRclQpBqlMKDGBW1Gki9Y0tF1CugAcyZFuOyor3rQH4Vkhx2CR
         krEyLQHkctdBjbClmbaPjXB2dd1kfGV5NXa7/NoO5KSM0LrSPpF43cF+Bm55uPL6iyhP
         bLpGPe/cpXt5BVRtzIX/9PTJ83oYhT3ZT7ryHVJse4ucXy1S2P0peB0HDxNm01XorGcg
         45zg==
X-Forwarded-Encrypted: i=1; AJvYcCUP2OqEg0Hkw0hMDPAFqVLYSwS9ZmtV918ukDidSQkfqXuGpTBbMOwlTwFRpip02cMMPRrgTLBTyKFFOCHvDOrf@lists.infradead.org
X-Gm-Message-State: AOJu0YywGNuE9Tb0ZmI1xGSKrGXS6KyqiOrQBTC4Cv8CBv3FGPK3V/TX
	nKybCsvN4Yvp4+k3vIYNj5fRwV2MkCWh+d9PjE39oF6gdMHf2s0tQoXrphoUHaU1cWl/8o+skU0
	snPDDJA==
X-Gm-Gg: ASbGncu06/rPVrA2tzQ+5gS+Qjd+iQUobINVSM9XJdo988Mfp4JzNSRBZ1IDQ4mjt/K
	iw/digiOiLOOwrP8P6yy0qMxL0erGABwMWoDIpsRDMfQEoBaVTaUqm3tkCshIsfc55mKo5ptzd2
	lFxENrXxnzULxC0cBD1Xk4keC/jIO4tHKx5+hpt7bMFSxaZQbM3siHEOKu7RmnedpfBa3eMqjjN
	51jx/dOiz+HYXykvvNbk+XHbXRXzKycoU2EEXBtaUsDp1g2oJ9D7o8HfOQtEvhVIgB9lNuaUkdX
	AjkTKc9TPgIyNvfuOSogR9WmyVDrkRYnZfdL4CSatnIERnz1S+mK0cAPx5OLofeHfvCllF9FGRS
	QnlGgnv2Iw1iHDIOhjSrNpmV0jLGt1LqM0uCQCMaIY+AKHB2V81xrAewaH4z0rrFV1vC+4F2yVJ
	UJZJ0biOCOkPV0PkenvnVLp1s=
X-Google-Smtp-Source: AGHT+IFo++kIW70zN9Z7jaqR2wmSrLihbXgI8ryzk1jKjLYdejG3WXIUw1J2WnvE7qB1mOgjXOYq2A==
X-Received: by 2002:a05:600c:c4a5:b0:45f:2949:7aa9 with SMTP id 5b1f17b1804b1-461548788a0mr3774745e9.6.1758195714750;
        Thu, 18 Sep 2025 04:41:54 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac439sm42958055e9.5.2025.09.18.04.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:41:54 -0700 (PDT)
Date: Thu, 18 Sep 2025 11:41:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v2 1/3] iommu/io-pgtable-arm: Move selftests to a
 separate file
Message-ID: <aMvv_u8HXAV7tbYz@google.com>
References: <20250917191143.3847487-1-smostafa@google.com>
 <20250917191143.3847487-2-smostafa@google.com>
 <20250917193818.GK1326709@ziepe.ca>
 <aMsX_HafW3rLs5dQ@google.com>
 <20250917214824.GN1326709@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917214824.GN1326709@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_044156_828522_66AC4F5D 
X-CRM114-Status: GOOD (  25.49  )
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

On Wed, Sep 17, 2025 at 06:48:24PM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 17, 2025 at 08:20:12PM +0000, Mostafa Saleh wrote:
> > On Wed, Sep 17, 2025 at 04:38:18PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Sep 17, 2025 at 07:11:38PM +0000, Mostafa Saleh wrote:
> > > > +static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
> > > > +{
> > > > +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> > > > +	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> > > 
> > > Can be:
> > > 
> > >        struct io_pgtable_cfg *cfg =
> > >                &io_pgtable_ops_to_pgtable(pgtbl_ops)->cfg;
> > 
> > There are a bunch of other formatting issues here also, but I wanted to
> > move the code as is, so with “--color-moved” you can see the exact
> > difference, otherwise, it’s harder to review.
> > 
> > I can add a patch before to fix those + the printing as you suggested
> > next.
> 
> Yeah, I brought it up because with the above you don't need
> arm_lpae_io_pgtable
> 
> > I don’t have a strong opinion about this, but I am more inclined to
> > keep the prints considering it’s a low-level test for the page table,
> > and such parameters would be useful to understand the failures.
> 
> My general view has been that there is alot of debug prints I've added
> to kunits to debug them but once they are debugged I tend to drop them
> off as they may not be useful to debug the next issue.
> 
> > I know this is not relevant to this series, but the KVM driver will
> > need to expose arm_lpae_io_pgtable anyway.
> 
> Really? That sounds like wrong layering, why does it need to break the
> iopgtable abstraction? :(

Oh, not any more actually, in my lastest version it's just exported
for the selftest, sorry for the confusion.

I will respin v3 with with this patch leaving the arm_lpae_dump_ops
behind, it's a bit ugly with the guards + the exports, if Robin and
Will are OK with removing it we can just drop it.

Thanks,
Mostafa

> 
> Jason

