Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E911C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+HcKhtHuzZ/P01kvn9R4IXuGw3ZyxO3aCb3FftIO30=; b=GyUEhMehRniHkO3l+07+hYNqdC
	ZFqkx3uxAQ8DYQ+DorhIbZCY739GOhly51spqrQJKVz+pyEtdZMo2mFVrldlZsPApGlxmqeeTfcOc
	/vPdfydP0/DYml9autgH/ipkIyFLX01hcL4OroiejouzrKE3sU9Q3V87Z3l29u99/Oe5ZF9tt0rua
	KcNWcI46uMn0oT2bgx1qzUplJOe8fgnDS17A6q1kUG6WYPEk+DKwLYwGa0m1RtdM+6TwOnFeY7Nit
	n7IxSSQUlLSI3ARFNM5Xhk7If2CjcjcRT3LhhdLbA69HKaA1NqpmN5Z4gl+jBcG+4io/mn1p0FIzI
	C0+APiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wQA-0000000366O-1fta;
	Sun, 27 Apr 2025 07:27:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vzv-000000033ra-3Q5Y
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 27 Apr 2025 07:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F+HcKhtHuzZ/P01kvn9R4IXuGw3ZyxO3aCb3FftIO30=; b=Ml+eZruiaX5WIsrXAMs02gM59M
	M2LRaaG0chEXkLXZRQs48nua817DpqkPuNY3fCc4kuJ0P2ts37G8eJavNV3Fh+sF0ufZrEa/XzEA6
	CbH3BLin1+inMFOWvTbYtd4AwjyVi3UdiNrYVKAcZYW0XzifDAWTyR5vjOUApeOJx39g3XQICnDQp
	lGjMsUi3c3+a9S0f/lFuCauK0t10KneSzmw74fBE39JoQdsA42NLnCA6KgIiPGSF07xepNmj636lM
	7prE8QzmMfwLp6Zg9nCgtyFzIfFmhAKAzf/AZQAfO1qJoZr6DDt9kLHTX15mCegpwr3uctciTAiag
	+90ha3WQ==;
Received: from mgamail.intel.com ([198.175.65.19])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8vzk-0000000CPwS-3LoO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745737209; x=1777273209;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WPVNiPXysA+ZKbcBuVxOUqy7B0r28vdmFSIesJvE8b0=;
  b=PwKQjxkzx1v2XYh5Yzqu+YjKIDc77v/A4W+4C9o2Bumf23UPPJ+q1vV5
   e9iEDTej+ZASixg/gzQncZF+CkTKJlm+wcm4QU8+lYJ4o9eZVVx7/uv3r
   OGNlm31/LQsn91V5pI0CxGJvPZ8Q86l5MmXUVUlPLeoALWOH11tzmTgfP
   DMDLedsWJIxMxmPvR7OzAlisK9KENEIexlaE9woqjvA4kJcHbggeXO3OI
   2LztDUemxLKMzg8u3icDX8TQ6nf5exZ+sCcAUTmbn6Kq+kqa5Ftt5igq0
   JT+Zn/+TpcmrkjtdWVs/wVi5ZxYmGixra41GdjLaiZMmwzfaDbeyk91fq
   g==;
X-CSE-ConnectionGUID: Kn01omvnToe1XLn40PDeQA==
X-CSE-MsgGUID: J++or2D3RYaeqkQNlKSfoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47230530"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="47230530"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:59:56 -0700
X-CSE-ConnectionGUID: d1ZTnjH0RQyh27Uc3LKjrw==
X-CSE-MsgGUID: v/r5yexURzibspAZ8Nkryw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="138394240"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:59:49 -0700
Message-ID: <9737606f-d3af-4c20-b1ce-7c705a7c8590@linux.intel.com>
Date: Sun, 27 Apr 2025 14:55:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/22] iommufd: Add iommufd_struct_destroy to revert
 iommufd_viommu_alloc
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
 <3d8c60fe9f1cdaecd59ce3e395eb6ca029ca8ded.1745646960.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <3d8c60fe9f1cdaecd59ce3e395eb6ca029ca8ded.1745646960.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_080009_690952_51FD76AE 
X-CRM114-Status: UNSURE (   9.18  )
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

On 4/26/25 13:58, Nicolin Chen wrote:
> An IOMMU driver that allocated a vIOMMU may want to revert the allocation,
> if it encounters an internal error after the allocation. So, there needs a
> destroy helper for drivers to use.

A brief explanation or a small code snippet illustrating a typical
allocation and potential abort scenario would be helpful.

> Move iommufd_object_abort() to the driver.c file and the public header, to
> introduce common iommufd_struct_destroy() helper that will abort all kinds
> of driver structures, not confined to iommufd_viommu but also the new ones
> being added in the future.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks,
baolu

