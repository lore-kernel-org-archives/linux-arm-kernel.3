Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B885DCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIHQREHt+l8XAscKxuWlR1jje62LN0QUhsJTrFrmIjQ=; b=ZaF0XCgl5A6Lst2B3Db8TYZ6AB
	bVi8kkWBdcj+GFDr9btJO2AJQiLpRYjnPgXGiPug/MXQUlCPT3+xSYcDTzKwGHL1lkgAmmXgmdeSR
	zJswvMTQI1L6sHuvLJhQQIHTQGRoiAgd2+OBO3YaIVHOj0DHpcRpOcyIH4fw/95nb/wpFSDp+bGA1
	Np1NllV8HyeqMDzz//AVjJ4zB8TwPxe/OUCjfcNFovuWrKa69H/T8U7g11u9e7eeQNbq3jN/6f91F
	tgYoDalAPqw9BxbX68ZNBqiU78xz5ssSILvpaQRRPJHQwBYvJXuFv7+OAz7f0ZBv+pR99kGEqlWIK
	DauUUIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMlb-0000000Dwee-2U8K;
	Mon, 27 Oct 2025 12:56:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMla-0000000Dwe5-3yOE;
	Mon, 27 Oct 2025 12:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZIHQREHt+l8XAscKxuWlR1jje62LN0QUhsJTrFrmIjQ=; b=juO0dUTBltU0F29M+2/0hv7+zR
	JnMnagQ/Pql/OnX1CQO3nVEHbd+Mj0oCk06NXwDMu0SmIXTwcgxNdK/qHyfNTWvDHnpgtVkwzr+14
	IcblOw1H3qCvrOTVEwnQwGWc1gUEeV+fuhEbtxv94eaKjcloIfygcNj0e3cUO9M1F3oYbphK+14XB
	rcbI6DLkhqtQqa2AcHke5TaB01Wsu/1O5hmBuJHH9xiBMylXHQYxiCf3OJQMDyu0QrO+7fNfXtG/Z
	3B3ZMJM/aSo9Ai0jXp7anvz6MNK0s5fWphxyDVKilDbZRI8B0pSrbJbgjEMp0Q1W3GZ/04sDikY2O
	/DEsFJAg==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLti-000000026oQ-12nZ;
	Mon, 27 Oct 2025 12:00:30 +0000
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 574F959993;
	Mon, 27 Oct 2025 13:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761569756;
	bh=wdPrvvPNgCJ92pfYnd82XapNMb2/K9Lk7SnMdXsPwYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HA4IsI57/crRJKm5huZnz2yM9cueuQ83JrqqF31F0g7mwiTfeSnd43x0jF6LZthZc
	 xInJr7Dl8APiu4Qf/1dKwgAOW7EJNTBxKaqeF3SCeMWstoORITwx7nsvUeINWh5k+9
	 Ny8WfW/m0sLSzi4YzjffMfU5XZZBpghT634JsVKbHjtinJ84F0IqokpBXMlZ9vPJO6
	 HareDmhYXldiDUpmdDec87KCRVmJXWOlsHVldVZQAV6o+WAdhsPOkS6ZLKvwvFxjCx
	 iZSNYPT42T4jbU1r7D4nVssf6XfXSjG7/V3tsl+vP1evUijU+Z9RswofRmqxeAExhN
	 NJmXcf6NEl0nQ==
Date: Mon, 27 Oct 2025 13:55:55 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, suravee.suthikulpanit@amd.com, 
	will@kernel.org, robin.murphy@arm.com, sven@kernel.org, j@jannau.net, 
	robin.clark@oss.qualcomm.com, m.szyprowski@samsung.com, krzk@kernel.org, dwmw2@infradead.org, 
	baolu.lu@linux.intel.com, yong.wu@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, tjeznach@rivosinc.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, heiko@sntech.de, schnelle@linux.ibm.com, mjrosato@linux.ibm.com, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, wens@csie.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, jean-philippe@linaro.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v2 0/6] iommu: Pass in old_domain pointer to attach_dev
Message-ID: <xlu227m6u3wubnexhxh2cpx7nwudhvbmgqcqoas57a6sqgvege@p4s5i5p77v7a>
References: <cover.1761017765.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1761017765.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_120026_334931_230A6645 
X-CRM114-Status: GOOD (  10.37  )
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

On Wed, Oct 22, 2025 at 07:21:03PM -0700, Nicolin Chen wrote:
> Jason Gunthorpe (1):
>   iommu: Generic support for RMRs during device release
> 
> Nicolin Chen (5):
>   iommu/arm-smmu-v3: Set release_domain to arm_smmu_blocked_domain
>   iommu/exynos-iommu: Set release_domain to exynos_identity_domain
>   iommu/amd: Set release_domain to blocked_domain
>   iommu: Do not revert set_domain for the last gdev
>   iommu: Pass in old domain to attach_dev callback functions
> 
>  include/linux/iommu.h                         |  3 +-
>  arch/powerpc/kernel/iommu.c                   |  5 ++-
>  drivers/iommu/amd/iommu.c                     | 21 +++------
>  drivers/iommu/apple-dart.c                    |  9 ++--
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  5 ++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 31 ++++++-------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c         |  9 ++--
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c       | 11 ++---
>  drivers/iommu/exynos-iommu.c                  | 11 ++---
>  drivers/iommu/fsl_pamu_domain.c               | 12 ++---
>  drivers/iommu/intel/iommu.c                   | 10 +++--
>  drivers/iommu/intel/nested.c                  |  2 +-
>  drivers/iommu/iommu.c                         | 44 +++++++++++++------
>  drivers/iommu/iommufd/selftest.c              |  2 +-
>  drivers/iommu/ipmmu-vmsa.c                    | 10 ++---
>  drivers/iommu/msm_iommu.c                     | 11 ++---
>  drivers/iommu/mtk_iommu.c                     |  8 ++--
>  drivers/iommu/mtk_iommu_v1.c                  |  7 ++-
>  drivers/iommu/omap-iommu.c                    | 12 ++---
>  drivers/iommu/riscv/iommu.c                   |  9 ++--
>  drivers/iommu/rockchip-iommu.c                | 20 ++++++---
>  drivers/iommu/s390-iommu.c                    | 13 +++---
>  drivers/iommu/sprd-iommu.c                    |  3 +-
>  drivers/iommu/sun50i-iommu.c                  |  8 ++--
>  drivers/iommu/tegra-smmu.c                    | 10 ++---
>  drivers/iommu/virtio-iommu.c                  |  6 ++-
>  26 files changed, 172 insertions(+), 120 deletions(-)

Applied, thanks.

