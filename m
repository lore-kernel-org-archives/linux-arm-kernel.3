Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72261CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AeftyCg6+K6xFqZUa6puqjP8BZnC90k8XL9+Rk8xLs=; b=Www8a3LS2Hyg3TnqD3wg87b6xd
	k7KhzBn3eEX2oC8dlzPKmbKRN/zrhplodOOoIrea1Pn+L2RG3u4N2g22hRqFnhH2XIstNocvdRsZL
	m5f0s6n/3Mot9BmJA2aezZ0cDEFj6mpZY+2LIUsvvyPmQadiKyHtA3YmDwm2Px9WGT/+WXpO9zvor
	iNx/ruBIDchqQS9mJX28368c8WsaAeU+KErCZ11Uosac2Li2U4zNUOYnVb3m1jpUA5/nl+oU6MkDc
	joASgLrAu3UzC+gDaRz35G86rv86t9/xlWYrL1ZSEktszWxEPKzJLAGWQN7k6x17TYgRcoibdNY7D
	LBWctZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu2S-0000000Cgp3-21k9;
	Wed, 17 Sep 2025 15:25:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu2R-0000000Cgnw-1IRi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8B276022A;
	Wed, 17 Sep 2025 15:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37AF3C4CEF7;
	Wed, 17 Sep 2025 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758122742;
	bh=tI6Ac6w2oSwCuXBkCkMUNA45xDANBSg0NsMKs0L/pWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2QNT5yMEHai5Vv/X9Wu5SKbEUub0HuW9bSL7UR9OtNZ2wgtTRGVMqy+EeWLu6zCB
	 9HS05wzgxjSx4t8yvRyP1tYn37tOihaIeKFoa2duJhXOkZe33a7JQR2QKGK+m73OI1
	 8NwIn1eQRXwi9/1JIkEExLaRWwFqnddrYWy4Fs8FdQ4nkVA4HktT8+KExwWgLeLtEi
	 BnlbVPi/+zScjZk1SdmMRPOB2RNHTetUxhMCvBEbSWaEkKu2dDOvdlGuORECI+Ady9
	 7fEcN6N9jEZj5n/s4KHdLyWw5f9796kOJslzMbSki0HHfRWGrgWyYakx0/qhfOCq5+
	 BY2I3uw4moQjA==
Date: Wed, 17 Sep 2025 16:25:35 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <aMrS71vQ_MaVonzi@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-23-smostafa@google.com>
 <aMQroI4NDu74PDGT@willie-the-truck>
 <20250915163858.GK882933@ziepe.ca>
 <aMl_5j8G3IGulAC6@google.com>
 <20250917123601.GA1326709@ziepe.ca>
 <aMrNTny9jgZJd_Ef@willie-the-truck>
 <20250917151612.GH1326709@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917151612.GH1326709@ziepe.ca>
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

On Wed, Sep 17, 2025 at 12:16:12PM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 17, 2025 at 04:01:34PM +0100, Will Deacon wrote:
> > On Wed, Sep 17, 2025 at 09:36:01AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Sep 16, 2025 at 03:19:02PM +0000, Mostafa Saleh wrote:
> > > 
> > > > I think the fix for the problem Will mentioned is to just use CMOs
> > > > before accessing the host structures, so that should be simple.
> > > > If it turns to be more complicated, I am happy to drop the support
> > > > for non-coherent devices from this series and we can add it later.
> > > 
> > > I feel like it is easier/better to fix the driver to use cachable
> > > memory than to add CMOs to the pkvm side..
> > 
> > Hmm, but for non-coherent SMMU hardware (which sadly exists in
> > production), I don't think there's a way for firmware to tell the driver
> > that it needs to issue CMOs for the page-tables and the CDs but not the
> > other in-memory data structures (e.g. STEs). I suppose we could do it in
> > some pKVM-specific way, but then that's not really helping anybody else.
> 
> Not sure I understand?
> 
> I mean to issue CMOs in the smmu driver consistently for everthing,
> page table, CD entry, STE, etc. Today it only does it for page table.
> 
> Make the driver consistently use cachable memory for everything
> instead of having two different ways to deal with incoherent HW.

Ah right, so the driver would unnecessarily issue CMOs for the structures
that are just shared with the hypervisor. At least it's _functional_ that
way, but I'm sure people will complain!

Will

