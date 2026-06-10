Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501A9CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOX7k3V0qarj/nUyhS+yBcKJWZjFgW3WPabA3SxGOOI=; b=HJGJ3lmzvLWtBDa4+9RNtaAKxH
	VfFz9pyfvdU+IUSBr3jKOh2TTZRrTSAMMGgwFl/GhbhY91F8EYjyhSQBpn++uTEBBNXeOl1GnEHd+
	mXrt53FE4diswFn6N6EHVNMNIi5vs1UlQllJ9+hI8UUNOjHdmZwgLuM+gI3BLS+8y3fAd3r7ZuUvX
	fUrNjpQbpgfmkEg3YqeA+eBvP11xR3IthLMBkmprmGdKcpHgyo3IZ+l1DVhjkvOONFp/1/jJ1lkys
	802U5146sTvBJvC0atuwE209c23qQcipvpzLhaQG1+2e83gmoRyDnozZX63/pgtBRejxAGAi5q67L
	lNSEkoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Wt-00000006jyV-0lBL;
	Wed, 10 Jun 2026 03:22:59 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Wq-00000006jy1-1OH0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781061776; x=1812597776;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YrWemvFOnoDyzRs4mVeFr05jMmA+83uJCITCnLbO+Qw=;
  b=jZRMZjutKqzumhpGks6Hso+IQOYiJqosA63PNbkqaRwk/jdyuMuJPY+O
   3ecyB+LxTeoXNkGpuEWfDCr1BdGNiWPtkehN/65FrTIawOToSLlNKWyHT
   Cm65CUBn42ZG4y17zzksvHScfntPw24jtPgKC367UCUzHOK0hjf0kgbrN
   D5jt3XcgHg+UfRhFPvmDdPTzd5zN2iPlnMQBWQp+d5hg0lKt6dQb0MsMJ
   3qe/WS4akZ1XddagVsTp4GxVvROsA/bx//wfVOTE1/UDz4G/uV5X8/n3X
   H/X4Bcxq3Sqgqv0Enm7p5fW1Lgfw8V7wjKiGrx6WeCgbsEDTIQht7/viM
   g==;
X-CSE-ConnectionGUID: j70vHPKRQOev/W50gyYqxg==
X-CSE-MsgGUID: 0ZC++dubQcWtqEbKBEu46w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84414109"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="84414109"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:22:56 -0700
X-CSE-ConnectionGUID: nPiNJsxIT46mPiQ44RURsg==
X-CSE-MsgGUID: 8Vm8nmjOSnqWUTkdHpMCWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="269720293"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:22:53 -0700
Message-ID: <414a7d18-037b-4361-8b43-84e618f256f1@linux.intel.com>
Date: Wed, 10 Jun 2026 11:21:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] iommu: Avoid copying the user array twice in the
 full-array copy helper
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Shuah Khan <shuah@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Kees Cook <kees@kernel.org>, Yi Liu <yi.l.liu@intel.com>,
 Eric Auger <eric.auger@redhat.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1780521606.git.nicolinc@nvidia.com>
 <6c9eca4ff584cb977661e97799ac6fe934e7f51c.1780521606.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <6c9eca4ff584cb977661e97799ac6fe934e7f51c.1780521606.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_202256_389840_F694AE18 
X-CRM114-Status: GOOD (  11.98  )
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
> iommu_copy_struct_from_full_user_array() copies a whole user array into a
> kernel buffer. In the common case, where user entry_len equals destination
> entry size, it takes a fast path and copies the whole array with a single
> copy_from_user().
> 
> That fast path does not return, so it falls through into the item-by-item
> copy_struct_from_user() loop and copies every entry a second time. For an
> equal entry_len that loop is just a copy_from_user() of the same bytes, so
> the whole array is copied twice for no benefit.
> 
> Return right after the bulk copy. The per-item loop then runs only on the
> slow path, where entry_len differs and each entry needs size adaption.
> 
> Fixes: 4f2e59ccb698 ("iommu: Add iommu_copy_struct_from_full_user_array helper")
> Assisted-by:Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   include/linux/iommu.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

