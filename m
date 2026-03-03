Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD11EB365B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 03:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABhtY6M1JmeNKU1d6FxQZ7cU/CvuafUwOqA+F40tdok=; b=zVa2+UPEd+CkA6GyruUB0Sg7pN
	yzL+DhXMA5MfIj6cy5pg+khzX2h5GSgPJ7mMY3L7GrqgrLi7U/joGg0Vxjagzp9GBpuSrpYDebwEG
	y6oMq13rIlEl4WOYEHQdpZ7QJ1+GdgGRLXVVZ1tUTCpTdVfZhvdBBzjCro7BdM8M0U+BlkS0udllE
	LcAT97L31XTKMsmCMqAjsAA+TRXK5V/6Zz/xSLPzb7VcrErV8QZnhpT1vMCSiUT4C0LZhfLMeli5B
	mt8TirRorfK1rgPdeZStytYOH2vHVtbRdVzqT57VVhZIeNnuXdjBJ93yR5N0TuEaqEAnIgjG7OGTU
	+L2PI6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxGHl-0000000ERzH-29Pd;
	Tue, 03 Mar 2026 03:19:01 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxGHf-0000000ERxs-0PyX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 03:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772507935; x=1804043935;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l923nHARXvxldp8HwLbBb+URjQ2HlXto05e/xD5h+m8=;
  b=JuEAlMWq9L3QXIuo9rzYKoSNp9dUXZkJaALex7oHkgQ4uI0bUt2Q6xPD
   9ebx0/eoj0uhE4/WKZ4RaePiVSgbIhV/+XqB7UKpfCAA/Pqan0R6MDXgg
   iMti/anfifdU/9C05iEu0EnPthuza4pB5ZiPJ9usGNVHnxxTZ7A+MIfro
   g5q26Di373c8CBi5S6qfUGkoyighlci4CWtt4JQC3QpWj8ActRARxVrjR
   jIRsraYhV0FO/zm3n3lqzcHN2CVnc9qliN1aJh+36MD9TQy1Wyn0pXs3V
   FU4tcYrNAFTGxqSaz2irxz+nmigYIXLVNbIy3gysL3q9exEX/A1AO16Ew
   Q==;
X-CSE-ConnectionGUID: Ve1J+HKjS4+lohoOdhgtVQ==
X-CSE-MsgGUID: vqNLwzQwRXG7tlc1HHpvEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="76133327"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="76133327"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 19:18:50 -0800
X-CSE-ConnectionGUID: /tj9ZBAGRyubWi/4mV50Tg==
X-CSE-MsgGUID: 0WZfaMdQTba8MPCUc9GxOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="222839607"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 19:18:46 -0800
Message-ID: <102ceb37-c89d-4bb0-a471-42ccffb40c34@linux.intel.com>
Date: Tue, 3 Mar 2026 11:18:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, will@kernel.org,
 robin.murphy@arm.com, bhelgaas@google.com
Cc: joro@8bytes.org, praan@google.com, kevin.tian@intel.com,
 miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, dan.j.williams@intel.com,
 jonathan.cameron@huawei.com
References: <cover.1771886695.git.nicolinc@nvidia.com>
 <ad4efe2f85958ee1ab0673a1ceb0db5141852732.1771886695.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ad4efe2f85958ee1ab0673a1ceb0db5141852732.1771886695.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_191855_160565_B0EACD96 
X-CRM114-Status: UNSURE (   9.16  )
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

On 2/24/26 06:52, Nicolin Chen wrote:
> +/**
> + * pci_ats_always_on - Whether the PCI device requires ATS to be always enabled
> + * @pdev: the PCI device
> + *
> + * Returns true, if the PCI device requires non-PASID ATS function on an IOMMU
> + * bypassed configuration.

Including iommu-specific policies and configurations here might cause
confusion. How about making it simply as: "Returns true if the PCI
device requires ATS to be enabled for functional operation"?

> + */
> +bool pci_ats_always_on(struct pci_dev *pdev)
> +{
> +	if (pci_ats_disabled() || !pci_ats_supported(pdev))
> +		return false;
> +
> +	/* A VF inherits its PF's requirement for ATS function */
> +	if (pdev->is_virtfn)
> +		pdev = pci_physfn(pdev);
> +
> +	return pci_cxl_ats_always_on(pdev);
> +}
> +EXPORT_SYMBOL_GPL(pci_ats_always_on);

Thanks,
baolu

