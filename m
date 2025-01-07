Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF71E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSKckND0eurC6MxJQy4eYfJNp7p4zPAu9UAMh5LzXU8=; b=iSXBf7FdY4dKvTsB/siXUOBCiX
	+jhleWG7N+MlZDuwqQ5ahUNes4PkLPSRrfByF/IYTDotfDzwZ00Z7T1ZmXAGA1R8MNX46VUITp8Ny
	nrSBZNC4dIIOVybdezFWm9e2c4O8XEEqn382Rucww5gPbBy4oIspVE8at3hvWGsNUmyNrGSMyJjmc
	OAh1D+o6P4UQKc5X5fleYYR8LbORhhIH73Zvo04RpnYuT2+aZu2qcpxgm5BeDaQI3MHIqgnc5VOLB
	mDUwoIshjHt0mQe+prJylQq+IIa31NpGp+xjW1y7bAdBz4sAiR2aBhonef0N70fVbj1VOT78bmlAt
	IyFuO88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD6h-00000005mHC-1Dd7;
	Tue, 07 Jan 2025 17:11:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCfL-00000005gS7-48qC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 428CAA41993;
	Tue,  7 Jan 2025 16:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC5AC4CED6;
	Tue,  7 Jan 2025 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736268170;
	bh=v3Dgvzj+ne0u/roC2qmWZpXnIMfuyTT+wzCVjKrqrWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xu7f3RkxHlXIEiNpvlzEXl5zJRth/lHDbitT4dyP1/l5W2lJ+vMRNG6EUNu84BXHC
	 EvG0WzRQU+sZ8YOPTm45ks5AGNna16iPYTSNYfGrbmWC+J+jZZqHbxdS8++F8oIKHS
	 HM/2WghQ5Vhb7Cps5f3zqQI+4CWncc3FHBxMKqAWK/2YH7aoHcGyjI3J5xrb2e3KDW
	 Me58HpT2UInadGMy7BzlZ4JrKWhHVKMh76cbH//MTBmJXhIF5CLXEG0X+INJKdOrIt
	 pz6yPWzfjoUquswLj+iwjZWMAliXPFlk9edVnQ1/l6IYy1Br6UQO/Erj/TfIyBWkaw
	 Ff2m2IDumpyNA==
From: Will Deacon <will@kernel.org>
To: robdclark@gmail.com,
	robin.murphy@arm.com,
	joro@8bytes.org,
	jgg@ziepe.ca,
	jsnitsel@redhat.com,
	robh@kernel.org,
	krzysztof.kozlowski@linaro.org,
	quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org,
	Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR implementation for Qualcomm SoCs
Date: Tue,  7 Jan 2025 16:42:39 +0000
Message-Id: <173625436399.258197.10961901698600591079.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_084252_087472_992E9B87 
X-CRM114-Status: UNSURE (   9.05  )
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

On Thu, 12 Dec 2024 20:43:57 +0530, Bibek Kumar Patro wrote:
> This patch series consist of six parts and covers the following:
> 
> 1. Provide option to re-enable context caching to retain prefetcher
>    settings during reset and runtime suspend.
> 
> 2. Remove cfg inside qcom_smmu structure and replace it with single
>    pointer to qcom_smmu_match_data avoiding replication of multiple
>    members from same.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/5] iommu/arm-smmu: Re-enable context caching in smmu reset operation
      https://git.kernel.org/iommu/c/ef4144b1b47d
[2/5] iommu/arm-smmu: Refactor qcom_smmu structure to include single pointer
      https://git.kernel.org/iommu/c/445d7a8ed90e
[3/5] iommu/arm-smmu: Add support for PRR bit setup
      https://git.kernel.org/iommu/c/7f2ef1bfc758
[4/5] iommu/arm-smmu: Introduce ACTLR custom prefetcher settings
      https://git.kernel.org/iommu/c/9fe18d825a58
[5/5] iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500
      https://git.kernel.org/iommu/c/3e35c3e725de

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

