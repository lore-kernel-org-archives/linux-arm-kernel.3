Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D283C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3tgxqtRUXdvZg3WjcgrRecF6wJB8QZgZEfp2eXRNfM=; b=TbCW6k3A98tjlO9dgKxoPRdC8l
	N9N5ZwPkqgZmO51wKm8bTi/3zudpusXHLlVSdp9p+CJ9AsGyBL3pjFikTVgzDTQTAtS5m9jiIayiu
	XQoCRDjvBTTK9FNHnne2HLXZq1wsp0ZIj4JSCXYeewABFiSXaEY0962WZBLtCy3OPCoapccqwDpsv
	RoS94jW0v2GDJRdl5+QGJy5D4p9QSA5bmHadp5Jw0JWXXVTxKCMBbeybPhzsJTVdfeV7QZ31uVNXg
	cf5P5IPuRwAnlhYy41/BQ/p3sDjEL+fPxzv4bomOMgN1f0qm0A8G8aDInyj2hKw+j2xPpIbrAP94W
	KyGtxcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEGT-0000000HJBf-0HbH;
	Sat, 15 Feb 2025 09:15:09 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEF0-0000000HJ4Q-36Wh;
	Sat, 15 Feb 2025 09:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739610819; x=1771146819;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G/Qt6dZjMBOmDsbuyaRv6OzX+guIhg98BM2jS68/vTk=;
  b=Qv98iGa3Y9zr4aR4fpPl0wexW5ru5/dms2Zm423yU6QiRMk9wMrVFCIU
   uFHIufxA4NHBElr7eXsYKnNFjsv1e2SeHJzxKbHLL3WslVJsT8Bb8Amxm
   l40hNRisNx+LxVdI1fIZGl151NreZC29EUhp+KXvwoKJRv0b0kFmtmiOr
   etsCLD9mnlU9BQ17FUGYXgoB5KvE2Rsa+0rz3QO7x5hR5miv6COvY4aQ4
   4YjERsopDzxQitOwKEOcal3pqXhKKb1lZjTzJYBRtVgfPWI0gfTHWNUft
   5nE98cDMffmrMkrE9v0ws0GjcC4568vADlISMHZhJFDcxKe51EGHvIEuN
   g==;
X-CSE-ConnectionGUID: JlIeXyIkReaTKuFboXk0sQ==
X-CSE-MsgGUID: DL66fkfIQxG9HablFwo6BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40279523"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="40279523"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 01:13:37 -0800
X-CSE-ConnectionGUID: OjCkaXbcS1WOq7oKO+qQrA==
X-CSE-MsgGUID: ncWbRhG0QRqp+uOwSydKkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="118688305"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 01:13:28 -0800
Message-ID: <d68dd230-96c1-44c2-b8f5-59f87fcca25a@linux.intel.com>
Date: Sat, 15 Feb 2025 17:10:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/23] iommu/pages: Move the __GFP_HIGHMEM checks into
 the common code
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
References: <15-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <15-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_011338_837748_534733A9 
X-CRM114-Status: UNSURE (   9.88  )
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

On 2/15/25 01:07, Jason Gunthorpe wrote:
> The entire allocator API is built around using the kernel virtual address,
> it is illegal to pass GFP_HIGHMEM in as a GFP flag. Block it in the common
> code. Remove the duplicated checks from drivers.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/io-pgtable-arm.c  | 2 --
>   drivers/iommu/io-pgtable-dart.c | 1 -
>   drivers/iommu/iommu-pages.c     | 4 ++++
>   3 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

