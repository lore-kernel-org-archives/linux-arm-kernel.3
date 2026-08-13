Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2FAC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opwS4jjY/2m4RZ1yhCK834dI3mtLkmcqk7P5LYp9Hhc=; b=pLf0xCj9rjZyAxZZQB6t+tfwZq
	hDSB4Ei5HyfJdOakWN5DBUIun0OhzeK95HvAjEtyOm8C+eBl+hT24S1Pt5ssAkullVw+hiKRL2hko
	WtTTEblp6bUkdYWbRxaBEpXGoT0u8cQ0cIfnZ+U9WpyaU1+F9VE1Y7GCJV3S5Jf3NBx+D2bZfkJZP
	BM6LxgThQG5e6alrIuGJJ9j/fQ5sSx83ghx6k9S0GqD0Z64pRykdTsLle2xsybFVMRe4V3C2GuY3c
	YfY6hF8XVjMrhEBad+uYkwsECRoRDL9LHZfjyGEfk/kpCtpTROAh18BF+a9VyckYtCVITR/qM6f+h
	+855IBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXLs-000000011J6-2URd;
	Thu, 13 Aug 2026 15:28:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXLo-000000011HG-2iFt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:28:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65A224382D;
	Thu, 13 Aug 2026 15:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3421F000E9;
	Thu, 13 Aug 2026 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786634892;
	bh=opwS4jjY/2m4RZ1yhCK834dI3mtLkmcqk7P5LYp9Hhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yf0QU6fe5CPzdz82xf5Sn0MXv1H917tAlGe/9eWgmjwlgSVDkMZ7B8bhSeavHSAVe
	 3ClI0cuG6ZRTaXeVrUHXTQn7vv8U3Gh+jXlLbSwNpvbXPnlUPJKl3nRWbHm6v2yXSE
	 AI+qrnrCx7IphD6+2ny8vgfLgUmokJY58vAJPkx81qBLUkppZhXlAqVsB+uCsG6B5a
	 Jes3XUgFH86rVrj5rQPPUfHxXuf7wgg8C7Tj5OjKSmDYYA2QttJh1uliF/jl8mU+zb
	 twuXDmtP4cHPgdXHTbJvH4T+F+fxJbbGfVfSL9dIScRhnyqr5vBe1fDzyh3DCZMpgJ
	 u78m48ygwuKWA==
Date: Thu, 13 Aug 2026 16:28:04 +0100
From: Will Deacon <will@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 07/45] arm64: mm: Handle Granule Protection Faults
 (GPFs)
Message-ID: <an3ihGk3znnk8TWV@willie-the-truck>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-8-steven.price@arm.com>
 <ans1ZSwMEKeT9Gfz@arm.com>
 <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
 <7d4e5920-aa20-40cd-954e-037631bd0d6c@quicinc.com>
 <anx6YbPMVz3OlpA5@arm.com>
 <an2YN7kxB7bjCd2s@willie-the-truck>
 <8db602b8-7fd3-4c11-8fbd-3b8251648eb8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8db602b8-7fd3-4c11-8fbd-3b8251648eb8@quicinc.com>
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

On Thu, Aug 13, 2026 at 07:40:41PM +0530, Pavan Kondeti wrote:
> On Thu, Aug 13, 2026 at 11:11:03AM +0100, Will Deacon wrote:
> > On Wed, Aug 12, 2026 at 02:51:29PM +0100, Catalin Marinas wrote:
> > > On Wed, Aug 12, 2026 at 06:12:09PM +0530, Pavan Kondeti wrote:
> > > > There is a valid case for fixup_exception() to be needed here in GPF
> > > > handling.
> > > > 
> > > > -000 |load_unaligned_zeropad(inline)
> > > > -000 |hash_name(inline)
> > > > -000 |link_path_walk()
> > > > -001 |path_lookupat()
> > > > -002 |filename_lookup()
> > > > -003 |vfs_statx()
> > > > -004 |vfs_fstatat()
> > > > 
> > > > We observed this in Android running Gunyah when the page is mapped in
> > > > EL1 but unmapped at EL2. path_lookupat() can actually handle this
> > > > via fixup_exeption() when a word load crosses the page boundary.
> > > > However, Gunyah injects a Synchronous External Abort and we have
> > > > a downstream patch [1] that adds fixup_exception() in do_sea(). pKVM
> > > > injects [2] such faults back to EL1 and fixup_exception() is taken care.
> > > 
> > > Ah, good point, completely forgot about load_unaligned_zeropad(). Since
> > > we don't unmap the linear map for delegated pages, we'll need the
> > > fixup_exception(). And I guess warning in this case is not desirable
> > > either. We could limit it to EX_TYPE_KACCESS_ERR_ZERO and
> > > EX_TYPE_LOAD_UNALIGNED_ZEROPAD, though not sure it's worth it.
> > 
> > Alternatively, I think the series to unmap guest memory from the linear
> > map would solve that for gmem:
> > 
> > https://lore.kernel.org/all/20260410151746.61150-1-kalyazin@amazon.com/
> > 
> 
> Thanks Will for sharing this information.
> 
> There are use cases outside gmem like FF-A lend to Secure Partition.
> we may not be enforcing all such memory to be unmapped at EL1, correct?

If you leave the cacheable linear alias of memory intact across an
NS -> S transition, then you're in for a bad time [1].

Will

[1] https://lore.kernel.org/all/20221114110329.68413-1-manivannan.sadhasivam@linaro.org/

