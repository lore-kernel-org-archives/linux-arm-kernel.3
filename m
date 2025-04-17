Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498FAC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7VFxEo4h8XULL/fbpqxLzHoxKM6AEEkI/t83unvoeA=; b=J9A27rk4Ofn+DA0l69JZ5zQbVo
	cbkAXhIdFfNqqS/EmTIqyJnLZXeyhmzKQ2cMzN48VQy+ixJsjLvNW0ePd5QyhU3SfXuaxG4LLdIby
	mCPF5sVPdePl/yfqqENzFWHRm1LcljGGzvbNkyHR4puT2pTvsCa6gh6oY+8ABy6980VY8Drm8/LOl
	5R5DUrOAyncsWTO7yugN2acTGQhcZaLw00H2xfRBARHhJiOfYK/bYpY85Oqoz4S8j7vaJEV4VZT8y
	jiuoTzhAP0BMd/qR10Du5GK6ZrysOf8/QpjL2gr35lu0OWtFTgoyL3l9xnPALGQKPgeYn1dc6yyKI
	PqvBFhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QjB-0000000DPlP-2Oc1;
	Thu, 17 Apr 2025 15:00:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QDU-0000000DJJC-0Tv3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A29544A081;
	Thu, 17 Apr 2025 14:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321ABC4CEEA;
	Thu, 17 Apr 2025 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744900067;
	bh=nXPVCryDxtAn6n/w1ELFDJIKepg5llxRHEpDLLve16E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MJNx3SfEtkcZpSWEw91YForzmo/avlAyghRcO6mnzhiUHqJ3oAnSRtJVqhpUER13g
	 vZdxgy8swv28AsqkpyrVU55StNGBYo5q6VrRQXzakVRlPWXoHMM0GvBQ3oKLARYfO4
	 4vyXHvlmR+3zidGDs8DeDKR7kTjIusOiUPskl5yEEYSJNNMfLuTlg1Wj6S/QlDeXls
	 NkERlLI1wkg0moGufLGJyw588M7uVxz1/pWMSnkVJ2SVHXfxl94QqHYABLbV67VYL1
	 VFEPYih+o5aQuvLjRsqPxL+Bf6C+sd8Q5gPR0vy/ILOxmNyntRvD24YryVVLRYCPHp
	 Yu9EK8oHBQ2Bg==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	jsnitsel@redhat.com,
	praan@google.com,
	kevin.tian@intel.com,
	ddutile@redhat.com
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add missing S2FWB feature detection
Date: Thu, 17 Apr 2025 15:27:25 +0100
Message-Id: <174488913548.907912.11019680533308808678.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250408033351.1012411-1-aneesh.kumar@kernel.org>
References: <20250408033351.1012411-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072748_169409_79788794 
X-CRM114-Status: UNSURE (   7.06  )
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

On Tue, 08 Apr 2025 09:03:51 +0530, Aneesh Kumar K.V (Arm) wrote:
> Commit 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
> introduced S2FWB usage but omitted the corresponding feature detection.
> As a result, vIOMMU allocation fails on FVP in arm_vsmmu_alloc(), due to
> the following check:
> 
> 	if (!arm_smmu_master_canwbs(master) &&
> 	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
> 		return ERR_PTR(-EOPNOTSUPP);
> 
> [...]

Applied to iommu (arm/smmu/fixes), thanks!

[1/1] iommu/arm-smmu-v3: Add missing S2FWB feature detection
      https://git.kernel.org/iommu/c/45e00e367189

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

