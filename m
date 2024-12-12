Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9D2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bARhUy91u4ylm1wnVOBr5QftfQ+kevZON+v4jmfuTJ0=; b=DMIwicR/C0i3Yf3XcGzrkZoZnn
	6tIHVk2/vDGJrsRangZKU/Tmjr6K6ESuaXyS1SmDcApJ2GBDYUVwDFQr2vzbjX82/aRr89riNRBAu
	V1otjMUwMjno76cwDx/2IEyQl31Arqz//TCbUcCxOM/IN8FBXcpLoXWAAMDza9RJf90f9mb18kwWX
	L3t8v6KqJbBmF6F4grFSG3NPJTdVrsE02hp+c13sGq5YHhpScChw5BQAvg7tnxteYr5sxpPbT4aJz
	kHHaHCT0yLYVKAdvl7J1Uhzbq9JZAvQUou2Po29wN87lmFB++hRTcMNa3ISty0vsegbeGSlQUsFzu
	2UicWmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfr8-0000000HYt5-4As6;
	Thu, 12 Dec 2024 09:51:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfq4-0000000HYfp-0sSD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3002C5C23D2;
	Thu, 12 Dec 2024 09:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1526DC4CECE;
	Thu, 12 Dec 2024 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733997031;
	bh=RcPksPwuNG4Y1xIC3bF5vmeEtYYTrnsWZYZ3HfyDMRs=;
	h=Date:From:To:Cc:Subject:From;
	b=KHwISE/Q98TXg/uB9pXdcTL72yDmzbtnNZLJ2S20VIQjJl5m2Bfby6+j6FpoOqFel
	 cxNqmsFJJqkcROmODZbyaC5uUCCo1EMsH0M61NU064LLizu3DhDpG/89Cp2KDEbEqM
	 DR3I6+kI+7UsR7/xg1gsUMt+aZq/s3KK5BYPiqGk7Bw+/tsMDrAKOKi5hCUXe0h2Z7
	 eZzFuelhUm4WzZti1qTUC+vCPadwnDiIhju2ZsgKwOJwyJVTCOVA4IXD4Aa7/TA+LK
	 Xh+JY0HOcbsF6LHRkxd5ivP3q0Pxwp2UpTe6ID6CD6tLuxF2KPftMlWxWcrpfbimNG
	 pGlJ2FjfkEssw==
Date: Thu, 12 Dec 2024 09:50:26 +0000
From: Will Deacon <will@kernel.org>
To: joro@8bytes.org
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com,
	kernel-team@android.com
Subject: [GIT PULL] iommu/arm-smmu: Fix for 6.13-rc
Message-ID: <20241212095025.GA18975@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_015032_288200_D47A351A 
X-CRM114-Status: UNSURE (   8.74  )
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

Hi Joerg,

Please can you pull this lonely Arm SMMU fix for 6.13-rc? It addresses
an incorrect use of smp_processor_id() from a preemptible section in the
NVIDIA custom cmdq code.

Cheers,

Will

--->8

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-fixes

for you to fetch changes up to 1f806218164d1bb93f3db21eaf61254b08acdf03:

  iommu/tegra241-cmdqv: do not use smp_processor_id in preemptible context (2024-12-09 23:38:30 +0000)

----------------------------------------------------------------
Arm SMMU fixes for 6.13-rc

- Use raw_smp_processor_id() when balancing traffic for NVIDIA's custom
  command queue implementation.

----------------------------------------------------------------
Luis Claudio R. Goncalves (1):
      iommu/tegra241-cmdqv: do not use smp_processor_id in preemptible context

 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

