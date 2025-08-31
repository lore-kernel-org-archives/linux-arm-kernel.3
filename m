Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492D1CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlTrT8N/8QrvwfonXm3IyAKAHRQ9/e6rOitYE9NgwIo=; b=X70Q2YOqK7OJHAujVp9yFba0E9
	jPH8aAVi8B/ySl8cEoLvBlUpG9i58P74odRvsFnac2AZC2kZ8ZEgFYXkSZQv2ZK8cZ+VTl0D5F28p
	/LuPC99gJ8ZFjzD7qzlTjzyAeILL+/UhERgDmQ/LrrUz9ClMdXNA/XffQgOxFoHS/v88ZAbqKBBv0
	5tw0kvAhR0kdFfIgHYO3YnMuOSrZ0nAhKho3IzHTIiKv6eJAssJuMvKp4f8LAjLHYkIvlsfyYCaW7
	wK956g6i7N5ZmNccnfU8Adbu3awQGFy6iRURVRiylZiJiuFEbhDlMaMfQdJuMT8OxNqk+aY2tK3h1
	OMRiPLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfKc-0000000A33r-1n7u;
	Sun, 31 Aug 2025 10:30:42 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfHt-0000000A2t9-45Xc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 10:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756636074; x=1788172074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G3VUUUy+Z0eEDLbmnC2uWZmW+NftXH+FJS/0FINvCZo=;
  b=IkywPRkm7AZUd0/KKDKEQueyQ8fcJqFyRX7c66tjSI/4v8uz8vyQrZje
   JPyX7HfIxvG95tNJKvgeZrsz+nzARLjzSD5UGyyLHiXG0e43AoWKzZ29Q
   Xw+26X+1evqXaFsTfZj3OobP704sjqrUPkswBTvYdKMt6WF0AeBrcI0jm
   yRlf9MeP5w4hzyjvy4Fzab/csxNf5fQgzmDdXsvb4r3kKt/4FG9JV5Gga
   p3skKWCZpZt3PBdxgS5x53sGVrJfMtgV6L9wCNHzpUyDG+igW1T1LCWZP
   8zOK/nlaSpWYSREPNpYWiag5/4knWDLyQB5y4KaZHYZ3rzGJqOdZp9n3s
   Q==;
X-CSE-ConnectionGUID: ZtW4zwdlTIqpsxHty9i1hQ==
X-CSE-MsgGUID: pUFREyjhTn6MK8Zyn9RX4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="46429008"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="46429008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 03:27:46 -0700
X-CSE-ConnectionGUID: XAOUGNalRseEqI7XAhA2rA==
X-CSE-MsgGUID: t8fpDd0QR+6w+3bfnX9N/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="169989735"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 31 Aug 2025 03:27:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usfH3-000W4p-1J;
	Sun, 31 Aug 2025 10:27:07 +0000
Date: Sun, 31 Aug 2025 18:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Roy, Patrick" <roypat@amazon.co.uk>,
	"david@redhat.com" <david@redhat.com>,
	"seanjc@google.com" <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, "Roy, Patrick" <roypat@amazon.co.uk>,
	"tabba@google.com" <tabba@google.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"will@kernel.org" <will@kernel.org>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"Cali, Marco" <xmarcalx@amazon.co.uk>,
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
	"Thomson, Jack" <jackabt@amazon.co.uk>,
	"Manwaring, Derek" <derekmn@amazon.com>
Subject: Re: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
Message-ID: <202508311805.yfcdeaFC-lkp@intel.com>
References: <20250828093902.2719-4-roypat@amazon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828093902.2719-4-roypat@amazon.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_032754_025064_75EDE45A 
X-CRM114-Status: UNSURE (   9.71  )
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

Hi Patrick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a6ad54137af92535cfe32e19e5f3bc1bb7dbd383]

url:    https://github.com/intel-lab-lkp/linux/commits/Roy-Patrick/filemap-Pass-address_space-mapping-to-free_folio/20250828-174202
base:   a6ad54137af92535cfe32e19e5f3bc1bb7dbd383
patch link:    https://lore.kernel.org/r/20250828093902.2719-4-roypat%40amazon.co.uk
patch subject: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
config: loongarch-randconfig-r133-20250831 (https://download.01.org/0day-ci/archive/20250831/202508311805.yfcdeaFC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508311805.yfcdeaFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508311805.yfcdeaFC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/secretmem.c:155:39: sparse: sparse: symbol 'secretmem_aops' was not declared. Should it be static?

vim +/secretmem_aops +155 mm/secretmem.c

1507f51255c9ff Mike Rapoport           2021-07-07  154  
1507f51255c9ff Mike Rapoport           2021-07-07 @155  const struct address_space_operations secretmem_aops = {
46de8b979492e1 Matthew Wilcox (Oracle  2022-02-09  156) 	.dirty_folio	= noop_dirty_folio,
6612ed24a24273 Matthew Wilcox (Oracle  2022-05-02  157) 	.free_folio	= secretmem_free_folio,
5409548df3876a Matthew Wilcox (Oracle  2022-06-06  158) 	.migrate_folio	= secretmem_migrate_folio,
1507f51255c9ff Mike Rapoport           2021-07-07  159  };
1507f51255c9ff Mike Rapoport           2021-07-07  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

