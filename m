Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BEEC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNkgibrjc6bGULe9qB2c51LZHGb5e9pkEqCuLJFkESA=; b=AywnAsxPYDjPQMGSo552hSEtVs
	E2ybaZGIAFK039aGyhxBD6kXfTxSMkcevy3XcdPEMmeBDfC5A1Y2sPWKzw0CSk58rzxcm0YzFzG29
	87sSKO2nhgeKdF6nHRfZCP911Jh6nvt/VOAeInatMhjXb7s2RpT0DFzem2X8KViyDPwSNuJXYdzBf
	X0qKkjiadPaCAdcKRrRYK7JaUicOwz/vd9yyaakiIy9m0NljbDIQrZ9XmHaHbS8JHlgkslMlthwj3
	h/oyeR4YYFDz5V7JUlO5Gw3XDYghqiFen03+spp6oQ3UDw6BpT6jSFHJOaDA7YdwoSKvCjQ+1ALEO
	iv0V6TUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBIF-00000002bR1-1M4T;
	Wed, 26 Feb 2025 06:53:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBBs-00000002aOb-0LnF;
	Wed, 26 Feb 2025 06:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZNkgibrjc6bGULe9qB2c51LZHGb5e9pkEqCuLJFkESA=; b=oikfIhZn7yFN7JaVPKhYTIFaWB
	5rj3SJL0lcc5H4XNSeldjamlkGfwN/lGYM1q5Kw9M8LGckMtFI2FvXD37HZ1GDcz0Aqm7cdhL0TRh
	r0Ua/jDgoO8TdlP/3zfOm0Us36uQ0uLEzl/XJ53bMO+ynF4Gx8zokpy3ABtZAjQt4pjrFXsaSPWFQ
	TM/X0kfirhlD9dKFjTkTaHeNpfYWYSCB43V/5Z1R8yyr7iLWB/Y8sfR3oVWi5n8VbA3BRp+puiU9n
	zjE+9V00mczhOP+fZgMfwPhaPmKqIq3uhPOwL/FZ2kIpnHxSyh+Gotd5gT4XFwngOFkNxm8TZJ+LH
	km2L8Ddg==;
Received: from mgamail.intel.com ([198.175.65.21])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBBo-00000003X5j-2SyE;
	Wed, 26 Feb 2025 06:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740552401; x=1772088401;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DcJW8rnikbMnBHMjyLqT5C+TmnYl/QP63LXAKlFTjQA=;
  b=XC1kppoSDlE5KPYgkMYj5H+stdlWO2ZLqK6YiJKwQDU6oW8Hvf/GhRYj
   ZxbgDPGmbSY6JB8NupQ7vlmJtDk+6tJHz5yHlqM3QQyHGhWS45NahfPr8
   ZW8dmwfm/tx6fnU22FoOnByXn96UClYkfbG5PSQivvpfuChik047T7I2B
   WwVjEU/7QOdFgW/a41AROiuTT9aIvIkDGnzgRT38Fv1bZHnuJLXsJ8bBc
   PGWlfLLXjrAkmA8XZsxwBwHzLPkWcxkVjr5++xFU8rT3F3dqPZGdHuIfp
   Rp9v/noFQ/f22C374uRhi8V+SGwmCInEA6iibd3oE5QlbAlcoRSixQjzG
   g==;
X-CSE-ConnectionGUID: LRMFFNkgReWj18foSyz91A==
X-CSE-MsgGUID: F5gofWCMQ5KNp6YfKPxtlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41300226"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41300226"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:46:33 -0800
X-CSE-ConnectionGUID: vhSj9HPxQdixfCU6Udz2DQ==
X-CSE-MsgGUID: f6KHA8H/TGKMHtiGBJpThQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147528550"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:46:24 -0800
Message-ID: <cdab4b5f-f943-4091-a03c-252769221fcd@linux.intel.com>
Date: Wed, 26 Feb 2025 14:43:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/23] iommu/pages: De-inline the substantial functions
To: Jason Gunthorpe <jgg@nvidia.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy
 <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <7-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_064641_277108_EC23D608 
X-CRM114-Status: UNSURE (   7.65  )
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

On 2/26/25 03:39, Jason Gunthorpe wrote:
> These are called in a lot of places and are not trivial. Move them to the
> core module.
> 
> Tidy some of the comments and function arguments, fold
> __iommu_alloc_account() into its only caller, change
> __iommu_free_account() into __iommu_free_page() to remove some
> duplication.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

