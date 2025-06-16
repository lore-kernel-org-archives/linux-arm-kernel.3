Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8140CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYsgdfYPwkFFfUZER4aa8Gaph1uOV+oqsaz1eP+b7aY=; b=iGsb8WTyCn+Ooa6jsY0gwh9a61
	NW+X0x5qeWp+/CrgiHa7kP4nScOvYUUE/OUnkFE6dsQufZlm+n1p69OxwRVaCF1EA5K2hwi88bGht
	fXYkoR2pGWJfpicUIHQ/SgGdhptpPOps3OE0fxIhrWgUx2KnMAHweKhRUxCc74LJEzb3+bc8A4En0
	bDixIHehZJhlrirHoTUvOkeTtILon08oNEQMN6DwvZZ3/RRYJrlCA3evb9FSleZLQ0uh5bAILlTe+
	V77Y4/UGUtIRzGhHXpdZsskrHs3TjDTR5gPGuTbShZ5HeXvp5XC33Z2yzoZOAX62Wu/FnlMfg1B3A
	zF66JOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR10j-00000003J0C-1gJC;
	Mon, 16 Jun 2025 03:59:53 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0WJ-00000003GBm-2Iu9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044508; x=1781580508;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3crnHZWWyc6HQi2ObquKyXrIRR65iwUXK5eb9xDLGyE=;
  b=EW9NooF9pmxgluspd83m3qHhL1VOyrOei5pTHRpEfLJZ5XsU5KO+lfBR
   Vh9pyF3JQKs702uPJ1p7//Nm5S60aTg5SOmOukrIFNW7bAe0+4FZqllDB
   rFKAB8xUECVgUrbi/cmt+ZXUT6WKzpdYAe6yjso7VWcMztRtEghk+Kexm
   ZQKUGVOOWhEMj9vDUNjDL1u5bblEvkCMjUgpEr9YTFEufyPnma9U1eOIb
   EUM3O8tPCG8XgNCYkuUTVGmTq7bUHopucpXwfDoEWiXFej7nPO+C4rx4V
   +bBf3cMY4SWNE8suN4D3LMXu4rgSJimiV8+q67zNVP6HOPKAcRreVwBQF
   w==;
X-CSE-ConnectionGUID: P9htaIH2TVeEyKA/sF1fNg==
X-CSE-MsgGUID: KQlkbpBdQ4Kfb1pOcfeTrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69621979"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="69621979"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:28:27 -0700
X-CSE-ConnectionGUID: U7O3D45sRme+/EgWHKETWw==
X-CSE-MsgGUID: aL3V/0EgTX2OJibq0nW3Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="152177197"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:28:24 -0700
Message-ID: <e27acc05-3d31-42c3-8674-4891122ba833@linux.intel.com>
Date: Mon, 16 Jun 2025 11:27:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] iommufd: Apply the new iommufd_object_alloc_ucmd
 helper
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <107b24a3b791091bb09c92ffb0081c56c413b26d.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <107b24a3b791091bb09c92ffb0081c56c413b26d.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202827_652262_5F27D6AE 
X-CRM114-Status: UNSURE (   5.73  )
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

On 6/14/25 14:35, Nicolin Chen wrote:
> Now the new ucmd-based object allocator eases the finalize/abort routine,
> apply this to all existing allocators that aren't protected by any lock.
> 
> Upgrade the for-driver vIOMMU alloctor too, and pass down to all existing
> viommu_alloc op accordingly.
> 
> Note that __iommufd_object_alloc_ucmd() builds in some static tests that
> cover both static_asserts in the iommufd_viommu_alloc(). Thus drop them.
> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

