Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6866C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 00:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mUHQtVdl40ZcHIRKRV4jjJInleJoaj+QldqrxToNtYI=; b=qkL7Yr4j1bZhWuaAJhrCXAROT4
	aRHcibDMEQCZesC8Vz3I6lBq27Qp8mKnccTrkZKvl1fSBrJWXxXOeBjKi3CE5TcXIERpYj6fvcNO+
	mH57kCjWntHtZOnBd1bogNOAa4GSjM6dHMAvkz47uMkt12SWLwqLXR3NDClo7EKWjQVZnRbOrD2MY
	SGrm4bv9v0Qquuv8o4pkFWDMPwChrxAGZ8kgdx6I00BPhfBEt2PRlng7GiKEAPFrKnVRM6+GcMMvo
	PPW20JpH5cqUOC7L9tXEfMMYlk3B/BAY49qmCU8GpSuQPyDwJUV2QqVAZIPFtlqSBJld22uXyiv3E
	pnaAv64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvOoP-00000004Lbc-2Lw7;
	Sun, 16 Aug 2026 00:33:17 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvOoM-00000004Law-0jGc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 00:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786840394; x=1818376394;
  h=date:from:to:cc:subject:message-id;
  bh=Z5Byhi44E3WWGiZWilb2Y+392Xtgjqt1EbKQ2st+aHk=;
  b=YcWDE7FRh6e5pzFfw6kDR553qeX9eG+uTS/4NkjzcGI6GrM4HbpQyuLV
   qXb9pkRO4x2NlcPJQB3fYTxFFP17mgXJMOC0tIiBDh7X9DkAKWmi/5O32
   5Cy8PmBj/oVFSxYO1ZEgqTu826pCFEvCmeauHKqeThJ6VPBj4nj9I6nWe
   DlAFN0ythJLzSTBYAkGaxMPEZ+xaVgMFEHDOMs6qTsGOD9Gy8Ed7UR/XL
   JpZS7pajl317g2Eo4YsTmE/AsYlElAiiccTkwqewJdV04aNuk3Ptie2uV
   D6/7rUO6QZSNZPyF3hlrNA+SpWT3DG1Q7+7POrjq/4OPTcTDxkRtJ2qHK
   g==;
X-CSE-ConnectionGUID: zuZSP2p9TKyTCXkecEmS8A==
X-CSE-MsgGUID: X1/MJDWER1uvCsn6G88pZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="112911247"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="112911247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 17:33:10 -0700
X-CSE-ConnectionGUID: Z7EfkAxcT6yRiXMDae3iQA==
X-CSE-MsgGUID: VB374oFTTSCrKFd8ai049Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="262789437"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Aug 2026 17:33:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvOoE-00000000cZw-0VL5;
	Sun, 16 Aug 2026 00:33:06 +0000
Date: Sun, 16 Aug 2026 08:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, linux-doc@vger.kernel.org
Subject: [soc:board-remove 135/217] Warning:
 drivers/regulator/lp8755.c:49 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202608160822.uRsChfKC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_173314_252511_ABF92BB5 
X-CRM114-Status: UNSURE (   9.01  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 467cf72c21854e4de62212c55dbed871ea134d9d [135/217] regulator: lp8755: remove platform data based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608160822.uRsChfKC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160822.uRsChfKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160822.uRsChfKC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/regulator/lp8755.c:49 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * multiphase configuration options
>> Warning: drivers/regulator/lp8755.c:72 struct member 'mphase' not described in 'lp8755_platform_data'
>> Warning: drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description in 'lp8755_platform_data'
>> Warning: drivers/regulator/lp8755.c:72 struct member 'mphase' not described in 'lp8755_platform_data'
>> Warning: drivers/regulator/lp8755.c:72 Excess struct member 'mphase_type' description in 'lp8755_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

