Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D31CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pvrAV4dyUrKpFMxdZjbVhL17Fdp6anuNMYv9Z5PvqM=; b=GekUAQjsUqml9Hy1a1jbOpX86z
	74YyUe2dKWV7wwZGGXgSqkqueK43gPtuZGc1aOgfyJzemOl7Fu5SxTa5eVjAElfoLV39Ya4iTkcpm
	pPtn8R70IUCFMudGdG+PCSSWXEyMsyK/eDzmzkVfaJe+IFYYxWPdILkm9gXOBqKCV/jj3bAzU3rxk
	iwP9HnqCgmcD1s8kX5znNLdyUcEm1/npSgAjWaTiqKhD3CgGOm/tHOh60y4gimgwSHz9X4/zkI+y1
	0PP6qbJyL2SqKRrxL2bj4W/UsG5Rai2ndAV9tzf4TfCaJp8WpfRwELHo/Xq5TRaMy5/zC4dDHarLM
	c9KHYLHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9RV-00000006jUs-0bcx;
	Wed, 10 Jun 2026 03:17:25 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9RT-00000006jUN-0RKz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781061443; x=1812597443;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0EEZiPOgIhJKF7ggkB4ySQ088W91sUeLQCXaineGcS8=;
  b=nC7WrJUqv0qRuV7H3bqXBBHJaOaNdZeHaOhOd34J+gvXMsoXuUy0GOHh
   EZIW/Og+Fob3Mx6M3Qd4NP2RHpmwHKeHkQu706ifqViPg4W97puHocxO+
   y+SF+f6OF3JmdTQJ5nrDbinrmNdVH0Lv+WSglsbc6tGmSL4cwm0Jh7VXZ
   KhWRB8vHM6TjtDrS/vB2nwnIMfaIR/gY5Vgf5vr9JMulfRxJ4+33+T+Na
   lrEQ5qWxeEevJQxIOsNUSLXHtHmWYnfMctlLjBzn63So5qlxbBvV+DE6+
   dlbrEoTa03JyHvnqJG0o95s/Jfe29sCOnVoKcS98YkjeQUZg0MyKijebc
   Q==;
X-CSE-ConnectionGUID: qXWrvRX8Q/uri8LRyy6I0w==
X-CSE-MsgGUID: 7JgqyrbcSYGcmGfIMNzKpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="69379169"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="69379169"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:17:20 -0700
X-CSE-ConnectionGUID: nrt6CnzBQhSMVAAkpuxs4A==
X-CSE-MsgGUID: qfKH81A3QUSFwkYW5xaSsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246067137"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:17:17 -0700
Message-ID: <b2119f23-190b-4dcc-bc63-9554f0f8383a@linux.intel.com>
Date: Wed, 10 Jun 2026 11:16:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] iommufd: Set upper bounds on cache invalidation
 entry_num and entry_len
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Shuah Khan <shuah@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Kees Cook <kees@kernel.org>, Yi Liu <yi.l.liu@intel.com>,
 Eric Auger <eric.auger@redhat.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1780521606.git.nicolinc@nvidia.com>
 <447fa93663f7526eb361719e83fa8b649464483d.1780521606.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <447fa93663f7526eb361719e83fa8b649464483d.1780521606.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_201723_206097_B9877989 
X-CRM114-Status: GOOD (  11.63  )
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

On 6/4/26 05:26, Nicolin Chen wrote:
> iommufd_hwpt_invalidate() takes a user-controlled entry_num and entry_len,
> each bounded only by U32_MAX. An entry_len beyond the kernel's struct size
> makes the copy helper verify the extra bytes are zero, scanning that excess
> in one uninterruptible pass; a multi-gigabyte value over zeroed user memory
> trips the soft-lockup watchdog.
> 
> A large entry_num is the other half, driving the backend invalidation loop
> with no reschedule. The VT-d nested handler, for one, copies each entry and
> flushes caches per iteration, pinning the CPU on a non-preemptible kernel.
> 
> Cap both in the ioctl. entry_len is held under PAGE_SIZE, above any request
> struct, and entry_num under 1 << 19, the order of a hardware invalidation
> queue and well beyond any real batch, bounding the per-call loop length.
> 
> Fixes: 8c6eabae3807 ("iommufd: Add IOMMU_HWPT_INVALIDATE")
> Cc:stable@vger.kernel.org
> Assisted-by:Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommufd/hw_pagetable.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

