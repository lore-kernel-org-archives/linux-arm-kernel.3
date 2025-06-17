Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662F4C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 04:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtBKvDs16wVf2tL1bPyAHQR7j0UoJndZeLniIMDEri8=; b=hTrCvAoLcwjgWLYBIxPCDBOPzm
	m9qI0Q1McIdEnIadS5ECe8DZMSSge/rwTJ20HwKSQ2tncZguv6bT0OXm4ycHHvHKMU5EcBcf5CHNr
	LKWETliaoqKYN/3NO0sjfra/07dxRHIsZ9+aOzDBxXAwUKt9FpInTCI8mSFcPgtKki0ufiN7voqSl
	Pg2DLq/m0KRPyRFRwXpPtlx1+ZIoX0jci4ZFto4sH0IXW8jto/oWojlmAewfgn4poO7h1ckqtVN1H
	YS1nj5SJ2N9EWYGaHl82huB+VexzAhUwFndo/IEFDDprBPuucwi4IZ2NxEgU+Mirf6BKgpvBHKNuj
	WW4liXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRNuZ-000000069dJ-1qRw;
	Tue, 17 Jun 2025 04:27:03 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRNs7-000000069Q8-1yTY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 04:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750134272; x=1781670272;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hS1jLez6pg2f2TjhjY9W1XKul5ilJirXcpZ9vDFaRGE=;
  b=d6YDhItm0RwCj8Em7fiwaWB/xBg04MUlQBVNmycedY+TBHFkACEQ2x0t
   W5RxvWozemvKiyqinf92tPQNe8cFFmUgxvEGnIqIZn7/5dfum6Jdjyl9x
   o3TJED/qzSme5sJvj3ObqOcLWX1RcjEs1GbTkDeubIDwNpQGDQSfsBWcx
   eHEuIILrAyNyRt02kdHGHyoWuYaKJzJoXCqBZ7AfyzL9e6UJE+9sjlLbc
   okRQlG80S5kJCy76/gEfkeb2U0kTdcCE2fQq1idhZ143aVfcm79kkjqyn
   c6WbFK6O++0w5SHdb14vUNX6bHJiyzLcmtVOjTVlbLeOMs56K5GzIEh+w
   g==;
X-CSE-ConnectionGUID: 2p4crgKARe+BMrQNzU6obA==
X-CSE-MsgGUID: Wdc/NRYMQLKXoEt4Iv+Ciw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54909363"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="54909363"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 21:24:29 -0700
X-CSE-ConnectionGUID: osI7mkNFQI24GZf/sZPogQ==
X-CSE-MsgGUID: 9yvR0dzZRHWogZ9sJL5FrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="153956949"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 21:24:22 -0700
Message-ID: <c3842cc4-f057-4ab6-b0bd-f7742ca7c645@linux.intel.com>
Date: Tue, 17 Jun 2025 12:23:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/25] iommufd/access: Add internal APIs for HW queue
 to use
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
 bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
 peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
 praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev, mochs@nvidia.com,
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com, dwmw2@infradead.org
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <64145b184a0fa7c9b60532c9b475a51625edb77c.1749884998.git.nicolinc@nvidia.com>
 <20250616133719.GC1174925@nvidia.com> <aFDSNYOTToFSbFA2@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <aFDSNYOTToFSbFA2@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_212431_595589_BC1CB8E1 
X-CRM114-Status: UNSURE (   8.53  )
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

On 6/17/25 10:25, Nicolin Chen wrote:
>>>   struct iommufd_eventq {
>>>   	struct iommufd_object obj;
>>>   	struct iommufd_ctx *ictx;
>>> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
>>> index 9293722b9cff..ad33f1e41a24 100644
>>> --- a/drivers/iommu/iommufd/device.c
>>> +++ b/drivers/iommu/iommufd/device.c
>>> @@ -1084,7 +1084,39 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
>>>   	if (access->ioas)
>>>   		WARN_ON(iommufd_access_change_ioas(access, NULL));
>>>   	mutex_unlock(&access->ioas_lock);
>>> -	iommufd_ctx_put(access->ictx);
>>> +	if (access->ops)
>>> +		iommufd_ctx_put(access->ictx);
>> I was hoping we could null the ictx to signal internal? That didn't
>> work out?
> access->ictx should be NULL for internal. It should have been:
> +	if (access->ictx)
> +		iommufd_ctx_put(access->ictx);

access->ictx could be treated as user ownership token. If it's NULL,
there is no user ownership, indicating it's owned by the kernel. This is
the concept here?

Thanks,
baolu

