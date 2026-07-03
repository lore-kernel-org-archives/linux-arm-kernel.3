Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F72C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 19:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NXmfnDT9ccdJDht6GSlGH0hP5z1VNfXLI97+RVOH2w=; b=hcOyElRN7t+S337Pvr8eMBbqlR
	hsPR4ZmaZwzTepvJBPpzwCMDP0s63zmHCIaCyIrpNsVPjzXgDky6ijc3eTMCVKhKiwGIJdzmQ9wqu
	VZcaaEGH4ZK4Af4uyIR65rMiIfhH1xwBBzrCAuLJ1d/C9zTpA1QGHrhZbbD6VyWwM7uNQIHBIqHjE
	bwpaAufWGbKJFfYs4rzzFiG3/WWKdzaCH9RguK4ScAjLU0TRzmbh2FwGBciVDEgthsi9SEXPSfA0E
	Gi3DjqrTUWL37OBRxNzFzz0WRsakZl2CyLdjBL4Q9qJNY9DTv6zFbXa7T9GhcsqcYf4K+ZAokRiLh
	l6jRMiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjVZ-00000007mTv-1EEm;
	Fri, 03 Jul 2026 19:25:05 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfjVW-00000007mTW-2InA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 19:25:03 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-9204711e831so70875985a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 12:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783106701; x=1783711501; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3NXmfnDT9ccdJDht6GSlGH0hP5z1VNfXLI97+RVOH2w=;
        b=ejOtA4WE7OPzu6G63RKe/0HPs4iJ2kEPzFYLd7ZWyZOlRVAnXGUOaqFUb2aNj3lS2R
         COlI2yQvdzD/U7VOFRAKuN1ibNXhHNQiajXY539RF1RXJnbxNmCuQE1rmhk75rapFyCQ
         9gNWFApUCkUDv2i5M4zG9c0wUBEKwcAE8xfToQqhczxhlQGhB5qpEgHQkmhNwf9XfSsD
         xrWC7nc6OTcJPGgZEBxWuE+NfKivclDbK6UGvTf8soYryPC1CMyJm+GUKWAwASilaXy3
         yUXuOhhxsUFZqFpfo/6vzIGsggp7EpMbrlgCos6EEGdnGeOcKc/lr0U2jWW5g5XhzmmC
         /9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783106701; x=1783711501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NXmfnDT9ccdJDht6GSlGH0hP5z1VNfXLI97+RVOH2w=;
        b=gxDiueV+k2xj0NGvWOgjiZ3RsVNVVTu57WVRrpGoAcevzXqIciTi8DG4nEp/zbQXaY
         JXeSD2psA9r53HiS+yHuqNmG1kHDS8oGAgvs7KTQ3Sq3rcI3rODbbqxXQjsXWvl6TtMO
         3QCb46eD2Gf3HSY8DXRc5OgVU9PZXqfoAeE8Crq6Zcu0CEs60PRlZvHgMRGbydThfDys
         L5os245rVj3W9gCPLtSyeycDjPSlAWJJ+oOOOdr292S8tnvjYNI952s3LmzpN7y+NAw+
         bazV0VzPAUJhVC9DJAcANaRCbMm30fN4bCXoUy2e2YhLT9bu24A7QD5T9yPtM8kH5oba
         i9aA==
X-Forwarded-Encrypted: i=1; AFNElJ/9J+hfOFunGVJx2yst9IzVhKVccY0+RrJdy5S6lGwkq9OlnPuOnXlVm2nbOAflT1oFq//vxEjp0E8qkE5AH6IE@lists.infradead.org
X-Gm-Message-State: AOJu0YxotDwq7H2LdmYWEE4V/pqK+eFhUnTCOHJs60a2RlZ5maMOG2HR
	U16ICYGItmfqq+qwcm730/xMTIdcLNAKqEJm7hMFGRe9RMPg0m8CRoEXdAiZmBsL4m2Iogs6uUb
	WBtA5
