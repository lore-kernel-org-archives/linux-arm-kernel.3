Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D86C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNocqr+f4jd0PXhGNGZtTNkwX0S/kPbjIgYZzMTwGRk=; b=SWwA82rynwJuhjOsb/bc3hiayi
	sIXyl9OZK6ja9oXjPKB6M07c8SUYK2lkWZHoLb40mT1UywT/dqGkMttmPza50C5//ISm6BKKp6Z/9
	LPANIzVK/rYwM+P93GZaDyE0HCgkklxuGFQBucwZzZbWStmMaXElwNQXsdlhdh7Z/B0qv6BvWas5+
	6KVgrYcTn3h5H7DIQcBVeRifiJxBS8oFM1yMmNqsFxiG5NuWnNuSzkHRPl1SmSBTVsT7Fqis8YXoV
	AUblV64kBEIu9XCpfX6fwknsyjIRUz+3FlB58IvKJKh9iMCpvJNfdTLmTxsTiWijmFho3bg8I74xN
	5kPlLAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u579p-0000000AVdy-41nN;
	Wed, 16 Apr 2025 18:06:45 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u577f-0000000AV0s-3D6l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:04:33 +0000
Received: from DESKTOP-0403QTC. (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id E4B462052502;
	Wed, 16 Apr 2025 11:04:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E4B462052502
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744826669;
	bh=cNocqr+f4jd0PXhGNGZtTNkwX0S/kPbjIgYZzMTwGRk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Reply-To:From;
	b=F7lkSLyXPqicBGROFWe5YEm0hwGlmASQb80YXKtwsZdKz9r/3/gN1PQGdAqShudnu
	 +v0mrjCkpzH953U+sjY/DUzzoont8/OvrTQJoOkYgSiJkUrU4HPTb3sQevwEjmpgcQ
	 GSXZJl3606uFWjUOiB0PQ4koc8SYaXFQ26Yebg0M=
Date: Wed, 16 Apr 2025 11:04:27 -0700
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 virtualization@lists.linux.dev, will@kernel.org, eric.auger@redhat.com,
 code@tyhicks.com, eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
 jacob.pan@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250416110427.21bdd561@DESKTOP-0403QTC.>
In-Reply-To: <20250410230008.GA6905@ziepe.ca>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
	<20250410230008.GA6905@ziepe.ca>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_110431_828597_0AA8610A 
X-CRM114-Status: GOOD (  26.77  )
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
Reply-To: jacob.pan@linux.microsoft.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Jason,

On Thu, 10 Apr 2025 20:00:08 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Thu, Apr 10, 2025 at 03:50:27PM -0700, Shyam Saini wrote:
> > 
> > Hi,
> > 
> > Currently, the MSI_IOVA_BASE address is hard-coded to 0x80000000,
> > assuming that all platforms have this address available for MSI IOVA
> > reservation. However, this is not always the case, as some platforms
> > reserve this address for other purposes. Consequently, these
> > platforms cannot reserve the MSI_IOVA_BASE address for MSI.
> > 
The fundamental question remains: why is using IOVA 0x80000000, an
arbitrarily chosen virtual address, a hardware issue?

> > There was an [1] attempt to fix this problem by passing the MSI IOVA
> > base as a kernel command line parameter.
> > 
> > This patch series aims to address the issue by introducing a new DTS
> > property, "arm,smmu-faulty-msi-iova" which can be used to hold
> > faulty MSI IOVA address. This property can be passed to ARM SMMU
> > drivers via device tree so that the drivers can select appropriate
> > MSI IOVA base address which doesn't intersect with the faulty MSI
> > IOVA address.  
> 
> I thought we already talked about this and you were not going to be
> doing a DT proposal for a software knob?
> 
> And then you didn't even link to the recent discussion :(
> 
> https://lore.kernel.org/linux-iommu/20250403232619.GA681099@ziepe.ca/
> 
> It is easily solved in the smmuv3 driver without out any DT. Please
> do that.
Given the above fundamental question answered, then we do have a
platform specific IOVA range to avoid, IMHO it must be enumerated via
DT or some other means to avoid conflict.

Per last discussion "SMMU driver have a list of potential addresses and
select the first one that does not intersect with the non-working IOVA
ranges.". If we don't know what the "non-working IOVA" is, how do we
know it does not intersect the "potential addresses"?

Thanks,

Jacob

