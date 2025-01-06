Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8E3E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 02:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xOwr6FjBGI7ikHhNVOHkrYxZSHoXszs3gbou8VDG60=; b=d2bicP418hVMibQ85FsJomBlsT
	rBzM/ZcvuKSJazJ9HfyaK3hYVj2L8rqyWwvd9VQxfPhMb/6yMqjbEt0xMq/cvC50kRmgX4DnFGalU
	ttJzOQfDme+/RPQhyf3NzZMQBwTftgqDLuL1Vf6mt1fr7ePndjcaybGL2/51fGIP7G7m82dqWRiKu
	H+m6WkRwpYvoaNfqzf1UcMLiQPbkTeuwTJFax5CS/ijTS/HgEpOTKSG6SFcmF/gq/9vccE52l27bz
	TVQq7rG7918qxoBhUDwQmEjXJ7zdgEZKYzc04bm3P1PkHQmlMLE9jcJf6xBnnqtdTX4uKMua5wWkV
	fR7thQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdFY-000000005vI-2Qgu;
	Mon, 06 Jan 2025 02:53:52 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdCo-000000005I9-2io2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736131862; x=1767667862;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eB3a1yIL898tRGheJlkCWYWd7SxbOuy+3DIEeL0oQUw=;
  b=TFEM7EoClERgqEZJ5ILRc0BlSUnpdLl9nlDqUnnE0TtFG3PGiKVAUY5r
   vpVfuyRQmJMt/drTggpr02WTiuoDOmuXzgRIefzzSI5ix+oh10A8WgHq/
   c7eMAJ9ksUjHCBG52tV6DVtAeMfk7B/Qnyn93AmkL2hii/7uE1Nnqiyd1
   3sTmwbJC2pS97EkyqscnGhtGm0piLIh4aWf2uNkoTyA2eKZ+nkVze6vcp
   fSzgreg+G3NCV5SS29qGxzLoCUhXgrJ2CB8LUHmqkGzSP01Gr/h9qs7xN
   YxaO1LXDQM6eS+DGubAWoAR8k32e4j/Il0+7YXwzw7d6Glz77IOlrBJaU
   g==;
X-CSE-ConnectionGUID: Qp2zi+5EQuuMeHHYp4ri8A==
X-CSE-MsgGUID: mJI7YwwBQuOmRb3j6Pl7Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="53690660"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="53690660"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:51:02 -0800
X-CSE-ConnectionGUID: Voqol13QQymkWkN2Uz472g==
X-CSE-MsgGUID: bofiroglRWmtMULjORZ2WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125600122"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:50:57 -0800
Message-ID: <54b66ff2-cf9d-49c9-aa58-9051b2cd86e6@linux.intel.com>
Date: Mon, 6 Jan 2025 10:48:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] iommufd/fault: Move iommufd_fault_iopf_handler()
 to header
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
 dwmw2@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
 mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
 smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
 patches@lists.linux.dev
References: <cover.1735933254.git.nicolinc@nvidia.com>
 <92a5599bddd915c049fabf4832ec8b0f0c1471c6.1735933254.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <92a5599bddd915c049fabf4832ec8b0f0c1471c6.1735933254.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_185102_742957_0B921320 
X-CRM114-Status: UNSURE (   9.37  )
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

On 1/4/25 03:43, Nicolin Chen wrote:
> The new vEVENTQ object will need a similar function for drivers to report
> the vIOMMU related events. Split the common part out to a smaller helper,
> and place it in the header so that CONFIG_IOMMUFD_DRIVER_CORE can include
> that in the driver.c file for drivers to use.
> 
> Then keep iommufd_fault_iopf_handler() in the header too, since it's quite
> simple after all.
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommufd/iommufd_private.h | 20 +++++++++++++++++++-
>   drivers/iommu/iommufd/fault.c           | 17 -----------------
>   2 files changed, 19 insertions(+), 18 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

