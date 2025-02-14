Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067CBC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buGqXK8/ktUg8RW6l4BfFP62BuolnXWk213EnIe2HCM=; b=IzOg0k3PO4/aQh2cPRoJACZali
	/ejiey/0va8F9C+UFP73HpUiaiD331CA7GmpVCxrbrL0yr9dVR+o8wyd3topzi+e9d5nfnC/PL0a9
	3jX1Oe8Bo/tNEgevzka0iRCkfdIo0HbTOwch8mzJI4Rr9XZR4xOZZpQxk5SvKLDpq2ZXwLlmS3b9E
	5FTh6ikTdHKZbrbcu6i5xJSuL2AzmeeF+4vHzdCQvxWPH6IlJv2zATjVkx2JIT6zrrKB18m1mWYLe
	2dwBLTmDCX7gCPNIYmdKYvUy744XezFeWVMkJMfOReJEULX5i6VeEU2AeAKRd+EIp+WtAaP5uKVRz
	aYufntyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1d8-0000000G4dr-1zBV;
	Fri, 14 Feb 2025 19:45:42 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1bG-0000000G4HS-2Pda
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 19:43:47 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6e66a7e2754so5307296d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 11:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1739562225; x=1740167025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=buGqXK8/ktUg8RW6l4BfFP62BuolnXWk213EnIe2HCM=;
        b=dpb+Dym/vYqpvkEKMxVoy1WhUj6idQsm90X9/MENC2xh3w2i/iGlKprxJCcNsMATBj
         9Nqul8BrYpOs7v5GwyGKOocBicYqvOLInDfZ7pgjHfcmFkC4sh4DDjmkgRmBCdjr4oA4
         MVOC0igBE/+eJ8zjhF27ZgVCXXLPn2VP3Q1O6tcRlEtMYMEbwCkXLZbACXBXWs3nkObE
         xJ6xzvFdqV9S9NlUM85DBxB9oSDaO6dCBgP+k2MywIhTBn4bokbB34ePbt6SGkmiGwHZ
         8HOJUHLWZiC8sJTEWwXCWEhRWqYYWXyA3OxDmsq7tWSpDzCfYdAjLES6EFZ22MsPGx1H
         gYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739562225; x=1740167025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buGqXK8/ktUg8RW6l4BfFP62BuolnXWk213EnIe2HCM=;
        b=FM2cwUVgXzZ2cbLZNBu0J0diUNI+xhYmO/aoZvhK8vonS2HytUZ8QVMqm6PTiKzi30
         BLFEK04kd4soyaWX8ZKk9TJ3i3KvZWbK2OfkIXZI2V6FClb/ScHeXFuVHS/Q+t2jsS6I
         /PErBfSHM8DhVwJPU3PqmncNpSkbL+iTp5dKupHByqQtK2I1JsRUIZdcAiHxag6Ilfj4
         ExTAbjnbKCC6qoCu7A+yhNWzU2bX11ibv2jJlAlU0nd9O4URyoQ52YMEgCGmhX3wK2Xx
         fVSEm3FF6Mn6rE6jLFh+Y/VZMNhmG/35cewK+WLff0fDQrXQ1hoqVIRO3SzsvnaxWaZG
         cEOA==
X-Forwarded-Encrypted: i=1; AJvYcCU0aeOeglZDTT/0rOVpSxmPlu7093yWrVOlT69rnARo9sB2wcSkj+lTdPpMDX5WMrZ5mWbZM2voPzuV1n5Y9+7a@lists.infradead.org
X-Gm-Message-State: AOJu0YzCoD3pVp0zrwnn1Sl0GUEVdlYVJaUua0Fi3zhjhsH3emoZVbVN
	YGfdKB9npMR5WsN39k1N7fp5NEa9L7xJLpTk4m243f6EGTCVwrpHHKlYlfvCQcc=
X-Gm-Gg: ASbGncv9Oc22faV24a66SjZOUj1VVg0xQtF6PVC7mSUbQ++Xo1Sas/r1zn/uAkqu6w0
	Un7rrQE1l4ashHnuWDrit/SagbGGAG8RtSPjKMH6MVsANcqNPQ51dIVJH4ZDsOEIsN386ABGkFG
	ZheSlegLAsnvJEgYCNX40anlEI3mXga4logNBispY4EQXlosFdQLZo9U3GQhUS8SBgUakWGZmHm
	3Rr4qoDiXSgtmTsEOF9tdN17n+wbMoxRFJiFTQoV+FksvM1Go8j8aM8WUP+rsaix+/MnHKOSCyU
	uTfHO/EUncf4DXHXLeUuUxZh4EIimsdweYK8tstdWiNe5/fASWMekfi76oyTXV6P
X-Google-Smtp-Source: AGHT+IFaSyYcyF+Ryh1E4s3MGomseXTapLkA1HeMxX8nrM5eJsPF5uZrRKBhBqh/ftWJjIpaJugHyQ==
X-Received: by 2002:ad4:5d6f:0:b0:6e4:4331:aae6 with SMTP id 6a1803df08f44-6e66cf38b4bmr7577546d6.39.1739562224840;
        Fri, 14 Feb 2025 11:43:44 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d7a439esm24231236d6.67.2025.02.14.11.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 11:43:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tj1bD-0000000GmVK-3Ena;
	Fri, 14 Feb 2025 15:43:43 -0400
Date: Fri, 14 Feb 2025 15:43:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH 1/2] iommu: Handle race with default domain setup
Message-ID: <20250214194343.GE3696814@ziepe.ca>
References: <cover.1739486121.git.robin.murphy@arm.com>
 <87bd187fa98a025c9665747fbfe757a8bf249c18.1739486121.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bd187fa98a025c9665747fbfe757a8bf249c18.1739486121.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_114346_610608_063121F8 
X-CRM114-Status: GOOD (  17.25  )
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

On Thu, Feb 13, 2025 at 11:48:59PM +0000, Robin Murphy wrote:
> It turns out that deferred default domain creation leaves a subtle
> race window during iommu_device_register() wherein a client driver may
> asynchronously probe in parallel and get as far as performing DMA API
> operations with dma-direct, only to be switched to iommu-dma underfoot
> once the default domain attachment finally happens, with obviously
> disastrous consequences. Even the wonky of_iommu_configure() path is at
> risk, since iommu_fwspec_init() will no longer defer client probe as the
> instance ops are (necessarily) already registered, and the "replay"
> iommu_probe_device() call can see dev->iommu_group already set and so
> think there's nothing to do either.
> 
> Fortunately we already have the right tool in the right place in the
> form of iommu_device_use_default_domain(), which just needs to ensure
> that said default domain is actually ready to *be* used. Deferring the
> client probe shouldn't have too much impact, given that this only
> happens while the IOMMU driver is probing, and thus due to kick the
> deferred probe list again once it finishes.
> 
> Reported-by: Charan Teja Kalla <quic_charante@quicinc.com>
> Fixes: 98ac73f99bc4 ("iommu: Require a default_domain for all iommu drivers")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/iommu.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

