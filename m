Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC270C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Dte9S5IWAzLh8eHyVjwryVoXkQBlEWABWLNFJpRbeA=; b=xBuP2IxGbGegkWb7pb81xmkXz9
	u76kDv01xMlv/3VVIoEXRs/NJO+t+8taYmuNTvoOrFpLZ2SXnE7xL1TF2GQH6dJukxiZbPfBQv90+
	3uyG+P0COfH1ZIfnKkNiKYD2wlNu7mX/IkTU++084dPXbZeEkx9GesjTWTNGxUxdQct7OIKHxhX/6
	Ob/FOitS61Ej07SJEEYI5iD2o9wBSm+lM3R8yzDCqYd/ocb6ysBolz9MPUgXm5l4MDYMWwRQc1g84
	WH1Gkxh66FqoPn+K7W8Y9iSyrsGTaTTeByGT/gCajx73x3ZT7IK/GT+7+CczptR6SyeZgc6Yqka6h
	QxLM2Z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHH5-00000005Yms-1aM0;
	Mon, 16 Jun 2025 21:21:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHDD-00000005YIC-1KZ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:17:52 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-235ca5eba8cso53335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 14:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750108670; x=1750713470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Dte9S5IWAzLh8eHyVjwryVoXkQBlEWABWLNFJpRbeA=;
        b=GvRnlKbuVfsziN4q+H2DDNmF6GRoNU12k5gUQxLJYP0INKCHnig6jJ79FMCWC+rAXm
         o7XaNSWOuUwBRAKH9ZZ1o2WdGsu3D1sgPWsAsmGl/xTeQW8McXYBvAXjVERgrWcNRmW8
         NFyDAzsuOo/6PPwD8MjnZc4E68Zswr3Sf6yiw4P9NbaFsqKWPQk4Iu9K62wmBRJCI8NP
         Llnol4utx2NIEqdxFydWYHmqTOyneGOs3wXBT3sH+WJo7ysp7LMv2K4I+xI4FhC/SEIj
         mY/1VYrRi8+hGyCDqXmSsSj8vrgPciAVNie4sYva50N/IZti96guHqcEB1H+AYZwNjwR
         4MDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108670; x=1750713470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Dte9S5IWAzLh8eHyVjwryVoXkQBlEWABWLNFJpRbeA=;
        b=xE1UwEVMu0AaaoZVJoq7iSPsxhHme0OBeUbsuoI8A5N653bLo+bkOmNXL6wUR/H5NL
         UquVdQMa9ZHl8b5ANFjwQzvvN8e7ZBMz1z/8JXKB6heMA3ZtNjnXzJYSY5fEqMLOhXdQ
         sNx9aJWpjCvuDHBjws4KnkKFaLZ8aoTX/QSdx6dZ3WmonTnv9BntDT5WWJmO/NlDZx3/
         1a6JVoo+LusBMwPCE1oLZbfYBtXiClAQeo1igjIB6kawYQ4ri1ZuNpa2Wfh9N6vO9lMm
         jMn4T/3mgqsWxqyTvL4rx/b3eQuG6d6/NGUx+9z9devp2rt4SmV56qRA/0KD+KBAQVJz
         PHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+NOkWihGAeVNsGocA6T0Gwws/8N8FXz6CMci054ULSassBpIi+0lsZKX8IEtGN672VPBJn7vRVb3HduZhMj38@lists.infradead.org
X-Gm-Message-State: AOJu0Yxued/yu/mH+46P9QYDNGO/1I3jWwLIzlvYmLP+hLg2Sqv7bvQc
	DyhHNH1AX7medE9AYaLUoFT3hQhpNFMxs/d50h2aYil5mF2quVJJP//kXtqoJ104XA==
X-Gm-Gg: ASbGnct5dSrdi1Z8bY+O0QS0ef5u2o/9fmgmtQBbgBWomYoOBn8vvZj3HZZCgNRL1BC
	Td2Ba9FC/wN4oMRGE6DSKJZZ5wWo/Seu7c/9rgi1SthTeJg53bztLoRXCmPCOpHi7/Ve5eE6hRM
	Kfoco927EkHVEY9C0YT7cAOaRdPCf26q3zYztvFytjUngdZeshr2Hc3H3bZdCurGMLk0rVTnDPg
	XkehuYH3iZNsknj8Nxj0xox59fNAQ3giI5fTAvA5lsEwqV0nKVL37ZcK4lrPPS9PczLJhvnhIV8
	vL/VaQIcqv3rJs4KNmgsKi3o9HJLKkFbK9rSQgH5V9TQje+xVJ/ROWpcwZ7VoSuFSl5xAeooUZ0
	ry+08X0fyfXVIfIxigYyO
