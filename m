Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D83E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgV85Nl0As6OtVQ9Lf76/StTWQ3lGWa2RIK4iy639Xk=; b=aqb1tDTud7iF7mD/0dg5mKtMca
	P0wCvVC8iuGv9MozOeRRIivqUse8rOV89xN9d2wOFbNH9yZEVfKAZN3tknCeFWLdoT3IBskw8e2Dw
	XLZxPtQA3O4dIWcT1VsDHougKqxiII3VJ5rRyGDdsISLTZs0ofqDaGrWDRYTkiiqSyjE3Nmk8O2EW
	7Y5+lsk5B1GgAOBveoOah5sf98gp0cbeNZYpBqwlLgZe5QMRp2o/oGnNDcfU39XpIK8D2gzhbCUVL
	7YFkfL60YriC5WT9K7oPQvCW5WApCuY0lm4oH7Lkf9HyG4bNoQkC3h/q3gdohESMmuKMKFbvrfl/D
	SWT1plIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdMZ-000000006Yu-2bCa;
	Mon, 06 Jan 2025 03:01:07 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdEq-000000005ma-3avn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736131989; x=1767667989;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WJ1lnQpnjzSENphJqAYllxPMKCggrwJ0HwxYTWlZgOE=;
  b=kTv6qivfCEJ3MzCCPhp9W+s3OOfC+xzOq+G8B4QRDX0GhA/AyrT5RPa4
   QC2Yab7Tx33Cz1chyUPWf+uoVEHTFsjTipPYqyU7hyETEvxUrIVi/FBPg
   16WYhVaFwpplFFrfN+i2c12rVXdKfU9QkEt5e8XdOeRxxc/TytYRbfCBx
   ws3FQn8BoKXWjjOnLlWxU3P+K1iHOZQS8oefigNsnn88ChixxKN4s6BtT
   1kZReikbYIgDPIpIlhqyFqEnA9EYMbTSqlFDUsCZIAZvSPyFE7cn+Mlf9
   Sv6hRD+IeWT1w3XKCh0rplCIkkb8KATKLeR7NODCXit/VWPpyExfLUFXe
   Q==;
X-CSE-ConnectionGUID: Bb/2HMOtRJybZTt6ZBAwoQ==
X-CSE-MsgGUID: c4DudSREToiqyevcL8u19g==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36172790"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36172790"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:53:08 -0800
X-CSE-ConnectionGUID: EFOsIFRfSFiwDCSH/Pl2tA==
X-CSE-MsgGUID: 725LiNAKS8SO2bQgECxPQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="107172729"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:53:03 -0800
Message-ID: <4df4d3cc-4e70-42a6-92f6-58e51b5d1048@linux.intel.com>
Date: Mon, 6 Jan 2025 10:50:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] iommufd/viommu: Add iommufd_viommu_get_vdev_id
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
 <e29a931521365e7953cb993a61dadc72a53b66d9.1735933254.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <e29a931521365e7953cb993a61dadc72a53b66d9.1735933254.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_185308_912483_AB3AFF29 
X-CRM114-Status: UNSURE (   9.17  )
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
> This is a reverse search v.s. iommufd_viommu_find_dev, as drivers may want
> to convert a struct device pointer (physical) to its virtual device ID for
> an event injection to the user space VM.
> 
> Again, this avoids exposing more core structures to the drivers, than the
> iommufd_viommu alone.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   include/linux/iommufd.h        |  8 ++++++++
>   drivers/iommu/iommufd/driver.c | 20 ++++++++++++++++++++
>   2 files changed, 28 insertions(+)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

