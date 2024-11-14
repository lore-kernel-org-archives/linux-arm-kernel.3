Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA25DD637D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 00:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48QbS0wV71+lciELAGYSX4G4MTiPbgSWiyx4kmjOYnk=; b=KzLa7o8z59/W+d0pJNhcFDZYO/
	kV6jN2n1igMDhFXvCHLg27pAnqKB07fYCcN+5aKFo7QVdnlhcQnnYBN2GIMaM8xASPHYY9dP05hZO
	tBve9pFhD8Twa8hPbQWJ0XA1v33MtQ3g/dUSlbpL5usMEBpu6E45dnScQtmWJWxDN3MO4sEi3D5rG
	+AGdjQaMF1dg9putYa8ecyqQQyvFxYzpSFtIEZwqgyMPR5+RWMP/p70b3U2naw0l/FKJZ2rHifN4Q
	LCwwij3l8eAw/tqiPiaITeGqR60bpfjcO4p97b5aDpGsr0fJEmhwkopw6V6L5gV0zFwe5dfGCIvFj
	BT4aay/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBOA3-00000008Nw4-3bcV;
	Thu, 14 Nov 2024 00:56:39 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBO6S-00000008NWU-43Jm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 00:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731545577; x=1763081577;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h5sSTsp24D65G2XFtPO48h/kyNuKIpKzlGZiJU4kZtI=;
  b=GzswDRiK5/wBZBlZskfUYAPlIrKVgiH+YfQkMHDESnJPkY7sNQ59bDmS
   nAAQukqhE0ija9+giPE5ikDoydup1YS6u6eQyvqr0TIScSPSgEg0T5hEF
   qMcxr9BYDfSzqSU+5UBTzwJ+53z2cnSlTMNAL7F0WTeVFeZTM50ghRaFP
   vWKPVi35/5iqRj5ajhJJ00VgubGoalMosVEbOa3/Me6n31qwv4A7jcWBZ
   pBEpfGrs05EMZHKg6jpxQX1EkMimru9oplP+usaErL1kducKA65nPFTCj
   j/lSTiUIsIjAJMVH0bArGpEHHUGZNqBLMH6paOF+sLoWYqP/p3g/lHuHD
   A==;
X-CSE-ConnectionGUID: r+DjSB9TQDmwgekRxFewmA==
X-CSE-MsgGUID: ZWhMxSf0TSey7veJ2Ot2Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42879448"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="42879448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 16:52:54 -0800
X-CSE-ConnectionGUID: CE2x8RESTWyiyF9dktIJzw==
X-CSE-MsgGUID: VspIz9jaRZigJjTinNKxEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88020775"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 16:52:48 -0800
Message-ID: <6ed97a10-853f-429e-8506-94b218050ad3@linux.intel.com>
Date: Thu, 14 Nov 2024 08:51:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] Initial support for SMMUv3 nested translation
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>, acpica-devel@lists.linux.dev,
 iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Donald Dutile <ddutile@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Hanjun Guo <guohanjun@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Michael Shavit <mshavit@google.com>, Nicolin Chen <nicolinc@nvidia.com>,
 patches@lists.linux.dev, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Mostafa Saleh <smostafa@google.com>
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
 <20241112182938.GA172989@nvidia.com>
 <CABQgh9HOHzeRF7JfrXrRAcGB53o29HkW9rnVTf4JefeVWDvzyQ@mail.gmail.com>
 <20241113012359.GB35230@nvidia.com>
 <9df3dd17-375a-4327-b2a8-e9f7690d81b1@linux.intel.com>
 <20241113164316.GL35230@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20241113164316.GL35230@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_165257_117841_1F6C962F 
X-CRM114-Status: GOOD (  22.81  )
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

On 11/14/24 00:43, Jason Gunthorpe wrote:
> On Wed, Nov 13, 2024 at 10:55:41AM +0800, Baolu Lu wrote:
>> On 11/13/24 09:23, Jason Gunthorpe wrote:
>>>> https://github.com/Linaro/linux-kernel-uadk/tree/6.12-wip
>>>> https://github.com/Linaro/qemu/tree/6.12-wip
>>>>
>>>> Still need this hack
>>>> https://github.com/Linaro/linux-kernel-uadk/commit/
>>>> eaa194d954112cad4da7852e29343e546baf8683
>>>>
>>>> One is adding iommu_dev_enable/disable_feature IOMMU_DEV_FEAT_SVA,
>>>> which you have patchset before.
>>> Yes, I have a more complete version of that here someplace. Need some
>>> help on vt-d but hope to get that done next cycle.
>>
>> Can you please elaborate this a bit more? Are you talking about below
>> change
> 
> I need your help to remove IOMMU_DEV_FEAT_IOPF from the intel
> driver. I have a patch series that eliminates it from all the other
> drivers, and I wrote a patch to remove FEAT_SVA from intel..

Yes, sure. Let's make this happen in the next cycle.

FEAT_IOPF could be removed. IOPF manipulation can be handled in the
domain attachment path. A per-device refcount can be implemented. This
count increments with each iopf-capable domain attachment and decrements
with each detachment. PCI PRI is enabled for the first iopf-capable
domain and disabled when the last one is removed. Probably we can also
solve the PF/VF sharing PRI issue.

With iopf moved to the domain attach path and hardware capability checks
to the SVA domain allocation path, FEAT_SVA becomes essentially a no-op.

> 
>> +	ret = iommu_dev_enable_feature(idev->dev, IOMMU_DEV_FEAT_SVA);
>> +	if (ret)
>> +		return ret;
>>
>> in iommufd_fault_iopf_enable()?
>>
>> I have no idea about why SVA is affected when enabling iopf.
> 
> It is ARM not implementing the API correctly. Only SVA turns on the
> page fault reporting mechanism.
> 
> In the new world the page fault reporting should be managed during
> domain attachment. If the domain is fault capable then faults should
> be delivered to that domain. That is the correct time to setup the
> iopf mechanism as well.
> 
> So I fixed that and now ARM and AMD both have no-op implementations of
> IOMMU_DEV_FEAT_IOPF and IOMMU_DEV_FEAT_SVA. Thus I'd like to remove it
> entirely.

Thank you for the explanation.

--
baolu

