Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDBAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 02:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fU0MzNWwPP8WNywN//6BTE+4huSLjXYMVBIXbmYzyik=; b=jlQ/CeA20U0eSDohiJCGEWjCFb
	aXN46wzzzJiCsnAW9ISm3UTqyW7WYWkFJXV7zSH2c+VE66SlbyRXz6gm7C0F36CzY/3QHkFiEnsmu
	7kYiOEYhI5mn3aEsZ+QLDcc6b5Y788fL5r2oapHnsvWjSx6hGoZe8esQjHRRd52D1FbMrTYggcBeB
	/hWvKAy07+yb+r3Rt4yoB31HLTaKp/TWSeBmBmFyZUKXhf8jN3r+NOimvb6Xh6aX06EU8O1Xbm/qu
	LacMjxGzZ9F1m9AcK6/a5eDnutFbKehJBc4txer8wsGMAd67w87vOpl+xdMXQTYIaYVLoha453q4B
	2rXl2k+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdDD-000000005Pz-0lxQ;
	Mon, 06 Jan 2025 02:51:27 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdC1-000000005B6-0hEe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736131813; x=1767667813;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pxVIE5U9doYqO1gtr5NtmGoE9CiEo7WfZB90wEQeGPk=;
  b=l2otP2w7vNPBKeKdXCFYIXMxKo5QnAlD+K0dvtRjE8Ez4ehl5KPUQ9AC
   +Dop0YJ+ItqpFGsx3muwJBBxqABqIOJjSbgAnRv2FERTPacSRTttwFKEQ
   G520Y05Jxr8lE7h07l17y0jw9n3ieSSkdFg+inAB2nPERpVDfb/im25vM
   DHiPEuej4kdhZU7pLNIqQtEZVejz0iv2NGtJmyStW6eWzrVuKZvZAVQF7
   XMDF0Hgi2AhZjs8r8mlVW9oE+Lyu6k4AJr0Bidq1qFx6AAwW/vnvWFcTJ
   QjGao+a1x51sWUyNkqv4+fqnZyk8lM0WN/TFEXk2lizrr8rjrN6rm/VIV
   A==;
X-CSE-ConnectionGUID: Qdl9lh6nQgSc4tfowjvA5A==
X-CSE-MsgGUID: EhoNBLMSTz6vgCm3TGQ/cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="53690610"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="53690610"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:50:10 -0800
X-CSE-ConnectionGUID: pJzxby5TQBapEJrT6rfaGw==
X-CSE-MsgGUID: oskUF8ejTMuiZEUNj5l2lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125599941"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:49:50 -0800
Message-ID: <821ed0c7-20ef-4695-9da8-a8f206f4318b@linux.intel.com>
Date: Mon, 6 Jan 2025 10:47:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] iommufd: Keep IOCTL list in an alphabetical
 order
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
 <32abff935ee97fb0be3f675a2a61b535492e242c.1735933254.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <32abff935ee97fb0be3f675a2a61b535492e242c.1735933254.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_185013_314695_A6416512 
X-CRM114-Status: UNSURE (   6.68  )
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
> Move VDEVICE upward to keep the order. Also run clang-format for the same
> coding style at line wrappings. No functional change.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommufd/main.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

