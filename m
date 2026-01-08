Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EFBD1D475
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcIl0Th7f0VviZm5WUqOwXGbtCwNRdDIR2pE0Pw/unQ=; b=EUuy/J5nB/m3OF994VYjnj/JLm
	i5jvzQKE02CDWAe/J4agQSyotYnrwZvTzwYrqBiIfNtqGVz0AyuINtFPvCznHYZqhJSE+u3YDNbsw
	PQk7ye2Tyf+8ykYbP3vZQPBRHaBvz28FJm7iZFBGRTpakjTmBQHcWe4Qy33iXi5LeW9EGubUaDRiX
	ovSAGY+jFViNEd9RyllPL/5AZvQv4z1FJNDkmgiXqiPR9X4E+evIH1Y1v6T/vROz4PSFZAEbD5fet
	aG3cDe0RP0bb69iCoZsZTOqAZXvta9EoRabjAnh+WF2U5DFLCeCtnzYXhUolNra+qjAqqwyvy19Mt
	Lh7frCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrm8-0000000HUUj-1EL6;
	Thu, 08 Jan 2026 15:18:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrm6-0000000HUU8-1Tsc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 704F560131;
	Thu,  8 Jan 2026 15:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44600C116C6;
	Thu,  8 Jan 2026 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767885489;
	bh=wElAgqmhU2sH9+PAc4srlbsEZTYYJ/yrdkxVw3n95E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tO1qsb8sbuPY7+2dsp6sLheV0BkRESLekNwWZbmqFgFXIIziFd5Floa7jzGp6hYUk
	 CYNMtda0ceV8AyHG7sCetgbEk31JXOT/XLZ5tdKPWa5w3cnrpuRU8KDxsE46ydSVOn
	 R1YRBaBh5u54nOteVa5lrG74sRUessVMtPlY+2qtjKTxkf9FS9DVl7KLAqwzXhhXB0
	 yb9THS8iMBaP+j+OwNlk3uBFRbd+SqpQH5GCaMI0F6sbI4Z8tr2ynupQ8dzYqH6XfY
	 /sqjX6gttRsZU/xm8pRFz899DYRmDn7yNDS44+5VVPf+s8nyEdwbQgexsyvqYMF3ji
	 RRcWhQdF9TkUw==
Date: Thu, 8 Jan 2026 15:18:02 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Lucas Wei <lucaswei@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, sjadavani@google.com,
	kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	smostafa@google.com, jgg@nvidia.com
Subject: Re: [PATCH v2] arm64: errata: Workaround for SI L1 downstream
 coherency issue
Message-ID: <aV_KqiaDf9-2NcxH@willie-the-truck>
References: <20251229033621.996546-1-lucaswei@google.com>
 <87o6ndduye.wl-maz@kernel.org>
 <aV6K7QnUa7jDpKw-@willie-the-truck>
 <7cd7b4f0-7aa5-4ca0-adc6-44d968c1ed48@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cd7b4f0-7aa5-4ca0-adc6-44d968c1ed48@arm.com>
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

On Wed, Jan 07, 2026 at 05:55:40PM +0000, Robin Murphy wrote:
> On 2026-01-07 4:33 pm, Will Deacon wrote:
> > On Thu, Jan 01, 2026 at 06:55:05PM +0000, Marc Zyngier wrote:
> > > The other elephant in the room is virtualisation: how does a guest
> > > performing CMOs deals with this? How does it discover the that the
> > > host is broken? I also don't see any attempt to make KVM handle the
> > > erratum on behalf of the guest...
> > 
> > A guest shouldn't have to worry about the problem, as it only affects
> > clean to PoC for non-coherent DMA agents that reside downstream of the
> > SLC in the interconnect. Since VFIO doesn't permit assigning
> > non-coherent devices to a guest, guests shouldn't ever need to push
> > writes that far (and FWB would cause bigger problems if that was
> > something we wanted to support)
> > 
> > +Mostafa to keep me honest on the VFIO front.
> 
> I don't think we actually prevent non-coherent devices being assigned, we
> just rely on the IOMMU supporting IOMMU_CAP_CACHE_COHERENCY. Thus if there's
> an I/O-coherent SMMU then it could end up being permitted, however I would
> hope that either the affected devices are not behind such an SMMU, or at
> least that if the SMMU imposes cacheable attributes then that prevents
> traffic from taking the back-door path to RAM.

I think IOMMU_CAP_CACHE_COHERENCY is supposed to indicate whether or not
the endpoint devices are coherent (i.e. whether IOMMU_CACHE makes sense)
but it's true that, for the SMMU, we tie this to the coherency of the
SMMU itself so it is a bit sketchy. There's an interesting thread between
Mostafa and Jason about it:

https://lore.kernel.org/all/ZtHhdj6RAKACBCUG@google.com/

But, that aside, FWB throws a pretty big spanner in the works if we want
to assign non-coherent devices.

Will

