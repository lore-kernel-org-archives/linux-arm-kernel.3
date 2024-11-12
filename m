Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9428D42BB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0S+ziWpAwUJSREUA/B7jG4iDwiU6qMbGdTb6OjfvPI=; b=iLEJauAWOdGWnJ8AVli7KxgmiX
	ae+wMa1ry9GL6v7wsMl8vcGMCCc3B7Eusd8my13j0wyka+kQ5TMmBHhXURhpGey6shjnev0fHgZ2L
	ALvr6/pFrX8BDrdIsPRzBkQ6zoVxyKOOpjw+CRaGCC8wmsvW27qj441Uzqa30t2f01bmoy2izeh9T
	kuKCuq06JQR8pa4seJKu8t+ZGEIu9FBSivrS2WR8geFF0w3kTeLt0tJIA1S6+QxOd/ziHAuspaU++
	L5WB0a+VQvT4xF5KZjrS+EZ5gNoERMsq06kGA9OJ9IpNsydpJoc0ooiDZID6ypYOmiGy5DOlbPOTa
	eIY384sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuRx-00000004JO9-1mB8;
	Tue, 12 Nov 2024 17:13:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuCI-00000004FKg-2HuU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2BB4A41F21;
	Tue, 12 Nov 2024 16:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C3AC4CECD;
	Tue, 12 Nov 2024 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731430616;
	bh=EQvwaUi2w45hQ0nesz6tI/0jRlGB8KnI5X1+VY1Emb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gyDGHS8VsFO8YiUHKzzdrGVONkbwC6XBKloCM7ImIfjtBGzSzNAUgp2U1WQRNik81
	 Fsef0rzOtkP2gxPHhseqbSGQUo+F007cVaRRm44WCe98vAwzUKEsIImwT1EVlLXEEz
	 0LPJez1/xObpd4tI+PXrrXb1OOwTry4zKTP8DK80gDMaU+/6dzq1hkBA8kBgDGuAIh
	 InhNdo6bpFLAoS8m7e+5Nejf1cDjQeqc0stHuDrWH0xdL7jzaX5A21tmfk1g5qFhJ1
	 EUacgxVFtwvt6r+/zqkKBBkvW0fRLCFGYz0b3KVM4AcH0I70MqjMdfXNiVT4hNrF9p
	 aXeJjSEvP0IdQ==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	thierry.reding@gmail.com,
	vdumpa@nvidia.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH rc] iommu/tegra241-cmdqv: Fix alignment failure at max_n_shift
Date: Tue, 12 Nov 2024 16:56:50 +0000
Message-Id: <173142418330.1973910.1191259071038387348.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241111030226.1940737-1-nicolinc@nvidia.com>
References: <20241111030226.1940737-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_085658_671131_E9BCA0E2 
X-CRM114-Status: UNSURE (   7.35  )
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

On Sun, 10 Nov 2024 19:02:26 -0800, Nicolin Chen wrote:
> When configuring a kernel with PAGE_SIZE=4KB, depending on its setting of
> CONFIG_CMA_ALIGNMENT, VCMDQ_LOG2SIZE_MAX=19 could fail the alignment test
> and trigger a WARN_ON:
>     WARNING: at drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3646
>     Call trace:
>      arm_smmu_init_one_queue+0x15c/0x210
>      tegra241_cmdqv_init_structures+0x114/0x338
>      arm_smmu_device_probe+0xb48/0x1d90
> 
> [...]

Applied to iommu (arm/smmu), thanks!

[1/1] iommu/tegra241-cmdqv: Fix alignment failure at max_n_shift
      https://git.kernel.org/iommu/c/a3799717b881

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

