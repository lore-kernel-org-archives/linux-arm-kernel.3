Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87814E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 22:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCtQKiy0me5kc7bJj6K8HmU5ESpCzhRnxpcJPe/XrIc=; b=MHnUOAeuS9zSYe8WqDQAOvi35K
	U8JXuQiLJNP8cM4A0EOeYRSE4yM7Mql2dUZpwYYITUDRY3pMvGenYk6/Xz2CDbnbc81mpxzC8KjqD
	TAQLAM8TqaxuPAPb1xKbSQXAviVIx+BpIKOXUKu8gsnYOXiDdUNm9jYrwQXrRO3Qw45MtLbGM6+v7
	Z2QA9buPlEh27J59Uevp3Ig013sszPeaHNHCd+gryRvMOfYFBhPGYAlYDLA6KImz5tapNmOw9O57p
	vMleq7UwWfTWfvjvGQCBBqco1fe49GW1LIMehn7drd8Uj8y0AJf46LAy1OgulAm+mlV27ktf73Rd3
	sss/569Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMawJ-000000074fJ-2h0V;
	Sat, 14 Dec 2024 22:48:47 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMavE-000000074WU-2vOm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 22:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734216461; x=1765752461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AKxRtbsHNV4cXXEwh68zgfEHkimry76rewwLYZhrLjc=;
  b=XI4POUVrXz9VA9E5wHXeVL0g8gtv+pHHy1F+4zvS9DBISwKti56dF6ts
   42U+M/kGlDvKvP4nmFzdVDAzwk4Bb1TF5Q83/ISZ/+Enx5Kamez5ualFc
   FPc5+dtzVK8ON9ywWS1L7Zg5DyAm4k/MUDQlwVz+SSCjX7ATSbvhsSuGd
   5FaBX3CGoaLFZbHvsQqqt0DGNQr33TCiWXkpZ96MvbSjohuE8qokFdAaY
   Mjd3u3XBq0i7UsRtPrxQ3UxUgFK9w5PFF/paMqGPEsbIqDG7stoJ/nn1v
   bXSvP5ChbW8UziHhFLUgLrVN1FZdHkTdZk7gc3Us06pUL+nv3DufysK2P
   A==;
X-CSE-ConnectionGUID: VXcwpuT6Q8W5fa4D7JUlWw==
X-CSE-MsgGUID: vnQq0Zy+R8+P84/hRTOHlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45329655"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="45329655"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 14:47:36 -0800
X-CSE-ConnectionGUID: GKJobGtzR7membUQCuxeXw==
X-CSE-MsgGUID: IF8cd/2vSpiSpmThf6WLqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96705256"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Dec 2024 14:47:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMav3-000DIU-13;
	Sat, 14 Dec 2024 22:47:29 +0000
Date: Sun, 15 Dec 2024 06:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: James Houghton <jthoughton@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Yan Zhao <yan.y.zhao@intel.com>,
	James Houghton <jthoughton@google.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>,
	David Matlack <dmatlack@google.com>, Wang@google.com,
	Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v1 10/13] KVM: selftests: Add KVM Userfault mode to
 demand_paging_test
Message-ID: <202412150600.wLk8rmZf-lkp@intel.com>
References: <20241204191349.1730936-11-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204191349.1730936-11-jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_144740_797890_857D18F1 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4d911c7abee56771b0219a9fbf0120d06bdc9c14]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/KVM-Add-KVM_MEM_USERFAULT-memslot-flag-and-bitmap/20241205-032516
base:   4d911c7abee56771b0219a9fbf0120d06bdc9c14
patch link:    https://lore.kernel.org/r/20241204191349.1730936-11-jthoughton%40google.com
patch subject: [PATCH v1 10/13] KVM: selftests: Add KVM Userfault mode to demand_paging_test
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150600.wLk8rmZf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150600.wLk8rmZf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> demand_paging_test.c:220:2: error: address argument to atomic operation must be a pointer to _Atomic type ('unsigned long *' invalid)
     220 |         atomic_fetch_and_explicit(bitmap_chunk,
         |         ^                         ~~~~~~~~~~~~
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdatomic.h:169:35: note: expanded from macro 'atomic_fetch_and_explicit'
     169 | #define atomic_fetch_and_explicit __c11_atomic_fetch_and
         |                                   ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

