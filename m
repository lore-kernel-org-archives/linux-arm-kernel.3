Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418D5CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAqc7sLlvdB11p/fqTbQZyKaqldWqbPlcsvirlY8+UQ=; b=2oyM2x4dDDZ+GAvh6EGNMK4fmm
	Swadh0Zq4KKm2imO8IY20+p2ijOuNwawq9cRwXPlC5eTmQSf18TEGDHkkBwaQfNg0QolFlPUR2HzJ
	WdkfZ5quZnU4B9apwPh0R/Brpw3glO2b1b1sSVTY5O/KPV2Qas/U/xkx2aBSFf9wcsCCXnywfD4z1
	4B0YZEkdjCRICFIO38mE95UkWPnndfC/pP1zo9seLp51PlAG18h/BOD8CEay8s9+7MT8oC6oPenGZ
	cNQP1shUs/RTPnf0oeQW8e+33Lk10R5FDRe4aI5Fdu1PzA9Y0qsju+Q1ADLIPhnueY4mvG+fpOoi4
	91PSDamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPQ-0000000C4Vo-2m7P;
	Fri, 02 Oct 2026 16:46:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPP-0000000C4VV-3O2q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:46:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AF23438D7;
	Fri,  2 Oct 2026 16:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948431F00893;
	Fri,  2 Oct 2026 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959615;
	bh=YAqc7sLlvdB11p/fqTbQZyKaqldWqbPlcsvirlY8+UQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gptaoozJsVlyRpi1v4AMP6xux9F8RC3N/XoMasZaml0QePIxG0lgKEtPsG+deXLHp
	 w4A8nMDwZYObPipk2vYt69kbkg23Q/TNC7jIkNJj+GcYRDk/rItB4B9u95+AbnKJxP
	 Z3BC7nwOGGKxqiOcqcqvmYryHRdw3RfhIeFCzyUevzCySZC81Pwbnt7WBP3R+LfB1W
	 In4spXOffKfk/Rgi+gUulZ+sPHPKTIAuXic2XvE0MbGIMxvLpPrlpCB8rL8DnIOFjf
	 SttCfRoNpjbUPh2JmjrgIsILk70FxlPSwlClcvXuiJ3tiBV6tkG3Lio63yc58ch4Vc
	 xhsawTVWregJA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kiryl Shutsemau <kirill@shutemov.name>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Yuanhe Shu <xiangzao@linux.alibaba.com>,
	Kyle McMartin <jkkm@meta.com>,
	Usama Arif <usama.arif@linux.dev>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] iommu/arm-smmu-v3: Make the queue depths tunable, and shrink them in a kdump kernel
Date: Fri,  2 Oct 2026 17:46:37 +0100
Message-ID: <179095566175.2076343.2229507765103689715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925141532.1274962-1-kirill@shutemov.name>
References: <20260925141532.1274962-1-kirill@shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 25 Sep 2026 15:15:28 +0100, Kiryl Shutsemau wrote:
> The queues are sized from the IDR1 maxima and allocated at probe, costing
> megabytes per queue per SMMU instance. A kdump capture kernel pays that out
> of a small crashkernel reservation, for queues it barely uses and two of
> which it switches off anyway.
> 
> Patch 1 adds a cmdq_max_n_shift module parameter, decided in a per-queue
> helper and floored at one page. Patch 2 has a kdump kernel size all three
> queues at one page through the same helper. The parameter does not apply
> there.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/2] iommu/arm-smmu-v3: Add a cmdq_max_n_shift module parameter
      https://git.kernel.org/iommu/c/c9b493a312f3
[2/2] iommu/arm-smmu-v3: Default queue depths to one page in a kdump kernel
      https://git.kernel.org/iommu/c/3f9fa6b9520d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

