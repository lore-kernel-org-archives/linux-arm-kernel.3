Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F6EC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFcg3D+CQA9BR++mfH+p1kbaPcETQApGzTbRYTZmDno=; b=YjCzDRtuBNqsf04JUwkHuwvFvZ
	rnY9pgMbVZHW1bPr/n9rIkO4WIwAyEVbNsp/EfDuW6A8D4TmNp5dRC+hOZhxNFNOFJQuZrIDg48JU
	ypCVSmnUyTdpsc+Z+NhNtqpHOkzyrGg0NNLxkTnxSRiZal5tFtf/3d3LcCFSFEKJEmlVkiyWuvp2w
	jHic6n5AVBmwcO73lHMo+jHlDaDRqfgwnAQUi3fOIw2pBftRuQLhCvaNKFe5He2b/LqFTqdIT9G6U
	KhOxAv2/RTYAbK8QtdlRwZCtIEoVJhVXdEti25bVjZjlSonReQNmufLc2s5ukakQIUEWdYJsx2Q9Z
	j5rcSPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ql1-0000000DQFq-2kaN;
	Thu, 17 Apr 2025 15:02:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QDb-0000000DJLe-3uam
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:27:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BCD949B99;
	Thu, 17 Apr 2025 14:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85066C4CEE4;
	Thu, 17 Apr 2025 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744900075;
	bh=m5ffm3GL0s490Ji0qAeVsgvxw9sdNIOdZU+SRNY4CGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gALtF2FQhfhGku6VNrV78WL4sU7Eaw2X+uzxniSyNE3QKX6gRro2e6E/F3ZTnm82X
	 UJz+4Al51eWjIIYLAtJiWlDtqo/FF60sQk8JBmp6V1HQQsHngygigVp34t7oGzecPG
	 nTlAoDmMnaLz3dFNbWMzRaMAA4O6FPuan+cOtALnyhtGdygnsMXd+cfJ4wbVwCh5h0
	 1pFGN7giho0jrnLdBYpuUKwxDZqK/j998Jr1FfrXCo8ooe4dd7FqDp29AY8Di/9xPf
	 o2ZASfv839k+sGSCAyqomIfnBzdYgvHVN0jBbknOdSBSxkgecpy298loozyUGqvJH4
	 +jBcPCqaSeqNQ==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	joro@8bytes.org,
	jsnitsel@redhat.com,
	kevin.tian@intel.com,
	praan@google.com,
	zhukeqian1@huawei.com,
	Jonathan.Cameron@huawei.com,
	jean-philippe@linaro.org,
	eric.auger@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH rc v2] iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated stream ids
Date: Thu, 17 Apr 2025 15:27:28 +0100
Message-Id: <174488987895.911007.3600084862328161208.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250415185620.504299-1-nicolinc@nvidia.com>
References: <20250415185620.504299-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072756_123902_5D42949E 
X-CRM114-Status: UNSURE (   5.68  )
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

On Tue, 15 Apr 2025 11:56:20 -0700, Nicolin Chen wrote:
> ASPEED VGA card has two built-in devices:
>  0008:06:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge (rev 06)
>  0008:07:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 52)
> 
> Its toplogy looks like this:
>  +-[0008:00]---00.0-[01-09]--+-00.0-[02-09]--+-00.0-[03]----00.0  Sandisk Corp Device 5017
>                              |               +-01.0-[04]--
>                              |               +-02.0-[05]----00.0  NVIDIA Corporation Device
>                              |               +-03.0-[06-07]----00.0-[07]----00.0  ASPEED Technology, Inc. ASPEED Graphics Family
>                              |               +-04.0-[08]----00.0  Renesas Technology Corp. uPD720201 USB 3.0 Host Controller
>                              |               \-05.0-[09]----00.0  Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
>                              \-00.1  PMC-Sierra Inc. Device 4028
> 
> [...]

Applied to iommu (arm/smmu/fixes), thanks!

[1/1] iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated stream ids
      https://git.kernel.org/iommu/c/b00d24997a11

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

