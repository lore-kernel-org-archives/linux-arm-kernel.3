Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87EAF013C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 07:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Oephghwq9E7iX0JcFh8bMvfmpUnuqSKp8mPOpSkaEY=; b=YHWIOWUcbnPt8pOg1wFHQOygjc
	1O3RvlhpH++aAs21ZfxY2jrF/GCv971AIsAsEUo7jeB8j1B3f/4NEU0QhKKLE3JTLLT3IUydZwh5M
	2z1CMcqBVUBN/OJ/JhnV31n4wEtrCTM/jyyWrJ2hpYYpcheuh0Uf5uJcSsjYA/IRW/ywoPCDlYVK/
	jr6rgGi+gKkOcfHG4i53LE778of9v33VK2e8BcF941Xh0UPHu9neEQbw2/8YkDqV+yK4JHhIlhBfu
	RIMSZHPvD04teryD9B6E6kNkHz/I0lXcLRD2z1Bz1jhHypV0AFuGDPWguwLggUG18i4UB8f6ld8Nd
	wYru0iaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22ln-00000003VPm-2p04;
	Mon, 16 Mar 2026 07:53:47 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22lj-00000003VPO-36Co
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 07:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773647624; x=1805183624;
  h=date:from:to:cc:subject:message-id;
  bh=y/4d5usaA3EeG2u9gjFkk2k7gdE5edsoIbqma4MPBPk=;
  b=d4qWdYZTnFkB+Cfw3RFUELC70ofUNgsPMQWoltYCdP90ly7jwnZxOCk1
   z9RZOIeQfBO4voKaGT/Pq7TytIS2deK1z/bLvzglgRbt8qsE74ahTs6qX
   Vwd/Nxx9Ce4wPGeEn8XB7wEfO1zAcfV3D0DYuQW3lg2Wkg2lqB3fJsvUH
   Xul7mXHrCowsmzXRJOuGifC/ZIqSibGhVY6JCq3fF2+xLX5vQZ7S4LGhG
   jmSjx0MlZGoPS/adAv7pUrvUdULRvfj+w9MIFn3v/cpMEJq1t5uIeZ9ek
   hRE/A9H/urKNW5a2NmgJpWpzLNTsvZAyXpRlixOF4c1j7jbNEfsv3YD3z
   w==;
X-CSE-ConnectionGUID: g0hakPdiSEKCMgERy+1WsA==
X-CSE-MsgGUID: VfT9AiuYRLSoI5daNtbkOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="97266879"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="97266879"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 00:53:41 -0700
X-CSE-ConnectionGUID: KRnClxGLSf2yo6v8E5xFOg==
X-CSE-MsgGUID: r5YyISiYSm2alu9OjfmfgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="222039683"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 00:53:39 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w22lc-000000000Jq-0DEi;
	Mon, 16 Mar 2026 07:53:36 +0000
Date: Mon, 16 Mar 2026 15:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 bb57e36b0a30d9fa479ef65370b01493981cb033
Message-ID: <202603161534.QoaKLtby-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_005343_848212_6C022A4C 
X-CRM114-Status: UNSURE (   4.83  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/defconfig
branch HEAD: bb57e36b0a30d9fa479ef65370b01493981cb033  Merge tag 'renesas-arm-defconfig-for-v7.1-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig

elapsed time: 757m

configs tested: 5
configs skipped: 150

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc    allmodconfig    gcc-15.2.0
arm     allnoconfig    clang-23
arm    allyesconfig    gcc-15.2.0
m68k   allyesconfig    gcc-15.2.0
riscv  allyesconfig    clang-16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

