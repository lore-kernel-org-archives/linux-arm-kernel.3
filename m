Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9438EC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M89M9SRzWTrfxkPQChi6cYghdfRxV0Kb26Fn5pPvW98=; b=wKpuA0R21cYZKwnEM/BjbaqZxk
	JrR108/E7pqhjlLzPMOtcnMvmCU6JYq2zs9E8sEj/0BSK2IgrezVxGChil3Sco2va6vxCbSTdyFZi
	yaQC4yGc1q2enmW8u0FfdjdrecpI8MtGWjgBq9dT0ni9oLOTuqWUHDFFt3uO3qgBk7Pptt9rnrNqu
	MCGEGuGANfI++er5ioECwDnV7aQaTwcqJIk905qyKdCz/frfSmrNNvuttuT4b+HHOvZ5Dz3wp1kPk
	IGuvFnZRAK/Qg5t4A9IwzSUjp7Rqvzys69hBh9jxeY3jvW22ENgrkgrWZ0bTU80mxASisPjj9yr7i
	/nzLwBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSBj-00000009JRz-3O37;
	Tue, 18 Feb 2025 18:19:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkS9x-00000009Ird-1Hal
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:17:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-220e0575f5bso490445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 10:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739902647; x=1740507447; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M89M9SRzWTrfxkPQChi6cYghdfRxV0Kb26Fn5pPvW98=;
        b=kbHl7Q1Ke/uEOefWCN4r3mtw2IYMk/OpvvsDTK7boFwuez5iMITj9Xr/DrPZbAg6jK
         rLKd0PzUmaToDSZpEgzeh+7Pcw9arYLjeXbkvWmU/v1ETANtzEhBhXXfLxRQtsedjmyv
         aHX+PtEhP2sF2RP2sxlHD4YbtY7bNosQXPraQ5PtGLYetHOzwvowkgdA8lnyQV+hrryY
         B+ejPXkUm91Aod7rtvZvBpVNVu4clwEmYMeSkhVkQLmuWm4KOUIwe7x5CAbKe+kXbiEB
         Dx2E3Kd/ihYML316R0Db9JVveYPl3H5gquCCJKEUEk7yiAlEg17mGC8kMrQepjYJP03i
         99UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739902647; x=1740507447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M89M9SRzWTrfxkPQChi6cYghdfRxV0Kb26Fn5pPvW98=;
        b=K5YawO3jrfL4/NawdUu2PWFn9gb7CQ6Zckxiad3vda0zrpz/OR+LUfle2DQNc7WrJE
         GZp6uz9/DE1eQii7Uki2n2JWpIKqELus6C0C+sovsa/fDqumUJuh/FaNk4gUeJZ8gPcV
         wCNH3CszT1CalNT/Q9n2vD9XVVceyaOZxM9bEIhPJ6WPNu7KZ1EA+taRid2TZi1b5v9F
         I4yCcWfUP1Ki8DF5WXm3evl4M/yy+z8MY4buZKV1tdTvxRIx7rmRPKKSqe7qPrGI0Wlf
         qJwBicb4DotjKg1TqPZtZw02fw0/4Nb3rwMqI49eQIgQGMcLc3upCerkNm9Kkx+2Kgz5
         SnjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcUVbiC/9C4Hl2qtpChW4ebNf+dCEj020WJvfn4tkNY/r1VkpqLTdhNzX4uXVAMQEiKWsHZvKxV1aZp92yXriO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DEF7ORa6HUTPxnFean43ymYVBDjCL2OqtDEe4go6YHfFpQyT
	yOsZI7pmLNUteTZUZaBXYU/waJyH03GJccBrycMbokmOJx+gOuf4n7DEf3w8NA==
X-Gm-Gg: ASbGncuHAMF89Cio53Ks9n4S7QTUF7spSruwUJjamNKn6JYHlhRdNBDxFXMO6/c6obG
	3u2zb3V0UYTLWdqYV6ZKXE4pMZWc2mK3UZ96PBKdbEkLXT+zXeU4ctbI3h4LtkZSUa392P/cMdS
	AInGPU6y+XzwmclQtNvYefNHxtLdCzDIL7bGJ4rhDHvqB8V6poHqEBaCe9N27+6qAtvZn0u3Tch
	RIpi3KMg0GAiSgcIfc9Xiz95qrsAitFoNkPPV7oGPIK5MDx4TrPg/OMUAa00AfkblH//K1c0nEh
	faYqOehH4ipZuGP6tGokvGXEMneGmGvL4vORBw5euXtgL5vncsLm
X-Google-Smtp-Source: AGHT+IFkiHL5TTpaBclB/MgmM3kcQbDHYVWCGmPRDpeRclWjC4Poa8aWW8CJbN/ySGXple0OccOeRQ==
X-Received: by 2002:a17:902:fc4e:b0:216:48d4:b3a8 with SMTP id d9443c01a7336-22104c939afmr7012905ad.16.1739902646969;
        Tue, 18 Feb 2025 10:17:26 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55960ecsm91516115ad.253.2025.02.18.10.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 10:17:26 -0800 (PST)
Date: Tue, 18 Feb 2025 18:17:15 +0000
From: Pranjal Shrivastava <praan@google.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"Liu, Yi L" <yi.l.liu@intel.com>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH v6 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE
 for DoS mitigations
Message-ID: <Z7TOq-gIGPY_ztW7@google.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <436ac2021bb3d75114ca0e45f25a6a8257489d3b.1737754129.git.nicolinc@nvidia.com>
 <BN9PR11MB5276291C74E2DF0C8821BE718CFA2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276291C74E2DF0C8821BE718CFA2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_101729_347219_2D78E935 
X-CRM114-Status: GOOD (  20.01  )
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

On Tue, Feb 18, 2025 at 05:24:08AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Saturday, January 25, 2025 8:31 AM
> > 
> > There is a DoS concern on the shared hardware event queue among devices
> > passed through to VMs, that too many translation failures that belong to
> > VMs could overflow the shared hardware event queue if those VMs or their
> > VMMs don't handle/recover the devices properly.
> 
> This statement is not specific to the nested configuration.
> 
> > 
> > The MEV bit in the STE allows to configure the SMMU HW to merge similar
> > event records, though there is no guarantee. Set it in a nested STE for
> > DoS mitigations.
> 
> Is MEV available only in nested mode? Otherwise it perhaps makes
> sense to turn it on in all configurations in IOMMUFD paths...

MEV is available at all times (if an implemented by the HW) and doesn't
depend on the nested mode. As per the Arm SMMUv3 spec (section 3.5.5):

Events can be merged where all of the following conditions are upheld:
 - The event types and all fields are identical, except fields explicitly
indicated in section 7.3 Event records.

 - If present, the Stall field is 0. Stall fault records are not merged.

I'm not sure to what extent, but I think *trying* to merge similar event
should reduce some chances of overflowing the hw eventq.

> Is MEV available only in nested mode? Otherwise it perhaps makes
> sense to turn it on in all configurations in IOMMUFD paths...

I think the arm-smmu-v3's iommufd implementation only supports nested
which could be the reason.

Thanks,
Praan

