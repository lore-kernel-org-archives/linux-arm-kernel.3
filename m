Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10372C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3Jv+Ym6XC16+qbT0c+rbBLSzS6zy3ypEI3AH9mVxzo=; b=fSd1EmuhApxinUUucq+Kb8fCQ8
	1MiT1e4wdolRqkaQtdUiXQswZdf8VhUvhnpaiiqNfXNgdyyIP4DQ90fw6ntS2W6qTaA4+uwzhbnd3
	2eTI+B9Am0qXYU8vc6bJpNsW2CrZC4ZBCWQX2ikNoyv3s36vxnLWPXXbcrH5DU3US5GYnrFNht0aJ
	Dyl+slWBUEPzhMZ/G/Q4cc0tvFp6nbJO+YECNwqnrFWzyJESIaQeswsiwCdVogMDySvao41cb89OT
	mGXVYMdNBnkRjn/EEUwx54n8B/McqsMy/+WELt/57BCifkCXVI/js3WEBBVeBg1QLaQEc8Irrgsw2
	xz7awewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHqz-000000025gi-3GMO;
	Mon, 14 Jul 2025 12:00:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHlZ-000000024ie-02cO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:54:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6771946094;
	Mon, 14 Jul 2025 11:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD155C4CEED;
	Mon, 14 Jul 2025 11:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494080;
	bh=s30ogQNg7+t3DT3jncsWas73gVTu/R4j2XfZEk/UahU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rus0z6Zl2R0JiqCD3y0kom8nyUws2FK02SCF6zkdTJ6biQU/FP7vHWrdI8/+gE45A
	 OEeJopDgP3CBKZ4lzJEO+6ZZuWGnx6AWTfV4aJJSglPjh7spRwYeuRShKRYJOqCfDx
	 TL9hZtlSa036H+OlD3/IUMIAyiGiQEKX5JNI9EFK3oEA6Pu8MvLsGORTaaZBAKSWqb
	 qA0eemmBUKwSR8mdKpJ13aLsT8fZOvlyNE3laAy4ndnOvliQK4/GAcfvwHN+UEyrpd
	 a+Hrin/w2cCaAnAquRGJVY09hPR1UKKsaNjo+Fdq5IQHVuk0BdEYa4tssF0/mBjDXe
	 nCAWhtdRRkTag==
From: Will Deacon <will@kernel.org>
To: robin.clark@oss.qualcomm.com,
	robin.murphy@arm.com,
	linux-arm-msm@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
Date: Mon, 14 Jul 2025 12:54:27 +0100
Message-Id: <175249142645.1452379.7552857097102932534.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613173238.15061-1-alexey.klimov@linaro.org>
References: <20250613173238.15061-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_045441_071384_73B05814 
X-CRM114-Status: UNSURE (   8.18  )
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

On Fri, 13 Jun 2025 18:32:38 +0100, Alexey Klimov wrote:
> Add the SM6115 MDSS compatible to clients compatible list, as it also
> needs that workaround.
> Without this workaround, for example, QRB4210 RB2 which is based on
> SM4250/SM6115 generates a lot of smmu unhandled context faults during
> boot:
> 
> arm_smmu_context_fault: 116854 callbacks suppressed
> arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
> iova=0x5c0ec600, fsynr=0x320021, cbfrsynra=0x420, cb=5
> arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420
> arm-smmu c600000.iommu: FSYNR0 = 00320021 [S1CBNDX=50 PNU PLVL=1]
> arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
> iova=0x5c0d7800, fsynr=0x320021, cbfrsynra=0x420, cb=5
> arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420
> 
> [...]

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
      https://git.kernel.org/iommu/c/f7fa8520f303

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