X-Gm-Gg: AfdE7clJAcrJ7kYNbcx0sIeFoOjpuDS3F1+7sFdh02SLKyUYMWPWxtI39MZgCTdcbXu
	lzvOIZIlt6CtWqj1ICtARojfr61aVmwCW0iedy8PBpbVHC3RAkvqg0SHUi9qSX0D1SWNNBHhFfX
	5ehGTh2t9tLSH6pkOWZJrFVcA2/2qqrjWOiTnkJuul3kAxRW/8BClNqoFjyrZDx8rD9Z7Qe5DEY
	qriBHNEhZeSd79VxJEg9bHepeh/ZSyDXj4021WDgERsibh9/mkSQ8nzZxW/nrfdVhPASTiwnKWr
	9qAWwhygjCo+Pehmy/YFPkryasR+4h9cOVlHPC6snsqjexYQl6FtTuRk3Lvyff8vnDTx1Gt6Fwn
	pKYEjFDuD4CyCIdvSgSUDQXVpwTlY2I5IWkxgAwADzX2W8YyP0PQV4IeIk6P6lG523teAgV1kcn
	Tg7MevlgBzHCoXK6qYPFCGM8ya0wfH+GTqlH+j0kRrrhz4c17dSiKMeV7tXgMip+COsFY=
X-Received: by 2002:a05:620a:414e:b0:92e:57ec:a4d7 with SMTP id af79cd13be357-92e9a4ed968mr109865685a.73.1783106700898;
        Fri, 03 Jul 2026 12:25:00 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ccdf8dsm225956185a.37.2026.07.03.12.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:25:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wfjVT-00000008UHZ-0qcN;
	Fri, 03 Jul 2026 16:24:59 -0300
Date: Fri, 3 Jul 2026 16:24:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, joro@8bytes.org, jpb@kernel.org,
	catalin.marinas@arm.com, yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add HAFT support for SVA
Message-ID: <20260703192459.GB1978949@ziepe.ca>
References: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
 <20260703164914.GY7525@ziepe.ca>
 <6465c885-3a9d-4c0b-ab74-7665e274ae72@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6465c885-3a9d-4c0b-ab74-7665e274ae72@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_122502_618918_EE10D50B 
X-CRM114-Status: GOOD (  27.53  )
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

On Fri, Jul 03, 2026 at 07:57:04PM +0100, Robin Murphy wrote:
> On 03/07/2026 5:49 pm, Jason Gunthorpe wrote:
> > On Wed, Jul 01, 2026 at 06:45:17PM +0100, Robin Murphy wrote:
> > 
> > > @@ -211,6 +213,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
> > >   	if (system_supports_bbml2_noabort())
> > >   		feat_mask |= ARM_SMMU_FEAT_BBML2;
> > > +	if (system_supports_haft())
> > > +		feat_mask |= ARM_SMMU_FEAT_HAFT;
> > 
> > I fear this is going to make SVA stop working on systems it currently
> > does work on, so it might be a major regression.
> > 
> > SMMU HTTU is not a commonly implemented feature.. I think of all the
> > NVIDIA ARM chips only one supports it. Given that a quick internal
> > check is raising concerns this will be breaking for us. We need to
> > check in more detail which cores have HAFT.
> > 
> > Breaking already deployed SVA would be a major functional regression.
> > 
> > I think this should start by just enabling SMMU HAFT when CPU HAFT is
> > on, when possible. Maybe print a warning on the mismatch instead of
> > failing.
> > 
> > Since we can't break already deployed SVA a full solution would either
> > have to somehow turn off CPU HAFT or we ignore the gap in the AF
> > updates..
> 
> TBH I do not know how bad the implications of
> pmd_young()/pmdp_test_and_clear_young() returning a false-negative are, but
> if we aren't considering mismatched CPUs harmless then surely the same must
> apply for SVA. In the POE/GCS cases all that can really be broken is users'
> expectations, if they've opted in to additional security features, but also
> opted in to SVA wherein those features can't protect against DMA. Here,
> though, it's the kernel mm layer itself that's impacted, and I'm not
> confident to say that that isn't more serious.

This has come up a few times now where the SMMU and CPU
incompatibilities in ARM's IP are causing real headaches.

Let's give it some time and I can say for certain if we have impacted
chips or not. I was able to confirm the server chips are OK, but there
is still some concern about the embedded chips..

I also don't know how harmless it is to ignore the aging. I thought
the PTE was designed to be backwards compatible, but I never looked at
how AF works..

> Making HAFT depend on !SVA could only easily be done at the config
> level, which seems arguably even more over-reaching

Yeah, but if you could build a custom embedded kernel with HAFT
disabled in kconfig maybe that is enough for some people.

Jason

