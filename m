Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747C8CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skOs4tsc6sXpiuWDaL8QUnUwJQBbvqvvO4BpIjWXX0I=; b=wweFwj8PGohbRCJY8h245FI5LL
	oFDAPjazdxi88J24GsBb9gHOMuCCm+MHPpWKT6sKVYp54gsDB0eKyAaGa74PnY/WaC5Jr0twTYsjA
	Ja7rZ9FnbnuqtkhelKjdrVyDiNA/ktDQbeDEMRaPrHofaTQ6d6HBVhd+8gpwTHoMvrW1vxe7LSe7y
	ni2Sg8UBBHqHtKXkInaYQX8ZHbcloPRykfebXDduSuSbykTpTDbfdvIFdJ1dWQNbltdqWQRRZpD9/
	8u0jhTuAXWSrDFYycI98nfXLsvX+NYVOYSk8ZlN9nwtyJEax+Dh2k8FXtxHauAsuiqYhn8DeojU3o
	6lz6Rg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWDE-0000000Dmxe-3oQq;
	Tue, 02 Jun 2026 20:59:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWDC-0000000Dmwp-0HRs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 20:59:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D8AE438F3;
	Tue,  2 Jun 2026 20:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD1F1F00898;
	Tue,  2 Jun 2026 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780433984;
	bh=skOs4tsc6sXpiuWDaL8QUnUwJQBbvqvvO4BpIjWXX0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=acgcWDchyxTz4KJwz+pLvRVBcM9FKZeKwGBsxUztZ0IrE6QEiXDoqCmpsx2ctNZz/
	 JuZ8c3+MifLDO2GrZUhF37qIXBWlPIeSXhrFDu8S/HRAc+UG9Z9+IBmlzt6luopuHD
	 5nFQuEaeyKdhPOqXVec3Yyyc7N3iz17T5hQSipK1cD2d/aid0Fz50W/LxVwNPVGixl
	 zNNuSe9QrlIUyfmjEFo89fjNn3nRAGpYumAsEnbkaw4U7J8rUreARt+gs/PTNVVj5h
	 ALZdvDYw2arTQOSj2EwHhlA8ElAkCjDy+OPbuouJbERvnyZ6276/hP8XxIHQU6IKqp
	 kNl/UIotlbZjw==
Date: Tue, 2 Jun 2026 21:59:39 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Ashish Mhetre <amhetre@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/arm-smmu-v3: Detect Tegra264 erratum
Message-ID: <ah9EO-djR3Tf9ohf@willie-the-truck>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-3-amhetre@nvidia.com>
 <ah85c4u011WNJQgE@willie-the-truck>
 <ah89vg26255v4lqF@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah89vg26255v4lqF@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_135946_122933_F6E57854 
X-CRM114-Status: GOOD (  26.99  )
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

On Tue, Jun 02, 2026 at 01:31:58PM -0700, Nicolin Chen wrote:
> On Tue, Jun 02, 2026 at 09:13:39PM +0100, Will Deacon wrote:
> > On Mon, Jun 01, 2026 at 10:48:44AM +0000, Ashish Mhetre wrote:
> > > Tegra264 SMMU is affected by erratum where a TLB entry can survive an
> > > invalidation that races with concurrent traffic targeting the same
> > > entry. The hardware-recommended software workaround is to issue every
> > > CFGI/TLBI command (each followed by CMD_SYNC) twice. The second issue
> > > is guaranteed to evict the entry. ATC_INV is not affected and must not
> > > be doubled.
> > > 
> > > The erratum is not flagged by any SMMUv3 IDR/IIDR register, so it
> > > cannot be detected from hardware ID. Tegra264 boots from device tree
> > > only and has no ACPI/IORT support, so detection is through device
> > > tree only.
> > 
> > That seems odd to me -- whether the hardware has the erratum is
> > completely unrelated to whether it probes using DT or ACPI, so I find it
> > really weird to have the workaround enabled when booting with DT and not
> > when booting with ACPI. We should have consistent behaviour between the
> > two.
> 
> That's a good point. Yet, for ACPI to detect the erratum, we would
> need a new IORT model or flag, right? That would need to go through
> the entire ACPI protocol to update SMMU's IORT spec and the header
> accordingly, which we don't have a use case to do so or to test it.
> 
> What would you like us to do here for the consistency?

Gah, I now realise I've mixed up Tegra264 and Tegra241 because
tegra_cmdqv_dt_probe() is only called if the compatible string matches
"nvidia,tegra264-smmu" yet all the cmdqv stuff talks only about
Tegra241. So I was surprised that the ACPI probing code for Tegra241
wasn't enabling the workaround.

But if you're saying that:

1. Tegra264 never uses ACPI
2. Tegra241 doesn't have the invalidation erratum

Then I'm less worried (even though it's a shame that we can't detect
the erratum from the hardware itself).

Will

