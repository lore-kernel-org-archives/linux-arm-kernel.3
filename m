Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE02C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxiqsjgDNm8ZjyLuIIQ2LiH6VmJED9cOjXBp7oj/RzE=; b=qyAAM9dN/BF+dORLngRn6fKjoS
	6r2o6Oqgo7j/W/Iu2CEXl7RIk378UBFb1Jb4d5T85ciSR8smX378DUmqJE2Pd0ESYj+sEe7wsEwX5
	Tu/ScPt7aV04VA2YicKeKqQvbm2bXx46zoZ5OyCxCAwITSqZYhM2x/Yxh8/DRAvon9dp9xquUQFWz
	BQ0KZPu4Mt3SLg6Ve3vuifrjpwprAenC1uHCEl37ughfLcDArE+7Ox/LlvnRKrKzFXaLVjG7zTCJc
	9TgrheEZjdSsaPixnR87NRu6EpKKg6tjd8GyInF2SjhhlBC/Y9XrUzLoxG3yELYZHIQSsiJbRgYpZ
	Zh8IVxEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0gc-00000003H7x-0jvi;
	Mon, 16 Jun 2025 03:39:06 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0Tu-00000003FVN-2JKJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044358; x=1781580358;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ShGXHWtQJnGfuAnsYBv4PVasiGw/1AVnM6GQMo/0N0I=;
  b=JHBD48idomxGV7FpYil/P6MXB+Q9o0bTPYKyrFWNWSgBM9CqS5zt9X2T
   S/mcg3kYXluxyep1elmqOF1D3Iz3zJPdg0i5K45IcWXEvEZ3Rqt7xsVir
   /jAb8fV/8zJF4dCZzGlkypyKGBWMw/2dMx0FTcP/Ch11/wLsoJkLBkCx/
   YO0yJHNGl//zUtPQUNGDyQ+P8fsKk9JuDkk/v4eocTWuigsHH5NzFiudO
   0kpz2MX8NVID1lqRem9bhxkxBNIzFigP0YMa1Xw78Zzy72Z0I3roIbD5j
   OmdS2SRSF6qBZrtpBWfu5CVx7KumMdHTbtYzpF7dovZTz5/Xl3VWnXBHK
   g==;
X-CSE-ConnectionGUID: FlrppiyuT9SXh/+DoccoNQ==
X-CSE-MsgGUID: nbmq7rdRSXWygj8goow1VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62449460"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62449460"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:25:58 -0700
X-CSE-ConnectionGUID: pmS7pV1yRJqPkZEn6XMIxQ==
X-CSE-MsgGUID: QYOKb70KSYSku4PXGZsZGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148205623"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:25:55 -0700
Message-ID: <a84cb244-deb8-4bc7-8220-504add900b88@linux.intel.com>
Date: Mon, 16 Jun 2025 11:24:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] iommufd: Use enum iommu_veventq_type for type in
 struct iommufd_veventq
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <208a260c100a00667d3799feaad1260745f96c6b.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <208a260c100a00667d3799feaad1260745f96c6b.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202558_663124_567102C6 
X-CRM114-Status: UNSURE (   4.41  )
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
> Replace unsigned init, to make it clear. No functional changes.
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

