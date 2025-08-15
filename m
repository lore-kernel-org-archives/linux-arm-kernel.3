Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F891CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 05:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcpbxuwfjsk8ja+dfts2UkmPV4eGfiEsAzYzWBYW6k4=; b=3Y1wrow+e2A5QeNDyqZgSTZeNG
	qecPJ0ltiZ4xkZ4GUtYrYm6nHxlOLljSnz+gHf/NqZROIHSv+1huhxNLYlJTZadA4se2qXoUF1Ata
	c6aGtCjrzWcF+OZYqg+Zrjl1utQg2MVdUDAtTjFwUi6pP/kk5RwQgri84q+1GK5MDaiC4VDVwNV4c
	GsDEKORxYLRimP17hIz3/zb7wXP3CNYpxQGIn67LNqso3MP/SONoCrzxdST/OXVmOIB0dVZiNPRDl
	CVSfGvvdW3lZQPCVXLN529F8dBtSpLSGgWTHF+W3Ls0aEMSZhinnPslWt8hQvMRC+yyLobW3uo/tv
	YvbA42GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnOw-00000001YXK-1jmY;
	Fri, 15 Aug 2025 05:54:54 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnMJ-00000001YKb-3Syk;
	Fri, 15 Aug 2025 05:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755237131; x=1786773131;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0vH1jDcgJGA2Wn7lpJdojReOpMDMj8xScxd5knXRY9g=;
  b=CnWy8sB/ggZP4crbNsWAd2LM45vyVDYJcpP/gZhG5xyMZ2MI/imI8Mkd
   BSYXeCuoNtMIPwIuz6U3AR+PKElEYSqgtieRzougFFInF6+AaKA47lCKo
   1uPIqU8JuVwu7i1A85zloS2UGZohkYZ0KeWZR18phcMjVWz6AHaRIR7ex
   W9ufy1IlACDR7u94On9BhQQe8WL7z2K93RiL7mn1RpIje40botowIsw04
   EbgmlkwpD9YXsXBIR6+GehkSFN4AmWa/UsbXcvI07A7TtYqga6tsk/4SA
   o0EwCrdL53Eb2nTh6H/6YX4qL9JWoJuF5Kk4Wp+S18pGTlhcRqQgh5Z1I
   Q==;
X-CSE-ConnectionGUID: QcBA1QOTTP612gDS4WkNdA==
X-CSE-MsgGUID: d9OAebbaTWej1uMwqKw1kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57488206"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57488206"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 22:52:08 -0700
X-CSE-ConnectionGUID: QsCBNTNzS2uKIJOGMmnTTA==
X-CSE-MsgGUID: wssFlJjGSga9ENc1rcVaxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197937723"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 22:52:02 -0700
Message-ID: <7b8d8bfa-ca6b-4a07-8a4d-a30d8993c7c7@linux.intel.com>
Date: Fri, 15 Aug 2025 13:49:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] iommu: Introduce iommu_dev_reset_prepare() and
 iommu_dev_reset_done()
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
 <5ba556fc54777853c499186f494f3411d7a4a5a9.1754952762.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <5ba556fc54777853c499186f494f3411d7a4a5a9.1754952762.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_225211_907851_40FAE48D 
X-CRM114-Status: GOOD (  16.95  )
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
> PCIe permits a device to ignore ATS invalidation TLPs, while processing a
> reset. This creates a problem visible to the OS where an ATS invalidation
> command will time out: e.g. an SVA domain will have no coordination with a
> reset event and can racily issue ATS invalidations to a resetting device.
> 
> The OS should do something to mitigate this as we do not want production
> systems to be reporting critical ATS failures, especially in a hypervisor
> environment. Broadly, OS could arrange to ignore the timeouts, block page
> table mutations to prevent invalidations, or disable and block ATS.
> 
> The PCIe spec in sec 10.3.1 IMPLEMENTATION NOTE recommends to disable and
> block ATS before initiating a Function Level Reset. It also mentions that
> other reset methods could have the same vulnerability as well.
> 
> Provide a callback from the PCI subsystem that will enclose the reset and
> have the iommu core temporarily change all the attached domain to BLOCKED.
> After attaching a BLOCKED domain, IOMMU drivers should fence any incoming

Nit, my understanding is that it's not the "IOMMU drivers" but the
"IOMMU hardware" that fences any further incoming translation requests,
right?

> ATS queries, synchronously stop issuing new ATS invalidations, and wait
> for all ATS invalidations to complete. This can avoid any ATS invaliation
> timeouts.
> 
> However, if there is a domain attachment/replacement happening during an
> ongoing reset, ATS routines may be re-activated between the two function
> calls. So, introduce a new pending_reset flag in group_device to defer an
> attachment during a reset, allowing iommu core to cache target domains in
> the SW level while bypassing the driver. The iommu_dev_reset_done() will
> re-attach these soft-attached domains, once the device reset is finished.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

The code looks good to me:

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

