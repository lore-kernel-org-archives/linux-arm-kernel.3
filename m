Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F0AC19F38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8Hy0qeoP0IEEIU4xjGLrcNsPGcFcgpMnc4oOIjAMNk=; b=inm9z48y6smDwoBvvP4AZ3C4Ig
	cA2iBt3bSsNbEYGf1x0G77C0s/wnJAK9eGrux9vvn9g7ceCN18EUmeoU2xvleIkjgsduA8y8fQZjK
	ms2aRE0qdQSWvwqqkNqGSQanOnM3vYpw2jOL0YuR9C+Inu8A8jD3n/dhN+33Rjijr8WQDzfBsyQmv
	c5TclCTJElNTpcgPZ+iocUT58slcni2Ih/hP78rX/869tOdco9KceJGK+xzomDp425TpLzPkWfeew
	z8AQrIF272VisHfiX6cmOM84U2mK3F76DF2ON+jT76dksrrt28HRU3N2OFZ1rNjZvRLmxYwAYH39t
	u9WmMJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIY2-000000047ia-0ais;
	Wed, 26 Feb 2025 14:38:06 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGZh-00000003h3V-0uDd;
	Wed, 26 Feb 2025 12:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740573101; x=1772109101;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=afc2o7ByS+Aq4HwtiZsVeJaJLJlUP9V4slrBeXFjQn8=;
  b=R8r4/QwL0MfUo5FYxYCI4qcXqDIwykUhJ5kT8bbiA8X1Rsanf/Q0cM2m
   pV9/Q0xnEL64KR8KOynEebBzYKaIvgpHIg3d4M/ytDLgn8g/FsvutiADY
   MuRwXSBFUkVnOHB9CRIwpvL7HSWbuwDVy9kYTZqUkZd3iq8LjMAIwYmTt
   7T0TJeHu0ivE5i/7MyvRuUKxaao79YLj0BM0rRghSrHRse2/mhtBXRWzW
   ri+OHzihf/Q5WeAozwY9NN+lgUDY82A2s5lb7TSsCbS/Zw0cVkYpN8ikz
   xuGyvogImOxBjRJjTcuTWPYdCLLOs67ufRqkBGoMGowl3XcePOJDqnPLv
   g==;
X-CSE-ConnectionGUID: TVDVemLjSc68e5Od1dF4pg==
X-CSE-MsgGUID: ju+kUWL2S+KwaB2S24IMqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41431978"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41431978"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:30:18 -0800
X-CSE-ConnectionGUID: +jUAibbHQkiSW9UiaTJzYw==
X-CSE-MsgGUID: JhiilTP7RRS5yHYOUzdzYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="117310467"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.240.105]) ([10.124.240.105])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 04:30:10 -0800
Message-ID: <a339ee09-4b12-4c05-a39d-7af5deb9ffaf@linux.intel.com>
Date: Wed, 26 Feb 2025 20:30:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Bagas Sanjaya <bagasdotme@gmail.com>,
 Joerg Roedel <jroedel@suse.de>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 patches@lists.linux.dev, David Rientjes <rientjes@google.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 23/23] iommu/pages: Remove iommu_alloc_pages_node()
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
References: <23-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <23-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_043141_288137_E1C5C4C5 
X-CRM114-Status: UNSURE (   6.29  )
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

On 2025/2/26 3:39, Jason Gunthorpe wrote:
> Intel is the only thing that uses this now, convert to the size versions,
> trying to avoid PAGE_SHIFT.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