X-Google-Smtp-Source: AGHT+IGAzwl1QJPvA++EDqwFMKyBsCjjEWjJhBE98c+aEAA11TrriZ5qleZr0s+YLMW9x0aRwxpKcQ==
X-Received: by 2002:a17:902:f54c:b0:234:48b2:fd63 with SMTP id d9443c01a7336-2366f0099e0mr5348025ad.21.1750108670083;
        Mon, 16 Jun 2025 14:17:50 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900cc047sm7614113b3a.147.2025.06.16.14.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:17:49 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:17:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Xueqi Zhang <xueqi.zhang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Ning li <ning.li@mediatek.com>, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 2/8] iommu/arm-smmu-v3: Add SMMU implementation
Message-ID: <aFCJ9IuzC1Rx2atk@google.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
 <20250616025628.25454-3-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616025628.25454-3-xueqi.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_141751_350382_6E1F96D6 
X-CRM114-Status: GOOD (  28.12  )
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

On Mon, Jun 16, 2025 at 10:56:08AM +0800, Xueqi Zhang wrote:
> Mediatek has its own implementation for wrapper interrupts and
> power management.So add SMMU implementation when smmu device probe.
> 
> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
> ---
>  drivers/iommu/arm/Kconfig                        |  7 +++++++
>  drivers/iommu/arm/arm-smmu-v3/Makefile           |  3 ++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c | 16 ++++++++++++++++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c | 13 +++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c      |  3 +++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h      |  4 ++++
>  6 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
> 
> diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
> index ef42bbe07dbe..a7f98fd0f2bf 100644
> --- a/drivers/iommu/arm/Kconfig
> +++ b/drivers/iommu/arm/Kconfig
> @@ -88,6 +88,13 @@ config ARM_SMMU_V3
>  	  the ARM SMMUv3 architecture.
>  
>  if ARM_SMMU_V3
> +config ARM_SMMU_V3_MEDIATEK
> +	bool "ARM Ltd. System MMU Version 3 (SMMUv3) MediaTek Support"
> +	depends on ARM_SMMU_V3 && ARCH_MEDIATEK
> +	help
> +	  When running on a MediaTek platform that has the custom variant
> +	  of the ARM SMMUv3, this needs to be built into the SMMU driver.
> +
>  config ARM_SMMU_V3_SVA
>  	bool "Shared Virtual Addressing support for the ARM SMMUv3"
>  	select IOMMU_SVA
> diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
> index 493a659cc66b..0670065d6e9a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/Makefile
> +++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
> -arm_smmu_v3-y := arm-smmu-v3.o
> +arm_smmu_v3-y := arm-smmu-v3.o arm-smmu-v3-impl.o
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
> +arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_MEDIATEK) += arm-smmu-v3-mediatek.o
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
>  arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
> new file mode 100644
> index 000000000000..d39587b965ef
> --- /dev/null
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Ning li <ning.li@mediatek.com>
> + * Author: Xueqi Zhang <xueqi.zhang@mediatek.com>
> + */
> +
> +#include "arm-smmu-v3.h"
> +
> +struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu)
> +{
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3_MEDIATEK)
> +	smmu = arm_smmu_v3_impl_mtk_init(smmu);
> +#endif
> +	return smmu;
> +}
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
> new file mode 100644
> index 000000000000..381268968185
> --- /dev/null
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Ning li <ning.li@mediatek.com>
> + * Author: Xueqi Zhang <xueqi.zhang@mediatek.com>
> + */
> +
> +#include "arm-smmu-v3.h"
> +
> +struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu)
> +{
> +	return NULL;
> +}
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 10cc6dc26b7b..d36124a6bb54 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4754,6 +4754,9 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	}
>  	ioaddr = res->start;
>  
> +	smmu = arm_smmu_v3_impl_init(smmu);
> +	if (IS_ERR(smmu))
> +		return PTR_ERR(smmu);

I'd suggest adding ops to struct arm_smmu_impl_ops and use them. Please
see how Nvidia's implementation makes use of `arm_smmu_impl_probe`,
maybe we could improve that function to handle mtk smmu as well.

>  	/*
>  	 * Don't map the IMPLEMENTATION DEFINED regions, since they may contain
>  	 * the PMCG registers which are reserved by the PMU driver.
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ea41d790463e..99eeb6143c49 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -998,6 +998,10 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  				struct arm_smmu_cmdq *cmdq, u64 *cmds, int n,
>  				bool sync);
>  
> +struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu);
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3_MEDIATEK)
> +struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu);
> +#endif

We'd prefer to avoid implementation-specific #if CONFIG_* across the
driver as much as possible.

>  #ifdef CONFIG_ARM_SMMU_V3_SVA
>  bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
>  void arm_smmu_sva_notifier_synchronize(void);
> -- 
> 2.46.0

Thanks,
Praan

