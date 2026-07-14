Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877ADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZxdWG7aS/L6fXzfTf/S9tebYQ046IqMZzj4Z8jxC/M=; b=iX66+a3yz5D4Vm+UIKMJYvXLzi
	2RCuQHCP1VOhqa/dISKiQiAIX4GbT1a++zScNAMA0tWRDEElK63Z/8MoW3Mv/wOY8IRmj3079wFWp
	tYM8drYtrEK3K5DbK2XQyHtETgXZnqh5wz1TS4etlCRioxwp8WUeGYJxRznvCd9jy19v7ILeIrB4z
	slH2TnKW7gbvIDmKCcCV3VYeGh4sXs+NE+6pkIaB6uMFvsLR2E+W39Yj6IGRJOPpFTxLUm12CMS8u
	msnh1ef0R/dmAYIc6ktXaQMcD0UKdpgI0iyle8tCArCqiQpoEf03evVok9SSZ1EuT4rGrUS+o/qS6
	NCNRvb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVqx-0000000AyHj-1Fem;
	Tue, 14 Jul 2026 05:38:47 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVqu-0000000AyHK-1tuG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784007524; x=1815543524;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fmoxeHNad4ygdYeSccYkXkWFeEORD/OVZF5VZ9FQ+VY=;
  b=QKlEQfpJf6AMvhXHjUvkS0NYgE8OscbfG+NpfgheJqAn2l9KOMb5++nh
   Eh97W7U9da/iYu6z76FUG7hii67NavjIJafvCla4H91TFD4maAKhqq4T0
   qJKcMVWMitoz0MGHWCoMgvxHvuSOlIYzcFr1M8NRspjw9rczSrfHcTutw
   pKEZrl1oMPzkW4QfSmqrdguQhNtveBV+coEHonPCbz8pfNxYAAQX1uiyr
   NWA/Gdr4iZQrsNWKVcwhQoHpFp+AKNdBJKqoMMxA7MzwIzXSgJQfmYLyb
   V8l4Vv2rI2K2UqSVck53hcHTcEoGxQLfxaieHMgM6w9R7WN68YbQY5YQB
   Q==;
X-CSE-ConnectionGUID: DLv51Q2/SBmSGl5QYySJXA==
X-CSE-MsgGUID: hGmXmXHfREim/cJ8lse8LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95769607"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="95769607"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:38:43 -0700
X-CSE-ConnectionGUID: WzQa0jlfQW+1VqakYHExLQ==
X-CSE-MsgGUID: 8SLmmXFoTmqq4BRuqSX1aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="259331943"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:38:40 -0700
Message-ID: <4afb26f6-ab9c-424c-b23e-b639370b00fb@linux.intel.com>
Date: Tue, 14 Jul 2026 13:36:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/18] iommu: Pass in reset result to
 pci_dev_reset_iommu_done()
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jason Gunthorpe <jgg@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Mostafa Saleh <smostafa@google.com>, Kevin Tian <kevin.tian@intel.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, vsethi@nvidia.com,
 Shuai Xue <xueshuai@linux.alibaba.com>
References: <cover.1783044582.git.nicolinc@nvidia.com>
 <9306670b5bd647e477e36156b124557917baead3.1783044582.git.nicolinc@nvidia.com>
 <a24597bc-28ff-4b23-818c-f9126be3bbf9@linux.intel.com>
 <alUvPl/NtmqLMsoY@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <alUvPl/NtmqLMsoY@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_223844_590771_A6956999 
X-CRM114-Status: GOOD (  16.15  )
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

On 7/14/26 02:32, Nicolin Chen wrote:
> On Mon, Jul 13, 2026 at 07:48:53PM +0800, Baolu Lu wrote:
>> On 7/3/2026 12:06 PM, Nicolin Chen wrote:
>>> @@ -762,6 +763,9 @@ static void __iommu_group_remove_device(struct device *dev)
>>>    		if (device->dev != dev)
>>>    			continue;
>>> +		/* Must drop the recovery_cnt when removing a blocked device */
>>> +		if (device->blocked && !WARN_ON(group->recovery_cnt == 0))
>>> +			group->recovery_cnt--;
>>
>> I feel that the change above is unrelated to the purpose of this patch.
>> It looks like an independent fix that belongs to a separate patch.
> 
> It's actually related; I had this in the commit message:
> "
> This introduces a new situation where a blocked device is being unplugged.
> Decrement the group->recovery_cnt accordingly.
> "

Okay, I see your point now. Previously, reset_prepare and reset_done
were always paired regardless of whether the reset succeeded or failed.

This patch changes that model. The DMA blocking state of a device will
not be released after a failed reset. Thus, it is now possible for a
device to be released by the IOMMU subsystem while its DMA remains
blocked waiting for a successful recovery reset.

> So, it was not needed prior to this patch: it wouldn't fix anything
> if applied before, and it would be a bit odd to apply/fix after.
> 
> It's a small three-line change, so I think folding it in is okay?

That makes sense then.

Thanks,
baolu

