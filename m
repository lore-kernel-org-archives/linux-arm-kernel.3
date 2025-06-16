Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6159EC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6b2C6Lfu2VwRW+fVFAKBtBy6XA6ebrpaLKCr/+1mlvk=; b=qIt6t9MC7vMlienWUGT0yjUHmu
	pAY8ZaEGQFa6F0nDiZvARnHgV90nm55Cm77abCCNkgIf03DjZcNIfnwZsxbRO80lvWyVipr9i4jm1
	+UwsCMWGL8GQmWGG9umx14mEX0KSsD0FH5nndRgh90FDmcVWc9IJC0U5tAhPGLrlUlAY3d4C6BiFN
	G40JZmVyny17qSZ5YTahVdEEmQuj2tkujQCOlQbX16tCU5swGWqmSoHcWyvWEvH4d42osYPRrZkhf
	UEKRfMPjvBGw8toYGnOKSvlV0C6Z+MzL+mjLQgpEMuElhCHmnY8ivRzXUEb8dEwxF94FkOZf3CWR8
	5dE4Fa4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3M2-00000003Vw3-1KLj;
	Mon, 16 Jun 2025 06:30:02 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3Ie-00000003VT3-36Xl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 06:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750055193; x=1781591193;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HM/nycRhtf8N42uu6R05gdsOLIoLfoh3SEuT7ZJryPI=;
  b=gKlG62xzu4UiRGbbS/8UujqNGNbmqC1NK1ykVcNIDIyFC3BakmYtgmgc
   dTLQ7mAFkZ7rjihwFcCrI7iRtEa2jFUZjNyheCUe+Mie65VW7qov6ZHE4
   qePGy4D9PHN64Aq/m8WN3TY9mmrwkAYk8cQ4DOWQO3PfRyokQRhNUDaf8
   N23gMDF6OGDRY0SLsMxx0guaULFk3knoTdotJV/cr5Dsd1zuf3Ae2vWop
   LUO9rcNuOwrd86bo5NgANLrNaQ7myI/0ZChPwXecx0MFotHWbekmaDnUY
   S9wZkJQHDa9QLBMcXeqqCAcTp8dKjg/RZ9mDGp9ahWUsoLrL2IndInyeu
   g==;
X-CSE-ConnectionGUID: XnQGPgKETiqdpUFQ37um+Q==
X-CSE-MsgGUID: DHvyb40FQZGU+5mwTu7ADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69632408"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="69632408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 23:26:32 -0700
X-CSE-ConnectionGUID: bbwYisgpS32dkyJ6Bx5rnw==
X-CSE-MsgGUID: cFHQS0MtTmmVQHGxTz19LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148841753"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 23:26:25 -0700
Message-ID: <4bee4885-3e30-4376-947e-eae881e757d7@linux.intel.com>
Date: Mon, 16 Jun 2025 14:25:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/25] iommufd/access: Allow access->ops to be NULL for
 internal use
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
 peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
 praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev, mochs@nvidia.com,
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com, dwmw2@infradead.org
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <e6a989c4dd9cb94aa4a98d46ed56a2afcb41b70d.1749884998.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <e6a989c4dd9cb94aa4a98d46ed56a2afcb41b70d.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_232632_854658_4F5C2287 
X-CRM114-Status: GOOD (  10.06  )
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

On 6/14/25 15:14, Nicolin Chen wrote:
> The access object has been used externally by VFIO mdev devices, allowing
> them to pin/unpin physical pages (via needs_pin_pages). Meanwhile, a racy
> unmap can occur in this case, so these devices usually implement an unmap
> handler, invoked by iommufd_access_notify_unmap().
> 
> The new HW queue object will need the same pin/unpin feature, although it
> (unlike the mdev case) wants to reject any unmap attempt, during its life
> cycle.
> 
> To reuse the access object for the new HW queue, allow its access->ops to
> be NULL. Error out a NULL access->ops in iommufd_access_notify_unmap() to
> reject an unmap operation and propagatethe errno upwards.
> 
> Then, update iommufd_access_change_ioas() and iommufd_access_pin_pages(),
> to allow this new use case.
> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

