Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC045CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 04:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pv4ovTiooX+VPVafpuazkD95xgm4rFVM4MV3q2MpFaQ=; b=o05QiGvhr5gnpjsI6pU7MFe0xn
	1lEZh+0o2MWXxeBY+aw9aBGxj9qlMygGlvelAqoTQkAZpeRuF0zXRkOUEmj8v0fx5l9GBS9whCqBC
	z0ylEDlbHdykztExX9o9YfWASDTOxwTzdO7RGHkHxoUliUfwS4Rh7gHgPXrTh8cqp2Kv+Xg3g+Yld
	RBn5QkGzclH/sMaxGW6VRx+yvMN8uSxs4bWTUM0Ovi15Rp2oUT3JAdaSDVmgPET3KlGYoq5xJKKaZ
	wCfGXBgwMpXu3B+98BfDOfyorPMqrgUIoF7kazzIWhpDn2V1SuqkhLybmr0OGnRDye6QKuxCGM95I
	FhLBD0iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBnEC-0000000548k-1Tof;
	Thu, 23 Oct 2025 04:47:08 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBnEA-0000000547Y-14sF;
	Thu, 23 Oct 2025 04:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761194827; x=1792730827;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=toggoyR65FRMD2salpJRgrdbeLvnI/1Ai4wkilIe08M=;
  b=KCvoaAU+SMb3mSAA/+AxYCMrz2PZnRF4oyaXxLhzMkjVvuzOaUsM3Pe4
   +S6XpJ1xTMue91kKwZjDdEMoYOsm9gPkrtuZahyo/BU2a2Pz96LPCGgro
   EeLhHlswv6nj3bky5RVV4tZSlTfiNrmN+F8isGfruPtUODQLgNB34fzNm
   6aMJNEK2hOhJnYg6eJ7++U5Rt0DDeu0zfacoNg+JuPCbJQ+qb1hxTQHW6
   FZ5+I8AY6/v2RgOzB7WxDV4iqNFDQ63NUossfKqt6Z+7gpLaEgdlnOBgk
   gjnJNP5ssys3wPYRjkdZ3IjE2LQvcstQ0A70/QFYao0Vj3Ddj+/eEYhNG
   A==;
X-CSE-ConnectionGUID: LMSZM20lQ5u1HBV5dV7DsA==
X-CSE-MsgGUID: 6ZbF3n4KSq6D73O1IFF2wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63276601"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63276601"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:47:05 -0700
X-CSE-ConnectionGUID: KCuFwfgeQhOOzq78NUB0nQ==
X-CSE-MsgGUID: +WIDlni6TjybQawi0SaEdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="214984355"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:46:56 -0700
Message-ID: <99d27f65-4797-401f-a374-b3fccd67cdac@linux.intel.com>
Date: Thu, 23 Oct 2025 12:43:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] iommu: Generic support for RMRs during device
 release
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, jgg@nvidia.com,
 kevin.tian@intel.com
Cc: suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com,
 sven@kernel.org, j@jannau.net, robin.clark@oss.qualcomm.com,
 m.szyprowski@samsung.com, krzk@kernel.org, dwmw2@infradead.org,
 yong.wu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, tjeznach@rivosinc.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de,
 schnelle@linux.ibm.com, mjrosato@linux.ibm.com, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jean-philippe@linaro.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 patches@lists.linux.dev
References: <cover.1761017765.git.nicolinc@nvidia.com>
 <80bbe9125d90b001f3ce08429704aa4168b0a00b.1761017765.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <80bbe9125d90b001f3ce08429704aa4168b0a00b.1761017765.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_214706_341275_9009F3B6 
X-CRM114-Status: GOOD (  16.66  )
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

On 10/23/25 10:21, Nicolin Chen wrote:
> From: Jason Gunthorpe<jgg@nvidia.com>
> 
> Generally an IOMMU driver should leave the translation as BLOCKED until the
> translation entry is probed onto a struct device. When the struct device is
> removed, the translation should be put back to BLOCKED.
> 
> Drivers that are able to work like this can set their release_domain to the
> blocking domain, and the core code handles this work.
> 
> The exception is when the device has an IOMMU_RESV_DIRECT region, in which
> case the OS should continuously allow translations for the given range. And
> the core code generally prevents using a BLOCKED domain with this device.
> 
> Continue this logic for the device release and hoist some open coding from
> drivers. If the device has dev->iommu->require_direct and the driver uses a
> BLOCKED release_domain, override it to IDENTITY to preserve the semantics.
> 
> The only remaining required driver code for IOMMU_RESV_DIRECT should preset
> an IDENTITY translation during early IOMMU startup for those devices.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

