Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA5EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDSGQAXNlCwxtlPJI0zfHBp//QvResSHImBedVUbRfI=; b=LoNzXaKN9iKwflwT0Ro/HnvQfA
	s484yKxrXb3gqe245a+TiYR1D/uAqGpgKEevuC2hsktm3bjqNGurtZ2++7n5sBkNl9TbK4wAB/cbz
	UD7p4WjttypoX1upWnVSRGNPguprxBa+UxwSgLfDnuFI/BgXx6e7R8h7YPcgPCpV8X4IPmaPWlrxs
	qVzOsJbZAvk7t8Cn61znfUs4Pmh9fiZH6LOD70JG1mB7IjsckC5GoTZxkfbvhEJOZkbwaFTOOfOLI
	pcYJG7kjvfbuKIVvSndOGtn7LAajtSKo0RSkyqGFIkwIpIyJtYPm4t1swcAOEOCzLjgpyNqFUDaLs
	6grNTeFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0cF-00000003GeX-2E5s;
	Mon, 16 Jun 2025 03:34:35 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0Sz-00000003FKl-1UEp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044301; x=1781580301;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=991ULLpHUbVw9p6UNw/8MBW4ebTq3XFmPrdhOHxLq/A=;
  b=BY8DR0r9uqIzU/TgnOk1ZlXDPOZy+arbvpCSXwXJKMraTPE73XDYCgFv
   IRlm/pwE0lxTkFlsM3BX5e+3/bqEYNkksCV9AnWxtF+jZBeuR3uaQygBe
   C3PNZ2dLc3ejeHjkRR0ohBqfs+9dQIRYVF8aEdF0xho4LuKIHGe6xypFc
   NQEF/v2X7w3jTMw2ZmOJxjo61OonKYZx6lhAIpRXbmBRSe3hvowuW86qR
   hjSIKsMR6HRjo33URH+A1S0osMUZhelUtvvAEZdgAvN7i/UYBSYyDxo/i
   vc1XU/8L3/vMPek102mU2tuEX8hP0xk7S3euDflxTL8aCSLDJHvYJ9+31
   w==;
X-CSE-ConnectionGUID: DMpMirrRRRacKDzZTA+71g==
X-CSE-MsgGUID: BeCylwGmRDCHkTyHJsdL6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62449400"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62449400"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:25:01 -0700
X-CSE-ConnectionGUID: 8eZ9bU/fRcmzJr4K1Owyxw==
X-CSE-MsgGUID: NgfO9NH6SBScxtdx7XBJ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148205472"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:24:58 -0700
Message-ID: <8cd5db54-66ba-4611-8b47-448d3c008a14@linux.intel.com>
Date: Mon, 16 Jun 2025 11:23:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] iommufd: Drop unused ictx in struct
 iommufd_vdevice
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <6cbb65e8df433de45b6c3a4bb2c5df09faca8a7c.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <6cbb65e8df433de45b6c3a4bb2c5df09faca8a7c.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202501_437980_7C248578 
X-CRM114-Status: UNSURE (   5.57  )
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
> The core code can always get the ictx pointer via vdev->viommu->ictx, thus
> drop this unused one.
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

