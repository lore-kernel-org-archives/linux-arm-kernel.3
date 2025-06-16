Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80582C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8glTIva3JoqvLATk7rq2HIJCll8Fya4oLoNagexDVI=; b=T2Cha2rQQRJmG4jn+CnEyh90TM
	PxHiAj03PSP8pCoQHrN4cDmYd4HMoNjLzHYlamnSdr8W912ivgWi0skei0XHo5QQzmZD3FSwiTaa0
	DCl3YzkInESuVoCljLHfBX5qb3uckhHyogcFzI1owsayNxbfOOvYSIfh3VXHvXlW1fSqALlX8ddpm
	OqIvEsFXMTQfUi+U5tYtVTjBg0q7k+a8S+k9GTGXpWyX2e2biwxn82pf+7371HOzxSvxPPDSC3Fy2
	H0wnBUCtdVRP0wlbb2ysgrCdccWs6Vczh6k0Aq3R5VnmMMju4F4R+oHD404lZ9rPZ5Jnmt4+b2EDf
	e3SEiC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRACQ-00000004b2Q-28Pj;
	Mon, 16 Jun 2025 13:48:34 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Q9-00000004G8Y-25oj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750074877; x=1781610877;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a4308r24XGn+BMFT+GUDp6JTrDSZTiUE/F3YsroUvUM=;
  b=OvFALluXY74XtZfuUhCD9WAXAz3hIwLKvVxZzHQ58bDvvKotiWeeh3GH
   kflTWzMMnFa2ae4l/FyTFLDHC9BDBU6nh/DxUXMDRaMDLCSS0g5FEUebL
   uAqnqignoETvrCikSu2yCx+kIs/Q0Dv+8YgMx2bNaxkMx7KXuITLfXuyq
   SM5d1PXWUemqP+a3VR7iFTGRqGGTb2BnWuSs0rAYbscLJtymMdHPa3X6q
   gUvLDbtXm4MWURwtUbSU2+Ig7uQlHM9ZfCqZ7hKneRGlCsERL895058oq
   kxFkTUt6kEJ1NsK+ubobtaLSFyzniy6EIja5G3QCjHs3bkqhrDhGOs56z
   A==;
X-CSE-ConnectionGUID: AiAv7AN6SnmA9p5OFUIkjA==
X-CSE-MsgGUID: CeDoCbKZT+S6kYZt3BIlDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51323405"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="51323405"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:54:35 -0700
X-CSE-ConnectionGUID: IYbJH8q2SSmGyMvltH3CVA==
X-CSE-MsgGUID: VG9tbGEyRFWbq9Pf22lypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148824406"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.243.252]) ([10.124.243.252])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:54:29 -0700
Message-ID: <78d05dff-f396-4214-a7fc-f0c674144aef@linux.intel.com>
Date: Mon, 16 Jun 2025 19:54:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, bagasdotme@gmail.com, robin.murphy@arm.com,
 joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
 jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
 nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
 mshavit@google.com, praan@google.com, zhangzekun11@huawei.com,
 iommu@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
 patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
 vasant.hegde@amd.com, dwmw2@infradead.org
Subject: Re: [PATCH v6 17/25] iommufd: Allow an input data_type via
 iommu_hw_info
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <8e1d8432fb7e11f0ed514bc96690ece1f5e47fdd.1749884998.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8e1d8432fb7e11f0ed514bc96690ece1f5e47fdd.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_045437_559669_983B7DB7 
X-CRM114-Status: GOOD (  10.66  )
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

On 6/14/2025 3:14 PM, Nicolin Chen wrote:
> The iommu_hw_info can output via the out_data_type field the vendor data
> type from a driver, but this only allows driver to report one data type.
> 
> Now, with SMMUv3 having a Tegra241 CMDQV implementation, it has two sets
> of types and data structs to report.
> 
> One way to support that is to use the same type field bidirectionally.
> 
> Reuse the same field by adding an "in_data_type", allowing user space to
> request for a specific type and to get the corresponding data.
> 
> For backward compatibility, since the ioctl handler has never checked an
> input value, add an IOMMU_HW_INFO_FLAG_INPUT_TYPE to switch between the
> old output-only field and the new bidirectional field.
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

