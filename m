Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2869E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6tIpNm8f3fA2BfCLVTw94dwWiqzNJYWlJihi3Jf7JQ=; b=UCW4l0vqUDojtpbMYeP2aT8XHX
	iB2KymxYxkmiIwmyF00TnYZ7lC0rv2lw+1GsiFoJ2AFUxnewTpoIJLFLhvmS2Afj7LA2LhNEzn43o
	BDWMexdWmXLtTuVh+XU7qHueNiZik2YjtYD0eQxWJNZG8HNThe49jpHqnWmRHZkM0kTNLB/B5fJBF
	9HOWvIe8BNXjvnm2nLhCpV0wdZeuO1tvqu/4CGg13tenSCM9Ud0LpBYGG+AfkWOO4toqRuFPDHjFx
	RBsqz6ByOpZfGfTpOy9+q+hQvwpWg+M4eoppLOZhP0W5nABQM5YZTTzNXdV2NYjQuGzDu87WRfuB+
	KKaOAygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdLO-000000006Rb-41Uv;
	Mon, 06 Jan 2025 02:59:54 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdEQ-000000005fT-0K6z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736131962; x=1767667962;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YlzyZ5VRctbcN5/cUfhWSOqbXSF88B8tOI+3HQdqnUQ=;
  b=esKguS4IGyyUBgDpIkRgt9SnLDYQRz0H56sEAHpJ864Qx4lMpl5lEyDd
   AJWfhEo6J8NBjQIMwX+XGYmOCA7AHtHBJf7jfIK1irz/xQTWUABvgYs7h
   FeQXv/fvz7ciXzAxrN6s5/Wsr0zd0TA0hBeNqUeUrKw8Sboqt/JETG3qN
   mwVs9R7khO5/NvqMM12F9DDj+g2o7HFI0uwi0/pP+/IvsMttLA/7DJYJ7
   b8TZbqv5Wyc3Y0oePHQ/oZCl2LwwQGinBSFhus5kIHQPwm7rtl4sKxWhm
   72asNJAQwC6VBTGBVodTLYv/UrDrCVVam6lUcLJDJAbmPJdoRsTCBs0at
   w==;
X-CSE-ConnectionGUID: 9sd/0LRWSXeUIPznEChnDQ==
X-CSE-MsgGUID: S1PY1htUTI+vkjNg2Xd25g==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="35575006"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="35575006"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:52:41 -0800
X-CSE-ConnectionGUID: M3d25IsrRq+MSMFKSrI+gA==
X-CSE-MsgGUID: fVeYsa7nREWJXtqMK1sngA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103191699"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:52:36 -0800
Message-ID: <ef45763a-f64f-4efd-b3a2-f019bd791e94@linux.intel.com>
Date: Mon, 6 Jan 2025 10:50:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/14] iommufd: Add IOMMUFD_OBJ_VEVENTQ and
 IOMMUFD_CMD_VEVENTQ_ALLOC
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
 <d0edfde78e75b6941589392e618f6d43b3f10e6b.1735933254.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <d0edfde78e75b6941589392e618f6d43b3f10e6b.1735933254.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_185242_136523_F8AAD3EF 
X-CRM114-Status: UNSURE (   9.09  )
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
> Introduce a new IOMMUFD_OBJ_VEVENTQ object for vIOMMU Event Queue that
> provides user space (VMM) another FD to read the vIOMMU Events.
> 
> Allow a vIOMMU object to allocate vEVENTQs, with a condition that each
> vIOMMU can only have one single vEVENTQ per type.
> 
> Add iommufd_veventq_alloc() with iommufd_veventq_ops for the new ioctl.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommufd/iommufd_private.h |  58 +++++++++++
>   include/linux/iommufd.h                 |   3 +
>   include/uapi/linux/iommufd.h            |  31 ++++++
>   drivers/iommu/iommufd/eventq.c          | 129 ++++++++++++++++++++++++
>   drivers/iommu/iommufd/main.c            |   7 ++
>   drivers/iommu/iommufd/viommu.c          |   2 +
>   6 files changed, 230 insertions(+)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

