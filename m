Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A70C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn3VVgvObyI+qkCqCFYm4bgi+lg8z0xT57C03hABEcE=; b=cgdu01fTBdQM6ROUFVUAUvm748
	fSnW2dMYLXnCocqqzeig426OH54wISIEtXUcdEZNBDi7sZgm3/IUrXopvBTodqyWXouEDWu7zaYQv
	/lRhWh8UU6jUP9n6V+3ENsUl2Hbg201OKyYyIDcevSJZNKQQKX2AxgeDfOHK0L3fpPwmgDOJglqEE
	DHf4g/GsiAinnP6peF79nNGUWMtzj4uN0+D/TCZms97+ls2JCO9viz056X7fj7ed+/VVmzOrmAxyx
	L3ortevmXdoR0Abs9Ak4aj6Sk6EING/WyWL5m4mfNMNuzhSAC/+qxpdaHZJNejowSgWqlhp3V01aK
	k+xLkMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8w3z-000000034Gz-0XEp;
	Sun, 27 Apr 2025 07:04:31 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vjp-000000031yG-20rt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 06:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745736222; x=1777272222;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Avkh+IHRFhmXquqMCTj0xnURVEaMs2AVp7RorDHEx4U=;
  b=MtNBnlrod1lCOiqBmmR4435x00jIG7QQVsbroKMOsieuErTCLfdFDC+7
   h4XFAsUyzDiVzs24sK62lizR8Z4oVvXWwdjRFAxHgD2g89UzaaQSlC/1+
   LiiW9cNphl/CSoWD0r7QYQq2oeQH470ONbE3DfOOj/ggHnU5MSecJPVpD
   +5iGtexoCiuGObh0K2o5479Y/Wnp9c477IwbhgY7iFU3t+mUO001L9c//
   GP2lAc+3r7L5IFwF4Yir6oOSJZw3n4poxsLtV+H7PNXupH3nBtkk7Alk7
   twFqcXtXzQxTjpm1N6TVyQOR3EjCxs7s938Fqfx6is9RQEvtYlPJhWiPi
   Q==;
X-CSE-ConnectionGUID: JGycfkr9TemcWmOGCzwNSg==
X-CSE-MsgGUID: dqivM0RhToq4PttK0U17/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47430910"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="47430910"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:43:41 -0700
X-CSE-ConnectionGUID: nlUKeu2LRMaehOEljfFcBQ==
X-CSE-MsgGUID: RSaSroJwTzy9u9o2IB/EVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="133732043"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:43:35 -0700
Message-ID: <6dc981fd-f093-48fc-a162-4e4e989c22f2@linux.intel.com>
Date: Sun, 27 Apr 2025 14:39:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/22] iommu: Add iommu_copy_struct_to_user helper
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
 <ca032e90c0241fe0653023fcb655185dba763f5f.1745646960.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ca032e90c0241fe0653023fcb655185dba763f5f.1745646960.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_234341_559311_FA048521 
X-CRM114-Status: UNSURE (   5.68  )
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
> Similar to the iommu_copy_struct_from_user helper receiving data from the
> user space, add an iommu_copy_struct_to_user helper to report output data
> back to the user space data pointer.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

