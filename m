Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83000C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 01:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oxxSh/b6iFyFOVVRMKsNxubSfJmD92NC7ocDGNZUv4=; b=POdEYSv3uwk//DXzwcPk+hRznI
	4ZrJ8SIdP6n2MFkL+11fZ8SE29NowPIT8oCZyhoKdf9L528RUQYIcaReZQy+xTa+WK9TuOuzmSSL2
	YaUyo822kNvEZGpVcbfVOl6Msq9nTvHtUADZNBCZ0Q9SlRAN68aW06BfEq/MTeAqVTnidT8BNlBWF
	2gw2osauMpjyJg/BCPGljQYLITancWh2Ofi3criUfRj/AkpBlzBWKDzrFruSgV409uFAx6qdMzR49
	46/QeGLNqnuCIjnIBMzweN7gEDqW3sn/p1FWlxMhsr6RsgYuw8YK5oESw2J3Oio+NZ++uzvQWjl2m
	DuyCHzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udfKh-0000000FvQ5-3jCw;
	Mon, 21 Jul 2025 01:28:47 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udfIG-0000000FvK4-3Wb1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 01:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753061177; x=1784597177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pvhRCHGIucYdujSap+8QzPuzACWS4wsHi36ZbyRIfzU=;
  b=M46I+PSOBL/MqgHhmUBcV496KG4+8xnNOLygDvVqnzNuFddfpUz4yQEP
   /nM41GlPe7JNHIHpKKsnkihr/oJkG0B+DTEIgBBprvBFzM1zMTp+ppruP
   BXaSIGf4h/knBmRy1DfqYS+FBny70JTVIVfbipEKwAXeaQ245dmJ3YsIF
   K05LMFyAzumoodR+n+pj/FnM0vCgSP+MXQjLlqH1nMuh+TDdeJDupMcBC
   TXlGR53YGhnay+StexCR+KfcIsRz6U4b64FhDrMYKXa2C0f2B9Ql02XXd
   KISeMqS1VhIflDFrCfMXFz2YNf1qNwfQxMyrCUX30PiWbfNOF7cWTzGwZ
   w==;
X-CSE-ConnectionGUID: wjM9LpWVRjeubw1Rmx6CQw==
X-CSE-MsgGUID: DqYTc7b8T9WPQbPAXT/xgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="72838320"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="72838320"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 18:26:16 -0700
X-CSE-ConnectionGUID: yx9QBkAFRLO48bxGjUoV0A==
X-CSE-MsgGUID: cBbe1sc/RRGUKZYvF5ur8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="162920814"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jul 2025 18:26:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udfIA-000GOD-0D;
	Mon, 21 Jul 2025 01:26:10 +0000
Date: Mon, 21 Jul 2025 09:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>, bpf@vger.kernel.org,
	Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maxwell Bland <mbland@motorola.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH bpf-next v11 2/3] cfi: Move BPF CFI types and helpers to
 generic code
Message-ID: <202507210919.wPRFLcKb-lkp@intel.com>
References: <20250718223345.1075521-7-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718223345.1075521-7-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_182616_921691_571D2819 
X-CRM114-Status: UNSURE (   9.76  )
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

Hi Sami,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0ee30d937c147fc14c4b49535181d437cd2fde7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Sami-Tolvanen/cfi-add-C-CFI-type-macro/20250719-063535
base:   0ee30d937c147fc14c4b49535181d437cd2fde7a
patch link:    https://lore.kernel.org/r/20250718223345.1075521-7-samitolvanen%40google.com
patch subject: [PATCH bpf-next v11 2/3] cfi: Move BPF CFI types and helpers to generic code
config: arm-randconfig-r072-20250721 (https://download.01.org/0day-ci/archive/20250721/202507210919.wPRFLcKb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507210919.wPRFLcKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507210919.wPRFLcKb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <inline asm>:2:41: error: expected '%<type>' or "<type>"
       2 |         .pushsection    .data..ro_after_init,"aw",@progbits     
         |                                                   ^
>> <inline asm>:3:21: error: expected STT_<TYPE_IN_UPPER_CASE>, '#<type>', '%<type>' or "<type>"
       3 |         .type   cfi_bpf_hash,@object                            
         |                              ^
>> <inline asm>:9:19: error: .popsection without corresponding .pushsection
       9 |         .popsection                                             
         |                                                                 ^
   <inline asm>:10:41: error: expected '%<type>' or "<type>"
      10 |         .pushsection    .data..ro_after_init,"aw",@progbits     
         |                                                   ^
   <inline asm>:11:29: error: expected STT_<TYPE_IN_UPPER_CASE>, '#<type>', '%<type>' or "<type>"
      11 |         .type   cfi_bpf_subprog_hash,@object                            
         |                                      ^
   <inline asm>:17:19: error: .popsection without corresponding .pushsection
      17 |         .popsection                                             
         |                                                                 ^
   6 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

