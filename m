Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46D1E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0e9+KGNOdxX7+IigMIDOFK3L38+IsNl6vnpAqKqpl1M=; b=tfuusX2fZLjK02O1lFCTfO8o9+
	i6w/tVxnHknvdgRTwajWyFRJdp6rdoKgju1B4MM8o8+M+HT9qwLuVEINmDMT9vI0+qsmKqzOGDtZD
	4vVhXzBMIHqQgcwacjKOsKTePhqMYJHefweZV96c9kUJhglmSHdhcWLkj17o8JR7w6gdeHN47L9vq
	ZBqyESLrCbkC3e3BLW5/npenVvz58NigaSFkNz0kpDQeT6QqHArvo8UXXdnlxE/ax9f9WOuiuGQFR
	W87sJD584eHSakGHBb00ifWluSJS2akl6awupgfHf9PNRq+C8WpKfA5SZHFzBCZFWa8av+zJk7/af
	ywbTeTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdNk-000000006fO-1aXv;
	Mon, 06 Jan 2025 03:02:20 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdFK-000000005rq-1iTX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736132019; x=1767668019;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ob+FMX6fj9S7JNBy4TjIUMzy4NByQm6piaqnxNepR9g=;
  b=BK5JMp4YmbtWBRoNUd39YuWc/KUlL9ppQknxAAdrbcQtht/0JRRfTsYc
   kyysrRZBsBOyYLd5Zdxmu0P2sQ5DEAFk/iqWd8mRnrEqWLSZZKQbqhDfN
   /CprFLfr37yCAjGqIn/azL7bhq7w3XpwezkOzL1deIGDZH5eSnHzCLFLi
   ZtgLZIYo2/RAqWZodHP3N3y7zC7p8Av2ZDq1TV2bV2W604f51JtFZJl77
   mjah2alC1aAv0eggTYKU2jCwp8EddkqF0oWTxxXZKj1dIkY1GKRWG69fq
   ERbBQd5k8FJhog7dDClcxWyA6GxTDXj6PUgZHZrFpNg06FVCck9TlprzX
   A==;
X-CSE-ConnectionGUID: G1AoW606QIu0DiralZlnCw==
X-CSE-MsgGUID: OxW+d/9sQxOAAmf5r5EmEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="40044040"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="40044040"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:53:38 -0800
X-CSE-ConnectionGUID: 7LLmMcadQ7OiwX+kEigIPQ==
X-CSE-MsgGUID: PIZuysybS4yL0VfWNamrvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="107172768"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:53:32 -0800
Message-ID: <d65e1a7f-8b3d-4d3b-bcd0-38ef02791ca7@linux.intel.com>
Date: Mon, 6 Jan 2025 10:51:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/14] iommufd/viommu: Add iommufd_viommu_report_event
 helper
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
 <cbf90c55a1b8fb7c9d0619d0c12362e699d2b642.1735933254.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <cbf90c55a1b8fb7c9d0619d0c12362e699d2b642.1735933254.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_185338_531643_0065AD18 
X-CRM114-Status: UNSURE (   6.24  )
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
> Similar to iommu_report_device_fault, this allows IOMMU drivers to report
> vIOMMU events from threaded IRQ handlers to user space hypervisors.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   include/linux/iommufd.h        | 11 ++++++++++
>   drivers/iommu/iommufd/driver.c | 40 ++++++++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

