Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9F8CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 05:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVi+SMQpaF6yHsX8HGJ1IoRGDVppUsAV0LuGQp56B6g=; b=yTM7wPBMpc+fk3FxbNBkf+QdFX
	WWiRrb5JuH9J4bvmxP8OOoDPt4AcDf3IavYfqz2DJ7qBtQwW1kUOSrgqCr7/xGzXDxl8M3Dkw4Hra
	QbViC8T5h0JASzyxZOaV8qrmHlX52BirBbuykb2jAOroOY3aIL/ksIM3DarkagXzdlOq/G6ezodrM
	NngbN5Xup+bk31eoqdRR0WW+Jh5+JE0EhUJOf/iASPYv3YN3KCHvRv73duOMF9jweqzjY88m02Ejz
	DS9nyK2CD1/hIQAbFEgu/CnqdQDqUf8E0vjrGOInBTotNipequ4fs2xsnBVHzqFi1ZVD1oCL2WHMW
	sIuXaahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBnbE-000000056r8-2zw4;
	Thu, 23 Oct 2025 05:10:56 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBnbB-000000056qb-10Xp;
	Thu, 23 Oct 2025 05:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761196253; x=1792732253;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aKhXAgLHi9hmESNfGrTuSyyU3uGYkrJW93/qzCuJl3Y=;
  b=XyUe4s64+b7dZcsClpFC1fa205noo/qwh3aN3L1RBLhOHJQcyG656Buz
   yVubKU55OQHpWJuZuIsJkN/4yiruiXLu40vCHKGscXOzWi6Luddzfx7mi
   kaiM0atmSkTE4A0OFMf6yd+C7nwzimVfJCywj9BDj7O90ulr85P9hOaRR
   RP+0dFiERSuLYyI8bmApFtEqCxtaFiAu2OnGr8YmAEz2Osa8LUM99Cn9a
   1s7TXhPQtB/USuaNqfD/YG4lCklz27wwodVP1L/eu6I6hKVw19UzFDuaE
   fmr0ND7GNaiq7hN8Xd77wn5fc9QQ1qQGjb1qvgs/vwzHg1S8n7bZJkauW
   w==;
X-CSE-ConnectionGUID: Vf5ghi0tQQWGgIzwidoVaA==
X-CSE-MsgGUID: Gm0cOGUAROuJKDK+q0y9Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63249084"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63249084"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:10:52 -0700
X-CSE-ConnectionGUID: Z+VhdaUHRuSq6XPL/6mgHA==
X-CSE-MsgGUID: PVLbJFWUT5qWiIesV7OmAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="214988427"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:10:47 -0700
Message-ID: <9292db0f-74cd-4ce5-8797-cc2a88449768@linux.intel.com>
Date: Thu, 23 Oct 2025 13:06:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] iommu: Allow drivers to say if they use
 report_iommu_fault()
To: Jason Gunthorpe <jgg@nvidia.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Christian Benvenuti <benve@cisco.com>, Heiko Stuebner <heiko@sntech.de>,
 iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Leon Romanovsky <leon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nelson Escobar <neescoba@cisco.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Robin Murphy <robin.murphy@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>
Cc: patches@lists.linux.dev
References: <3-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <3-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_221053_496792_9376B476 
X-CRM114-Status: GOOD (  13.09  )
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

On 10/23/25 01:12, Jason Gunthorpe wrote:
> report_iommu_fault() is an older API that has been superseded by
> iommu_report_device_fault() which is capable to support PRI.
> 
> Only two external drivers consume this, drivers/remoteproc and
> drivers/gpu/drm/msm. Ideally they would move over to the new APIs, but for
> now protect against accidentally mix and matching the wrong components.
> 
> The iommu drivers support either the old iommu_set_fault_handler() via the
> driver calling report_iommu_fault(), or they are newer server focused
> drivers that call iommu_report_device_fault().
> 
> Include a flag in the domain_ops if it calls report_iommu_fault() and
> block iommu_set_fault_handler() on iommu's that can't support it.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c   | 1 +
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
>   drivers/iommu/iommu.c                   | 6 +++++-
>   drivers/iommu/ipmmu-vmsa.c              | 1 +
>   drivers/iommu/mtk_iommu.c               | 1 +
>   drivers/iommu/mtk_iommu_v1.c            | 1 +
>   drivers/iommu/omap-iommu.c              | 1 +
>   drivers/iommu/rockchip-iommu.c          | 1 +
>   drivers/iommu/sun50i-iommu.c            | 1 +
>   include/linux/iommu.h                   | 3 +++
>   10 files changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

