Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD31EF513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 03:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Js0/Wa9Hzazbu3Sulv+rNAWlT76hgI7XmWbt/YJamI=; b=JSNY7b5Jr14DZ4ZbLPvtXEqlvs
	3yQ/EbRbawgICDvF4VpTpRHgv2EkQnIAaN93GurCmr+uHI/S2UMrzGmW4wzVfeP3uJqh8pU0LvsP/
	8VCDy91YRrO1am6sIyqEUOuPAMOVlRvbjlGiVwMBh3Cj1R9cGCJqoYYtgR0lFzPJoJRErUynkp9H0
	4EINaJg8orB7A9u8Y4CyjOjrrADjnPAklEJ5eHCx2UJ/4hRxPgfnSaElSxJV6qspZeQVgAB7Y2K93
	uC8AskGDakPUqx5dvcno5gCMVfFAqUXHXrKURNS4u7N75keFCSfPnG6SiSGSUiUmPwys3qR/yM0oX
	vh94FH/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLn0-00000002xAV-2bMq;
	Fri, 06 Mar 2026 03:23:46 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLmv-00000002x8D-22BN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 03:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772767421; x=1804303421;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tA9L12xlCsrK8dz+Fq8CyoLAozPl60QyKkM4A17q6sA=;
  b=aIcvfd5uOo+giMiNthmt1Ic2RKZJ84FfuyDZFvQveFS+GMCZEtEkPBjf
   V2ktv2UXzAI/4zCjaqOuY0o2H4r/k3oRIWu2tycWdhQ8ZXCArEHsSZtQz
   RrKMHqH0KLSytCjux3x1dTPK0vun0bhTuihpvu10z/P1fENIx6N74iT7G
   0qejrG6HNE2b7xThBhxZESFdA0OYymV3bgbs+Lw5lMoE8mstwwol3yxji
   9Qe3CH3EZ1LGe4MT1MRoEcXbzWr1otEfL/fNq4Jpo8KlkWPxYPZWSpuo5
   lOLvJ9Efo+3RFxdLRuCMw/hN6dp8vQqaXiWjYtEwaRIx45Fh2AtPRJ8gD
   A==;
X-CSE-ConnectionGUID: CrLNMgR8TvmnqYsnrdHWKg==
X-CSE-MsgGUID: DU3eZP4sR3GtPnPekoNy2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61446878"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="61446878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 19:23:38 -0800
X-CSE-ConnectionGUID: jD6OhW6aQNqpuQRqlhrT5g==
X-CSE-MsgGUID: ucmj+6C0SJKG4sfPqTw1Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223016462"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 19:23:34 -0800
Message-ID: <6416b7fe-0190-4c7b-9a62-5da7d5eea794@linux.intel.com>
Date: Fri, 6 Mar 2026 11:22:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 bhelgaas@google.com, rafael@kernel.org, lenb@kernel.org, praan@google.com,
 kees@kernel.org, smostafa@google.com, Alexander.Grest@microsoft.com,
 kevin.tian@intel.com, miko.lenczewski@arm.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, vsethi@nvidia.com
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260305153911.GT972761@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_192341_917900_FC580633 
X-CRM114-Status: GOOD (  18.73  )
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

On 3/5/26 23:39, Jason Gunthorpe wrote:
> On Wed, Mar 04, 2026 at 09:21:42PM -0800, Nicolin Chen wrote:
>> +	/*
>> +	 * ATC timeout indicates the device has stopped responding to coherence
>> +	 * protocol requests. The only safe recovery is a reset to flush stale
>> +	 * cached translations. Note that pci_reset_function() internally calls
>> +	 * pci_dev_reset_iommu_prepare/done() as well and ensures to block ATS
>> +	 * if PCI-level reset fails.
>> +	 */
>> +	if (!pci_reset_function(pdev)) {
>> +		/*
>> +		 * If reset succeeds, set BME back. Otherwise, fence the system
>> +		 * from a faulty device, in which case user will have to replug
>> +		 * the device to invoke pci_set_master().
>> +		 */
>> +		pci_dev_lock(pdev);
>> +		pci_set_master(pdev);
>> +		pci_dev_unlock(pdev);
>> +	}
> I thought we talked about this, the iommu driver cannot just blindly
> issue a reset like this, the reset has to come from the actual device
> driver through the AERish mechanism. Otherwise the driver RAS is going
> to explode.
> 
> The smmu driver should immediately block the STE (reject translated
> requests) to protect the system before resuming whatever command
> submissio n has encountered the error.
> 
> You could delegate the STE change to the interrupted command
> submission to avoid doing it from a ISR, that makes alot of sense
> because the submission thread is already operating a cmdq so it could
> stick in a STE invalidation command, possibly even in place of the
> failed ATC command.
> 
> I think I'd break this up into smaller steps, just focus on this STE
> mechanism at start and have any future attach callback fix the STE.
> 
> Then we can talk about how to properly trigger the PCI RAS flow and so
> on.

I believe this issue is not unique to the arm-smmu-v3 driver. Device ATC
invalidation timeout is a generic challenge across all IOMMU
architectures that support PCI ATS. Would it be feasible to implement a
common 'fencing and recovery' mechanism in the IOMMU core so that all
IOMMU drivers could benefit?

Thanks,
baolu

