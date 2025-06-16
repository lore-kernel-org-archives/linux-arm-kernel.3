Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C2DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFtxCva+tTZ4BlTJnTz0E2kGdzwiw695jZqo4sEbYZs=; b=v45QuhX3+mjPv7KRHpm87aPPJ6
	aXn2Yx685tT7EDX0/YuUdxojvsp7nGNSb8ckoqGlOlLVbDzWNkqkV49SERMh326djb+iINM/A+Dod
	Mev/mMskO0247Cqv5MKDeGF6NdZf+Tnz19deoVBAgEAhZXUpRxCci0RY9aYrFwn9dDfMLVcq0AsL+
	qY38U1CKvZxUmJIx7ZFwlJtXaRREa8BVXHB+0PY+Lc+NBqUMbOBLPKI5WdYByi/Ag0NH1J4wp+xcp
	+8kxB//vtfwDELe8d0yWhZnHV0KTKbM1cp8KSBu3jrqS/l2/bEJTszqFSHWeRKsimYLskU9kKuJdo
	Hl3A/dbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR95B-00000004O7I-36lv;
	Mon, 16 Jun 2025 12:37:01 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR877-00000004DTP-0DTS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073697; x=1781609697;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ojHEuztj0i3yHmHmm9T4QjxP+NTevWKTFSWpUEeibRQ=;
  b=SSdYGFHmirv6FtK1PnJJn/K3rpi9Okjk/d5sgWej9lItMuG/C503Nesz
   0f2Hh4F2wimLnhzEBLD4MpCD+He5vqg/zXpJlXfx5dlUFZ/3KG9ztPC8C
   +RnN55yYrqVA7azZuYETTIT1jXhSPn6IXQ+4LY/hyREzDUtBmVljAvKW3
   BddkUOuj2mvM5Fnl7Da/lMzqzrVgDtPSTHhkkOWs2P4Xzs9Zik19EQldo
   mQF58rY9s+zGxZ2rA6NPKr0aZkQpn9Ycul12JKQDXDiQt3yL48lzBfurK
   tRbSM+CJ5XaVIgewY834OeM39Lu/6l7t/OaTV1E8pd45yCHHNuTxYeHlC
   g==;
X-CSE-ConnectionGUID: u/2CKATOR6aj7IJ7vMkWaA==
X-CSE-MsgGUID: WvHUl+shS2qEIwvf4nXLXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69657843"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="69657843"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:34:57 -0700
X-CSE-ConnectionGUID: gaIal/9STnGso6QkRJ98mQ==
X-CSE-MsgGUID: u+WnkkfGQnmQxYoDn68uJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="152282524"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.243.252]) ([10.124.243.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:34:50 -0700
Message-ID: <68fda26e-f6d8-4be3-a411-a0cea13115b9@linux.intel.com>
Date: Mon, 16 Jun 2025 19:34:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, bagasdotme@gmail.com, robin.murphy@arm.com,
 joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
 jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
 nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
 mshavit@google.com, praan@google.com, zhangzekun11@huawei.com,
 iommu@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
 patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
 vasant.hegde@amd.com, dwmw2@infradead.org
Subject: Re: [PATCH v6 15/25] Documentation: userspace-api: iommufd: Update HW
 QUEUE
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <e6931ee1643d717f13bdc30e7dfd9eeb9fd0fafa.1749884998.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <e6931ee1643d717f13bdc30e7dfd9eeb9fd0fafa.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_043457_149600_68C3CACF 
X-CRM114-Status: UNSURE (   5.67  )
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

On 6/14/2025 3:14 PM, Nicolin Chen wrote:
> With the introduction of the new object and its infrastructure, update the
> doc to reflect that.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

