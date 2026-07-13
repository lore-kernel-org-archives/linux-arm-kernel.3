Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF7EC44506
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 06:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cMw6jjBdXha1/BZme9QBu0fJOFMg/vqlm6JiXHnv/M=; b=ammRNI5znYGNucLGTOK5r5KXcH
	WA97W4q0r1CejVnzOiMN4mDP0MqbvJIVi8HCIrhaBOXNbxipn+yzIN76vZQ7hOxn2pwgA/o4UGN54
	4kecwvrVvMQge1SZy4VzpisCZ28Wap4QhCZNxu72Hz/wDvOsqG/0R8BtVtySrfvOhRd/fkNBvz94f
	iLsAc7oK/T9iYtFMJys9XKDRtR3k7ZnATKu0reTE6nPbgcRnnkwXKmUZsTICJANyGt2dTLg2tLaOi
	osRlvAn2tdkZQmovrzyzvMFQ489q8wpN96Ntnxx1IcJzGqrYC00GLJ/5yRImvxyfRZmG0cdSERCto
	ZmQhoK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9iO-00000008Bm4-2mPq;
	Mon, 13 Jul 2026 06:00:28 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9iK-00000008BlQ-3HOG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 06:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783922425; x=1815458425;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kEnXfjp0fB+NOAyrqx57XLwA3+Z7s1TSVi+KYTvMoLU=;
  b=HoHuNKbBQIMWvYsJW+uRdlg0sxLIKIR64MrzlHBp0+EUwLWyhpZuYedG
   LHb/J6hkYOW75xQuTybaotyrNN32nEIyWVYE0nACZIEarDKzdaM0QyRr4
   H6wy3sCusg/dyInL8I6mQrXNiXpqx+JbgeOUW42Evs7sr/0iyTi9L0eTT
   UTThrAekEZTZHO5TmygZmKweZWUDS/nnxEoWqgQf/Pzk2tX+6cLx7Jukv
   0sfLYqtyWJ3EvoPM0By7FUGpnomkRl/scTP826Z73hhMhLH92Vx3/XP9Z
   ZL3kwFg/MClCuX8A/IA/ZJzfb2OU1S+NN967/qnDeDlgiz7+0p76uLHU5
   g==;
X-CSE-ConnectionGUID: +4PDWsLMTA2wuHgBdpQ4gw==
X-CSE-MsgGUID: xgumZn5zSp+af5fa2Je1+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84542323"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84542323"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 23:00:25 -0700
X-CSE-ConnectionGUID: jOjIs9VrR0moXBKd2/0f0A==
X-CSE-MsgGUID: fNwrl5MnRh+AXC654m1byw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279863040"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 23:00:22 -0700
Message-ID: <6e3e3279-fcf0-41a8-92c6-f533d1dda422@linux.intel.com>
Date: Mon, 13 Jul 2026 13:58:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] iommu/vt-d: Convert nested cache invalidation to
 the core array loop
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1783539724.git.nicolinc@nvidia.com>
 <15bf2bf57e7bca35fdfd8262d2524026bb7574d3.1783539724.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <15bf2bf57e7bca35fdfd8262d2524026bb7574d3.1783539724.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_230026_204887_36F940D0 
X-CRM114-Status: GOOD (  11.27  )
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

On 7/9/26 03:44, Nicolin Chen wrote:
> intel_nested_cache_invalidate_user() used to walk the whole request array
> on its own, copying and then flushing one single entry at a time.
> 
> The iommufd core now iterates the request array itself and re-invokes the
> op with the not-yet-handled sub-array, so handle just a single request per
> call out of the front of that sub-array and report one handled entry via
> the array->entry_num. An empty array keeps returning a success, used as a
> probe of IOMMU_HWPT_INVALIDATE_DATA_VTD_S1 support.
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Assisted-by:Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/intel/nested.c | 54 ++++++++++++++++++++----------------
>   1 file changed, 30 insertions(+), 24 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

