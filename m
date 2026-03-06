Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DB6FCC065
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wh5Z913UZEh7i6f061EXZd6SLJhL4kwsCncFeqW4SCA=; b=oTMYpTJXpIvasIRujLNF8fTAJW
	XNg2L4WXq/+PiKgxoqr9LPrLky8FkkAtFZ2nNsI4ng4hwU6d+mYnL7/k8qcaTBXgBjI+UGft0qBQV
	AYDQ76Uy+FmpUgfarZqjhbC7MzaBb74cpG74XSzJHf89vjClm8BKMH1YEjBTC3F2v8x8Va+ZqCyUT
	gHLjrcuOtPx9zWG7f5pc5DUmDYnpd8ApVCNT1w90KVLcKs8Y594vlfzdHF3pN9WMn09NsqLBEzOwH
	dkAI9tnD6oAH3uR/anXiRnREQ25KVNA1yXbz1YRXZTTdwvT/lKKgrY0FIgYZHZzUVtT/4FWk8G9Ah
	QkO93Ofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaxN-00000004PIe-3sUp;
	Fri, 06 Mar 2026 19:35:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaxL-00000004PIH-11u0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:35:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ae3f822163so10275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772825725; x=1773430525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh5Z913UZEh7i6f061EXZd6SLJhL4kwsCncFeqW4SCA=;
        b=Tf19WXaKL/VIO2mihsGBnSgG+ukd4tVHyMb9mNhOcj55gSu2215AMQio085Y4bSYkN
         V117CQ5O1lXWcyaigEXV56SL+s/9zXnkBNdmhCnAizB5m6UDVDTPgcnDdwV28gHqBzgX
         rB5jxLVyGNYjT+ywpux5nhWRVzlqQrLKeZxpmKfRfsy0rzHPt32D4aNiIg9MvXFWhNJY
         TAKPWskbKsElmr2CMbMbkcnEt4PDZQBTvIMQisJ1vTGHwK3RXVkbMyM5sVsSLtXVSnjI
         i8d7DiRhg4tN5OGvx1LY1XcL0DSf/OWFrtkAT6q47dRPwBZ3YFcOPOzqxXlA5zjW+Lsy
         DWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772825725; x=1773430525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wh5Z913UZEh7i6f061EXZd6SLJhL4kwsCncFeqW4SCA=;
        b=GowiN7lh2MJCSRLXCN5Sf8DalTrxfxYaDCQHa5av939+PCFLLcZjyGWK7z9LrzqjSD
         W3J7oX+R39TJKK80TMPabxoWfPrBY6/ZV1Gmx75NBLVEC7NVBCT01ZVPL6W2EUkD24w/
         srItMg/arybuoaz3JSbu/cbHRnteH3W+sqcPApBSQpp4nRbwG0cq9709u3QhbK8ZjgJc
         j4H3gtuo5CrNKYBOgrbS48RZTRYtFqdBKRF40ZDscK+F1ghy5pW0ruvKa8aEAkxgHzzO
         ar4GYaWHG5R/p5DQttULmxzoaP3VU6l+IRiwLmIe1Ydrvq+Yy2xRLDXiiptY9zrdjfhx
         k65Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpXpOgfKN8f0nr7vFSk9x2Wn2pfT+2U8V9Xbbf95UM/p6zThUDJ4+Sjw6j0g5c4+N//G+C5u41p8nrF6Sw8N9r@lists.infradead.org
X-Gm-Message-State: AOJu0YwdPJ9haDzqmheqo4HFGTKGtRNpdFM8s4lkCs/I36oUaJttF7JN
	K/NqK5e5ax6NpTzmatp4HuNnHI0s6bclZk/93ZE1BPpPDHngCtGOwnr2uPumDobjBR83sULC/Om
	OPky7S0BH
X-Gm-Gg: ATEYQzwymXcExwnF6zaX6Wjj+HeQYeTXcv6bVWs3cW2dV3jaR1j5NFIXRHZZc/Lc5CL
	dECKlWdffLlucpHpYZbnBYuE4GIsys6nLAE5IjFMlzpROezmx0qcte7Egw/O3FeLz0exQ86DJvd
	ekF/jJughoGis1fbldisYdQljKB8+m7tOIpSVgi6bOzzJ8MSM39BUrHuWUQC0vkoftZkAm/KOS9
	KZRP4OyjAeXm8GAZb4dPEKqg/wWQVocFQ45Yl+/vjUMKm6KGOVipb6SvUOQisYsZS2IwE5EE3A2
	heC/Dq77LlWEzjki4x/q8Wjq81HMv7x3lCW+td+Fjp6ldufuOCy4lij3nM0l3hg+Oo51ecebhA8
	Ne9inPMw6b1pLOURFCGjp61P7QVuMeKa9cat0BEODv5K59ix7sXh66FVL9M/XcKiXup8CaHHiuC
	7lWBJq5MkNPqH8aj/rh9xkZGE2X/xWp1D8MoUMolFfypTTGayYCcYF6mZZR9eY+g==
X-Received: by 2002:a17:902:f545:b0:2a7:d266:d84a with SMTP id d9443c01a7336-2ae8ae4e111mr191585ad.17.1772825724928;
        Fri, 06 Mar 2026 11:35:24 -0800 (PST)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83fb3cc3sm27116245ad.73.2026.03.06.11.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:35:24 -0800 (PST)
Date: Fri, 6 Mar 2026 19:35:19 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	bhelgaas@google.com, rafael@kernel.org, lenb@kernel.org, praan@google.com, 
	kees@kernel.org, smostafa@google.com, Alexander.Grest@microsoft.com, 
	kevin.tian@intel.com, miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <aasmWvA-sqi0KJwO@google.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <6416b7fe-0190-4c7b-9a62-5da7d5eea794@linux.intel.com>
 <20260306130006.GF1651202@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260306130006.GF1651202@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_113527_289557_E98D4058 
X-CRM114-Status: GOOD (  14.41  )
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

On Fri, Mar 06, 2026 at 09:00:06AM -0400, Jason Gunthorpe wrote:
>On Fri, Mar 06, 2026 at 11:22:52AM +0800, Baolu Lu wrote:
>> I believe this issue is not unique to the arm-smmu-v3 driver. Device ATC
>> invalidation timeout is a generic challenge across all IOMMU
>> architectures that support PCI ATS. Would it be feasible to implement a
>> common 'fencing and recovery' mechanism in the IOMMU core so that all
>> IOMMU drivers could benefit?
>
>I think yes, for parts, but the driver itself has to do something deep
>inside it's invalidation to allow the flush to complete without
>exposing the system to memory corruption - meaning it has to block
>translated requests before completing the flush

Yes and currently the underlying drivers have software timeouts
(AMD=100millisecond, arm-smmu-v3=1second) defined which could timeout
before the actual ATC invalidation timeout occurs. Do you think maybe
the timeout needs to be propagated to the caller (flush callback) so the
memory/IOVA is not allocated to something else? Or blocking translated
requests for such devices should be enough?
>
>I don't see how that can be made too generalized since we are running
>this flush stuff in irq and reclaim contexts, it has to be very small
>and targtted without memory allocation or sleeping locks.
>

>Jason
>

