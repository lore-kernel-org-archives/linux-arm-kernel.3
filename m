Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1485C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uqgYTmbvafMhvLcyMzm5PSv2u4uDa3CIfzcMsd8xgo=; b=WQrlVoqU8ctGeV+feQ337teIFO
	AnsrsIwwGYJttJdrXxUc8Vf4tt86eFXYbes9sFSzpF1Hg7qZyxG7QhbTXny1MaD4Dz21l7he67YKt
	28h+lWXcwe7AJEW5Dh2jM6JcPI0JeMHvfCYhZzg15kUIAjJz9EcDCB65rrqtIjD6bnV4gYRWSowdg
	9pFTcljlQHYoU0unq8oJnCf0ztPiCjFBTmiB/ibLUh8ENaKpCg/BdSrxyBlCaFidHcTV7n+oAElub
	0pDnrh88k3Cs0dEUjL3mx+LIh39EcJxXvqzSJhLg/7LZB/vsAMCeZE+t5zIwSYpRDoBRUW9EB9Jul
	POM3jw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjW0V-0000000AzHa-3OIg;
	Tue, 14 Jul 2026 05:48:39 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjW0T-0000000AzH7-1Nla
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784008117; x=1815544117;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iaWPYz/PEYpLtc8hcV+XI7U4ojKHzqm3RCvrB1jQoY8=;
  b=CL3zdTHXWnj6a9tbPe4odchk12n9wPlTlcqnfIxZWzwglfLYG5Oegegi
   GGeAF58CLR/xl+PR+7MCUsPm/G9xKnWkUeDFRUozD6uytArM3od83C7Ee
   xekwiXbnOA9V3e1LHeHgQ6OHldN5QzqQ2kAxC4suT63370HTTWFNPbDnH
   03kPzosdOt+928BOTlVaRgo2d3LPVtOQ7Y0NXgZ8E1NjwL35C3n1RAdFt
   W6DKgjlrwB3HKgKVcGx6x7dETzCscNeDK3uAVPgNzC6ER2GvUTzRaGmb7
   j0/nyjn78MBlxNcFdS7PWDFpik0/hobxYBklaQLar1HjhzgGSKXWNIL4L
   g==;
X-CSE-ConnectionGUID: rqWcELoaR0+/kPFevR69EQ==
X-CSE-MsgGUID: 6esrtPWNSj2CtBo4fAbnfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84741774"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84741774"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:48:37 -0700
X-CSE-ConnectionGUID: YVfgNPWqQ4qIPwEDh/lsyw==
X-CSE-MsgGUID: owHzFtAaSI+EfbxjhDEj4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="280176911"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:48:33 -0700
Message-ID: <d119314e-613f-4077-b141-747e7d6f0501@linux.intel.com>
Date: Tue, 14 Jul 2026 13:46:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/18] iommu/arm-smmu-v3: Block ATS for a master upon
 an ATC invalidation timeout
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
 <939885143f3064811685b3f31f6f30f8a713c89e.1783044582.git.nicolinc@nvidia.com>
 <9a85cccd-29ed-4c51-b9cb-140631966d20@linux.intel.com>
 <alUzeyRh5FnzMiQ4@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <alUzeyRh5FnzMiQ4@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_224837_387836_FE4677DF 
X-CRM114-Status: GOOD (  17.99  )
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

On 7/14/26 02:50, Nicolin Chen wrote:
> On Mon, Jul 13, 2026 at 08:20:29PM +0800, Baolu Lu wrote:
>> My understanding of the sequence to quarantine a faulty ATS device is
>> to:
>>
>> 1. Identify the devices that encountered an ATC invalidation timeout
>>     failure.
>> 2. Have hardware block incoming DMA transfers and translation requests
>>     by clearing the corresponding bits in the device's context/
>>     translation table entries.
>> 3. Have software prevent the driver from submitting new invalidation
>>     requests or re-attaching a new domain to the device.
>>
>> If this understanding is correct, then while steps 1 and 2 are hardware-
>> and driver-specific, step 3 seems completely generic.
> 
> Step 3 is kinda driver-specific too for a few reasons:
> a. This is in the iommu_unmap() context; called right before that
>     function puts the kernel page. So, all the steps must be done
>     before kernel reclaims the page (potentially to a new ATS for
>     the same device whose ATC is stale).
> b. Invalidation can be an IRQ context. So, can't use group->mutex,
>     which a generic helper would likely need.
> c. Given (a) and (b), extra driver-level spinlocks are required:
>     streams_lock and master_domains_lock in this patch.

Yes, fair enough. The locking constraints here are tight, so keeping
this logic inside the iommu driver makes things simpler.

> d. Step 3 actually has two small steps: disable ATS at the driver
>     level; disable ATS entries in the invalidation array, either of
>     which are currently driver-specific.
> 
> Jason has a view of moving the arm_smmu_invs to the core. So, maybe
> step 3.2 (disabling it in the invalidation array) can be generic in
> the future.

Thanks,
baolu

