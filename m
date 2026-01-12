Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DB6CF45C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SP51NbIPDZxGQ1VmRH+QeMzj5IuMg1jcaxEvSe/q7hU=; b=g2xw/Yn1PMYVXLtfrNQh+Ch0RK
	aJsmTlPWQk56n3rRBtNVkSRi4xtVSo8/OHnkJWx5tq2WZhKCeslt/fj2G9gIjDqDbdSzmN8k9gAIf
	p1wFlBO/oRmbflWGAMNVi+wMNKSz3KlaOj+wyFldt8CXBPBragUyUsbQq4+3R8geuLBXWyQVEMDcq
	CwQQPJKtsavmpmiobLHyRa0iqpYRD7aH4iL8Gp2yB4supxKpfjA3OVbM1jbrhzT9dsFXQolkSsvPZ
	NlZE2wDBKk3zbkKsciDFReyF7+5sMbiW71JT0Bnbk1XmBdzOe0xc5w6EY/qL4qnPu/FoOc8bazWTk
	cyOOOXeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNnW-000000065gD-47Zb;
	Mon, 12 Jan 2026 19:41:54 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNnU-000000065fA-2L2M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 19:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768246913; x=1799782913;
  h=date:from:to:cc:subject:message-id;
  bh=rT6T0bkcIXQ9ofMUuZngxANHtgIWlBk0EsjmnuIqoeI=;
  b=WUphFIf3OM9vKwggh5r7Fe5DbNtyblb6S7UGWUgQ9CKUyC83YYMs89p+
   kNjTKah8eITkh+Dg05V4ZNOMhsDbxuUdloNkHjUVCFBFLy0pNgcmZp4G4
   pWZ5xiQoVxZDNpjrUuohRvmizqbn4auzXjJcRJ45F9Cm/GO/V6Y7+FniU
   OctQEbbKJc9ybqh/e7uyHWC4i/oIDuVVUOSEC056ooWVvBFZKPF6t1R++
   P6uL77w0GgO9zL3l7R1GpmT4RfGi13vQHuEfu45fXnYG4hmwCwvk7n21K
   35EmkX2Zjs4nievVj1iCPfAbk2CddgcDyqHWUb9MKHtz9KvyqG0dgamSf
   g==;
X-CSE-ConnectionGUID: EqjtiMR+R9G4to+1u5X8wQ==
X-CSE-MsgGUID: aPEMHDVTRESCQZofNFTUrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69685318"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69685318"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:41:52 -0800
X-CSE-ConnectionGUID: P0i7RMoiTQezg84zCjf8Kw==
X-CSE-MsgGUID: MED8mPRyT4CskEPPtf+3GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="203382602"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 11:41:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfNnQ-00000000Dny-0X0g;
	Mon, 12 Jan 2026 19:41:48 +0000
Date: Tue, 13 Jan 2026 03:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:renesas/dt] BUILD SUCCESS
 aca3bbde0fdb263081b5ff1e60f066704dd1a19e
Message-ID: <202601130347.628JLcyL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_114152_634966_FAE6A8D8 
X-CRM114-Status: UNSURE (   5.78  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git renesas/dt
branch HEAD: aca3bbde0fdb263081b5ff1e60f066704dd1a19e  arm64: dts: renesas: r8a779h0: Add WWDT nodes

elapsed time: 10408m

configs tested: 10
configs skipped: 74

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc        allmodconfig    gcc-15.2.0
arc        allyesconfig    gcc-15.2.0
arm         allnoconfig    clang-22
arm        allyesconfig    gcc-15.2.0
arm64      allmodconfig    clang-19
arm64       allnoconfig    gcc-15.1.0
loongarch  allmodconfig    clang-19
m68k       allyesconfig    gcc-15.2.0
riscv      allmodconfig    clang-22
riscv      allyesconfig    clang-16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

