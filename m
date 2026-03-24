Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D90F54ACE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMDX4fpBFkZD5FROKFk4jJky0foOabfcCGudKZ/nXHY=; b=U1eN39o7CXmlugt3hTLGVAx/ml
	Um4nW5jTdM2imKIIqon0mTRmxagrIK1fCnijW5knqOMEPERj9cCfEdkAXncyrNtGQ0UvYxeEML2mi
	aOdMwl5V8dgnMVJGnx6a52oAvuWJv2sodD26F/2uZxbq85qz2am8g3Ba/QKn0vu3HJwSBQLQUeYgo
	YeDfST4/HA5qlE+w5YY37e3CQlfSZOO+MmKWH39/1J9V6Kp/prJ/itQH7RmjniIasjud5rcJ3ZpPx
	8HR2jBG8v4BUU2ivli1UT0khCqgaB8yXiDvWjFbCJdarNyTyUHHuFa2j2M5KPlvfltw3UD7HZIf0n
	cf9FK0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53My-00000001iu5-3ReU;
	Tue, 24 Mar 2026 15:08:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53Mw-00000001isB-0Sdg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:08:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C21060121;
	Tue, 24 Mar 2026 15:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38132C2BCB3;
	Tue, 24 Mar 2026 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774364913;
	bh=0mH7uYZYueiKrHRYK9hJo/SYnSaUZjBuHsQJhpph3vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a3YoXAS12VFGUCYlTIYVxMt9XDszX/QDBqmPH3a++qcU715k6GEZ7B1CZlNuZd65s
	 pnG6smiEskwgC/ZaG41o7fxjBLqO5+AOcXd1PfcYrNn3r6QjIKiVCiNbmX+QYE8hRz
	 KCxTknlFFkMpw/nmFVyYXYtuNTO6AQ++ClfPSy+CDvwryIqi+aMrPw725AtJ/QgZ+Q
	 LcQx8ve1DgcE5u10hUxTp1VFbJJITZYCxgDFGFrY/NTAKbAoEzWZsRHZG9JS4A1vVA
	 0eXmmRnQeO0zY+8gZGIbTd0G3hUZYc827YKVanTwuSlGAiH283WgMxey/UpZPMlnyT
	 QCcU62J8QiLVA==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 0/2] iommu/arm-smmu-v3: Fix bugs and typos in arm_smmu_invs series
Date: Tue, 24 Mar 2026 15:08:12 +0000
Message-ID: <177435987281.1850677.12953681041548853263.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260321225041.11090-1-nicolinc@nvidia.com>
References: <20260321225041.11090-1-nicolinc@nvidia.com>
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

On Sat, 21 Mar 2026 15:50:39 -0700, Nicolin Chen wrote:
> Thank you for taking the series!
> 
> I found a couple of small issues in those commits. And here are the fixes.
> 
> Thanks
> Nicolin
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/2] iommu/arm-smmu-v3: Do not continue in __arm_smmu_domain_inv_range()
      https://git.kernel.org/iommu/c/6a01b9f0a5ec
[2/2] iommu/arm-smmu-v3: Fix typos introduced by arm_smmu_invs
      https://git.kernel.org/iommu/c/86bf8580d5b8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

