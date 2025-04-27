Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C38C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxVSZLmMMlgOfOIxDepSNZFctw57sdcS6wy9gTpFJjA=; b=LuqKBkmA5zHCaYwvol1roUxSRT
	5aKTr+4UNfS80NFADuLr5zX7EBogaKZwAdgdB2TlFKDqmz+Kss3lpWQf3TtiwxXOyVM96SoOFXuVI
	eN+b84Mfcc2EeyPjB6tExVWZUGWPjhnJRLEJKHIizpo5rB4iFNMkoY4GMnA5pUbg6kFjWzxr35cfE
	mXjvSbkROSe06/GQylDYJK2RWjAYVutpIvMzLmjZTtvXatFySwYYGLnhr1YrtUrnPXgj1TCyNqVb9
	wfVQSN5IkGuEg7DYvhbP/xTitlGxzdxgA3xNQ+VIvAA8DySIdtaP0CxkNZHbr8Jzw0sGEeT1q2OwE
	2aQCt6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wwW-000000038dw-1ljz;
	Sun, 27 Apr 2025 08:00:52 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vcX-000000030uD-43hA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 06:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745735770; x=1777271770;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nMJQw4mASCaotj7CeCbT8hl1dGmW66KZ98Yv5np3pOw=;
  b=ihKM1lxl/bI/e8pa7J5Gb5VCT2Gi8yY31uKEbcXrWqeaGZEFnajhFVUX
   qHf8dUFS+xku1M+TOeGH2M5pgPHIPtdC8P9Z9WHM8oVeBd0spac3OuImv
   lf9RYIRrzBKe8I8sg+tAXzf9s1yr8QgdngzFB1UBZ+3nsOy+b5a0e2G1c
   IG8Z77zV4FcHWHI5ViiGmk5/BrW+jwCcwHh/mcXHGCRpzBQIJacx4uH3E
   2+o2iANyGUAWVX0+L5aRWJwUuvIPC+FlFXxDm8NfHjf+VN9fXicu2zEz3
   J/xq6OEKnmo2wQ3PF4rE8kVr4WTENlORB1xvKvGlrE+HTgVICcb7aaRQY
   Q==;
X-CSE-ConnectionGUID: bAc8PboaR7ySQoGh21RyLA==
X-CSE-MsgGUID: Rsq4y+o2TM6usg8d1IP0qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="69841272"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="69841272"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:36:09 -0700
X-CSE-ConnectionGUID: mBeNWfFqTZen1E8BpfidTw==
X-CSE-MsgGUID: cmIWTG8QT0iiV/8hqXye+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="138048971"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:36:03 -0700
Message-ID: <e569c927-65ff-4c0f-8922-45e404fefc5e@linux.intel.com>
Date: Sun, 27 Apr 2025 14:31:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/22] iommu: Pass in a driver-level user data
 structure to viommu_alloc op
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
 peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
 praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev, mochs@nvidia.com,
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <f985e2802a50b5867c9d4d3182ae7b4944a989c5.1745646960.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <f985e2802a50b5867c9d4d3182ae7b4944a989c5.1745646960.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_233610_063586_2C2E462A 
X-CRM114-Status: UNSURE (   6.62  )
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

On 4/26/25 13:57, Nicolin Chen wrote:
> The new type of vIOMMU for tegra241-cmdqv needs to pass in a driver-level
> data structure from user space via iommufd, so add a user_data to the op.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

It would be better to add some words explaining what kind of user data
can be passed when allocating a vIOMMU object and the reason why this
might be necessary.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks,
baolu

