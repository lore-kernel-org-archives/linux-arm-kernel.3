Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780B1C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+yUjOW/SjFiacu+4MTIUll3EvJZVdDjg7M5mV1xjPI=; b=o1Wzf9qN3SwYSs76RGul3VrSor
	NikmqzWA8WJxGbEhXIDFn4gXn33VPaui/OoqX8LYYY2EuQO3IH8WnZO+4vAF7EAFjrvKBax6Fa7AU
	DvpqmgAGeb0ef0fb2WG7rkiPUN96O8dkNgnbZK1o8La/4nkKdadmCHYe1RxaLTGqm1RRSwLy7Yg2+
	2HmTWNG7+OgF6a84wOQCT3OWYVCrTLpwY1+o4DJMMqHz4Mp8aCM/wkdzmctOHPlCO7YwuzDDc80Up
	ocPe80MXrePK+AG6veGyywaNSN962b395Xek7wJULbkK2bd+FwCAjApEq1B8HVBl93I3ALdt2TElm
	P1ad+kZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6461-00000003ASr-0t5a;
	Mon, 14 Sep 2026 10:39:33 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x645s-00000003AQT-32K1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X+yUjOW/SjFiacu+4MTIUll3EvJZVdDjg7M5mV1xjPI=; b=NxrC7vsf0hgo/xProYwLCwq+gf
	VXcw3rISGt2u3FWr4ZCKbxxxp7U6O7cCEUqpPD9zoGdnutjPML8JwYzpU2ORxsIhMSb79HMgj2USV
	40nuKs2uak5kvOyKatMe0m3hEIaESOtCrfIx5j3GQvgjPTb4wjSLKtA4xy3UOuCpTE7R3bxZmVKWy
	vW6PINsXIhs4a7juDttbAYGT9swGjHjZ/XR8mcdCoBSagRbb5/fd7H18UsvXbrufmuasCnlTt6F5D
	oyKjaATE95SDZ5Gy6eBawGPn3FtnQf4xqT/XvvoZ6Pb0+BuRW7MoFN5gKJhwrMrvmg0Fk9esz97zH
	JcPevA7A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x645e-003Yd7-2b;
	Mon, 14 Sep 2026 10:39:11 +0000
Date: Mon, 14 Sep 2026 03:39:06 -0700
From: Breno Leitao <leitao@debian.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, catalin.marinas@arm.com, mark.rutland@arm.com, 
	puranjay@kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rmikey@meta.com, kernel-team@meta.com
Subject: Re: [PATCH 0/2] iommu/arm-smmu-v3: SMMU hitting kdump mid-air
Message-ID: <aqfOKGiElMz1YX6N@gmail.com>
References: <20260911-smmu_fix_aws-v1-0-75870bf9655b@debian.org>
 <aqSBQKDoUTy/l2d7@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqSBQKDoUTy/l2d7@nvidia.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_033924_766010_EDD36394 
X-CRM114-Status: GOOD (  18.08  )
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

On Fri, Sep 11, 2026 at 03:31:28PM -0700, Nicolin Chen wrote:
> On Fri, Sep 11, 2026 at 07:54:43AM -0700, Breno Leitao wrote:
> > My lovely robot and I came with two patches that solved the problem,
> > from a practical perspective and I want to share what has been tested.
> > 
> > Patch 1 carries the previous kernel's L1 descriptors into the new KDUMP table, so
> > those streams keep translating.
> > 
> > Patch 2 stops the core discarding that again: iommu_dma_init() already
> > enables deferred attach for a capture kernel, but the core only honours
> > it for drivers implementing .is_attach_deferred, which until now meant
> > amd and intel. Without it iommu_setup_default_domain() attaches
> > a default domain at probe and the fault returns as F_TRANSLATION.
> > 
> > The x86 IOMMU drivers solve the same/similar problem the same way; see
> > commit 38e5f33ee3596 ("iommu/amd: Reuse device table for kdump").
> 
> This looks like my bigger series:
> https://lore.kernel.org/linux-iommu/cover.1788130528.git.nicolinc@nvidia.com/
> 
> Would you please help check/test?

Tested, and it fixes the problem on Meta kdump kernel. Thanks for the message.
I am dropping my two patches in favour of your series.

Test it on AWS Graviton EC2 metal, 96 cores, two ENA NICs at
0003:2c:00.0 and 0003:2d:00.0. When the kernel crashes the NICs keep
bus-mastering, and the capture kernel builds a stream table with no L1
descriptor for the ENA's StreamID 0x32d00, so that DMA raises
C_BAD_STREAMID. 

Patch 11 is what makes the difference for us. "SMMU currently enabled!
Resetting..." opens every failed capture boot we have on record, and it
does not appear at all with your series applied.

Tested-by: Breno Leitao <leitao@kernel.org>

