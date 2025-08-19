Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E288CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 02:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ao8fXZtUvfUvoPdx0AIjteI6JA+8VEuBqaU9kpWXW0o=; b=L6h7FpYPVn91USHE7Q99XTRJps
	JlLyGD/anrGznnuNwig43U2OPmkEXIjngCFizyForDm8zq/RA2RZTzF4JT+8jTrfd3DoHJ8CfzQpj
	kC14vt3YRHTpI9KvS+kL7K5fKYD0aRfKhbtYveHCpFhHFvx2uZ97O6cr1l7QZogXF/xbF1PKl/pK3
	/kZJ3ePz2L+a5j+1kU8BSHVOv/giR5HJQeIs/dCjL2bJrJO1zKixEOG6rJWfbSGaBElp6p0P4rcBr
	cCvdkUGBFNXtnN0/FE9MG2q2p5OgU4LVqIKdgmwNsPtPtkn59ZfhsJWpqGmqh7MNbm6Yk7q+PAGri
	L9+8abWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBva-00000009BqC-084n;
	Tue, 19 Aug 2025 02:18:22 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBpc-00000009B3P-36Ew;
	Tue, 19 Aug 2025 02:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755569533; x=1787105533;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CtWl+kAaj28FCmgEJf0e3j5MDGUJeH2tJY2k2qK3kWg=;
  b=PZPCCNkhwIMPyuaF6ORZfvK68QdD4paA8cb8msomTGqk+uzAqgIans4/
   t9ynyC6EDpGTkLJSq1HVT7+n/4NhPjuC9Z2NQO0YlTbtn+8Divp4fsZCz
   omDwuJ6D6WeEIFX1c7llldt86pUDm6Jexq67/e3dw9/GxD4LS59MRZtRR
   tx0U4EGJ10S6jE567QudZXJHR5MlBtPPPWI7qcbCgp4rpnIui2/xVRYW8
   aeQwch35Fd1+h0WmIL5b2xygzxFghiJpwUxHtasDVzvbasuSL3GB5xryx
   VHF5kSGEovUhzrDR7co10STiHeew5H/vzkgEfijX1P1LU6c19nD2JfSg8
   w==;
X-CSE-ConnectionGUID: mXUm4nRTQqCkJBQ5TCXpcg==
X-CSE-MsgGUID: 9hCkX5AuS1u+V6mfwbRUQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61637226"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="61637226"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 19:12:09 -0700
X-CSE-ConnectionGUID: BCj/97QQTnKrxK+MekdAiQ==
X-CSE-MsgGUID: TE75bEPQTWKJ1Q+sONEmGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="171944207"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 19:12:03 -0700
Message-ID: <ba8c8e60-5907-49d2-88ff-b9c6ab994d2f@linux.intel.com>
Date: Tue, 19 Aug 2025 10:09:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] iommu: Add iommu_get_domain_for_dev_locked()
 helper
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
 joro@8bytes.org, bhelgaas@google.com, will@kernel.org,
 robin.clark@oss.qualcomm.com, yong.wu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com,
 vdumpa@nvidia.com, jonathanh@nvidia.com, rafael@kernel.org, lenb@kernel.org,
 kevin.tian@intel.com, yi.l.liu@intel.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
 patches@lists.linux.dev, pjaroszynski@nvidia.com, vsethi@nvidia.com,
 helgaas@kernel.org, etzhao1900@gmail.com
References: <cover.1754952762.git.nicolinc@nvidia.com>
 <a69557026b7e2353bae67104bbe6a88f0682305e.1754952762.git.nicolinc@nvidia.com>
 <aeb04f91-ffce-4092-8dbc-17d116cd7c7e@linux.intel.com>
 <20250818144051.GP802098@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250818144051.GP802098@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_191212_916879_83E4F268 
X-CRM114-Status: UNSURE (   8.87  )
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

On 8/18/25 22:40, Jason Gunthorpe wrote:
> On Fri, Aug 15, 2025 at 01:28:02PM +0800, Baolu Lu wrote:
> 
>> Given that iommu_group->mutex is transparent to the iommu driver, how
>> about
> It is not actually transparent, alot of drivers are implicitly
> assuming that the core single threads their struct device for alot of
> the ops callbacks and we exposed the lockdep test to the drivers to
> help the document this.

Fair enough. It's the role of iommu_group_mutex_assert().

Thanks,
baolu

