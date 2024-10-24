Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1549ACE8E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6enR5KZzRTx99C2XPU61rr6u7LzpR8D3O0QIxWIWzb0=; b=uL6EHshkJl1CXVqczJI/quX4G2
	aZxIath6CovnGW9PVb63WG+LhrZZi+M8sIPqL/zTl3GOhN42GGK2FdB3IMmJ1vqL0APtPgGmNeVeH
	oiv6RN98Cy/42Y5lOHvebqBBi/7wW4ICWRU8QH1kYcWFF28XA/ZJ4JldrJlqHwoIjEeOCib1y4B96
	Gp+NYX2FExTQ0h6NHJfTOTm16Dhe+a10OF/eN0pDOcAhsFxWeC1bOFVDwRw+HDlrJRecBt02GnViw
	9g4ImkvNuF2wfqUWmpwygyMgtyCr6hj4AMQSBemoucyeDqRt1yTEMZdUpUZ2n1Xvzu1+dRS2JBnig
	aGlG0jQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3z8o-00000000nza-0WrK;
	Thu, 24 Oct 2024 14:48:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3z3F-00000000n0J-1WSp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:43:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5679CA454E8;
	Thu, 24 Oct 2024 14:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93ACCC4CEE4;
	Thu, 24 Oct 2024 14:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729780980;
	bh=1ejVg1CipTkaaCEMkv2lOH0qtir938jRrfngzcytoAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oj4ILo4x+wAh6tghZKbYtGDNkfjGraSOQIc9xpRWDoRwIqkIW82JC83/gUevGKW4R
	 V4RsuAJ3fFcmiB8FNIgeR5I75CMcbgjkKRJF4ts1rKOrpFeR1NG/lKPtuOR1sxIvGC
	 ow4dQJjrWll9hpgyc5zdnwkPbHwMVLvKKUTYs/aRpXNFdBjDs9LC6LgF71SAqKaMWv
	 44+ni4CHmZTF+pqSHFkwDbHg4b+soCBa1BmkbFa+DxThT5dxdOgwSxS/NqotbhrmHV
	 U+naQ8/X6aDMOxPC/KJfK6XVxUbiGd7pEm5g9XT7f4F8bVhuXKi1RQd1S0JL10AyJN
	 BlhPuCMi6YovA==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	thierry.reding@gmail.com,
	vdumpa@nvidia.com,
	robin.murphy@arm.com,
	joro@8bytes.org,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mochs@nvidia.com,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/tegra241-cmdqv: Staticize cmdqv_debugfs_dir
Date: Thu, 24 Oct 2024 15:42:50 +0100
Message-Id: <172977371410.1428518.18139472724590199214.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241021230847.811218-1-nicolinc@nvidia.com>
References: <20241021230847.811218-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_074301_491134_9C0DABC3 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
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

On Mon, 21 Oct 2024 16:08:46 -0700, Nicolin Chen wrote:
> Fix a sparse warning.
> 
> 

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/tegra241-cmdqv: Staticize cmdqv_debugfs_dir
      https://git.kernel.org/will/c/89edbe88db28

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

