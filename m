Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647A0C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 01:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+oXMdrF2sleLVDXDyRpoFuZgDFkHIlL9VN1wy6t690=; b=j0KLKqpNSdNisUx0DDm4mGdR/y
	Ocx0jI5HNpBALVRKhYM135IaeVFhMZXjMW4p5hdLeDtgSyTGOG0/n4ilW8oQJaDglg1iXIRKGr4pP
	7LB2Uz+C67W9lHDY45jEP91PF1LXbk81boIYQbnLor+XrEJ1PNa9jFJ7E8/D/LlxnIB/UnxrONB2i
	J43Ltq4zL70yP6PhufQ/lS6nTLSR7LlnCNT9Qb7jQpsBpe9JaA+RMEkrjd4C+a5Sa2KfWeQ9Ksbjv
	0/Db89SpiUG6eykb3inhnZLs/fc2CFSMY9tCB3RBu2htk2j0Wrk8HKowVzLFFIIEsU0IUC97ijv7d
	9tOJ7R/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1a8e-0000000DeBX-2ekS;
	Wed, 02 Sep 2026 01:51:44 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1a8a-0000000DeBB-426O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 01:51:42 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-90e8535619bso5656666d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 18:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788313900; x=1788918700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E+oXMdrF2sleLVDXDyRpoFuZgDFkHIlL9VN1wy6t690=;
        b=YkbVr5HXO12xpSLuj8S/sRu9f8ofjhFZ4mljK9yTHgMQVO2ymtsqt88U1YPnUp18sh
         udvze4q9KpUshekMhd/EiFtqBr8CtaZdw2ku2KMoffZijTK5S8iwsuo1TIgMMa7nrdZX
         abro1d+H/C5paKlD0YhGtIjWC8kH6kp5wb+O4im0JnRn36ddKryCoE2VAEiHCqIkyxWv
         5ZgoMYXAq4dud1c3xiLrZEzsM8QtHMU3LWZS9dGD/O+MQ6oX0oh3xroJ6gDKeuiHlcDX
         SHfGSKUzJoCCSppSK6VzF5KXihAVBSIV59jFYdPtO0w2R0MyYjxT1HXVP+qoJDEyoAc5
         olfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313900; x=1788918700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+oXMdrF2sleLVDXDyRpoFuZgDFkHIlL9VN1wy6t690=;
        b=W+ajFfpAGU4KJrMspmbB4JhDASIVvBpU3kh0bnCOmqHfLbV1J0vnh8abLvrD9EenTP
         0hnA1Auz5Jufyqjvyg5pg4q559sCNbfexIpSHE3kaVjz83qf9o7UWcFaLRJW/YAByjiY
         YU9D4wrc+Oqlb7HXuTCsMFnVHV8L7SRsflUsZr/wcOHwgMqcm9oY5JBnhODoCXCmw1YQ
         Da95dm+pG6T+Anz7a2F5ofzfWneGikovrBp3+sJzP8ns0RnBAryZLwuzVU63TF4bL3iP
         HKK5gVOTlRhqfNP2bPaCbrc3ilRzh4lB3+D5/V7xB12Gu+qnOFsviegmRa7SXB/VTMO0
         5fWg==
X-Forwarded-Encrypted: i=1; AKwUvBxUF9U486VmnC8j6Xjw3YT1+Gdh7ix7tC7IoN8QjTSffw68Sve/NRxIQeAZ4HuDn+5E9cOqty0uLfF1RaT2Dzme@lists.infradead.org
X-Gm-Message-State: AFuF++ma/SUe7pZG+zrueQSmyRSn8aKZvuZxWxBfsEgnc6nY2emi0wKq
	vtw079Q3Cd+/XGXsYYBFn9isiUVIigUcBhxRUHiYMnRlwBcqQ6aYsBkAVK6cE7aR4GI=
X-Gm-Gg: AR+sD13/hlEL71DY30/eDrTDYSpAgOArq48ek0YA7qv+Q7Orygoi5/NESQns22UIq2c
	CVh45oop6uXrXhGOWubFulHkH/DJGNL7x1dQBbEYZSzsMfpO27xrpRAMAfTKCQ6WyIFinTtrYoR
	NX5Hrftm0avSc/5xFfCyPacu+qs1+QMQ+c5blkLREMWO2XoYMoDVIj4PicH6YcK3FD64h8XOSsB
	dEmYueqySoIR999mfee8TNR0OGUc0bLCw3QmwbRNon99aM0NRt4eIZzHHDnNlVRMI36azMZUcEQ
	fffPxUHDAcXNm8+rwWf28wGcVnRjSblCjlgLo2GmNrCeBXdwBM1gn0LCoJZxYzWkPjydnEUk7aO
	hFYDy6WCcGV53xoCxMA1KC+AGtMeNPd2nSiDsc3PvwvqWX2/+ut8Wr+Gj+hu87mEkhbBH7YYpM2
	yLAq6P2dnKYdQToRKHhojkcGkCml0XcGzYNzKbeBZB4LVyyrkn+s2gMGsp8aBWiRhSSfl0YULE1
	rVUiaO2jz5fPqUwFa6hDBf+65bKBysQJfU7eZ7qyOOYCA==
X-Received: by 2002:a05:6214:2584:b0:90c:c53c:a032 with SMTP id 6a1803df08f44-90ebabce888mr24156306d6.25.1788313899587;
        Tue, 01 Sep 2026 18:51:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef4f20sm7284946d6.41.2026.09.01.18.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:51:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1a8X-0000000Czw5-2tb4;
	Tue, 01 Sep 2026 22:51:37 -0300
Date: Tue, 1 Sep 2026 22:51:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260902015137.GA2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <apcHoHKGoI7WNFXp@nvidia.com>
 <20260901174230.GA2847102@ziepe.ca>
 <apcitkpASOREamQs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apcitkpASOREamQs@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_185141_173121_C631E7F5 
X-CRM114-Status: GOOD (  13.94  )
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

On Tue, Sep 01, 2026 at 12:08:38PM -0700, Nicolin Chen wrote:

> The viommu object here is an empty vehicle that almost has no use
> but to allow another vehicle (vdevice) on top to forward vBDF. It
> makes VMM code a bit awkward: there is no iommu instance, so VMM
> doesn't enable iommu driver, then there is no good place to alloc
> the viomu object for VIOMMU_TYPE_ARM_REALM_SMMUV3.

It would have to allocate singletons viommu for each psmmu as part of
setting up the vdevices.

Somehow I'd rather the vmm deal with that then invent a whole new set
of uapis and flows..

At best maybe we can invent a kernel side helper to create the
singletons like the auto domains, but IDK if it is really so hard for
the VMM (especially compared with how hard everything else is in CC)

Jason

