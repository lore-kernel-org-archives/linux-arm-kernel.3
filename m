Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E44C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 03:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YN/HNnZs0L2xALo+Gmm16O4kXxmlGdo6bUKeEqCGQ/g=; b=47fvf3ZwhET3DVBtWcRKkO4QeK
	v3hdaqBhgr8h/Mlns/MTVey7eXl6gA+FHituGyl8FF9b1ofbYiroCRFzWg4SM9EFKODrJCVr1tebZ
	HPpHLZ6uh3qJrTseP00GfjLdu6QEzjw6F/nIZE+sxsNsgsx9sxln4mSebDCcP9o+ztUUxWlfmQFFT
	vfZ62//HhEXPytRgYB5BvqlhrvMmt1V/LZvVZeMFFV3B59SFhgLY9d3wPD5krVvRGncI1jwDSdLTN
	0fYL/wiB4Ft6rczM95gmmXdLZp+uGX4m3hHJj2q5xThKS9jRO+o5d6Lzn2mtEY0+XDGCFqhgxWvbh
	LWkqX3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0te-00000003ITD-17Ak;
	Mon, 16 Jun 2025 03:52:34 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0Vj-00000003Fvm-0VmR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 03:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750044472; x=1781580472;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TlV55p7OgqzS+AWh4h3XVQ+nE9CHnltiO69/D4Lbz4Q=;
  b=I7QchXcHG6kEu44Osmk3+1DVy7C1Fqww10/9Z+bHzLgV1IMiF9kDTkm1
   I9+wEzZJrlAhIVpYR2ls3mvZkiViGP+mkmoemubIFAL7VFqGY1yrBiIIS
   KuN3AXqiIKVi4VZZSnYHfo5A/1vhuWl07uHK2oeXFQuyYsBQcTDODtULa
   GVhuxI6x2jQu280CIlN3bOZwqkaLBJtsGEpTowHiRqt+5MEUumGUAjsWH
   CbLMClIhDVEFTrQUK2ItJCWivGTO/+rdH7Z77csQzm6hz3HQgr+SaI2aT
   icSwf3ULN72xY6k6IUUNU4lf3lakAgWl/XUVoD0A4yngPKsXgXtVDJFOu
   g==;
X-CSE-ConnectionGUID: sIuJ+sPqSCuCXJ2KgviugA==
X-CSE-MsgGUID: gfQ0TgaoQx+adknIiZA+Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52269801"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="52269801"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:27:51 -0700
X-CSE-ConnectionGUID: hno7wtDNSX+T+IoxOBED1Q==
X-CSE-MsgGUID: b9Xltt6LRP63ykeBftQHHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149262520"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 20:27:47 -0700
Message-ID: <ca17f684-b95f-4eb5-8371-243d72048e38@linux.intel.com>
Date: Mon, 16 Jun 2025 11:26:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] iommufd: Move _iommufd_object_alloc out of
 driver.c
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <79e630c7b911930cf36e3c8a775a04e66c528d65.1749882255.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <79e630c7b911930cf36e3c8a775a04e66c528d65.1749882255.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_202751_228093_63EA26CE 
X-CRM114-Status: UNSURE (   5.53  )
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

On 6/14/25 14:35, Nicolin Chen wrote:
> Now, all driver structures will be allocated by the core, i.e. no longer a
> need of driver calling _iommufd_object_alloc. Thus, move it back.
> 
> Before:
>     text	   data	    bss	    dec	    hex	filename
>     3024	    180	      0	   3204	    c84	drivers/iommu/iommufd/driver.o
>     9074	    610	     64	   9748	   2614	drivers/iommu/iommufd/main.o
> After:
>     text	   data	    bss	    dec	    hex	filename
>     2665	    164	      0	   2829	    b0d	drivers/iommu/iommufd/driver.o
>     9410	    618	     64	  10092	   276c	drivers/iommu/iommufd/main.o
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

