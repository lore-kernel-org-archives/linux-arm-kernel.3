Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18FFC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 02:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhAb2mT+fyT8upg5XD0EI120EbN8Z5ps/VEsYnNlyR4=; b=dobqDdNYPBfrA+grT/Oaqo0bYU
	pQsBrGESpdi2UvKVIKEvJl/Yog813EsWmHwml9AzixpSOrcPWzo+uXrREWY1KdW05B2q5mA04c8I0
	wqqJwW02GwwyC/bg7s5T65BLszBgQtQ/lkdHN3xGNXI+oM8Bm88g2jneVwoptcsXJapDjT3GbgSnw
	o81PD8o/R3ZWAg/BgSnTCuMRiA3Z85d8eEL2T77a6UXTuk22GenjGnTlCT7JeBR+gEDqMorRR9m5R
	qQKHCSU3VLMH4cnCP/cdfILDib8HnLuNKuq6YTWAmcU/rDc3Iy+Zx8lWyMQMko3h7CdPHgjx3YRk6
	/+4KnA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xNk-0000000BWwR-3pdM;
	Wed, 30 Apr 2025 02:41:08 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xLN-0000000BWiQ-1hn3;
	Wed, 30 Apr 2025 02:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745980721; x=1777516721;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=z6s3YPMqRWDP6hk7iOLyjE8AjXiCVoO/HzYvSsyvfgc=;
  b=jyBh+egfB5TtqaKouTV8ZdiPsvsTM9tLTelFFyJzbIyXKWvBNmw6LHFu
   /XrujNg+DBlAfcpFY/zzaHSz8+VFcKvXr1Nz2o3rQJzwIUMa0TVgkmseG
   egZx7XybZcfw13PRVCFzqM5QFgIU6KvVP0Ga8Faa17pGd0VxOtIOQ85P4
   vT3El3l/hk+MyU0u7A8BlF3DkeoOo8yjABbe+xc2PgNU7hVlllRZ42NWA
   i7VoDwgCGCF5w4IvXm0/tnH1q90UlQMKYl0u5EMbEmUajj5RYUA/BCWDd
   e96NrAdmtt/frkYGwJvDgNYyNvhichLK28Iy/5XazLujbpKt2HLsvmI+s
   Q==;
X-CSE-ConnectionGUID: dFWLqJvjTC+yp0WYgR/6PA==
X-CSE-MsgGUID: IkxIIHdrTFCEvPvAwR5CpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51445366"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51445366"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 19:38:40 -0700
X-CSE-ConnectionGUID: x1GszayAR3umhh+jpQ6E4A==
X-CSE-MsgGUID: PISqLkxoS+KMge4QNm3Eqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134508627"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 19:38:26 -0700
Message-ID: <75c7d479-5310-4e1d-bb0e-71ea363fcc90@linux.intel.com>
Date: Wed, 30 Apr 2025 10:34:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] iommu: Remove ops->pgsize_bitmap
To: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>,
 Orson Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 virtualization@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: patches@lists.linux.dev
References: <7-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_193841_534899_29A6D662 
X-CRM114-Status: UNSURE (   6.20  )
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

On 4/29/25 22:34, Jason Gunthorpe wrote:
> No driver uses it now, remove the core code.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

