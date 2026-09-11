Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB245C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9+xDPg3hQTrCNXef47GSrLFbYDgWPRObQW1j0a5yd98=; b=xwudEyjxADRnwBz+0J4Uw/HphV
	kq65tS9CcYGJZfkdTg00NfdykRjQDPW4zxdXHvClD3VK3EwpjAqnsvJ9caMktwaL99CSwba6zN+ub
	+PE6sLay8Ay3ujkTvcUzBhr24XHcIAyH+WHJto8gvOrXiJmLw278p6+Lr9ZilhmZmqYbXsqz22EXW
	txDVL12LUDru/ZAr+r5KmoNS/p9DfhIaruhj5DAuZYzg5I+dkphpKHbsUMQgCiBclxDFTgZ/azr8+
	5CWjeAPBH4LbmdRLo+I3MsJUHCEYpHVAW9np1xBbI+T89Y0X8U2DiKk7oo4jPVknJYmjjJUWBpEJk
	MThFNLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yJ0-0000000GLYC-0unB;
	Fri, 11 Sep 2026 10:16:26 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yIu-0000000GLWP-0Xyn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789121780; x=1820657780;
  h=date:from:to:cc:subject:message-id;
  bh=D2HIUrCM1y5sGVsZbdzlqKKxYw2tuiYC5NlCXo3Voa8=;
  b=g39CTUvr655KD7uBq+T5qOH+LRvtD0RrAPlTZUUZL+h9ufey6/9FSdFh
   CHsweHFQACSAG9T5S19yDrfR+s64sPsSNXC6yRwPPjpWqQbHiImWnrQnW
   bWmNVLVL07eVYL21l1rffwB0mLSQRRUrREPD+j1i++XLXxJHkw8zZEBgc
   rBZvkYa6KHrhW2r0qt/orPGQDy8Q8wgpO3CUMcA4NqY8GllcaFa0Q6I1j
   +zt7WwYnAwjNkP2UTCqcHihWo/dAbO3K8GTSUFYQtS7TCoj8wNtvrpsPz
   SO1o5Sv+uTtLlvBxqoalNImUAoCREQGVdGLpEHBP8ruqS4RShygEinFdq
   g==;
X-CSE-ConnectionGUID: YCO6uw9+ReeO8WJ3ZtT6mw==
X-CSE-MsgGUID: Tv5YHt1NSXmGvcNYdDvKng==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89597618"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89597618"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:16:19 -0700
X-CSE-ConnectionGUID: 3s21/ou9SKWp+4SUBd+bQQ==
X-CSE-MsgGUID: Bp9Ak6T8SISpctf2Cj331g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="271404707"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Sep 2026 03:16:18 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4yIp-000000000lP-1jlS;
	Fri, 11 Sep 2026 10:16:15 +0000
Date: Fri, 11 Sep 2026 12:16:09 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, linux-doc@vger.kernel.org
Subject: [soc:board-remove-7.3 153/295] htmldocs:
 Documentation/misc-devices/index.rst:10: WARNING: toctree contains reference
 to nonexisting document 'misc-devices/bh1770glc' [toc.not_readable]
Message-ID: <202609111253.53f6MIiP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031620_227641_C6C69392 
X-CRM114-Status: UNSURE (   8.38  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   cf983087c51a9c74c3d4d3b353eb811ae5030823
commit: 304ea826442c57ebfe81ff33cbf9f1071f044d15 [153/295] misc: remove unused bh1770glc driver
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260911/202609111253.53f6MIiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111253.53f6MIiP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/misc-devices/index.rst:10: WARNING: toctree contains reference to nonexisting document 'misc-devices/bh1770glc' [toc.not_readable]
   Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.


vim +10 Documentation/misc-devices/index.rst

5591a3075e956a Randy Dunlap 2019-01-13   9  
5591a3075e956a Randy Dunlap 2019-01-13 @10  .. toctree::

:::::: The code at line 10 was first introduced by commit
:::::: 5591a3075e956af501430bdf2b3516a69f4fe65d Documentation: add ibmvmc to toctree(index) and fix warnings

:::::: TO: Randy Dunlap <rdunlap@infradead.org>
:::::: CC: Jonathan Corbet <corbet@lwn.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

