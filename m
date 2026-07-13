Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84B9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CV+x6qzCduSIZ055GTKUHN0hxORI9JcflTUXYOMRqVk=; b=ihQPSx9d3OAk/tLYW/qiDYmVuS
	ocfK7axgqTW9PhGYfncqpYcOrbqF2vAzIKLNHf5kSSTZ/7vpYB25kWZ93BykRnkZLb1TkJxAJbESc
	gdF9UlD/5XQpkNgtRMGxj3uVzvliSjW0YPhF0zWEx3M5vDVVAd/4232CuLGXiHAXHStyEdUA27m+b
	idleYDPa3T8qOjmPCNb31IoQGHtYO+D7BRsgGMrXYnWHAd4JFUyYTTb/UMtxVP86IA3VJ6a5XzGlp
	+TDEhyWF5WOLfsnoz107o7sF1wSR8Wq+iFqTq4rqNAwWzRH0GqOA+thPjJy/9Jew5QO4iIcMOcla7
	u/QduHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEvD-000000090gn-1P1n;
	Mon, 13 Jul 2026 11:34:03 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEvA-000000090gF-0nWw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783942440; x=1815478440;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+lptIfgeVXQLlQ5OkctL8r2FHuEGfqk72D2JF8GX+Qg=;
  b=SLRQC5xkaztPlkUmdfLvQlZ5tiB687oUg1wvRu4AxvC8ahyseKLHcWdp
   I44mEbD1GLdgUbvDbNMaYH+bgRY2OtRtCU9jPihdjkUk38y/H2Inw7Tsx
   RbnOpjRpsC1MDmzBigwzN+Xm1p/cQnOzQHQ2QcVVSp5zk4Mx7Knk2YGhu
   RSgieW7UxD/no4Ri1F590cdJNrs6NU2wllp0fM2KTJ9VNMgDrptHOYkYH
   9oKZQ2TMcf1rI58BAnz1lAHd4BVJZvYBGwVdG8B90rIX8A33sQxNZbZYF
   Q6dpQZ05Oz4aTW32+PWQe86CX3DvwJb9ZQ/Wsq5LI8xOypr5AIEURuV4M
   g==;
X-CSE-ConnectionGUID: yyT+18v7REyT5tDscMnLwQ==
X-CSE-MsgGUID: EihwBwkiSyu3rhbmpedW2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83526346"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83526346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:33:59 -0700
X-CSE-ConnectionGUID: ODUx+IIuR4+c/4wF4/vwxQ==
X-CSE-MsgGUID: 7YtRABSKREm+ZfsaP/Kn/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="260419355"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.248.249]) ([10.124.248.249])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:33:54 -0700
Message-ID: <05ffe5f1-0d88-40b1-bef9-e9633d618ce5@linux.intel.com>
Date: Mon, 13 Jul 2026 19:33:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Mostafa Saleh <smostafa@google.com>, Kevin Tian <kevin.tian@intel.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, vsethi@nvidia.com,
 Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v5 04/18] iommu: Convert gdev->blocked from bool to enum
 gdev_blocked
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1783044582.git.nicolinc@nvidia.com>
 <05da17325cf02758fb0eb3bde34c8ef2a22decbe.1783044582.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <05da17325cf02758fb0eb3bde34c8ef2a22decbe.1783044582.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_043400_242085_015F012B 
X-CRM114-Status: GOOD (  17.65  )
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

On 7/3/2026 12:06 PM, Nicolin Chen wrote:
> The gdev->blocked flag tracks whether a device is individually being held
> in the group->blocking_domain while group->domain is retained. Up to now,
> a PCI reset in flight is the only producer, so a bool suffices.
> 
> Subsequent changes will add more reasons to keep a device blocked, e.g. a
> failed-reset case that must not auto-unblock, or a driver-side quarantine
> for a hardware fault. These reasons are cleared by different events, which
> a single bool cannot encode.
> 
> Convert "bool blocked" into "enum gdev_blocked blocked", provisioned with
> two initial values: BLOCKED_NO and BLOCKED_RESETTING, for the existing use
> cases. All readers keep the "if (gdev->blocked)" form, as BLOCKED_NO == 0.
> 
> This is a pure type change with no behavior change. Follow-on changes will
> add new enum values along with their producers.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index e8f13dcebbde5..342e8a5ad628c 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -73,16 +73,20 @@ struct iommu_group {
>   	void *owner;
>   };
>   
> +enum gdev_blocked {
> +	BLOCKED_NO = 0, /* Not blocked */
> +	BLOCKED_RESETTING, /* PCI reset in flight */
> +};

Nit: Would it be more readable if we rename this to 'enum
blocked_reason'? Something like:

enum blocked_reason {
	BLOCKED_NONE = 0,
	BLOCKED_RESETTING,
};

[...snip...]

Anyway, this looks good to me.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

