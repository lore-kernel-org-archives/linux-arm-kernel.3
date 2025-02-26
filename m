Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED99FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cshg6WNO8dNyeiZbpWzhAb3pkA8xV8ESjXnvdsEBetE=; b=HeFL3wl9nJwuTaa2wQ1qw8FUSG
	8wxMRlb4bfE/p1UFMz7SvMCE6N75cXdTopY09yGM5x0XL4+RkNWwlwWdqNlE0at1qHZsqSje3g1xY
	uKtYUGvTxus0CkUX8YhuBCsv3dCFGsrp2B6f8Rp0wnXstzOrXg7NYzz4+tWdpZJeljsS9w3WoBxvA
	j+zF/Hv1CDm69ifQPeubsrmPrtym8WmmtpKgbc6YOvESkMtBtJ6JT/1WWfLk9kqROhyAYkWFsOHQE
	84XNWqhB40I4YWSGIAN6/Dp1t4s68JYZr2X2dfipQST1bQAUcw+VC068CTQuCZliB8u+xRahTin+V
	gdvyBCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBU0-00000002dXx-0dio;
	Wed, 26 Feb 2025 07:05:28 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBOa-00000002cNC-0AI7;
	Wed, 26 Feb 2025 06:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740553192; x=1772089192;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qpSxoD9rlSgkQH/htkteQeAZ4TqZJLdpOv+rX9TDkNo=;
  b=eKrBksxETGmj1EewkXS89AmkxqkegYLPwOPxZLOazAsfjFolAvbxyqGQ
   S/+kcjbRK1U+qIwacgNfKP+rlG3PitcOQpG1jCXF5F2ClNEfS5cNKDC2v
   6CyDh25dL5h8cykjvJmOQY49h9Yx/V4mJcPqXleX+3ZEQidaQBN69MIFg
   pRYNYsDdqRt9HpgigblRIYajaGS/K8FKzLgYCLCYTwp417QMSTe8sm3cO
   fL2iAOAOAofvUFzcbEcZCtP45pl4ZPXJPPVo+UDvis4LhwiozW7aqEzUs
   eQ9zhmOUKezMpK0FUKxkJ3u4eS0BHZD1BiVFpZ8D4r+R4NGm1K5qLkrCx
   A==;
X-CSE-ConnectionGUID: ftEe/tgKQh6NFVWSL88F6w==
X-CSE-MsgGUID: huzg653cSRyL8c/GXZFLcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="51596081"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="51596081"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:59:52 -0800
X-CSE-ConnectionGUID: gU9ME5xMS/Sg/5K4xpwzVw==
X-CSE-MsgGUID: pqpzR+GkRgCwrPW8n3kWtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116621933"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:59:43 -0800
Message-ID: <6d9ceeb5-581e-48e8-a5cc-100a9699a9e8@linux.intel.com>
Date: Wed, 26 Feb 2025 14:56:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/23] iommu/pages: Formalize the freelist API
To: Jason Gunthorpe <jgg@nvidia.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy
 <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <9-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <9-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_225952_124753_8408FA8D 
X-CRM114-Status: GOOD (  13.03  )
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

On 2/26/25 03:39, Jason Gunthorpe wrote:
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 38c65e92ecd091..e414951c0af83f 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -326,6 +326,18 @@ typedef unsigned int ioasid_t;
>   /* Read but do not clear any dirty bits */
>   #define IOMMU_DIRTY_NO_CLEAR (1 << 0)
>   
> +/*
> + * Pages allocated through iommu_alloc_pages_node() can be placed on this list
> + * using iommu_pages_list_add(). Note: ONLY pages from iommu_alloc_pages_node()
> + * can be used this way!
> + */
> +struct iommu_pages_list {
> +	struct list_head pages;
> +};
> +
> +#define IOMMU_PAGES_LIST_INIT(name) \
> +	((struct iommu_pages_list){ .pages = LIST_HEAD_INIT(name.pages) })
> +
>   #ifdef CONFIG_IOMMU_API

Any reason why the above cannot be placed in the iommu-pages.h header
file? My understanding is that iommu-pages is only for the iommu drivers
and should not be accessible for external subsystems.

Thanks,
baolu

