Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01ADCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 06:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hf+KlM64LNNVE7O9+mvl/RJLu1Tb3EG6siALgLBwUCE=; b=cmkzWF7GrBdQCXqpY6l+n20wmF
	XC6hsMuDBX4rfkAO8/tRa/b/K0tJtw57fdDUTtlGZugYi5tSLtxmLzvvlZzHHhod4wGmn68WpkQoR
	l1dQDBJtlNViRlzHZ1sKkofXxxUxyRr1mGCWlrc+CjFfwMymLPMgnCbNrWzr6nyvxhWo8jmG0HIBx
	KDrRHv3dkWtR10N4PaOKIQs3kinErN56A9X7wkafJzUPzynv4Ey2gaRwMeYa1eSTGzSL5rJHsHiUH
	Bz+mRry9T1MyznO3HsI5+3PZpk80/Zk7X7fJj1HTVB1oWxhEWxYWj9AGJBfHqVA/aYddem/6+Uzrm
	eNORnmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoD5-00000001dva-3hAz;
	Fri, 15 Aug 2025 06:46:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umn1E-00000001WuJ-1IRd;
	Fri, 15 Aug 2025 05:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hf+KlM64LNNVE7O9+mvl/RJLu1Tb3EG6siALgLBwUCE=; b=oLDz4NKueCvfqY99y4v5xmf1uy
	JgqIycDhStY1rGhnoCP1AxLD8PhlH4N3yE/WpoJXQY0XfKDioXP+X1gOziJLHUFUvSo5JA+dYYBRx
	73J7XRaz306cwV3YcG5R3ZNAWTAYbPPAhC57IHpKAishDhm+Kf2ATVKVerlqxxLZwj8qIlPRQPrBn
	UEX44iQhY6L3F40XRKzttjXWQ7Z4Kt8WIZ6Bw0Oj95QABj4SzKvui1kb2RLGJu7tv+Ee6ehvnS/J/
	iSvXD6733nV/HSFbf9WCv6wj12TyCYf4AkMH19L7GrKrEVksPXWiaiqyh5Zd4rpEARawNZnTm6zn0
	Q2smjjAA==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umn1A-0000000GcgO-2tMi;
	Fri, 15 Aug 2025 05:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755235821; x=1786771821;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y0xyaJyPtcDPNLHhbPevkPLJ5VRQZj0+f0qVNL2ihWc=;
  b=lCQcLeG1dS5V6/H3Nn0ZABizJ7oYTaZh2waLl2Q36mHsOfyiqRrJ4HkG
   RvjCoVaLZgKd2tGggE2M8VSfWF+FJds63BxmrmKQ3UCklSAaeJgtBlg+9
   UZwENbJPTsVT7/3NRvaJRuAvjBvmbMsRiLujWFbq9vFkDLQBico8J2K3k
   fx3aiQsliRHr4Ta/htAbgIDAl2348/caYWNj24uYahL+AOm95ARCcalOz
   cK3FFOUFQc3yqFNsjUwAlAXAKv4CaMC9eV94CUlufkTiA1UBKU0yl5yLi
   ZgeE5mz3YgLiXNtjGA3r6w5XmXRWFX+zpf2lm4WpkNaQ8c3npexjAAH1L
   Q==;
X-CSE-ConnectionGUID: b+EJo9d3RgC4H1QLFaMPfg==
X-CSE-MsgGUID: U3KTQhoxSV+OnsDRMSRN/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="82994977"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="82994977"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 22:30:15 -0700
X-CSE-ConnectionGUID: RseyzJmKT36kWr3vroMtQg==
X-CSE-MsgGUID: a9/KIfTrTBati7fQxiXAIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166914870"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 22:30:08 -0700
Message-ID: <aeb04f91-ffce-4092-8dbc-17d116cd7c7e@linux.intel.com>
Date: Fri, 15 Aug 2025 13:28:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] iommu: Add iommu_get_domain_for_dev_locked()
 helper
To: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
 joro@8bytes.org, bhelgaas@google.com, jgg@nvidia.com
Cc: will@kernel.org, robin.clark@oss.qualcomm.com, yong.wu@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 rafael@kernel.org, lenb@kernel.org, kevin.tian@intel.com,
 yi.l.liu@intel.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, patches@lists.linux.dev, pjaroszynski@nvidia.com,
 vsethi@nvidia.com, helgaas@kernel.org, etzhao1900@gmail.com
References: <cover.1754952762.git.nicolinc@nvidia.com>
 <a69557026b7e2353bae67104bbe6a88f0682305e.1754952762.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <a69557026b7e2353bae67104bbe6a88f0682305e.1754952762.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_063021_273342_4691607E 
X-CRM114-Status: GOOD (  19.11  )
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

On 8/12/25 06:59, Nicolin Chen wrote:
> There is a need to attach a PCI device that's under a reset to temporally
> the blocked domain (i.e. detach it from its previously attached domain),
> and then to reattach it back to its previous domain (i.e. detach it from
> the blocked domain) after reset.
> 
> During the reset stage, there can be races from other attach/detachment.
> To solve this, a per-gdev reset flag will be introduced so that all the
> attach functions will bypass the driver-level attach_dev callbacks, but
> only update the group->domain pointer. The reset recovery procedure will
> attach directly to the cached pointer so things will be back to normal.
> 
> On the other hand, the iommu_get_domain_for_dev() API always returns the
> group->domain pointer, and several IOMMMU drivers call this API in their
> attach_dev callback functions to get the currently attached domain for a
> device, which will be broken for the recovery case mentioned above:
>   1. core asks the driver to attach dev from blocked to group->domain
>   2. driver attaches dev from group->domain to group->domain
> 
> So, iommu_get_domain_for_dev() should check the gdev flag and return the
> blocked domain if the flag is set. But the caller of this API could hold
> the group->mutex already or not, making it difficult to add the lock.
> 
> Introduce a new iommu_get_domain_for_dev_locked() helper to be used by
> those drivers in a context that is already under the protection of the
> group->mutex, e.g. those attach_dev callback functions. And roll out the
> new helper to all the existing IOMMU drivers.

Given that iommu_group->mutex is transparent to the iommu driver, how
about

/*
  * Called only by iommu drivers in the callback context where
  * group->mutex has already been held by the core.
  */
struct iommu_domain *iommu_get_domain_for_dev_internal(struct device *dev)
{
	...
	lockdep_assert_held(&group->mutex);
	...
}

?

> 
> Add a lockdep_assert_not_held to the existing iommu_get_domain_for_dev()
> to note that it would be only used outside the group->mutex.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Thanks,
baolu

