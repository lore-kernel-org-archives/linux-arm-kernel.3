Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F9DCED240
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 05:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGd4/hQmuXL/n/Pw4ubEdvbhAmPtydMV7Dhe1goYN8o=; b=yRbol93VHuvRxai8JTXSJ17xty
	RLQvsWXaGR2NGkBSw6nNObeNpuvMZNA4FB4mqA09VnxILmdCcw/ds1pUlD81ibLmMP9Mb+E/sBW9L
	fPBSMsaL7oZt21zY3d7Ui9WxN75HaH8VR6hJSN0ceOUXnkZrZn8k5mM7XDgya73qEvPYAYKC9Rz/9
	h3ciEVeqrLuBSdMTaBUnaPIjEpD96f58Df0ERRHJLGUTYACz1H9GgBCOB/AounZR8oRcaLir6M//m
	Ok+dfSswctTBZXZ7dmBjKM6CWomDzc2ZQ5FrNNQao1ec/Jhsc2Pj5MmepTtleA1NEBMHzrjsO8aSa
	vqhYwHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEUa-0000000HROy-0MGb;
	Tue, 18 Nov 2025 05:43:04 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEUY-0000000HROd-0w0R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 05:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763444582; x=1794980582;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VbFlU1LcdUBsBT5iUvR+tT4oc46fne2Q1MslnRGjrXM=;
  b=QispXZ+m09PwOVXkH4EdIpxFIjsm2yTTHCXu0bDVuo8UGN9zzOhVgZYy
   JbFR2uLttuh5ioohv14mrE/682md02/tri0I03Q85efaNVgBQOkZmua27
   CJMDa2AtkVE3rV32y3BWfEAPiRjJUEtvCe/Wn+CaH6EKAf3pMg012UERL
   ozjuI4husDiKygcIqF6awOyWGOU0tzoUC9kTS7wtce1p138ZRwa2iiDtC
   5KTwfaj5ef9tapWCCt/DIc09GHSBJfSoRu96vrqzQODt77MPsoJZ68fjm
   +pvi9SVhmbKAbla14SkT0ocICWaX4Bkx14KUf8FEFXQLptQRryxsGfBvY
   g==;
X-CSE-ConnectionGUID: 3j892OOuQlOYOLfdP/5oNA==
X-CSE-MsgGUID: wCi4gz88QPKpFod2uMHDmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="53028422"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="53028422"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 21:42:59 -0800
X-CSE-ConnectionGUID: g55xazAASY6gp1sqPcfseQ==
X-CSE-MsgGUID: 9IDYRVS6RdmXV8k/XcCKXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="189924294"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 21:42:54 -0800
Message-ID: <4eeda61a-c71d-4ad1-8ac7-a14942f7a864@linux.intel.com>
Date: Tue, 18 Nov 2025 13:38:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] pci: Suspend iommu function prior to resetting a
 device
To: Nicolin Chen <nicolinc@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
Cc: "joro@8bytes.org" <joro@8bytes.org>, "afael@kernel.org"
 <afael@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "alex@shazbot.org" <alex@shazbot.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "will@kernel.org" <will@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "Jaroszynski, Piotr" <pjaroszynski@nvidia.com>,
 "Sethi, Vikram" <vsethi@nvidia.com>, "helgaas@kernel.org"
 <helgaas@kernel.org>, "etzhao1900@gmail.com" <etzhao1900@gmail.com>
References: <cover.1762835355.git.nicolinc@nvidia.com>
 <a166b07a254d3becfcb0f86e4911af556acbe2a9.1762835355.git.nicolinc@nvidia.com>
 <BN9PR11MB52762516D6259BBD8C3740518CCAA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aRduRi8zBHdUe4KO@Asurada-Nvidia>
 <BN9PR11MB52761B6B1751BF64AEAA3F948CC9A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aRt2/0rcdjcGk1Z1@Asurada-Nvidia>
 <BN9PR11MB527649AD7D251EAAFDFB753A8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aRvO9KWjWC5rk/Vx@Asurada-Nvidia>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <aRvO9KWjWC5rk/Vx@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_214302_283887_4945B612 
X-CRM114-Status: GOOD (  14.49  )
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

On 11/18/25 09:42, Nicolin Chen wrote:
> On Tue, Nov 18, 2025 at 12:29:43AM +0000, Tian, Kevin wrote:
>>> From: Nicolin Chen<nicolinc@nvidia.com>
>>> Sent: Tuesday, November 18, 2025 3:27 AM
>>>
>>> On Mon, Nov 17, 2025 at 04:52:05AM +0000, Tian, Kevin wrote:
>>>>> From: Nicolin Chen<nicolinc@nvidia.com>
>>>>> Sent: Saturday, November 15, 2025 2:01 AM
>>>>>
>>>>> On Fri, Nov 14, 2025 at 09:45:31AM +0000, Tian, Kevin wrote:
>>>>>>> From: Nicolin Chen<nicolinc@nvidia.com>
>>>>>>> Sent: Tuesday, November 11, 2025 1:13 PM
>>>>>>>
>>>>>>> +/*
>>>>>>> + * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software
>>> disables
>>>>> ATS
>>>>>>> before
>>>>>>> + * initiating a reset. Notify the iommu driver that enabled ATS.
>>>>>>> + */
>>>>>>> +int pci_reset_iommu_prepare(struct pci_dev *dev)
>>>>>>> +{
>>>>>>> +	if (pci_ats_supported(dev))
>>>>>>> +		return iommu_dev_reset_prepare(&dev->dev);
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>> the comment says "driver that enabled ATS", but the code checks
>>>>>> whether ATS is supported.
>>>>>>
>>>>>> which one is desired?
>>>>> The comments says "the iommu driver that enabled ATS". It doesn't
>>>>> conflict with what the PCI core checks here?
>>>> actually this is sent to all IOMMU drivers. there is no check on whether
>>>> a specific driver has enabled ATS in this path.
>>> But the comment doesn't say "check"..
>>>
>>> How about "Notify the iommu driver that enables/disables ATS"?
>>>
>>> The point is that pci_enable_ats() is called in iommu drivers.
>>>
>> but in current way even an iommu driver which doesn't call
>> pci_enable_ats() will also be notified then I didn't see the
>> point of adding an attribute to "the iommu driver".
> Hmm, that's a fair point.
> 
> Having looked closely, I see only AMD and ARM call that to enable
> ATs. How others (e.g. Intel) enable it?

The VT-d driver enables ATS in the iommu probe_finalize() path (for
scalable mode).

static void intel_iommu_probe_finalize(struct device *dev)
{

[...]
         if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev)) {
                 iommu_enable_pci_ats(info);
                 /* Assign a DEVTLB cache tag to the default domain. */
                 if (info->ats_enabled && info->domain) {
                         u16 did = domain_id_iommu(info->domain, iommu);

                         if (cache_tag_assign(info->domain, did, dev,
                                              IOMMU_NO_PASID, 
CACHE_TAG_DEVTLB))
                                 iommu_disable_pci_ats(info);
                 }
         }

[...]
}

iommu_enable_pci_ats() will eventually call pci_enable_ats() after some
necessary checks.

Thanks,
baolu

