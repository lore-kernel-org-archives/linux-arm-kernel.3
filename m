Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECD9CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPtxJCevpAHaHQwMPPN1LpEXZPH8HgyzUKPWp8LfPjg=; b=FbvFOewn+inAoaeOsv4GN/IulX
	yNmmEmLIsxdA4cnb/3ucy551RnMK0xKKyvmUXpKzeKZBclmpfRC8bZai59niYOKLTFlyHAkHNupz5
	+PTwSEECVkizXEq8iupOwLynRyM3sKhOTE61RpPLAjmYB8a9lN3KHs38touj9/iCw+VptGmf/oPju
	zapFllSpmsQ+x1EyyXFz/9p0esanw0sv8TEXTMqNK6pIlBK7NnUGMw54vZEi+WzFiSQj0yvulHaVj
	ZkfvpvZsAp8ylBCOe/n2voTNPq1bcjGKFQqEU9oEktfbYeJmgjhY/tk73GVFeoo7hoHOO8NZ4zl9T
	yV+KfeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Tb-00000006jka-30wa;
	Wed, 10 Jun 2026 03:19:35 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9TY-00000006jkF-3fiv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781061573; x=1812597573;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=exbgEJQ4JpJtyxg7lcrIa73JtRy+9hzGS5/TT2IIOho=;
  b=V3aphE39pD8fugyS0zQH8uH+iG4KoP4j/ww8MEbYbye4wmpvQVdpuq7I
   u/KKM43pNmeuFE3/C8lN4Ha9CkkQMp0M2LpptJRk4JJBXMgrAu30XzJCY
   95BhJlT0mOwvq7T7fucEwg4YxTI39stMTlQxuZdA+lB17+BLEFzyAyajs
   kKnCUWTRyJWj5/l7/FqWX5hwWZpSm0wFp3Z37avWB1u8H2+hCuR48+j1Q
   TjSuMzpbIjzcZxQ8hy1BsIw48/6qLBrR+9rI0O4f++TqAQVMD26qXqkLN
   0+nWyx3Fp2PZwL9kJ9HXMIhg9dh9kpqquB0lvP9JV+NYRmnnuyyEun6yy
   g==;
X-CSE-ConnectionGUID: 88qyx4voSDyEP0Ds3yzGwA==
X-CSE-MsgGUID: 2+OvS5MQRrCg7SsBIHBHsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84413801"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="84413801"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:19:32 -0700
X-CSE-ConnectionGUID: L1aE+6sZQB6LuwYQrTII0w==
X-CSE-MsgGUID: xeqaVAr7RL6fBGnnmy0o4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="249967784"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:19:28 -0700
Message-ID: <afbaa5d0-a23f-47df-a56d-dcef98ecf6db@linux.intel.com>
Date: Wed, 10 Jun 2026 11:18:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] iommufd/selftest: Add invalidation entry_num and
 entry_len boundary tests
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Shuah Khan <shuah@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Kees Cook <kees@kernel.org>, Yi Liu <yi.l.liu@intel.com>,
 Eric Auger <eric.auger@redhat.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1780521606.git.nicolinc@nvidia.com>
 <9ae78ed8e64afbb2f2df27d03466380061adf7d9.1780521606.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <9ae78ed8e64afbb2f2df27d03466380061adf7d9.1780521606.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_201932_928373_2B3641C4 
X-CRM114-Status: UNSURE (   7.22  )
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

On 6/4/26 05:26, Nicolin Chen wrote:
> Test that the cache invalidation ioctl rejects an oversized entry_len and
> an oversized entry_num, covering the CPU soft-lockup paths the caps close.
> 
> Assisted-by:Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   tools/testing/selftests/iommu/iommufd.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

