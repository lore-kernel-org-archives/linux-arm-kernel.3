Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4164C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GTh2B548YtV3iOTm6z7l871jTon2EXLZfnCkT3m4WE=; b=18pglRhJvyKkxZ2XnrjtdI7mEN
	QpsMR7uaPdjH0BtWg9LbJXqU3ec38V9rc5LlcGt1TucYa1OrJoA1zqfh3xqE0v8TqiWNvsEEylX0H
	ffbAG+0oAiex8vBXik9B8AAbWFBtOirGvptlm43qEEbUXE9FTLofq9Nj36kqB+iaT9c5W83ARMEV1
	n+azyk3ZliUobZejtyWsxN7FB/dWA55pWNuJBpe/rr0sZtlXmKQp1wvcmHfdOUWLFFgXqUZFYi0Z6
	5K8XalwMefXXREmw8VovGqefc5X0yjQiiWrnEMuh81B2YlMUBd1Vcyf97H9o6FNfVEa8lBYVhw71w
	pqCSe+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wZg-000000036p4-1hnp;
	Sun, 27 Apr 2025 07:37:16 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wPH-00000003607-34zv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745738792; x=1777274792;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Jmn+u6fFBrsun9XakIeVgT39XGKP2ToxwISS/MEt76w=;
  b=X8DcoVLE7u3nnal/UNhTO8d8Mx6ex9StnyhzpxiQKircaY0k8WzAdlAp
   Em6WjuaqR64DipQb3LSE4Jf4IessRNta6wH4fCMgkLJEdJghCF0+ABfv1
   fjNJTGp5hoK93OmcDYeSHRl6dIEc4vunaDwL5wAtMISUS8IUEp/woXO1s
   GJ2BTN8dnD2F+lmp0Or32ciU7J7rjfmMLznW9IDgvEcQlqrci+Cl0Ik0o
   FdqmV2bBL4kdnLJipOZucaL6l2OwDBkNjybKf+7He4eTRCE9JteWvgu5+
   ieCbhw4kgw3XidiJ40+etK3he6ChpkoexQVUuJjmNcdCQn9uivSy3o4Za
   g==;
X-CSE-ConnectionGUID: bGajbAW2QMCPntisAQR2EQ==
X-CSE-MsgGUID: onJOJsOrQVSqm1lxfJV3Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="58710633"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="58710633"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 00:26:28 -0700
X-CSE-ConnectionGUID: tjr0bvpUSgWfm/XawVYnrA==
X-CSE-MsgGUID: OXjYL/GnT9ykpQQNpcmQ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="164217471"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 00:26:22 -0700
Message-ID: <376566b4-6c13-45ad-b1e5-8cfe2de437bc@linux.intel.com>
Date: Sun, 27 Apr 2025 15:22:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/22] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
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
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_002631_843568_988296A0 
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

On 4/26/25 13:58, Nicolin Chen wrote:
> The new vCMDQ object will be added for HW to access the guest memory for a
> HW-accelerated virtualization feature. It needs to ensure the guest memory
> pages are pinned when HW accesses them and they are contiguous in physical
> address space.
> 
> This is very like the existing iommufd_access_pin_pages() that outputs the
> pinned page list for the caller to test its contiguity.
> 
> Move those code from iommufd_access_pin/unpin_pages() and related function
> for a pair of iopt helpers that can be shared with the vCMDQ allocator. As
> the vCMDQ allocator will be a user-space triggered ioctl function, WARN_ON
> would not be a good fit in the new iopt_unpin_pages(), thus change them to
> use WARN_ON_ONCE instead.

I'm uncertain, but perhaps pr_warn_ratelimited() would be a better
alternative to WARN_ON() here? WARN_ON_ONCE() generates warning messages
with kernel call traces in the kernel messages, which might lead users
to believe that something serious has happened in the kernel.

> 
> Rename check_area_prot() to align with the existing iopt_area helpers, and
> inline it to the header since iommufd_access_rw() still uses it.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommufd/io_pagetable.h    |   8 ++
>   drivers/iommu/iommufd/iommufd_private.h |   6 ++
>   drivers/iommu/iommufd/device.c          | 117 ++----------------------
>   drivers/iommu/iommufd/io_pagetable.c    |  95 +++++++++++++++++++
>   4 files changed, 117 insertions(+), 109 deletions(-)

Thanks,
baolu

