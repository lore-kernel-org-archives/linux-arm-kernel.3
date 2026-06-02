Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF745C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 03:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/D3ZWx6zAJFAsJdaNfsvsIVkbBQo8N/NxdK+lpcSrQ=; b=DS7mn8JmM4XplhN31Gi8m5w74g
	ln0e3mebaUTo8YpCYHE4WRNirbL3GwN005tr3SN8bYxRb1ToRXpD7fWfEsSQ8/OZwb5PGhJ4Fwu3I
	pBOsIKVpJVZWlKaXPynz485ZtVrCDWN1tb6fVqFNvTxQkbzsvdnXN9bFxVztSReBdULVRJMrVnQOP
	xTDiIfo9Sfd7D1PDyADMW3UrmygbcCU4C/eTDHneSaC02X2raGwTYIabKC0RNdTa48NImD8CEXsVz
	oIO4Son9XQ/U6RWyluQ7NtOBicyizL8Y8sXRWJTLrClAArJDyl4SIM6HhoKbAIi5YXsm/4sAvkVTA
	uBUbH3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFww-0000000CEed-1s0J;
	Tue, 02 Jun 2026 03:37:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFwt-0000000CEeC-3YqR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 03:37:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf2911f93cso655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 20:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780371471; x=1780976271; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/D3ZWx6zAJFAsJdaNfsvsIVkbBQo8N/NxdK+lpcSrQ=;
        b=uIks3WjNQMx5Kx/iQJKU7OD4pxhdHG0zvNDFgBTx7R6A2Y1V/b7WLNYLaTGnCrF3jd
         Ia3+2rqmysjTC/2Ow9MGdynRSNrKGvV5CRhSui4hLe4DnpsGL2tggN6/zHLl6lMPm4/d
         ugnP4ADxcDck9M9T9XrezPdauPkoHOqeco7y3YTsfJNYoCQSVsq5/4LoM7+DxgvN4nkA
         /kNorIbE4cKWXeHPERKyt1cqR02Oh/1BxKwUnjqOHYlpaBrjigBXRnoYCtKUrrkiYyh1
         6GZEn3YomEj8NwD/dXpLRifhLJvd2y9Z/N0pw4MwdQ3IrtNRjQ7BPm4yaq+j8xK/Zmi7
         j2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780371471; x=1780976271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/D3ZWx6zAJFAsJdaNfsvsIVkbBQo8N/NxdK+lpcSrQ=;
        b=kzPI0Jg2lIinnESOU23lN8sfGkok4A0RN/ZRMydsNZiRQo3uaJ7VWb7msSbdYSIy8u
         6s0scS9JEV4D5c98lIrjLvhWT+fq00xPZfoz8gAi913oIRD/JrnVYdXrqEIezVJBLfn4
         1jtfrE7nlOx86E0u6NmSkilFA/keYqAKH4Af2bLvanNBMZoO/F5BtkdGodOqtvr9JCJi
         9i0w9YjRShMmx+yuZowg3JYKI+esIZKWchkIMfHEJ5idgIcFt67/sHUGCkzPLw8J2I7B
         EaEQybjGJdKVBRHsxhxpOa8gztK+SyRPlgeHJMMMU4pO+FhYpW5LaUouBFarXNQ2Ng1Y
         OuHg==
X-Forwarded-Encrypted: i=1; AFNElJ8vM+JO7BBCTt1DUwLk3/bWDpf+fm/SuQEY+aL6bYI/XgtFCWG0tw7vPsjwN2Iyc/exI2F0X2UgRsReg/pbltM/@lists.infradead.org
X-Gm-Message-State: AOJu0YxlC3U6T568w2y7F6erwJasrONyXbyzw3wAByDJiIEtrBa6JANn
	2ODcXfENDzotNSc7zhBAi5JWJoGMxtZJb9MeT6CsmyiCUU8doLJMhH8dzWYNmsFRAQ==
X-Gm-Gg: Acq92OGcw66nB0zwasi6bakx21qb3joauLJtVzly2j5/02mEoOCjz8JfSjFwz1CCm9a
	3H19InF9RB5z+sStNllOtgWrHdAR1fQuDkMwh89emc/CmbL6gh5kTY8Uvn6BQipLqnlhaujosG9
	Fx1okRVkHPam/mcOsqLsb2Ih4kUjjE/GwkBuvBzzjpGszPzgIBLi4dXr3OSlcBM/imy/oXbzDZ/
	0GvxBMmhibeshJ6hdzHRs7izdSHncohTECroYZ5bNc2QJLXBLqeP+CTYtDxcwftbhSCdZNfFH23
	H6ip0SrTgmJTxDDKnOI0vIZ6xhDTFE+RSV7O/dskpgaBeq1M0FUYGfeqCyUhr4wz95EIXAFim9b
	y2CmVj4ImuHfsp7tz74r0deYm9B68VjPlwi6EBbSaJW4WLLIy1iQLtcbCaLYNQqzWdh/GSSKZJJ
	ZybEn2a5i6hMsOAsD3uM7jcp9Eka8NDA4KxFvl1GNbBFgUPFbPGVMq+hEm/RX973AwXmSvIt8=
X-Received: by 2002:a17:903:249:b0:2b0:aee4:afe7 with SMTP id d9443c01a7336-2c10e85e5dbmr1892275ad.10.1780371470317;
        Mon, 01 Jun 2026 20:37:50 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842222e2394sm9752165b3a.2.2026.06.01.20.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:37:49 -0700 (PDT)
Date: Tue, 2 Jun 2026 03:37:43 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 08/12] iommu/tegra241-cmdqv: Add a helper to quiesce
 VCMDQs
Message-ID: <ah5QB0Hfpi9wZMLY@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-9-praan@google.com>
 <ah4gYCgSO1bBOUTj@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah4gYCgSO1bBOUTj@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_203751_891647_0EB1CB1A 
X-CRM114-Status: GOOD (  13.68  )
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

On Mon, Jun 01, 2026 at 05:14:24PM -0700, Nicolin Chen wrote:
> On Mon, Jun 01, 2026 at 09:59:05PM +0000, Pranjal Shrivastava wrote:
> > @@ -887,7 +887,7 @@ struct arm_smmu_impl_ops {
> >  	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
> >  	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
> >  			  const struct iommu_user_data *user_data);
> > -	int (*drain_queues)(struct arm_smmu_device *smmu);
> > +	int (*quiesce_and_drain_queues)(struct arm_smmu_device *smmu);
> 
> Hmm? What's the point in PATCH-3 adding drain_queues then?

Well, you suggested in the previous version that STOP_FLAG needs to be
set for the secondary CMDQs too

All we're doing here is renaming this function as it also sets the
STOP_FLAG on impl-specific CMDQs now. We can still call it drain_queues
if you prefer not renaming this.

On the other hand, we can add a dedicated queisce_queues() op too that's
called before draining queues. I found that to be unnecessary as I'd rather
have one impl-specific op handle everything for impl-specific queues.

Thanks,
Praan

